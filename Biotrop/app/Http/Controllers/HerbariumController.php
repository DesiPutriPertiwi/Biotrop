<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facedes\DB;
use App\Herbarium;

class HerbariumController extends Controller
{
    public function indexWeed()
    {
        return view('herbarium/index');
    }

    public function indexForest()
    {
        return view('');
    }    
}
