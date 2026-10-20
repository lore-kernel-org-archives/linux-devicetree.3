Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484339;
	b=MRfsIy3Y8hcX6ClqUT0aE7C5ffs0OPbCx2r/sZOB0/R4/avZNTbzpYmbZpmujvRDwAvX
	 jJwi9s/4coNVfB0Ot4SIcYqs3qLHpjhRecd4sJv0XaDP3OqwTSDb59dTkZA4+bz8MEFn9
	 r18B+Ht1wbbtAmUS/ol59Y0vWkE2fvRB0V+lynCofL4IhswtLDIEPL8Fz6nmKmaKAvmGm
	 DXmuyLnI2Ust9OHLYGKaa3u3DLhlEhtQ4nEwomsa9Z5th+dMXoKMzbaydGNSU3ND0nvKi
	 qrTbn/jfxcIIT/l72bHkBaRIexsSHVzTBnl2NjM0alqGID1lz2PGYQeJZ9zhWEtyXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484339;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:References:To:From:Date:
	 X-Original-From:Content-Transfer-Encoding:Received:Mime-Version:
	 In-Reply-To:Content-Type:Cc:Subject:Message-Id:X-Lms-Return-Path;
	bh=kV+ysOu+6F/RM1Ge8MteVU55Vww6sMy8zKEuNEbejKQ=;
	b=vut3RhQ+6DSpoQiLO3ZKWmX1PoBEG6O+DNh5eUzAQmpAHzEVSws4l11i2Q+2CW6ouDw8
	 slyhXd5BM3SWmuPhZDH6lqiC/1uYxePttjyD6Nvt/Orj6qtVvU4S/KIecILCLKmRx3D+e
	 LDyNJ7MXsqKW486P3AUxq1ncjsPmUY4C66PpWkpAH0/FLd6yX6JBWE4NeE8p2WKuUA4jf
	 ihLVXqVrbyFAkHZHvAfhCb59CeHDxViJ+TvYUwl2+jb8zLb3qXzcEX+R8pCF9NEZPUFo9
	 ltTG06JqzA2B1zzm/HPrS9aU3VUzMEGWMpARsscSv2p0rtIZMptFlvcgdKT8Y/sC9dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Rik6LH3x;
	arc=none smtp.remote-ip=209.127.231.37
Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F835606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F835606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Rik6LH3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484327;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kV+ysOu+6F/RM1Ge8MteVU55Vww6sMy8zKEuNEbejKQ=;
 b=Rik6LH3xw2WgVTAswQttkhsFkbz/SdBV67CnAGhby8Ij9B8U6RhFYUAcADYznyJbFY+7w6
 GtN6kpAE6+oYE6Yd1h8bg9y4Kbl+5KgZXkzzTo0A7elwt6fLBRZXN2cpJZEVvHEDiMn+aP
 lL4prTi2CBpu/ewa0srn3XXvMZFdQCGDKSDDYs2fYtIJwpBSodT+h45icMFUg2thmwYNle
 bJOMUht3MlXO6rO97J15PAx8byiEZbrlqCkHxvIrtz0U2JmnCyOeI/SV3xC3qI8Mq6vCHO
 7JEYdSW9+ceXoW8cusV2JncGJ6DXVm8IJWhll1REVlGF6j+kkua4RVQBN3Kd+Q==
X-Mailer: git-send-email 2.43.0
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 20 Oct 2026 16:18:31 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:18:43 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v2 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
Message-Id: <20261020081831.3673722-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ad723e5+dff7a6+vger.kernel.org+sandie.cao@deepcomputing.io>

Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de358..804abc85602a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -22,6 +22,161 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_aux_vcc5v: regulator-aux-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	p1@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_aux_vcc5v>;
+		vin2-supply = <&reg_aux_vcc5v>;
+		vin3-supply = <&reg_aux_vcc5v>;
+		vin4-supply = <&reg_aux_vcc5v>;
+		vin5-supply = <&reg_aux_vcc5v>;
+		vin6-supply = <&reg_aux_vcc5v>;
+		aldoin-supply = <&reg_aux_vcc5v>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.43.0
