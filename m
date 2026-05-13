Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C9421F17
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675735; cv=none; b=quvh7CC490PdRod/4QqpccAyFryI1h22MU61163YTWU1bsWQo4uuuOdH0pxMTmn6krjAPz195zZnGozOna6SBxJ0es0RzdUd6O9QAjeBaOst4V+Od/gjx28U+kssELouTFRyJ61gNGDnjYTCqBObUMZkJY92cLMHUtGHox3qWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675735; c=relaxed/simple;
	bh=Ach9gnuc4OtTUYqzJPGtwC5hMU1NNIj1zRqSgzB8IzY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NTFX981s4FlUrX7esnTDq186cWPNnG9amsEvy8nRQGpl6Dob8paJBeG/7by65+JIFSnUul3fVgIeTRuZIqpyuAQt8t+H9fYWdnMJVG9bJK7vt/ZLfHdezn2TvPLxweGlz+uTPKTpG3gZF1UxOdcODXJ42YFEmt1W27Z5CHP3hLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6Thu8/w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6Thu8/w"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3766305f8f.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675733; x=1779280533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAlKYHkO3xfLK4ijlvnpDwU+hwyw+vWg0NuomY0f+2s=;
        b=m6Thu8/wXRm7hQ7UrWQJ/XymEzGCs5vos5RjZe3BSesFDN5A3bE1bu8JiQPHuzQ3Ct
         DPv/HnW8OrWtkXHz+cdzzoud2K70CEj8+r/3xARzudBH8M6/Va+5CZJFod6n5JPnyCGG
         bJZC/9wbdrG25bykgNHdMn6JuEvYUtUWV0JSDQVUfBB4o93mLoXtVVduoyIzIEhj3GV6
         yHuqMzQg9fFxmbJG51o2wS4AlBJhPdcGP3XcXVryAhfeU2/AUv1PnzTZ9VueKSHg5XrN
         0v5NgrL+L9D+IWMlJHDV700TY0hxhRn/13m+CFC1EplZLEzcJPp0RVH93lsUj2A13cTs
         vPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675733; x=1779280533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAlKYHkO3xfLK4ijlvnpDwU+hwyw+vWg0NuomY0f+2s=;
        b=SHPieaPTQFX5WUs8CPbxgZjHqC9OrN1Mp0IOjvCnp3yRjYg/nWmazmpYfzDUYhQvQA
         pS0QB7dqlmJ4q3a9AUV9uZ9JUjF7OILjzfmZpHaayIbDCf3EnYbd/8Ltfs6z4aEHJS7v
         iokmC3XyILb5qc7CMpZXxLtuJSjKwii9ArjrNKyQTWLOhbGfb1B5YwFtaNNiIo84tqRz
         mvwDjnoqfyteFcVFQB2SmXKMdTJrwG+bPhEKo5uW9bQxP71T3CGPo6hfYL8UwkBvmksg
         44CmH78GFPoDJOmClXSHTEuzkIHv4PFRTKpTcNcOargRos4MnG6gvOfslfQerE0IAehA
         bX+w==
X-Forwarded-Encrypted: i=1; AFNElJ88QJDhqU99lY4wzJxGJFJ/T+84AvLJkxSG73LNabxWLFArJ2f8cYp0ORHQsRT7zpUtJZhYssjyCR8W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywer+JcXTb16aQ0Et0C/tkts64P8Q0hTbPgGYy+V71/Z+dUulJz
	Ze/m74H1P3+ylu75fB2D7oQm2N3jqeAKSN6jnjFfAIp0rrE4/TIpNlM3/j/ko/JjS49iPeqWgck
	+XCgRd6o=
X-Gm-Gg: Acq92OFGsNudHMzlfcB+wJqaJHgDQjUpbbNwyZV4VyqQXfpIOTrWV6zqPhKxTDlrXN6
	vblQXTfY0r0+uSIIiA5U6COmzgFY3aRmTWNRuKKK3JZVKknWJ/91G0nf7ARorf3xmeNMylcTiwY
	k4LRq+rloGHL2euv8wZGrqZl9GftoVpgycsiQ+soM0m9w6sZCHvuQfH9541xl1NAbWrcoZEYXYp
	tZozoddHnh43s11Ddpcqq2j9uXTVe83PHoIj63BOjCPCS6MlNRYyQidorv3+b26nN7qwPYNClmZ
	502KgitwvnWPSfZ9jAA0rkkLdnrFUWb+v1fdXudT6SiWQNUT1jhlP6FMAh50oC7H/EvWXjyZu4z
	lwpAxplNZTZBr/s/MIr5+VUZHjLJ4UyrGXiDhgsVgJN93IWJzqDNKtCHQ5T5z7qF4EubsgDZf6q
	ArNbBMNZO0WAlJJyLd58sUSjWvSvXCw1iq39vnMyTvSZiLIkSMzQZ6hMRUqTiEN6o4XzXodXDVX
	pii
X-Received: by 2002:a05:6000:25c4:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-45c59228fe8mr5283745f8f.23.1778675732839;
        Wed, 13 May 2026 05:35:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm41009555f8f.33.2026.05.13.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:35:32 -0700 (PDT)
Message-ID: <3ab93bcd-81d7-4917-ae6d-3b8e7ba81dc6@linaro.org>
Date: Wed, 13 May 2026 14:35:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
 <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
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
In-Reply-To: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 12:43, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
> Enable the pwm_ao_cd controller with its pinmux, and declare a
> pwm-leds node with a heartbeat trigger.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fd1b983354a01..c41525a34b721 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -53,6 +53,16 @@ dc_in: regulator-dc-in {
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
