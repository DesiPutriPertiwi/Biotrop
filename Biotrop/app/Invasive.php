<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invasive extends Model
{
    /**
    * The attributes that aren't mass assignable.
    *
    * @var array
    */
    protected $table = 'speciment_ias';
    protected $guarded = [];
}
