@extends('invasive.base')
@section('action-content')
    <!-- Main content -->
    <section class="content">
      <div class="box">
        <div class="box-header">
          <div class="row">
            <div class="col-sm-8">
              <h3 class="box-title">List of invasive</h3>
            </div>
            <div class="col-sm-4 text-right">
              <a class="btn btn-primary" href="{{ route('invasive.create') }}">Add new collection</a>
            </div>
          </div>
        </div>

  <!-- /.box-header -->
  <div class="box-body">
      <div class="row">
        <div class="col-sm-6"></div>
        <div class="col-sm-6">
          <form method="POST" action="{{ route('invasive.search') }}">
           {{ csrf_field() }}
           <div class="col-md-4 pull-right">
             <div class="input-group">
               <input type="text" name="search" class="form-control" placeholder="Search...">
                   <span class="input-group-btn">
                     <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                     </button>
                   </span>

             </div>
           </div>
           </form>
         </div>
      </div>


    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
      <div class="row">
        <div class="col-sm-12">
          <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
            <thead>
              <tr role="row">
                <th width="5%" class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Id: activate to sort column descending" aria-sort="ascending">No</th>
                <th width="10%" class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Family: activate to sort column ascending">Family</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Genus: activate to sort column ascending">Genus</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Species: activate to sort column ascending">Species Name</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Synonim: activate to sort column ascending">Synonim</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Common_name: activate to sort column ascending">Common Name</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Origin: activate to sort column ascending">Origin</th>
                <th width="20%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Description: activate to sort column ascending">Description</th>
                <th width= "15" tabindex="0" aria-controls="example2" rowspan="1" colspan="2" aria-label="Action: activate to sort column ascending">Action</th>
              </tr>
            </thead>
            <tbody>
            @foreach ($speciment_ias as $speciment_ias)
                <tr role="row" class="odd">
                  <td class="sorting_1">{{ $speciment_ias->id_ias }}</td>
                  <td>{{ $speciment_ias->family }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->genus }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->species }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->synonim }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->common_name }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->origin }}</td>
                  <td class="hidden-xs">{{ $speciment_ias->description }}</td>
                  <td>
                    <form class="row" method="POST" action="{{ route('invasive.destroy', ['id' => $speciment_ias->id]) }}" onsubmit = "return confirm('Are you sure?')">
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <a href="{{ route('invasive.edit', ['id' => $speciment_ias->id]) }}" class="btn btn-success">
                          <i class="fa fa-eye" aria-hidden="true"></i>
                        </a>
                        <a href="{{ route('invasive.edit', ['id' => $speciment_ias->id]) }}" class="btn btn-warning">
                          <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </a>
                        @if ($user->username != Auth::user()->username)
                         <button type="submit" class="btn btn-danger">
                          <i class="fa fa-trash" aria-hidden="true"></i>
                        </button>
                        @endif
                    </form>
                  </td>
              </tr>
            @endforeach
            </tbody>
            <!-- <tfoot>
              <tr>
                <th width="10%" rowspan="1" colspan="1">User Name</th>
                <th width="20%" rowspan="1" colspan="1">Email</th>
                <th class="hidden-xs" width="20%" rowspan="1" colspan="1">First Name</th>
                <th class="hidden-xs" width="20%" rowspan="1" colspan="1">Last Name</th>
                <th rowspan="1" colspan="2">Action</th>
              </tr>
            </tfoot> -->
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-5">
          <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to {{count($speciment_ias)}} of {{count($speciment_ias)}} entries</div>
        </div>
        <div class="col-sm-7">
          <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
            {{ $speciment_ias->links() }}
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- /.box-body -->
</div>
    </section>
    <!-- /.content -->
  </div>
@endsection
