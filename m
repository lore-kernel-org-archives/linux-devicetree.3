Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3D3C456D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900973; cv=none; b=hSJ3a0OlbIpuhzdtnLCaz/fKTLlaAgS6ob9y+mLIbLzTK0TiRv6dYzDh5q1dyLF1cBPrJswSSG2YSeDewbQZBjQlfdBzYSd5VvJfX1a9/rMUdwnUhoOYomTYJgKePCjtl4fFkligU6OwZIcqPpIbfVolwgOVmq18pQwLGB4qtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900973; c=relaxed/simple;
	bh=hPP1W5oM+PMZffUDhm7eGNzZLrmVscrBig8GQKpA9pQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pmK1VEU5iVdRGa09ylgJpVggbGElN86Uh9ZPvR/as6pn5hAopLBZKTFMY9R/WNWSYC6rz0tdn0pz0PnkiX2jg9GSVJ7tRvmswFxs0mrRjojBMAKaBWGwXHZi6LrMg8UrqKNXbKRbd58Uq1m9fMQx/jIfj66p1tBg9LdNAL9dyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8M82mnW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8M82mnW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-445795cf6f1so2404851f8f.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777900970; x=1778505770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nK3BUe90hxbNx22uyW4aJ4Z5JKnLCY2TLAKp1mVu7aA=;
        b=P8M82mnWRjQ4KsaLJGn59H3R7oJL4XweJWj5QO+8V+ngq95ac843BGwxZVbnHoSzIF
         jo9lqyXMIbs/tLdXE92mAL3hDetkvTwfk1vya868/N18ktEZVCzJb9OL0ak6jIFpTRwT
         vpWqQaA9L9TIPCVXo57yNwFgXUgrwUI1cDXDMWi9B7S9O2UCA74z4zRi8aUBTLn8th/b
         dp6y4W8sydPuDaWrkgTX1PI8+IKc6kt3GzeP/ou2RtXEHdwUd2LIPIpREbOSbieGtNqI
         zihy8keo1oAhxYI4LG08I0NYMGPSwIFvuEwinzpsmvrjjkCedN2nIjvq/4x5pd801uKX
         SGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900970; x=1778505770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK3BUe90hxbNx22uyW4aJ4Z5JKnLCY2TLAKp1mVu7aA=;
        b=rCJ0lYquHMfGxCUQeL2Cz29cv+OdRsz9Uv67cA5RvtL/xb1jHgTlUULhcu2YPiCpES
         1qxx8xbtmdDudxmkqI0n4XwTVmVLKsjcHxVsj62szQgp8xD6fDKFe1PYi32McPCpNsWx
         CbslBXgkun29qEFBcakOssMZQZdT7AHC3Gu1zWcEj+SF/c9VNqpub+c+jqJv4zkxV73F
         FGdW6Mu+U2/9s+q1SZ0fezAjdusQT+kBYlWU2oIbvZ2TI5bvL7cRPcPaWG5RKZkhMv7R
         XPRJRS41slp5M6BL2wZt0bQLG7SrolWIHa8y9JYF4z/KAn2sQaTqg2NVZ+9ocHxDj/xT
         s2aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yygm0JU8d2ChC8jM1a02VN2cCR/cvXx3zwkTe6O9x/wJHEHCXpfKmSZxHrgFX1kSp13T825qThOEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qwv+ZOwWMBQ9C/tK8prJXPWGIjLJ4wX/TxJAydA5oZu8jO6A
	JdOHWjilInh+AEtGR1LyFwGvrmsNUfjSKXeWrbtSY2JlSWsyd3kkPM1dXD0AG7XwXuM=
X-Gm-Gg: AeBDiet5rHtUytmC/d5JawoeWEf7Wk80lV0FPxpZsR7JlP+O1dtjVEWoayGwIjLRuT4
	folmIAaWZHRHwgcIv02HqDHTly7FHI9MsIEmFDTvegcGWQzjw3m0ugJEAdYgYt8yhvCSrf8SCQ5
	DJQxuSInFxDU0XPH2nH/l/BuV8zUpm2I+JtbiYsd7P/ja3+4CsgYZ8ckquO786spT4gozJyP8JW
	LsnAA7aPNjYBFCdlRKiXUILs+7NR6tpCXLSCFdggpnL706xOYtyjVy+NeERWFyCRqNxAy8926ba
	qbNrUaTsHVspENbIs7Ci5uKcCUV6xyjmmjPHrsJiCJr4IPZjbEuOgEEiSoYenx1egWkGM6c35Uf
	GbxCEorGPFQYfiQDOG4mfxA2jUWVHrnDzhHKxmh7jzaqB3Mjkn7mI3uNHmMMsR7pdA0p/RJQ9C+
	bWFS0w7PpmgU0Wd9Gdl6IbF1/NPKcoqOeiA4QJ41m1xVIK031vBWdLYdmLSjZVw/wsB47k9MuPC
	8v+QrkSfBnmLrjtWqhD8yxS6eVy
X-Received: by 2002:a05:6000:1ac6:b0:439:c661:3245 with SMTP id ffacd0b85a97d-44bb5f246b8mr16110067f8f.34.1777900970043;
        Mon, 04 May 2026 06:22:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4086:6e90:21c8:1555? ([2a01:e0a:106d:1080:4086:6e90:21c8:1555])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7d035sm24106863f8f.5.2026.05.04.06.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:22:49 -0700 (PDT)
Message-ID: <7683723f-df3b-418e-958d-9815d79b6a10@linaro.org>
Date: Mon, 4 May 2026 15:22:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 KancyJoe <kancy2333@outlook.com>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
 <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org>
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
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 14:44, Neil Armstrong wrote:
> Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
> Converter used to power LCD panels a provide positive and negative
> power rails with configurable voltage and active discharge function
> for each output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/regulator/sgmicro,sgm3804.yaml        | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
> new file mode 100644
> index 000000000000..5ea475f8f8b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/sgmicro,sgm3804.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SG Micro SGM3804 Single Inductor Dual Output Buck/Boost Converter
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  The SGM3804 is a dual voltage regulator, designed to support positive/negative
> +  supply for driving LCD panels. It support software-configurable output
> +  switching. The output voltages can be programmed via an I2C compatible interface.
> +
> +properties:
> +  compatible:
> +    const: sgmicro,sgm3804
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    minItems: 2
> +    description:
> +      GPIO specifiers to enable the positive and negative outputs.
> +
> +  vin-supply: true
> +
> +patternProperties:
> +  "^(pos|neg)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pos
> +  - neg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        regulator@3e {
> +            compatible = "sgmicro,sgm3804";
> +            reg = <0x3e>;
> +
> +            vin-supply = <&vin_reg>;
> +
> +            enable-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>,
> +                           <&gpio 18 GPIO_ACTIVE_HIGH>;

So this fails with Rob's bot and with DTBS_CHECK with board DT but I can't make
it fail with dt_binding_check on my side.

enable-gpios: [[88, 59, 0], [88, 58, 0]] is too long

But I found out in Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml :
   enable-gpios:
     maxItems: 1
     description:
       GPIO connected to the enable control pin.

This was rather unexpected...

So I'll probably need update the bindings to mode the enable gpios in the subnodes instead.

Neil

> +
> +            pos {
> +                regulator-name = "outpos";
> +                regulator-min-microvolt = <5000000>;
> +                regulator-max-microvolt = <5000000>;
> +            };
> +
> +            neg {
> +                regulator-name = "outneg";
> +                regulator-min-microvolt = <5000000>;
> +                regulator-max-microvolt = <5000000>;
> +            };
> +        };
> +    };
> +...
> +
> 

