Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4D3F6C50
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927138; cv=none; b=fkQ2GuTvBeFbswH7Huvdw3K7gAoz3PhuMbXftFyGHeQm5InxVOTGjnZ9ZGCl2QHZINju15ncL/JNY2g2rypDLxHMWNtbA7PFW17QhksJjDpYNgLzjnpGyQPmCvZKfpCP7sS1H3RMBZx4s7MGcUdDPyTsGCJaD4P4l9gf3s+SQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927138; c=relaxed/simple;
	bh=xqpD3wko0Wvxea0Ybs1eUBSZZd0E5YUHtTXaCR/QHtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8zDkXxo0iPsX07YeVe6YJCvfYvXxtmVH8SlL/knnyOA79fJFa7khUSQy/1DpA+72fRWqixZT98btTJQAerZLML00ZYbAehcLLijxhETsgDSTCLOHseLRL7lPQX4yQnQpdiauJDpvcvcO9v9YQwugNL3HvINZTkPH9Plt3oqHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVwZRZCZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVwZRZCZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso8752885e9.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927135; x=1786531935; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aLLi+mhiwl1zHrR3GAdi2fbGAwowg7TmJOl/ucMerM=;
        b=EVwZRZCZ5VB6/yUv9G2Zk7UCvb2teKqUyZBsdVsZwJqNFHgtfzoaawba4TtXsVKe7q
         GgSPdajswL7+R+SPOHj0FQWZ5t6JKHhnXRiQgy4LOm2LhBpS8BsPhM8ZQVG+VsGG62Lb
         4NXmbDvg0z2PQeselh70ndjHmEPbeBUGYoxKAia/hRI44Gcny5XTYcpT9eltzAC9u4GX
         QHP2uUcagaMTzaWVqDnOHeNjGZb6t1nQEjAcXidu+Y7q2kjtpLK7r11GkcN+BtUB2UpA
         FkbGOz+ZPjv8R+QTeA29LumxO7565Q+uC09F1QqTx9Scbq28CW0sy7fQeQkR9CGWAVfK
         E7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927135; x=1786531935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1aLLi+mhiwl1zHrR3GAdi2fbGAwowg7TmJOl/ucMerM=;
        b=LJzT4DJNT0svhXqFUsq3CWfgnGdgMJ42WbwgzVR2ZwjNeJjMeWYiQp+Z/TyyFHz0qD
         Vo+ukEN1qysy7pKTWefyjYgrRYOPghnJMT7iqv3oGe9fSr7XqiDnCKJo7yseNI2fRsy0
         QpWSDHQ26r236nrQGOO7pV64xnUanyn34Rjxs3XLfYMEMrjHr/4Rq1ETdXpz9IfDWpfh
         qhedOUVrB932195m0sCAGHDotlZEowqBuz3BkRau4pdw2eDQuwCVRZTXF1aB/1pTrjkz
         422ltciq10OK5RYpm1AocvxY8OEEF4bLVAcunweYSGInqddaFnx+OMo5BRHMBp1VyX5R
         9V4g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7MVq08lvi+9/BetC51CUqx2CjrQxHhPtiOe8vgR5yQB9QwWTR0U2McLbWsC3sg/4IsQ9X37vYB0nT@vger.kernel.org
X-Gm-Message-State: AOJu0YycpE/yBx198YoO0YIFIDz+9RK8B4Q65+78tv88zCUXm4y+c4IW
	FYWRIUgdsTLIk5mmJF342v2oJoHZHuU08dOl4uzy6NuuEXWsrVXpmXOi
X-Gm-Gg: AR+sD10OQon7m29var2cb7pLLhkhL19QJNMZffoPJ3ZLsyeaM91QTmO9hLrTXRJOs0+
	ZuJU4yZjNfGMt204YH4yx+GNcroE4CR/Ies7ZhYJNhPUlHpP2GjuCp6KNNOwE4sopVKxKAtsuf0
	B8pvl6PiVnXQ8VAm6/K68k9E0oj1XGEaQn1PJfqSXD65dIrFKZA31yd1tmoSf7tlygEeaLMeM5f
	d6JnKAxYcwIiEukU2E3duWPZKEVjkXjVodMTMB7H3YEsR/ppi9w1+0fhTpbE9vKdkNw8EfEw4AE
	+1jgdAd3IA1aMJzowQYdJO0tObrzKANsruK/H59s3LTKWm3gjV+RWTuJXzxeC5uw3zDkw4KH5Y0
	dpxCWCvHrMgTKImn+Il8SFiohvQKgRpuy+4kIimPHh01AFBYnTOnocrY+JZT9T9erp4jYox7FeF
	vuIzQ1WxjCjTzwrxn7Bpmq4KdvgiO8fNiQkcmnFP5q4S92bqAsryys
