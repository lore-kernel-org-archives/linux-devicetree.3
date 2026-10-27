Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109464;
	b=MrLHLWkaQabo/oqZA+XP3gQRpHT+WTL8CFXmsRYlq8dQ9/M8uSfhwSNQSdZxVxmqBnSR
	 rCFVrgQTPC4byC4JcIKUSbu73Fzt8QQW0ryxG1yKSDNXZUZlL11dPQOPz7oRfA++JeC0d
	 aqmjZOloULPm0dytuWfe/bQ1FIK0hIJgHUNFnTQy52qI5kXAfRQ9Z/76keg7QOP2yYTWT
	 IHXkebW73iX7iy0f/rmbizGy2Z1VUcWLGqjA6uzOXpUXGf3xXILftXHMgGKvJxF7EkXB4
	 Bg+idwgTbR1ausmsOQFveUfn/T3/Z69c7KT/u8Kf3CJrZYD0YGi6xc+KQgZScqLd/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
	b=Ib/wmP3q6FnD28QQwV4rtWtEFFxxa3xZG8XHOH8RcVoPcX/GREAJL8Gr5coYbso70Z6t
	 ljP07+eABCHzxMomUE+cT3iu3txTV9YI1GV9h1ApnlJc83aZlMy10wbuPMMRfOIqrfs6N
	 5qYXpSCh5GoDG6xyQAhjf8pwut27EdpBNG1P/+Xti46m+/52RVBHN2D/RzX+OdDIEM8KG
	 R2NLmIit2/2ZFkZbvFcEtYFWTVjCTNHIYSqHlG1HHaKyYFPX0p/HCT4ferWxvVqvKa2yI
	 qMqq/DBwVkti2OUlLNqTGpILvHeI+zb61v626f3+fNQC/Bienz//WGT8PJ13xzJReGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkbsQAyX;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06189606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06189606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkbsQAyX
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so2992535e0c.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793109462; x=1793714262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
        b=TkbsQAyXGKVOh4P3gGZJI3I5gIw8bdysgrfJs2qaOq5U87UCo/FrqhcislapkmmaJK
         yl5BH3bbzhb75Sbi9Z+GxS0lf9Irzn2mIqo5OcjlZowzCldQCBzz0W9naKDbEu/OlkwL
         8drVocRWTD3jV7+RG4lY2vpoL0vzyLROw4V04gVEr7wvsdUlc0GMwX7KWRgvPzysN45/
         +rH2u92AQMv0X1jRcNjIkiKr2wEo5jwTeLGGJv8u3/Ao7Bz0/3xTYwsFpdh4XgiL/kPO
         xvpsZemcTVp/ZpF6rqG3JMsFYiSkVTRs3fxCXL6z3VNXzRA7pPlTuQcPULdsmIzLaBE+
         oUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109462; x=1793714262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
        b=yiBf7vKyKWaVwYK4bXjjAkXWQxUWYnpQFOH/HyUkjruAL4dMZpCTEpV5gJCwZtCXxg
         wNH6lXPO8X3ubFOcbCIko0FYVHXUtTdOwl/AtpaPkb6xrGJXtQrNvKB769no3D/Owwgp
         PUoQZocm02nZYP1fuddXApCmhfKYDRGKs2Y/V74W9o2j5Q0NK5DE0oTS/loU1FT1j1yy
         xLNUgiAMgYzQxdq+DUkaKQFNaHy3nmeygMtUDmllEZMUcFwkSQK0ydVJWzvHb2YQ3G07
         Q/HGI3Gk5NS0dmyO0f6+ZF6fNnxIo/wDIkdtRLOAQR06O75hJJfqdfvf+k1dyVIXURjY
         1f3g==
X-Forwarded-Encrypted: i=1; AKwUvByUrLQ/mWQ1AltfUb/UfE0Z5wtYxWuUauUgm2QrCLriEh/1GFCxZ3SZ+7QF00QtnzgRGjIm3BZGjEuV@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5JrCGmduEGJd/ch4oFEHtKE6UU1zxqCrb4u6laNJeQmAK1xR
	7oiEmET/nOhPNt5Vw1tD4eRw6t7iviw31aJe5jfaHrWnuCGJUFvNlpl/pOBT8/CIDLL1+sDhfhW
	B+IpL/Q4=
X-Gm-Gg: AYBFou0K9pk+g9dKSDzhN1suyVSY6guW0/b0eYfcfVkseSVEtEJT4bj7+bSEiR55/3t
	zolAtzKFOAXnrqXYVEwhy0lWbuTPVlPpp/ki9m+nrJ9wxmi45DffidDyTMBXi4UZ9aQOIVOkN9U
	7RQmqbAoXwOkHguhwiOltvHlvVJ1F2ONNdZQ4ZBMFF0m7PnFtO11qkqGpQc6auqCNw7m+uf0M/P
	7Y2VvGOXhXgEdIvGxlyFryCxpiSL+22HeF9qLXEbE9svy+qPtlEl0lXwc1fyo3IYGqe+BbnO6Hf
	36ZV5PM6/5dsUHCGssziPfb4B4IX4rbLOCQ3M375MVFb4dF5qVpY3jMg1hwBFziifJ9fv+8KHYo
	q4/O7Izu3FE7GoYS7u3/Aq+tyS04MZpCAYpQ0rs9RMf8H1qeQC51pf4U/gcXQE4KBml2P8Z5fls
	1VGZHrSTb7iZ0xKAuQxYMboxq1sS3RPUP99wXCLz7Qz9tChwh98s/QbZHxUQv2+d9gnhM1HUCC4
	9ejDrqlRt8ICX9u5bBiq7rNA9nGVBpwhvJjhw0iPuSs1ycxXgFH73U1A5t2aaQe3Xd7jO24lQVM
	Tc7Htl6H/ERA0w==
