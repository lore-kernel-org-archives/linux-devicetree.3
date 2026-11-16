Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838997;
	b=5LoVCO+28bq5JOiyCsryVM2Gms0UiumlzGxiNC7qrQn7b4No+u0zNsGuEs+oZp4TDbW4
	 yxAohXkIbg6gykxEP49+CNzPluGez0ZDnVyoldxNZzk/49hwJPKWPrOeNiwe4+tH58rrm
	 h+37OsnAP9LtBSj1BCnlrKBsyDLV7Hu/rJFLVaU5XFlOyrlRaKR3CsTSJyWrHZRdLgjNv
	 pACttt2EVZseymhSZkeFHGCN6f+GxTM/iUFvM6arwwyOa8ixbgRxGIJXS0vsxMU2Kc1dS
	 Ojbeoly7SD5aVdFUBo7ZsTq0FUABq2DtXC6QtUqNZR0qrky2kQ4N/TaFGNTe08zERWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
	b=Wt7DPPvEVL7I6DxVjegTjiei2hQKvgAOs0hWsTRUwt+sOvpMpxrgMT6JIKzKI0QiRixz
	 bSI1UMuk9MMsbIrzy/4ZpY8xEOpLqxdrdvb9+15YdaNixGVxVuWAFyC2uopEN/AdqI2sX
	 N2c2wm+NuxNw7l+yqc07yyvPkmPmgnh0oMudRdYzEgsG6EEuBzz02lk9B6OnmgVI0E2Td
	 ZM5198y1RdNb50Hmmn+AqO+XFcTdBYhQggfRo3sMJBA26za2BaAjvcGzrnLK7klcAlvFU
	 +NS4zNXX2b22MSGNcRI13cxRqcwiBkqjlPzbYjHJ/sJEljCsi4GgtAHb3MOrkU/MIOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T1h/vrJ2";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF40606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF40606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1h/vrJ2
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so4217869c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838995; x=1795443795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=T1h/vrJ2PPA4ZywrsRqJi57rE0DIAZeHaBPyJnPuFsPBFGvmWmZ+OAmsJV5zSkmwfd
         hivws/INsIU3HvlC0pcdHlZpnngyPWVZkQBIY2A1Twzu1pb2P2GOc5KmSJ29d7KZIGNT
         0B6lWwmobS7mOQZpLJBzs/oNd1wNzJdTr8HGnDdL++ri1gsU/VJAdYjYbJtWXp5q3URz
         +SZV22874YIczGdgNxsN1vyOWEH3gZ3ybubkg8HzRJFpo0WYmwND6eYHQoQqu/XQe9aN
         uQkvOLOSO0Ym8rraGvbsdGHmVR5AssC55RpEaJbdod9D6HDNwsE4xHDUMnabXgzKUHci
         2vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838995; x=1795443795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=wdXnhpfqoEV6gmDSbGWV1UEiLbvIfYEl/LWSxV1GBg0Co8tWiWyIaW2mDd8TLeEKua
         AwbPZZYyOp05GHlQpHtUrehK1UY2KdQ1MgS6isJ9hQvMybl5h8t9r3elAenwBSIE0gDm
         ZMhTa94U1KKJPm47X12hX7AYPYaaWpAZb6ku0nFA+0ckadqCIQi6N4k8roZdh1PEwWK5
         IUj4JadNVo0wp3yP+n4c9A6h8RVDHtgHzBCKP+uZ8sqxw1e+zblCOT306JI//zyk8vFf
         JHO6mnGC5ndNDqEeIxeCFFWXdya/FrmRHShqkXh6asQQ6HjTen3vHsbH1iV61KwF7sHx
         8QIw==
X-Forwarded-Encrypted: i=1; AL+hErF5UXiWYQefuhsJT3ubGX7NnjTEMYnaN5Z4U3dw8dftPjcyY11Qvy7YYZWTBHw+xtZ0kEF8K2JmzTK6@vger.kernel.org
X-Gm-Message-State: APuU4Z/rWtvuCNjG2fiRota+VCIkJ2XgUnflPkuG07jfktOIeMd1Kt3O
	81ADDfMb/gtyapnUdRCOGV+CPzUnYTqydJ6DkXgGWDotlWA1sawLsfDx5uoTsLgHbss=
