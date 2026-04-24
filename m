Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1735F196
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024851; cv=none; b=HRHipEaRel76SN+DO7Dkb67oiZSBKJuHu7bnJBce4XQLbziryHMu6UKX6WZxJcUz0x5tK2zs/kwBhBZTfrLAVVvm2eS5ztvAcl+9eBXXDQruM2i/l0FoIc1WknOllYqvSLEAwsezzhvghLZgjMm/GdrIYXQDrhRC8oiMB5qDjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024851; c=relaxed/simple;
	bh=t9GpYR5T/MbOcfhkn+FQD5aargxAD0uAv82boDZ4aQ0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=St2rqh5gFuaF+IOmCAJ8h2iYBPeOtr/EAtVlBw8rAG+zxAxrf6KBGBa2qq/aJJZe+5u164E9zIoaAAiYjxJdgOMwfrLZXwi1Jo9i4ZWhTBsTwuHVLlcj+24c4VdlPd6CM4TVty+lsXD/jXQAJ1tzU6QzTe/GCFSx9gDA+w7OaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHlfl1vY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHlfl1vY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso76141735e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024848; x=1777629648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cwRtmDAbT4Y+He6JfFqenlNmTZcScEAW3BnQ0sfKIA=;
        b=dHlfl1vYFONN8q0CI9JprHJtZgrZGJeqbjDPkotWso3sQREWeJ6VKPQXI2f1Qyqb3E
         3aj/hDM754wQxfKTdcRoWB95yHbiCI6FubX4dKcne4pylr4DpZhZNcV5JuijP9u38xdH
         BukRjVP9w34g69ESj4GVmH1K3ggykFNVu7BlFife63RjkeBJ097DkE2FcbYBs0yj2bDw
         +26Z+FQW7upZkwPAXLv8Af4RzthYHFUUOU+5X494Jz93TGW5FcJ965/MTCbh0MvG/w4m
         qcByPen64cF3WWDWmm+hB8PMncVZ3d6aSusyYbSt5lA1ghf/ioO3PK/IXXL6WdOyBRUi
         tTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024848; x=1777629648;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cwRtmDAbT4Y+He6JfFqenlNmTZcScEAW3BnQ0sfKIA=;
        b=qqoLeIXfJLwgKTAelvDtdZtKlN3XY6Tk70HA8AbyfI33bHojdoQWwLgBH9YPXcrH/8
         bTBKVbSPOLbXDiyjz+pFR3gb/m5yutzV0eu0J1CjbLTVO1E8l7GadR1o/l/E8dnXfXki
         symzysi1/l7B+SeH+kjlzBKpYsYN2obFW5dg78iGOs15G+hMRBZFVVCof1CN7O4+zPL2
         mqQZoG1lsLlB2b5d3k2ofEZ7AP79NN4D7hb0k0aHtsWXFAR4lRRnaD4Hynl9pS+QWuhD
         Hq3lwNd9RCdtdqVUqBMMnYK5zu0OM8mN22l9HNZdlg5OZiSswmWrQD4LzoZyXNYw0g6p
         DUwg==
X-Forwarded-Encrypted: i=1; AFNElJ+X5e/yjTUZN/qYvyRkwrX085Dat6PsmUB7uXnvDdNqc9ngM88h+0D7zc1D3y0HCq5FL2zUnwMIEKSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxARqviuNKSMx1fo8w+Lmyh9jKAuPIhiuuO2muuBJoczBPem/V7
	88S95I4tJmM1+dhFiOmcObC6qwmEK4EusoMRjsUC5FqkABn/i5q4P7hisaeNXY4q4ic=
