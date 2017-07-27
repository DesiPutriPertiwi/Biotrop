<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Invasive;

class InvasiveController extends Controller
{
       /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/invasive';

         /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $speciment_ias = Invasive::paginate(5);

        return view('invasive/index', ['speciment_ias' => $speciment_ias]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('invasive/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validateInput($request);
         Invasive::create([
                  // -> join ('species', 'species_id', '=', 'id_species')
                  // -> join('genus', 'genus_id', '=', 'id_genus')
                  // -> join('family', 'family_id', '=', 'id_family')
                  // -> select('speciment_ias.*', 'species_id')
                  // -> get("name_family"); => $request['family'],
            'name_family' => $request ['family'],
            'name_genus' => $request ['genus'],
            'name_species' => $request ['species'],
            'species_synonim' => $request ['synonim'],
            'common_name' => $request ['common_name'],
            'origin_species' => $request ['origin'],
            'habitat' => $request ['indvaded_habitat'],
            'description_species' => $request ['description'],
            'distribution_specimen' => $request ['distribution'],
            'ecology' => $request ['ecology'],
            'chemical_ctrl'=> $request ['chemical_ctrl'],
            'manual_ctrl' => $request ['manual_ctrl'],
            'biologycal_ctrl' => $request ['biological_ctrl'],
            'prevention' => $request ['prevention'],
            'utilzation' => $request ['utilization'],
            'risk_analisis' => $request ['risk_analisis'],
            'contact_person' => $request ['contact']
        ]);
        return redirect()->intended('/invasive');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        // Redirect to user list if updating user wasn't existed
        if ($user == null || count($user) == 0) {
            return redirect()->intended('/invasive-management');
        }

        return view('invasive/edit', ['user' => $user]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $constraints = [
            'username' => 'required|max:20',
            'firstname'=> 'required|max:60',
            'lastname' => 'required|max:60'
            ];
        $input = [
            'username' => $request['username'],
            'firstname' => $request['firstname'],
            'lastname' => $request['lastname']
        ];
        if ($request['password'] != null && strlen($request['password']) > 0) {
            $constraints['password'] = 'required|min:6|confirmed';
            $input['password'] =  bcrypt($request['password']);
        }
        $this->validate($request, $constraints);
        User::where('id', $id)
            ->update($input);

        return redirect()->intended('/invasive-management');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::where('id', $id)->delete();
         return redirect()->intended('/invasive-management');
    }

    /**
     * Search user from database base on some specific constraints
     *
     * @param  \Illuminate\Http\Request  $request
     *  @return \Illuminate\Http\Response
     */
    public function search(Request $request) {
        $constraints = [
            'username' => $request['username'],
            'firstname' => $request['firstname'],
            'lastname' => $request['lastname'],
            'department' => $request['department']
            ];

       $users = $this->doSearchingQuery($constraints);
       return view('users-mgmt/index', ['users' => $users, 'searchingVals' => $constraints]);
    }

    private function doSearchingQuery($constraints) {
        $query = User::query();
        $fields = array_keys($constraints);
        $index = 0;
        foreach ($constraints as $constraint) {
            if ($constraint != null) {
                $query = $query->where( $fields[$index], 'like', '%'.$constraint.'%');
            }

            $index++;
        }
        return $query->paginate(5);
    }
    private function validateInput($request) {
        $this->validate($request, [
        'username' => 'required|max:20',
        'email' => 'required|email|max:255|unique:users',
        'password' => 'required|min:6|confirmed',
        'firstname' => 'required|max:60',
        'lastname' => 'required|max:60'
    ]);
    }
}
