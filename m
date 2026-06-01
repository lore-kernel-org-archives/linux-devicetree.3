Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B641D3D969D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328766; cv=none; b=Oucfaj5OW7B3eZop6fdHolJ+rog5gRLXt1dQa75euYJEeaSscw6kAYjd5vSOWbu1Q2WTbvU9MD7vnizthS4oqz9LnhWaj9y4yr2wbry4l9uKVruD9o+8GUBg5D1FhgB04UR64nY/ZN0CVEf0b0pvo0P9HcVRHGu2EuK7MRHewbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328766; c=relaxed/simple;
	bh=e2pnY2qmmzkm/CpC6ZwLYOJy5t4zUkqjW0tG1nYULv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlnIfIJse7Lz04yPsxK2654qn27q4bzlrRN5pWA34PE797QMLXBoASUqr0x7J40LodlBomWHtRwYSv2pPk1nji7pQc0UOFKf+WM8poN6BvyPrOr/5winkAdOaU8RzrGuUPD99tCtBo7FtMiKKIHRyvsxl0nRsuycUv+Q/GWANEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1rc+j1k; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1rc+j1k"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137bd9ed2b1so1486820c88.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328765; x=1780933565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uG4ix1UGsv+5molCxwa32LUYrghrpeXWnN1jOsh2Dw=;
        b=k1rc+j1knhlPThDKffLia5VIJJ7w800lSugbcBBBPnWEIJhFCvL4pFcNpiSvJXYqgl
         shjQ1obNdTDq5bWDlD27FBMrge2wT6om1wkf2iGCIthVcInZmj+of2aJV5KFgnYaDXWx
         ZRHD1q/OASX1LatyfFC07XN794yKaaiqpOKdSsdAJtCdcQa5EwrUlB5P1En+nuDGr8c7
         KFLtcA098WkH8S1O6S/gvF96oGAqlVKqCCEpqvvcrJCKirXx1Q7JN/1BlQU6WA3t+D6Z
         TfPMOMH1EOsSZBQSmFMoYzprSlLQuAdHB9ySl3aI2zDgYIknThVNFbQCgD/2LSU7WhBA
         PCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328765; x=1780933565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3uG4ix1UGsv+5molCxwa32LUYrghrpeXWnN1jOsh2Dw=;
        b=HVR8SEiG3mvzsDhcrudr3IqRIjCaOMFPv6VQZ3HDw5kTvbH3eU065klG7v0UelCUrZ
         l5sWf8mRa+uvF3qwI4UiajudK0Ix34LDOgMIoZnoxkd/aNUBKlYgUea8rgToFQOsWyn/
         LPwpbWWSOR9K+TBkISiCzNDbZvlXWLYQZvSBSBNL5/OdFGwdvIRW39BQXE7FQ0sqodyR
         pZ/RrOY5MskOT32DmV1K0CDmeC2HwfS49fpZ/tO26WiLIBU8rmf8SejHJozcVcxm9mtw
         JNX8F+5q79pqwLYZHfuq5cTCswB+4+cTjvw0L+2FZ5BWUx19Jy3A91mbbMPCU5pkhwhL
         OnsA==
X-Forwarded-Encrypted: i=1; AFNElJ9NfxyihMpdP25lpm23hlI2Hq1HU35mNLT95ZNjTulhYCu55kp7mceO5Y6cmk7hgNeLzYo+f9jooqFI@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDZI+oJ3WgmO4ps4TnrbY41rdxouj1wyBZJQkCD/veq24xPhH
	f8k2S/8TMhhW8BJLbWoxpaT/sOMSy2AUOw1vNEtS9TLjJbAz6MUzXdCj
