Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA9390CA7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265778; cv=none; b=leTS8RAWqJ0xKbpC1tRTZoirL1WGw14G9Go59lzkLjzrMZskAxbRuTZlqy3TYbIEwNlFNd0T9xiV9/d1346WqwpaJKB8honFVM7gR3GSQSywsaMvE2UvdOtsyGNlnG6pT/lQVwKSvRTA099q6SNtv2oGFbU18/hb3ReyQiSOMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265778; c=relaxed/simple;
	bh=H1TCB6pgxK69XHkiDK+lyZ/sLnPn9seuN4WF/0M5FCU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMMnnRZGt46HTfPDtAAp539hP2QoZHUwuRQmc4A6SGEGaqriF2wWHpcnTROWG5f4rDTUp+5XgZnhT5cXLNnLPb7nOyjhV82cTZhA4zXhL5gkbGa99jwiimtnbwF9l4S/JHtgA0ta+lmox7UxZPGkomBAv5zehx4y14IiF0vm8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/FAxqrI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/FAxqrI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so20001415e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774265775; x=1774870575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf29XD1+StXXEJC3V1UNJd3XstlYoXOmSXkvCeAyZ7k=;
        b=P/FAxqrIlL/XL7GIx02VFC5yZMrEJUI4bk7oF7+QnDrfmUTHASjNkkUFF56Zpk5l8E
         LCFQeBZHCT/xD8ox0UGgK+miRayEbbq6EvDpyL5T7CbpZ19H6vO9ejfXOr5lhBZRH32o
         CmbkG0R+J26x3w6cz1YR7MFDgUxI0L/hmFdFQd6oKjpKjwr9+wvo+AZJlOQHQnjZnrIj
         paf/2NZs3O/7U1XGYoaD3eYTLSgvX1ZeNcMBfk7K/t/Nt01vo9cDjOj5bHs1u0YQNsTm
         6BUfEh8L/yUNIekDECce4uUXjAMC14DCgTfMs262fD+Id1hnXSu/cP9GdaEkfIJ7ZK89
         tvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265775; x=1774870575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf29XD1+StXXEJC3V1UNJd3XstlYoXOmSXkvCeAyZ7k=;
        b=Qxoav5+PC6UNtDpkCzuxiMfh18KWuSJWNJrcvdiUD5o56Jm9lNi3i3StBm69sAchuj
         ie5mD8a2x+HhXFSMEmLD2PZKs2QzQxvTAl15RAV2XUoObx2bcsJDTsoj4sqKceGO85/x
         bUGNtWIjgztdGYfN+L8SWYoWkkqbHcTqcgrClinl9gpifK9X+l3OkoIxWxa1RXtm0/bB
         VYksk7br+oA2cnlU2gQJ9ROW4gkVL0n4tBKygiOU1Uex74J2Wqp6N6kQMTucST1rr/Kf
         7DsWc3z/vy4bob8bk1u++iLjAFmX0gwIA6ipb0rUnar6RcEMi9q5KWBVEJWYawAmZbHG
         jvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIkMgRizcO6cwpP6K9UGKc0a07Gp2onsYEvzkKEJeQQgF0h2cz9blCpmzlYgupLNoIdz9aYXFSJxB/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PGb9TdCTbpXI65Q+B40PwQa9t7aWbPyK6vXHlUFZtetCvLzT
	Tsw8KwyV8M7lJMvsyp2MuZAE3xnrON733iIbEB9UqJ8ihDBdsobRcK+H
X-Gm-Gg: ATEYQzxEx9x/wbVzUsFdLmjOYsusInWv7/KkH78oVP4BINUczkgXt1ka/YM4k28UVne
	xfhfTJ6UB5WVm6iHdQm8PZFQJhrYyCzx3e40eBokAGz5UEG11xxAaudW4SdU3vGsZ5vWnsRXGWs
	NXDlzG+jTcuT4SaGFHVJgLF7tbKs5C1TgJ+Ht+CV8wul5NKihyZFhAacWni06q7+/u4zpMn89jQ
	svxrv60sUaav7zkcS8/beU0/OkE0aKZT43uLwVHXacWI5uMyLZyDsUzduOYJLHYmlXe4+fOcn3h
	OqBFI7KubRhYPBJ324yV+azygOZvQw7vpC1OB+TUiSTxdOYgpYialAdvmRzef3j2F6TkHG6jxeH
	LnXg0GH8q/z0rLMnm7SabGnz89rp8ccxcI9r+taQ7wdBxirTXX+oNrzPpTdmHPGCMMVkKgtHUiE
	wMLDJWgfteSmyTKCWEN5Z9Qh4OMAlvVUZCH8kO1+vXrojVRIl5kXhtWAygfz2tDlQdw2oVsxWz+
	2JjQ2Mo3dOopWXePsoSkT79G33EL46LTetaH+CGfUs6qFRus6tZBU0shEnnTw==
X-Received: by 2002:a05:600c:a55:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-486fedbc28cmr171565545e9.13.1774265774669;
        Mon, 23 Mar 2026 04:36:14 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe897fc2sm81426715e9.11.2026.03.23.04.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:36:14 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 23 Mar 2026 11:36:08 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 8/9] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
