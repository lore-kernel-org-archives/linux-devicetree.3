Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F333438BD
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121372; cv=none; b=KEK4KFg1R+qe2bBl8QSymouBlXtnyR9xAiYfRMnFZYYNnJ27GUpNSjNmXG40a0TT6g9CCG6B0m/wEArgH18nIRWVmffEpw52IDgscqNz9s/3s7Zm89o2BnMMCQJUqkSOfHptl6kK4Ira+yqTTRH54beG9BSwFR8kyHBL7nSE4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121372; c=relaxed/simple;
	bh=3uYaubufppDh2zlD8522905eVV3UE1D7xsA+IRRaUBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtzTfx8phVdTBHiDta0cxgU/WPgS8zbtbPAgAsgJXAaj35w51i0lFVj4MdzbawQJPYrWDa6CsqB+PDw6DbdYRgsr0ymo4DYKq/3G8iaZeDnnX2gweC9qCS298mqP+HfXqArdCdwDAGtLe+dcbOMBb7khkymhcDpWqwEl5EbdckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JObYnCmB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JObYnCmB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15cd3fd760so624035766b.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121369; x=1784726169; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39O4p8PywjbL/Wcsm75xgo1hgKTORVrDEpy1E89wE+0=;
        b=JObYnCmB0zHxwpslpczj+Pjkh/tGASETakkL5UTB+RwtU3OyFZjGIfLh1rmzo/coof
         Id6oa29jYXcchkftpBYmR233HnS2/sGRft0tJHfOspgBjzUplHSQfg5tuKakiA0CoqZ/
         nW8ayhNGFSuzi7+xY21v7SOIONo3AOE/MlUpHSqTGNhN1oq6BdjiBVFSe3pCM54D/Bfo
         NgXQ8HLLdUIx4H465mPwqqQN7Vj0H0GkUzEIecnxCbJCCASe3s3S56ILoTENW7G5aqdV
         1qCbfannCoPNVSih3EwuM+JU3aNzFqOOqYOwKTOZWs2TZ8bAGifiU4QQFwmeu3V4XRmO
         Yc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121369; x=1784726169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=39O4p8PywjbL/Wcsm75xgo1hgKTORVrDEpy1E89wE+0=;
        b=kYSYawII6gWxc84wSVpbcIxBfqjNEU8TlISIeKBWl4lPZT6S8edC2/6ClQTsABKUeH
         sjWrV8GsncNkPp6w6Mi/ncNoRYUNSAf3wCv/CupOOH/HeGFKCaW1R2TNH2PtDEiAvYC8
         TVuF7G/8UZDUqUV7fMVpvgvlhDeE0jkYDVew9azMwORd3qNPFcQFqYuWG9SSKgs37YJw
         7lMIXCOO+NFV1ihsvjqLVQqK0I4mUkOBrQ7lt4k0LmkjKUBFpr/MEpBmpbIj5YxRaO/4
         cq4pNMlzZ2uc7tJ11qnZM7mQIxvadZ4vyfI3yJHS/Wvt3eVHeZ2EcSubVDu9tvbZ7kQl
         2sKw==
X-Forwarded-Encrypted: i=1; AHgh+RqUiqP37EexJ0NPjWtP2MtLYgASYbyWlT55qRBqOQl3wJTBIdBoSNtcvq68wGLyi8CL2i+RVqRhkljP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7f4deYqg5aAlqxUI3orPD3oev+fw5Cl00CIDnoTMQ4TWG0hCe
	6VM9nYScRUIjYQcnHENgFiLOEwS2dYXfdD+mmopChhvtJmuzhgcZin4q
X-Gm-Gg: AfdE7cmKKvY8Bv/FmH3YrMR5IITwXLIsiCjyeiuH8xUnd4jioaz51eKPSabfOVyzjFC
	J4N7B9O9A/BHoKJOdjcOAXwhUZwNcnjVnX4auTPSanG61MaG+1+K6oobrqWgMQWGFnq/hpRWdk9
	YI0ky5nEX4qabcoVKF+r4nlcqgZ1HUHTbCbqUPjqsUF5mHBd5k24bNkfGO5VmSk+BuukQ9YD//7
	kZu7xZHNfowp/LhlHflMpXIjkfzQnx20X3UDP6DtELn5h5X7QF6gbTdoTXwA8Sn/SAO7z/0+pzJ
	Oq/k5R8olrNMDPElcixF/jGbZ9DYSCQ6v397cecsVbmEBaVcmyuETLv922KK19XqDig2BDJ+2MY
	wVRv90uRfcPVH0WlZAsmIpvZu7TFZsw8SFoGBXuUeLFq0O+X2DqWrwOszpWWbRaxbw22KFJTDL/
	KaN66OdCcDctP+RymLDPPZ1czpvuM=
