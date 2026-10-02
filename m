Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F53459AF9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933015; cv=none; b=RnHnk7bZNEAz2y2y5m9Wjt6RweZCLGY+O4F60OnK1QEDpYf6+XqeidT7TnmIRWj4q1j5T2tBiUmKDvo5QpdNo/CFh7mAeiKIn6TTP0zlQkr8gsVRq6x+Uzhjv2l2r4Zc9nQLH7BQt2iqyNvyHqWAjiWwX+pvbJC7MN4iy3SAays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933015; c=relaxed/simple;
	bh=zCRd6agWEG/52CFMUjeHuWFXDWmS0N7YyZXGVmbBjuQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jbf9PQgPL9Mn1oDTdTE7EH4jQEem09GCxh1rgW6koo8vU+8AFImTm4MEVHZrPad+Y+/j7MGALComYm8y19IQ6vHILYv1lidPwrhOM7TET99gtPEHo4F7+z5+X0ieHnVu/gWYAw5f6NH6g6E5PWQZu6dqZBnDg7zaSFMcIZkzcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYHXuqC8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYHXuqC8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso13393395e9.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933012; x=1791537812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=wYHXuqC8AOacDM0YJdYRIC/JMKupZGcXhDmtsrQ5A7Da9L7QdlgwLdY9xyWMNqjyfY
         3V77WQmHngvjFeIgW4k/NPTgX2W9rEAa/G7yW2jXOWPu11yfdMewmMVoD9ORyiUzXjf6
         HHpCVQXhhjphZM3IhJ00qgcks6+l4/79K4rZBRthb/QNpgAX19k1FdxvnK6+VcAcTYx3
         1yqbN3qeb4oi1mod7QngxJ12HPZ9lJyVnOuISBvcjYQgDqNVHGaGgLB/LqkUTvXPwrqG
         Zci6DwtdRsJva6JR+Xav2mBFRimtq2maUZ3gwa7u4hAyAPhOuSb/b1TDJW31USrW95iR
         dmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933012; x=1791537812;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=pzH2iWn8jkkcLk9C0y3vN6Va4zFeMu79cH/EwLTWUNpSpCBkY19Cyq6B8AEAY23tBP
         jYzL0r5tACbj38PBAel0IyKmK/i2EwrLN9hwFdHFWKzoFk8pVOny0nTp4Lia1ZQcg/nR
         vLde6D8cJmnItycN7qrkMrB1tki8OeCXQit9vtf4Q48ZZll2rklPjJQ3JI5DY9ZfKm2k
         bERq8GVTdJ0tNr6txz4SHVU2wQyTLFFEzYlDww2Gqrboyj145JYgHFTZGdLuseW7uE2y
         neDKe6SnP2ccl2AcUcSi5RhbweOjQk5B7wjkGCpahzrWi3sJCJJ6hyIbLABpIT3pMhAj
         HOZw==
X-Forwarded-Encrypted: i=1; AKwUvBz+X+sEDDtOQo00ZnHXn2obpynovK6SETMXjNXiO+IbZU/E18B3lCCCV5mYq2Zf0amk1jnWlW8ohPFg@vger.kernel.org
X-Gm-Message-State: AFuF++ncpA/xv81xEXBSqfeM2BHTQSYHI/jrqUqhv12LVBtbnfcfnqAT
	Sz6l+X7tRAz+hwXU0EjeHvzaR6pU08YOVicAYhuqHHTQKjPkzJ+h4rwe2fixLry5IkI=
X-Gm-Gg: AYBFou1TkRf86ZjFIGH2skrlJJ51Txy6y+ySoqhHaaJPTKeOmg/kgscy2O52pOLPBtK
	pUB5FaqSBdvQNfGoziLnf/DSiKgIcsmu+no65/soDC0wxg8MMEPovzMDs46EdtcYk96M6c+hqGr
	gqISwh/Vv9p9YqPQxVke0WZhme8e3AxT4JGczS51rkjt4PTdD0zCZujN3vbB94FXgdLgUPRuqqW
	/oSmcm1LPYWprFvoEwFUeH0LYmiJvzNM1SlzJeZKY1lOCiKnP6x5ievq/gPpwIP//JR3t/Et7xB
	wkscgex2HVFrqXoTlckkjout3MuSHXLe+qAgQ5bCXChRow5sbarqJgHq9NsSKMpjDLTfmU4AFWm
	Ismw0JUAvtFAOltim6N8rZUgGsSxYP/32IjHdK9Yi8c2SXB7qwFqMu7CYTwYntv4xV5fORnqaDa
	G+UUoGoWYDKOJXgWQ/Da/I16qzI91lcHiK/vC1aEAj8w8LlOZEL0OrJ+/q4hbzd2mo63q1C8EJA
	iBQNXb04PizboOrf8AQdFFlqMdjaPuekKzWWBbbQPk29mW/aTZ2hpXuNdgG5w==
X-Received: by 2002:a05:600c:19cd:b0:4a0:22d5:21af with SMTP id 5b1f17b1804b1-4a027564f48mr41402045e9.15.1790933011804;
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm68526245e9.3.2026.10.02.02.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Message-ID: <143f8d6b-7c11-4a63-9c9b-36758b3ef635@linaro.org>
Date: Fri, 2 Oct 2026 11:23:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
 <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
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
In-Reply-To: <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 18:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Mux them in a board-local group. nor_pins is shared with boards that
> use BOOT_0..7 for eMMC, and the HC4 has eMMC disabled.
> 
> Tested on ODROID-HC4: after a boot from SD past the SPI, the flash
> probes as a 16 MiB mtd0 and reads back correctly.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..5ce76a1bfe02 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -124,9 +124,19 @@ &sd_emmc_c {
>   	status = "disabled";
>   };
>   
> +&periphs_pinctrl {
> +	hc4_nor_hold_wp_pins: nor-hold-wp {
> +		mux {
> +			groups = "nor_hold", "nor_wp";
> +			function = "nor";
> +			bias-disable;
> +		};
> +	};
> +};

Could you move this to meson-g12-common.dtsi instead ?

> +
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&hc4_nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Thanks,
Neil
