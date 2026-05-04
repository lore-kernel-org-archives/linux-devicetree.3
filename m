Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAACA5A
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878031; cv=none; b=JlqkeM2kpePQHuiXTPzwTz2clC3ZgDM+ohcudqtcEJpV9DdMsBn4rfb59tCUk4g8HXMZ9S8VHpywcrnaV/G+q59+mk2VzgA9OuwVw3RyrJS9qL2iLQmiur4RR/8oz3JgwGaWVM+2WvHI80ERUNgQKcJlmcCkSOrvRElnNC3k7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878031; c=relaxed/simple;
	bh=v2YtCahVPmR4fkIqkNFB58bTUY2+rl+IivMbth/fUfs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UJk5fmmNXroJVakma/YY7OONAImp6BUl2ofhW2MraKANjfJROVn+bA4y8XM3QF2l7/loTV7eGtrD6hC2mGLLijGUgdQWcO8RVUq8NTiPEPhLzKNjl0QLGeqzVEeVZkoFW2GAq/t8i/UNuBbwzfhD3JUJwlv36mHI6xjA4GHDrDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbONXA6d; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbONXA6d"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b150559bso24576465e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777878028; x=1778482828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ig2G9MuhX/zFTO0paqrpp7sX2tVVOFfNXEQnXrmaj0=;
        b=GbONXA6dM+PQzwQtmrhwFVyYs/MI6TJO0P4MLYKoyc8KYYymQFMnAeXxqUO0NLJfGC
         OBQvFY0ucV9gVxj5aaUVIL89W/YBgkCCnmcz+riZr9Pyj/T3sobmtaR9vSmpowNzn2Xy
         1swMV7dLwPvMO+XeVX7ZBuLYzYB9F6o2tB5VpvwQ6UH5i7YHNNbJRBTX7TdnL4Xs0j49
         c5CXzOH4FeO52bGw2aVcHXpV5UQRijueu1myRg6Mt+sA6CO0CSIgzM8CKFM8yT/j4KFb
         rimej7KuAfOkDYQ09Wct4eJYdFDcFlWS7q3UIzro7O9cmH8wrJYCqSYhv5CS9WpFyRja
         XBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878028; x=1778482828;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ig2G9MuhX/zFTO0paqrpp7sX2tVVOFfNXEQnXrmaj0=;
        b=FxXcle/1+J1sHmDE7Fd326KWcFUO0Vb3Cc2BC5o/zTdIh44tyfmBIaxq6yr5X9naMQ
         aNhHl02BEvsxRPjiSX2GjpP2Cj1AFnFQ6TAKF1Wm+HqOM8FcRm0xuYxLCriNJe6s8ugr
         IFfCcjOBDUcG1iJC5iicj8cJRXszAe9MFu6i3KBR7Gq9/hyAHMVgiPGGVZPEZH22sN50
         MhSUcfB/0DjlC9ydhPFx5d3XspbMo+BjsrtZJlVbqi+rNtd1f1nBl5sYWl+w9REx4RSG
         NiDtJ5GWwHi2hbrrHs4SD8+lX2eJSmIUsbS5OQgmZa/BNhMZmnGtNg0ObwKSgI2j66x2
         VLSA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZuSfzFBD3urY1Zp101m1fNsbbRgydU8DG9G+nhKkxsMhUGJ4cavjzlXuFOmr0QCUR1JBcFJ/PlX6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy9dhpvx8XQP4jSld+uWf1mOjVjfrJEgYOLUX46FY3HY98Dl/u
	IPmhNq1IJYa503C7NjKmC80TTTzm+mpumTXAexPcShBtCpom5a4F0tZGuhnmxL036Yw=
X-Gm-Gg: AeBDieuE+DNRhWO5mb6WhTTaL8KXRoxHqqZkcEJ3G3yMv4to70HUN7tdpyrxtZsFVA5
	qzcAXWo7nIUkIOgv4roOTuctwch4Zjz1S0K9TlIJ1h/1w2Js8AKLxPsrW491TcUSp8/YLrgXVBk
	ha2DmVmTPdQiTMWrJ1jBM02TDQFDD5YcgLfaSBRDrJeTjJcXBH5LZUkCLAnpamqRBBXD9Q50bW9
	A/lIQr6f0RynPiF1ndeCJs1xWOIFpAnyMxYFNnNuSpPj0/weVochVdoynrK5O5JiuQPEjeplqQn
	03UB0TpgP4wnV7FY9lJqvLHeNzuSDg4nNfYiQzcjniGejxVA73HPtLwqrCOMHQIaq0NpjBhnlwt
	MY7V52SmBntakC/i2lI9A6u2mmQEXmYTBgjSId8aQ5xXh4Eu4hxVgGQvjsc1Nk1vLU9o2m7XreY
	gDGJdhBtwSEqB47REWnxW9kn5LT8/FuuqyKjr07pvm5QlIlMtfXJ6evvHLAvBTRx06Ppwj3w4or
	1XfXqwsf3cXDva9kQ==
X-Received: by 2002:a05:600c:620c:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48a98670f8emr134808975e9.24.1777878027763;
        Mon, 04 May 2026 00:00:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4245:af61:1735:3752? ([2a01:e0a:106d:1080:4245:af61:1735:3752])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebb2fa5sm213757985e9.12.2026.05.04.00.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:00:27 -0700 (PDT)
Message-ID: <d673c19d-f659-4549-8c2b-d64bfb0f9acf@linaro.org>
Date: Mon, 4 May 2026 09:00:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: document the Renesas
 R63419 based dual-DSI video mode Display Panels
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-1-91ac10453d0c@linaro.org>
 <20260503-magenta-aardwark-of-order-432352@quoll>
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
In-Reply-To: <20260503-magenta-aardwark-of-order-432352@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/26 14:34, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 02:22:17PM +0200, Neil Armstrong wrote:
>> Document the Renesas R63419 based dual-DSI video mode Display Panels found
>> in the Ayaneo gaming handled devices.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/display/panel/renesas,r63419.yaml     | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> new file mode 100644
>> index 000000000000..17f166db3ca3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas R63419 based dual-DSI video mode Display Panel
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ayaneo,wt0600-2k
>> +      - ayaneo,wt0630-2k
> 
> Just like for all other panels (including other Renesas) you should have
> fallback to indicate the actual panel IC, even if it is not used by the
> driver.  Some SW still could fine that fallback usable.

Ack

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 

