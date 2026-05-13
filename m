Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2C336F91A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659460; cv=none; b=V1jUnNrnnJ7fyB1z17X5AXc4cj4lxMtGqPmkylNnklpOXDkQMfa/ShDYFCrUNmSoEtGYVkxx9FkVxP09YTfbgp8b5JznoG6AAZptyr3WEsQ2yzAlR5EL8TVOty/2PaHM8Ukh8ScFdlckSxpJsGTBLwB/t3UX8evv9iv4tm+GgTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659460; c=relaxed/simple;
	bh=p39e1Rv1+FtpHqKLkOW148yHUMUEAYDfENrVCQwteus=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PYE0A537MJLqg2I4oToieKPH6sDvtHk+weKMg6yAucIV2u3RfE1G4bzxpHwvDCFQ9ophqQhLVleZ1Zl5S+SAl22iNTCSpcoIF+Pg9l2Afktl1xJa0+BxJUq0ASSxZ20DYY3Fer+/CgwpRhOvnZ0oCy8ul6uDynlOiU1/wCKNJ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iz4nwd4j; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz4nwd4j"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4751696f8f.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778659457; x=1779264257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV5hlvS/EBlkq3ce8ENwrX2ys5xakCpqN1K0vJsBTFM=;
        b=iz4nwd4jl7sjb4LZ4BE4xY+OipmLwZx6o1wL8uMTVJChxsGDcL1Y3IX11vEmoSF5Wc
         4UarEEIgDfmeSYD3KlNtwcD5PJhBM98/T1JNW4dxrytpZ9ZMHQX3/UoezCPUEC/64v5L
         R4V6B1jHVaDq3/FmuUhoHCJhLgvUjKCeIJS2b4+r6UO5e9g9inFLjNOzA+gqWUbkyHeK
         uIimc2YFtXrhggoA+1VnTALABz7jpTB8HUpFB4/QmiBj0nKmOYwXRGVZOfTDH35cuHjp
         Wot8uGXWw3aq03mjHG4t3JN/3qu2cnRdaTLZNx8D849OTUZujWDwH63eUSc+nYsZOx/4
         ZW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659457; x=1779264257;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV5hlvS/EBlkq3ce8ENwrX2ys5xakCpqN1K0vJsBTFM=;
        b=HRmXI/BuyVYI+47xOSv+fKgH/IpI+9o+/e6ajxRPP9QJ1eEHMFncgGBm08Ct+bjOf7
         2THR9I0Gj9HIfzlFcxmyzaJ0+H/nCB5Yh82kGDLJzcmMWkiTBEaFt8aMRlrY/4h+lJ+S
         zyzYVFVH97jWODWB/ZyrgcnxenCpoEpadpBQp/C+3mr+eYKOdjjj7AK6wPHhlXJUJjie
         e7raNsgZuh2VwwSHsFwjAqIT9ZAC7gekCI0jZ9CYU3cfeWW/uKtRdgAKEMWBuFUTuWAu
         YrTCd2CT7bSbtl2xywJ6wzIYut7dkCy1Y5KYHXE6icisB9ePeKwhIpCSUMK4b96vh+fT
         yLNA==
X-Forwarded-Encrypted: i=1; AFNElJ+/bsa1UWg8titmTv4bMi+b+a9TB4ImLXzua7yMaoTJrDPaGHwf7ZN7b9F+JpwefYMWMYpFBEHV+HkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6eJRea8mosVVoZXVDViqHuN04oARaNs2wb1qJ7zu9VwIR0Gk
	rCOZhje/Cl28yJ04xP0XcSeR68QWIVAG5dkGUqrgG+M3OQFctOmjsyDUKldeQCWRiYs=
X-Gm-Gg: Acq92OGD4oZt1CqixRklEcwhND1NIgIZo6YDnUHov9uH5eze2KzDlWwxHUdyr31rn3V
	/Ad0aF2XrlbB4k9MslRUEQEoRq9PgUuhoq0dCuE1fu+BjuSK7Z6Bh8y522srYZtQ1uXT+vENpNb
	bT6Pi/tTF2Fyj4WZszE+15qThLCNk5a9ose92lY1WWJTbsJ1mslbk6kHNg4czDJTZb1HbFBmnG7
	dPbHbP3+YIb5t1mMjq+jlYYGw8Kq/zx0p7AWvYrTqZDwvi0QWmVaN4NAIToSO5zG9cNH12VYKWD
	VqrFMAQg2C4wHEV7OTXX9JGV/rDTA86moB/E2ICI5fZg1d/uvPSQUea5T0yoquF7Lib8l2LZklG
	f9e49YGQViNgDjMbMm35HZNBKIgV7xfpRPfsAr3nXfntOPI8qqkO869rTwQ/HPbUkwVHwT1PZ2e
	4PgWjIL88xiaY95OOsxvqGlfVYHwIWTnYSbYRohHJ9wSdXFJ45TiugbC0TkqA8DHui7l18V4kk2
	wdI
X-Received: by 2002:a5d:5887:0:b0:455:51cf:9f92 with SMTP id ffacd0b85a97d-45c46e02119mr3774439f8f.18.1778659457065;
        Wed, 13 May 2026 01:04:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm37346990f8f.29.2026.05.13.01.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:04:16 -0700 (PDT)
Message-ID: <d6f59417-67a4-4230-b3d5-0ef73ff002c6@linaro.org>
Date: Wed, 13 May 2026 10:04:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The pwm_ao_c pin node was incomplete: it was missing the group name
> suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
> into a single, ambiguous entry.
> 
> Split the node into two separate pinmux entries:
>    - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
>    - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"
> 
> Both alternate pins are not yet referenced by any peripheral node,
> so this has no functional impact on existing boards. No backport needed.
> 
> Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..62f6b9baad28b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -400,9 +400,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_c_pins: pwm-ao-c {
> +				pwm_ao_c_d_pins: pwm-ao-c-d {
>   					mux {
> -						groups = "pwm_ao_c";
> +						groups = "pwm_ao_c_d";
> +						function = "pwm_ao_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_e_pins: pwm-ao-c-e {
> +					mux {
> +						groups = "pwm_ao_c_e";
>   						function = "pwm_ao_c";
>   						bias-disable;
>   					};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll squash it on the old commit.

Thanks,
Neil
