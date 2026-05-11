Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD9E3AB27F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485793; cv=none; b=IUn0u6rXe22yPYAhf2IK5aqqPeZs2ae4Qc97dO2bRQQutfxbdSd54c4nYd7MEPEFvqiqiTq53Ja5EyzOTvb7v/y5NmcBcHriyZMhcy/i9bhlAkCUyZ/w36eJJhF065JVHyL3p5+2mgcx4iiCCEpMMm1RtPDEsP4+F5lrUnXp7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485793; c=relaxed/simple;
	bh=3yrZD3kUqUFtnfW7CJEM53Vi/Lg2JOO94rBYam+onYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7Z/60aLRvGOF3vu3m4aUe6UbzfJDXAQVQAUqLSI33mWFLrQosbd4A5dYlsZbJk13VnE0I/zYjp5/F947j25vtjzvQ8dwM67jbNulGcNC6oBn5e7TBblbKbosy9WY+VQZY2qg5y4KZve7dzaWVQp8rBoGnB/IAtEfAId/Cx8cEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk9C6gRi; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk9C6gRi"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso4365286e87.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485766; x=1779090566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=Fk9C6gRiEpQ8S9/nj/p/tziV1YIYn9HeN1oID9+99fczrmCBvqq1WT2bLt1mlKIihZ
         5obica/cztPXv9oAYTZlHTdep7sfM0lnjbD1BtjxazPDWR5Cm3E0hqaiJuXr3AInk28x
         x0d5jINUk7hwDy2DgXD0eIu9UI/NWkvGT4qm/YT57mk/mLJXpWO99AVVaejwXmAAwi83
         DGjQrWg3zkGnD3sKOc8EOjYWxTrurRhD2hjpNAQz+GrtJk0eD6ygy1bgZazJzFxUGUNQ
         3rYpsHu474t5I+BIU/Hxzj+AjxH1pulmDWuKgNA41Cq+MEhYxkdPHR00NjceDq745mPG
         u71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485766; x=1779090566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=NWyqdhV+H2TgsMgQIaiDNfBmX8oHHxTPTt0aehAPU27+bGPmmkxlWPX81c3SE4ERy1
         gmZwBh2xNryyyg0LzEeTJdVbR1ZEjoRv56jU+3uzu47ZVItAgHLAIsnaTBP4AU2vBXxT
         gNvTeIHQjiuLFAHtRpAHCKBRyy3N+WCOEMKgbsmZk6Rx6OXU2oho1Q8pAAyh9Uxsc4Fj
         ctgp2Hnv2LbkZ5JJ0nAa6kTbrlQuerrr+a169hlKJdHnm5ThjJcft3UNbCOoBVFsaIkR
         JqTmidf8fu8ZA27cGeXJ/j8GqPBQmnuVU0AmXRVVX5DvGaSVpZtRUYdFFRlg0ly5ohbY
         A9uw==
X-Gm-Message-State: AOJu0Yxw8zVuIlSDRM7sBHOLNKJLuaAj+4sct6ltB3TSTYLZSZd7xNVW
	IzTurihdfcGUj2vLSPMn1j89NMG6ufvQGcqFoOUuC+wdvwaSjPVUDsRQ
X-Gm-Gg: Acq92OGQijB83LaCmb4ZoKncO/DXDRB1o28kMiRKMbqrDhzN1kTkHo2VkvaOb8KdrY0
	gOA87+oGboX6Hp9tL8zxCeC1HQEUmcuIcXrKVv/wp+JLPeCegWG41k9+u9jPa6dax9ZqT0po09/
	H1XpinM/ofgvkX+E87mzoYYrI0WPuxP+7NfkwBcu49r8BpelczFfxBGqqSnkHAPEUNnbhu21rPq
	JEwJcSk6hLR2baWxnLSGPHIJ26BOqkSR9srxKcR12NoO1H7mfZpd/sTswj7VlTFqU7jX6/wJZef
	mmmB+OdjwbTjvq3CX3k/9UOV1WOqpjB8WoWORjk3LkM+cT1ITeE/59oSRFMQsLBVeJACgyqANxQ
	T05cGlYbu6MgTbw3ub3UsAEDSRYGNBUkU6diaaGKfHK4+kbV4qnS/5SSIgd/j+2pQF5w36JbHbz
	+E+z4jg43mCPlk
X-Received: by 2002:a05:6512:2252:b0:5a4:b2d:25c0 with SMTP id 2adb3069b0e04-5a8a949f103mr4343741e87.3.1778485765742;
        Mon, 11 May 2026 00:49:25 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/9 RESEND] ARM: tegra: tf600t: Configure panel
Date: Mon, 11 May 2026 10:48:57 +0300
Message-ID: <20260511074859.24930-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure DSI panel used in ASUS VivoTab TF600T.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 62 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 9296e7970ce4..8b68bfef8dee 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -23,6 +23,7 @@ aliases {
 		rtc0 = &pmic;
 		rtc1 = "/rtc@7000e000";
 
+		display0 = &lcd;
 		display1 = &hdmi;
 
 		serial1 = &uartc; /* Bluetooth */
@@ -55,6 +56,37 @@ linux,cma@80000000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						/* Link to the rear camera */
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						/* Link to the front camera */
+					};
+				};
+			};
+		};
+
 		hdmi: hdmi@54280000 {
 			status = "okay";
 
@@ -68,6 +100,22 @@ hdmi_out: endpoint {
 				};
 			};
 		};
+
+		lcd: dsi@54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+			panel@0 {
+				compatible = "hydis,hv101hd1";
+				reg = <0>;
+
+				vdd-supply = <&vdd_panel>;
+				vio-supply = <&vio_panel>;
+
+				backlight = <&backlight>;
+			};
+		};
 	};
 
 	vde@6001a000 {
@@ -1123,11 +1171,10 @@ pmic-sleep-hog {
 			};
 
 			regulators {
-				vdd_lcd: vdd1 {
+				vio_panel: vdd1 {
 					regulator-name = "vddio_ddr_1v2";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
 					regulator-boot-on;
 					ti,regulator-ext-sleep-control = <8>;
 				};
@@ -2386,6 +2433,17 @@ vdd_5v0_bl: regulator-bl {
 		vin-supply = <&vdd_5v0_bat>;
 	};
 
+	vdd_panel: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
 	hdmi_5v0_sys: regulator-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "hdmi_5v0_sys";
-- 
2.51.0

