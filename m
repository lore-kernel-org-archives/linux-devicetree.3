Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE95C3064B5
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340863; cv=none; b=XISYaa7V8obUTezEzz6YwlKZA1P1G207Kw9J/GfUrOtMevQ+NVlnr58gDLqRxIiqdPN4LMO2y6FRrybZigXitEZnEZKHrgyM5LZ38LAwmfpTs4zNj6FA8A0IxH0ZLjTquFS0rnesmNzo2FGo8TlptjJqYAOK3qRZ1M2Y4tG5tPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340863; c=relaxed/simple;
	bh=AWMJoce7pnftoApbVh15TcpMiuMZ1v3TsqwFuMUo2h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/4c2GTYd3BDeoGyXJc+mTlp73QtftIP/3B3yRylTfr3uPhiSWA+8w4F+wRReUpQDB/oJ4e5UiQkYZYjFAJY7HIUPPZFgJIOnqxreRE8ulQFmghZfgozDxrNaNxdSHbpPesFRD8nin9pLPyTiPs3j4fJMSCLBGp22Mp8djqYO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFNiR5sy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFNiR5sy"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1700982e87.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 22:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786340860; x=1786945660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUFfp1/cNFOhAWdi1g6pduhZx20pCKXkmLPmJPcXpEc=;
        b=iFNiR5sy9H3kQkPeeCyrUu18lu08olCZXsaHceSPm3zyMlOZBs82DDo6vuidqJd3F6
         AIXErZEpwRy6BONhA2E8QruzaPGQFFbVIHveixXOhDXjOfzuWC237ybxgGa8K52CEyoi
         J2ctiOXw2quhtq4J27MswFJ5VMLzQ1waSZiGxFnbG/n455BXWxyaMwNamb86QHzE5N1d
         kQo1QlOAUbFJJaKUZzVjSk+EaV+FPtKaU8j00oXKv1LF8EnKTwJ7vYlA+YMedpReFlnG
         hWIQQNbCDtBGunR1/R9ruEraVEf2hkAeamH18iJa7Hsx1y04xqZXBctX7tu7JabDmdYg
         MGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340860; x=1786945660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUFfp1/cNFOhAWdi1g6pduhZx20pCKXkmLPmJPcXpEc=;
        b=lbJiJB4H0Ht1xuce+O+5uhGmwb7Y9PRMoTFLt53kpic69RMyJC3bVvSnoVjmYUDUYy
         cNE7yUDjyXk/lPegMD4Ujn9aigBbecowlvENkUDxKwxVO3nqwCNaWZ9RMxENjeDVM8Xo
         2PPyEr270laZ6AyBsWO7XPvPhGmfzCdITMbWm2Ja6iwXYTLYTDoMLkKJ8ah0aAbWcXml
         iQI750B6MgMU9I1C+0IDXVskCI6kSVsrzi29YL73pSpqa1Vv8T6eqcupMifbcloQe6Dj
         V0O7AwhkzCxNcM4eojqWPtK8bs8IT4/cYvKagsnYC2b1XTS2nqQv7CgepDHMotjwRr/D
         JSow==
X-Forwarded-Encrypted: i=1; AHgh+RqDQlxouw39dcIKK9Eg7amwfFTrZyIz9p2Ktd58Dp6csnaUmZ8KRNxMHkjNhiCwyC6YkTwtlaF3emh1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb5QeTdXHVk+u/KtzpUGtCSPVZCmkXcnq8nyjDKBKR58WBB3L/
	cFMhB5GVZ7RwPZbXOW1fSfXS+/omPNGCzf040WuBXghUr9TMX7Za0LLj
