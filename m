Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6B288C2D
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785004977; cv=none; b=KvqnQdNi1WZxqlhNLqh0u78kv83puoZnj/gumWaBHpFXqmEApHqLKuWQ4ghB0Vkc/LokbtNkhmtGHP7Qe/bn7O6ZijsmCqSelxxnu+zeO3KI08AluT4pTR3kVN3ZB7ZJFcl81aSDtLt2iIYpblNe0teeYd65O5fl00gDZz2tVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785004977; c=relaxed/simple;
	bh=srUUvtKEX0/HxmoZoGJMkwyUOLS18ex6QG639b0h75A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUZTkPlb07pcUN6pk0tthaUN3BS3+fwwcJ+mgDEZ08tlNBbQsIh3uxT/tJZMn4KZJJfyn6VcTcUEf/K32uv7mWbemsIH+5G+Uw6X3st+aiB84rbumqtYoB7aJYHcNBifUTZS7srgUR9vzempuJjbSTwXFq87aCdyODsqkZ03PaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQQ+6tA5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQQ+6tA5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so13155675e9.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785004974; x=1785609774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yim8vL4SATQPCHdmJdo+DTQlfgUOkNLfDRGu6BOoAio=;
        b=OQQ+6tA5K/Q6ibtSWEV6IggOcGSaDrqLu8ghqXk9ucbUtC8SfsSj41F/dymC9jHd2o
         x2e6lJpCb+r1kMVstAdsH8yVFyB3g5JeyCC9tocLYSkD6YdJ9nqBQ057rk+jzMFMjgJY
         NMToioIQeP8/esnn0UgQJzyzw8Ki9GSz2lijTeJHIJ8hmNnyhzuWo7yVJpui9DFeqbKW
         Ihkg4Ar8vLUkjQjXM+Q/PyswFJSb0DCm1a/M2438lqSao7uxXYUxrUYJeycDIcvNIbUF
         RexOSG5G+otuZgZ37TzdIWKSfOk85TneKUw7f8ZaXnw94prqoMoEDdQs41r3IkBxJCsf
         J1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785004974; x=1785609774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yim8vL4SATQPCHdmJdo+DTQlfgUOkNLfDRGu6BOoAio=;
        b=fWOnXhMEEHvFvAj5Cz82/+/65mDw1vkahmE8jLqTbB0EwpAhKvBi1YCpedJ1dqNCbJ
         IHlXoWFCUNgekHHxiPGA9IHlYhDCnW6CmEHzAqdVk4Fe1qv/2hoqh8vvOUMS7v1nEkpL
         OuiLHcRu28SzE65uWm5ScQSY+V37k7LQbxcD8AqkM9Fl7o8Rv4Y44RVBG0WtwRJLJyEn
         QKMAFwD5arQDIsGctPa7YCwUpy2CfmA/+4SpbxxZYKG4Lq8MMfBuqUAv7mSx/EOVjaOr
         if6wjRFGTLt9joZM8vMSg6MqZkCm+4iTq2MZs/Ug9F4znZ0ZXCsSnTHqT194w0WUHd7G
         2ENw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+9An1cQ4x/1h9moxrUVthxaNUyn5T/MP8G82b2RKqf9ugnHiEHKFpvk0ecvRWUKd7qBb727buKN1P@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR3rDreuK4YmJxE4YdvUGNSM3RL8jb2v8ivsQ7j3QwdD64u+/
	10fgLKsCY2r5EQLDwC4dWbXhQEmGYyp8sZCvUCrMfm3WnxdEzfUa9v4e
