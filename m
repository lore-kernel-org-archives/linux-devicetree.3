Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC438F957
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776686577; cv=none; b=WRD6H9GoWHkVSnfW+IyFD2OjXW0kNjqLRo7svWWKdkIDUyx1Tl28vpR1DbhopbSZmbtM+cJeiLhP09Ett896UMzZzVJtTdPwcfYX9fyy903o7JFjZ+ZBnn5WDg1ZBj5YOcBNmO2ELE+a9EGFcq42PhoUm6aNDvNg8Z6OTT/J76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776686577; c=relaxed/simple;
	bh=vBZWVAxHh7jiXJYX+2FFWCeN2g5O9Sgl6ujcHm1eUio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZUhEAyNGAF3WTt7M02nEkvUCLmz4HlVdK0Q8xjOvUtrYmOdttORwVPk3ZdPVge+7xQ+AaYlwKAMFlq8os7nHiOcUW61YFGFOUy70qvJ2J9mPNwO40Xb5pc0erVOSUViP1NtOy9CcsEBaQJgVzCrTe99xFfd8v/N6IPriQ4zOUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+9B1FrQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+9B1FrQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1971130f8f.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686574; x=1777291374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=Z+9B1FrQEpKuTL1MbrQks+L618dpIeDmxWvpjUrICY+64Hemr6Tpc7LHVQON7HGW/7
         oC3k8z3gQobGZtYO6OuFE395chn6DFMLd1TWkm7f2dIutNUaDT4kvErCq2zQuJXyy5um
         h8RywbisH88K79qV5EqF1OdflihD6eTK4OFI/9s+F8dDsSGJUlHloWUtar9GMg9r1R5k
         8OIb78rKlmOyOp1uMybgcVVd7Gnx0YzL+Uvs3Z+6S6y31lQJMRo9tnquZd9y0Fvsbj6L
         kmyNlC+grX0ztf1aak5+iV8xto8Nzr1YWZue6S7yPeTsQdNkiP6XE40VnJpPTEgekOZL
         g4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686574; x=1777291374;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=BcmKmu9XF0tZwdbz88Fsb/bMSL8WFvIuNEPJWiatdbXyVdtehg8Ppxgh+r3oGBxM+/
         DDGm804Yj3ZqlBWHWzLupXqpOuqgQmnNFwcK4y+bcbMdNewswTs1jjvSMr6c/ZRe0+v1
         DT+JNuNGOUrWoB68ikYu84EYeDvtlkOGFAwP0CQFM5xYk0c8HVgAFB8Ex55AbK5sLlUc
         7Rt70VUL48izCj6MiZ8cr74GQfbcn62D6wxL/FjUFDTF0xUH7fFi+QWJOS4C5LoQ5zaF
         +xHuA5eLlph++nCzZ3qwk+tmtlM3+0QjnAkGUDJOU75z8rwrUoiZ+0Rz8+hQ2Kpw5s21
         B7Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+RiF7oaCaYnEvEz1Z9mgZaRlyX+vUYS9CWaaJrEW3joooT1iHjQeWkgSqj2rgp9EgfyGFeUEWC5zNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzov+ksa+FgzTVw0oIPIWLViU/ZIMpJKPSyvGLlfVjIQv0LM41
	tHcwuPEavtU2UDPg89prIsFxh7wA9jQ8Rd8xZT1Zm4eIWF1bkGe7hZBi9Oecg/U9vg96Hf/Wg9f
	Z9zHq/d4=
X-Gm-Gg: AeBDieuqquQ2J4ISz4hhKtckSKX6KAcSpibTnxFdt9CdFvCMx1DmuyjF0hz7lSg/sNH
	EgUsDX4G7pwHDlC5Qz6c61aD1ZQtN78Mz4LBgBPd2k/pUbFCSqCA2x4rslA2L8ENbfGvVmlQLlW
	vDbe9oYQm0CX0ltRSgVYS4nOdYhrc/MfEI/jaWXGVFV9JI4pwtiOJ0tQLXgyjWUSq3x8SwVcL7N
	cStm7Z8gAx5eEhqkXLRnU8hBXWc4MqhlmxxIS45ATAgjt1NgtKy5MYUOOZyec3quHgvj5crNjA7
	FGpDr3+WH/N5NRnqCSxhNzF2i3wKBWlYDMeU9PDcP2N+fq5AVF82Avp0E3SCXh8etnHlaER+8dK
	uNUUNFa5Kd3Nya1p3z+6dnhKdgEXHi8NonF+AxDp1Vm620K+/wJLyoZCLvN/quLy0EAkJd8Xl7c
	k81NfOnS2MqL70uXaFywMG9vLqifpI5Gk+1/bX5O4tcHcFRfx0Xh6J/yRkRe3r2UxM9Tq9GH4Va
	ab6KRwJiOlYRigteQ==
X-Received: by 2002:adf:fd4c:0:b0:43f:e414:4c6a with SMTP id ffacd0b85a97d-43fe4144cabmr12333460f8f.0.1776686573966;
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm32493652f8f.20.2026.04.20.05.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Message-ID: <7bbaf370-3b66-4889-9abb-c31983948ac3@linaro.org>
Date: Mon, 20 Apr 2026 14:02:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 13:58, Ronald Claveau wrote:
> Remove clocks and clock-names for UART A, as they are defined in DTSI.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..3227ab27de107 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -250,6 +250,4 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> -	clock-names = "xtal", "pclk", "baud";
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
