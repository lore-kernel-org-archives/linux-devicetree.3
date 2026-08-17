Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA13F7899
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967988; cv=none; b=mPn3LABtJrGXeD7yedtcDhgDusupYafsO0mQbii1LSnHoSIrL/rxfv8QrNEMFElYdXttbAqUPyzroQ7jsVVFYjXXXd7TrQSwaZryxatj/5ypuAn3tj54WQoGK6EYCFBGdO5wFCUzWU8qkvRk0h7zEBE9fUphu2KcCVHgVmIdmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967988; c=relaxed/simple;
	bh=bfCLNI1PRMYnsjfBYgdj4X+i/++F7HwXsOs4ZT1LSGk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAVHIZ8AYqiRWFXqapHzbWVBDNZZ0P4vCMmbBFkBA3Ws+l/URgNxdUriC7qQDN4i4DJCKUK9gWrx5ZMDC1IxH964HTESwYUkiJ8v6j3ftAJlzPxC+TSzfhfTgCiiOnUb+BkZsyo7IEnIlG/NgVdJ69rRc+Mi0jvQCLDDvazq0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUxQy59N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUxQy59N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so24157745e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967985; x=1787572785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCkUaJwsiIx2/8B6UmuqctR4tL1PfcLhtviHSxv/jPY=;
        b=LUxQy59NcPTaS03F/TV+DFkuyFXvwbGh8PVJP1SfFSAR+Pv5kEmUDe6mDZlX+JY3BW
         Xv8Ui+UlacrN6oXSSgUt04WMvBJY94uq0dp4Mv+VH2eE6QTjRLPyi9V4m7OlxbPBZxaf
         RUp4W3QKozU/DYdPO8BN0qBjr6NBgLKUBg0OJ8Ajyxrb7uGbZVq6wvmefEUK8EXJAGo4
         cu+FpcsUa2MNKUfF7p6NrzTTCr7B0Q5X7/QJkf2eJxdAtWQ9mCz3BO+Vihnk0UDumJOI
         gUi1TUdUis7aKQTa8daCoFec7p3uPolEHTNiFXOEBj536+VUu8br0fhPHy1HQQl9/BPt
         EeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967985; x=1787572785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCkUaJwsiIx2/8B6UmuqctR4tL1PfcLhtviHSxv/jPY=;
        b=HYiVmqwXc+BkpCrvuZG+Htb0dfuqhSe0Bwa+D10DbMLgYW8rirQDKuCAyaOO0kr8OW
         9zIoTTfgCfLhyzBcmv2kIwlM4J/AOPoWcpy4US9V/hg33cU4lXlD7dgCJA5yVoItBaLt
         KtqdchvbJsBOGw8m5Fz8tDUxBDXRQiTgY03gMlQpS7YVPYyHy0e5fkMviS92JaxzjKub
         r5KFwVej0rY9lW+2UkcpAvhgCudINV8tbYXXRIBcdYs1UFoJThJG9rZYi4lfyrwzyx9f
         bI7UoXy8qtOKOtbRzeFyjha0zpGpLaciu+bGwLHVWaGTP5nazZ2MQZui5za2fc+SDl+Y
         2lcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7AexZkDOJePLKtokwpvdr/A78KmDfH37fJQ0jjfcnzs5LHttktLoIskRmbjsaCHgxtk/LU+8F7TDY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vzmNiE6sfC1r9zwtcocipv4R7WglVDdEpXJBwgpLF+hObT1U
	0mPzI1r32IsSVEOhSAzVbK091YQFGtQMC6CsFu8jQV5lbWgqE9HEibET
X-Gm-Gg: AR+sD10dfV4f8ZJFooOEs+ADTPJyHg+CDQxmPM4GHYI3n08OE4iwbXw6Go7LmMrmVbJ
	YPEnock81C26jMZ/JWwlC2niDhQw3V5w2ueIe9TVegNOJoQDTaTcMIgJHVeYPpV8GYIfaqzNLRp
	n0N12scWbVO2xakVS0ntX469+brrMXAinMxGT9tK5LrwCpkhlXruOmecGwhjDxHDa7PilhM1c4C
	VnB8lj8Emi6Eu700RUUYYhjAHm4eJOQSalmQdyeqN4cSh+FpEeSPcCls6f4kznUgQ7sf56CmYK6
	nC+dm4Sgl2h5m3i2X9OQgFTYbIZ7ghxWH/gWe/Qx44BcsN6baKODPfIcen7OS/smn8b4CP0asof
	r9hI0zRxeii4ttGE7JvPmzvm0DiQEdU4HKsofdcd1GsYJPCp90DyAZN2ahPEsh72htmA7BM7Trt
	XaizDD3AXtrcflLaBUaNjvKmxdErSe8Z/6rWSB7Y6SdowAnk1+j16U4K7zRyxaIFuWbqf1d6eXr
	P1VVkiS0q8vsWKsOjDa9B8edKfv0H70REu2tpoPiM7jcu2QEW0xNOraIm3Ef9sCmRCyfHIbjOFV
	y4OGWbkqmTb3x2DigcJ2wiNNmeY30Ti2Y7GGMpx6lg3IWZQ45mpyODWMZLPBkdrbjvda0GMQ/J/
	mFF3uPRMELGAXsiqJ25XxI6wED7HCrGB0c04HKMAaudrpSzITy6pejTRDpryM3eu2mPvivQ==
X-Received: by 2002:a05:600c:3b90:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49987a4f131mr325063325e9.1.1786967985143;
        Mon, 17 Aug 2026 04:59:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499961098cdsm162556715e9.6.2026.08.17.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:59:45 -0700 (PDT)
Date: Mon, 17 Aug 2026 13:59:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Petar Stepanovic
 <pstepanovic@axiado.com>, Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit Shah
 <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260817135920.0000461d@gmail.com>
