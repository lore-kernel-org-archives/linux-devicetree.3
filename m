Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173053955D8
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610065; cv=none; b=s2cvcEhVXa4GoKiZXjCFe+OYfX5O0uSdJGr/lb6ryWLNrLISi5WEI6HLLnODa/tOTH4mqCg+XYM8Zj8OFABuapxTPoPkLbx7PkZteNjKWjXxTu9HTqffouNWBVe9XHiwQsuZG7o5OHNph5hflt2cxPlQAPuALXPNr2Wf1kJOHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610065; c=relaxed/simple;
	bh=Et8yr7T4XI2QiD9tHPH6gogO1W8MVDfDmWwZXyvssoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQ9R93oqHFgiHXUr8eeYdbAUItAGkqB5GSNLuCIK54QmzE7Nw69sXYhbsSzle1NC5kUUExJiDd6fcsXeZjwtH1kDnN6Byldu/Y57ZQLApg71Esw0rjQZFs4J4Kzgl6QL9eZf5nE8xo5sy26iHyCgmoGswgDdPtIpyuuYWwi2as8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRySEaGe; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRySEaGe"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c9452244aso14184261fa.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610061; x=1787214861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUlqoelOp41/qPHMuXnll43fbi7+sd/XaTpVYDwo8o4=;
        b=rRySEaGe33GGD3rDArMTqpneiUzvS6BHFzj5YOcZyvbNkwUj8ouVDd5CmMG7ODCX4q
         V9PSxwj/pNhYWS7enXDXJOOKUUSTkXWPQ1i/ub67BYC2xAnLz77u7lOQX0zUevnPUEZB
         ruACOMxfJrs1H5YJABBisQ/2+oMQ7uaKAhW79YpIvY8eO+KB6DdnmjWPMdGshk/cmwPx
         inqKF9qxNpYIWrI1ydZ+GF73F3XsR/dR2Nqv2nhBj2+4enluMOjDUdyC2+1utCLtf/hB
         a4clU4OCAHrVL8uLZT2Kxw+h+mQNZeBXKpuOTtaNNMRoWHPQaodnng5w+d/gjhZU1Ugl
         rD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610061; x=1787214861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUlqoelOp41/qPHMuXnll43fbi7+sd/XaTpVYDwo8o4=;
        b=oFpvsFVILLnf+DvXlCOeLDvCAhGGnvd1+SBYmQyDsxkx1b95deFZOxJ+OOPFCrAyCg
         Zix+xE1mgAKuK/LnJHTApRqnkih6TGen86s8a7j3LMODhvJXZWwjnrcasmau15MgYA/y
         lzZUi3T3AJMX0+8Seq3TvmxtbrHBDuqRWWrA163ILYOIC2lYfuGm0RUFt1vUQyAMr6kD
         Sx0e17d0kM7VYBDSz8qmlnrImp0K5CpIUrPeAb2yQkCW1rvkdy6zAdXP8/hQrP53+/tN
         k9AZstBYXM3MFI01SmG0UEynDZq3BwRdhejKEm6yOY34VnfjNXVOS0lj4ySwe9ItppZb
         T0qg==
X-Forwarded-Encrypted: i=1; AHgh+RoaI6GiR9GmP8RvbIpBf2kJyCgo4t0GUPUZRVrs/o5uxIpeyPeQMFyjUIt1UIHLgaHOC0YCmLa7W540@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnjQ6ZaY/xl7R0eAmNv+L5KvmXbMIxf1t/yEYxvFxdpPQ0VvJ
	+YBAaHG1B3WzoBolSgFMO31q64piF3Pj+/Zg7Tt0HzghnlPOWDpAeDEY
X-Gm-Gg: AR+sD13LiX+zUK2UmEJOopDY0ejFNNnBLtyD5ZpiBkheQK65dpkr4FQtvyxEBtfjZhK
	ucVZXgO7Wm1KAt2+GmATm6QqcRKcAkT02DxRKs8teIhwviNG6XEwvZAzpEVLLcy07HMFzRQJiu3
	6FaR6Sqi5UV/9PG3jFNoYTfk3pEJ9GW+5TkgfT9TpN26DIz9/UoV5Ne+maqpVkYvT0mCHUCz4d2
	L2yuXz/XRpmsBLWUAGuWUXOgIffGyQbE36rw7y0JRi21ndw4QWHkL9T5XHUvhQk2EJlDDCDGubV
	5gcQWgKaI9f6ddf+iqm0sg7IrwbLigN1FJufTlHb1wNmtNsNl+ExnMIJkHLga0EE8/hmdasriNW
	RAXt4EZUWahUFAbznueyAKUtt5c7P8f2B0ZF7p9zrI8kygp9OUDoqe1wouvJ152GIebbTIUYMdO
	X8765jOthSb2Lbxz/46jv3Oa70udtI9xiE5iYIhbWp2Ozllin2F0vtqo9Bu9fNbwJ+9ko+2xkY3
	UEsLHNo3jYiHhWnhx2AFbG1eur7qTwDFcKnGWKDaXUTbguHjYVk9jo+awOcdWH/1yRE
X-Received: by 2002:a05:651c:2108:b0:39c:f58e:5c5b with SMTP id 38308e7fff4ca-3a11a6b4a36mr4705651fa.18.1786610060867;
        Thu, 13 Aug 2026 01:34:20 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b43f7fbsm2860831fa.37.2026.08.13.01.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:34:19 -0700 (PDT)
Message-ID: <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Date: Thu, 13 Aug 2026 11:34:17 +0300
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

The BD73800 uses different registers for 'out' and 'in'. So there aren't 
really "GPIO lines with a fixed direction mixed together in the same 
register".

I, however, see some good stuff being in the linux-next! Finally a bit 
of flexibility in a form of callbacks a driver can register is getting 
in. So I am somewhat hopeful the usability of gpio-regmap will finally 
increase.

I think the BD73800 can indeed use the gpio-regmap, by keeping the pin 
direction information in private data and adding a custom xlate, which 
errors out if get is requested for output pin, or set is requested for 
input. I am not sure how much of an improvement it is compared to the 
patch v2, but I'll give it a shot :) I believe the new -rc1 isn't that 
far away, and hopefully the gpio-regmap -stuff from the next will be in 
it together with the regulator stuff bindings depended.

Thanks again for the pointer!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