X-Gm-Gg: AYBFou17kDgbl3C7sdVOVQoovgr9HN8rEmrXVTdCgXtYiV0HSGdpoSFuDWfKny1uPJf
	VViWZuSWg4D01QBlBCeep7bUjHLcH8f64F4D8HA6Bmvh8e6gSi0/J8mzSwC+MT4DfCMP6aOpD3P
	dvyvk9imyxunYtWv6a/fIOK1aFt1nXrRrm4NRiUfVuXrMy3eVXVYz5dvQkyQsCtgQNhmvPGwzLb
	iNnGwO8vSmLNNIjSBd9/Gczz0Qc2unrBWHl1o2pIlk8zaBZ/C9oSRCOCYmB5VMA+V2MdyYeR1n4
	ZYgQ8tgf6FcxrmBkqolYp7/a1jEJP/vZXGTmkR//vnIEYVdftdsc6+1gJ+vHMACCWIsVkv9QWQN
	y9knzPxqt54AYLY6sI4bC0bZFftDhZBkEi9sfPagHoRw/L3BER6NVUF1NLPKydubbyh8AGj615C
	0RvPCH/Z54Cnh6orSOoiWYx0YpXlKGt5e5XgIhNqyiHyRknheTkQ7FLss8mzKw4heVD0paR0xFr
	6Z5Ql/WGrMzQO81dvFYvTqGmnTJITToQ7Nh4a6QiXFiTtnK+J4GfPSDCWwXk2gN/8gOnr7vZ0kV
	87NiBg7fg3TrlQlm9OOzkHy9SlScrUl/He91+sU=
X-Received: by 2002:a05:7023:904:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b503068271mr10508055c88.6.1794838995363;
        Mon, 16 Nov 2026 06:23:15 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm32526875c88.12.2026.11.16.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:23:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Mon, 16 Nov 2026 22:23:07 +0800
Message-ID: <20261116142307.671340-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-2-jernej.skrabec@gmail.com>
References: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jernej,

> Every H6 package contains an X-Powers AC200 die next to the SoC. It is
> controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
> PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
> RMII pins on port A.
> 
> Describe these parts in the SoC dtsi:
> - the I2C3 controller with the AC200 at address 0x10 as its child,
> - a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
>   input clock,
> - the I2C3, PWM1 and RMII pin groups,
> - the EPHY calibration value in the SID.
> 
> Everything stays disabled. Boards that use the AC200 enable the
> pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
> their MDIO bus.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 48c771223af4..5e48b35d13de 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -17,6 +17,16 @@ / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> +	ac200_clk: ac200-clk {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm1_pin>;
> +		pwms = <&pwm 1 42 0>;
> +		status = "disabled";
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
>  			cpu_speed_grade: cpu-speed-grade@1c {
>  				reg = <0x1c 0x4>;
>  			};
> +
> +			ephy_calibration: ephy-calibration@2c {
> +				reg = <0x2c 0x1>;
> +			};
>  		};
>  
>  		timer@3009000 {
> @@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
>  				function = "i2c2";
>  			};
>  
> +			i2c3_pins: i2c3-pins {
> +				pins = "PB17", "PB18";
> +				function = "i2c3";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			pwm1_pin: pwm1-pin {
> +				pins = "PB19";
> +				function = "pwm1";
> +			};
> +
> +			/omit-if-no-ref/
> +			rmii_pins: rmii-pins {
> +				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
> +				       "PA5", "PA6", "PA7", "PA8", "PA9";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins = "PC0", "PC2", "PC3";
> @@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
>  			#size-cells = <0>;
>  		};
>  
> +		i2c3: i2c@5002c00 {
> +			compatible = "allwinner,sun50i-h6-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x05002c00 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2C3>;
> +			resets = <&ccu RST_BUS_I2C3>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c3_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* AC200 is co-packaged with the H6 die. */
> +			ac200: mixed-signal@10 {
> +				compatible = "x-powers,ac200";
> +				reg = <0x10>;
> +				clocks = <&ac200_clk>;
> +			};
> +		};
> +
>  		spi0: spi@5010000 {
>  			compatible = "allwinner,sun50i-h6-spi",
>  				     "allwinner,sun8i-h3-spi";
> -- 
> 2.43.0
> 

Tested-by: Jun Yan <jerrysteve1101@gmail.com>

Tested on a TaiqiCat (TQC) A01 with similar board changes on top: the new
I2C3, PWM1 clock, RMII pins and SID calibration cell all work there as
well.

Thanks,
Jun
