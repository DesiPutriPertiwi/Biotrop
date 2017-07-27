@extends('invasive.base')

@section('action-content')
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
<div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">Add new collection</div>
            <div class="panel-body">
              <form class="form-horizontal" role="form" method="POST" action="{{ route('invasive.store') }}">
                {{ csrf_field() }}

            <div class="col-md-6">
              <div class="form-group{{ $errors->has('family') ? ' has-error' : '' }}">
                  <label for="family" class="col-md-3 control-label">Family</label>
                      <div class="col-md-8">

                          <input id="family" type="text" placeholder="Enter Family name" class="form-control" name="family" value="{{ old('famly') }}" required>

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

                        <input id="genus" type="text" placeholder="Enter Genus name" class="form-control" name="genus" value="{{ old('genus') }}" required autofocus>

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
                      <i>
                        <input id="species" type="text" placeholder="Enter Species name" class="form-control" name="species" required autofocus>
                      </i>
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
                      <i>
                      <input id="synonim" type="text" class="form-control"  placeholder="Enter Synonim"name="synonim" value="{{ old('synonim') }}" required autofocus>
                    </i>
                            @if ($errors->has('synonim'))
                              <span class="help-block">
                                <strong>{{ $errors->first('synonim') }}</strong>
                              </span>
                            @endif
                    </div>
            </div>
        </div>

        <!-- kolom kanan -->
        <div class="col-md-6">
            <div class="form-group{{ $errors->has('common_name') ? ' has-error' : '' }}">
                <label for="common_name" class="col-md-3 control-label">Common Name</label>
                  <div class="col-md-8">
                    <input id="common_name" type="text" placeholder="Enter common name" class="form-control" name="common_name" value="{{ old('common_name') }}" required autofocus>
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
                      <input id="origin" type="text" placeholder="Enter origin" class="form-control" name="origin" value="{{ old('origin') }}" required autofocus>
                          @if ($errors->has('origin'))
                            <span class="help-block">
                              <strong>{{ $errors->first('origin') }}</strong>
                            </span>
                          @endif
                  </div>
            </div>
            <div class="form-group{{ $errors->has('invaded_habitat') ? ' has-error' : '' }}">
                <label for="invaded_habitat" class="col-md-3 control-label">Invaded Habitat</label>

                <div class="col-md-8">
                    <input id="invaded_habitat" placeholder="Enter invaded habitat" class="form-control" name="invaded_habitat" value="{{ old('invaded_habitat') }}" required autofocus>

                    @if ($errors->has('invaded_habitat'))
                        <span class="help-block">
                            <strong>{{ $errors->first('invaded_habitat') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group{{ URL::to('upload') }}" method="post" enctype="multipart/form-data">
                 <label for="picture" class="col-md-3 control-label">Select image to upload :</label>
                    <!-- Pilih Gambar 1 -->
                      <div class="col-md-8">
                         <input type="file" name="file" id="file">
                             <input type="hidden" value="{{ csrf_token() }}" name="_token">
                      </div>
                        <!-- Pilih Gambar 2 -->
                      <div class="col-md-8">
                          <input type="file" name="file" id="file">
                          <input type="hidden" value="{{ csrf_token() }}" name="_token">
                      </div>
                        <!-- Pilih Gambar 3 -->
                      <div class="col-md-8">
                         <input type="file" name="file" id="file">
                         <input type="hidden" value="{{ csrf_token() }}" name="_token">
                     </div>
            </div>
      </div>


          <div class="form-group {{ $errors->has('description') ? ' has-error' : '' }}">
            <label for="description" class="col-md-3 control-label">Description</label>
              <div class="col-md-8">
                  <textarea id="description"  rows="7" cols="5" oneKeyPress placeholder="Enter description" class="form-control" name="description" value="{{ old('description') }}" required autofocus ></textarea>
                  @if ($errors->has('description'))
                    <span class="help-block">
                      <strong>{{ $errors->first('description') }}</strong>
                    </span>
                  @endif
              </div>
          </div>


                    <div class="form-group{{ $errors->has('distribution') ? ' has-error' : '' }}">
                      <label for="distribution" class="col-md-3 control-label">Distribution</label>

                        <div class="col-md-8">
                          <textarea id="distribution" rows="7" cols="3" oneKeyPressclass placeholder="Enter distribution" class="form-control" name="distribution" value="{{ old('distribution') }}" required autofocus></textarea>

                            @if ($errors->has('distribution'))
                              <span class="help-block">
                                <strong>{{ $errors->first('distribution') }}</strong>
                              </span>
                            @endif
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="ecology" class="col-md-3 control-label">Ecology</label>

                        <div class="col-md-8">
                            <textarea id="ecology" rows="7" cols="5" oneKeyPress placeholder="Enter ecology" class="form-control" name="ecology" value="{{ old('ecology') }}" ></textarea>
                        </div>
                      </div>
                      <div class="form-group">
                          <label for="chemical_ctrl" class="col-md-3 control-label">Chemical Control</label>

                          <div class="col-md-8">
                              <textarea id="chemical_ctrl" rows="7" cols="5" oneKeyPress  placeholder="Enter chemical control"class="form-control" name="chemical_ctrl" value="{{ old('chemical_ctrl') }}" ></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('manual_ctrl') ? ' has-error' : '' }}">
                          <label for="manual_ctrl" class="col-md-3 control-label">Mechanical/Manual Control</label>

                          <div class="col-md-8">
                              <textarea id="manual_ctrl" rows="7" cols="5" oneKeyPress placeholder="Enter manual control" class="form-control" name="manual_ctrl" value="{{ old('manual_ctrl') }}" ></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('biological_ctrl') ? ' has-error' : '' }}">
                          <label for="biological_ctrl" class="col-md-3 control-label">Biological Control :</label>

                          <div class="col-md-8">
                              <textarea id="biological_ctrl" rows="7" cols="5" oneKeyPress placeholder="Enter chemical control" class="form-control" name="biological_ctrl" value="{{ old('biological_ctrl') }}"></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('prevention') ? ' has-error' : '' }}">
                          <label for="preventioin" class="col-md-3 control-label">Prevention :</label>

                          <div class="col-md-8">
                              <textarea id="prevention" rows="7" cols="5" oneKeyPress  placeholder="Enter prevention"class="form-control" name="prevention" value="{{ old('prevention') }}" ></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('utilization') ? ' has-error' : '' }}">
                          <label for="utilization" class="col-md-3 control-label">Uses :</label>

                          <div class="col-md-8">
                              <textarea id="utilization"rows="7" cols="5" oneKeyPress placeholder="Enter uses" class="form-control" name="utilization" value="{{ old('utilization') }}" ></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('risk_analisis') ? ' has-error' : '' }}">
                          <label for="risk_analisis" class="col-md-3 control-label">Risk Analysis :</label>

                          <div class="col-md-8">
                              <textarea id="risk_analisis" rows="7" cols="5" oneKeyPress placeholder="Enter risk analysis" class="form-control" name="risk_analisis" value="{{ old('risk_analisis') }}"></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('contact') ? ' has-error' : '' }}">
                          <label for="contact" class="col-md-3 control-label">Contact Person :</label>

                          <div class="col-md-8">
                              <textarea id="contact" rows="7" cols="5" oneKeyPress placeholder="Enter contact person" class="form-control" name="contact" value="{{ old('contact') }}"></textarea>
                          </div>
                      </div>
                      <div class="form-group{{ $errors->has('reference') ? ' has-error' : '' }}">
                          <label for="reference" class="col-md-3 control-label">Reference :</label>

                          <div class="col-md-8">
                              <textarea id="reference" rows="7" cols="5" placeholder="Enter reference" class="form-control" name="reference"  required autofocus></textarea>

                              @if ($errors->has('reference'))
                                  <span class="help-block">
                                      <strong>{{ $errors->first('reference') }}</strong>
                                  </span>
                              @endif
                          </div>
                      </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary ">
                                    Create
                                </button>
                            </div>
                      </div>
                    </form>
                </div>
              </div>
        </div>
    </div>
</div>
<!-- <script type="textjavascript">
    $('.wysiwyg').ckeditor();
</script>
<script type="text/javascript">
        $(document).ready(function() {
        $('#summernote').summernote(
          height: '300px',                 // set editor height
          minHeight: null,             // set minimum height of editor
          maxHeight: null,             // set maximum height of editordes
          focus: true                  // set focus to editable area after initializing summernote
        )
      });
</script> -->
@endsection
