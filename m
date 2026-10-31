Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456158;
	b=cBMBp+O706KNyiM10lnoQhS2x+4xH68A5a+KQ5Ng48jlGgak9P9DkLkX8Lhd/FlKJBzB
	 OKkhH7DDRTpWLpEcl8bM0n8d0S614T5AErnqgwcEwnFCBVndj4kXwujMV6iJJG/smEap/
	 U4+WhBOzdY+wllER/09efXdrcX/4vbs98HTzLZrUWOVV0F1iE3ufzshgwi9YxrR2BfYVl
	 fYiWdcLk7aUlRoK+e2V1je+dKDtfOYG6AV9JtAGKn/K4QkdnJIcjGBEZl0VUH3IdbwN6H
	 B22szfx+h0I7EOWa/31MIsPgkn4JduP5SuOxctMRwba6gCMqceNNp9XH5gQnlaEHKuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
	b=AoGfySQgTqBHwa9toloqyOaYvrHqBAzZomT6WJQO7RWM1+DzItWFCTlWQQMFjhGcn13k
	 pyiN+uPJBhWdKXPURknWMV/e5Nu1H1xaNh79CqbjUzb+f0/nYEBRvKEuPNN85msH4UcGE
	 VgWUTaYDZTK47LOSf4pWDagBt372hPaIcuVS+a/JpjPGdh9OQwQ0HmJJFvlDt66wjPaf0
	 nF84wvdLRSqgKoVBwuaXusrmM+vBNNtlnQqFKojB1tuIflX7qkxUdST+AecI738pXC7xf
	 zrMsTVCHoYUubPW9r53wM0avr1X2PP66JrPF0+XqSQZfZTG0BemXytUEbg/E1H0y6gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B92606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9995ce866so14032495ad.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456157; x=1794060957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=IK25MfUbibJHZUCnSy2S2WtN6BBRl4Wc0Ck8mJ2goevSyMxcRwogr+b0tBucuBqDir
         viXNGP5/fkKG65t/UebwN5ESDx3o9MkaCjiN+I8661dR4ti74jf66KO69msGBzQzfVNh
         Lc+oueTWrXa+fTRTWK7tpTHHo4R+TOQfoIYojkroNPSBvrwchRzlwAGgEJoWrfWm9lkP
         9wna8rK3tDwdZDhgd1beGnrlMF7A4DTG3DubG4jSwjKtJ7DZ3ArGCKIngcvwgJhb2+kO
         AVZcVTl958lPkczzXxQCZpZzfY/+fYk/fwqcjTLKHtzwm/5o/BYPmOAV/slCIuEjvEoF
         sTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456157; x=1794060957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=R8zifVooQ69vjSk2im9dujLJh19WLL+PC16NB6TGH8AO2XHmXs/1XEm+9CUeSnUaZn
         7kahmBedI5SDIRCWkqkn4LPqO6p0pRpRTFmQdBv7Cv0KO1yiEFLKsyO96iePVCusnMtv
         jRjN8gJc+2dl2LKctvJXFypIIyKCKp86YlRMEGrZUSnwgRJWTUAvCEiPnR820AP8RMzS
         b8A6NNWIPsR+IVLTy6ZJG7Vj7+su1GUvBgRjgnUgKnSUr71DMaXuO3TxPa9KyLGRmoL7
         1Mes5KbvaTdgSg0S3MZhPm51EH9owTbAoZij+5CHIC8SwH/APwOaFWM6lu56hf8CXnNu
         ZseA==
X-Forwarded-Encrypted: i=1; AKwUvBxKe7CcU6JC/t7iusnr0nh69fmjXkgwpq0F9n4j5zNOpaQ8yI1/3Em1dRbhPDhSUPTDK5ZkZ/QpQ19i@vger.kernel.org
X-Gm-Message-State: AFq9FYJCJ694+SCMPppyuMSJewKq0zp/mCJXFgP1OldrzDOA9DKaFsNz
	CKURjC0n0IPmZzwYPhIS18FEiISfsT1jkHbko4OxUjoV6L1b3m9SzDKr
