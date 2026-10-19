Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76553485CC1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394953; cv=none; b=pZusK2iPj4BalJhkZecZMK6GCrRAcFX7xV7OhVUxc4VtQB9yIHFQ9crFOu66Gl26mXjPNY0f80eKHYpy1ORKZiygLuPewD+rCUVdV68i/IPdyAbqy1Nkwad4XzUudjHvKDfipjM8wA5gI8OnKlkHu/oVRK/VVBB0krwyiABwnpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394953; c=relaxed/simple;
	bh=sdFPBQUW0+7qu3i2UI/fkNQB/u3ppR1kyFa9mKz79xQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gh+LJ90RhHLSTg/9Xevi5iSsoCxpCRVKke3IPIMEYjrdVkofzWPU8iGzcZGPf5tIgEf9G5N8Pg+Gv+UpvkYrA2GZmlYxNOg7fm98V1ph54DuMi2/+ofG03TePlK5xExPzeWIL7Sz73dCqG9JFyq0d90r84yyB/LGHVkNt9B70jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SF0hy1Hy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SF0hy1Hy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1132031f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792394948; x=1792999748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=SF0hy1HytATmKqMFg7H/JrKq7omEi+qebvn+aEGQwr/2tgJen9eBscEV0fhBnjilus
         dhYQdo83tr9An+lPU0qdrlzf0SVA4mfqZo/KaAbkKl6+my/AUBBSglETPvfXc1zA/aFP
         oHFAvDtCMW6D05tQQfkgui2RqRjhF/jjKi426ho/wE6j9RdtvCusjZkAom6tnNqzaFlm
         LOaSW3JgIwoL7XmIvAOwjChCLsmCve8WxfMJhmSOMUpckeEjZSNQMhNakeycNvUsPKmq
         UB0S0M2x25/WJmpOGs1xHzEchkmDX/sPXXemuKeJEqd/5BrureSWte8U+ZVAWnbo9ELv
         QuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394948; x=1792999748;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=VMYM4QGdfWSMg6VANIIvW9OhMZMunzlTUbOL0vRRp+Pw/riDdTsjRXYd6UsPhcS2Tv
         C1wZpkKl1oLbqiU8rXP37ShZjEuysv3jdSUfPZdOnxmn8elMpoRxgsPyWF6gNxhZ8ZZu
         mkoV/BkvVhiGlQccx/dE2xLUizbe0uBllQw+uz3HmrtwHYAwg7DOUF066D43pQqOB12a
         pCvXGdD9CiQKFvPyUXK2Pxo7qZG0s8fuk6aTvMi3XYvz3iK0Xhr6qtKS18fEkOM99WNE
         ooKsdJqwjuiMBokUQ399Kny7miZuwmMa4IVP2IzvJTpuzpzJIOd7ELJ08T2aYNgZux+i
         XScA==
X-Forwarded-Encrypted: i=1; AKwUvBy048ppKQRWDURqgH1gnNQIVNimfFzpHHOs/nBDNmRJas1PCuenTknV502dN7NlCR+vYkEdM0MlxspU@vger.kernel.org
X-Gm-Message-State: AFq9FYLTijgrZxgzm1OR02Q8eOos482B6GNrP76Kx2v1/AP8fQtAJq6y
	j/UkqWm7lt9h9846VMgwyDWd7rSw2+oRsJUXXcs2fgGHOHXcPZjrpamCW3UaXf/Ij1U=
X-Gm-Gg: AYBFou03sBrWz3hdMklA7WgSnbNWlU445VxqoXBZN7HoHYERd9jFvsndXj+4ilZadqF
	tqkvZCrpJmA28XGRukqVwPIhCt32dFaeyZeGql5C6wMk4WHHhXY9FoN57qhCdpgvlUtRbuFFd2x
	FFJqqkK5NL8ZCJ7uZFO8MhWzg4gYfpWs5Yun0F6GNR/auLumOVdk00uKA5cW47kqMLCP6MvTWIR
	WzsdSfM5pRjYMnnRVisGL/ubePbR2VkY0LcPLEbDlBKdMYVv2pSxDbqGMCJlr8fhAX9XrPj05fJ
	JvbGq6dnZHqZE8uPXr+/q0qxJVCbJN+u5ISTFukhMsFq/0KzrLAM2LGoluJiDno+cqd1mq6RhNC
	Arh4K0Pg5rxrIx3dyRq6lD9zT+aOZ2VCEKtZT1TOqamtYz/2hi+AzuuLpvvv4k3E4SCtKFM9pP2
	g5KwcaXoxfn8idrSZV4idy2S/4nFxsuMGa2claBLcO/yeYySO/wPuQOuQvmaK0djaIF27yie1aj
	krbbRwc80/ovdbQFXSSJ+YtjN2IJNTI9QGYq2vIHGUoDFVlDX3BGQ==
X-Received: by 2002:a5d:414d:0:b0:487:219e:5e20 with SMTP id ffacd0b85a97d-48e07fa8ce2mr9406189f8f.51.1792394948485;
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm21249024f8f.45.2026.10.19.00.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Message-ID: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Date: Mon, 19 Oct 2026 09:29:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC
 as rtc0
To: Shigeaki Asai <y-asai.0816@docomonet.jp>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
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
In-Reply-To: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/17/26 13:07, Shigeaki Asai wrote:
> The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
> and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.
> 
> An RTC without an alias takes the lowest free number, and the RK817
> RTC registers early, so it usually becomes rtc0, the RTC the system
> time is set from at boot. The RK817 RTC seems to run without a 32kHz
> crystal on this board: it ran about 1.5% fast while the board was on
> and 14-17% slow while it was off. The RK818 RTC keeps time well:
> with it as rtc0, the clock was off by less than a second after the
> board was off, with no charger connected, for 12 hours 40 minutes.
> 
> Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
> well, so that the numbering does not depend on probe order.
> 
> Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 348baa4e6d84..86902f68d7d4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -18,7 +18,9 @@ / {
>   
>   	aliases {
>   		serial0 = &uart_AO;
> -		rtc0 = &vrtc;
> +		rtc0 = &rk818;
> +		rtc1 = &vrtc;
> +		rtc2 = &rk817;

The vrtc was used as rtc0 because it's the defaut wakeup rtc,
can the rk818 and rk817 wakeup the system when in system suspend ?

Neil

>   	};
>   
>   	adc-joystick-left {

