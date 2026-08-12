Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1143BDA1
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537385; cv=none; b=QgtwTl2H5YC3itmZhAV/PSFD2Vg0dHlaED2gckEoC2hmWmxT77zEY3gP3sKGWcqVrjVyjBjnznRgbmIEmIjmLl4egz/Gtrp9S2vJZwBqvRwagUj7gR2fr48PDENaCxnsUqFYi7KM7f8qIR/DHjW6fEANQT/ZoF3oerKD2KzLzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537385; c=relaxed/simple;
	bh=ULHnAaR0y33nlass+S9nE4P2x58iDM1CvgvpWsaekac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=meJ8WOZtPw0TMx3pb6ruikYc190aUc7inUxYxx1oWPZhvL/j4xprSRXfdIMHX5aD36yPuBJSaE7+jQ9DVWAkSlgAmj7lAU0HRHBSsS50UBHDW6pydTa7VVX/jNiGvZjVrRPeZltt/55+P2TI4KaIC1ErhdbPef9XsQ9AS/peixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4wyppTR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4wyppTR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso696141f8f.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786537382; x=1787142182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAxA3lYXjYvQzaKtcs4NSsbwGX9ohjI2k2yZr9N60vs=;
        b=a4wyppTRLvOc2WDPaQwqNsVOZOnLlVQZCiXX4pJyBhYOpqPO6JQVzLlWAn46ZkjqUq
         iNz0Mk9Zijo/d9pVAfene7m2jQltTaWXHRAKyY1wmQuWJQnBV5DIyV9nFKOp678QqOOD
         1Yp8zjYP6CfzFvsZhzNHnm/XZfdthowppO0K/7mVDQE8yvsIlQu2tT3E9FtMLPYfIOQ1
         QU8CkRUxpYChWyQVqlEeFdOaMLrVlTa1r1/EpPOnvTPxNHCspgY45rF7+7j9p8SdMO2K
         jZLSTfP0y+keZs6/zueQZQFpU07Z4+1GLkhYvUMT9DXjyna1hvHCd/WZYjZ7Lkv8pBaL
         XWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537382; x=1787142182;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAxA3lYXjYvQzaKtcs4NSsbwGX9ohjI2k2yZr9N60vs=;
        b=dvUJEfcvc6O4HP7xKiEZQNLg60WbbiivNaULCvPn5O/vBFrlVXX1h3Zp+JgB5bMUYl
         S0K1gqMmH8LZbYKEDEQwFQ7t3h4BADHH1+d0laJmy1CqbCDqys8bC5zVawKrWF1ORIQ1
         YYfUavXitrZ15hKkDOQrNhqz1MusXsqbBzMNVHLDOhpTRTT2QnciIVLMxHJRZ6ZhD/ff
         3I9g8WbNYtpPydAmEdKJ1TPfO8HYmhDOCujTk65C2HZ5iSrd1AcHTBrsb8RcuqtYQ7vn
         EG7TImEONKitUV1pEhlN3Wep1DcrDtAcV/tOnWVvDF8923znZBz+ZQ5x94dGpGJa+CRJ
         09Vg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/YkO8yeYvPeaBclp2M2eWterPbpM5ZmsymgXEyg85OSOd+FxYQi01KREoV7TEu8ul1RdGbRJArU3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyEd88S0CgxbEA81dBrqF33eUEWZREVck4/E3IDHin+RHMimC2K
	vqgoWHRVNb65XiGuv2OtbZYW6ZBgEat4+oMO8NmRSQ4+8uArYLQd6CxY/jG2wtUhV/s=
X-Gm-Gg: AR+sD13rs9BggXMNkmkXtMbZ++wyDb5HQlIioaz8Xe//Lzsg1LCqZYcyIDnG6r7r0xm
	nqaFYS8uoeOSVaO//qSkWqviS1EugdFqgsbfqecxtkUDN4/s0ErbieV54H7+35ednVsGmo7/H3J
	VAqveKsqyMXJtY706qFs1lYdIRcvl/DLTuLf+n/26yOuwOU9QvhKGWgqaXHIKASez8wHReZrfVa
	+M88HfJV2YFjVA90pXnz2b1xSt9B9BzAodB4jcTVfj163C/onOHl5Vk0wXtEcne20BVdm5azOaA
	REwzKEYMFkLW325T1axbwZ/RzRCYz6Qoc1Xf2W0L7doytJETURoATKgjs/JdsKFFMY3oT40im6j
	3UISL3BcRB+d+JVpkfkz0ndxbYWitDqAbsBCPqmsGENrTgQkQsJ91sEox36awVOvMW2us4sMD8g
	gS/ly/IWnbIBD/kmfEO/cV5FXwzDbjXFSXJMX5ZOe8ZvldAKVhMiYfqbU4gj2I7sH6OBqaWeTM2
	ZkaXW+jqSyfbJ2n2ixgTqINO4bCqbdFak+DE0HiZo8E