In-Reply-To: <20260817034541.053dac28@jic23-huawei>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
	<20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
	<anoYDi-bt-t6ZeeD@ashevche-desk.local>
	<20260817034541.053dac28@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 03:45:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 10 Aug 2026 21:27:26 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Mon, Aug 10, 2026 at 07:49:36AM -0700, Petar Stepanovic wrote:  
> > > Add support for the SARADC controller found on Axiado AX3000 and
> > > AX3005 SoCs.
> > > 
> > > The driver supports single-shot voltage reads through the IIO
> > > subsystem. The number of available input channels is selected from
> > > the SoC match data, allowing AX3000 and AX3005 variants to use the
> > > same driver.    
> > 
> > ...
> >   
> > > +/* MANUAL_CTRL register fields */    
> > 
> > ^^^
> >   
> > > +#define AX_SARADC_MANUAL_CTRL_ENABLE	BIT(0)
> > > +#define AX_SARADC_MANUAL_CTRL_CH_SEL_MASK	GENMASK(4, 1)
> > > +
> > > +#define AX_RESOLUTION_BITS	10
> > > +#define AX_SARADC_CONV_CYCLES	13
> > > +#define AX_SARADC_CONV_DELAY_MARGIN_US	10
> > > +
> > > +struct axiado_saradc {
> > > +	struct regmap *regmap;
> > > +	struct mutex lock; /* Serializes ADC conversions. */    
> > 
> > Choose the same style for all single-line comments (here is a period present
> > while in the above, for instance, there is none).  
> 
> Hmm. It is inconsistent in other places, but those two are arguably
> correct. The second is a sentence, the first is not (no verb)
> 
> Anyhow, I did a sweep for other sentences and not all of them have
> periods.  Given the rest of the driver looked fine to me and the other
> suggestions Andy made are easy to apply.
> 
> Applied with the following diff to the testing branch of iio.git
> Note I'm fine with rebasing that (and will do on rc1 once that's available)
> so extra tags or review comments are easy to add for a few weeks at least.
> 
> Mostly I did this just to reduce how many patch sets were undergoing
> revisions... I'm still over a 100 emails to read and run out of
> time for today.
> 
> Jonathan
> 
> 
> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_saradc.c
> index daa98dd2f176..699ee31616fc 100644
> --- a/drivers/iio/adc/axiado_saradc.c
> +++ b/drivers/iio/adc/axiado_saradc.c
> @@ -34,10 +34,10 @@
>  #define AX_SARADC_GLOBAL_CTRL_PD               BIT(2)
>  #define AX_SARADC_GLOBAL_CTRL_ENABLE           BIT(0)
>  
> -/* GLOBAL_CTRL SAMPLE_MASK field value: 0 selects 16 samples */
> +/* GLOBAL_CTRL SAMPLE_MASK field value: 0 selects 16 samples. */
>  #define AX_SARADC_GLOBAL_CTRL_SAMPLE_16        0
>  
> -/* GLOBAL_CTRL MODE_MASK field value: 1 selects manual mode */
> +/* GLOBAL_CTRL MODE_MASK field value: 1 selects manual mode. */
>  #define AX_SARADC_GLOBAL_CTRL_MODE_MANUAL      1
>  
>  /* MANUAL_CTRL register fields */
> @@ -76,16 +76,15 @@ static int axiado_saradc_conversion(struct axiado_saradc *info,
>  
>         guard(mutex)(&info->lock);
>  
> -       /* Select the channel to be used and trigger conversion */
> +       /* Select the channel to be used and trigger conversion. */
>         ret = regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
>                            AX_SARADC_MANUAL_CTRL_ENABLE |
>                            FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
>         if (ret)
>                 return ret;
>  
> -       /* Hardware requires 13 conversion cycles at clk_rate */
> -       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> -                            info->clk_rate);
> +       /* Hardware requires 13 conversion cycles at clk_rate. */
> +       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC, info->clk_rate);
>         fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
>  
>         ret = regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> @@ -220,7 +219,7 @@ static int axiado_saradc_probe(struct platform_device *pdev)
>  
>         soc_data = device_get_match_data(dev);
>         if (!soc_data)
> -               return dev_err_probe(dev, -EINVAL, "failed to get match data\n");
> +               return dev_err_probe(dev, -ENODATA, "failed to get match data\n");
> >   
> > > +	unsigned long clk_rate;
> > > +	int vref_uV;
> > > +};    
> > 
> > ...
> >   
> > > +static int axiado_saradc_conversion(struct axiado_saradc *info,
> > > +				    struct iio_chan_spec const *chan, int *val)
> > > +{
> > > +	unsigned long usecs;
> > > +	unsigned int regval;
> > > +	int ret;
> > > +
> > > +	guard(mutex)(&info->lock);
> > > +
> > > +	/* Select the channel to be used and trigger conversion */
> > > +	ret = regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
> > > +			   AX_SARADC_MANUAL_CTRL_ENABLE |
> > > +			   FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Hardware requires 13 conversion cycles at clk_rate */    
> >   
> > > +	usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> > > +			     info->clk_rate);    
> > 
> > I think it's okay to have this on a single line (83 characters).
> >   
> > > +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
> > > +
> > > +	ret = regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> > > +
> > > +	/* Best effort to stop manual conversion. */
> > > +	regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG, 0);
> > > +
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*val = regval & GENMASK(AX_RESOLUTION_BITS - 1, 0);
> > > +
> > > +	return 0;
> > > +}    
> > 
> > ...
> >   
> > > +	soc_data = device_get_match_data(dev);
> > > +	if (!soc_data)
> > > +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");    
> > 
> > -ENODATA
> >   
> 
> 

With the diff Jonathan sent in mind,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