X-Received: by 2002:a05:600c:e548:10b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-4994e71af1fmr59563085e9.7.1785927134826;
        Wed, 05 Aug 2026 03:52:14 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5c0asm7480408f8f.13.2026.08.05.03.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:52:14 -0700 (PDT)
Date: Wed, 5 Aug 2026 11:53:25 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: light: ltr501: Add ltr329 driver support
Message-ID: <anMWDuEVe3wOLmgH@nsa>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715-liteon-ltr329-v2-3-d18af55edab5@geanix.com>
 <Q-ueoELrVUGcnBAEpAJE8z7yejEFFfSQBfk5ZeoZgVu4Cf1NwcMQRiRH-cvknalrNQBzoSJDMCG7w56-0MrHVw==@protonmail.internalid>
 <6vro5bil5b5j72rigujnm5zj4ot56rtwgs4fvn6xydybxpi4rz@vrc6p6bbkl3m>
 <87ldbcmkr5.fsf@geanix.com>
 <Ouq1f3XzhZ5grFMyCxC8cEFbB3eSSXdVMwFQWynPlH_OezdqbjGeOQrNu0oM9NcPieYKgzdY-MnZLTFJebC9-g==@protonmail.internalid>
 <lax5ggtixwejynztwul5brnkciq4gq5scbd4cuoyev2w3hgcti@dflf7hnw4rgq>
 <87h5laaqtp.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5laaqtp.fsf@geanix.com>

On Tue, Aug 04, 2026 at 04:44:02PM +0200, Esben Haabendal wrote:
> Nuno Sá <noname.nuno@gmail.com> writes:
> 
> > On Wed, Jul 15, 2026 at 03:43:10PM +0200, Esben Haabendal wrote:
> >> Nuno Sá <noname.nuno@gmail.com> writes:
> >>
> >> > On Wed, Jul 15, 2026 at 02:27:25PM +0200, Esben Haabendal wrote:
> >> >> This adds support for the LTR-329ALS-01 chip, which is similar to
> >> >> LTR-303ALS-01, except for interrupt, which LTR-329ALS-01 chip does not
> >> >> have.
> >> >>
> >> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> >> ---
> >> >
> >> > Hi, I have a small not below. Kind of personal preference though. But
> >> > what Joshua mentioned should be addressed. With that:
> >> >
> >> > Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> >> >
> >> >>  drivers/iio/light/ltr501.c | 33 +++++++++++++++++++++++++++++++++
> >> >>  1 file changed, 33 insertions(+)
> >> >>
> >> >> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> >> >> index 7d045be78c6d..379e57ac5f5b 100644
> >> >> --- a/drivers/iio/light/ltr501.c
> >> >> +++ b/drivers/iio/light/ltr501.c
> >> >> @@ -15,6 +15,7 @@
> >> >>  #include <linux/delay.h>
> >> >>  #include <linux/regmap.h>
> >> >>  #include <linux/regulator/consumer.h>
> >> >> +#include <linux/array_size.h> // for ARRAY_SIZE
> >> >>
> >> >
> >> > ...
> >> >
> >> >>
> >> >> +	if (!ltr501_has_irq_support(data->chip_info))
> >> >> +		return 0;
> >> >> +
> >> >>  	if (val < 0 || val2 < 0)
> >> >>  		return -EINVAL;
> >> >>
> >> >> @@ -1257,6 +1270,18 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
> >> >>  		.channels = ltr301_channels,
> >> >>  		.no_channels = ARRAY_SIZE(ltr301_channels),
> >> >>  	},
> >> >> +	[ltr329] = {
> >> >> +		.partid = 0x0A,
> >> >> +		.als_gain = ltr559_als_gain_tbl,
> >> >> +		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
> >> >> +		.als_mode_active = BIT(0),
> >> >> +		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
> >> >> +		.als_gain_shift = 2,
> >> >> +		.info = &ltr301_info_no_irq,
> >> >> +		.info_no_irq = &ltr301_info_no_irq,
> >> >> +		.channels = ltr301_channels,
> >> >> +		.no_channels = ARRAY_SIZE(ltr301_channels),
> >> >
> >> > Instead of playing the above game with info vs info_no_irq, an explicit
> >> > has_no_irq would probably be better. I mean conceptually if the pointers
> >> > are the same, it could also mean that both are with IRQ support. With
> >> > it, I think it would be safe to leave the .info pointer as NULL as it
> >> > would be always overwritten.
> >> >
> >> > Having said the above, so strong feelings about it so up to you :)
> >>
> >> Calling it has_irq would avoid double negation. But we would then have
> >> to set it to true in most of the entries (all except ltr329 for now).
> >
> > Yeps, that´s is why I proposed has_no_* :)
> 
> The has_no_irq could also be read as a variable saying if there is an
> irq (pending) right now. For that reason, I will go with no_irq_support
> instead. I hope you agree with that as well :)
> 

No strong feeling. I'm fine with it.

- Nuno Sá

