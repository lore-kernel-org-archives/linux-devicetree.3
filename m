Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CC4334DE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790516; cv=none; b=sN2cHoEcjQHKlGaUZpFFDw3B6g9eOTmtzvL7G+YEtoz8b3HBoa4jrYeB3P+FVNQE1KQHAdOXTsRFFZ8FwiL0Y8R6iEVn8UKDVGYxIDqIyS2e3pEoTMTSiwpXt8oxTVqBG3p9XNMi7GKZ8DDLatZsbNh64AYbCqkpCoXEsENS0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790516; c=relaxed/simple;
	bh=BgsAwpUzDQBIT+HF1gKLi+DdWbSVovW5ofJCSPcSdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR5xQx4Y8F6yHVEvylJtX4IKb34KHm1yUKV2W89deMzNcquRfzZC4hWCLthHcGSqT9TsA/9zUETgl/XaJnT6/rCv4x2nG9Z5thV3rs/UkdLpluEWbsDWCKjV1loO4C3GvvAGjVG6PRxp5FY1BkP4mqvjelfE5wMafbUnpbkKN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQev1zid; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQev1zid"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso191578f8f.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790513; x=1786395313; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHA0Rp1gGRF6nGr+o0rQ0J4609nkyA5NKjL7qIfbGSk=;
        b=NQev1zidKMl0D0EtPUFqv1v5jQyt4sdWZdDRDH6xOmOo2xtqdDTuUGJZOig2Lzx+J+
         W219WY9IQteJ4vV3v7t93K3bdUf+I/22pmyR0lkvNY14tW+6+C1GqHbELAGtuuro3QMx
         2ztKHawNc6hRbGJK620RRLVymUnOynC0O1VqGP8T/JIpRMnJ0M/pZvAzGthuNn32qKff
         DJm7ssww2wIHXYrXCM/bTV1mUfN1NxmO59utZcR5KYgJThVob9fScusKv9twBmspC43K
         8L4vtQXre45rcclGBAnCGJ1ezj5PTmTwDYoQeFONH4wYAOnh26qXkB5mDRzM+jEiCQzU
         LRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790513; x=1786395313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHA0Rp1gGRF6nGr+o0rQ0J4609nkyA5NKjL7qIfbGSk=;
        b=YQuiPmAXHXYpC+Q1io4Jb/6gtjVsTorzb2bvdUXNTeq4fjw9hs4/b6wcMb54Te8rol
         pEEx6H4GIisr9GcZKu9Xm55cfzV631s8Rb4LfmJ/77qoH7SKUI5eWzj1FZmis6KzPsDR
         TOnXURlHNDLk/7BIG0pipjFG08jcq4V8OzbAjPYTTP8AnVtpLVQCcPaVOZ7LVKq76//x
         qLq9+OZWLGgxD4YcYqdbqrVnDvAmtjOg8UKTRDXuPay/lm5iQMJLxojOdc23Hr/vJwQ3
         iORWf3Jiu3SA6IYvT0DkJKXNjSDabjJbkTeVr5ORC5jFLsjNuTuv/f8iHF6S04RQN9fB
         BNsA==
X-Forwarded-Encrypted: i=1; AHgh+RoJdvqESQaT0flMaA1l64vn9Pmuc1j+hX24RyXsldUi0UEFyG7ZIoM0j6dRlK6e6rp23JLkJTmCDHES@vger.kernel.org
X-Gm-Message-State: AOJu0YwElrtqxt5ThhCZUKpkJMb4vscucnWt9IUC3KzDj0TNjjpUyaO1
	YPL3DF4hcEarNWMdaYUNGYEEV97DVq37EWxonscSX3+CLE+oXLIR97rf
X-Gm-Gg: AR+sD1108SawaOiJ6SPQh7WXfEy1fnZlRMcHc1uM2ndZeVvZO3siIAa7umTL3g4Wp6i
	ZihlXRkseMg0PbMfE12qE4zHpzVTPhtYZg+i6GKUHVG0dijF0R57b0J8vxS7kn9s1op65FxnTHS
	YllX/pvW+8N3ix89CbPEMEyQDd0iU3w6nOG4NmOohKzvZdmS3XGln9WBit1Ew9DnIBo3h4M3Qlb
	VYePZ0Tic0pBP8nrRB6c+pPOP8gGcxUgB3tXFaAOz00trDHwzIKyk5e2RkO8QqZyjm0gr7cd/v7
	E6JdaubBwq9JCFTSpzTMB3V01Bvxw95gyJqENO6FT+XwkQvhCWHE/ez9M580nN3cRtS73mX8Jz8
	j/mArcr5HBqvW2SPM0HPpYbDUvfOBw5CSHV5yq0CWjcp7U2gwBX5EebFMxOiQIS++/5NGLFmh/7
	tK/Al6Aj4O2J594wuAyjdz0oVJA8pDAfaNOqW5rxk6wAtUvfjlPSX7Z/xmhOZzhM9Wbg==
X-Received: by 2002:a5d:5412:0:b0:47f:e746:dcab with SMTP id ffacd0b85a97d-47fe81b3b3fmr1985661f8f.10.1785790513110;
        Mon, 03 Aug 2026 13:55:13 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2abbsm36731917f8f.9.2026.08.03.13.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:55:12 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:53:41 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 5/8] rtc: abx80x: use regmap instead of I2C specific
 API
Message-ID: <anD_b4RX2Lz0kHs7@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-6-apokusinski01@gmail.com>
 <20260731190559.39CCB1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190559.39CCB1F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:05:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Variables declared as `int` are passed by reference to `regmap_read`, which expects an `unsigned int *`.
> --
> 
> --- Patch [5]: [PATCH v3 5/8] rtc: abx80x: use regmap instead of I2C specific API ---
> commit 5bae78c37282c7d7693255ad432126ac7e8c51f8
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: use regmap instead of I2C specific API
> 
> This commit reworks the abx80x RTC driver to use regmap API instead of 
> i2c_smbus functions. This prepares the driver for future ABX81X SPI support.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 4ac3ace687a1e..23823fc2f5458 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -221,8 +224,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >  
> >  static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  {
> > -	struct i2c_client *client = to_i2c_client(dev);
> > -	struct abx80x_priv *priv = i2c_get_clientdata(client);
> > +	struct abx80x_priv *priv = dev_get_drvdata(dev);
> >  	unsigned char buf[8];
> >  	int err, flags;
> >  
> 
> [ ... ]
> 
> >  	/* Clear the OF bit of Oscillator Status Register */
> > -	flags = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
> > -	if (flags < 0)
> > -		return flags;
> > +	err = regmap_read(priv->regmap, ABX8XX_REG_OSS, &flags);
> 
> [Severity: Low]
> Will this cause a compiler error on GCC 14+ due to incompatible pointer types?
> 
> The regmap_read() function expects an "unsigned int *" for its third argument,
> but "flags" is declared as an "int" here.
> 
> It looks like this same issue with passing an "int *" to regmap_read() also
> happens with the "flags" variable in abx80x_rtc_set_autocalibration() and
> oscillator_store(), as well as with the "data" variable in abx80x_probe().
>
I compiled this with arm-linux-gnueabihf-gcc (GCC) 15.2.1 and did not
experience any issues. But it's no big deal to have make the `flags`
variable an uint, will change that in v4
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=5
