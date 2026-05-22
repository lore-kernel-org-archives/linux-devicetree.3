Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CB39A07E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455001; cv=none; b=OsLoHkg+IsrQ5lFHfynoUR5xuqw81X4s/PgDldDBDTDsvZ9uuUa9TFZ0jSqWX6aiLrrZerI9/Nn3Ht4kXTesmM3IUYgyi5nQxtZZ8r93BkLGmeyw4+SjuK2p9kmpz51qa8TENfWiGaRv2TyelXHc2r7oWkytx6Clsx1aPqIXr0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455001; c=relaxed/simple;
	bh=zeYQ87jFXpzV5+loM2B41zUFQUdxwealBtN/HeoFfv8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qlV0O2dw22dJlzpY9F9+m89AGjmamXj6Cp4kq9CEy3QxCvCdBWNi3ZR+PL5JmXPLVqJrQMTyOWgxmYTIQEhuZ3QhxqYDTGp6OkZ/IktOAWd1qGhDJAyL8rrhGu0glmvfXlYxm4/GiJrQu8sSviDl24s8FB2WMYZnStcPEnJJcVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zByl3O1i; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zByl3O1i"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bce386d5b85so1177482266b.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779454996; x=1780059796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp+uy4fosL83r7Yff3IuwU9QpcRrQlNoLdm5truS+aA=;
        b=zByl3O1i5BpuWNCeSGGZulp+fZz1ZxWWN4rqZBHsyxd2Mhh5Sd+Ys/wlJiNRRq+43T
         DzC46dtI8m80KoFGNcTf0NPZagXY7WQcWZwvBA1lX+C9Ek6XA5RF+gFMJTqlOKhR2s/Y
         1wLrP7UkoRdPoB8H2XJcfKhBd8Ji4Hkssg4Vv/OF0/85qDiEUyaueeVeC0qW6y6BVuju
         RW1LFZgglIBoTRX21jDFIDIuACoyRjb0jQ03qTcfX39TzXMKPwy8wTgOWvXtxETCYKNd
         1viMnM9Y26QTi94cmZMbgNDtEWb7T3bRXOBDSQ9VbQo/Y030GeXarbk2ZsRupeUMIHLm
         PEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454996; x=1780059796;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pp+uy4fosL83r7Yff3IuwU9QpcRrQlNoLdm5truS+aA=;
        b=qFMuzOu9oJE5nPaC5bGT7+PjzDO5x49n8rCf+uQ3YRLWA+7XOJ+7flYSvm7AMyBoJn
         /xBuEqZr/we+RJPx/5o+72ZM5/y9Ha/OjtJ5MbhnL2EYeFoWh25XM2mtWEfWn3V/4RJR
         NhBRtkx5QgIViC2Div+JLa6RhYkNhN6ZEz37jrFTQ31s+pwmRg0be44/Fk3CpZxEjVXn
         HeUwIPG9kb+6rR+Mbbvp4fCjErcmPd7nil92U9ORmPFlDkDNaXVAuOL8NXCrHgCdoj3N
         oKloKXRdl3H7rZ5mXHWzHJKP1bj+y2HEQYh5yMKsDBpvXFZH/A9NNPgZSajduyndgEeS
         7/Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+eKAMgTBQgf4oqOxx3CnPmWj1qi9WToE2B0rHm+IA1MkHh0rIOTsi0VBZIX1/dc6VudXVVtyqgNdKQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WQc11IGYnYOHnWIN6ZEjZGxrooJvRtW4v9c3hnGtri6mH2K4
	6RlO/MUrSd5pRDVoA6q7Z11XFYe2hYJ40mCOEkltKfZNaR4ACTH16GXGdhIEZVvx7IE=
