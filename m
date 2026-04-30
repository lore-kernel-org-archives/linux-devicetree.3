Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1B421A14
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555729; cv=none; b=h1BwwUm2uv3BHfODQytVA2J1Y3h2fuuLLpsFCjMjuhPJ/APgL2WeKrngaSWapy8WglSWjX0U9Zltwwn3Nwf9LbgiaP796AwqD7BaYY4cH9vJrz9eFVOJa1ZgBYGEhlWe3ZYE8Py+CUzSVgE5hBEU+0fmNc36K8Vtsl2IottDbJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555729; c=relaxed/simple;
	bh=teFn7cN2aGwartJbc9Zhp06mRmBM/9j0OPR0ZBo+AIk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GeawmddskGnt92k8EbCoONCRHzlLEnXdaJzK86sfOR5Pd2px0ZOWlYAvvCoaKO61nvMgb0fJV9WO42tWKhucxl4EVuWANF5vFFYdrTKESwbkWziDupP3U8N0xSLmLEXVUISa3B/kcIMRYTVhyYaASUMld19qqzvgzwA2aSU5SuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UU+QuVBv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UU+QuVBv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-444826c16ffso845540f8f.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777555725; x=1778160525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//roSJMM+KC5LVCXnB4KxMLDV36EINvLxSrVqOGyZIY=;
        b=UU+QuVBv8fq04nEtp/SslAJrUebDqcvc0yEm9dVHwkPTh0f6cAM/afa5lKJV1/hl9m
         0ar4z8iJGEmS6o+5Hkw4G0FjmqbZtKB+pZntbpEeJdhCLJNjDwkoeNMBfeL+vAiBm919
         0FXKPeW19hMs6EYQsBmMO9iyDhinfSNAFU56wpO4JBm0/jKJjwAtbNccAB6WM9ettAKJ
         MJK+CEV/Fc88V59dps5n7hyOI8YOgfq/5l8IlBfCrbEnoGxIJ/DYV2d76jhQx+SGFFlZ
         xojgO2N6E5sTSEQD434LuvlR2HnZWBPWV4N8+cfHgo8dJaLIl9uGXnYAhDMj7YjVuNo5
         7csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555725; x=1778160525;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//roSJMM+KC5LVCXnB4KxMLDV36EINvLxSrVqOGyZIY=;
        b=Qo/TJDKBktG8u+h4szXqVMcoNepTmQA20T+nmDLRdxRE3lZfB4T1uQLd7y2q9T4DS1
         b1CThiaM3DI8lKALpTIInCUKArPU7y2MdyH2HgiZPpgss/lnI+PXBpdWWsf69Tm0sMbk
         s5wZ6WmDjS8Zp7cmODgLdA0E+CSP4UnMBsBK2ZqDIIag6jsuK4j+x+ge7yI7w6gVm6ZR
         n4W/oRZCcKqtez1p9aCbffiQdk0my+8vqDRfry2oDeDb3Ty7qTpD4RQHftDEdfDk9R4A
         MEOvbhbaKgI4mEuj4MOelwz0QGOZZVOviqqWEDubg43mHOL70cCs6lgDSX6M1xgUhC45
         gA6w==
X-Forwarded-Encrypted: i=1; AFNElJ+gafzTXK8zFKJlwFVXq2EQiPOqEjiGTFKRUoP81mTIxIgEdZn/2mBF5ynRMs0Ne5h0u7VGRhbI+mXB@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3EFgIRfI93NHGjqMyE80GeoDsm1Tz85aLQRLFPCqP4fM6baW
	39TjlD20u44a3NBVGx3V0v0bmmv0JBxye+4fqkfj38e9137X14eMeXUtmr00zBO6hNI=
