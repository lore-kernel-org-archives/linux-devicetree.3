Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15766428495
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234108; cv=none; b=e89PVUux71xfMAEKDJ2gv5y7Qs5Tfld9NlwiE1sXoSmKnMREBX8shLGLAoAkPQwWCPjO5JhQd2cJHyfSkVVefxJ35ucvIqvvy79Qa1daMrbXkN7KwN5H43kkki/qd8hAKZuAxF+P+etpXOeXFUY/0zBMEDT5ITDFcX0UMOMFgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234108; c=relaxed/simple;
	bh=9yPvdoXEA8d4TMm6YJ/Wz8gy+UtkwMYdbTYWnkbt14s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fZGxQBJM14TqfShdN9vuSkXu4dUcm6mDE/D8aFAV1w6wDcHGHrmi7KmGJuw+o3YtDf7QvwGXEjoWJKAZHRLw7138FKJs8+FCdAj9Fy0LX8TmL6TOFybdUUHRJCd9e16+PMMOT2/gQwhN/B8zvx9en+AcPl1v11mjZJIUyMWNWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yuy6nfj5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yuy6nfj5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so12592535e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790234100; x=1790838900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJMkGAtSYRWXtY00c+2nLuxR5+Tw99RM+wzkzXUoPjA=;
        b=Yuy6nfj5OP56mIr+EJXgG6iigeHGHI8V4qbVBtkSuEMMmLW+huLg0Jkf3xk/CwQhmc
         7oiG2Qg7vKPGuFUWS69AKEGW4lL4g9R1gZXobHulxDFG5IzpsGeY6oHLDZW7NowJvJey
         ZkLWlBkieDDuw7XEEZdKiOxT7LWtkFwpp24Gv6Etnf/O5NXaeTdfy0R+GSZVJ0jWdM9r
         ZSD0kFKr+mAv32PY0WmC3dcKFxslt/AymD0odqjKxHHh2vqf7/DOZn+uAw24ew7ge2Nn
         u4Mkt27ftmgRTN56aGiJCz6RV19vWZrIzWe5OPPsG7rNaJ+UbWkf5TCIzi7NPNYRxlbz
         7xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234100; x=1790838900;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJMkGAtSYRWXtY00c+2nLuxR5+Tw99RM+wzkzXUoPjA=;
        b=OUXbHePwTSEaMFGIg0ZQ1zpjZi42D8PiUQs//wtgUQMH5hbtFPhA18sikMz9JSE+K3
         pPXA6nl33hn3xDExF/+eIOwl8r+bcFxTVnIzYf48Q+ecti3kfEBuctnbMPJdjZ94ujlT
         KhSdDdCGsba17w2AffZI5DLVz7pc1CdxZyO0QOrOouOv+pMdBfO0REnfVp9/UkzlHwsX
         +hlbpph3GL+BT37XY/GT7/jHO6rMXkJwjcP0exf4TDSa4GIL+PwGHhmsO71gQ4MLC675
         TDLhUOegheMsu27gP8ptNJDOt30lgw5bLJAvws5F9s1ioef5p/hhlslxxmUAHPKHNFVx
         nHlA==
X-Gm-Message-State: AFuF++kgWlnsLePoQh3lgqZjrPvqfmKmBtzZnsiFuoirKKTakJ2dg8wq
	mNCVpJwCAuuzDuU/jDMAo2pcIP5bfsgPxnpyXf12NFnrFIei5rfglfcDsn0cpYmjgfHpY6MIYrx
	JrcG1qjY=
