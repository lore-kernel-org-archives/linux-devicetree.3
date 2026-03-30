Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB23B19DE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859916; cv=none; b=ap/sEHruQ+HTBRVrE44Qv82kcOsYgUGAToCN6Zux5RGzGqDPxT8/aVJUkxJdeasByEungdX4HEAe9Jg01B3IlZOoIKM62CA3HW+9XdamQa4WGAdDnnK+EUGfu7ULTAi9pyKX3+Z1R+aZkB2rUbHOOWPBWlnDoO394llFu7DzNcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859916; c=relaxed/simple;
	bh=mH1spPeTCHz8roINYMnma7FI82vi0r8vKKTb06yrJYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKZVOtkIBEsZsU9i/LUlMYHiJZARplH8cpgNLE6FSOdfS6E9xK/Ru2/RG/fIdlfDzXE8FECiWLUQdMRhJA3UlFG+72U4WsbMb0ynd/prEY6QQDP/ksE8+LEnMyusH5yZymxrBLnUazBdnR/SCgnxLlOys4o9RgrRzSPNb2k5EM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWp9y1gB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWp9y1gB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd27754bso41458735e9.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859914; x=1775464714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=BWp9y1gBR0vUXczfdwqM6oZYjFfqwFLDtgoPuWsm4cRtJShRNK5baZXU2azoGshp1O
         4cQTJ+K/6VujOLCY99aKST9OcvutQqDn+qac+aKpFoMJO6kMFYwuiz+xVfkCpRptFC1D
         DWg72jgwEvwvaN7Hnih8366y4UpXLMkmSGOxhEMObN0ISv2I89g+sb+mMHASKvYuWDWe
         b0X4s+2MMIfcaSSHz5hqXfvrC1bw4AUv0BfuYN3gpzIy/3MOxuBip+8CJ1Nj3O8N65JJ
         +B71FtZ5TWnMa8aaAZIAJzRJE99mTmZGBdDP2XNnlpWfQLCeEhrsBNV66bk1Bzdw/fEX
         incQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859914; x=1775464714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=pBh6ZaeViW/cFaKuNmNX59mJ9/pVsqfXAcKpAdB7NtUEqp4NdsaH/MJLIJ27ioPyH9
         b7UeQaaDEvpDpKYYvF0W9DEtx0/El+5fSNzRZPkKDXuuDILZ6L5q9v12dsaoBjb7ct0h
         IOJOgmg3d7m95Sh00hG8tIArVgf6qTUjtPPBc7GZhG7oT/uIff02l7/BA8gPgpQeifaM
         BluEWD/+jVDkJMYNwkZuTBykTZyBIkls9s4ZYkjHXTlCOCnrW8J1i+yfloo+XcRA06+5
         XJzvmrpSfXTuTA3UIZ5D8/VZ/GMr6pu7nB2B7mrVJIg9SDq8cc3voRFusJiKsDiqRJql
         p5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv8Dvo/h8Bm/BrDmbs92KsU2Bns2nA5j2QRZNyPwdAJjO3wdZ3qSNi6zsvR7Y0ltWXLfuAlA4IvXhB@vger.kernel.org
X-Gm-Message-State: AOJu0YwprOqYQxiVETqIEKJF8B3ozTF5gyg6X3/T6fwGAOl9xxAN4AIG
	5ibNdsaUbLYr1PgH6OVjIKAKWenfEgY3YPuXLYZ5I1qbGUzvdhTnGiR3
X-Gm-Gg: ATEYQzyPWA2C/y1MOGcbKiufU6RJMIPia6Df5/dbAQe7CT8CRBsGPEf4r/mDW087Wwv
	wmJYuePIFATxDZ4ByhWskSgex67eI6q16tmfF/Po6MQGRm4zx/ovFJ/mrhm0rBf00EvBJqLZbG/
	AhIpakkpHx8ByirTEhJx2eGfrT7JebG/KR1CVJyUWzbZBALxHmdIdoB0SnFtpNWq1ektMRZTJLB
	kxV7Nkm9KQB/0qw1y6C8xwShge0guyYzHRrYbWmr6SxfrskH1/FdaB+Nk0d3Pes2/235ZVvblc+
	9r8E4OLRqGxVzb2YqZe4cJq7vAwt1A+3ZFYKlqk2xd+k+04WMPTxT3rNFwU4ei/KwLC44CjNIup
	Bd21oGmsdojduw1kxushQBNemUUhXlIUzBIe1y1XTfTEy37WPDvBwIc3No++ZCIzCCJqKmGryZL
	67is3q0vro/agS8H8pJIE/DKtqP5w9Yd+s4w6caOp7KyMQfnlvzzE2Zn+/6cAm4LPC
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr146972035e9.18.1774859913716;
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:07 +0200
Subject: [PATCH v5 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-6-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0