X-Gm-Gg: AYBFou1ecTfKQCGdSNx5kZ5rYZLX0PPr9wblVJGFQWLYAhyWWXYYqohJCGy8ZLvUc76
	vOIgUSfjbmooWbm0d3lzwi4Elchi/tE9cWwz1Us/mj2g/0i2za9qG6erOSeKMk6xD9Dk6Bn/f90
	ZGCbtnbT2P3S2uAmus2pgNotWaHpvJPpWiF9+4/v8ZpsFdIlhXY/4K03WGtk386jAOpPJ3VcuGf
	3SuZJ86PxtF8Jb8WOrZFaeGWzOXBfkk8iyTPPwhTDwi1sNqME7qjslsf2xvWMlZ9aXkDU8KalUb
	wHKoatHFTByXe8smTDWyhZuQ85Y6oWSaQB8vxGm1flrnwuhEvRtHdANv+91Y+jZtZnFpLr386As
	+4NspJo4+3N/vAbWVpQgDlHCX1X07Ak12LoaTG9wS1LjY4CLoKtKnpPIgORQmQniyVQ8Z1sMKbC
	GSCeZITsovopzj2m+DnNaYZItXjggXbvj1Xdb0K1B9rU3XlrHXlAgylSxzDAFXYLQLJchj7k4vD
	mwme5quGwQgRav+HjXTw6DV/T+LX0BQ7eDNoYwHETre0vgKM0IcSnmmcIoAKPXK3ivsSjFTUN5u
	l9vZtXGaWgiTCxS4VjND5ORja0EITQOYpcq4l1oA
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr52661215ad.49.1793456156941;
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm15743805ad.0.2026.10.31.07.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: broonie@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
Date: Sat, 31 Oct 2026 22:15:46 +0800
Message-ID: <20261031141546.153385-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179330018771.62540.301527067818961107.b4-review@b4>
References: <179330018771.62540.301527067818961107.b4-review@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for your review.

> > Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
> > converter controlled over I2C. The device outputs PDM data to the SoC
> > PDM controller and is configured through registers for supply voltage,
> > analog front-end and per-channel PGA gain.
> 
> This looks pretty good, a few relatively minor issues below but nothing
> major.
> 
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -1274,6 +1274,16 @@ config SND_SOC_HDMI_CODEC
> >  config SND_SOC_ES7134
> >  	tristate "Everest Semi ES7134 CODEC"
> >  
> > +config SND_SOC_ES7202
> > +	tristate "Everest Semi ES7202 CODEC"
> > +	depends on I2C
> > +	select REGMAP_I2C
> 
> You should also add this to SND_SOC_ALL_CODECS.

Added.

> 
> > --- /dev/null
> > +++ b/sound/soc/codecs/es7202.c
> > @@ -0,0 +1,367 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2020 Everest Semiconductor Co Ltd.,
> > + * Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > + */
> 
> Please make the whole comment block C++ so things look more intentional.

Done.

> 
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> 
> linux/of.h and sound/pcm_params.h aren't needed I think.
> 
Right, both removed.

> > +static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +	/* status and device-id registers are read-only, never cached */
> > +	return reg == ES7202_CHIP_STA ||
> > +	       reg == ES7202_DEV_ID1 ||
> > +	       reg == ES7202_DEV_ID0;
> > +}
> 
> A switch statement would be neater and would probably generate
> equivalent code.  Are you sure that the ID registers are actually
> volatile, that's quite unusual?  If they've volatile the hardware is
> accessed on each read, if you just omit the default then they will be
> cached after the first read.
> 

Thanks for catching this. The ID registers are static and don't need
volatile marking. I'll drop them from es7202_volatile_reg() and use
.writeable_reg to make them read-only, so they are still cached after
the first read but skipped by regcache_sync().

> Also should the rest register be uncached so we don't try to write it
> back out as part of a cache sync by mistake?
> 

Agreed, I missed this. I'll mark ES7202_RESET volatile so it can't be
written back during a cache sync.

> > +static const struct regmap_config es7202_regmap = {
> > +	.reg_bits	= 8,
> > +	.val_bits	= 8,
> > +	.max_register	= ES7202_DEV_ID0,
> > +	.reg_defaults	= es7202_reg_defaults,
> > +	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
> > +	.volatile_reg	= es7202_volatile_reg,
> > +	.cache_type	= REGCACHE_MAPLE,
> 
> I notice that other Everest devices set use_single_read and
> use_single_write - especially for write we can easily trigger
> multi-register write as part of a regcache sync so if the device lacks
> support it'll create bugs.
> 

Thanks. The other Everest codecs are the only precedent here - the
ES7202 datasheet does not document multi-register (auto-increment)
writes, so I cannot rely on them. I'll set use_single_read and
use_single_write so a regcache sync can never turn into a burst write.

> > +	es7202->supply = devm_regulator_get_optional(dev, "vdd");
> > +	if (IS_ERR(es7202->supply)) {
> 
> Unless the device can operate without power this should be a normal
> regulator_get(), the core will substitude a dummy regulator if it's not
> configurd by the firmware.
> 

Right, VDD supply is required. I'll use devm_regulator_get() instead.

I'll send a v3 with these changes.

> -- 
> Mark Brown <broonie@kernel.org>

