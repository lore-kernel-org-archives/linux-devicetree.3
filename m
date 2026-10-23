Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752045;
	b=FbCa22UgM4jVr8xljzjwBRN+NzCEIaslyX80HykhcegKW01h0JZ+RknF87Zh+erZDFvl
	 mTKOsAgPEj68kPkokOEL6Rj68S/AQheeIJwbdzcEjeALrpGO3qN86eW3/bX85qlGnEzo8
	 k/iAx4hxZMsx1oSvbQcHEwe4pskW1KEdoYuAs9iwhQzP9vM6kLSvbDvvJzfcTvRANV2H5
	 0fGGcq7a6U061pWN2Ir0X1a9dBBhE+XcvWfvt1TIGM5eGUS7+irCPuAu52w++ySEyz8zO
	 1UWZb0eWAAHNMbp0s6/Hy/PjSNObfB3ihtCNfKJqkKzTck5iky6N59LNGWuPr1CEE/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
	b=AgX1GztgASlWtpHTMahNoY4R/Ca2SA0sgoPnWFyCWfAQtkN3FVrcvrrK2v8ighpCX7Ce
	 7sRxZZk/snRGYPMkuIKTbuiPUcm2eUW1vcQwaUddavr0QVAk9M5/kE0vCsg49q8uDiSCx
	 fNKTnRjtFcMbQ1JwugofZ1bAVNGP+gcC64bHMvbAXpXAfKBuwSlI38YjLO4VKrE2iNQrN
	 gFM/putMLW4hf5ZzZwvfa1fVFhjY7W9EYQMPVVdt6eElz1PxjY+1DkMb0VlGel26vaKcx
	 AkUSRfFMGrq/N9chUMoSGU5Moln6Di25G4Dtrol2+vGc+CxJzg6x/ExV1TjxJS6+3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA228606A33E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA228606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso765700e0c.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752044; x=1793356844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=qDHUhalwvENGkYicXhp/819z0Cb38eGLFlBd2GcJ+kd+woA2F1L8l9kYdTAygGzV41
         jjsjJKPrcmEv5ryCEEnITghJ9icCuEe79uAC2TIerrCYohBBHBLTZiMIiSOnL7RgoXOc
         q6Gpso+ZmXyHzx5yBUnX/tlI6/9r0A95XfDV3X7yX3MMwNrPcA9L+Z8BuguX0OIOAqlt
         JHwbigQt7F23Hncc/dEgAZqZdYcICFBMwluD4DA7c4nwdtfDwE9g22DxGn7k0FaCEkPY
         uTBI9O6EHgKlpntPbaAxkPlFVAJrawT3KfULj/F4BGcIPiZqEfUbhbaRfaayJgz0OljI
         ukyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752044; x=1793356844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=RRQW9r3gxsBr+MIz/nrIRmO2+3Qr04EJgI27gocI6wZuNiIloOla5nS3/S/ZSn2hJ3
         YMaouNkPNdOnBrhgtv0GFmRQ9pC2KS5UZMf+gcWXh5IB7EyPvdFsqY2fWbr7IGisEMmZ
         r5C71PiCPLk5Ab2BwTzXEBe/6y2/RWtx5s2ZfMfHPsc21cIPaBVO0gslrDRpTNEg2a5a
         wYEqXL+8Hxn82P5XkL5maO5ga4Z53gzRIfByb526xp5H1YwWNQ2WyyuXN5p3PMCAsxRY
         2ZISDCWE81OmdFInzy82qfRpExf6RDyCVL1dOX6opUgy6bSfBMCea/Q+XXX/AtpPfQCw
         VCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfquKTGKftkUVsJ6QrpLLhSnqDg2+Y1S6wVCuI2VpYDhLTTpcVUj/XTBUbuiCBqY6zXE6tzX4oHe/Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJm1E3r+htNdWYI4U0DuiFPaseHHLC1lHgVFSwY/cI0+7rRXDaa
	LIUMJxOD7Y+rTBnHzGGDnIxeG63MxzcZRRzXC0jnv9hJ82x4k+FTvnU6