X-Gm-Gg: AeBDietbJAN92ibN89LNBJcpdVRT0xEpTGvnD9ADtikALbFtkhngO7MSubPRTCbGfRQ
	GMOSPBBqBdg38C3MKif4FjCxvqLkNOkHUIa3c0NDFcVdsIfCK4HkrQO6PfrInECH1OSXq8DFOM3
	Nbufz6b2yBKWqcD+gKBElxY2R/YDEUrlU18o0s9uwRSVeh0HcqstKrSQpalGkhdqcYt5LcfOjwn
	vB1Hueo1J6bm6W7B9OOC1V3E4VTuTiPsDu00AroJ0lWAN47rG2qRG2+9M48Ar7x9plhZth+/Ddw
	Oqvj+ry0eFOQJNz5TzyS2PvuxV/sNBjri0kwJK/t7VRNrRDULzoRaXOPy1QSXqS27bvz5bGy39f
	TD+Kho1nXADn54fxxPd5fOPs41/Q+KFcJ9WfrJHh4YRoPyaXDZBypxCN8uko3Yz7XRW/68prX6b
	+DK0qLnQWPRS2lEGkxJ2iGzhghsbnPquPVlq2s43BC0IvI6uTnCRcULaG03hx47ujdw7H8kXt+c
	ElLOn886ots9q1BbA==
X-Received: by 2002:a05:6000:2f8a:b0:43d:77f4:7145 with SMTP id ffacd0b85a97d-4493e0c3fcamr4708532f8f.19.1777555725242;
        Thu, 30 Apr 2026 06:28:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae? ([2a01:e0a:106d:1080:6dcc:3980:fe87:c6ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm13666112f8f.27.2026.04.30.06.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:28:44 -0700 (PDT)
Message-ID: <150cdb85-d0ac-4802-a09b-9dab1b9b805a@linaro.org>
Date: Thu, 30 Apr 2026 15:28:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-2-76108c65a560@linaro.org>
 <afMwIVRDxl11Ty_P@sirena.co.uk>
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
In-Reply-To: <afMwIVRDxl11Ty_P@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/26 12:34, Mark Brown wrote:
> On Thu, Apr 30, 2026 at 10:48:47AM +0200, Neil Armstrong wrote:
> 
>> Add support for the SG Micro SGM3804 Single Inductor Dual Output
>> Buck/Boost Converter used to power LCD panels a provide positive
>> and negative power rails with configurable voltage and active
>> discharge function for each output.
> 
>> +config REGULATOR_SGM3804
>> +	tristate "SGMicro SGM3804 voltage regulator"
>> +	depends on I2C && OF
>> +	help
>> +	  This driver supports SGMicro SGM3804 dual-output voltage regulator.
>> +
> 
> This needs to select REGMAP_I2C.

Oops forgot

> 
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * SGMicro SGM3804 regulator Driver
>> + *
>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>> + * Copyright (C) 2026 Linaro Limited
>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
>> + */
> 
> Please make the entire comment block a C++ one so things look more
> intentional.

Sure, converted into:
+ * Copyright (C) 2026 Linaro Limited (Neil Armstrong <neil.armstrong@linaro.org>)

> 
>> +/*
>> + * Since all registers are only writeable & volatile,
>> + * regmap will only read from the cache data.
>> + */
>> +static bool sgm3804_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +	return false;
>> +}
> 
> Non-readable registers can't be volatile, volatile means always do a
> read.

Right I overlooked volatile and indeed it's incorrect.

> 
>> +static int sgm3804_enable(struct regulator_dev *rdev)
>> +{
>> +	struct sgm3804_data *ctx = rdev->reg_data;
>> +	int ret;
>> +
>> +	ret = gpiod_set_value(ctx->gpios[rdev_get_id(rdev)], 1);
>> +	if (ret)
>> +		return ret;
> 
> This could use _cansleep() for wider interoperability.

Good idea

> 
>> +
>> +	ret = regmap_write(ctx->regmap, rdev->desc->vsel_reg,
>> +			   ctx->sel[rdev_get_id(rdev)]);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = regulator_set_active_discharge_regmap(rdev,
>> +						    ctx->active_discharge[rdev_get_id(rdev)]);
>> +	if (ret)
>> +		goto err;
> 
> I'm still not clear why this isn't doing a regcache sync instead of
> writing things out individually.

OK indeed I misunderstood you comment, fully switched to cache_only/cache_sync
which is cleaner and simpler.

> 
>> +		ctx->gpios[i] = devm_gpiod_get_index(dev, "enable",
>> +						     i, GPIOD_OUT_LOW);
>> +		if (IS_ERR(ctx->gpios[i]))
>> +			return dev_err_probe(dev, PTR_ERR(ctx->gpios[i]),
>> +					"failed to get enable GPIO %d\n", i);
> 
> Perhaps use GPIOD_ASIS for a smoother handover?

Done

Thanks,
Neil
