Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC61342524
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827266; cv=none; b=ceO1fwfEOv/jtZo/8KeXmJygzdVZxfAVb9RO+HGVF/igltJI64b+EDesJbaT6JemAlpa5RJkPxYNgD+/IG9sJ6G6YN8KKyKrlneDl2JewGEjSWJ/ZkdSER+Itka08Q08XsARilMcvIbkyUESgpuZYJosXC4kItVYaqSIT850rVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827266; c=relaxed/simple;
	bh=WRSgkDBY5tNM3yui/Kxcf6xHhw9r2/E8S3QTsi7mNCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSGeld5v3nRe8kZ8G8aucrIjQ0LkjkX1iOyZ4Wj9t7QOXXJLNLyvo6bSCmdDkPsh4rn5nk94r3J3F2GqqHYgdhhRc+gZ/MYoi6hA7r61jsv1JB/J3RBmRU//14yd5OJhpFvYVsO3fNdxMk0l5veTWUcG7/BReCy6neaRO3K6VLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N3aLYUGW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N3aLYUGW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so9746785e9.2
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827262; x=1790432062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=N3aLYUGWG+ZBzslmo9NV7uQrfldnC5ieq+ODz2/aLQjkbybklidpv0eJFxQu5CAkLK
         WsrfTF3owFQXuHDHvPdzpaGgSemo+MGalvYy+o9/EMlU7QRz6Os8JANmP0oivVVF+Uav
         /flOaO8pyVrC0HCKDZMXMPNGHFFRaRYeQMAa1LlEueLiCXqSGCKnqLShyqahmH1OYbMi
         +SAWFLWHEiYvdAhO31IsfvCRx4wIPX1N7qgAKZvrNmQTddby0bEtiJ1UPmXgL8kDkO+d
         WYa45q2Yrb5wYbjQ1mY7mV2Q68V/4kbZ/3AJQltk4xrp3TgSa53iRGQeOnuw+FqqiaTJ
         r43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827262; x=1790432062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=KXOUB/cUgZ8U+x+7ZfKmaAD4nATKJ7qgWdZCbZXBwXFAfRW4OtHAGNpTKXMP4SFl3h
         rUUGd5BDCcIcQ4dwDIACZm0sVT1kyAmvE1dYo68ydMbetYgvk5TJyEXaOXJC/mRwMm2S
         gEZuLkLubkYglDYuxm1M4Jx0GwtqfTRMfFJgyfAUtkhLXA8sl1UcmC4tglUYVEFHS5vh
         XJpaeDzpXO3jJ0VwKIAlmGwAihI1QRu36vcUpDhe+fyQFAvv0BE0sj+AjeGQQcBPhDtz
         xcdhYJWvuKV7N71C5rLp6Z8eTxoXXO0jNPFHd5SorCmjNuPz7caZQaS8iTctWOPlxGVS
         zFQw==
X-Forwarded-Encrypted: i=1; AKwUvBwq80c8k8BpS2BCtBub4oKdJsxhrrwoNclcDyxbmRRa98F5rOGR0OUemaqKiUiybGg4dqBKsxZfOsp4@vger.kernel.org
X-Gm-Message-State: AFuF++mj4sGgDs2d5Q6x9qLFjtCSp7GPfmVPhwmG6yGJtMj7S2mdqMFq
	pZuNWbjIxGJtoIEr3JbLzmLi5MNxX4iegAJo0A/2euvMkXt0ToCs1avhehg64uG7EOg=
X-Gm-Gg: AYBFou0zwB1aVxfxoGdl2OzhGW/+b3yc+J+4QDIy/JdK2WRe32y3HfB9Gb48lvE0X2j
	onpP4IziwJ2Wq9a1xuHOG2DN2h4OXBMeB7NLXVp+dc9Z15Aa+fx+s43Sg3Ocn0qiTseCh+uNdRf
	ILk9CMv1SGNL0LILkE+z+i2yblWHZIlCrj7fdirmndPHNm/PSKq34N5hf4I/+xgY3TKyTaoIFb5
	WT3cjqDn6QtPYcqH7LoBYcwN/dsojIXtJ0BFIkGl2HTfR4ST5ptSXQTE7JMTIs8FPrf/Eo7tjD9
	bovWEnXlkKxuWy+ULqH2Z8+0Sujsyz8wdeNpLaGhnoBalo3iVhz5ibwRKvHTZJ61HKsz1MZzTG8
	oYWiFI+WLjIwqRSQ/wFTrNWnsz7jnabSIOzVneIzkpnu9t8/HhYyQDvwJPlAR1kRHCeLAdtsxst
	BdDMSMwnHjD2TOXN0K0CfytaQUClIwUJU4onSUz+8VMJ/3kDb/FPAHrEwuAVxJWeG59aBSmHPYS
	vaOnR3bz/Rpt1TWFkswKM8twbSkRZhQbqMLVH+gUCWcUluDwodsQI67
X-Received: by 2002:a05:600c:19c8:b0:49f:ce78:3565 with SMTP id 5b1f17b1804b1-49fce7835f7mr20772865e9.22.1789827262336;
        Sat, 19 Sep 2026 07:14:22 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106078635e9.15.2026.09.19.07.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:14:21 -0700 (PDT)
Message-ID: <09c057fe-bcaa-4e57-bedc-40dc1fcc770c@tuxon.dev>
Date: Sat, 19 Sep 2026 17:14:18 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Roberto,

On 9/7/26 16:25, Robert Marko wrote:
> Add nodes for both SDMMC controllers. Connect their bus interface clock to
> the fabric clock and their core clock to the corresponding generated clock.
> 
> Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
> operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
> integer base clock encoded in the SDHCI capabilities remains accurate and
> the identification clock does not exceed 400 kHz.
> 
> Keep both nodes ordered by unit address.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Use the fabric clock for the SDMMC bus interface clock.
> * Configure SDMMC1 with an exact 50 MHz generated clock.
> * Move the SDMMC1 node to preserve unit-address ordering.
> * Explain the selected clock rates in the commit description.
> 
>   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> index a8541c6a098d..5e330d5fab50 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc0: mmc@e0830000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0830000 0x00000300>;

s/0x00000300/0x300
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&clks GCK_ID_SDMMC0>;
> +			assigned-clock-rates = <100000000>;
> +			status = "disabled";
> +		};
> +
>   		qspi2: spi@e0834000 {
>   			compatible = "microchip,lan9691-qspi";
>   			reg = <0xe0834000 0x00000100>,
> @@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc1: mmc@e0838000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0838000 0x00000300>;

Same here. I can adjust it while applying.

With that addressed:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

