Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224E3B6BEB
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180937; cv=none; b=EEx2I26lKUGezJuZJblI9BFmM623GKM7pGNGPHdhh1njyZ8BnLCozUmIfoFVklnbxpvBXDE2KORfXhVQZxfoPAGCdNwRKK//DuxXlosekX9EyCqX3/2eebPpls3DYkFsv5VTe8Ull6WU7QsidT4o555rfOReSsf7AHQJiY+LFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180937; c=relaxed/simple;
	bh=Vog3orhtjCmeZ4R+XwXGNT+9nl/x2XuiLD+3swCGZXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlnSLnrtXIqHlJzSYQLy+kwMSjkZag2suRRJUt/8+wrvFH6PQny3vfcJPivn9bF2aVFRTy+rwb6DiTvC1TCB3UCsyDyqRC7a+1gTVIgCSQx1VZ7q5zXaewKZiC28l6tywaHrv77gE2JgQyEFEQdWB76N9A42xB9h3HsBDO4LsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5ez26Iu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5ez26Iu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso66766675e9.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180933; x=1781785733; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azzjerS/pmX26lFb1rlIgG6tYeB2JmthSTl26maBKMw=;
        b=j5ez26IuHLivizoOyo43BVMJ5pTHwph5LS1r2wTG/xk7WDoU5sPy9uhE+xE84owxsm
         1aMJj1ySPCsk0uDrt8Oi4/g7EkcXJ/EqrOjdRKFahVRm1aLTr1jDhKauwxusAIQ1JYCs
         lCamKDlFPCJx6xk/UkoOQP/XOOD3r8jQHD8t/viblBBEKDlswNQ9KrkqOnmqp0uA1Fu2
         xDt+XpoaKT6FmVZbNtA46kNl8DCMeAWqTzybA5tPJ6Lj+TWymgXEZ1+ZUGwbhDINvlLj
         dQdVZbgXpUk7Tai6GjlBVFfa0DA4JNV4TP494ySiXmtqCOB0pWiY/t05r87ixEvbinup
         rwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180933; x=1781785733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azzjerS/pmX26lFb1rlIgG6tYeB2JmthSTl26maBKMw=;
        b=gzxM6hRNfVKlu0FYTUu7xkiuyDxJfFKEZJdOFbachCdNN+7Bgk3NT07GkoOGs2CKAc
         4NbgFh4YM9Tq1aXlsYPJCxv1Of4GSU/wO8PuiHpSM389RyZFLaUbXYopUo/x96JnJZN0
         GQGoc6lJZ51JINVApwfzv0SledEzgx1xY8eIbhA6xxCjXeXXyrVlHZP/9A6RdbIHKOfE
         kEgvYcaAGsHUF1/HH6M0MA1PUMoFMpuyEPhMpJifXhuxTcuGxayyYs/YFZpJTAtGrDEO
         fTPLZaglTQcelTtKwL8Ny5pJe7Uc+3XCbrFiJQt56imMKioFGPzEUEh7cmnlS121nf3w
         nEFw==
X-Forwarded-Encrypted: i=1; AFNElJ8bHS0ghRnO4YqdEXjx+n6MQmgkZx7gUtzouOKrUbhp6Bv/xFT8MImlm7sQNDkGMgO+0S4hzGhyzVZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YzNISxsKd9C0anIDy5c+rwPr37LBk9sqWEqeoQ0ZKEn4Q76GhCw
	iwgYntDKpCg3skTNrRNIar+GGD5e4wfKxioqeMRnmw4I6+V/Zh6JfWoX
