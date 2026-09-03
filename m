Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC24A8FFD
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442913; cv=none; b=sFDMHwCwRA3JtGWeTZ2uWRmKp5GIlZssx0Z3pAPza4apstG2yQTorywD/DoK43CcovfxdTKeleNtedKI7wDlmS14uFXGmCSbAeF2M/Jz6dOt0W2osco9t0l34LQ1ruVeyB79d1fyny1fzWHGR2Nwo2InId2kU70qG+5nuZoivhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442913; c=relaxed/simple;
	bh=B5BQIXBI1hMCnLc+kI4DtaH2H7dDNRGZw0bT8ragUhY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJV+cxgLngadMOCpyQ/WNIIgiuUzHe5/n/4xAkMxtm2Zv4bIEUi0g9ckX15zkFQMnRYzx6McGt3uiv0M8e7rNWGx1Jv8gpVw3XnZxcjSbYeOfl1pDhvKxwIu60AElNEn5p3y76wh1BhictFivAoO9m76Fn3+Z9PA6qZAb5Ji4Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RP8Kopk1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RP8Kopk1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48442ea8f59so763941f8f.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788442898; x=1789047698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iiE6UVA0heAgE+9tDmCf0F1m5lLI5gJLshxcqafEbQ=;
        b=RP8Kopk1l0MriAu8C2JX5Cj71Yfq4hkTA8cj9FmWFZfjjgMbi5te+1P2lbOfex7lVF
         NG25HorKH5ysre0UR7dA5cdGwNcGUr4eYqJTKCi/YVM34jX6LWg5r7drpckP5ZQaKzFw
         lRrPUkPSYGklDI5ZKvCJe9M83/X40hI6E1vIHz7RE7Lfb2l4P0PU328lIW6IhihQzCdm
         8La/agEicEkYFObPqa0qzoDd6hVIfjmTwiHhXoI0lmsYIi21H/Uy9+YeGknHhSuVWcaP
         iyKcSLZ4GD+jhtGLZ+XwgX2Gm93gxO4Au7eMj3GqEGbTZnhDOhjyMlHLRacj0A6eARWX
         3LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442898; x=1789047698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iiE6UVA0heAgE+9tDmCf0F1m5lLI5gJLshxcqafEbQ=;
        b=UGSn/MfHdOKNEN94gd2/wXFIcxvlInE5+v7BXYCtznSUyajGBYQLiHqvA7A07ssxS2
         jdkfSa2AYFsWHNcXvPYLuLft2btSA0Ii9Qh/JzLJRNEa0Er0qlMtWQKaLYP4Fkzx70DF
         T9i1fIndSKJFJrbUW0aorSJx23hOWvRo/ntaDClAwKGuY5l4jREhG0nOegV181xM8+mY
         x/tyUyHdyzlyWwPe70e628X2P1pW2fWfwtnZLC7agcvX0X8x2lzNO5jXmYqpvSuKc0BO
         +0a9e8fUmgRBU6SK+yUr6K1zF0b6GT4FiKJLUqpFZdPFlmapPmjfF5tF6CrIYd46z3Ym
         +1CA==
X-Forwarded-Encrypted: i=1; AKwUvBx+k19WLIlW4i7TBo9bGRlGchZnaS74mfBvMNU3qHp3J/NxoM0+NH0zSxv9Tk3ai7oRF7soZnYqAINg@vger.kernel.org
X-Gm-Message-State: AFuF++k28YZoMJXM6hN4g6iouWYyvoMiRGObSwp2bILJJ7Zv/V3rYm4o
	hV9C23U9EKT/8vtqqxzsjV2iTcf7pDFqt7PlTvirl/mZCcLP51RgVIP5ZcsUTbw82p6AqGNPlDN
	1PAptl64=
X-Gm-Gg: AYBFou0fcq79a2RIXK2sqRMj5fJBKgIaLcyM63R6JTU99/FOFIf/LgFOn70n7KLvt95
	ZhH8qIGXDe0G3AKfSjqID/a/pjyeTbij8Wz1SV7ryQFIwSy4NDPu2knu2JXtVqfOD1G1tqqu8++
	Ap5iJeU+KW0XdzawhXk2fQ2jkQzyAcY3u/rBRebjAAJjys+ulVOWH1sENnd4CSmm6KnjcpktZXH
	5tevkzpv4OaJXe4d9FFamgBWUBM6UEZ/O5z55XF9/IjoWiOznTQxIxXwinC9Mw2U5TQtVZCu431
	2kkCTLNhIs+Bhe71AxhC4YGTeyRwK9JFytbu/SNrhnXuwwibChFnLcFoYQ8fBeZY98fz8jfbW4g
	5kqKK9yZMMxTRhoYYC9CgGCEoZSKLU+y0W7b/luiTrnQnFscm8CkmbK53MHq4+EpUfEZ3cb6vsE
	7CZLqsjxaNimlUX4j9siPHz0oVqsN97d3BlfuAs5wJARk66B33nhheS5gBRw==
X-Received: by 2002:a05:600c:1388:b0:49c:eded:44e with SMTP id 5b1f17b1804b1-49cf158e77fmr37815585e9.7.1788442898624;
        Thu, 03 Sep 2026 06:41:38 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm86567845e9.12.2026.09.03.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:41:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 15:45:16 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
Message-ID: <apl57BlWIkOWjWAu@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-4-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-4-pbrobinson@gmail.com>

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The Raspberry Pi 5 has a USB2 OTG port wired up to the
> Type-C that uses the same IP in earlier generations so
> wire this up so it can be used.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index d998bfae91acb..e5030da60f9e7 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/power/raspberrypi-power.h>
>  #include "bcm2712.dtsi"
>  
>  / {
> @@ -239,6 +240,11 @@ bluetooth: bluetooth {
>  	};
>  };
>  
> +&usb {
> +	power-domains = <&power RPI_POWER_DOMAIN_USB>;
> +	status = "okay";
> +};
> +
>  &hvs {
>  	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
>  	clock-names = "core", "disp";
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index c73ed9e066662..f650a5cd8462d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
>  			clock-frequency = <96000000>;
>  			clock-output-names = "sw-baud";
>  		};
> +
> +		clk_usb: clk-usb {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <480000000>;
> +			clock-output-names = "otg";
> +		};
>  	};
>  
>  	cpus: cpus {
> @@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
>  			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		usb: usb@100480000 {

Please fill in the missing 0 in the unit number. Apart from that, LGTM.

Thanks,
Andrea

> +			compatible = "brcm,bcm2835-usb";
> +			reg = <0x10 0x00480000  0x0 0x10000>;
> +			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clk_usb>;
> +			clock-names = "otg";
> +			phys = <&usbphy>;
> +			phy-names = "usb2-phy";
> +			status = "disabled";
> +		};
>  	};
>  
>  	vc4: gpu {
> @@ -756,4 +776,9 @@ cooling_maps: cooling-maps {
>  			};
>  		};
>  	};
> +
> +	usbphy: phy {
> +		compatible = "usb-nop-xceiv";
> +		#phy-cells = <0>;
> +	};
>  };
> -- 
> 2.55.0
> 