Message-ID: <mtqjtmsysz6ywvybeut6qzhee2o4qedwgvr5isbn4um7bwhjbe@sg2b7hwlszwd>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
 <20260318-ad9910-iio-driver-v2-8-e79f93becf11@analog.com>
 <20260322172257.1681de69@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322172257.1681de69@jic23-huawei>

On 26/03/22 05:22PM, Jonathan Cameron wrote:
> On Wed, 18 Mar 2026 17:56:08 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add ABI documentation file for the DDS AD9910 with sysfs entries to
> > control Parallel Port, Digital Ramp Generator, RAM and OSK parameters.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---

...

> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_profile
> > +KernelVersion:
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Read/write the active profile index [0, 7] from/to the physical
> > +		channel. The AD9910 supports 8 profiles, each storing a complete
> > +		set of single tone (frequency, phase, amplitude) and RAM playback
> > +		parameters.
> 
> This one is interesting.  Can we treat them as symbols that we are picking
> between?  We have similar DAC ABIs for that already.

The profile concept comes from the datasheet and defines sets of configuration
for single tone and RAM control mode. I am not sure how we fit this idea into a
"symbol"

> Is this picking between them for purposes of configuration or setting which one is
> in being output currently?

Well, this is being used for configuration and activating, then, yes, you can only configure
an active profile, but I was not seeing that as an issue. I suppose that simplifies the
ABI a bit.

...

> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_destination
> > +KernelVersion:
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Read/write the digital ramp generator (DRG) or the RAM control
> > +		destination parameter. Determines which DDS core parameter is to
> > +		be modulated when the child mode channel is enabled.
> > +
> > +		Available values can be read from the corresponding
> > +		out_altvoltageY_destination_available attribute.
> > +
> > +		Valid values: "polar" (only for RAM control), "frequency", "phase"
> > +		and "amplitude"
> 
> This is very device specific. Maybe we are better representing these as separate
> channels each with their own controls for DRG.  No problem if changing one changes
> another.

You mean removing this generic Y there? Indeed, there are separate configs for each one.

...

> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_operating_mode
> > +KernelVersion:
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Read/write the DRG or RAM control operating mode. For the DRG
> > +		channel it controls the no-dwell behavior of the ramp.
> > +
> > +		Available values can be read from the corresponding
> > +		out_altvoltageY_operating_mode_available attribute.
> > +
> > +		Valid values for DRG channel:
> > +
> > +		  - "bidirectional": Normal ramp generation (ramp up then
> > +		    down, dwelling at limits).
> 
> Some sort of trapezium wave?  Maybe this and continuous forms are combined
> and we have a separate dwell time control?

Yes, sort of. Dwell control is made by an external pin (DRCTL), often controlled
by an FPGA to achieve certain required timings. I can say that software control
is not really recommended, unless only a one-shot ramp is necessary.

When adding the IIO backend support, extendend attributes will be added to
support control of dwell times.

> 
> > +		  - "ramp_down": No-dwell low; the ramp resets to upper
> > +		    limit upon reaching the lower limit.
> > +		  - "ramp_up": No-dwell high; the ramp resets to lower
> > +		    limit upon reaching the upper limit.
> > +		  - "bidirectional_continuous": Both no-dwell high and low;
> > +		    the ramp continuously sweeps without dwelling.
> 
> Triangle wave?  bidirectional continuous is a rather confusing term so maybe
> we should rethink this one.

Mostly yes, but not only that. Sawtooth can be achieved as well by changing
the step sizes, also other weird patterns can be achieved by toggling DRCTL pin.
This mode is the most useful when one does not have an FPGA and want to save
resources on controlling the DRCTL pin. That mode name comes from the datasheet,
so I suppose it was fine.

> > +
> > +		Valid values for RAM control channel:
> > +
> > +		  - "direct_switch": start address defines fixed word to be used
> > +		    by the selected profile.
> > +		  - "ramp_up": One-shot ramp up through current profile's address
> > +		    range.
> > +		  - "bidirectional": Ramp up then down through PROFILE0 pin.
> 
> Avoid specifics like this.  Can we call external control pin or something like that?
> 
> > +		  - "bidirectional_continuous": Continuous ramp up/down
> > +		    through current profile's address range.
> > +		  - "ramp_up_continuous": Continuous ramp up through
> > +		    current profile's address range.
> 
> I guess this goes back to start on finishing ramping up?

Yes, any dwell time should be considered when loading the "waveform" into the RAM

> 
> > +		  - "sequenced": Sequenced playback of RAM profiles up to
> > +		    the active profile. Requires active profile > 0.
> Is this just running through each profile one after another? (other than profile 0)?

for this, this would be the actions:
- configure all desired profiles (0 up to X) 
- Set the operating mode to sequenced (profile X would be active at this point)
- Enable RAM mode

When RAM mode is enabled, it would trigger the execution of profiles 0 up to X,
in sequence, according to the configured address range and sample rate for each profile.
When one profile ends the next starts until profile X finishes.

> > +		  - "sequenced_continuous": Continuous sequenced playback
> > +		    of RAM profiles up to the active profile. Requires
> > +		    active profile > 0.
> Similar to above, maybe separate out dwell time if that's the difference between
> sequenced and sequenced_continuous.

The difference here is that when Profile X finishes, Profile 0 starts again.
So the previous one is kind of an one-shot mode of multiple profiles in sequence

...

-- 
Kind regards,

Rodrigo Alencar
