Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364344BCA8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183651; cv=none; b=b/4n2a2dP49h3lLpKjcUpmDZfxsPG9+6ukOe9/B7vU+UIV0n5S8S8tu5oIuScjPthHZnPTnMW6rvs0lis6ByCfp4JlfieTSBMj9nPmufs6RG6yDquIdoskv9h4W3nGCJf/7Ez7ApkrMbu8UbmnP8BMqH6IphXQP6X2a6awErhrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183651; c=relaxed/simple;
	bh=VPfhGcHMuYqIFg43VC51oRIuHSoNubcOka7ZZDStQsI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t82LAFBNVK9y5x1b3lrPgDq+UaQ2lme9ffQnMMj8jCP5735LgMlX7dmr6kxqN/dpr8wL7uPxBiBrp1As56Ki0VoRrKAYtkXrthVEzengo51D8HhVtAmX7s7hIovxhBQlrlp/6fCfIoX4q3vhnnRxkjPBMfgB2NNS3C/Rxs0q/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DR/B/1yf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DR/B/1yf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso34237385e9.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779183645; x=1779788445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zmz8kYjsz4oQGCSzPJQMt0UAlV/XMzBL2I4qyh5OljU=;
        b=DR/B/1yfy1VMLtGhVJdNSndGXIsu1t/03lmsIOch0dQ5lCwX66rCSu/P57T7F9DXf/
         NFA0h7nZds+gWBiRhp3M9NtlezKpyitTI4shMmoFMquvQ9wCvtCngsr5XNITfeN2ZRRx
         9n1uC+t52uHN9jhfevY+lbgP6CXjEMpITKCSIT73xA+T2A/FV38x4clfL84bwsqFvJ2e
         humNcNQx8X5G5qseNrJHqa9ZEFzTmA1YJvpO0qgDk/x63y7J8aRg1n1ruDW/IB/UiOBx
         +FStgKatygEhGA2Rx5naMCQmJ8jJNqIaLk6QihvGo2CJAhnQhPSzxuPq9X2c8B+Nt+pC
         p/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183645; x=1779788445;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zmz8kYjsz4oQGCSzPJQMt0UAlV/XMzBL2I4qyh5OljU=;
        b=UbDtH7LCGqIyhmECn5ik1xFDQqFQDkaMCHlA2O6xXMZGKqMOU0vc39fV9cbVRoaaQ6
         SsATbHb2ZuA9G8yPVJfbBeTu/kYp3BjmYTkNhGYfrYERvn0PWiBQ4oPwz0BufgGpwkmd
         AMcQ+JDCFb1azE1CmAV7WARrkdy7AiuKYrct0Wd5m9Qj4MbzPs2Rsa8Ww07DUoDGyiTy
         5K4MB2l7lVy3dFJEpdJBQlOTpmJO7rKXpwUC/Y/Z5oAIlPcsbas/9jkDK2OSt8XP89MD
         IXN7EmmudQOGvJjyxt5UznfPoToDsMKKs5LBzaSy7rpL1Th686wR+ERwujA/5UpvCvPA
         Khyg==
X-Gm-Message-State: AOJu0YzgkFUsVfKttszwDilnXoui5QH0DynZS7UEOtD3Kb6bTnU6z8ok
	7UxKPGSly0fQ8GQqp20mBLEyvBcYnHlrf26BE7lAJ8ePmmyTZ6ysC0wSpEIVwWBxw10=
X-Gm-Gg: Acq92OEYJJt4bc3UOwFPVgmbVDa1MzPvOc8qxbg0v/OvR5Iy2FWAORk7Zg1RZrxjvIb
	VrrXQrf5RpiBYOZ5f2xrEgR/eKktYUp9CDfpFAW+OPcbbYIY7ygbfOrd4s04dzpv4MPuoIIMSg+
	d+NwuO8QzGiHOowJoxa5gLxKY9wbgjWCkPBtp+FLfXjK+GRpyJTxfiObghPz0FhoKAwdoiocyuB
	RpJVLmQuL+5wRn/dhg50K6dqIUspjo8H/AhFdw7iQXZkYpaTxmwz4+C1v/HUq/l1mhaO6t9pV3X
	J3Qvpql8wy57GyjK2bphq95j7k2dlG4+fVaLO1MARQi5vAJoapO3ddFLnnlSsjTN0Nr5ZQPYwzC
	WaCsCCbGFZCwHSkW6Cw6yY+zMLbxtZ+KfkHdiYmEKzaDMvEr2m1b8V3ClPk0jgd30j287Mq3KcS
	1Bx1LahRviiOIiqtyv7qmc3A7+NgKoTKFchpThs2v8BK57dbC0EcpQ7WcIU9xZX9z9tggv7q3J4
	/F1
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb70mr10152505e9.9.1779183645032;
        Tue, 19 May 2026 02:40:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fed253f93sm100627705e9.16.2026.05.19.02.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:40:44 -0700 (PDT)