X-Received: by 2002:a05:600c:3111:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4997c16fb4amr56418655e9.18.1786537381780;
        Wed, 12 Aug 2026 05:23:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:405d:735d:801e:de34? ([2a01:e0a:106d:1080:405d:735d:801e:de34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf94c1sm66698225e9.14.2026.08.12.05.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:23:01 -0700 (PDT)
Message-ID: <19e120fc-4b60-4188-86d8-cb3705a5fd33@linaro.org>
Date: Wed, 12 Aug 2026 14:22:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek
 NT37703
To: David Heidelberg <david@ixit.cz>, Esteban Urrutia <esteuwu@proton.me>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
 <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me>
 <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz>
 <58d7ddd4-1488-4c34-be85-6345138aa238@proton.me>
 <7097b617-90be-492d-9637-4a2a101379e0@ixit.cz>
 <05d2ad33-a681-41e4-87f7-e3aaeb5428a8@linaro.org>
 <803e354d-55b9-4904-a4a0-9eeefa0c6ffd@ixit.cz>
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
In-Reply-To: <803e354d-55b9-4904-a4a0-9eeefa0c6ffd@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/26 14:15, David Heidelberg wrote:
> On 12/08/2026 13:52, Neil Armstrong wrote:
>> On 8/12/26 10:46, David Heidelberg wrote:
>>> On 12/08/2026 07:21, Esteban Urrutia wrote:
>>>> On 8/11/26 9:05 AM, David Heidelberg wrote:
>>>>> Hi Esteban,
>>>>>
>>>>> Usually the used pattern is vendor,ddic+panel-model
>>>>>
>>>>> novatek,nt37703-motorola-bronco
>>>>>
>>>>> ...but motorola bronco isn't the model of the panel.
>>>>>
>>>>> My recommendation - look at some video of screen replacement, stop at moment
>>>>> when FLEX cable from panel is visible and that's where the panel model usually is.
>>>>
>>>>
>>>> I somewhat doubt the panel model would be located in the FPC cable.
>>>> I did search anyway but didn't find anything of interest. And I'm not
>>>> willing to risk damaging the display flex or the battery of my
>>>> development device just for a possibility either.
>>>
>>> No-one asks you to disassemble the device :)
>>> Sadly, I haven't found any video doing display replacement either.
>>> In worst case such as this I assume it make sense keep the phone model in the compatible until panel codename is found.
>>>
>>>> For the compatible pattern I used the implemented pattern for the
>>>> NT36523 TDDI, which is also used for other ICs such as the RM69380.
>>>>
>>>> So, I believe it should be okay to leave the compatible as is.
>>>
>>> I would like to hear a word from Neil first. In similar cases like this would make sense to have one way defining these compatible strings used in phones.
>>>
>>>
>>> bit I missed in the review the part:
>>>
>>> +            compatible = "motorola,bronco-tianma-v2-nt37703", "novatek,nt37703";
>>>
>>> Unless the driver is able to auto-detect the connected panel (unlikely), novatek,nt37703 doesn't make sense. The DDIC without the panel is useless.
>>>
>>> For example, in sdm845-oneplus-fajita and enchilada, we have the generic compatible because it was introduced before, so it's kept for compatibility reasons. There is no need to do that here.
>>
>> Yeah today the norm is to add the ddic as second compatible entry so the first compatible just describes the pane, so here it should be:
>>
>> compatible = "motorola,bronco-tianma-v2", "novatek,nt37703";
> 
> So let's me present a situation which can happen, let say I'll be upstreaming:
> 
> DDIC (novatek,nt37700) + panel (samsung,amb630qy).
> 
> For the example I choose samsung,amb630qy because here the panel has phone model in it, which avoids the possible issue I'll be describing with this schema.
> 
> Vendor can pair this panel with different DDIC. Thus it would be
> 
> compatible = "samsung,amb630qy", "novatek,nt37700"; // new one
> compatible = "samsung,amb630qy", "novatek,nt37703"; // existing
> 
> The reality the driver picks only the first compatible, and that's all causing to load wrong driver now.

No, the core will pick the first compatible that matches, so...

> 
> Solution here would be differentiate between
> 
> a) DDIC + panel
> b) module name (consisting DDIC + panel).
> 
> We could say module is motorola,bronco-tianma-v2 and contains [ DDIC + unknown panel ], which doesn't even have to be mentioned in device-tree.
> 
> While it may seems I overthinking, in this case it doesn't matter that much, I already have patchsets for DDIC which can be combined with three types of panels (and using different schema) and I would like to have good solution for longterm contributions and development.

... in theory we could have:

compatible = "samsung,amb630qy", "novatek,nt37700"; // new one
compatible = "samsung,amb630qy", "novatek,nt37703"; // existing

and drivers would only have:

"novatek,nt37700"

and

"novatek,nt37703"

as compatible and then a separate match table with :

"samsung,amb630qy" and "samsung,amb630qy" which associates with the panel data.

If it doesn't match, return -ENODEV and it would work like before,

I mean it's valid, it's a matter of implementation, if the same module can have
different DDIC then it should be described like that.

In this case, the bindings should be for the module and not for the DDIC.

Neil

> 
> What do you think?
> David
> 
> 
>>
>> Neil
>>
>>>
>>> Thanks
>>> David
>>>
>>>>
>>>>> David Heidelberg
>>>>
>>>>
>>>> Regards,
>>>> Esteban
>>>>
>>
> 