X-Received: by 2002:a05:6122:1c07:b0:5ea:a1ad:6376 with SMTP id 71dfb90a1353d-5ec230a26b8mr4056026e0c.1.1793109461968;
        Tue, 27 Oct 2026 06:57:41 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec2343a846sm11578284e0c.10.2026.10.27.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:57:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:57:29 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Message-ID: <auCsaQt0kda01tZ4@hiagonb>
References: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>
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
In-Reply-To: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>

Hello all,

On Fri, May 09, 2025 at 11:45:42AM +0200, Thomas Bonnefille wrote:
> The Sophgo CV1800 chip provides a set of four independent
> PWM channel outputs.
> This series adds PWM controller support for Sophgo cv1800.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> [Thomas since v8]
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

I see this series is abandoned. I worked on a patch to enable PWM for
cv1800b reusing pwm-sophgo-sg2042.c driver [1], as Uwe asked.

Is it ok if I take over this patch?

If yes, I will wait v7.4-rc1 and send the new series.

[1] https://github.com/hiagofranco/linux/tree/v7.3-milkv-duo-pwm

> ---
> Changes in v8:
> - Rewrote supported frequency
> - Hardcoded HLPERIOD_BASE and PERIDO_BASE
> - Change usage of update_bits to set/clear bits when needed
> - Rewrote construct of enablement of PWM
> - Fixed OE activation
> - Fixed hw state modification in case where pwm value cannot be reached
> - Renamed variables
> - Errors out for new cases
> - Reworded some comments
> 
> v7: https://lore.kernel.org/linux-pwm/20240501083242.773305-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v7:
> - add detailed Limitations
> - using BIT(n) instead BIT(0) << n
> - use 0 instead of disable macro
> - modify OE judgment criteria
> - add devm_regmap_init_mmio error message
> - delete unused variable
> 
> v6: https://lore.kernel.org/all/20240406063413.3334639-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v6:
> - delete the OE function because we plan to use the counter subsystem
>   instead of capture, so there is no need to reuse this code.
> - fix set polarity reverse error.
> 
> v5: https://lore.kernel.org/all/20240314100131.323540-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v5:
> - drop filename
> - fix macro
> - optimize cv1800_pwm_set_polarity()
> - optimize cv1800_pwm_set_oe()
> - add comment for cv1800_pwm_set_oe()
> - use ticks replace tem
> - fix duty_cycle larger than period_val
> - use devm_clk_rate_exclusive_get() replace
>   clk_rate_exclusive_get()
> - map linux polarity to register polarity 
> 
> v4: https://lore.kernel.org/all/20240304085933.1246964-1-qiujingbao.dlmu@gmail.com/
> 
> datasheet Link: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> page 614
> 
> Changes in v4:
> - use macro instead of npwm number
> - add support for polarity feature
> - add support for Output-Enable/OE feature
> 
> v3: https://lore.kernel.org/all/20240223082014.109385-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v3:
> - use 0x08 instead of macro
> - split if statements based on conditions
> - in order to round up, first calculate the
>   number of high-level cycles, then subtract
>   it from the PERIOD to obtain the number of HLPERIOD
> - use new pwmchip_alloc() API instead of old style
> 
> v2: https://lore.kernel.org/all/20240212121729.1086718-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v2:
> - drop full stop from subject
> - re-order maintainers and description
> - pass checkpatch.pl --strict
> - fix naming errors
> - add "Limitations" section
> - use a driver specific prefix for all defines
> - using bool instead u32 in cv1800_pwm_enable
> - check and set state->polarity
> - use mul_u64_u64_div_u64
> - use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
> - using macro definitions instead of shift operations
> - remove shift operation on 0
> - use priv replace cv_pwm
> - hardcode npwm
> - set atomic to true
> - remove MODULE_ALIAS
> 
> v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/
> 
> ---
> Jingbao Qiu (2):
>       dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
>       pwm: sophgo: add pwm support for Sophgo CV1800 SoC
> 
>  .../devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml |  45 ++++
>  drivers/pwm/Kconfig                                |  10 +
>  drivers/pwm/Makefile                               |   1 +
>  drivers/pwm/pwm-cv1800.c                           | 294 +++++++++++++++++++++
>  4 files changed, 350 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-pwm_sophgo-5032b3858c27
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 

Best regards,
-- 
Hiago