X-Gm-Gg: Acq92OHsuOBGtIhLtIS9nYDhbFi59git2pZH8rhjhdimpqJNoVJDujdkk5M8/whxgEo
	GkyJZxj2ErpBkhhTHkw7z1Gb3SgX8HcQbkM7wG/ErGPrTW5QkV5c03DADjC80cJMkVy/ywkWPl/
	ztH4j68Jb+sMNP60pCjP00KlXzO5C9w3mqwmf3AjqeTrTo+1Buc3dm/YUf/Ek32jZzgYTssCb5o
	6HTSuy+KfwK56gwh5BH3jVXVS107D4ycgqxzSYy6O7jmVfynD+FuOkZfdOyCrfTLyx/sDfj8pmY
	8hw4KzkLn0JJ/u3IWOcDtNjaIMAXcPcyxWUMOfDyq2Nz3F1Q2PzoDvdNs5TIiRsxKZCLOkeundN
	dCa0m2FIlzOimWs1eQddwN/WyybeWGbnKQx3gb8ucCkfQCwq4ImDQ9/nyXkXKSEjiHYqv72fqbK
	73blAj6A8usQOoGFRpqIJiOY5lHg6QQUF7ELX/kpRqLz07zOCoNA==
X-Received: by 2002:a05:7022:117:b0:11a:e426:911a with SMTP id a92af1059eb24-137d3f132bbmr6136731c88.15.1780328764643;
        Mon, 01 Jun 2026 08:46:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b36aef95sm6996203c88.4.2026.06.01.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:46:04 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lee@kernel.org
Cc: conor+dt@kernel.org,
	daniel@zonque.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	robh@kernel.org
Subject: Re: [PATCH v7 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Mon,  1 Jun 2026 23:45:57 +0800
Message-ID: <20260601154557.1675809-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527151929.GB712405@google.com>
References: <20260527151929.GB712405@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Wed, 20 May 2026, Jun Yan wrote:
> 
> > commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> > swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().
> > 
> > This causes the PWM frequency configuration programmed in
> > is31fl32xx_parse_dt() to be overwritten by the register reset
> > operation performed in is31fl32xx_init_regs().
> > 
> > Move the PWM frequency setting logic from is31fl32xx_parse_dt() to
> > is31fl32xx_init_regs() and separates device tree parsing from hardware
> > initialization.
> > 
> > Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> > index 2d7ff4c5a08c..c545a3b7a05a 100644
> > --- a/drivers/leds/leds-is31fl32xx.c
> > +++ b/drivers/leds/leds-is31fl32xx.c
> > @@ -63,6 +63,7 @@ struct is31fl32xx_priv {
> >  	struct i2c_client *client;
> >  	struct gpio_desc *powerdown_gpio;
> >  	unsigned int num_leds;
> > +	bool pwm_22khz;
> >  	struct is31fl32xx_led_data leds[];
> >  };
> >  
> > @@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> > +		priv->pwm_22khz) {
> 
> Nit: No need to wrap here.  Use up to 100-chars to beautify.

OK.

> 
> > +		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> > +							IS31FL32XX_PWM_FREQUENCY_22KHZ);
> 
> Nit: Line-up with the '('.

Got it.

Thanks for the review, will fix everything in v8.

> 
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	/*
> >  	 * Set enable bit for all channels.
> >  	 * We will control state with PWM registers alone.
> > @@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
> >  static int is31fl32xx_parse_dt(struct device *dev,
> >  			       struct is31fl32xx_priv *priv)
> >  {
> > -	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> >  	int ret = 0;
> >  
> >  	/* Driving this GPIO line low takes the chip out of shutdown,
> > @@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
> >  		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> >  				"Failed to get powerdown gpio\n");
> >  
> > -	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
> > -	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> > -
> > -		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> > -				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> > -
> > -		if (ret) {
> > -			dev_err(dev, "Failed to write output PWM frequency register\n");
> > -			return ret;
> > -		}
> > -	}
> > +	priv->pwm_22khz = of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm");
> >  
> >  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> >  		struct led_init_data init_data = {};
> > -- 
> > 2.54.0
> > 
> > 
> 
> -- 
> Lee Jones
> 
