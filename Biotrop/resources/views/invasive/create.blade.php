@extends('invasive.base')

@section('action-content')
<div class="container">
    <div class="row">
      <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">Add new collection</div>
          <div class="panel-body">
            <form class="form-horizontal" role="form" method="POST" action="{{ route('invasive.store') }}">
              {{ csrf_field() }}

              <div class="col-md-6">

                <div class="form-group{{ $errors->has('date') ? ' has-error' : '' }}">
                  <label for="date" class="col-md-3 control-label">Date</label>
                    <div class="col-md-8">
                      <input id="date" type="date" class="form-control" name="date" value="{{ old('date') }}" required autofocus>

                        @if ($errors->has('date'))
                          <span class="help-block">
                            <strong>{{ $errors->first('date') }}</strong>
                          </span>
                        @endif
                  </div>
              </div>

              <div class="form-group{{ $errors->has('family') ? ' has-error' : '' }}">
                  <label for="family" class="col-md-3 control-label">Family</label>

                      <div class="col-md-8">
                          <input id="family" type="text" class="form-control" name="family" value="{{ old('famly') }}" required>

                            @if ($errors->has('family'))
                              <span class="help-block">
                                <strong>{{ $errors->first('family') }}</strong>
                              </span>
                            @endif
                      </div>
                </div>

                <div class="form-group{{ $errors->has('genus') ? ' has-error' : '' }}">
                    <label for="genus" class="col-md-3 control-label">Genus</label>

                      <div class="col-md-8">
                        <input id="genus" type="text" class="form-control" name="genus" value="{{ old('genus') }}" required>

                            @if ($errors->has('genus'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('genus') }}</strong>
                              </span>
                            @endif
                       </div>
                  </div>

                  <div class="form-group{{ $errors->has('species') ? ' has-error' : '' }}">
                    <label for="species" class="col-md-3 control-label">Species</label>
                        <div class="col-md-8">
                            <input id="species" type="text" class="form-control" name="species" required>

                            @if ($errors->has('species'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('species') }}</strong>
                              </span>
                            @endif
                        </div>
                  </div>

                        <div class="form-group{{ $errors->has('synonim') ? ' has-error' : '' }}">
                            <label for="synonim" class="col-md-3 control-label">Synonim</label>

                            <div class="col-md-8">
                                <input id="synonim" type="text" class="form-control" name="synonim" value="{{ old('synonim') }}" required autofocus>

                                @if ($errors->has('synonim'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('synonim') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('common_name') ? ' has-error' : '' }}">
                            <label for="common_name" class="col-md-3 control-label">Common Name</label>

                            <div class="col-md-8">
                                <input id="common_name" type="text" class="form-control" name="common_name" value="{{ old('common_name') }}" required autofocus>

                                @if ($errors->has('common_name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('common_name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('origin') ? ' has-error' : '' }}">
                            <label for="origin" class="col-md-3 control-label">Origin</label>

                            <div class="col-md-8">
                                <input id="origin" type="text" class="form-control" name="origin" value="{{ old('origin') }}" required autofocus>

                                @if ($errors->has('origin'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('origin') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                            <label for="description" class="col-md-3 control-label">Description</label>

                            <div class="col-md-8">
                                <input id="description" type="text" class="form-control" name="dscription" value="{{ old('description') }}" required autofocus>

                                @if ($errors->has('description'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                            <label for="username" class="col-md-3 control-label">Invaded Habitat</label>

                            <div class="col-md-8">
                                <input id="username" type="text" class="form-control" name="username" value="{{ old('username') }}" required autofocus>

                                @if ($errors->has('username'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                            <label for="username" class="col-md-3 control-label">Distribution</label>

                            <div class="col-md-8">
                                <input id="username" type="text" class="form-control" name="username" value="{{ old('username') }}" required autofocus>

                                @if ($errors->has('username'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('username') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ URL::to('upload') }}" method="post" enctype="multipart/form-data">
                             <label for="picture" class="col-md-3 control-label">Select image to upload :</label>
                                  <div class="col-md-8">
                                     <input type="file" name="file" id="file">
                                         <input type="hidden" value="{{ csrf_token() }}" name="_token">
                                  </div>
                                  <div></div>
                                  <div class="col-md-8">
                                    <input type="file" name="file" id="file">
                                    <input type="hidden" value="{{ csrf_token() }}" name="_token">
                                  </div>
                                  <div></div>
                                  <div class="col-md-8">
                                     <input type="file" name="file" id="file">
                                     <input type="hidden" value="{{ csrf_token() }}" name="_token">
                                  </div>
                          </div>
                        </div>
                      <div class="col-md-6">
                        <div class="form-group{{ $errors->has('ecology') ? ' has-error' : '' }}">
                            <label for="ecology" class="col-md-3 control-label">Ecology</label>

                            <div class="col-md-8">
                                <input id="ecology" type="text" class="form-control" name="ecology" value="{{ old('ecology') }}" required autofocus>

                                @if ($errors->has('ecology'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('ecology') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('chemical_ctrl') ? ' has-error' : '' }}">
                            <label for="chemical_ctrl" class="col-md-3 control-label">Chemical Control</label>

                            <div class="col-md-8">
                                <input id="chemical_ctrl" type="text" class="form-control" name="chemical_ctrl" value="{{ old('chemical_ctrl') }}" required autofocus>

                                @if ($errors->has('chemical_ctrl'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('chemical_ctrl') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('manual_ctrl') ? ' has-error' : '' }}">
                            <label for="manual_ctrl" class="col-md-3 control-label">Mechanical/Manual Control</label>

                            <div class="col-md-8">
                                <input id="manual_ctrl" type="text" class="form-control" name="manual_ctrl" value="{{ old('manual_ctrl') }}" required autofocus>

                                @if ($errors->has('manual_ctrl'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('manual_ctrl') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('biological_ctrl') ? ' has-error' : '' }}">
                            <label for="biological_ctrl" class="col-md-3 control-label">Biological Control :</label>

                            <div class="col-md-8">
                                <input id="biological_ctrl" type="text" class="form-control" name="biological_ctrl" value="{{ old('biological_ctrl') }}" required autofocus>

                                @if ($errors->has('biological_ctrl'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('biological_ctrl') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('prevention') ? ' has-error' : '' }}">
                            <label for="preventioin" class="col-md-3 control-label">Prevention :</label>

                            <div class="col-md-8">
                                <input id="prevention" type="text" class="form-control" name="prevention" value="{{ old('prevention') }}" required autofocus>

                                @if ($errors->has('prevention'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('prevention') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('uses') ? ' has-error' : '' }}">
                            <label for="uses" class="col-md-3 control-label">Uses :</label>

                            <div class="col-md-8">
                                <input id="uses" type="text" class="form-control" name="uses" value="{{ old('uses') }}" required autofocus>

                                @if ($errors->has('uses'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('uses') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('risk_analisis') ? ' has-error' : '' }}">
                            <label for="risk_analisis" class="col-md-3 control-label">Risk Analysis :</label>

                            <div class="col-md-8">
                                <input id="risk_analisis" type="text" class="form-control" name="risk_analisis" value="{{ old('risk_analisis') }}" required autofocus>

                                @if ($errors->has('risk_analisis'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('risk_analisis') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('contact') ? ' has-error' : '' }}">
                            <label for="contact" class="col-md-3 control-label">Contact Person :</label>

                            <div class="col-md-8">
                                <input id="contact" type="number" class="form-control" name="contact" value="{{ old('contact') }}" required autofocus>

                                @if ($errors->has('contact'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('contact') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('reference') ? ' has-error' : '' }}">
                            <label for="reference" class="col-md-3 control-label">Reference :</label>

                            <div class="col-md-8">
                                <input id="reference" type="text" class="form-control" name="reference" value="{{ old('reference') }}" required autofocus>

                                @if ($errors->has('reference'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('reference') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 text-right">
                                <button type="submit" class="btn btn-primary">
                                    Create
                                </button>
                            </div>
                      </div>
                    </form>
                </div>
              <div>
        </div>
    </div>
</div>
@endsection
