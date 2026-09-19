Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A810339388
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824676; cv=none; b=LbTDt1VcQ0vAvw3XNAzAWvwAQmPohw3dgboUf8qOmtHxbBRa6PpSApr7IcXOUsOo+niTL0SvQjVhRbG550Hve7+0WeWmhy91HREkDgHHqS4tA9V9/UnCcDUE6jiJWq4u9VakNYR/cORvCIhdaHrgXJNBX/Bb3DeMopWLc31+iBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824676; c=relaxed/simple;
	bh=Puhb9y8XG8KLGLMFjlsPhq/rxjMdTvMoxR1pFU+GbOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I0bg5fa4zn10v0kEat9xnKMav002QidyAK5uRhdni+Kv3xPyDaYULYufgONdr5uRQtU9LFXu5EYEMR8qIblqf48ayiAX1sbgRNhBX/XMLdTI1jU78HAfMEdiSDPxCTVR2/9zmVOT1lUPvXqGh16hgZ8KAo+3HH+QjafhKUF6kYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=or1/tCms; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="or1/tCms"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so7220385e9.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824672; x=1790429472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M59/iU/94UEEWnEAOxMnAplI0bpHeu60K9JCIDTKOvo=;
        b=or1/tCmsTRrZGSclfbKWwbs5ZMvAWDaVgdLfYrQSf+U4ApxQbn3XFGLKReFn2tyyTt
         3LUUgTTzNBBJwG9hvoF2oqlu/t/r54fX68AERs80Gp32+qT7p/qvw/jdRIEZSDmpbOlz
         YFbnMosJoBdoiW0vZZeNl5gl4OxjeNahJVhV1t535LvE4G9ND8OO9Kd5hFrJ4ccqHfaC
         7yWzJLE1Xf2EZ7vN2xcziaegFaRPP6EPT2KOXtmJeJ38yvMAaL3jQQi3LNtAhKUr8kUI
         EaaD8oPpeRIf4baODu8847f2ODi/uRup78Zloift2T7OE6JvstkyvBCxw4LYFx9U7BU6
         WsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824672; x=1790429472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M59/iU/94UEEWnEAOxMnAplI0bpHeu60K9JCIDTKOvo=;
        b=dBj/gvRYyyOrdKf22GL/pTPKRjaaK/zJKt0EeIjkWk0Faf87/s3BYDl8ORMexvRzPz
         6p5xixmCO5Yrwp/Y4YzaQD2jhWptwJMkeCaJcmhN+l5uWscdmS4HtP9V7XhPDJ+a1+zd
         WH5ryqLXl7fkEF2Yzw1ni4BZySOZN0N7tyAl/MLmRNozOBMMnvKBfQ4lqRSDL3Z8868X
         TO26BOTQiTslNwAfcCjoZLcNWjG3Y1UJXn8h3BKux9BkdPSIhuLrY8WhL41gdB1MjsxW
         4AcAT0UeZsgcnZ7XA1FeekSBLCSjYsPV8VdQCb3PFmME73Nz6oF/TqR09Bn04Ung9PHF
         QeWw==
X-Forwarded-Encrypted: i=1; AKwUvBxI/5y2652MTOgu6ozn65zItie/47L2gnwKTwmIzq1UsnNlNZb+YyAekaO28Oht4pEIB8O1mdgAYR6P@vger.kernel.org
X-Gm-Message-State: AFuF++lYDsRi+umVWpflvwvcaxn56Fapoj12v8Ut+HoXShd5RGxnY2yx
	4TvIXgbDtJo9yn0mFRgMzOpY2NgWJAbAbgjkQW4Cdivewx3UepIDpsCyg2cVTrblloY=
X-Gm-Gg: AYBFou3S3ulRT6PvLlSHi/XOogCPXa2Ma0MvS1krbhcbsN9dKZZigQ2d93AvFX6emJ1
	BmRv4Lxyk0WW/Lvk4h9FBauIK8V7MSrUFQGHgUT9Tusvd6z5pVxYeJblxNCxNl/2x01m7oR7Q6T
	2cxc5XUlpY1gZJUEoX6MpCrwMtv9fPl4bl2t7W1qyLSwd06YpsfU0vNNdWM+sdnFIm2Hk3iyrIL
	HInGj7Gzcfetfxijl6eE4nREIvuuF2OYgTO+kkMpJW9EPAivHs8iqXVQ7ciEhsR6QBQr7FqXU7h
	oMpWATisLHLoYL4fQ87bKfXDKnLfCmdF2GTJSKHfl38YtcIIR0Q6GF2RnmU6sL1I8TVbm+Lw6dY
	5bgRwwdZ5I5EvvM8dDp4VaLDVqVaU4C73sfpCb+iLSYtkrpWJENKGiYe6pkiDenPTi0+w+5JgJ/
	1WCW9KPuGyed3FqXJIgmz6Uf20XXexpGS1RHPcolDD593JQhTa5jql1UOFaorFt03e6XSiJVSL2
	jY6TNaqZ4jcYvZKlKeqhAgbzpoNQyTi2zO0R6vvb5qZroS1VMzXLE0=
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be8mr67988985e9.14.1789824672039;
        Sat, 19 Sep 2026 06:31:12 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd086ce9sm105569825e9.12.2026.09.19.06.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:31:10 -0700 (PDT)
Message-ID: <b63a2054-c695-4bdc-809c-924742526122@tuxon.dev>
Date: Sat, 19 Sep 2026 16:31:06 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/17] ARM: dts: microchip: sama7d65: add otpc node
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-15-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add OTPC node along with temperature calibration cell.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index c35f27615bc4..aac2e22d96cb 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -15,6 +15,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/mfd/at91-usart.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

This header is not needed for now. I can drop it while applying, if any.

Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

>   
>   / {
>   	model = "Microchip SAMA7D65 family SoC";
> @@ -1111,6 +1112,21 @@ ddr3phy: ddr3phy@e3804000 {
>   			reg = <0xe3804000 0x1000>;
>   		};
>   
> +		otpc: efuse@e8c00000 {
> +			compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xe8c00000 0x100>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				temperature_calib: calib@41435354 {
> +					reg = <0x41435354 0x2c>;	/* Temp calib data packet TAG */
> +				};
> +			};
> +		};
> +
>   		gic: interrupt-controller@e8c11000 {
>   			compatible = "arm,cortex-a7-gic";
>   			reg = <0xe8c11000 0x1000>,