X-Gm-Gg: Acq92OHwVjiIB/Zou7Oh32nnZoqrasa39WMfmcSoyK77kbv/FliY7qIQD9T6tudmapk
	lLj02KSBLruYOQB4KeRV3d51eulsCSyzv0K6IufrsDwCsalxVh7bV3j+1bmMRh2MgxTQzHPW7Cm
	2XLq8mcq/OEsjgCEeO1nkgZyxwrGbRpNJt6ME8q8NcFumJw79Cy3jsxphu5CtRWyADBKTPmCCgI
	Sh5KcywcS9RaRhRoLNWHqYfxYN/leJy9NAo8m3d9D5eSRtVdyM/XSwkVGa4RXWNIKx81oLgdcic
	OMiFIR/zYaEDwSzXk05N/suAjmkj+cblDz+NYjiczUcRdRWknoxgYEazBSCZbC6S3TofExEzyu6
	YVbpgPWnEDk9P9qDbAmiyOgZGtTPXhSGklxoJTcySUHfVuookgN+o7XFseCQ/bem8PgqQ5jvNA5
	1saZKo4+F84jpJgzJRGoZzNb6DGA==
X-Received: by 2002:a05:600c:4f95:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-490e5619b2emr32867615e9.21.1781180933181;
        Thu, 11 Jun 2026 05:28:53 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52a54a1sm43212745e9.3.2026.06.11.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:28:52 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:29:53 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: "Paller, Kim Seer" <KimSeer.Paller@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "Sa, Nuno" <Nuno.Sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@analog.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] iio: dac: ad3530r: Add support for AD3532R/AD3532
Message-ID: <aiqqIz8wiVjauCai@nsa>
References: <20260604-iio-ad3532r-support-v1-0-c3552f9031de@analog.com>
 <20260604-iio-ad3532r-support-v1-3-c3552f9031de@analog.com>
 <20260605142428.5cd21b26@jic23-huawei>
 <SJ2PR03MB71394BC5D4E680A96F950732F91B2@SJ2PR03MB7139.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ2PR03MB71394BC5D4E680A96F950732F91B2@SJ2PR03MB7139.namprd03.prod.outlook.com>

On Thu, Jun 11, 2026 at 07:04:37AM +0000, Paller, Kim Seer wrote:
> > > @@ -445,7 +704,7 @@ static int ad3530r_setup(struct ad3530r_state *st,
> > > int external_vref_uV)  static const struct regmap_config
> > ad3530r_regmap_config = {
> > >  	.reg_bits = 16,
> > >  	.val_bits = 8,
> > > -	.max_register = AD3530R_MAX_REG_ADDR,
> > > +	.max_register = AD3532R_MAX_REG_ADDR,
> > 
> > What happens if we read off the end (via debugfs) for the smaller parts?
> 
> I tested reading registers at 0x1000 and above on AD3531R it just
> returns 0xFF and no crash. Should I add a per-chip regmap_config to limit
> the exposed register space?

Personally, that would make sense to me.

- Nuno Sá

> 
> > >  };
> > >
> > >  static const struct iio_info ad3530r_info = { @@ -514,6 +773,8 @@
> > > static const struct spi_device_id ad3530r_id[] = {
> > >  	{ "ad3530r", (kernel_ulong_t)&ad3530r_chip },
> > >  	{ "ad3531", (kernel_ulong_t)&ad3531_chip },
> > >  	{ "ad3531r", (kernel_ulong_t)&ad3531r_chip },
> > > +	{ "ad3532", (kernel_ulong_t)&ad3532_chip },
> > > +	{ "ad3532r", (kernel_ulong_t)&ad3532r_chip },
> > 
> > Add a precursor patch to switch this to named initializers. Otherwise this will
> > clash with the work Uwe is doing to ensure these are all done that way.
> > 
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(spi, ad3530r_id); @@ -523,6 +784,8 @@ static
> > > const struct of_device_id ad3530r_of_match[] = {
> > >  	{ .compatible = "adi,ad3530r", .data = &ad3530r_chip },
> > >  	{ .compatible = "adi,ad3531", .data = &ad3531_chip },
> > >  	{ .compatible = "adi,ad3531r", .data = &ad3531r_chip },
> > > +	{ .compatible = "adi,ad3532", .data = &ad3532_chip },
> > > +	{ .compatible = "adi,ad3532r", .data = &ad3532r_chip },
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, ad3530r_of_match);
> > >
> 
