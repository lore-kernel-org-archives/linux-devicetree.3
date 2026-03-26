Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA82989B0
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529627; cv=none; b=D+Xvg70KIMB+nEqriezoxk/4yKy5qGkaUte8c3hHn5W+iKCYLd+vjky6rN25cJKFGorLtqL9ssbdFU64Fcuvr58cRX0wWO3j4TrvtuyFPIT/jzq5wfmZebFD5yNDrAj9iwP1IJj1hLVO89QU8vaIGCLM4i4U7uFC+B07VgFi154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529627; c=relaxed/simple;
	bh=K7REFKxf3ZmDqskE93hAofwp3IRmFswPn4QHXZyGQOE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jxQGdpXy2Ed+W4CeAjzjAl5x2xfYcU/pPcRTY7mXWmr4d2o83L2AkNhNQpQSM28PLg48ZPlo8lxn7f9mgWRTVF3qQ8tboH1Yz4qRqON5Py7scsvbEBfm9MAseDyVqvHMT7RX+N7zPaYGGGq8U8DiLKeAcQcH72Cn1JAhw/4jkE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFnTq4zk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFnTq4zk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb112c09so9539015e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774529622; x=1775134422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovqx3H1R8dcVYTy4TlcGAentVJA1WLMQBInCAVMEjmQ=;
        b=iFnTq4zkWf9yJQmTvAUCTngWJhxf3Bsoyux1cR8XZGbFgyYid2pZUwkw2oOyXH3Whg
         4oUPkc0xK2/s8Tq+porYrScGaSVIte2b6P5hEG2Ekkb9DFkcydBlRqs/z6VKkwJZBxwn
         rykgA7cPuIHt6WTwxrV4Y9pSyVBqQYbGdHaBlWjsNKYe4m/o1XiO2WxHMUVKxJVIyxcd
         bwwZeKIBNscYTd4D2cbJRKok+tZUI5NBEx2FbD4Bqc1H8/WMHkDzPegeF5gNDlCj57DB
         FGpy6RUMY53GgMIhuU+NzLmqo/63Jgm6tWdWhcU2y1CKtM7DHOYLnzUO8GeeW8rQSLmF
         W7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529622; x=1775134422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovqx3H1R8dcVYTy4TlcGAentVJA1WLMQBInCAVMEjmQ=;
        b=mb+GlNDPzrxqzlYbqaz6q14dnAZanxI+Yt1RcyKLc4M0+ARGTZnN0dh4aEzxim/E1h
         MpmlXkRO1r6rWKJz34uwLGrAGCVV2ojz8xtxiWSyHkLBfDiq0HEAS9BkKOcFBX+13f31
         QvNBHdRZh6uHd6Cv1yO5GnCWurXVxTj5EOBoOvnnuTZ9Vn4KL6g9gz9X8U7eQrWl56H6
         SJCBMD2xJTxPrFwaECIiaNNdR44CpzTcKYmowRH7W0xDtAcYGAA9I7U2+E4QSXxKPqc8
         nci4o+wS/tuhP4CUh34Jv+7LZdTgHasElPq6VffKtlKaiiq9p8RsrYX21+fYhPgQPs2F
         0U0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL3BucqOBc2ICyZYhowAI6oAtd6JgRyDP6hCxTirCjvlOiO9dAl7nBASEyCYmCN2RrSM9O0w+HOd8d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2FeY0JQqQYcaGg1Nb7WmmAlRUGII8AJIQLU2i1P4uTHBPBKQ
	YdzkPiknDf9QzCFwPJszmnEHDlsHX9pLw8kAZDxuMFO3wXrtK+BeIk4cV2cX6zPyoSk=
