Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998D3E1203
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179231; cv=none; b=kypimvCpLhUU0dSrRgUj32hJYDOf7RiqqI+YpDwhz94nQgavAmlZtw5LxULNGgt1hNBDKB4YWtRAfkDLdjfT2A1izUOy3xITdGu/LA14KQy+kF705Mp3K1pSq/m1eTcin1xzsDqJZ5mgL17SqjAckXKkqR0lqz47GFnpg63lPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179231; c=relaxed/simple;
	bh=vHq/QwysCAgnNKiBTbbYeanowaRKF+5PysX/4OYh2GU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ASvO0Di1fT4y2wB4pohr71uirSTUmnV2cZ/U3UHkXdIrAkq/JW8kIZkR4egZzaBdjgid2Z9O4K40yOUJ1TNt9uilOhpjuIuv5qzgOsu1/FeDGI4fsFnyQPrCkxOZTUbKXnkDd/GldZuJh9/2d8mD8x6IkLyE9M77Kd5elQupw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkbciwYY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkbciwYY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so35683265e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779179228; x=1779784028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li8pLXuBuaVtnggQNVW2WcAL7ywg8DDPWHRsGjdEDzE=;
        b=RkbciwYYvBEL7DAvnjuDiFDpzmTh1zqQVKaKTkk9rH7s2UF8XJK6cTEoZEPehsoV7D
         9kUtoTjgOmSa9LrAKLOxz5bqOB4hptsIR49clXXdiSvmc26z046nTZId7wbs4b+ElB6b
         GcbuPkhdpJ5fsmqmMwG6QwVe27713cgPkYz+7rKkk5u4KqYBFVLqiqZM06J3cfC+1kL+
         Izhg6SJuVHd7nNE2H8Uq23tYhZHg4MLkWJmnrZ+VuUFGTYFNSOXIiTpBXqwneNWlvE3Y
         tDSLddflQnhxzs+vRnQS/qbhcgjgCEY9494KaVGQrD7Hjy9erDq+BEiNnLplZgST0xju
         X7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179228; x=1779784028;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li8pLXuBuaVtnggQNVW2WcAL7ywg8DDPWHRsGjdEDzE=;
        b=blIgBCiqCZpstTRZma6sgWKnfQWMsDMuabjBB5AwBJQxiGuPXBgFPW5NWSCDw4agh1
         jCMZTmMe7bmMof4QNgs44KiX3sqUPuuJFUz6/6T5f59zkOf5QUlISa+L7tPJruUpR8O0
         bClh41KDCd47X4KuPDaF2WGNnSML+UafFo6C9vVuny1frKXpcjWDDrD1OlGgVyBCPsP+
         ED2ZbgKu7IFagjJDOmaDtwFwnB2cSPoxy/MpOpiAClbSkClthH9VJRY5KAhLD/6ZsOWf
         R5gvtJhe8XxraKNRPz0Bi8Opfcr30LwKb/Xa0TnvdaLRZA14UghY+e0YbNVNAuY6gCRi
         xu+w==
X-Forwarded-Encrypted: i=1; AFNElJ8n5zR5aDXbKCFz+dNAHHBewznuRQz+VBcf5A8IkLHMLM0EP6LA0KJaQVN8J/CwNuASR+ygUA4t3G7f@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKuYmzLcKXu7V5suR3PT1yro+wQKfI3JtMH2LlrsYPi9fmeHG
	ph69F2zoumPymgk3FC6w3xaKd7vdS6UbFfm1894b+ANHBi5rtLD+ZkLNBPCbEkBwn0qgtx4WB1c
	CY1Lh
X-Gm-Gg: Acq92OGmcWPv6IVNXbw+2HfDPI11dy6GAC1XRhkUx8Aq5JP75yzW0isNh612VoYwLhv
	L2i+n+xJEjz9X7hj6jhowGQ4kEAwTBROmC2S9fgeRvh7Hhkixab0/kXlvu59pKAWu701JhbYrBF
	HpY8g4UWZUKjHR6ltvvLgvYki3bfsW8w0sjGU3luldAtFH6OJOCCkfLUHqWXxQdoRrDg0nW3F8/
	4LQ41K856+V+bOPbFtqCbwBUImTalZeCR1Gl5jNPmEg0NjTAnP7Sv7sRxmVnrJpegBczbJZWWLJ
	HfEpjQs6G8NEIIkPtp5h4lqEvCT9Nqv3fJl/Ozri9jdcU0qJSLMh/ek1o/mD0J29tLRn5hA2+Ng
	9xpvKStDGoNtlQVyP9Pwz199LEgtpn/6GvEa4YDGJH1zJb2F7su95vD5R8gOiMK4ccC9WfkpUJU
	Pd4HV5M5zHbGk7krrIbwgbSD7g6hQiR5wY3RpGCgnSDKCNhQye9sY5MRWl+MajlOitvQtMC3/aQ
	7vlcfM74jBW5Mg=
X-Received: by 2002:a05:600c:a406:b0:48e:82cc:4d4c with SMTP id 5b1f17b1804b1-48fe6514939mr226969685e9.23.1779179227682;
        Tue, 19 May 2026 01:27:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm328708975e9.12.2026.05.19.01.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:27:07 -0700 (PDT)
Message-ID: <cfc5814b-fcee-4d61-83bd-6a977b792cc2@linaro.org>
Date: Tue, 19 May 2026 10:27:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
 <20260519081829.6B1B7C2BCB3@smtp.kernel.org>
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
In-Reply-To: <20260519081829.6B1B7C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 10:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The `reg` property is omitted from the `required` list.
> - [Medium] Schema validation bypass for dual-DSI ports structure.
> - [Medium] Flipped positive/negative voltage regulator assignments in the dt-binding example.
> --
> 
> commit b7585613be27a07063e2837b4b237f47e298a1f5
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
> 
> This commit documents the Renesas R63419 generic DDIC used to control
> dual-DSI LCD panels, specifically for the Ayaneo gaming handheld devices.
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> new file mode 100644
>> index 0000000000000..e4db01f88302c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> 
> [ ... ]
> 
>> +description:
>> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
> 
> Since this documents a dual-DSI panel, should this reference
> panel-common-dual.yaml# instead?
> 
> Referencing panel-common-dual.yaml# would correctly enforce the dual-DSI
> topology constraints and validate the ports structure for dual-link DSI
> panels.

Good point

> 
> [ ... ]
> 
>> +required:
>> +  - compatible
>> +  - vdd-supply
>> +  - vddio-supply
>> +  - vsp-supply
>> +  - vsn-supply
>> +  - vci-supply
>> +  - backlight
>> +  - reset-gpios
>> +  - ports
> 
> Should reg be included in this required list?
> 
> The Renesas R63419 is a DSI peripheral and must be instantiated as a child
> node under a DSI controller bus, which inherently requires a reg property for
> its virtual channel. Omitting it from the required list allows incomplete
> nodes to pass validation.

Good point

> 
> [ ... ]
> 
>> +            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
>> +
>> +            vdd-supply = <&vdd_3v0_lcd>;
>> +            vddio-supply = <&vdd_1v8_io>;
>> +            vsn-supply = <&vdd_5v0_pos>;
>> +            vsp-supply = <&vdd_5v0_neg>;
> 
> Are the voltage regulator assignments flipped in this example?
> 
> It looks like vsn-supply (Voltage Supply Negative) is mapped to the positive
> regulator, while vsp-supply (Voltage Supply Positive) is mapped to the
> negative one.

Good finding even if it's only an example, will fix

> 
> [ ... ]
> 