Message-ID: <5a16843f-3642-413c-a35b-ecb399a73dc2@linaro.org>
Date: Tue, 19 May 2026 11:40:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-2-ec8194bbc885@linaro.org>
 <20260519090836.44E0CC2BCC9@smtp.kernel.org>
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
In-Reply-To: <20260519090836.44E0CC2BCC9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 11:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [High] The 'enable' GPIO is not properly deasserted before the 'vddio' regulator is disabled, causing potential hardware backpowering.
> - [High] Loss of critical register configuration on system resume if power is lost.
> - [Medium] The generic driver hardcodes board-specific electrical parameters instead of parsing them from the Device Tree.
> - [Medium] The driver treats the 'enable' GPIO as strictly mandatory, preventing it from probing on boards where the pin is hardwired.
> - [Medium] Missing `<linux/delay.h>` header inclusion for `fsleep()`.
> - [Low] Typo in Kconfig help text ('Socket' instead of 'Pocket').
> - [Low] The `MSK_LED_ENABLE` macro is defined but never used.
> --
> 
> commit ad75708c40d354dbaee72f90622daea36e29195d
> Author: KancyJoe <kancy2333@outlook.com>
> 
> backlight: Add SY7758 6-channel High Efficiency LED Driver support
> 
> Implement support for the Silergy SY7758 6-channel High Efficiency LED
> Driver used for backlight brightness control in the Ayaneo Pocket S2
> dual-DSI panel.
> 
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index a7a3fbaf7c29e..052ac80c82137 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
> [ ... ]
>> +config BACKLIGHT_SY7758
>> +	tristate "Backlight Driver for Silergy SY7758"
>> +	depends on I2C
>> +	select REGMAP_I2C
>> +	help
>> +	  Say Y to enable the backlight driver for the Silergy SY7758
>> +	  backlight controller found in Ayaneo Socket S2.
> 
> This isn't a bug, but there is a typo (Socket instead of Pocket) in the help
> text.
> 
>> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
>> new file mode 100644
>> index 0000000000000..a6087e687b640
>> --- /dev/null
>> +++ b/drivers/video/backlight/sy7758.c
>> @@ -0,0 +1,259 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Silergy SY7758 6-channel High Efficiency LED Driver
>> + *
>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>> + * Copyright (C) 2026 Linaro Limited
>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +#include <linux/backlight.h>
>> +#include <linux/module.h>
>> +#include <linux/i2c.h>
>> +#include <linux/of.h>
>> +#include <linux/err.h>
>> +#include <linux/bits.h>
>> +#include <linux/regmap.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/regulator/consumer.h>
> 
> Should <linux/delay.h> be included here? The driver explicitly calls fsleep()
> in sy7758_probe(), but relies on implicit header inclusion.

Fixed

> 
> [ ... ]
>> +#define MSK_BRT_12BIT_H		GENMASK(3, 0)
>> +#define MSK_LED_ENABLE		GENMASK(5, 0)
> 
> Is MSK_LED_ENABLE intended to be used? It appears to be defined here but is
> never used anywhere in the driver code.

Dropped

> 
> [ ... ]
>> +static const struct backlight_ops sy7758_backlight_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.update_status = sy7758_backlight_update_status,
>> +};
> 
> Since BL_CORE_SUSPENDRESUME is set, the backlight core will call
> update_status() on resume. If the system turns off the vddio regulator or I2C
> power domain during suspend, won't the configuration registers programmed in
> sy7758_init() (such as REG_DEV_CTL and the OTP configurations) be lost?
> 
> Does this driver need explicit suspend and resume callbacks to reapply the
> hardware initialization sequence?

This won't happen, the vddio & gpio are kept on

> 
>> +static int sy7758_init(struct sy7758 *sydev)
>> +{
> [ ... ]
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG0,
>> +			   FIELD_PREP(MSK_CFG0_CURRENT_LOW, 85));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG1,
>> +			   BIT_CFG1_PDET_STDBY |
>> +			   FIELD_PREP(MSK_CFG1_CURRENT_MAX, 1) |
>> +			   FIELD_PREP(MSK_CFG1_CURRENT_HIGH, 10));
> 
> These values (85, 1, 10) appear to be board-specific electrical limits for the
> Ayaneo panel. Could hardcoding them cause issues if this generic driver is
> reused for other boards?
> 
> Should these parameters be parsed from Device Tree properties instead?

Will be added later if needed

> 
> [ ... ]
>> +static int sy7758_probe(struct i2c_client *client)
>> +{
> [ ... ]
>> +	/* Get and enable regulators */
>> +	ret = devm_regulator_get_enable(dev, "vddio");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
>> +
>> +	fsleep(100);
>> +
>> +	/* Get enable GPIO and set to high */
>> +	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> 
> On driver unbind or probe failure, devres will release resources in LIFO
> order. This means the GPIO descriptor is freed via gpiod_put() before the
> vddio regulator is disabled.
> 
> Because gpiod_put() does not change the physical pin state, won't the enable
> pin remain driven high while the main chip power is turned off? Could this
> cause hardware backpowering through the chip's protection diodes?
> 
> Does the driver need a custom devm_add_action_or_reset() callback to
> explicitly drive the GPIO low before the regulator is disabled?
> 
> Additionally, if a board implements the SY7758 with the enable pin permanently
> pulled high in hardware, this devm_gpiod_get() call will return -ENOENT and
> unconditionally fail probe.
> 
> Could this use devm_gpiod_get_optional() to allow the driver to probe
> successfully on such boards?
> 

Not an issue, as specified in the spec the gpio level is powered by the vddio.


