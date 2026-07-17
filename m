Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792920DD51
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784250472; cv=none; b=d4R7QHYJtXQUifbQnKe7r8agGANfsr88M2cTuWAmSaOcCCsi+TAVE2bHsc2OalqgYcrznPgIhJsPnWpaslvJbva5KWtnDcIWfY5wylL/QSR7XhtiF2m5dvvDxpCvqeUvuBSAORTrKw2YQyWRNZhqWTZ++NyA8qftFl3S7pnSWAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784250472; c=relaxed/simple;
	bh=Ir4mYQSQCys8EQbxfS38qUxXBbseEM71kE5+FdAzQVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLlwBvM1RbgeDhvq9UNX/5YG5D8ON0+mQuEp1iYu+rfGJCokzcR120fvO1CRGLNL10UV5urpLfKSy2BJndLPpoEjbCd0qxoOGl/Qzcjp/rNZXxpWVrdRRAJYJ/Z+tsZxUssoP3XTLiiP0BjNJa0ew2/xzTRIFYVaieKTi3Ky6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvOhH8ia; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvOhH8ia"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80bb41f7f3cso38599197b3.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784250470; x=1784855270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPT39dJ1gtwLyIatxoxDgA9qUwXYidynUbaVwKzanpk=;
        b=fvOhH8ia/6qcxeCfmR9WgWorF+T7KJA10WNxFvsVpMRhg0kU8OUIzDGDWI7MWybJB1
         EmlbiPfmh8lT0oFEUAZBBiy5H9stxwQ/SaeS6U6l1TyDZv7WjEaEPqsl/RA1hX5mXTfy
         jZOQb1Krz62GfyhJxidqY47IOjbDjLxyIlgEOeaoWVX8lpiYrELO1dBa0XVYcBBaZfsp
         HeMChRcD9HgFGbInRt/TVXnCJMvso4XL3Y/SyWLw17PYGS3l7B5C+xkfiSsui9slSQN9
         pa/RKixBZGjmEmutdVD2cyjskj2/e4Yy8IG2WJKcPoPvLN+3SRDNJ+v9ML7J6+gNZZ4k
         vk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784250470; x=1784855270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPT39dJ1gtwLyIatxoxDgA9qUwXYidynUbaVwKzanpk=;
        b=lXhS3vFJdPFFnNCXaRw/1BW3cyZpw8iFsttGgI0qeoBLYXCrISSdhnOxjPgPGrCQK9
         UPUwi9H/dn/SCdo8hi6l4Rwh3iSljGitzjrcCLBiXYfSOGb1Xbfu/bVZEbmUKWhAxDIv
         04HpVComY/Og/Pssa3mwIZbMxrqweFg3R0PLDsfC79EKOA5LBJsRt1x0dsCsMi+nFXDg
         Kp+7FXpdinnAupk7FazEH4tNIM6Axe8jUDF9kr0CrKdfnNX8ZOTEjHOBrA7umzOphH2b
         B1im04CcC/DthzlFZaspZnxF+wrMdNIfvAcskGREH5SRpUX0CNr1oTXKc2VKmjeC/WSr
         e1ug==
X-Forwarded-Encrypted: i=1; AHgh+Rp+5/0s3spvFS5y20CzOzaw2YMMoAn0FJKLnAsTAFGJxSKNwBjBxgRNh6l2SOd8562qwP64OpvRN72c@vger.kernel.org
X-Gm-Message-State: AOJu0YxAq7QSB6yXOJwnqnziLpyukOmtmpZQrT6EMdTnAdTLIiruBeht
	oxJiES+j3C3697HQ3E6m+gRnzrjC2/53HV1TteZ07kLWYtSeRb5Zaxci
X-Gm-Gg: AfdE7cmszXZxCr1DgrTjLgV7J7xgnWnNxiV0qfmlxF/kWHLx1Kyfcb2S1yw3remvHVF
	UBKrBFXEID3ofd0HmWPG6bAjM7Mt9DzzW0HXzEacLXmqs7Km4t/kjGMOZDc5JgwRmZSqX2UEIEx
	mZ0SA06tN7ZU9A52C/8cByMt7MBoZ6EGj9OBo1FxGgQf4EgZgpHJQ/RqfzJUokjlt9KvXMFHNVV
	cXAOOQ2jYOMywFAD/AfhQY2MGckOoTcV1DvzS6XTbL/WADF6dm9y/sQDXRy0cNeQliJFr5qTqk9
	JFmtC6yC2hBu0jAaHrQZbCW4FQ/Ran6NI8JYHgBXEgWYILcPu8yXPZIf2+pSGcxO8Lz8K9tWdQB
	ZGGSu2DiO6YqRpSXyr8VnqnO5oTOHQdgZsvWdjGda/1/ek5iRk534wKRO/F5zpfu8ZzmgxTjAqL
	O0TPGWHqaCUDm5nrFCh+9NTLbJxzR3WX6T5p94D/T5QUJi9+Q=
X-Received: by 2002:a05:690c:c0b:b0:80c:85e5:8744 with SMTP id 00721157ae682-81ef2611f04mr442457b3.66.1784250470113;
        Thu, 16 Jul 2026 18:07:50 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e2d1:829c:ccde:e84f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e8f4c5d3csm159095057b3.15.2026.07.16.18.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:07:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus
Date: Thu, 16 Jul 2026 22:07:35 -0300
Message-ID: <20260717010736.578419-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717010736.578419-1-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The rk3399-roc-pc-plus board has an Ampak AP6256 Wi-Fi/Bluetooth
module.

Describe the Wi-Fi function on SDIO0 and the Bluetooth function on
UART0. Add the Bluetooth wake and shutdown pinctrl entries, enable
SDIO0 as a non-removable SDIO device, and add the power sequencing
delays needed by the module.

The module uses the RK808 CLKOUT2 output as its 32 kHz low-power
clock. Drop the duplicate HYM8563 clock-output-names property and
remove the same clock from the SDIO power sequencer so the Bluetooth
node can request the shared LPO clock directly.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../boot/dts/rockchip/rk3399-roc-pc-plus.dts  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index f6d62ee51f1b..f87bc7b6afc1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -123,6 +123,10 @@ es8388: es8388@11 {
 	};
 };
 
+&hym8563 {
+	/delete-property/ clock-output-names;
+};
+
 /* <4 RK_PA0 1 &pcfg_pull_none> is used as i2s_8ch_mclk_pin */
 &i2s0_8ch_bus {
 	rockchip,pins =
@@ -157,6 +161,20 @@ &i2s1 {
 };
 
 &pinctrl {
+	bt {
+		bt_enable_h: bt-enable-h {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_host_wake_l: bt-host-wake-l {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_l: bt-wake-l {
+			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	es8388 {
 		ear_ctl_pin: ear-ctl-pin {
 			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_output_high>;
@@ -180,6 +198,28 @@ i2s_8ch_mclk_pin: i2s-8ch-mclk-pin {
 	};
 };
 
+&sdio_pwrseq {
+	/delete-property/ clocks;
+	/delete-property/ clock-names;
+	post-power-on-delay-ms = <100>;
+	power-off-delay-us = <500000>;
+};
+
+&sdio0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &u2phy0 {
 	status = "okay";
 
@@ -212,6 +252,17 @@ &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rk808 1>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l &bt_wake_l &bt_enable_h>;
+	};
 };
 
 &usbdrd_dwc3_0 {
-- 
2.43.0

