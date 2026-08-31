Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE993C1D42
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218095; cv=none; b=t2DrmLtFvUKo9zvZoHjYMVP+KBzHGJNS0oX3RIM0tNcWD1MrVnbor8j30LSBpn9cOcNote7GFVcZuRscNp+E8LE+tnmtL2n2v6zjh2/y5t1E6ExEOtotTqZPXcrHmUx1UOHSSCMXgjxuXd10SmN1FqoSFAgsGIJASX0p6O7e2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218095; c=relaxed/simple;
	bh=+DtOgMGR9+Hm0zGDpoOk2t7h7FujKWT+OqJ/UAJlZvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDANdJkEnikDKZ35AkQha+nCL9+xoiLWLKChJ/A7rXNS3ZBcxfVa9N+Lj0W/oN6Uy/b2XZSO8o/t+V38AVm/N+nWYbVcmT94nHTDyv9OtSbgx+Ew30wnppGsZAI1UUK+c94dyKezIDtmVnEFu4819QnPM9Ssr2fubrLNVDgTGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rd2kdrc6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rd2kdrc6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49557167508so43619345e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218092; x=1788822892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7imqAMa0q2kTKskLUSu2S5gDTb494TVGlrCJqb2nzRU=;
        b=Rd2kdrc6hx2HGTbUtNW/Nn2Me4s5rPnV/1TbJSdLgbNU+hDsu8OyIGdyepwhRXqxj3
         1gAUP3LUGUYPyUaGFxOcB/Cd++OeEOhLrVm466jMjQXChAl0bxmdb+xuGxxb3zEXugno
         awRUOfVg0XTO4OxuR4ICOYoZVcfKvbMMF450vn0wIrY2HlkafTrfIxMcdTTubEoW6tkg
         X/0CzJZ9bxq9k6FE/o5fOUce9VSoRf5h9otECic3W6xP2nEOxnUR8OOeRJTxcjOE8TDU
         +TASF2kZznkeND7dT9G/3wVpGM912vjOob4rcxiaHzRcPMXw3KkEwKa72KJRDWFS4cyy
         yHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218092; x=1788822892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7imqAMa0q2kTKskLUSu2S5gDTb494TVGlrCJqb2nzRU=;
        b=NvTKiH/J7S7ySbGdkeKsGwaKahFK/AYgJpMnNLPTeOx+kDL4WLBCaM+p7refKfYo43
         mO7NqRCz7Y0Wa/Q4YMNftvxoMOATPMO+e+31iaDppXXYQuZCz0B4EtAmrMKyOQ3LlXI0
         tGrU/sFN886AwQBbalMIQN5zN7D12i0I8Pj/xyOb7rvu8d+661r58tHvyvoO6O89Lj1s
         ONkqeNEdSpzqgb7ui/IWcNuRFZ1LZGe6Ie8NuJy5TsLzRi94NuWOFg2N4j/XGntVkRDI
         XCV3O74bYrpHIPmD7+ib1Bw/OGMmfv0Y6ScIN8RCbaTnFeJaANZ/08vGr++ejgP1EzzR
         /jow==
X-Forwarded-Encrypted: i=1; AHgh+RolhVvCxWJYpp9aYQ/rJ6GEe8SgoJaAhxXcs2MUufgDC5S1UyyzTjXFyCvI+4VzN1VLeve2+eH3PRXq@vger.kernel.org
X-Gm-Message-State: AFuF++nNY9IE9mEZ5PjWOaYaIOvsM39xvnYqKDoJGI4VzFH1dekEw9jv
	Ss72zK0mKm4Q5lIy3TmnDnDGZdTr9Y4n/gHrpiWpHRvcC/ZiMqILUkRi
X-Gm-Gg: AR+sD11uRAJJjlfTnDoWA6B/tVxYWX+c2JYmGLLC0h7jayF/D8WtugiLukTm0LVPzGQ
	7H8uQXcAKudLCr87BgGp29j6870gtAAcZuprJyL+UfqjX4KzuNXzbLZZ4kyz/+RD0zGuIBzECtr
	/c5ejVPzJXARDqnvC98NnRdFrf/tV5RHIx4i7OKdVliDZhorHvxH61JZtZJzFBF7TQczdylpcR2
	Ech4vx78WagEZpCkIKZxPcQXe1i8xiFmF5PQBKufUV7aXgkKJdBGmCtut9QX7Q3Ii4AXvkNYV0X
	JbnGLig4A3VmpIAIXA7250Omm8BQjlT/2xJ+e52zPorwmqJkONDRl6R97flVrsFTIPrRrQ7GWc2
	y7E0dLVrLWkn0XxUyMwcjZtVOSvyuByOoWFDvL9re6qrMTBn34tL0xcITlZKP/Wtad9bbxJE9On
	sBlzth6RQQZYPt4SZuLvbP0SMgOh0Y64zSpR5MwY1aTlOfKkMGBuhwNLOe9Yvvyc9agWEorR+hY
	vV9zaTBAVQ+NYObcjZY0vnGx8tbxhmh
X-Received: by 2002:a05:600c:4fd4:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cdc59f62emr71319315e9.9.1788218091484;
        Mon, 31 Aug 2026 16:14:51 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d4236esm855500f8f.16.2026.08.31.16.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:14:50 -0700 (PDT)
Date: Tue, 1 Sep 2026 01:14:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v8 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apYK5AIXkEnDYEHV@GLaDOS.station>
References: <cover.1788184274.git.stefano.r@variscite.com>
 <7a3aa8bc7d4613998904db4fbbae03d213c6c30d.1788184274.git.stefano.r@variscite.com>
 <20260831231042.59BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831231042.59BBF1F000E9@smtp.kernel.org>

On Mon, Aug 31, 2026 at 11:10:41PM +0000, sashiko-bot@kernel.org wrote:
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> > new file mode 100644
> > index 0000000000000..b56f3680edcff
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> [ ... ]
> > @@ -0,0 +1,118 @@
> [ ... ]
> > +&i2c2 {
> > +	wm8904: audio-codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> 
> [Severity: Medium]
> Does this code assign the wrong clock to the wm8904 codec's mclk?
> 
> The codec is configured to use IMX7D_AUDIO_MCLK_ROOT_DIV, but shouldn't this
> point to the clock actually driving the MCLK pad (such as
> IMX7D_SAI1_ROOT_CLK)?
> 
> If the driver queries the frequency of this incorrect clock tree node (which
> defaults to 24MHz) instead of the actual 12.288MHz rate driven by the SAI1
> pad, it may miscalculate its internal PLL/FLL configuration. 
> 
> Could this result in incorrect audio playback speeds or a failure to lock
> the FLL when the audio subsystem initializes?
> 

This is intentional. The WM8904 MCLK is provided by the dedicated audio
MCLK root, while the SAI1 root clock is configured separately for the
SAI interface.
The fact that the pad is muxed as SAI1_MCLK does not imply that the
codec clock provider must be IMX7D_SAI1_ROOT_CLK.
This configuration has been validated on the hardware.

Stefano
