Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254C3D5657
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656806; cv=none; b=SaXUUEoDMvm4ggxoMXt+x8+4kn0prF927tenoOZ9l5zpMycUsy8hys0SqMQEOnifRkYdTFRZR9oTvHM/Dy2moc8wyyFsoExYNDsiEakN5nSTbLzkIuTLWU5W3eAi/ayiMIsnenQXiK97Jsxi4VMv5Owg4SAkjBV174G4WEwcGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656806; c=relaxed/simple;
	bh=Q9eLNePG/oRn7LdgnhZ+dJz78oMaxeM1LnMenEMoNFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv7kvCUWyzfqlZOnZpPMwmINF5Hohn+E6C4yFdCNNk0RrUB5pF86kSsIU5qhlPdW2PNKXH8jxiy3+umzhKJ3JEpdiOkIm7ChkdJrIENYsBjppBWjjkx8F2HjKQAFn4FYcZ4QSWXkeZ+YFwoVQxE93lfV3DwL+EuvDFgxHCq0XEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHs2z0U7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHs2z0U7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso73212545e9.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656803; x=1779261603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=oHs2z0U7/WLVg4XtEYLI/Zci0f3obk1IFqDI8y+zpM485Bwvm5dnCVzk4M5P4mskCb
         enMru54iWpmMt9g7eW4RE2lbX40gmmIg311tl6OKXrl8qx675IRYknwSIJNos+IUrd6c
         E2kgolUZofJRc4iOpQfnMn8Y4Y67kwqhKB316zAPrJ5pzfNR606sUeWfviSx32XDM7rA
         7d+yrB8MANJjUjbxWOk9Mzyi7trznUmEXMsJcZhQS9mt97tDJ9H8c5Z3iu8cxyO2HmdL
         /kWITG+f9UXScTWSJQuPhIcn1UNhHVOUiCtWcxYUsi5o97rXIRmUdzBUa/yqE591+DPU
         DyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656803; x=1779261603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=LdAXDsaszwjmaGbbKcXXqDfGDEPQ7kzZQHfz/R45vr+xJG8BHagaq6Eki7xSPqjFOH
         4ePytIH64B8GS3ULpJy16yh58QT1xHfjZSj7qY6bBU+Gaoffye7I14YudEi8ZITM8YpU
         7/FKNfAKuOjz4DdnPtdW7m/YEKEWsVk6Phv3NzGGGUll3hxbW5sz31qX3zz3qNV1FeD2
         malEByz4MXFtU8r+sbUyyLrLeHHVVDj2pphsxUT/PzqmgaVbwcCfDfdmU5tNxi9aD9M9
         6Op7FoANiZe9R/k64V1V8EJkWxGP8+I6R47TodeYRzQZo6wtYnonT6VUfsbq1fno3OBm
         zpcw==
X-Gm-Message-State: AOJu0YwCrMEPShhBZcU5LwFTKwotioKjBRKZQk1LjwSwJPx1aX48IVPp
	caqqYFt1nU1gt02sejHuh62624x6fQNgLupY4lRFQeeILz5g4wTaoE6t
X-Gm-Gg: Acq92OFNy+hqh3d8JXoVFQVra0TJYA1gbSu1/SR+qKE79R/MnqJLJSa2UReJYl51QfA
	yc5/wF2kUiNinwtWdW/4jPkYXQDE/pIjwjg6Suo4HZG3nct4TMnR3OOHkuq9r40VQXXuybqCQ5V
	D1M9+MQo7X+N3/MiiCuldiFEe1V6JksI4TB4R5R0zZAHZXkf5IhMbWoGqumrWweGIBaug6e/SnW
	3A2BUgHMOjdzfZlsLOz8QSNILmZRjRVj8ZesR1YrEEzX7VHtrVf0uyRkmOHLs0OUpUndA4YxA1E
	U4KKd5ljJ+9lU/NPv8/XWUSeDHxcE566fidSk7rV/udToIGD+yDaLLjoqIqUWy3yLoQqCHCqD3n
	0RAnJh5ZFRXRXAWzgBBGI0BsrK0pkHswjGJoep5CHkql2ZcURH88kClB6lZ7pN2xy0a9HRom3Gl
	aCKCwfKQjJBul07ko9Jv7nG7Ohlyg/jh9vhXWpQ4FoXkCbGYQHp+mhCXRl0ZM2EKFRHg==
X-Received: by 2002:a05:600c:c0c7:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48fce9aab22mr14680495e9.9.1778656802391;
        Wed, 13 May 2026 00:20:02 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:01 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Wed, 13 May 2026 09:19:49 +0200
Message-ID: <20260513071958.29574-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
for the board's power infrastructure and voltage regulation support.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..e0b585c50014b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,15 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_vcc_4v0: regulator-vcc-4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC4V0";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &emmc {
@@ -72,6 +82,130 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_4v0>;
+		vin2-supply = <&reg_vcc_4v0>;
+		vin3-supply = <&reg_vcc_4v0>;
+		vin4-supply = <&reg_vcc_4v0>;
+		vin5-supply = <&reg_vcc_4v0>;
+		vin6-supply = <&reg_vcc_4v0>;
+		aldoin-supply = <&reg_vcc_4v0>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3_1v8: buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4_3v3: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

