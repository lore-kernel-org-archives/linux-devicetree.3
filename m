Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1125A640
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783275635; cv=none; b=bpwrlHya8N6JhvBzcwEZQErM7n215cmeGVVBSG8G7ZUzKku+wx3DmiyCCuC+mhsOhn6lsazHtaOwWPjdNfppg3iD3NFxB7mB/WHr/MKxxFkgrfkHQz261VxrS/xSaHTINWKUOo+/Xr///0xEWHbqX8GmGHsY/W/q27FkUMmicIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783275635; c=relaxed/simple;
	bh=EI9UCqFX8AnFnWZVWcuTgFyMvYFMxTWSiGnFuv5jyWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgkRS4TvNKu60enr1FHBDFHnrigSFVRl1T7SLV/OClFLiFx391OWOZxYPYrihN9Uz5hLUkRYGZnloY5jYDQDGGWVxxk8nO+ApnjLFE2zBzo574j9yCVc4kGn7RDlFq7XC0KiKsbYv1oQmjPEuryQEepMNaOmChV9r2FVQ0vc4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8Uyv2GT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8Uyv2GT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so32156925ad.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783275633; x=1783880433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGtsisFYQ3ZsoB2jg7Gl9tLznZoCpOpVvTrcNSu1WWg=;
        b=K8Uyv2GTgJ4UC50xUhbBuvD1aAdIaQKVzfZmkV/fbrdY73xt7DY0Y3R4tfTeNJgcdw
         wEzbU+vfddYz80aPT5D2q3ajvnsUed/YRABHoq49aa8jJ3Pmhqrc1D1qV0I81Pw5H326
         EqnsRRRoG2879CLBuC6T5oGsm5O2ROb09RTXY5LGX/iFH2BY0mxf7aWfTMtiwsHeGAgN
         GZok/H6I4Pt7KU53NDWWyTt4Q3uEamgrinrodtPpuqrk6pJuB27y7RwDwNyo9dHODZiP
         2h25OV27OWNkw23w1+5v1lyaKlvQKwlj+Te3987c6pycEkGj0L1rYn0/4lIWwappON7i
         +dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783275633; x=1783880433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGtsisFYQ3ZsoB2jg7Gl9tLznZoCpOpVvTrcNSu1WWg=;
        b=Urn0MGlpXGpng3xT2xPA0Qj+pFKn0HJH7npflUFCMuHOc3KXwxPQoJQG1uWNqF2sVP
         xzIAFK85FtwxzMjxQx3ZXBA2tsdAC7GgsQNV/3vqNdZQq1gSBVR9pRWZfmQBbm/3VZou
         o81VRi+nXNhePD05IYjkHfrLxcfRZAgML8ncuPRSFATcJ+1qM8EEkFkrTGDn0AXAHJDt
         PEEeq9l9IaJMMcIx6MHQ9yzPmz3bE68aOv2UAthXPXiEihApPVbgITCtZLJ718MaMBiX
         MEbme7x1FE2ABB7EjWV93Ve1CVxdV+RqXhWNUVateTnKc/muZEzql4OfTY32MrL6PDDa
         h4UA==
X-Forwarded-Encrypted: i=1; AHgh+Rqsae+s90grHGuvdJ8AhazsVH06IjAFTog66VHah9gYafHPBkl64k+9tdUA09FDb7Poav81b3VzFjI7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoWIG5KZJuv7SXr8Qfp+hg8DjY5vdyFMiRzh0PsOwfdjzmi3D
	l1Lb6Xw1+4FFKY2MJ6sHvmSvQKaYyG1IrZuM+H1G9F3oT+N0zgRp8caE
X-Gm-Gg: AfdE7cl99zAWQpYGi/siOl3RGAXtfqVBY1TbuN/ahvGCjG7Cbh6sUxIFzbgUOOjpsXI
	6U2aQOOqt4aQgg9JTBgAYg5EolDbwxz5ysQ3W37LMCqW4KMmhQ+4le8VuO4IIv9PUg8r3x7Ax4J
	Wr77pCFuXoHAAWByWqOYhRHUFhTQsXRiWhkcs/9Vd0m6LsJj97/5PXga4M6BGaQsQffxCytBWia
	o1dMX9QFQAYBkoYPh1KnD0D3gQkLFJTjAcAo8m9EzVr9atnAfVwgZDv2Bw93dbEbcz6uUPfZwG2
	ZbPVb5B6DNIw256YvYLLa0dTOGlHJIymH1SrWbUy6zPCRD2GCBtE3UeVnFpXcDSf6sk/mNNJHQx
	xwd3vSbKVuwm2DwzbeKyxnexgKNQ4WVxL0OcTYXbTWkMKr0frMWBAjsNTScb3GIEW7yh/d+LjJB
	kWc3byxK4Va86wq6Svm4tuQqYLyq1ZVndHNfTZ2tOmmj+mQIwMLcKmN3WCghgD76iHwJBo/9WuE
	rFSCJRXmg2fReJd
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr13586199a91.8.1783275633209;
        Sun, 05 Jul 2026 11:20:33 -0700 (PDT)
Received: from MacBookPro.tail6abcb.ts.net ([2804:7f0:460:b8cc:e161:f046:ac0f:f27f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm51230319eec.14.2026.07.05.11.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jul 2026 11:20:32 -0700 (PDT)
From: Brian Mayer <bleemayer@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Sun,  5 Jul 2026 15:19:19 -0300
Message-ID: <20260705181920.8633-1-bleemayer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2960762.AiC22s8V5E@diego>
References: <2960762.AiC22s8V5E@diego>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello again, to clarify: I tested the v1 patch in my radxa cm5, but since
this v2 only contains name changes I didn't test. I added the missing
agent tag and am sending the patch inline. Thanks.

The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
battery holder. Without a device tree node, no /dev/rtc* appears even
when CONFIG_RTC_DRV_HYM8563 is enabled.

Describe the RTC, wire the interrupt pin with a pull-up, mark it as a
wakeup source, and point the rtc0 alias at it so RTC_HCTOSYS/SYSTOHC use
the external clock. Wiring matches Radxa's downstream board support and
uses schematic names for the rtc_int_l pinctrl entry.

Assisted-by: Grok:grok-build
Signed-off-by: Brian Mayer <bleemayer@gmail.com>
---
 .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

Changes in v2:
- Rename pinctrl to rtc_int_l / rtc-int-l to match schematics
- Drop Tested-by (covered by Signed-off-by)
- Add Assisted-by: Grok:grok-build
- Send inline with git send-email (not as attachment)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
index af4a9bc01..d22db4d18 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
@@ -19,6 +19,7 @@ / {
 	aliases {
 		ethernet0 = &gmac1;
 		mmc1 = &sdmmc;
+		rtc0 = &hym8563;
 	};
 
 	chosen {
@@ -198,6 +199,18 @@ usbc0_dp_altmode_mux: endpoint {
 			};
 		};
 	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
 };
 
 &i2s5_8ch {
@@ -221,6 +234,12 @@ usbc0_int: usbc0-int {
 		};
 	};
 
+	hym8563 {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;

base-commit: 87320be9f0d24fce67631b7eef919f0b79c3e45c
-- 
2.54.0

