Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66063FB06D
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820818; cv=none; b=Oa5/f9r0abORuPk6KnLNepqrzfraB62zwe4I//Z/YWeClFJUuUTvddwfMDeEnE+FPOfFOD04JaxTHtOs1Wna8XLp6rQmywEx1FBHAiGn64YLfFmjpmSH6MoIxziUxBTJ5stoLlFZZSNXKGYShroCDjlGmjMyxLc6ybFRgZ9Adbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820818; c=relaxed/simple;
	bh=BAcGYvYV/uBiwDPiuVU9hgzFkX8RoGTT8P3hAyNGdUA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bbed0D//FAizwtDGI9vv1XswmcIG/3URTS270BAKHOkWT5ewflT0iPjEG5aPoEenCxflRE3iiiNg7Op9lhDKHp0OgMwGFUNuX/22W6KdXbja74q8iZC23VuQJazMIlMiiu9v8ubrdho4JtMDzCMTPgOYcZ7X6W/S2X8T40dcewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+sI/G0j; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+sI/G0j"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fd66a094eso535976f8f.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820815; x=1788425615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=a+sI/G0jYsfexsrYyXGZNpC9azommrr8mNn41UVv3/cX9K5MZSAikETgJOoDvfsnx2
         iOFmkduzUKMlrIHtlx/V6j7T2SjeNU8AGC8Zj/n/yJNOQlSIWwS45XFkNuKbSkqmZvAZ
         mec31aCOqTA1GzVU85kWvPFhfbY5RcDw3L8sL3qwxLu4LYySfW/Ckyfus5fnVy36dX9y
         NdzlTwUPbtxfxJKh4gSaFawNpF2X73MTX/5sLb7lArLXnCxHsxjPn02cXwFVdGZIaI/w
         RdGS0J/2rA1XX8xNZ5DCeQ1TucXyJeKo8/Zq9BhMTZ/PNxYndJQe1m8GFqf02H5cgrld
         vePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820815; x=1788425615;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=bZA1MgJmSO2NMsLWfguMEwfl+fqKma+cmg5fbULhygqFUhNjG0W/gXDvrlaTw3+bxn
         EazSiVERm1gZqEMX6WcaU5dgrSBl4dlaKvNiOVscFVXOBSZXx9FFXFS8TMakhThdl9qZ
         YJPhr3xeB/QzbJKnRLRZcHKIvp0L7qdBGuD6RKUgsE8ZZqIp4YUnH+yQmooKuGi2Lbf2
         9S9i0CcpzEvYLiyB8v1W8rMfTb9N2ErBB/XjuO2GW+5RwhB6gjVcn8cpp8PkaMn97btO
         nZijY+xQJ2ECmWdChJS/emlJTWSb1wWpmGscr9Epr8IAapqoaaxa+Q5N762faKQu+TA/
         BALw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq78cbHu6qGjoMS3vPycIbUs0Zv87Mb22y9N1bhLg1zIc+TCYaO8HwjDB276udZxNqpwVz/ryaZzht@vger.kernel.org
X-Gm-Message-State: AFuF++kRCjmKbOevvQxi+CjuOuuk1aI6YB1J+Tpt5kIw20hsUSwEpekI
	8cpIHcy8ZbaEi4fFdSsFJQVwd/y0s8UsdBRq61t5+kCSp66vtg+WAjlkqVfi8WoOg/g=
X-Gm-Gg: AR+sD13662FbGsZlGRR8kn+LvVUagshCbb/dSKTomBRTJCujdX4UXetPnpbmILWU1Y4
	03H9Vyk1FnpIn4fazsa71w27PtexEWM1oGSDpmLk93Liuf/drTXcMhhlCUTnbyHeKZEkKLxJEuz
	Lz+ACV04KQZ4wGtn9aGqJKQrUBWSKCl9TLxHG5NUQxTHDERPN7rwQrfOxzKTtw2dNd6DQX6E9+Z
	cvALpqpztmK7FDsMDcnROnl96rME65wUSNermEFilOVWClrDrsHJEZy7WgYC2mMsixKdBZMY7MU
	gOK5/u2GhhXVVasTeV4AXnoona3oZpYvuwTNTSqL0mfWrKienwfBjQgsu6RpuaXjvnvjqZngBo+
	OjREKUsmVMcGnoAO/spr3E6FJii7C3uzmqOoGuL/rHDFFk/ASW9b2JP7zUMqikNTU5lRITwLmVP
	8J5BFG2kXFTF0KaXpdbL2QgT/axli8Ym1b/xAqvKZkabIq/jiKCFH4jyXorsdPPh5fk1OY
X-Received: by 2002:a05:6000:29ce:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482e26c3ff0mr12975216f8f.17.1787820814796;
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Message-ID: <80dd837c-9dd5-4b7e-9abb-02bb59d45da5@linaro.org>
Date: Thu, 27 Aug 2026 10:51:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD
 card to be power cycled
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-3-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/26 13:53, Lucas Tanure wrote:
> SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
> cards refuse that switch, and the SD specification says the only way
> to recover is to power the card off and start again.
> 
> SD_3V3 is marked regulator-always-on, so the supply never goes off,
> the card stays stuck half way through the switch, and the MMC core
> retries forever:
> 
>    mmc1: error -95 whilst initialising SD card
> 
> Drop regulator-always-on. regulator-boot-on still turns the supply on
> at boot, and a card that refuses the switch now falls back to high
> speed instead of failing to initialise.
> 
> Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 75d81ad6830d..c94afaaf8826 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
>   		vin-supply = <&vddao_3v3>;
>   		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
>   		regulator-boot-on;
> -		regulator-always-on;
>   	};
>   
>   	sdio_pwrseq: sdio-pwrseq {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
