Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C348AE00
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963293; cv=none; b=XNYeF1POuOsDJCgTtaOGWKTIA0tsyEm5tHYIn/h1Ce/pa6ONaxoE7dBbnGMxHWrDpPCz9mzF+p5RSGs+jfX6E+kY+/EDCVsBLDYR3vHMarffNCVDbHy6SmLzj7Wk46HPV/ZF5L/AjSMyVjerAe0n5KcQGkTNJZTMgZJCrFqaYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963293; c=relaxed/simple;
	bh=N7A7IigKO7ML2QE5eeUAjZvckXF/S11Sj0i5eEwHoDY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SkNujJLB5N/IZ2HJm03l+KwarLEIPeWtKcCfXxwtPsRZRtJdFPvseLuJFCNN7XV8AbDQkp4/sNDeweXfYK6XKvWNh34STiwg90Mq3oXF0X8YID2fVDVh9zFc85KywbY84a89a1FRJhAVbVzM4hXbyZw4+aU1L9IDK91pyfpWJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKawQGY+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKawQGY+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2929564f8f.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791963289; x=1792568089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDddpRmq7NudtrghvqObzD/5hDF5WVy/n4c9BUeklck=;
        b=pKawQGY+ynHmsvtwN01s1WsvvYA3CHudBAJzNTJIwWtDdoezjNYLMBMAG5YQxd/5xp
         Gwx7hZfsfPjIKIpNxzkKDEIGthmyOIQXPbCRloOjM82tDls9mqT1PcdsBziK810cdkSA
         KS+5AMP7Yz9FeLXSrSmiyFNYTsMot60QCvXcOQnTmpwE21oGnGnklzbDHJHrW5Yy6cIz
         P4lle2FyHh7vmpI8IrLwJvi/ORY/X4S1SO9GK5evP8r0cep/X8veo9KdcCa0JO4xp5cp
         RB59noVAQCUHawc4/ABVA2aUxBAWYsgQiSD2Yz6oXbiGP3Vt8EfQZmPmlAk2CaAmDEap
         i1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963289; x=1792568089;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDddpRmq7NudtrghvqObzD/5hDF5WVy/n4c9BUeklck=;
        b=e2wFmtmlGedgztM6r8sTzKwPgG5wfIWRciJQlXlXcmmumVmBe4UKU/6gwqRrecgY7/
         f5/xrcX4qlKyjN6cXyFcHbQZf2i9ycX6sPDRchLVaSPCRMpWmhlFYhAQOpnIIouEd6dp
         OXYFFv7z1KwDES4nWRpZ3y1rFx1PIAioXpkYfn/9W5dtpRJ4zsV6REUUoKdnbOmPciRl
         GqF0WgZmK8ksmPdaAsUyhyEQZX3m9FKJ7qbriHWpq5OqH1XGJECrRcCP7g1YdTz7dYrc
         4kHab0hk77ZxWNgXbeEEpl6cHm97lzVQWNq08wpr3yz+CPcvy1VRGUxuMAwowqlWta7t
         +jnA==
X-Forwarded-Encrypted: i=1; AKwUvBzdPpG7e0ZG3IJyOTxwP7pi3J215p8cSgAUFsMp73+mFSnJxS0cxZjrbEWQh5M6iOjBzRcHzD8b4iDU@vger.kernel.org
X-Gm-Message-State: AFq9FYK3uBKNGQHCcf8gWHAWNQi+mq5CkBOxUeKKjz2uypODmv2Wj5Dz
	Bk/YjTXrsMigq37bNtp3uWhxgA2FAmvITMExlcO4oTG0YlKrhn7/Iem+ZSqNaY8KFyQ=
X-Gm-Gg: AYBFou20g9I/P7GbQrUWgOYzGa01NMixgaYG8vFYxX+N18tBDIChZBHzxlASA5Q3d7D
	XgaOxircnwMPG5iy2cLsJLGciNVXzVdHPKykAp+rkWE867YOgKt6Cyk3B/dgm08uaA66IYxyGxu
	Ol64o4QTQAQ10Th1LTP73ARHK4cvLPB0cJMHHDKVH7dvJN2vFFcYOzGNXhNyM1QblK/qJBwc8rd
	YsIL41MkynhHONcowb5Wum8bYREoyKgJC1HIewQxCH4BgIZe8NVs7mCqEDt1DrmPtUpBprM2fsb
	IAJn0gmkrO/pkhbu38h7pl/pb0XgOgUOX1WtpY8dMMqCI6Vp2+kCMgHK7Hwtci7oWrp6NjpjK+Q
	Lv65fQZ3WqOumqvpyNyYLkPmTY6Rs235iCCRwI54W9SF4ovsOwiyYSPgSDKjPG/rKB4cGkaj2Ac
	FHEiLcr+yIQQCp/gtY/emzH19CS/sgHHQuikTI85mD8LJs8dG0njM1pOnNI+ciTVCqeOAY/wY0Z
	oaCZSUoHQCC5pUJQzTrHT29oj1QHsve39itaVcWpFEFRXW7iGAfwT5IaMe7DqSN
X-Received: by 2002:a05:6000:29c3:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-48dba7876bemr19176220f8f.5.1791963289209;
        Wed, 14 Oct 2026 00:34:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0acb1ebsm10342962f8f.44.2026.10.14.00.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:34:48 -0700 (PDT)
Message-ID: <b7764a6a-298c-4bcb-8d60-fa8b830aca06@linaro.org>
Date: Wed, 14 Oct 2026 09:34:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-1-d3604ae4a229@linaro.org>
 <20261013-subtract-oblong-cc6cd3d9cee2@spud>
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
In-Reply-To: <20261013-subtract-oblong-cc6cd3d9cee2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 18:28, Conor Dooley wrote:
> On Tue, Oct 13, 2026 at 04:07:11PM +0200, Neil Armstrong wrote:
>> Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
>> Accumulator used to monitor power consumption of portable systems.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Previous review still applies?
> https://lore.kernel.org/all/20260924-circling-punk-e75ea71e60b0@spud/

Oh crap, forgot to address your review,

Sorry,
Neil

> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>> ---
>>   .../bindings/iio/adc/maxim,max34417.yaml           | 100 +++++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> new file mode 100644
>> index 000000000000..058af61cc04e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> @@ -0,0 +1,100 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/maxim,max34417.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim MAX34417 Four-Channel High Dynamic Range Power Accumulator
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description: |
>> +  The MAX34417 is a specialized current and voltage monitor used to determine
>> +  power consumption of portable systems. The device has a very wide dynamic
>> +  range (20,000:1) that allows for the accurate measurement of power in such
>> +  systems. The device is configured and monitored with a standard I2C/SMBus
>> +  serial interface. The unidirectional current sensor offers precision
>> +  high-side operation with a low full-scale sense voltage.
>> +
>> +  Specifications about the device can be found at:
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max34417
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vdd-supply: true
>> +  vio-supply: true
>> +
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
>> +        maximum: 100000
>> +        default: 1000
>> +
>> +    required:
>> +      - reg
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        sensor@10 {
>> +              compatible = "maxim,max34417";
>> +              reg = <0x10>;
>> +
>> +              #address-cells = <1>;
>> +              #size-cells = <0>;
>> +
>> +              channel@0 {
>> +                  reg = <0>;
>> +                  label = "ch0";
>> +                  shunt-resistor-micro-ohms = <5000>;
>> +              };
>> +
>> +              channel@1 {
>> +                  reg = <1>;
>> +                  label = "ch1";
>> +             };
>> +
>> +              channel@2 {
>> +                  reg = <2>;
>> +             };
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>

