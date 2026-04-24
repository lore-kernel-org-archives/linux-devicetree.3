Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AF1A8F97
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025093; cv=none; b=A74nR7muFlcKM244Oc43MYdX6Nsvi+3ag//IK6McRQq1cQxIzrh6sKp4aqq9lXoP5MZaEzdWiLReN07A8NYJrTWcQMWindWXNaIlWpOwwCKW/q226i5YNH9cKc0tyTuHYsAZHTMYXT7U/n/vMw4RS0TdbfiCTnHeSB20cG5j0Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025093; c=relaxed/simple;
	bh=lx6kgDS2TwaC2kw6Q2t+J1XNN+VZ4542KT4N9sNj904=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hxktANDwSTNKD78qc9v4V5IxyfCLgo5Yi9H4Vha2zzOuZs4G+kOUidt//2iaOvYTr29KKzZsqQGZ9TUq8tZmWBb4Y5RbzqTpvoonEd7R693ufnosHT6L8u5BGIbD4kaNz53Q/Ks4ymPQ+M0qDOXgYY6lve7AbepFROtJbl/4RkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ophBn+wk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ophBn+wk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d03db7f87so5210680f8f.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777025091; x=1777629891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh4cO1Jd848Orxw87E3q8qfUwzpksTw/eGdTo6fgVGY=;
        b=ophBn+wk3jSgAF3Eni/uK1GslDMETq62Vi7Ggs6GaMKDws4xbkjYECsjkUpdEv7nFk
         9LlSngRL+puIb37lB7ZTyBcV5o11ZtQhWFW6DGA0BFU1/3I4dtMYRA8JZf9Mk8mSimVj
         wdTW0D+hhAFpiG3ug0SdHrjB8azTXKQAZ314dFIRLHSX5jfz3KQZpbRxVgeD4UsjUSpZ
         jjb9hl4feoQWAaV4jxRuYJ1FUeo6397qVH6jy3vmr71tdLFFLDI/rvmvhGTbuZ5K5z2Y
         RyJ15sGpyniFIDaDuXmqJGo6/7XspQmq0EISnZZAp1qKWTH+uPaFQL0qyNylGWfv+brr
         r3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777025091; x=1777629891;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh4cO1Jd848Orxw87E3q8qfUwzpksTw/eGdTo6fgVGY=;
        b=MCx6dK3gFzAaXfUtbPbuJ8DKWB2Xcf9sNHaMkCMJSqWRjKratxcJnZGvdSJqpexsQX
         bbPZcymY/1Ac38cBueY68/9XycEh75tkgUWpDtrFlFvni3Mowxox/ESgz4oJ7kBd7g5H
         +JOHJJ4y6Tnfr7lvzM0HLQDdHuCnhHw/crVbJlGwqTnbyZna1Xrt5Ig4vSFBP/wQTwEm
         Q1BZuxpTzisMee3e9kRGReb8noEQGDn7ddyZ2cdGqOXcgcOO99ivQJiO1itQOBzLWCes
         GEJwtJekDMhhCKuh0PuSLVDYe4UqagPOYm18MAPiqzE0en2Epk9/I/hQ6ZmTR8mUYqvY
         ATLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hMCJgGzp6oEia2c8CEpDy7BR2lWlbMcrkiO9jSUzB2rhWfxBnDtY+PEKFncWB76KC6wpWPh2b7MtW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2QkhcO3OIwGoaciq/rwBxLOBwJdbLhwzvAz2C+nIZlNH09foy
	SwwC0qEfVasPiDrx1r4a9IWdZbf5jl06G+EvqOIwYWrpwG6cu68+NnDZCUfxCSf25gY=
X-Gm-Gg: AeBDievU08SlQOz82zSlp4r3NkyLtcuIq47UxYr89csteizHY658kPanXZjgffxwtv8
	Yn50AywW2pEiKDA8C1A3EKO3T91oh2P7k0Fr/xuQPeVAtjSwNFjocB/fZfukCIV2nT5bs0AroLw
	COXNWlAAEK0BNcFe+xTCuZrYYQjRUNreTNBHYTUoVlV1Gvqnbvn0/fpi2MwZsbSXXkBR3YSUn9x
	rCKyH63z9YRzzU49wulair0Jo5GZWvtWL0OlpF8mmcC0WgN00WgWqON9xA9OuVvO0CvMDL4my5v
	fKtRo1bmmleLuv/LmOp4czeW8uIx4L7sVq91QXUYD706rnX/FYUxmJP0w1AqQPeQz7MPRzt65JP
	Sbrtj0pUY3Dbf4jXhfiPk3j9FUX20O2Vse/HN1xldUnlOdOzIrLCffnY37Ad4WW8CrMnJhN+63K
	Io4RGWyMVaYHet9sR32QFptJqEjJSXxCDksAYK8Gs32dC2OzIakfydhzviBPvVkSY5hOjDAEBfi
	eHBqAFgDk26sdDR/Q==
X-Received: by 2002:a05:6000:26cf:b0:43f:dfbc:8c71 with SMTP id ffacd0b85a97d-43fe3dfbd89mr47455531f8f.25.1777025090737;
        Fri, 24 Apr 2026 03:04:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm53197398f8f.14.2026.04.24.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:04:50 -0700 (PDT)
Message-ID: <c4543cc3-4093-481e-b737-4ab9f7f6802e@linaro.org>
Date: Fri, 24 Apr 2026 12:04:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v4-4-9505df0e7016@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-4-9505df0e7016@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 15:54, Ronald Claveau wrote:
> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>   compatible Bluetooth controller to it. The node configures the RTS/CTS
> hardware flow control, the associated pinmux, the power supplies (vddao_3v3
> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
> clock, and the GPIO lines used for host wakeup, device wakeup and
> shutdown.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 3227ab27de107..8ea7ae609fbd5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -251,3 +251,22 @@ &sd_emmc_c {
>   &uart_a {
>   	status = "okay";
>   };
> +
> +&uart_c {
> +	status = "okay";
> +	pinctrl-0 = <&uart_c_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +		device-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +		vbat-supply = <&vddao_3v3>;
> +		vddio-supply = <&vddao_1v8>;
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
