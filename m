Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FB2F12A5;
	Thu, 25 Jun 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395497; cv=none; b=JR7JUeD5OZpg3HDCdqVbPqCovjn7pZefJmVmW/GcXkzd2invtIDPhxVHpzucvHiZETEy5nGz0g0MaOcnkUgCneDaXqLESDtD3txIQ0g7ZdsJv4bOuOooUKnSh9qkZdxZiI5gvyfEpw6/cxMo58Gv/nWUexdioWXZdXTfB5QSmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395497; c=relaxed/simple;
	bh=+mI7Jv0HxO5iGKBDf3RF+x0KY+vHHsTOFjPKxoYcUoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1zH1ULqKH4jT3voyGx+Xl8AZHZ8ofSD3tjegCkwCf1KicTXBKsAlI6o4cyTvecKc8WnL7Z/dE38aI3TFhYfst0bjWF7fKcEpDqWmrmVa4ZyJSO8OjVrE4QMBiAuV/6LTUmRkHrRnMZOQQSAwbKuBHTR+ZQSkSSTV/WKXBJVgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHrA2fO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHrA2fO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079A41F000E9;
	Thu, 25 Jun 2026 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782395496;
	bh=k4bAaRswZ5Ym8Ylj56fitM9fcDMFe1118bxAv+PK3Lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mHrA2fO/t7PGWTaoLEJ4uIXleWG43weD7A1u0Vl8aH8btH4csZc7NSFYrVybkb1Wp
	 p7KCjfYQ6hQV3AedRWKIQgjut00d19Q/00pp+wNfbhgjb07ilS+eGZaS2aEULedxjn
	 S3gWwnWfgu1oI30hd6+LsECRd6QX3eONV0WR4YxfVtzFRFnptVB2mWhvyH2ranEgx1
	 3Bt9/zJCJwt/FU1tpA7AkKyQ/zXUV4G/p/AvNGDIqpgAYP4DHe0BsdQ94V1uko2m5s
	 E44ObOMe1N6KzrPxis9rYBpf9ccbNWN/hgV8MY261B0MjnYmTc1sjqFCVmMFMhy9fx
	 ChGegcWjHEwUw==
Message-ID: <6371d1d8-cdfb-40fa-84c7-ba3ec4e2ac00@kernel.org>
Date: Thu, 25 Jun 2026 15:51:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
 xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
References: <20260508134009.4582-1-syyang@lontium.com>
 <20260508134009.4582-3-syyang@lontium.com>
 <3188f63f-5358-48d7-b934-af20a8f95c6f@kernel.org>
 <CAFQXuNbKBfyeQL3N3P5QY=6BWoD3O6DSbXN-WMA1rRG9vCs3Kg@mail.gmail.com>
 <a0352a42-15db-4c7a-ae73-8a4e1543cd50@kernel.org>
 <CAFQXuNZVE6cZJGwrGKGtWnB-seSJLHFh8zW3jjAs6U4JLZFWng@mail.gmail.com>
 <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAFQXuNa8bJCpZBkMs_3mtbK_pjVzDdaDaoGk0KDxiG_Pf7txdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2026 15:40, Sunyun Yang wrote:
> Sunyun Yang <syyang@lontium.com> 于2026年6月25日周四 21:26写道：
>>
>> Krzysztof Kozlowski <krzk@kernel.org> 于2026年6月25日周四 21:17写道：
>>>
>>> On 25/06/2026 15:14, Sunyun Yang wrote:
>>>> Krzysztof Kozlowski <krzk@kernel.org> 于2026年6月25日周四 20:54写道：
>>>>>
>>>>> On 08/05/2026 15:40, syyang@lontium.com wrote:
>>>>>> +
>>>>>> +static void lt9611c_reset(struct lt9611c *lt9611c)
>>>>>> +{
>>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
>>>>>> +     msleep(20);
>>>>>> +
>>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
>>>>>> +     msleep(20);
>>>>>> +
>>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
>>>>>
>>>>> This is just plain wrong. Why do you assert, then de-assert and then
>>>>> finally assert AGAIN the reset leaving the device in powerdown stage?
>>>>>
>>>> I am using software to emulate the hardware RESET button on our EVB.
>>>> When the hardware RESET button is pressed while our chip is running,
>>>> the signal level changes from HIGH to LOW and then back to HIGH.
>>>>
>>>> Of course, we can also use the following:
>>>> static void lt9611c_reset(struct lt9611c *lt9611c)
>>>> {
>>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
>>>>     msleep(50);
>>>>     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
>>>>     msleep(20);
>>>> }
>>>
>>> Makes no sense either and you just did not get the point and did not
>>> answer my question. I asked WHY you leave asserted. Answer "we emulate"
>>> is just plain wrong.
>>>
>>> So again please answer:
>>>
>>> Why do you leave device with reset asserted?
>>>
>>
>>  devicetree:   reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
>>
>> GPIO_ACTIVE_HIGH:
>>
>> gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);   ------   reset pin
>> is Low level : Clear the register configuration in the chip to stop
>> the chip from working.
>>
>> gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);   ------  reset pin
>> is high level:  The chip resumes operation.
>>
>>
> 
> Our purpose is: pull the level low to clear the register configuration
> in the chip, and then pull it high to allow the MCU inside the chip to
> re‑initialize the registers.


And you do completely opposite... so that confirms your code is just wrong.


Best regards,
Krzysztof
