Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FA3EAC9F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744980; cv=none; b=q9izAd3KPD6l4+SYHkP04jIxTtNn8Mdd5zpVQeHKdyMRBQ8R/WGaptzvDss1it73L7qvla8RAttn/KzTZrFJ2y9wsxPnR+FaO2KceU6bh+wAcJxwd4n+1132MIT4+27bfuvwsW4ONrZbmfpQS7OMAOpat/lEh+Wv0375qoZjzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744980; c=relaxed/simple;
	bh=p0yV+D++iZUs17dmFYRPjhoraGSQ/rneBGiE3X6EIYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq4t9KU2uOtE6DQ65W5Q5kiOWu3In0COq3ZMoQ6DvMe4wRxqYiabfi/ZGcf25AFFAhsraHX+NPBMtGGs5TKNsbl35n2WZLh5B5spPYBOhA9TCnRpjG1Ng/yimJpEN2/lO0EsiX17sphUi+UA0uVao9IvjcvkaNEElRqNdJmP4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL7tu+C+; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL7tu+C+"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c965eab27so6469717eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744978; x=1783349778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDOWZLIN22YVy9Zj5Ay7+Ax+yfWAdEYj817p3w4+nyU=;
        b=SL7tu+C+jhN5mEcuUqOwx3eQTTSGE4TYAPNydRhf534TusN4ZnH7S/q6dn/dMdzRVh
         DIuAUmUrbsN1hWtLZZ3/7Zl8UVolVrS5eTCmwUNQt/jAYa1mEIxNnlF58wNBJqflsJXw
         wM/FWBsk4YamwoE//rGiDo2FULuPuPJv2eREIZr7hecBMJ3fOTwmBC44Bg2kB6Ot+l31
         JixAvmkSfDGyVVjTdMj9v5UWuybJsoJcQMhhN9ouc/BUf5R0spVi5wGqjfL4lZV6umzv
         9LqoRwkAb+0AzfrYSLmu+Ss9S5VmfWahKB6gjf7QzCEdhIs6Lzwr1f8FxNN+07FppMcM
         13bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744978; x=1783349778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDOWZLIN22YVy9Zj5Ay7+Ax+yfWAdEYj817p3w4+nyU=;
        b=qYXLhowgp+/8pguCJ1I0o1trKYur89OxEE85tzUiQXb2qxOiaMA0xsGM0UZ3QIcm/x
         YpMLW/YOp1cYy058BDvIj4qcrWguWJuC+QPiHL8EvvtdWvrXSAJH3oDi0TL0e6hODT9P
         WLnKrRtlacTq227T5CNNqsGDgwtxhR24NJoP8VGKyw2HsUxmSNHgIcRKKnP34J5szQeu
         A9AqBNdWISlX7bK9RJ4DPCAaWsR06wYI7qjJsL9c1Ij7x/USpf2XJt/2bqBGKQ/jYqQ6
         JK+3zEHPUEkI96+9oD/T5yNGpHwgWbTcYCUFRYB/zU81AyGuCXo6OmJGBEdDVn7cgowF
         v/Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4/haOP1KoWTgiA8xpV0btE1FB+Pt2ne07P7h6lQazRH0Z9J1d0Ld0X5IvPNd/mxEsTucFrwd3ZYr0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PBVbU4ipFt5eFkzYemH1hcN4jp8lXmESS6FnWCM6tLe1d2Ly
	n33CvE7N2/YBNYYORlUDyQVbWKTVLANinvzV+r3Q8EA+VYmCDbP3VZjn
