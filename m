Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428992;
	b=baJWB7LuEEd3ZZ4gvknwuSMuSwp34LN936UOLXqV5ECYcq3eVsCQr9HIp5IFU3Gf+OUF
	 6NrLzVBHm9nQE7cgGkMDTcxZZznBm/OqIURgHF99wqoZMicJZwrqrb3Zw+oVXIpJDI8Cj
	 a7rgwq80H3Oa/fraoNeoqFIfilJZLsWDNx+hku45MuOVfEJtvs5WH6I4M0tnYQfshjj6O
	 426A/lntQMPRz4MVo4OtJpuQH7lfzPDm4S7fqDZ26yOALcjoBvRNi5U8HbMRjmxyKCsR5
	 lZfwl0afHYaB+KYLXt/v9fxkYJE+O54yOnyA0vCH85RZGUwZ3OP3yRHIrwgIUWByoGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
	b=swrpq/ffmOFbC/RBplcsC/8AGL+wzsoCVZQhU0KS3zv7rf5zNRuylKbhXrfRogwtsly7
	 vx1iSeP7t1Ku1woOaFuwuQukwSUr5i4Oy4ufXbMEkboHkaqAVhxDCOETMo6K9fULtDgcz
	 +QCjuSSxhR2VL6ccD/YgYgUANd7IISRh0yGrHPwrPe6oLoS9E0FGMlZL2irioaJ6X5edu
	 +TG3cQt5Ee+wXhexAJHZoM1YOwGt/R+KrN4nhZWfUxqvAK8QrXlcJTQgwMjIoVTSLPBTp
	 K8J8VwL4X0Y0/DNNsHlqV6V943g5twiRIQiB+SrWQGF6xgsekRD1o6sSm1y9ObObAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=efbRJmgr;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC7606A32E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BC7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=efbRJmgr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so22814215e9.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428990; x=1793033790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=efbRJmgr9AUbOcsIalTQIxtYd8aemMl8TNaRKUwYfJQzXouIqpF6Maohnlp2lISFVV
         KPsompM3/g4JXvNGnUYSAhg/hYFJT069VN+GSwMzI6GtwJs5UneNRlSNK2TSuPFGdobC
         /ZfThLM34Z4WKdYR7OMy/e1MTWEHBuCt+v5q0C2QZNDnE2k0nUrw12B7WQ7gaBrPObEy
         +e5EcQwdQ2YVyCoslekPlOqT3OmvVyiQESoJWauuQ66fEIWtVggR+vmy8wZT0Z8mCvTG
         o1c6CXipj4t3T6Fs59/5RHF+2PVHmcion5vqweqmPn/nzcbRmQqMuhOPplthBD+zx67j
         Nmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428990; x=1793033790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=d9UKwo45RIV/93xKOVJJAuFFu7c1L3GBh8spzzd2W5PLsgNjJ35iQTVjsbUpEXsTtl
         DRe2BXEhPv1LA5NuLKZ0kerptGi4oiF37uxQoHaeoPV7TSF4Vin/U9bLeJHCZxQPJpQe
         /LP9kWjWgtHS4vNSbiajq/4T/qkpKQ9C6odhLhnAhGH5V1JzjwnxgUH4JZrk51D/bnqM
         Zml6lfzJb9ETBGaDjwWCdZ/fhZppvCakLiuGOxwUp4KG9BMVOJUAMUHTwKGYygAvw9DK
         bclpbTY7I0F7+M1GwFTINeqmELYzcZ1DejDiEHuTDTqCnpDjNGBGoVySI9N4PT8aKY4R
         UEvw==
X-Forwarded-Encrypted: i=1; AKwUvByUoU7d/hxLgBDC52+w5cdkeByL2iXam/15eOAG+4eE8KmtzXnY6qlXNARnmMCeXquU+twpmmihy7uV@vger.kernel.org
X-Gm-Message-State: AFq9FYL0iHBT21H7zQJm7yiOUE1l2Qj29YKl121nAnS/Dhp3K0j+Q5HF
	DFABvAvfbBAu3L1uSuSDMrnWbThyrkS3NS8s7IJbNoZdUUINeYDVrp9Qa7IwxA==