X-Gm-Gg: AYBFou2VEMNVEGI2qJBPquC9DJxc7Fc6Z3KeV4MnGQ2ll3T3Wgd+IcT5ilGnzyGDG+V
	bnLetA5SjuregcAu241/f0ocK2OBtGsw3EA+XiR5k83NjNGQuiPGdPjBTYfXd30ZjBnjEz6M+fn
	kY1WOaY16VMlsA1kdlwQZyn09aMlZy8V0xW2Vj0WFpKdLK84MV3rHs5UU09CqylSx7kdcT0GcWg
	fnm7jzDREjGczaftUAH2lPuMIRdXm1WU4X+f2fnQPqxNuYmtLCaUlpX0A1n4I3NqVhQYziZiDoP
	meFV7PZXT/9Cw1OoM+/EvREKY3sNALcyRz8sz27m7Gr6g8q2iojyZDmF3mOKkPStf4TFnzjYwO9
	gB+0RzV45hj+EKLKOdfdEx7z7zrpw473L3TvLoqEm+wTlART8CmhTKdB1c4b2XNGEq0zWf9d4Bq
	xiCSVjBaYkztC4yDJCTsPh+Zoon9j/RUm0GSe8KRu9chWH/AbWDZNp6h9hjHxsFI8xYxisMwXOt
	8+h9I3uo1fPiVk3jsTiFQFhMGOu7kPXKawTSuUnuq1j6l3t7FfXMfuI
X-Received: by 2002:a05:600c:6091:b0:49e:6c9b:4e94 with SMTP id 5b1f17b1804b1-49fe7bc4d6cmr16270115e9.28.1790234099948;
        Thu, 24 Sep 2026 00:14:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5e86:d153:fdb4:61c0? ([2a01:e0a:106d:1080:5e86:d153:fdb4:61c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm117990005e9.1.2026.09.24.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:14:59 -0700 (PDT)
Message-ID: <d879b1ca-3f64-4c3f-bb3a-0b80b0bdc582@linaro.org>
Date: Thu, 24 Sep 2026 09:14:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-1-41d4ba1bfc41@linaro.org>
 <20260923191810.34AF81F000FF@smtp.kernel.org>
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
In-Reply-To: <20260923191810.34AF81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 21:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] dt-bindings: iio: use of vendor-specific rsense property instead of standard
> - [Low] dt-bindings: iio: unnecessary gpio.h header include in example
> - [Low] dt-bindings: iio: contradictory default and required constraints
> --
> 
> commit 83b0b12b383dfd05c3631355160ac1fe40dc6802
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit documents the MAX34417 power accumulator device tree bindings.
> The device uses an I2C interface to monitor power consumption in portable
> systems.
> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> new file mode 100644
>> index 0000000000000..6f2339a927710
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> [ ... ]
>> +    properties:
>> +      reg:
>> +        items:
>> +          - minimum: 0
>> +            maximum: 3
>> +
>> +      label: true
>> +
>> +      maxim,rsense-val-micro-ohms:
>> +        description:
>> +          Adjust the Rsense value to the resistor value
>> +        enum: [1000, 2000, 4000, 5000, 10000, 15000, 20000, 25000, 40000, 50000, 100000]
> 
> [Severity: Low]
> Does this binding need the vendor-specific maxim,rsense-val-micro-ohms
> property for the shunt resistor? The standard shunt-resistor-micro-ohms
> property is well-established across multiple kernel subsystems for this
> exact purpose and might be a better fit.
> 
> Additionally, is the hardcoded enum constraint necessary? It artificially
> limits the possible resistor values, whereas physical shunt resistors can be
> of any resistance.

Good points

> 
>> +        default: 1000
>> +
>> +    required:
>> +      - reg
>> +      - maxim,rsense-val-micro-ohms
> 
> [Severity: Low]
> Can the default fallback ever be utilized for maxim,rsense-val-micro-ohms?
> The property is defined with a default of 1000, but is simultaneously listed
> in the required array for the subnode. Because it is required, schema
> validation will fail if the property is missing in a device tree, making the
> default logically dead.

Good point

> 
> [ ... ]
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
> 
> [Severity: Low]
> Is the dt-bindings/gpio/gpio.h include needed for the examples block?
> Neither the device tree node nor its child nodes appear to declare or use
> any GPIO properties or constants, so this might just be a copy-paste
> artifact.


Good point

> 
>> +
>> +    i2c {
>> +        #address-cells = <1>;
> 