X-Gm-Gg: AfdE7ck9kVoKi6qzwovvBOmqXoX/lL8giecxbBD3bcCML54ftupft+PeSFWmsJIDPE2
	/tjYyMOm1M0eTqzNlbmbrdNlEJUYXLxAdX5lLQdzPy0jdQHhFvY8HcAs2JuG59Kchp6tlC2LYpy
	yAMEwHDjaiF+RJJZPWAmSXSU74xqjQ1tKLJKHGZO/EYqOjDf6Sq1oOZPQksok0yPoDrlZNM9Z7M
	aeLKPAFHgxq8e7LRONK11QIliAF4ROvkKrzFJCZRZZncoGv2tDHeZdKrnaEkZcoLXzWmh0EHFLj
	cG3I9IGfpKY5HT6Agb/pXmHHZzuZYO9NmMMXvmFgydJY8ngFhSApe3NXIAF5qUiyxSnSjh3uSDW
	pPic3INbBCyxIK5RrEb8hUEvZCCfxxpO0wE1NkR2rG970AIBluU3BNL3b6UXmqEztQe1WZl/jlZ
	sXVlXpP72hYtBntp1pNZ297w==
X-Received: by 2002:a05:7300:7241:b0:30b:9e57:1e6b with SMTP id 5a478bee46e88-30c84dad34amr18734872eec.17.1782744977805;
        Mon, 29 Jun 2026 07:56:17 -0700 (PDT)
Received: from localhost ([2804:30c:1618:8400:e838:86ad:21d4:de00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm44619124eec.9.2026.06.29.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:56:16 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:57:03 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, julianbraha@gmail.com
Subject: Re: [PATCH v4 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <akKHv7j22P6KczXb@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
 <0abf862eeb277ae82262d09b11b1446f04c47be7.1782397418.git.marcelo.schmitt@analog.com>
 <9c6e0a74-c9c5-43ee-8eca-ae1667c51c32@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c6e0a74-c9c5-43ee-8eca-ae1667c51c32@baylibre.com>

> > +{										\
> > +	.type = IIO_VOLTAGE,							\
> > +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
> > +			      BIT(IIO_CHAN_INFO_SCALE) |			\
> > +			      (_offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0),	\
> > +	.info_mask_separate_available = _offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0,\
> > +	.scan_index = 0,							\
> > +	.scan_type = {								\
> > +		.format = _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> > +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> > +		.realbits = _real_bits,						\
> > +		.storagebits = _storage_bits,					\
> > +		.shift = (_offl ? 0 : _storage_bits - _real_bits),		\
> > +		.endianness = _offl ? IIO_CPU : IIO_BE				\
> > +	},									\
> > +}
> > +
> > +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > +	__LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
> > +
> > +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > +	__LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
> 
> Why not move the (((_real_bits) > 16) ? 32 : 16) into the __LTC2378_DIFF_CHANNEL()
> macro to avoid repeating it?
> 
Because that would go wrong for LTC2378_OFFLOAD_BIPOLAR_DIFF_CHANNEL() in patch 3.

> > +
> > +struct ltc2378_chip_info {
> > +	const char *name;
> > +	unsigned int internal_ref_uv;
...
> 
> > +static int ltc2378_regulator_setup(struct device *dev, struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
> > +	if (ret < 0 && ret != -ENODEV) {
> > +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> > +	} else if (ret > 0) {
> 
> Else is not needed here.
Why not? Intendend flow/logic is to get and use refin for devices that have it
(currently only one chip has). Except for that chip that has 'refin', other
chips have only 'ref' and no internal reference. Also, the chip that has 'refin'
doesn't have 'ref' so it uses an internal reference when 'refin' is not found.
Anyways, the driver can use 'refin' if there is one available, no?

P.S. Will separate regulator logic according to chip type.

> 
> > +		st->ref_uV = ret;
> > +		return 0;
> > +	}
> > +
> > +	if (st->info->internal_ref_uv) {
> > +		st->ref_uV = st->info->internal_ref_uv;
> > +		return 0;
> > +	}
> 
> I would be tempted to have two separate functions here and only call one depending
> on the chip. Otherwise, it allows incorrect devicetree.

Hmm, I see. Drat, I was hoping to avoid checking for specific chip parts to
handle regulators. dtbs_check should error if a chip other than ltc2338 has 'refin'.
Anyways, I see maintainers will probably prefer the chip specific init flow.

> 
> > +
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "ref");
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to read ref regulator\n");
> > +
> > +	st->ref_uV = ret;
> > +
> > +	return 0;
> > +}
> > +

Will adjust according to other comments as well.

Thanks,
Marcelo
