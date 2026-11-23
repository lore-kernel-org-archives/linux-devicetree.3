Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429689;
	b=D+KokOe/AQ8gVOk4gjCpOSgsuubL82aDK6hbmCfgkWvblUPr+OI9tjyA9NqKPYm3zE4I
	 ar2J2XRktv7dkE8lEH3UpvNQcy5bNChyEWjgATiABsEKqd2gsSViOCv+0Vat/118Vbxsf
	 f3WXDLOv0cjSBdCLjS/8s+3SEAUHisFRCuOJJKl3eaQLZHjinmr0ezPWfhyR1CRQp57oV
	 o2DmIc1qlllkFDFe5OozVCkcNKSsV0LT+r4tOJycf57G2eNSU9ldFn+blxEyfyqdttLNy
	 3rgmEt+02v1xcveMWEBcvVzuV3W+3ytYq2cUbHTwPNiq69gUQoltqt5b6vCUA7jh/Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
	b=asCSRugAdsMnfFyaOYgzZPFbluuMZy/hBPuMQLPvdbUB+V7IFjDCs7jolhel2s8955g7
	 kLtdT3pntkZNIYKJGQ5+dfysrWhX+uPzCrIwV0QxnZuwhloIhmVgHF9BDEyOWJgOQ8tNH
	 ax62PDdFdhWcjfZ/zIaPkF1IdYKM43gIg3A2gvm0r5q9Wfyk485EGqu4pkNIx99pXoNbe
	 iUwjTU2mkgt221qSKFqZGX+9xLY3Ut6+2fjKeZOr11/O39mv9v8Erg1NFA6IwcG+wzDJv
	 vFvWc1fQLxO8j3Nw5jDheb4zBQN5JcQ/kXMiW6AJgxLnnLQoHKJKDqEbaAZz4w3WVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z2UulOCZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0D606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD0D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z2UulOCZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2359817f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795429687; x=1796034487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=Z2UulOCZoOx37jXThgbpvgQibkiWtRc/IEyak+MkALKrCOyyVolZSlFIl+6jPe5yT/
         q8+4ltVl5E6GR2nQ9DnBy/8RDm8ItyxPtl6273a1uO4jHP5GU56Dsee9FyR65u5Nya3Y
         mD4xykJvMvzh49Nyib6wKZX0akV6UohGR2enqN/Mc/znC3n4xtUhDxXy/TlzgSi/6F+Y
         pKU5BxmS0mOYhw8NxJfWVmk0wZ63gGqnKkZcX2nAlDWLuDGYp8nQWKf6HxjhnX3T50oE
         xa+nuhzXrmjAK9dqW9HJQKhOwIzz8eINIkp3ALU0ACkG7jdtqq+qLHtcjz7XCvz7/hnX
         WjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429687; x=1796034487;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=mmSbyodaVdddT7pTpNqJr5XSZB7RoBLz/Oq/L1vEBj7hrQ0N1aeznvcs0T4DX/74BI
         FNGj/smaN56GynLhgGbGzX2SN443uFBW/BuCnYSwVZh8NTIefcMFf12fGBhwGqhQt4XM
         idEOfjtta3Cwagz1RM4JObW4DwlP5mX7YuxRkiUS0Aa/KQ9oabSgA8hso7FAVzfNW66A
         LFkNds++1KuE4egy0GfM39Uvya6Y6xb5JOXrywETFkR5UEplwE0Q65cJOEFPaZaZLA0e
         yHnBjprX8shMgIwWfRqgz4tXej/eBuGe4eP9GcHbPuEes91ltphV15XQQXy+sy6K86Kz
         LWSA==
X-Forwarded-Encrypted: i=1; AL+hErEeopA+62+WcpLMHMycQoMbHFDfgMMx/bq4Gh0bU8YfsOSw1U8boTJCRZhlnWudvqmKerxu9ZVZ1EpO@vger.kernel.org
X-Gm-Message-State: APuU4Z8FXj9sNMfbLU5pek1x/085fujLDwLo5GgR45j0HJ42GsfOi7V7
	WdusmIXtH1VvWjqyS9uj4NLRBtFD7jmzGU9hkfS9qKSfqZd/cQNvWP1zr9brGIUYP38=
X-Gm-Gg: AZFdTZeTzhjHcd4PDyGBz3xQxcYkassuUMR46ZFFWw/sgw5FPDUdQGTvQBG/f+RmRSW
	zmHpi2U62NZUmC2bxKkcniqKuM/D0w9KzDE9DlJO5PPJdUhaoWJzMw6rWJZfB+J0OMxu5YwtC1w
	1iKd0e8wN5r/imsjuZZIncIaBMERyAaUTgGukHqyze32CAQkjI3Fn6KmKYnRTUK1CwqR6+/Ydyf
	HqmIN2SkwPyaQWeEUBKFApZ5C7vHscWEZPdv48AzPAAaulrLzAhfZzJY4FZo+0QCo23SU5qOkLe
	zx6Z8d/+jgK/K+w5ZI5yeiwx4dDYUlUXobalc8PWu2bsoV7LXbFBFwCtg/NfKrB/603jbq5EOsr
	kBN7QpKyBNoYPi/Ioev7TWhbpACF3cIBYSZjENwDrKawZZzneYifXTecOakUR35rMsxgFDZZIaq
	8MO2QGi5uM1+3eSLf5ccXn0v/k2HhMi4xP7JNqTJ3Vv+tjwQwrc4qHj3bOR1H3BMOcZtR8fD5ON
	HLtAEn922gCRuMYr3l9CNZDlUuPUaFHf4w7Z8IUynvdx3Js8AGBfQpLp1dGAK6pGgq0rLu9vemS
	FmbOM+4oHGbCfsASF4GgG5QO/C2M6flB4av4v0aU1Kr2i3KDwLCk63i6GIdhQk8uQxVYMfCt0oE
	rrQSA8KA4
X-Received: by 2002:a05:6000:29ce:b0:4aa:6e52:23a9 with SMTP id ffacd0b85a97d-4abb0e46a60mr14731002f8f.15.1795429687181;
        Mon, 23 Nov 2026 02:28:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm21617870f8f.44.2026.11.23.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:28:06 -0800 (PST)
Message-ID: <5f61fd6f-309f-4e8c-9df1-3c532a79cd4c@linaro.org>
Date: Mon, 23 Nov 2026 11:28:06 +0100
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
Subject: Re: [PATCH RESEND] arm64: dts: amlogic: a4: fix pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
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
In-Reply-To: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 09:24, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.
> 
> Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix A4 pinctrl node.
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fce45933fa28..6587e3578f8d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -218,7 +218,7 @@ gpioao: gpio@4 {
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
>   		};
>   
>   		test_n: gpio@44 {
> @@ -226,7 +226,7 @@ test_n: gpio@44 {
>   			reg-names = "gpio";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   		};
>   	};
>   
> 
> ---
> base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
> change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