X-Gm-Gg: AeBDiesRFfUxxtqOPnis/ELgcfWqtO01Piyud0mB7xbxxc9Gi+8h9BU3ahEZBdMJN76
	XIT1L+Pr6yiFvw8urimdxQyCFigvcQOy3o+XIKPC29ZgNh4P1h2h5veYacmMFa64lNGzqfhfGTK
	A+wl53mdEh6c7O4ZZrYzF4n5k7xFgR4KobdY5Zy7+ciYhFl9UhxSfDax1aps+ZLfWE5ZIU7wOjw
	U9F05PK/mBGVNjPXuhGnX1hx9ZmMaLm4U/oXGd3I0jhKcjKaYKNpDbOFrWAUCmoPiBQWIIwvUh2
	S295tw9FZgVDhqGWdq9tqvEs/+wVeyNEdDkU2gL21RAPjn7Xo4LQJM4DInmzQkQfCLCP4Kk3yqW
	AIvPqOxQ3oHrLS/2vubgD7+jS4LV2qgzAH2kndFHic+dsOPuSORIEKiI6NxWqFi/5IXfuRun5lq
	0Nm8ArNTCFjsXjm8nfTeCd2sb9aY0ugCK40BGasLgAVLPfbKG7ZUDZrxJmY+a73gF2pH3d8FNVC
	aEzSGFNf/Bfm1WL8xCmZ6IcvDrE
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr288416295e9.11.1777024847607;
        Fri, 24 Apr 2026 03:00:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm169961765e9.17.2026.04.24.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:00:47 -0700 (PDT)
Message-ID: <f057dbd9-5fa7-414f-98f4-1bbb691e2fc7@linaro.org>
Date: Fri, 24 Apr 2026 12:00:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-5-447114a28f2d@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-5-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, max_level),
> as new MCUs need different values.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/khadas_mcu_fan.c | 49 +++++++++++++++++++++++++++++++++++-----
>   1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
> index d35e5313bea41..24559bf65de46 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -13,13 +13,15 @@
>   #include <linux/regmap.h>
>   #include <linux/sysfs.h>
>   #include <linux/thermal.h>
> -
> -#define MAX_LEVEL 3
> +#include <linux/regulator/consumer.h>
>   
>   struct khadas_mcu_fan_ctx {
>   	struct khadas_mcu *mcu;
> +	unsigned int fan_reg;
>   	unsigned int level;
> +	unsigned int max_level;
>   	struct thermal_cooling_device *cdev;
> +	struct regulator *power;
>   };
>   
>   static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
> @@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   {
>   	int ret;
>   
> -	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> -			   level);
> +	ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>   	if (ret)
>   		return ret;
>   
> @@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>   					unsigned long *state)
>   {
> -	*state = MAX_LEVEL;
> +	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +	*state = ctx->max_level;
>   
>   	return 0;
>   }
> @@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   {
>   	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>   
> -	if (state > MAX_LEVEL)
> +	if (state > ctx->max_level)
>   		return -EINVAL;
>   
>   	if (state == ctx->level)
> @@ -83,11 +86,32 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct khadas_mcu_fan_ctx *ctx;
>   	int ret;
> +	const struct khadas_mcu_fan_pdata *pdata = dev_get_platdata(&pdev->dev);

Move this on top to respect reverse christmas ordering.

>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> +
>   	ctx->mcu = mcu;
> +	ctx->fan_reg   = pdata->fan_reg;
> +	ctx->max_level = pdata->max_level;
> +
> +	ctx->power = devm_regulator_get_optional(dev->parent, "fan");
> +	if (IS_ERR(ctx->power)) {
> +		if (PTR_ERR(ctx->power) == -ENODEV)
> +			ctx->power = NULL;
> +		else
> +			return PTR_ERR(ctx->power);
> +	}
> +
> +	if (ctx->power) {
> +		ret = regulator_enable(ctx->power);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
> +			return ret; 
> +		}
> +	}

Or you can request with devm_regulator_get(dev->parent, "fan"); which will
return a dummy regulator, and then you can just call regulator_enable & disable
and remove all those checks.

> +
>   	platform_set_drvdata(pdev, ctx);
>   
>   	cdev = devm_thermal_of_cooling_device_register(dev->parent,
> @@ -124,12 +148,25 @@ static int khadas_mcu_fan_suspend(struct device *dev)
>   
>   	ctx->level = level_save;
>   
> +	if (ctx->power) {
> +		ret = regulator_disable(ctx->power);
> +		if (ret)
> +			return ret;
> +	}

if (ctx->power)
	return regulator_disable(ctx->power);

> +
>   	return 0;
>   }
>   
>   static int khadas_mcu_fan_resume(struct device *dev)
>   {
>   	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (ctx->power) {
> +		ret = regulator_enable(ctx->power);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return khadas_mcu_fan_set_level(ctx, ctx->level);
>   }
> 

Thanks,
Neil