X-Gm-Gg: ATEYQzyLa2eE1gz+QR2SOn7bfG8MPZ/S/eQh3DeHvEVSNYLHZbflM60xn568/6mWWbr
	jeJhnRTk3LwC/QwQ2iqYRXyHlM63v0/jF86o27zEh5xFrotbAsf2QKzENO9E8cfTd3svPtcAGYg
	fqHHWFAuQ1XYAM34+zvyyLKP/wmTAfEkscpwG/uQqjYJD5kt1OcC4ldxcGOpTRZOfwQn562Grkt
	s0m7GY3em5koDrP2ZKrV6vmqidUP2lC7jDPw32neavQJFhAM2cbV7DjvsF39aCUXblTaIewQBNq
	6FHmiZVAn6qBbGAnLQn53NXgj0nN/S8Mb0nK4Z51YPmMkxjw4Ed3NTD8XrYgtSVELGlAg70RTFL
	+l+9uUcp/vqkeQcnbjD0n/25Hi7KKb2RwKpGqQ1Xr4Dy0X0iellRqOL7U9wsrK0lwzcdAiLmYgg
	kscFduaqolQj2Gmyg1KE+HejFMFS1W2s+S8Ei2Tswmo5eYbaUM1FMMToaINRKyau7C5TKh2buIN
	Ca4ZdM=
X-Received: by 2002:a05:600c:3b16:b0:485:45fb:3472 with SMTP id 5b1f17b1804b1-48715fc3a88mr110847475e9.7.1774529621762;
        Thu, 26 Mar 2026 05:53:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65dc4sm30763025e9.3.2026.03.26.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:53:41 -0700 (PDT)
Message-ID: <c03db144-539e-4c39-94f8-14b112783077@linaro.org>
Date: Thu, 26 Mar 2026 13:53:40 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and
 SDIO pinctrl nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-1-d3f182b48e9d@aliel.fr>
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
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-1-d3f182b48e9d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 10:59, Ronald Claveau wrote:
> These pinctrl nodes are required by the eMMC, SD card and SDIO drivers
> to configure pin muxing at runtime.
> 
> - eMMC: control, 4-bit/8-bit data, data strobe and clock gate pins
> - SD card: data, clock, command and clock gate pins
> - SDIO: data, clock, command and clock gate pins
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 98 +++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff92..36d13371f56ba 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,104 @@ gpio: bank@4000 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&periphs_pinctrl 0 0 157>;
>   				};
> +
> +				emmc_ctrl_pins: emmc-ctrl {
> +					mux-0 {
> +						groups = "emmc_cmd";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +
> +					mux-1 {
> +						groups = "emmc_clk";
> +						function = "emmc";
> +						bias-disable;
> +					};
> +				};
> +
> +				emmc_data_4b_pins: emmc-data-4b {
> +					mux {
> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				emmc_data_8b_pins: emmc-data-8b {
> +					mux {
> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3",
> +							 "emmc_nand_d4",
> +							 "emmc_nand_d5",
> +							 "emmc_nand_d6",
> +							 "emmc_nand_d7";
> +						function = "emmc";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				emmc_ds_pins: emmc-ds {
> +					mux {
> +						groups = "emmc_nand_ds";
> +						function = "emmc";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				emmc_clk_gate_pins: emmc-clk-gate {
> +					mux {
> +						groups = "GPIOB_8";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				sdcard_pins: sdcard {
> +					mux {
> +						groups = "sdcard_d0",
> +							 "sdcard_d1",
> +							 "sdcard_d2",
> +							 "sdcard_d3",
> +							 "sdcard_clk",
> +							 "sdcard_cmd";
> +						function = "sdcard";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				sdcard_clk_gate_pins: sdcard-clk-gate {
> +					mux {
> +						groups = "GPIOC_4";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +					};
> +				};
> +
> +				sdio_pins: sdio {
> +					mux {
> +						groups = "sdio_d0",
> +							 "sdio_d1",
> +							 "sdio_d2",
> +							 "sdio_d3",
> +							 "sdio_clk",
> +							 "sdio_cmd";
> +						function = "sdio";
> +						bias-pull-up;
> +					};
> +				};
> +
> +				sdio_clk_gate_pins: sdio-clk-gate {
> +					mux {
> +						groups = "GPIOX_4";
> +						function = "gpio_periphs";
> +						bias-pull-up;
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