X-Gm-Gg: AR+sD10KivOYYXn59Lggx5s3rjgu8W9TThnwSQkzP67fn6LHO2wXTnAG3nxGUQjGFlW
	dKEKMu+7T4/O0BNNUUCIkh2L3bJyOgaeKXlpe9vYav+y6tEU/PpiAI+a5GSbp6off4+ezzoLyb+
	haJcg8d7tpIarCx+OThRwVpv+dkFlbh58srhqHxXK/3txLVNBtwGVP24hoi7Q5rUcH4r3wFwp30
	Ad5tkcjFPh6XA8NRXcWlB2eFXVtUv7qs/6it7YrBkYG2SV9yJZ1Qo2XLg9G9v8LlZdZbx04Nn4D
	AOCDtDufQN0WxK1/eBPU24vLAc4+xV15yGJ3HnWt6Qv6+98kV5kTA06RNjWz72hRUZhrBEMZtJ2
	P15RQ4QrCQGqM+uzCWgjauiMTH3tShF4mPhVuiNaGstdap9BquyBIKneHUvyyW96Y5GWsHM0dUn
	OobMzwR+5U6IZ34UJO/ecTa0YcLQ7FBVa5EzuEJnNAfSvOVwCoCo9gLKH3FLouN461ClvouPJP0
	Zx18Liay7i09MsvRBbx+dqMwTNriN8ahSJuyPHFgyhBBYi/uInjffzPnIQ6hXkirDGR
X-Received: by 2002:a05:6512:638c:10b0:5b2:b004:ab9d with SMTP id 2adb3069b0e04-5b30b770fb0mr1599566e87.34.1786340859873;
        Sun, 09 Aug 2026 22:47:39 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda988bcsm19527201fa.14.2026.08.09.22.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 22:47:39 -0700 (PDT)
Message-ID: <8af920f3-d856-43a5-9485-f4d39cc7fcb7@gmail.com>
Date: Mon, 10 Aug 2026 08:47:38 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1785838584.git.mazziesaccount@gmail.com>
 <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
 <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2026 23:29, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Tue, Aug 4, 2026 at 12:23 PM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
> 
>> +static int bd73800gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       struct bd73800_gpio *data = gpiochip_get_data(chip);
>> +       struct bd73800_gpio_pin_cfg *pin = &data->pin[offset];
>> +       int ret, val;
>> +
>> +       /* Only pins configured as GPI via OTP can have their status read */
>> +       if (pin->state != BD73800_PIN_GPI) {
>> +               dev_dbg(data->dev, "pin %d (%x) not input. State %d\n", offset,
>> +                       pin->mask, pin->state);
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = regmap_read(data->regmap, BD73800_REG_INT_5_SRC, &val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return val & pin->mask;
>> +}
>> +
>> +static int bd73800gpo_set(struct gpio_chip *chip, unsigned int offset,
>> +                         int value)
>> +{
>> +       struct bd73800_gpio *data = gpiochip_get_data(chip);
>> +       struct bd73800_gpio_pin_cfg *pin = &data->pin[offset];
>> +
>> +       if (pin->state != BD73800_PIN_GPO) {
>> +               dev_dbg(data->dev, "pin %d (%d) not output. State %d\n",
>> +                       offset, pin->mask, pin->state);
>> +
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (value)
>> +               return regmap_set_bits(data->regmap, BD73800_REG_GPO_OUT,
>> +                                      pin->mask);
>> +
>> +       return regmap_clear_bits(data->regmap, BD73800_REG_GPO_OUT, pin->mask);
>> +}
> 
> These can probably be handled by the latest version of gpio-regmap
> helpers (the version in linux-next).
> 
> We now support both input-only and output-only in gpio-regmap.

Allright, I'll take a look at the gpio-regmap again. Thanks for letting 
me know ...

> 
> Latest <linux/gpio/regmap.h>:
> 
>   * @fixed_direction_mask:
>   *                      (Optional) Bitmap representing the GPIO lines that
>   *                      make use of the @fixed_direction_output list to
>   *                      enforce direction of the GPIO. If this is NULL
>   *                      and @fixed_direction_output is defined, ALL GPIOs
>   *                      are assumed to be fixed direction (out or in).
>   * @fixed_direction_output:
>   *                      (Optional) Bitmap representing the fixed direction of
>   *                      the GPIO lines. Useful when there are GPIO lines with a
>   *                      fixed direction mixed together in the same register.
> 
> It seems you can set up the fixed_direction_output mask from OTP
> and just use the library, right?

... and thanks for going the extra mile and giving me this pointer. 
Helps a lot! :) I wish all reviewers had the time to give this specific 
suggestions - although, I understand this is not always feasible with 
the amount of reviews/tasks to handle.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
