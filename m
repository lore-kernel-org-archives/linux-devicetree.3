Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F693D668F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656811; cv=none; b=UfnVBPErkHGuQyyM20V2TfnGqTasQh/5jvstMQVFfCG+os5kZTA2KRlHwLLeOKpyJG2yNQPA12f91ut3v2FBhyUyjZTrw2Bqy85udSipDKOiiI/GVSTRu/6USB2SWcLputgj1rQa/0uOrLk3+fi5RmYF/gDYS+PmWFWWlFHZv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656811; c=relaxed/simple;
	bh=uNSwcyUwEwn/AjpWiIsnTrOKx1GlTbDyhEAmHx5+bes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltVB8T7BqA6pvfIVTDO6+XgsjQX0uiq1+igjOfAogaAGC47RSIHOfA3pMhgj3anE4kNRCBKA9oZg+OPr46UWquGTU3oQiNZOQ+keq4PZsWy78vNbwCu59KFnQBqUGRex780u9QQOnP9e7Y8xQgyxaozViwFaB1TcRAu5ecQn0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q42chnj3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q42chnj3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so107475165e9.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656807; x=1779261607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=q42chnj3VfuoW/I0r7w8Z3GqjukGL3tORxNyLwu6UtW1Ndee7z7pngXnvEQ1FVxj90
         SWdYpWdaRVu7+4RCOLaf1LMrzyLEdsX952J7AeOJX1OczM5a5in7kAaDZbPMG6DzBhCM
         YpS/9J4H9h3FMEfGSBDIUMdEe9r7cGPTior+Fi+u8+52YeGiDmOU6KjgHWjHNWjCFL4T
         VPjxePksc+45TIakPlm3POVi2Pxd9Ozf6gTbuarNQbOYcWNMF0M+70nrm0RasQ4090ov
         liC6q2N82SXX/rOGTWc0tErvzwXja7f0L1vo/BkF4Ab7BxUk38QkCEyIPGoxZmRdZ3Uo
         B06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656807; x=1779261607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyIQ7iWPDNCyYdAg7Qk9EkFJ3vVi7O0lfN1qGYuYqLo=;
        b=oz+R7LJIZ2iAUwt8Tswpcrpff4XlTfSLYDnBpMrdFuWymvR3xgqgHNN3C5w5W1WWkV
         aKCL2fwc4XsEeh/x6aEoLKuc1JyGLGd3LsAvbgwTEffJJGzY3gONEu5eVeZr0OKK6sD0
         nyKui9ybFpSk398jdqVXpRQjnhTdjkIsFjC0oaSbCVKI+D4T9UAaq3HxERMh7tkP2Uly
         +OqkSZW5knP35oya6eAbWJLS0HiCE2SsOk7U4N4pAcyUSV/wU926cLPhjGZwr6Co5zJT
         LtauXO0sHVMWN6hfS+H3P1ER0qvM1ME/0GSim7UueW3tk6uMzojrFBkNg74yCvENtfZX
         aOlA==
X-Gm-Message-State: AOJu0YwQw7tM8t6jgLaR0GGhndrRHDNWbSxr1Vc9W1ekORqd2u3FbTLN
	bnQBKstg8S1BlJELO2L+6u8TXg7NK8ymqjGDONPwrszSUoo8xxZSxcoy
X-Gm-Gg: Acq92OED7JLB5p/cs+HlDvXZGq/m2r3EXezFWhNd4OSNItJ8IIE98x7HsQWJYT/3a2l
	GcGk3NUKS+0kg8DvtMWr+PDNNH6056aGmPm+t9pan64gtTUFLJIdr2qdhcv9tKWjYEwAatl0lGF
	bPA5GvOgc69JhqGg//LwJJ/jlOiNWlTBcsF8aFS0DbVImS1xJN7VPGayMhH9yD7XNXOGrq06+Ag
	VrBa/XQPbj/AXrGdupm2iG0WE/t/bfrDC+rJtrFYdRhMYp0GavZM6t6zM/tYKJbiTv8i9M5kJlP
	/r9YvjRGg1rctxK4g5JNQRZNTRAxAGqZA0LIP3V9vUrD7zRrUlvDbyzw3fq0Jy2uAbiQdve9jWr
	JboezMHQuaxR7lqSnIYJ2i6y2KovuRRut4ns932hTKXw5Ufwx4irT10jg8CdONS2cH4hKgMHatM
	heaBNI2X3ajdMh8hchhB6ttE87kqKbWCTp1PwX1lxZALr4EKyzMetDIiZm8RpDWjqn7A==
X-Received: by 2002:a05:600c:8b86:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48fcea207f4mr20153515e9.28.1778656806489;
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:06 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Wed, 13 May 2026 09:19:52 +0200
Message-ID: <20260513071958.29574-5-a.heider@gmail.com>
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

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b0f66f49db4b7..b24b378b1b220 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -53,6 +53,26 @@ reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
 		regulator-always-on;
 		vin-supply = <&buck4_3v3>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -65,6 +85,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -294,3 +318,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0