X-Gm-Gg: AYBFou19dnJzYXa3vG4BGl4ZnPWB434uaLLAo7QfJG3k9lNNaAfY46vnsocvd7qH3ly
	HzDQRP+GO8hOUnsResYYAbR95+4ielYRBayaeS+6GEe9tG1Xm1SQSOpRgCo7MmWhc9GPzIeyBav
	7mihMTRKp5zQBWproi6dHVu6kOILijKMOBcgA7oV1ohl1bennwfBEoQB2tSJ4NQAEOwxxENvLsr
	oy27od0xBp7Dxls0wg5bfhoNhsXXzoAZc3YdMtA3hbAuXcZyTNByY1K4fEYADb1fYeyi8OpXQ6L
	X77jD+23NEaMGr/4Ekx7GN8PVV02gwSGbwGWA09+gxuiADSufqlAhl7LAhVAGKis/vqd56cDLWX
	xY3fJNKFgYwSEUTzV4M75t7/3bOYkXB5UQLYNZOZclO0KDeTz4+dSIQ3YEo6LbhtznH5Ew/FzE+
	q8CCoVGhJ1zm2P+zFOfnLoIHeHBzAv/Gjhxru9gCTbnXpNalyobJ1GQeHJCKljFxkytrUiQs/eq
	e27WMeI/aZtMkFMn5CBvHdtHp5/2K34TaXsibhlJ2FxTap1DaBRblhOEWyT7g==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr195261465e9.2.1792428989590;
        Mon, 19 Oct 2026 09:56:29 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm92295f8f.30.2026.10.19.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:56:28 -0700 (PDT)
Message-ID: <6ad64bbc.66e4af69.3b9046.552a@mx.google.com>
X-Google-Original-Message-ID: <atZLucG4T0G9wQur@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:56:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
 <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
 <20261019165231.GJ2663669@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019165231.GJ2663669@google.com>

On Mon, Oct 19, 2026 at 05:52:31PM +0100, Lee Jones wrote:
> On Mon, 19 Oct 2026, Christian Marangi wrote:
> 
> > On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> > > On Mon, 12 Oct 2026, Christian Marangi wrote:
> > > 
> > > > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > > > --
> > > > > 
> > > > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > > > 
> > > > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > > > 
> > > > > This commit adds support for the Airoha AN8855 Switch which provides
> > > > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > > > and registers a regmap for each internal PHY.
> > > > > 
> > > > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > > > new file mode 100644
> > > > > > index 0000000000000..a2778511dfefc
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/mfd/airoha-an8855.c
> > > > > [ ... ]
> > > > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > > > [ ... ]
> > > > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > > > 
> > > > > [Severity: Medium]
> > > > > Is this range definition correct? The General Purpose Timer range
> > > > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > > > (0x1000a200 to 0x1000a2ff).
> > > > > 
> > > > > Could this be a typo in the hardware memory map definition? It seems like
> > > > > the General Purpose Timer range might have been intended to end at
> > > > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > > > issues.
> > > > 
> > > > I have to double check this from documentation, but if possible I would
> > > > like to fix this with a followup patch.
> > > >  
> > > > > [ ... ]
> > > > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > > > +{
> > > > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > > > +	struct device *dev = &mdiodev->dev;
> > > > > > +	struct an8855_core *priv;
> > > > > > +	struct regmap *regmap;
> > > > > > +	int num_phys;
> > > > > > +	int i, ret;
> > > > > > +
> > > > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > > 
> > > > > [Severity: Low]
> > > > > This isn't a bug, but does this variable and structure naming align with MFD
> > > > > subsystem conventions?
> > > > > 
> > > > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > > > instead recommend using ddata for the instance variable. Also, should the
> > > > > struct name itself avoid hardcoding implementation details like core?
> > > > > Naming it something closer to struct an8855 might better adhere to the
> > > > > subsystem guidelines.
> > > > > 
> > > > 
> > > > I already updated the struct, is it needed to also update the local
> > > > variables?
> > > 
> > > Ah, I was just about to apply this!
> > > 
> > > This would be preferred:
> > > 
> > >   struct an8855 *ddata;
> > >
> > 
> > Ahhhhhh! You got me!
> > 
> > Do you think there might be a faster method to submit this so I can quickly
> > rename the variable and you can pick it? 
> 
> Is everything else ready to go?
> 
> BTW, there is no rush on this - I'm done for v7.4-rc1.
> 

Honestly it's really to slim down this series and the fact that it's
multi-subystem related.

The net part is done, I also asnwered the comments from sashiko but still
waiting a slot for maintainers to check.

I understand there is no rush but it's also true that it's getting
problematic to carry this part in this series (at least for me)

So if we can already include the mfd driver and related DT it might be
ideal.

-- 
	Ansuel