X-Gm-Gg: Acq92OF+TbsAilMvauQNakACU5Dm7dXrTzSw2f4POCevCvo21pFS9aSEcnqR2Qgu/rd
	emnVGCODmgskXWyTaacGtVKFhqCqIRHrNin+3l8rNPWjEai1+cWhidGOBRSok6Z8YyDcyPfbblW
	+C0ys4cKaeAPYfCE0Jjf09isv2SLyAMUmQusIA0i67YYyi6+xp+/NfoHdtFr6HhRxrFB6hZcyt8
	vtU/pnU3InTapu2Gybdngfzxt3M08l46n4QDRSa3eQORd+98EwawYypfSUOV3+kWCt8O/vLe+7C
	G04FmJxx/rZ8ILz5t7sMv/EsxHsAk0b+N9e8ZxTPfU3dinmZije8jsEj+CqbBibowQAU9e1IPVt
	OKcCftQCeLm4l/ydPVm3RPsWUHJcCFQ3Yke0jExEWtysmBlpkCTn8g29LzJmTi6BmSoRRYGM9Iq
	4DkQVifCNuplrAUEGEMgVG18lYTSRf5wMVVtV+AdQHlhkGJYetLZXobcmKSaVDrJMJiGdcpRh4r
	Cgo
X-Received: by 2002:a17:907:7383:b0:bdb:95d7:9816 with SMTP id a640c23a62f3a-bdd283a655amr141781566b.47.1779454995806;
        Fri, 22 May 2026 06:03:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e40:8f70:d414:3f93? ([2a01:e0a:106d:1080:e40:8f70:d414:3f93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9dd03sm4631545f8f.7.2026.05.22.06.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:03:15 -0700 (PDT)
Message-ID: <a2a08599-9682-440c-8b7e-a8b8256dc8b2@linaro.org>
Date: Fri, 22 May 2026 15:03:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
 <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
 <8916f45b-3a97-4a5e-b608-5feaea40f2b2@sirena.org.uk>
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
In-Reply-To: <8916f45b-3a97-4a5e-b608-5feaea40f2b2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 14:01, Mark Brown wrote:
> On Wed, May 06, 2026 at 09:34:07AM +0200, Neil Armstrong wrote:
> 
>> +config REGULATOR_SGM3804
>> +	tristate "SGMicro SGM3804 voltage regulator"
>> +	depends on I2C && OF
>> +	select REGMAP_I2C
>> +	help
>> +	  This driver supports SGMicro SGM3804 dual-output voltage regulator.
>> +
> 
> The GPIO usage in the driver looks non-optional so we should have a
> GPIOLIB dependency shouldn't we?

Indeed

> 
>> +static int sgm3804_sync_regcache_state(struct sgm3804_data *ctx)
>> +{
>> +	guard(mutex)(&ctx->lock);
>> +
>> +	/* If both GPIOs are down, IC is powered down and I2C writes will fail */
>> +	if (!gpiod_get_value_cansleep(ctx->gpios[SGM3804_POS_RAIL]) &&
>> +	    !gpiod_get_value_cansleep(ctx->gpios[SGM3804_NEG_RAIL])) {
>> +		regcache_cache_only(ctx->regmap, true);
>> +		regcache_mark_dirty(ctx->regmap);
>> +	} else {
>> +		/* At least a GPIO is up, we can write registers */
>> +		regcache_cache_only(ctx->regmap, false);
>> +		return regcache_sync(ctx->regmap);
> 
> This should really put the regmap back into cache only mode if the sync
> fails.

Right

> 
>> +static const struct regulator_desc sgm3804_regulator_desc[] = {
>> +	/* Positive Output */
>> +	{
>> +		.name = "pos",
>> +		.of_match = "pos",
>> +		.supply_name = "vin",
>> +		.id = SGM3804_POS_RAIL,
>> +		.ops = &sgm3804_ops,
>> +		.type = REGULATOR_VOLTAGE,
>> +		.linear_ranges = sgm3804_voltages,
>> +		.n_linear_ranges = ARRAY_SIZE(sgm3804_voltages),
>> +		.n_voltages = SGM3804_VOLTAGES_COUNT,
> 
> n_voltages is misnamed and should really be maximum selector, for a
> device like this with sparse selectors it doesn't do what you'd expect
> unfortunately.

OK indeed thanks, I overlooked this part

Neil
