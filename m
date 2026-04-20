Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B53E2F999F
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674844; cv=none; b=V7w47yGFs15cyeQ1U+x8VGFGhz6o8CoPsy28KQyqlWENZ+p6buR9pYoanbV6aFSBdflKtByuFT70tkxOTb9/kQ52QWFatIpd6n1YA0G3RDxvJYHkILFdQDoLC0alJ5xDxqOf3RGNRxvSzDbVqyuHtlYBQ1LTvQ9+SqE/qOl62sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674844; c=relaxed/simple;
	bh=Fj3Io7jF1RCzoydTjdHBihVA2mMNzBFyf1jdscT7IVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ljnl7fhUE++6sTWI9b8SAu74oucZCM1hZq+n5npHcz0noO7DczUBJMe6AwIyX3rqFYjV0tqLYQo2oPkVUCq476TkocydaA24zAl5bgsRggmrVYEz/bPBRtFPeJAhMGPskMcabMM8q4fwuuf/iHMUD2coDQlIq02vKCC7QPtOupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izDghL6d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izDghL6d"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so37448505e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674842; x=1777279642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMnG5zsFm8/YD9yDwCE2pChjm9vp3DUFGTfm9muAL/Q=;
        b=izDghL6dXfT7eT+5Tq2toKIk3l4BpHkk5hKOtaZNENQVFoRoJDI7/bDoLsH09dMQPI
         ejVEs+EOfgNdWbljXUDTQzWue+9gLFccMvmhoDWG/EhyFssQ/QWM565CK9fnjtT7Knio
         gE7iJwLF/Dsti1u4hKCWpFlDBDErjWROKlSigcyRZsC4IyLWZFRuLH09RjxbexF/IZt6
         +zkTokWVXCjiuTmnAgmpsAEtfYtawkgtDlkt9EL7KAsjzLkkvpPAx3D25xuUmGPyPpwR
         t9DSJgnMnS9Md0jnrh1ro0cYPPVuHE7v85BfnyVUnylGYrFT0umLfrnqn7PdIpyTZonU
         Jhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674842; x=1777279642;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMnG5zsFm8/YD9yDwCE2pChjm9vp3DUFGTfm9muAL/Q=;
        b=Y9mNYeIrEAwz1jvrHQ2FoqWosbtc3khnigBFJkKPM5fHL2wCIHkVZQDEkC03g6J/xa
         25R1AQh18ZZPLCHTxsQn8a5ZcP53uK+vImZIxiez0IbEGMQa0MQWksQpXGZ0ao2VqdC/
         lvO0oTX7+bkKc1LPNwf6rMvSyV6sBpUJGb5kjd5er9+GQhapPPahhI3MLI0vL25TdAV+
         QiIJDIAY3bxiKzbh3gFhfJDb8F5BsuqMcR21bzwFcVbznK+2/Wo431jMsfJnvTkTtyEI
         ND2DNNDp8YNqyteFJ41zIFapnh8mkfw532cFhXsXnwVYLtqei+13pAMo/+lb63ShtZ/z
         DZ7g==
X-Forwarded-Encrypted: i=1; AFNElJ+uiCNCNPhTtNwHKjt7WHDs/l+7Cdm8Oq91hz3qKWFH5VqQ9aDBky7D43HveYf1ljCaUOTY90e8y+rl@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNdCCGtkEOs2eYpiqWv6BRWmc2sswoCyoJV/vmhVWDyB2w+Vy
	1vQ/LEQRPTnmHrsiWT07Tr5erTN4k5H+jg73dYMY/tWAzfsiN2MHiCU6+D8BzEyxrds=
X-Gm-Gg: AeBDiethP0vwSaXAxChRzpzfS0dUqKXyfjuPXsMbu1jM9I7KdDv1nOwp82fJ6XuWIpD
	crhq4bc8ieXe67zIwt/ssVMXyML6LkyJqAPdoOQ2ucqfgmvRQgXY5jiQls0twzr8UPlf2oaTTLM
	JEJrg+JXnKw4ZCCyd4YHvp6YZaFVBQRaCpzU5fn/IxJNTKXEUl4RtKRinTkTa6dJDhQphqz55fH
	/ypRLZjdaadef7jegblMViJsXLtWV8+G08tAuG5X31KqLlXimasdNApP6EDG+PD4omz2ZL8AJtQ
	u1lQmVwZ6cIbmCQNi50myDLwgLs0HRue1y9cBKT3OqWHUL5qemHI0+wZF1fWIcmyLMRnRlTpz9t
	qXJYx5eRHLHaeIEdhmdceuyNISQ3FO1G3bLo9n4MyfDDH/yUUGHvA7klu/FlEmMAlBircpMJFnh
	OUAJbD368k5EhRNT0mAh5NmQKLUcez4BBB4c7LEqnTxct+c1wI0zcx2Mh3MahZr16HWREMNjGt4
	LSN0iBcPU3M4kUjNw==
X-Received: by 2002:a05:600c:c4a5:b0:489:96e8:1ef0 with SMTP id 5b1f17b1804b1-48996e8200amr15753395e9.30.1776674841495;
        Mon, 20 Apr 2026 01:47:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm85827105e9.11.2026.04.20.01.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:21 -0700 (PDT)
Message-ID: <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Date: Mon, 20 Apr 2026 10:47:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 10:54, Ronald Claveau wrote:
> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>   compatible Bluetooth controller to it. The node configures the RTS/CTS
> hardware flow control, the associated pinmux, the power supplies (vddao_3v3
> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
> clock, and the GPIO lines used for host wakeup, device wakeup and
> shutdown.
> 
> Remove clocks and clock-names for UART A, as they are defined in DTSI.

This should be a separate patch.

Neil

> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..8ea7ae609fbd5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -250,6 +250,23 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> -	clock-names = "xtal", "pclk", "baud";
> +};
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
>   };
> 