X-Gm-Gg: AYBFou1VCvd+A6QrxahjFPSsZRTStenxfDlJ62fWfYQiaF8o9uzYbCnXb2eNBYwXKXr
	IlpHLkyy62sROLm0YV2rjkGPeAQ7A1h8igZJfbNJYDrWSGBQqgH/zFWmkulQRpwxYcyyVE8zUyB
	1vD7mbQGFCmfCcZjnuZRUMkaQ0emXJRlZ0djqX0DcoOBL3Cfi2tYpQmPLWL+IbdqLxCYnQM32p1
	ATdexaI5qN68prhzyuojxluocgkNO0CHW38ss/mMPCbayaO9T2L0h9MVYFzfWfst5GRndeL3nOx
	rpKHOUTwdrcDpqQBhU2+4EBOd7WWbzMEVu1JOM+A7P7Y6UX0XBjR35dj3LB5SYRsbpBrNSJ5roB
	04aDsXsnK6Tuvg8tx9a7YChKTl1jctjYl5t6wv81ge9+oekdgFC2EdgGyZNwD5cfr9o8ywOvsy1
	6jIOeuFyNSlBiRiuz6qFxQ/lTrzJFn/E1Nn1Wp4YvDzehhKDoThxIjtFMYofo7aVBNZB1FnA0uZ
	eoPi/1lg3LGug6IB0YQWVHaNLw4zxhUHZ+TMmNtOwp0+44FoDcPmnEVgUzKa+wf5XxAEde9lhau
	iWblXJgZ8hR/WTIt2uq2dKdISpyP49U0GFJiue1QFnRFEyC7D3M=
X-Received: by 2002:a05:6102:41a1:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7ccc32eac6amr858728137.13.1792752043685;
        Fri, 23 Oct 2026 03:40:43 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13deaba5sm1974736e0c.1.2026.10.23.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:42 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 07:40:32 -0300
To: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 07/10] iio: frequency: ad9910: support drctl control
Message-ID: <pg7pcjaaxuu6vmi4qowgaefyo3mynrvmiu6iazzormyvc5kiat@4hiqrtwbw2gg>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>
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
In-Reply-To: <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>

On 22/10/26 12:19, Rodrigo Alencar wrote:
> The DRCTL pin controls the slope direction of the AD9910 digital ramp
> generator (DRG). When dwell is enabled at a ramp limit, the DRG holds
> that limit until the next DRCTL transition, so the sweep pattern is
> defined by the waveform applied to that pin, which can be generated by
> a PWM.
> 
> Get the optional "drctl" PWM and expose the integration_time attribute
> in the DRG ramp up and ramp down channels, which sets the time interval
> assigned to each ramp direction while the sweep parameter is accumulating.

...

> +	st->drctl_pwm = devm_pwm_get(dev, "drctl");
> +	if (IS_ERR(st->drctl_pwm)) {
> +		ret = PTR_ERR(st->drctl_pwm);
> +		if (ret != -ENOENT && ret != -ENODEV)

Sashiko points out the problem with passing a non-nul con_id to devm_pwm_get(),
which would get us EINVAL or ENODATA from of_property_match_string(), and that
would break the intent here for an optional pwm. Similar to what we tried to
achieve with an optional IIO backend. I wonder what is the best strategy here
(ascending order of complexity):

* Use con_id = NULL as DRCTL is the only pwm signal being considered at this point.
* Local workaround by checking for EINVAL and ENODATA too
* Convert error codes from of_property_match_string() in of_pwm_get()
  implementation and create a devm_pwm_get_optional(), which would only check
  for ENODEV and ENOENT.

The pwm is optional as the digital ramp generator is one of the possible modes
to be used.

> +			return dev_err_probe(dev, PTR_ERR(st->drctl_pwm),
> +					     "failed to get drctl pwm\n");
> +		st->drctl_pwm = NULL;
> +	} else {
> +		ret = devm_add_action_or_reset(dev, ad9910_drctl_disable_action,
> +					       st->drctl_pwm);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add drctl disable action\n");
> +	}

-- 
Kind regards,

Rodrigo Alencar