X-Received: by 2002:a17:907:25cc:b0:c12:528a:94f4 with SMTP id a640c23a62f3a-c16794bd3a0mr178412966b.60.1784121368956;
        Wed, 15 Jul 2026 06:16:08 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871a3dc2sm24129566b.26.2026.07.15.06.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:16:08 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:16:05 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: light: ltr501: Add ltr329 driver support
Message-ID: <6vro5bil5b5j72rigujnm5zj4ot56rtwgs4fvn6xydybxpi4rz@vrc6p6bbkl3m>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715-liteon-ltr329-v2-3-d18af55edab5@geanix.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715-liteon-ltr329-v2-3-d18af55edab5@geanix.com>

On Wed, Jul 15, 2026 at 02:27:25PM +0200, Esben Haabendal wrote:
> This adds support for the LTR-329ALS-01 chip, which is similar to
> LTR-303ALS-01, except for interrupt, which LTR-329ALS-01 chip does not
> have.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Hi, I have a small not below. Kind of personal preference though. But
what Joshua mentioned should be addressed. With that:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  drivers/iio/light/ltr501.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6d..379e57ac5f5b 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/array_size.h> // for ARRAY_SIZE
>  

...

>  
> +	if (!ltr501_has_irq_support(data->chip_info))
> +		return 0;
> +
>  	if (val < 0 || val2 < 0)
>  		return -EINVAL;
>  
> @@ -1257,6 +1270,18 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
>  		.channels = ltr301_channels,
>  		.no_channels = ARRAY_SIZE(ltr301_channels),
>  	},
> +	[ltr329] = {
> +		.partid = 0x0A,
> +		.als_gain = ltr559_als_gain_tbl,
> +		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
> +		.als_mode_active = BIT(0),
> +		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
> +		.als_gain_shift = 2,
> +		.info = &ltr301_info_no_irq,
> +		.info_no_irq = &ltr301_info_no_irq,
> +		.channels = ltr301_channels,
> +		.no_channels = ARRAY_SIZE(ltr301_channels),

Instead of playing the above game with info vs info_no_irq, an explicit
has_no_irq would probably be better. I mean conceptually if the pointers
are the same, it could also mean that both are with IRQ support. With
it, I think it would be safe to leave the .info pointer as NULL as it
would be always overwritten.

Having said the above, so strong feelings about it so up to you :)

- Nuno Sá

> +	},
>  };
>  
>  static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
> @@ -1531,6 +1556,12 @@ static int ltr501_probe(struct i2c_client *client)
>  		return ret;
>  
>  	if (client->irq > 0) {
> +		if (!ltr501_has_irq_support(data->chip_info)) {
> +			dev_err(&client->dev, "chip does not support irq\n");
> +			ret = -EINVAL;
> +			goto powerdown_on_error;
> +		}
> +
>  		ret = devm_request_threaded_irq(&client->dev, client->irq,
>  						NULL, ltr501_interrupt_handler,
>  						IRQF_TRIGGER_FALLING |
> @@ -1604,6 +1635,7 @@ static const struct i2c_device_id ltr501_id[] = {
>  	{ .name = "ltr559", .driver_data = ltr559 },
>  	{ .name = "ltr301", .driver_data = ltr301 },
>  	{ .name = "ltr303", .driver_data = ltr303 },
> +	{ .name = "ltr329", .driver_data = ltr329 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, ltr501_id);
> @@ -1613,6 +1645,7 @@ static const struct of_device_id ltr501_of_match[] = {
>  	{ .compatible = "liteon,ltr559", },
>  	{ .compatible = "liteon,ltr301", },
>  	{ .compatible = "liteon,ltr303", },
> +	{ .compatible = "liteon,ltr329", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ltr501_of_match);
> 
> -- 
> 2.55.0
> 
