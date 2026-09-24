Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3A483BF9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256238; cv=none; b=p9Iw8kdepnnaue3XGKnlL8u//smjFsQ8p6dMxICzrxwmkOiZWX+O/GvvqusU3pFzOrF/9udMvpb0KdVh3IzkjAfqA69AlzgiCvpzqt/LqNhLFKTSypQCotugvR/DLcL0VlmSXNcObF+I9ik/oGsK7SVYG/HdeecOj37pV+jJj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256238; c=relaxed/simple;
	bh=0Lo8Fc4RrHTz2i0pVyyvUOWs9Q7J+HdB9eO5ehxCpZg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gTvbhhsk2hTtKj4Nyp3E+7IIrteqbiSFUlYNm1+pWn98hlSo9NP9OsBHwiZL+pTsNFJ/4OBeEBhIZJ7MhFJZaeyx/cZzGK8J4ag7VYt93dll9iWIw/+7fwLrWfwhiouAiPPbDYA1gvXzYtMoMcFf9gpX9mNGv3hmjQ6xizTlF8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBhZHHeP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBhZHHeP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so11482555e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256216; x=1790861016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLz2UJ7WZAfDvJwz6oWzjaHjslHfX+WvIHzGXDGM04s=;
        b=vBhZHHePIkPFBxnf5dMtvmhbGagcOMZ/aE4kSvv90Zz/Wq9qedwjAJHYFgsh9MaNqR
         LSWc+3FeuO3aVkVo8u86k4YraOmf4JExUiRo8lpyLKobq7CNaopQ0Z2x8v+8C8dHeArM
         0HB3HYw62AHtAw8IDltaosLgjJ9DvXTh3N2npfUptvZYIWD9QgrVUdoXq8iXF8JQhLOt
         UuH/qexoj+rjyWFHPGxVFpUjjdoNTUGyyDFtOjLTsgVjxBu1ol6EZSBV8uKv0C+2bXk6
         6DwM/N0yeVZBR36hmrdd0pPsXipPDi8JpyEgbGxn37aYYdMIsXkexzczOo8XaSxs4QX5
         4qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256216; x=1790861016;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLz2UJ7WZAfDvJwz6oWzjaHjslHfX+WvIHzGXDGM04s=;
        b=x8lruYR99aHCPeoptBKFEmhIGkeSUBsJ/rBnJSXdE4+iHXcK6FYNPKa6qM19RhXBNK
         reItVCwFiBMO04YqPge23Xf50iugzAE0vtjthfTEmx3jHbcZ6tCVMrOgCFC5OFUxLIPW
         7vmyS1T0JEx6AWRAhraU4xKZpzr11GSShPX6AY/z782oGfpREKesG2m/rfOmwBsgm32o
         lpxepUDfY9dnP5BuUrp3IBpuzz+YmMrcySPDc/uIEKblBjyjQ3JK4J/TpZVb02JZ+Dau
         CB5NdyIATdu1yjWiHaBn9LfSj3qEdczNAY1CEhz6LXtIZRS1wOw/mJUpVt0hlx51Dadm
         xRIA==
X-Forwarded-Encrypted: i=1; AKwUvBzoFr8jsx6cuPCGS5jKehMK/g2rSCdlpfayXQn3uFm9+fXUxOLlvZr+X6+yUktjPZpHVlQ1ISLI6DqS@vger.kernel.org
X-Gm-Message-State: AFuF++ny/nzYmW8cBHqeFFSoLK+sicJZ1iYfMb+8SUSpMs0j8pqiLXGq
	3Auz9gvTaJLss27qzBzctQsQNYfj1I03M4xD/lkS0uWTMsUVdaMzI80zORf3kajRjwE=
X-Gm-Gg: AYBFou3ya6TaSfNh23EbaA3DUkwalOEAQZo/aRAw2JOLHwvrW74Ay6d55l8fA3yhWs/
	xAQdRZBQnFBrHZPWDhNQgnB/TuigLYhky4W2aS8ONqnnlWTeLC65jfAhyF6u6jchnKbrdOgI0T7
	VGG3ACXYjyFJkkLDNq9m89VirA4WmQ08roQq82zOcORDP6v8p+RBir/UFmv+X7LF38EZz5nQKgL
	1xjyviFIL2HLjEg5EPGabNQqbVyoe7PyQHVJtn2ovkcJv6m0pWgfhbxZyT2k0PVJghUWGlU+3qw
	JPgTcpK3OSqIwWBHlT9PRqZL38iTPhemtLIJufEZbxb3Wl4wLfy6Xx0FB3KfmqnMAYaP0s5joEK
	vatgNoi/ggdJaNfzQE5Vut2mMTNuRymzMagvLoBV17QYkRdzD23E+N8ph6nN38TefPRNcInqqS4
	hPC51Xle0tBYTb+hwI9TQltLxud8XNxNh/kOXsGBBQJaKXFSYsa9b5rtsdRcZ5O4LBVivJPTKPT
	rRM6Htbth8KeTGeVPuzVwz8vnqSb2capkXnI58VhAVn+AOueomu19U=
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr42901125e9.0.1790256216193;
        Thu, 24 Sep 2026 06:23:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm14891752f8f.12.2026.09.24.06.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:23:35 -0700 (PDT)
Message-ID: <1d014f4d-1c05-45d8-b559-6ed03293db24@linaro.org>
Date: Thu, 24 Sep 2026 15:23:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
 <20260924-topic-sm8x50-iio-max34417-adc-v2-1-9a0609e72f5c@linaro.org>
 <20260924132022.D479F1F000FF@smtp.kernel.org>
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
In-Reply-To: <20260924132022.D479F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 15:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: max34417: arbitrarily restrictive minimum on shunt resistor
> --
> 
> commit 3650a83bfbfc37f2001988362d1f90e712127acc
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
> Accumulator used to monitor power consumption of portable systems.
> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> new file mode 100644
>> index 0000000000000..058af61cc04e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> 
> [ ... ]
> 
>> +patternProperties:
>> +  "^channel@[0-3]$":
>> +    $ref: adc.yaml
>> +    type: object
>> +    description:
>> +      Represents the internal channels of the sensor.
>> +
>> +    properties:
>> +      reg:
>> +        items:
>> +          - minimum: 0
>> +            maximum: 3
>> +
>> +      label: true
>> +
>> +      shunt-resistor-micro-ohms:
>> +        description:
>> +          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
>> +        minimum: 1000
> 
> [Severity: Medium]
> Does this minimum set an artificially restrictive lower bound for the
> shunt-resistor-micro-ohms property?
> 
> Valid hardware configurations could utilize sub-milliohm shunt resistors
> (e.g., 250 or 500 micro-ohms), which would fail device tree validation and
> prevent the driver from probing.

The min/max values MAX34417 are taken from the datasheet page 18 Table 14 (Table 14. Correction Factors for Various Current-Sense Resistor Values).

Max 100 mOhm, min 1 mOhm,

Neil

> 
>> +        maximum: 100000
>> +        default: 1000
>> +
>> +    required:
>> +      - reg
> 

