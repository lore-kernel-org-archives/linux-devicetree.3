Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DEC3CD8B0
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052421; cv=none; b=b2VdkRrY7Ren4+PCkj7TGpgIqqx3Gwmxn4B7PwoFOVoYR/Xr3Nav7KlS+Rx/J/E3zoWXeXPOgxa0SRnS/URutboGswFInUqciPfk8tViupiBAAz2JP1IYO2W3jpODwZWDZF0HsxZlWxp74lXO9e5ue7sKETJgnKNQ4NuRn8vxpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052421; c=relaxed/simple;
	bh=6hUd2Dp3mbUUsH0uJSobaZD75vru4SnrNxnw5Brg8sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5rnjOjvs8Zc3rxJ9YgGA+vnK9AkEc4aQ1LAR/GfzfFYWH6cEu123IRaiD9Ue5x06B8fIuig3ivPelhOrhF6zsty7mc40vmVlGPlJP24kABRpBl4AipuNWI/+ZD+WgWDtJm+NKQU9rUu5H0HzWT+RaHDOlX7dxCjna1Eg+Q+/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EBTl19xW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EBTl19xW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so87858605e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780052417; x=1780657217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=18we3XaF38yQ3wAMs5IOP6Gxb6jY92eB45OuWFEEzvE=;
        b=EBTl19xWHiPWCO7Nczi0mwTNG6EQHjljhLEWvLhlgFCHXAGByJCxzkfO1ZY2HoVauu
         DHjoLRpG30HBnJjGsufGCVx7ovs09PcOQAmjy2inMDQf6eSetlZV2Wc/z7pqWOAOID6M
         XESmr+oqX2g32vSRhprYdCAliIEucCsN4RTemaK4l8icZcWDHpQgjcvlYjynJtLRL5vL
         8zmuIxUMy5uvcsatLW1qQaW6ydbP7winGOMB1M+7P2hL06SzRPkOLX7aDugyB9RTwQd7
         2I3kBTAb+lod36BoDU7xXXSN3LiM+KvFekOYgljs+DSvVqQP+xB6VdNevjAQhMgK8zkA
         TNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052417; x=1780657217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18we3XaF38yQ3wAMs5IOP6Gxb6jY92eB45OuWFEEzvE=;
        b=WoUY3OpPeL0qctIq9l367nzmILfcfb64tAhJZb0L1+eGnuuIXm2d0cWt7uAqIT1qzE
         UJY7+QPJxavAvDgisO9/Vv1Vqqzz7H/NLYonn0es/lD3DOkyqggYqDnSfy/uLUm6BS9T
         ARr2Z8rufhoS3/HSB6H9+6B1PtfeFoLSjL33S5XyO6LscDS/q9rdVk8nAiZmRj6++Lgs
         8JJxX+Yry4dXPLzuAVB4DXNXKGurMl+MNwHE75PcNKvd9VsiCE9irMXjzk9lWjGofXbc
         BvTaWLezBnu3P6mZ4v/7VLpohuMYxaeVrvcEVCGTmej6+mHpSgO0p8tVIEogdbdHw+nf
         c4og==
X-Forwarded-Encrypted: i=1; AFNElJ/rJm2+CK4iArS1YMdqWDURxXQA8Ck5pN8uJ/Q3qOhHdrqoGeO1Ue2IZnIAXDy4pxYSl/ZWb8WSUU2Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywawll3cxC1JMUT276nIC38u2jF7V+DaU6qGVNQLxvAZytGHnjC
	HXxzl7Gn755ug/L/GyeH7MGEy8RTc6ihgeZiD3S8KeblmTj2w5QmPS7emiwynaSWGFY=
X-Gm-Gg: Acq92OE5t5TBmBYfn1Z1Su5qVfjdN161VRWPHfDZXoGgOKVx9vmXgETQK11VEs3j8T3
	hms6JHUwNoqcXlFH0ijByi9nF9TkThGJP1g2z9oLGq9nYdgs2qM/9DXY/S0hGqQfKj1kOzQsBq7
	2NEymCXj/Ps5PG/JGXVNfLevN3XVSYhNgGCraVNIkwtGbQ4FTsJs+0I5xgqxxv9FV9ZU+qp69/C
	ZtsHEOSA6XfccTjIbAeVw+fQIqEf0t06+elaHfFJArsUqrmmanG3sEc+65K9+OHR6DoFeiHs8kz
	vXQ4EsNzRadE3fg0lQaxpsr8XKlPMmYEpopHZJIGjgwt49hYG+H6bA1OuANqTQ47+Mo9idj+8Ix
	NU7isGGQXCF87AJ2gPsTo6RGH96Ht70yEYyrPNLrHOoAJHUyhKMIS4DCl/SjHWvsuNC/wTnBqbG
	zUcqKZpoa4Tp9QVsizjjI3gw9un9AximcOyXDqJPcgKKQk9ofyD07y0BA6NRtHoIQ9J37CN9kvT
	iZtby698Jn464u9mNieGZW5m8K05VQkZOMeLem64WjXxcAdosgX8Wl9ETCm82VDBsi+YGLCKs4O
	Dy94QvIh4Qbyi9EHRfJawuWBNpwKnQ==
X-Received: by 2002:a05:600c:630f:b0:490:845d:652d with SMTP id 5b1f17b1804b1-4909c0ba3dbmr44464495e9.15.1780052415386;
        Fri, 29 May 2026 04:00:15 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm49548585e9.6.2026.05.29.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:00:15 -0700 (PDT)
Date: Fri, 29 May 2026 12:00:12 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <ahlxvGRVFDFrTUN3@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-3-clamor95@gmail.com>

On Thu, May 28, 2026 at 04:51:19PM +0300, Svyatoslav Ryhel wrote:
> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> Additionally, optimize functions used only by platform data.

The last sentence is a little vague and makes us have to hunt for the
changes in a relatively large patch. If it is referring to the change to
common up the init and update code then it's would better to say that
explicitly!

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/iio/light/lm3533-als.c      |  95 ++++------
>  drivers/leds/leds-lm3533.c          |  51 ++++--
>  drivers/mfd/lm3533-core.c           | 268 ++++++++++------------------
>  drivers/video/backlight/lm3533_bl.c |  52 ++++--
>  include/linux/mfd/lm3533.h          |  51 +-----

Just one comment for backlight, below:

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index babfd3ceec86..42da652df58d 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -295,13 +293,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
>  	bl->cb.dev = NULL;			/* until registered */
>
> +	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +			      pdev->name, pdev->id);
> +	if (!name)
> +		return -ENOMEM;
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
> -	props.brightness = pdata->default_brightness;

Given the big changes to the driver is there any chance of putting a
good value in props.scale (BACKLIGHT_SCALE_LINEAR or
BACKLIGHT_SCALE_NON_LINEAR)?

If the difference between 50% and 100% *looks* like 50% then the scale is
non-linear (since humn perception of brightness is not linear).


Daniel.