X-Gm-Gg: AR+sD12RG8c8li1jzeDzdWs0aUeJPNPEIX0VlPixdKTcLd2lS48TuKS8ENJM+JNZSpN
	AQGu8DjR0mJrfMBC/BWBOTVF/If1L/LseoqH1JDCtVZrM+qNoo/xiqQ4Tn3vCMpkY8czOklmYaw
	3YS9TbiWsJztJO7bYZrtkQWWhq+98cIf2tuq3ofnqOdn90SWEZs/Er5NfrF4EC474Ij7YKWkf9m
	HkNwWZv0zPYV5pc4G0e+9ySOfqCfo6cN7yG1n61GVIyLAiQo1rlYLSgyUnB4C2odN2ePgUutHea
	CNA3W8CSsjmIY0ymQBdBXj9QDQ5mPEdAtKs7M21tkzArOCw+KUiWNrxg7GfVqqW4fj8mss5wzj+
	8RL7HN7EmeNsnZVstMH2h747Q3tAlBYAsikzPunFYEqKcSDEM30iC+0Cl7TDNagmxjgzyUbDEZo
	N/6Q==
X-Received: by 2002:a05:600c:354f:b0:495:5062:17f9 with SMTP id 5b1f17b1804b1-496b5702398mr44354255e9.30.1785004973580;
        Sat, 25 Jul 2026 11:42:53 -0700 (PDT)
Received: from antoniarch ([78.212.96.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a5f98sm88482475e9.12.2026.07.25.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:42:53 -0700 (PDT)
Date: Sat, 25 Jul 2026 20:41:27 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/8] rtc: abx80x: add support for ABX81X
Message-ID: <amUBF4oc3YhFRUYO@antoniarch>
References: <20260725145718.14733-1-apokusinski01@gmail.com>
 <20260725145718.14733-9-apokusinski01@gmail.com>
 <20260725153032.874311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725153032.874311F000E9@smtp.kernel.org>

On Sat, Jul 25, 2026 at 03:30:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Incorrect SPI read/write flag masks invert SPI commands.
> - [Medium] Masking of valid error codes from `devm_regmap_init_*()`.
> --
> 
> --- Patch [8]: [PATCH v2 8/8] rtc: abx80x: add support for ABX81X ---
> commit f05e60a6ab0d5bdeb5665a7f2de3be7428abd444
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> Subject: rtc: abx80x: add support for ABX81X
> 
> This commit adds SPI support for the Abracon ABX81X family of RTCs. It
> introduces the required regmap configuration and SPI driver probe logic.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 7cba72656d094..46434f05a1f7a 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -1026,14 +1029,107 @@ static void abx80x_unregister_driver(void)
> >  
> >  #endif /* IS_ENABLED(CONFIG_I2C) */
> >  
> > +#if IS_ENABLED(CONFIG_SPI_MASTER)
> > +
> > +static const struct regmap_config abx80x_regmap_config_spi = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.max_register = ABX8XX_SRAM_BASE + ABX8XX_SRAM_WIN_SIZE - 1,
> > +
> > +	.rd_table = &abx80x_read_table,
> > +	.wr_table = &abx80x_write_table,
> > +
> > +	.write_flag_mask = BIT(7),
> > +};
> 
> [Severity: Medium]
> Does the hardware expect MSB=1 for writes and MSB=0 for reads? Since
> .read_flag_mask is omitted, regmap defaults it to 0. If the device expects
> the opposite (MSB=1 for reads), the SPI commands could be inverted.
Everything ok here. According to the datasheet, the MSB of the register
indicates read (if 0) or write (if 1).

> 
> [ ... ]
> > +static int abx81x_spi_probe(struct spi_device *spi)
> > +{
> > +	unsigned int part = (uintptr_t)spi_get_device_match_data(spi);
> > +	struct regmap *regmap;
> > +
> > +	regmap = devm_regmap_init_spi(spi, &abx80x_regmap_config_spi);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(&spi->dev, "Unable to allocate regmap\n");
> > +		return -EIO;
> > +	}
> 
> [Severity: Medium]
> Should this return PTR_ERR(regmap) instead of a hardcoded -EIO? Returning
> -EIO here masks the true error code from devm_regmap_init_spi() (like -ENOMEM
> or -EPROBE_DEFER), which could disrupt probe deferral logic. (It looks like
> the existing abx80x_i2c_probe() might have the same behavior.)
> 
> [ ... ]
> 
Yes, this should return PTR_ERR(), not sure why I added -EIO here...
Will change this in v3.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260725145718.14733-1-apokusinski01@gmail.com?part=8
