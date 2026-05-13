Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D9036F8EF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659531; cv=none; b=MSg1FQUpEB/Z4pTpx3yykm65yhmeZv6j99GoRrsPjukcVGoyD4NLmjLeoQpHjnsU6WlYveSrU1pWNOLTm7+lhLPJVXV+TM2mJ6YE7Aor0gTqhTaHggWdDtzAZzKUfBG7BbJ7hYRK62Jj4PMJH13/Ao6DPoafuBp+fIWnIGBgJaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659531; c=relaxed/simple;
	bh=gIv1vp0BxigBGaUpEf9blURs1qbm2wpVbCNk3AwA+fw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rADJNupDB9tJjfIozl2dJvazCHWwWP7S96KMpv+B+Ix9Ycx68QCVo77U2SckxRzOqPXFFX9KcQHlhSEX1Hb1CN7n4ClBOXhsrbmFPwtEViAxoLKMkt5Z7CTB1F/6TzCL6LtJ22/F/lqdAmS36Byi6aB3fY2kt2E+018neroS5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WFfigMQk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFfigMQk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45562c41ec7so2964433f8f.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778659528; x=1779264328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9Oyh3R17SazgZSVRstGp1eP0rajxnRJzO9DzoLCeLA=;
        b=WFfigMQkh7+frVHP+HFYQERfjdWsWWIhmY5OOr+F1fUlvBitrh+hfLiwxjEjHNwv9a
         G9uxGFYpwCt7eZQt58Jj8B9bf5KvMqg9A4PkNMOzoGd0kYGN8qU9AfDTe2iPu+UDE/Ye
         yGcGtk6AKwsa04HInBs94kk1D0qyguaGNm74q2fg49Tdn7cdW5d+pyzkDkqW2wzsaq0U
         emb1fkURAzfSHqW3MH4jmEYh3DHbHyHcxjq9IVzRZehcTTS9qnxcWPaCO+loLvVUQku9
         D8na+PXh5/D409LlINisXBT8DV8j7sDp4PViVGjQ2m5vixylBobr0BLYaxeMJrc+S9ws
         z4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659528; x=1779264328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9Oyh3R17SazgZSVRstGp1eP0rajxnRJzO9DzoLCeLA=;
        b=I50YHQ6eYKDU3Z0ZL+Bl8GzMntPuXfUThdZ/K4V5LvOrPnvmOW6L1weIlmbhrh7G2y
         PjBy1n+4FUpHwHmFzE/EJu4l0huGGXskgnlgFxpKUa9zX9FKy3LZ/+xSmFRFNljxxCpF
         h7WdS1Lgms5xqAIQV4p8oiGDn6UQhLnSQ0t/MHs1utn9OqsCi8qi9Hdx1Qmgxl9+G/B0
         jvYI7FoLLy1I2F/NADrAcR2iyV8XLoDl4axVs/Pimy6PemPArGPEWEB4teJQ6HIyL/Pb
         v5L3bqcpB+K9+WNLD4KJTXiLOF5ajXsQDsRcg8LGHT3PZOXldnzoEb3PcC1SY7Bgy+8T
         XC7A==
X-Forwarded-Encrypted: i=1; AFNElJ95pioS7m4DEdem5ybkPq58FCD3kXplEYcO1xfKqEeA9CEXzoHLxB6MyjixyTfSE60dMwe6IJfp0otS@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVYvjOCyMj9TtO02UrOlO7RprMLVTVD/o2hNEE5nf+sDrbxZ9
	BPcD0jULcDdakOi+uu3CxStoHjzDAjZxNWR/yQ5U6HX5jTIOTDTxdTlVMr+fWb8SyuA=
X-Gm-Gg: Acq92OEJEdCIo4mizERMyThQXu5UpvgKlJDqHoNJB7r/O+YPlpd5WTEC4jf4DW6HeCc
	qqaxSOmK8f4U1dnTMb3hVgEJaQrd/gbBR0G93ZsyfyiituqtQcOS+Pm8QRfwtIgY228aro5qFg3
	a6QBts3nSP4fhrvaSuU1EzUIvpFoj+7v1jtjoVtUkmntU8OYPRkky2r+ypB6DVGWWXRgZUCfkW0
	/zjY6TvNYIW7BaeCSlFD/+yvQ4tBP7w4koTRNMoyMhOa6n0/Or5DDHnW3Bv/lL8lcXoJIs9Mz7E
	iWdUcOtjxiqIbkr9M9AxoOjKrpPEVhmhVyMSmHF41zWU9i6S0/IvBg3a8GDxW0BGw+GhA+dbTDC
	tljPB6TlaoeKoAziJO/k0aqexgudg/vpMVn5y9k+rqK77jknF6hxxqTzMWsOatQ8XZ705GxMfUI
	Lv2I/BKMGEGbZC0Mdj6tEaxo/jaHwPnaFa6h96NC/T5ymg+LwR4Ky8uoyXA++GLhGpXr9KgwxZM
	/0j
X-Received: by 2002:a05:6000:288c:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-45c584a793bmr3189360f8f.14.1778659528110;
        Wed, 13 May 2026 01:05:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6470sm32980706f8f.7.2026.05.13.01.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:05:27 -0700 (PDT)
Message-ID: <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Date: Wed, 13 May 2026 10:05:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
> Enable the pwm_ao_cd controller with its pinmux, and declare a
> pwm-leds node with a heartbeat trigger.
> 
> Also, move the xtal-clk node to restore alphabetical ordering.

Please send a separate patch for that

> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..c41525a34b721 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>   		};
>   	};
>   
> -	xtal: xtal-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <24000000>;
> -		clock-output-names = "xtal";
> -		#clock-cells = <0>;
> -	};
> -
>   	dc_in: regulator-dc-in {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC_IN";
> @@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
>   		regulator-always-on;
>   	};
>   
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		status {
> +			linux,default-trigger="heartbeat";
> +			max-brightness = <255>;
> +			pwms = <&pwm_ao_cd 0 30040 0>;
> +		};
> +	};
> +
>   	sd_3v3: regulator-sdcard-3v3 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "SD_3V3";
> @@ -155,6 +158,13 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   			pwms = <&pwm_ab 0 30518 0>;
>   	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
>   };
>   
>   &pwm_ab {
> @@ -163,6 +173,12 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ao_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_c_d_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   /* SDIO */
>   &sd_emmc_a {
>   	status = "okay";
> 

