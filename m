Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369D3D5C1B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656809; cv=none; b=q+Mo0F6Vbr2AuVPf4rPq0ltTeMBf/2J6X1h7qOkRGA8g72L5VXmzp2OikfPOuCEk36ExVVg9CIiQo0lNXWcRkUbfI8ty2PDIELYlSSsseXLoZtX44pq/2dzMC6FtvcvYkGyq6JUmi1GCiJgOIJ0JTCDLiIBCe5ZdbUCuYxLH0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656809; c=relaxed/simple;
	bh=8lXGXxe7CmSHQS/TM+hU3YDjchOov6HnwAdnLL9Bv+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1r1z0o6vIUJZB0CtSidcNzNhNRImCk69slFF3TgThx7psPz3YO5Po44KkiZDk1fbf71+pepSPSMhQ7JbKDRwCi3MPAB5CK8xJ9pGu/mbWAQI6v0tg2RRRk3SVSG4INu1UkBDoWZP8OrPOzMzdCoV598tcGDVkQJutL05mSR7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUijNmGG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUijNmGG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a74032ff8so4750732f8f.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656805; x=1779261605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=cUijNmGGs2qU0T/7VPGjTfkPvaixfRlgNIbOl3tlQwbqxap2WzD8r9fHaw/WMcIu6S
         PXhwqd04FMU01C2cd3ugfu2oTs7SKHbXL61Eyq6CIU5iVikULBx02Ra3Z4g4++eU8WWJ
         +hoFqF7HBIbbQElixnqDiAUEy2STuN4X2iThzkXYMFalJNilRAUQJSVfWM+p4pmvt5BB
         cV24LIT3srG3Ky+YlrIKNZH3uhM0mVtZ1ARsq7RJvQmEGeJxxDmVDB43HrJmmkP86ALO
         JMv8/bMSDB+ye+pb+Jk37p4y6u5zt8/zQogToXxDIXZCQ7NQ6GsH0P25ZzOZkfJNXsmB
         KNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656805; x=1779261605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=qY1LObi5kbO/u3l+Pvh+bN5Ir1vPr7+RuBwaJR4SRETP/gjIus6uE2J37xggrBMqrb
         SRGxRHlGYih6985A8Ar+dzCpjC7sVyHVSRwAPT1m5em+UatIU8hjxMPiyJNVUst2SLZd
         Gec8qfmSJkSPUaI9J/LMg+IHl/zgyChijwzMvhjJH7YFHvI0+BucL2b2NURT8Qi/f6iS
         bdLoJdeig8eozkQvZ/Es9eg//omuD9q5gE6/Rg+tSES37n9Q6z0+yRtIs1mrk0XJIF00
         YmW8sSpWWqsiurUigko1W3ZCTFT3fbbpGFr+VaFm4I418XaEkx38i/MPYEPMNCBr9klz
         zOVA==
X-Gm-Message-State: AOJu0YyLyP2J8JDt8cGJmXcgaz5dkabltPIOPNEbjUrmmD0iXtw4Fz0Z
	Io9plymDLTS8mNbkUbePu98EONbD1hBxAa6NEqpEclIy8lA+f8XxaY7G
X-Gm-Gg: Acq92OHPcx3KEUguRun6rRg6WgmvIC39irPgT+D4UxwF8zdzjQqtsiVwMqN1uUR13Ks
	eRlWbNLyEKm/e2GYL0Pu10FgeFSqmDg+dhoWTWl2ir4YbkLNY4Gs4JrkQwLWDBm7bzsJX8TL2R/
	11EisIXNwmE1uJo97OqjI6PI5BbHs1K7u7p/xrE2n9bvrT4nxrBJRlHp8EgjpaMfcriAsAHCCSY
	VzSLVF9Wqol1JtM0oOIIsemeKvIwzO97I+mfKSZywtDCpvOR+4WfKKYpnKXj7X3cS6tpom+C3DN
	jkNMSylKE/igpbj6yHRiym3PyX9PPYSY6ZcIg80hcX9gVEf5QkaXpzhAR4gNHCfJaI8B3fr4wlV
	av/BbK2xSIbcE/6cUY6i5sj36Pzp3AbIX6Xjv51Fyd8cotF4TPjZ076l9I8VaPNj+NJ26ZqRtRh
	ti65XSC5bZD+1kYIAK1cDIqXwgiuPz1PwGg+OQsGCXLaK6igBVNRPr7nj8Lh9LehkZPQ==
X-Received: by 2002:a05:600c:4583:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48fce9b30eemr18812985e9.5.1778656805095;
        Wed, 13 May 2026 00:20:05 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:04 -0700 (PDT)
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
Subject: [PATCH v3 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Wed, 13 May 2026 09:19:51 +0200
Message-ID: <20260513071958.29574-4-a.heider@gmail.com>
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

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 41d7d6d20a797..b0f66f49db4b7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -44,6 +44,15 @@ reg_vcc_4v0: regulator-vcc-4v0 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
+		compatible = "regulator-fixed";
+		regulator-name = "QSPI_VCC1833";
+		regulator-min-microvolt = <1833000>;
+		regulator-max-microvolt = <1833000>;
+		regulator-always-on;
+		vin-supply = <&buck4_3v3>;
+	};
 };
 
 &emmc {
@@ -239,6 +248,47 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_qspi_vcc1v833>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a0000 {
+				reg = <0xa0000 0x760000>;
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

