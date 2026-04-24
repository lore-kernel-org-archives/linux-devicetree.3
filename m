Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB93603FE
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024869; cv=none; b=Ti3nYc5kIBmNyPTvlwowtjCeqJP71R3KUTQFQZ4H8/FdR17CDU6Vmwz+TUMmHh8jXca6WDr0FFjSpvIXBmo8oiGFUVq5EQ4kD7yNQgPnUsagJEdoNGKr89t6waLXH/V6rMqd/a0MayAIdzlMnqGJrpoK3I4xp00cl5tb83LEDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024869; c=relaxed/simple;
	bh=5PxmAqhbxT1r3T+11BjTa1R2Ja8Yu6KN6WMKGu0DmNM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zn50W8jymLVX1eEG7BdezoaKteVomz2chN7AhVbyLercDIyqo0LbgRO/JaCWXVUc8o4hAxqInv/21upYk9wHihD98cHoNEuQyz5qrSn3E3leSoNnctV8z1cTagNZK8O6/OlAj2e3ys032V0IOxNGKUvdzBCpfJx3jT0LnsGrU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=miuXlW6N; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="miuXlW6N"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so68647645e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024866; x=1777629666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPAdPOUXw3pVX3oaN35XRvBMX9UHe+5wDadCAJqegTM=;
        b=miuXlW6Nr/ztMYNOPOA8/AMWCy2FZwtK5XBnI7mtAZu+oHeBj7ogPm+xCqPYa1oVKO
         1JE+Cb7tWePVcs6T3m4xlxCPVJvHrpbvVK25aMLo5NzndV7UpWEkbe/sqJUsp5Jx6bc2
         YdcDxfrUvU7w6ZTESUziLQ/FfR2lAMKe8tZGMKLeGknuz/+IFugOGlVB2PDU5+kVl8Ab
         poQGe+IRB8z0hpzHTUFDBZunf0aiP+hhqKvvCkFkyhPIUPor605SDdYOxAoAg6yHJEJT
         LwnNEfWaUVGD8E9FZOt1gmb3+dfthEM9CJCEI0UopLtCJwfNhtp6JLzjkaD/MtUucw6S
         POgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024866; x=1777629666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPAdPOUXw3pVX3oaN35XRvBMX9UHe+5wDadCAJqegTM=;
        b=CgEk2u6CPbBmKgB55o3m+7z65inxNL7Y/fzxgLeF0JEY2cPlIJuoFYRtpIvIQJXEwZ
         qWLLc/aYqrk+nWPCdHke9OQpBuWUq3qJNKhsnvbG+JZG5jtvY88LmMcv1oxPrOdtEC83
         nJB25t2eP/l21jGxvqFkk08kNpwTBIjHxSJnOfWpIK46Cu5FGkolG5OQiP50FoLPDt5A
         TaxyLc+Bb3FktTW4B4zaYGFZZoFzcGYT2bRYQygkLfIhb4wkAevYAMY4CVnJm0a3qSwr
         +R2tYYILq5XLyT9k4jQdUWUt9wGCdHBK8KQxjwcQbGbrGoii6hIlZps/cuqWKbzZ17Ad
         NYTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jhqVVWGb9bjeaVFyNcbLqTuhWlK5dhYeS9aldvBFDQH/trNte2UhEVoL4FPrjOAdO4NEHxSGucdNg@vger.kernel.org
X-Gm-Message-State: AOJu0YyOoYnWMp1tFen7CFnAeoOJUMqAyz+hqW02xd9yn/jMLfnEVgUu
	JC+46waKOeKa962Ekq7EDRjMfUsRYLxeBpr3Evx03YNwF2Jl5z0+zKjekc8bbat/UbA=
X-Gm-Gg: AeBDievrHZPcu9GxkMPRj/cygqHaSayddRjXaG7F+azaMcQWJxqprWRgnIGMaJH/I/L
	7vc5DWcSkriSHQlRtTqCZjKQwNGun2R8xmfDos9z0eAB53rdzuhOAvtApRlF9uI9JdpLVHKhlFa
	kzbhwIf1/Ko33jjtHLDtqEsn5lXxXV+Kcr9vfGdH9HinGZ7ZCv9g3JBkdPBKv60wGk93PlyNYEc
	+YeU9bNHNfvzboRCzqopSy5dbe3XKGbhaxBJQJlCd27yzEdibVbMx5nTr5ly1+6zrRXaBSryr4b
	fHxY46HDPz2enwBY6Ab/0NewL4TMDdxSVdUY4K/UapifhnDMhP7C8UFfgtYvYjMY0Wws63oD1OU
	ZQXvUaLlloFjaUuoX6taqL7KywZ9pLthtw5fw3QDkbawG7gu8x0bzuEM1xyE/01p2wCrxPTQynd
	1uw7OnJng3vKM8+nmTz7WqGHL5/PP/Rl2XguGvQRvrX+NwoBj/J6+2E5mK9a0m/GXVDhfLWXsoK
	PSm9NlfOAXajvBzez1LY7n7fvyK
X-Received: by 2002:a05:600c:8115:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488fb77e27cmr387870105e9.22.1777024861411;
        Fri, 24 Apr 2026 03:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm182225895e9.24.2026.04.24.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:01:01 -0700 (PDT)
Message-ID: <12e4c15f-0782-465d-9f90-d9d4f8018306@linaro.org>
Date: Fri, 24 Apr 2026 12:00:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 7/8] arm64: dts: amlogic: t7: Add i2c controller node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-7-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-7-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
> 
> Use amlogic,meson-axg-i2c as fallback compatible.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index e96fe10b251a0..560c9dce35266 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -711,6 +711,16 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			i2c_m_ao_a: i2c@76000 {
> +				compatible = "amlogic,t7-i2c", "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x76000 0x0 0x48>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_SYS_I2C_AO_A>;
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
