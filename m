Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9C3382E5
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759610; cv=none; b=ueJ43LIX8VMS9Q2zwN/vkW4KF2A9MCNpN+VjITNVo9tH7ha9QgmJ/tvQigw4wReoHooBm2f5C5LCEjEbLhdiUMVjXa9KoT8hfPKG35zyKvWixdYeuf1N/qtYOxKizQxHM3eA0T9+6FQvGynEfFdzl2XP+Iw2xFBPPsPKYImpJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759610; c=relaxed/simple;
	bh=ej2DDZ+Wbqxid9+GOlPQXZfp9qKj80z5BKckDA2L41Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igSIiTLoghQhhiFMCM+hH8K3qLYi8qqSjErp1uQMhtwo1xsv/NxbWyOF6l82M5M+v1yCiT+bawi0huBT55+9/SmMTWB7ts+wj9rs603kpia2sUMO4wAcZlE/WXuTPFr49UjxC9iYPUfwWjoZD3jFZJGdkd3YGgy0pMRnz3ovigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3DEX/Sy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3DEX/Sy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso11790855e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776759607; x=1777364407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=e3DEX/SypSNQ298WKXlF/mf2fpJNNupjcDGFZB8vlNp6P2swQg4TKH2z6OibA6JHT2
         v2pY23xnxz/1MuSoUX295Q0JOmhOHUh0xT67ZT8B2vVP5HcFZ2Vo6d7DgV6XGE7Kbwo2
         wP2Nx87O2KFkhLEgba1lbD3WQz1R1HvizLNPyvSJ6UFK1Znhz0h4/GDBACRKwBPRgatx
         7v3DQ7ldnxbuiubOJT8NlEqpQC0SKBxZ+GqEGHBXiC5Q++5sjCDR+BtYtzjFEhinIJ7A
         M4ux5zEjVNSBx0+0tdm4FAuFl2MN1F56msQ4yPxdgbzK7d+vMGDF3bwR0KDXEjLpWH+E
         UDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759607; x=1777364407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=Dr3T43eivUuKaHD4uoGfdHrQgKsNuxYd1IjVrypthWx5uKpXZ6czFscRpP9KKH08LL
         TUIs3c37E/iWgER1WTPgvQn7DKONEObwZW/z2YiQkxSCXm1PV+/Dc4aIfTdsCt0Txptj
         XhNlLG7GuGRSYonK5Ms/Vv8d2N/mkJyWUBF+rkEMz0GKz6yL+UQ3FGAGyC46pSQfRhJf
         il4ZZ9W4u004gxB3JxZYePpTprk5e2FB+wzKTMfCrSry5inuBi92Qe6pNtZW9KjryW7l
         iSrXhHyjE5dGTZqErhR5cyeP6TgyTsxQAx5mw623C6DsNcnSjGwwhUfLxqw9/VjAkkrV
         U0DA==
X-Gm-Message-State: AOJu0YwVflVXSUHCYK96NDDaCuVXEpInvspEJ2qCODU4A1MbP+6iBSes
	SabCy2h2YbiK8WPaV1uyRlyedxmJfdKi/3S40H4akOPWi5EzGX3dNE2SBW0MEqpK8zs=
X-Gm-Gg: AeBDieuJo6/x87FJYM0JF9MFMJ/Wm5uPqlgHUNOWgkrUbXtsapEsUx+uEK3gSLxTRrL
	mT31GcqR/da6fTOb9s+Uz478JnFApxTFRDRvH9oDE/NJYYeocc/v2qe212SjcF7i6VMBT3P3USl
	eOW/DKbvOf97iUu/lY7ERyB5pP2RKBC/IbowA/8RFr3BWcEz7hTNUz5Cp5mN+FSbc7/OqQMEX47
	XZmlx8K/7GEShKugCo+VbCDCl6ZNZXpnTKD2j6HlTveU6Gh3fmx/99qjbuVbLVbbm1TfHX3F9Uc
	lEz9xgCTEfWZBN6F0bysPxPILWtxNxJki1SA5w9isuRokvjBelFMvHs3K2m7mu0JyhDAiykGncr
	JACYasCv7dRfRmsWpCk5Akcw8hvrtf97yZaoiBdaLkRX8IUHyqdKt1HCEOlkOqatQ0IWFHOXavz
	Fv1mvMfcOZpB1LxjJd9k1s1RMaE/YB8x5yxNxT539bnnnQnyIYSLx+IuB4U2XY36f+276RCIApL
	tj+6/BrF6qBaHT3ybJnGaGDWg==
X-Received: by 2002:a05:600c:308a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48a54fd690emr22699365e9.12.1776759607201;
        Tue, 21 Apr 2026 01:20:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8cb:a891:9d12:1873? ([2a01:e0a:106d:1080:8cb:a891:9d12:1873])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm90004255e9.11.2026.04.21.01.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:20:06 -0700 (PDT)
Message-ID: <3a1dc60d-5da5-4353-bc6c-9cec4b3a9067@linaro.org>
Date: Tue, 21 Apr 2026 10:20:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: jian.hu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
 <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
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
In-Reply-To: <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/26 10:17, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the clock measure device to the T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed62..6a22b48a42b7 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,11 @@ pwm_ao_gh: pwm@32000 {
>   				status = "disabled";
>   			};
>   
> +			clock-measurer@48000 {
> +				compatible = "amlogic,t7-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			pwm_ab: pwm@58000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x58000 0x0 0x24>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
