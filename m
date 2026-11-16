Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822939;
	b=Sgla8693Xcj92rf4aAWuydqA+VlTbFARni7NnSO4dNHISD3sP1aKWdfYClffin7KERDH
	 Sx3vsVY/dLBJfw6BNmSQvnAZGvqCalU22opPV1+r6ZnPugAp5SCYoJcRG2NYmVyCd5M6u
	 uxRrNgfK5rSWHwnS3H5M41R7xYZWVWa68GYKxAxdXdg47R3ozVEEN6+qwJnitgxEs9bIi
	 KpaCeuvSYuoVn9QwNo6VqyDYgvECwdKNKv6DNSDEupkuEPkZMPSn+1E1plmE8cyaJQkrt
	 2q8RHFFEMnz1p9/Teic126ngb3uPH9FGShcEKPDQXa+qyU7RrSFEm5wDPQw3aJWL+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
	b=B/y7trgcYbcRCqxqW04tgxB5a4who255BrM5fOkKyoR985hSBBPKIUNk2B6+iDsk+Hp0
	 N4k3OnfMdA07ZcJ2hVdm0y+VYPxsAnZ6gu5pkDH987JAg4AwiUWFOLrkN0BuP9k4ItcpQ
	 TszYLBKtXrFh/0d/2Z/WTh86m2Jr7e3Q9wddOOtVpT9oJAFLQXvandL1hMsfZpnE2BOJ6
	 1clscKzcn+wMN5phOrR5VUwbhAmohUiPZUPOyOhewrtBWFfXVXqXC3lsNdkf4RJp8Reb/
	 jEG3ms0rbH48tLAZOB27sVGZtaOCsUNy+RCoeBpGb2BBwl5KINmARib2kHMMrqxfABg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mmnAXTMO;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B13606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mmnAXTMO
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4922523d1afso1591834f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822936; x=1795427736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=mmnAXTMOBuaV1HOT4mxSu2WXbfTYSvZ47S63y0LCQlV6qnaVPxzK0XtAFgz+7ZT1GC
         4hADawLO0EYqLdy/Z4xSxpGHou7iPli+gS7ietKmZ9CLCfULGkIjhhdkskx4E69sKIgS
         hPAo4SxD3sI9YUm85RiAoHn2ehfJAWo2EOG5FlNbAKzoX72usezzoZ2ZU8lkk/IFvi+y
         lqCsY8yiekgy2amsK/jcW4u+nOfmFthNU4kOTtj6FL+fEs/vjZizjdZdUROF43hpYXli
         AAUwvZjtAlC1jv7aJCynha+gz2nmXuECNlwrcZzDkgxB49Sxa12DsW4artkTeiKCI3fO
         p6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822936; x=1795427736;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=YMcaS0Qf9/YIRMTIzQLIxerGoA2AUmQl26N4mps9cSz88Zxvbe/J4XPKMwj219LZqq
         XXDgtYdsdQ61PxG3dEA0+6ilF6ftwB9siMdMtcX6Xxnbfa2SgOd41c5bn5GltX1LLNcq
         aSxgx9Brk40E2pS8NL1xcobBV/u1mKHAQfQbpWSOF4J7dcGvHKckTx7e39rv/zJ0MAEL
         WzLIYG/t/ab+4TCt8+ZqbrAGzWGPcLSbzz4z3Q+hqUa+/Ss9GZHgoAGfTRHwcTab/jvH
         s62O/7JFyL+m0axcI5EKFxKGEr4DGSHPXnWRUxI5VsU8fJ4aHVpBfo73hbWciaYWYqWU
         ITcw==
X-Forwarded-Encrypted: i=1; AL+hErHS+Zxd7gsnUcG20FWMfsiTnmEn2BYR8mb62TcQvQ3rYu0AUeFiYCJx1jsOq1F6UTM55G6U/tR8JxWv@vger.kernel.org
X-Gm-Message-State: APuU4Z82VvYpvWuiT5uxLLStMqk7kPci+XlV5YhygJkA1KhYrMg+s28u
	1ElYDVAE4Hqf+Z4sVnWI/Pg7nscyw+Yk5HzpqXgBqxgCCMfqEKtlanGAmVQB+AVgNIs=
X-Gm-Gg: AZFdTZevhblLVjTYOpxRxNXjsHk5I7RHKW+Mff3mu3hrTfPamlZg+llB8aJgidMs471
	92heBgcAgrMZwreJ82ZOhwOR362uzLA03t4rT/GE070ls6gN/yquUAt/abjUM5yxHbxE5i3LGAl
	WXD+j6+nIDc0c1dBFbhoywFAQDKULH6crd0uSEhQ5RQe5QhluqzmHLj26PxPsj26MlLocZwrivH
	NRPE9mgRKXUyU4+/waWlNHhQgwAOl4wGy37qlvvnzK444e6DHOXJqDV0KdXq5u2w9DvW06WvB6z
	qlakaHah1O9DiwjaLtPzINWd5Sj3l9MbNM7IbnGbE4/Wnig216ab1j/CXna1o2BQZ96c3bVlxpH
	7/Vf67bx1tJT1dQ2VyhVhVq0HT5y8VaSCbd+s5vAw6czYxGY6yuDMIfRWZZBdJKtd3lu3ZjhZUl
	kbHJsGSXcbaWUC5yyG40VpOiS3R+XhVf0F8MY8+DJGpkXMTz4LESJUo9xdCjd4VCGdFE4b1Ar57
	mYX5OwPuIK6sXq+UDntgMMDLAoInsbvzWMXf4TRMAlyoPsS7N6YyLVOgntC/wY/QWpdxOtGEL+y
	HWq9Blhd9jbkpDgtQ7zgvFiCqeNf/VdjoR2pL/qEeW+AZpzxfaX9ciLoQJlYJQTAF0ZsVNmuQ9t
	L4/++wtfF
X-Received: by 2002:a05:6000:26cf:b0:492:f6b7:f488 with SMTP id ffacd0b85a97d-49c6fc9dbf5mr23160002f8f.7.1794822936261;
        Mon, 16 Nov 2026 01:55:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm20884339f8f.12.2026.11.16.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:55:35 -0800 (PST)
Message-ID: <19786c13-d3fd-4258-a1d5-2a28a1dccc31@linaro.org>
Date: Mon, 16 Nov 2026 10:55:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/7] arm64: dts: amlogic: Fix dtc warnings with W=1
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
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
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:29, Ronald Claveau via B4 Relay wrote:
> Building the Amlogic device trees with W=1 CHECK_DTBS=y currently
> produces several dtc warnings, all related to the same pattern:
> 
>    Warning (unit_address_vs_reg): /soc/bus@.../pinctrl@XXXX: node has a
>    unit name, but no reg or ranges property
>    Warning (simple_bus_reg): /soc/bus@.../pinctrl@XXXX: missing or
>    empty reg/ranges property
> 
> The pinctrl nodes use an empty "ranges;" while having a unit address.
> 
> With this series applied, the Amlogic DTBs build without any warning
> with:
> 
>    make ARCH=arm64 W=1 CHECK_DTBS=y amlogic/
> 
> Boot tested on Khadas VIM1 (GXL) and Khadas VIM4 (T7)
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (7):
>        arm64: dts: amlogic: t7: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: a1: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: axg: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: g12: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxbb: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxl: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: s4: Add ranges to periphs pinctrl node
> 
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
>   7 files changed, 14 insertions(+), 13 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-fix-amlogic-dt-warnings-7cba2a4eb9d4
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
