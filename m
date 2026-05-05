Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E4848AE04
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997190; cv=none; b=lU5CZjJl9pzAIp25Fkx9aCgn9ggarIgkkMu3/JQ2cKU2u8CXtA1auCz+LU8UtmxpL5vkCL7iBw5voKHz+NTLMGkPFj9B7OC8PC7sgPoYBCjpaqgIba9zPBuvcUqX7cK753frnzqvtc5J/+04Gi/Ob4zAMHWqq0jz1UXKxVnRYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997190; c=relaxed/simple;
	bh=soRJfSSxYuG5pC4OrEODuicTfvuph+agtktaOpjMSeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riRtUWyivSfSMHhVYZWTdzKQC+OwI41fYdVXELPgOqIAXlYXKe9UxF9kNA9ecBUe3T5GafONOFiniPx3tBM4JBdCejPmX/j6QFUop3gMSe3ectST+5IWmE4Kq5RmqrJA/OA4PfgdPzWdjGpzAI/v5Hn5k0CLKTc+CKGY2M/XZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVKxZWpd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVKxZWpd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2518317f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997187; x=1778601987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=RVKxZWpdMJtiYDUHUHOjKWVxqfA24uaEOCcpCkHacHvL2gHrf9Bn4cviXjOr5Izjtj
         xYECbkhz05TZrD1J3t5lqT9hh8JCXPcdBDxZrO3cFhn2FL2Z6vVt3RyqTDJ0K+Y7jktX
         H+UUcZMeWS+qjTQJBxVFy0BfkWLEyrNvmII7ncF6GNegTo0F0K1xFrJucpF0c+lLbfuI
         bcmx9EUTo6xt5aoLkU4fzf64HVe585Iwyo7S4eznqOrN3U4OdIq3z7g6aN4DwEF/1FID
         4FXCKbdev/asx/ThXFsaHv5/XrBUnK3PAGfg5X0895E17YEvsL7faxUUEaTtg09tQUnc
         /nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997187; x=1778601987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=C6BBvvWMCsCADwPMxnSgYKnhbLPIvG1AlpK79XVBV5pKhVjhs/CzJtua2Tp1jRge8t
         6oStL+2zxfd4kruu/8nssQ9W8RrM3XpqXTBlyJ9y7n/DfJ6mYnHq0y63fPHd9DCkYINq
         3IkzvlNjKXHMGvAguk03E3B7Pfabc57qaR2j8mro5iQAzOni4vYukccbjU22/1VlgZyf
         tH/JbisUX2UjOPss7twuG9MasZKEhLzY5c+v7UPkvMe/posTYx8PTQ4/JjP4sLlMNCHa
         PZiOp4euMjW15Hv4D2+FUnDxIa+tUXs6ecuzJ2sa1FLQzaC0icaJv6WL1DvuRc1T+q3k
         MpEQ==
X-Gm-Message-State: AOJu0Yw+xK9C+b+SNseMsnrBYB62V7gKCOhzvB0vXoGLipSDAPgvNuix
	OQUvByp0K5/rV2Obt3XULOG1JTH7BkTcFPKKhCSeWzOWUSQ5d51YBEdw
X-Gm-Gg: AeBDievn/KRKxIhzn0iJCxUn0UzLDjIFpIKIIuOXSx2hqHePspFuND35y8P0r2saMXb
	ynWKLWB1n4QBm4dnAV/blpyRoArbMvYlHHTyI5jWv3/eiwiDL9TA4F3qlnBfRbMhKNO9gn1kgf4
	XZETp5uI773vnfvolrL7QtTp2cZIocdJwhJuMGemy5i9tmISfthhB/Jpk8PuLqDZpPgFTYrc7c8
	lheHTHXPidQEOST3x6SEAny1456QgfZPn3WVZWumyyS6spEf9SmMFjvJxJACKCNgNcflslfF5Xm
	EnCKyPKukydlLEWkF+VhlW9K8mLHk6QWAMfeHNIzCg5qIWIQpNlaEUfNjqELtxrfTvPVOagzqMH
	xxFD8aH1LAhA3OTvnvWkCordbgoMC/tUWO+V395Y1IO6/CACqNTgzll/zGYZ1ZuPywFMGBu4EjK
	Z+2uqqBRpAOPq1ATDR+KGWNCSU1yZMrfF+UUDF3DY10H3wKb/zeX54vS1U0A3Q420FfwMsdiow3
	xJiB9Iho0/lAACNag==
X-Received: by 2002:a05:6000:40c7:b0:43b:5672:efe with SMTP id ffacd0b85a97d-44bb36d17efmr23828993f8f.9.1777997186712;
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
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
Subject: [PATCH 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Tue,  5 May 2026 18:06:15 +0200
Message-ID: <20260505160623.1369347-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..07eef3274192c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USBVBUS";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
 };
 
 &emmc {
@@ -72,6 +92,130 @@ &pdma {
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
+		vin1-supply = <&reg_vcc_5v0_sys>;
+		vin2-supply = <&reg_vcc_5v0_sys>;
+		vin3-supply = <&reg_vcc_5v0_sys>;
+		vin4-supply = <&reg_vcc_5v0_sys>;
+		vin5-supply = <&reg_vcc_5v0_sys>;
+		vin6-supply = <&reg_vcc_5v0_sys>;
+		aldoin-supply = <&reg_vcc_5v0_sys>;
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
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
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

