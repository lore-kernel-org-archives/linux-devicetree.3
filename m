Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABA392C46
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065198; cv=none; b=YhgoGq2e6FsysV++uZL3BXGAobVk1WmltCDR1j/uGDM4cQL/01hmXOTIWRd1YZ/1CUJh1VcnqYwQ4DSYWduBbumsYCKGRlPcmH12+Qzz7fp0MUbbMoWqDBxdr7YkuzPMfxEwz0CvyfDH4nObToC6dB6dst/qZqY5iBn43HPBrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065198; c=relaxed/simple;
	bh=jzMsWwDIkxOKSax6gl1IICe0yAnfuQo2yxPv0AT8qsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atpCdwzU/OO8Y85y+eeGiF//i/MACdwjAGKZRd9324gSD/6tcse4jU7YHjoBUnrfxEMk2RNm8ZTJKowP56uaQI8AmYZ8ygPXQZEGy3sKGKjUjhOnw64M0m91xjWnvBoSC4oYCw79zSdRcMGsDMQmdOJR+Iu83D4P8v07aNLkq7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py5swLtd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py5swLtd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so731856f8f.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065194; x=1776669994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=Py5swLtddjk0NJwBd2afBCDerDrJtH3ZdcDMdNahLTVUFzVFebjaGAOTGSkXFfUKrI
         G/kVPfkUkhuGilXIk8lIsscLKsi/lzpPJrQt4CG9jTd5AyuouiRSuzhsrOm1IpqlHjEa
         v8gZqdpvGFfJDQ+kGtKYZ28EHEKmJJPBOP7lTcc64eSsn0SOmpTXNWIKTWjMmFznpJtR
         /tbao0WhqNzKQznQazRARxeZ3AlgBAJy4rqCoHTiHeyl0bMdZuZXxzdZT3pi7tvS6iqK
         3fVtHFur2lfRbB88wifASm/denQGFKo6Iipa14ANRZTph9Plxl8Jfjw4qgK/ETkZTq2g
         aMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065194; x=1776669994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=SpO5FordlD5m7z6usSdluEO/jbux9m+Mb8bSWaHPePEAwJn2zSnfq9AFOcHHxSdVND
         kZ3aiXHdQoMekfrNHnp44hvVAue+PS74MVUhQ4S2YJ2lFrdt9lntQjgKKxxVo6ycpLfQ
         P7gMQ+CfSostL31gQwuHnxT1Lw2Swm6VZZuTo3viVLhQzoM+0AuInfm713yz8SLdUJHr
         G2Le4xaGbNwb8WvsDRti7nF0sPuQN7b474OdSN5Qd02Fm4ICNyTvWTzxTM0aaa1N1FV3
         dOpDrx4PK8/3FIR7VWTQKabWHOOj2i5C+2RJrhhdf9KJD3bJiL19xIiIM1E0GY6z/Z34
         ZtEg==
X-Forwarded-Encrypted: i=1; AFNElJ+R6uVemfsqVAzhzt34NrPCV6egLoW6gMrgm0apF7SjYh2Zw8QTpiF2rZHioJO5KIqcC0kAz0aWyvVF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxds6SJWrYbHm8tOYgY4iO5KvzAuQVVcVezDOyLIfEFSzFmJ9rd
	VoIi1WDkBb/8eEsymxoFmUk8rOwhK4SBudeaB6PzZNxIfD2CVZaf1GD6
X-Gm-Gg: AeBDieuAaUcLm2AIUbPtbu/cru28xYWZyJqqp2FDgFbRU55FYW1w1VKRKc0x+zPRc55
	87s3eS6n/ct4ky/ZK6TfR84Aa+IvHXQBB3iBoDI4ioYJoO9cVfJF/zJ7AkUuhhgriXqR2D1ZaiA
	FrFclMNhQMGLeKbkD+sNqDUM01MHeD3iKLKLHjkJGaA2dFNJeNyFuivPMVnLP1UEszL5iE2+BrL
	S4RKu/C3oK4uNF9dy4hdxtPp7XnXMzw9PlyHDdwIDcjEs/1RdPmnyB1b3ro5b7e4pphhNJ9nz/d
	Zv6ythbHurdXvB+trKLa79AcfGkxr+CL7zqQ1e9c82UevBroxNyU3dLNvGnUpDlS3LSMidmjvmm
	OlOMtEBmYYrKLDAoDb/jjkY9OVans6yOC0US2xf0yJPW9OJSNYLXCUEkTg+kjB0D8VYivSQDmxK
	7G0b2YmueT0Jl0ebYPlNvzDvAUa9Sbfa+zzi+V+z20xHgVim9azyaa5kOg7i1MvEGe
X-Received: by 2002:a05:6000:1788:b0:439:ccd7:cdb6 with SMTP id ffacd0b85a97d-43d642a4dd9mr19113605f8f.14.1776065194020;
        Mon, 13 Apr 2026 00:26:34 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec27fsm29788453f8f.11.2026.04.13.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
Date: Mon, 13 Apr 2026 09:24:48 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-6-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..9c417a483f6b 100644
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

