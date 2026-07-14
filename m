Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CBC43F4C2
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020947; cv=none; b=bgiwuw5iV2B5BiZufAimHp+X4Ti9tQJn6HivGbJgDZSsrGU5kDC529vUuendPOUXWlFk+7L6NGSrUdJmd1Fw94u6yKJoK8+G4pCucCt1PlmINd+VB5WXlEqe89JtN5N6d6N920cVAX7IFDfHCGxnb2AU+O9er+laxp1EBNZNT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020947; c=relaxed/simple;
	bh=uGWUfxnxIY0NKJB4tV1A7WYuOfk3qaqaeqns9woe9G0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4ZUbGX3PukMj2kIflYR2xmZqGAcHdqjqPRjgNJ+CTkSbBx20fiJNRLMdhwfFl+VmryCjQ936E0afyjYSjYnJZDj/NMeRAx1JOOqe5/RGzChLS87hXZ30d7sPogPtvw/DAT0n+aKFUP+5AFEJC4TuiyUuYUwpLNnfTX7gGdRKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BhxCTw10; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BhxCTw10"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso15902815e9.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784020940; x=1784625740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6rmzsH2Z8JYzFqIg2uMkj0gt9jdeZsll9yf1qnb10c=;
        b=BhxCTw10pMGuJ7cWbSUGb7gGi/Cj/kbJHXgvc42Y01vMdyqMjCLZNlelC/X99G4JJp
         q1wHIDQ3tQXEozuLxJPoyo25EONtRNBnpzdUw8FgZGOKS/XisSJ5ETUWgvEkHCL+n3h2
         Mzl/YZKK9G8DkigQQpMMVYiGMS/evTk6Vn7UAxrpamUC+lCYFAOaQpImG6YCASQR3c4G
         rULR0Jk1UKH/RVvM8Sg5ToAnCnAI3XmEQ/IBMsySYN5Q2UmHcJdCkF5GEpXi/Jhu6DD9
         ezfBrQO++TlIiXUX/fWX5334IdfmpjRxNODVthDTqYfuXVDc05WQLDESOfnnNuEcOO4a
         /WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020940; x=1784625740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6rmzsH2Z8JYzFqIg2uMkj0gt9jdeZsll9yf1qnb10c=;
        b=HFBDK0kLR9mTjh4dSwlPd9hrZRnVT+06h1ZCBqSB0TelKwlzWi3pvXu3mJB1mLbhC8
         1OM2IsXjwaS3X6vIYRedNi2S+Ju3X27sNeXIKRtd+Owa5IoqkjhqNgjYViLiunxob1Ds
         gC1uGnIzeW0uDHzmTzUr2KFiuOTFs0Wd7oiNvHVAM7EpShQRcfcpb4xmuKulYbZF4wVC
         bdwB4KpuWVvot12eY2jdAXyHSM3jUo3dFOflS7ccRRzbq+BhTRWnZ39M0osWgiq/7Mxj
         lceN/xYv4idiiens4F5Jt/s4/8Y6OsEq8HkkDqvA7T0mJZbDSw/scPmRMwbDqtekx54c
         fo6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0iUmARvYWyIA3FgTrR+y9vtesJtzAlzZ5ssuZeE66r5KUzg0LUeprDeFwJPHvVpo4MbiBnHkoYnr9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5S7QSSM3DP+nsHZRdGxczM2NmUK8h24vZGhH3+rlta+5jSTA2
	n14Nev3EI2E2lTzLs0h1j3TtYfzzwwGQwHU/247H3BnRprVJ9WfvIwEsIe4juwm4NdA=
X-Gm-Gg: AfdE7cnDp0xa+oI7z7lWxaR4wxZ3votwOc+pBoWXZV2X0UIreF2e9tbaIURf7dwFAGY
	V4WHahsS0mn3eCNb1BKmD6zA+TWjkdeYhGr0LhkW5cr5vMRVPD651OqBBNZHrmf0HtWkHsPmFgQ
	XnGoWpZvovIHbEVEnPQ3nwi13Fy7WbL/Gh0drAMvHgSSj6lmt9DgU8kNPAop+b8wjeGG8Pt29FV
	OHRqwaAYdy9I+cIciVTEhli4+QPZPNCnKOmqt/Aupje/FMiECQ6lH3m9HmOdBorLqiF4WMmIrba
	rXHGDqmeMqyX9sh/WfuFASVNcJGpi1SEql7Chf3w20Wd3JEiiqUn7dfsD9uUcmxtIVT0xqMzjl7
	F+q0ZMdEsAOemwLIJu+NeE/QWZL2M6soFJ8PP0i5CFdOW0xppcOSFb/YXt9BA/fUAG7u1T4Zck7
	IycCfRsXYO5z4=
X-Received: by 2002:a05:600c:524b:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-495159060f6mr32557165e9.24.1784020940226;
        Tue, 14 Jul 2026 02:22:20 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm214271875e9.2.2026.07.14.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:22:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 14 Jul 2026 11:25:48 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <alYAnJ66npeYbncs@apocalypse>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>

Hi Uwe,

On 19:05 Fri 03 Jul     , Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM
> controller with 4 output channels, alongside an RPM interface
> to read the fan speed on the Raspberry Pi 5.
> 
> Add the supporting driver.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/pwm/Kconfig   |   9 +
>  drivers/pwm/Makefile  |   1 +
>  drivers/pwm/pwm-rp1.c | 435 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 445 insertions(+)
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 

<...snip...>

> +	.driver = {
> +		.name = "rp1-pwm",
> +		.of_match_table = rp1_pwm_of_match,
> +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(rp1_pwm_driver);
> +
> +MODULE_DESCRIPTION("RP1 PWM driver");
> +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.3
>

I didn't get any feedback after I replied to Sashiko's latest concerns, which I
don't think are relevant. Can we proceed with this patch or are there other 
concerns about it?

Many thanks,
Andrea
