Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2613D565E
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964538; cv=none; b=Y+UgPKB1V3xgkpn4FT1X9OcBhvTuQVYzjUtPvt+HRDtDnryIHL/9lRmf3QSuYwPXASsHTU+xISNAX7ayZQ6pXyCWAK4+hkL71laQgn1dW1SLtpAbRQyqsonA5PFCJ1x/jeeJNirE14mK+FHKEhfRUuiWPyAgAs5O0MAJkJx75wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964538; c=relaxed/simple;
	bh=jVz8PvnNum1fjLPKM+tCYU+oCnJh/gnm040lq69wdV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAI3C4nD86hPoY/qeqgukCHUQb/lriKCmTnB2vul/N6D++rSYLaf6bkKvo9LhytvOyQFQtoMi3JaiWJiYIKZQQYaqBqRwIjAAEpOR3KYxH/tlZ8xMnJM8UzLiXejxPmDgAvuSKIW0rtnjtxxiQv1dafPciorh6FUNYX4Rz/+XyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arIQrvNe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arIQrvNe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so57043605e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964535; x=1778569335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VLOa+aovvb/fUff3rMrQZnsi91wgejZkNFCjTClpec=;
        b=arIQrvNel1KZiD6QKjysY4Zg8ZU4BIUlSPGG9CZp0Vb6bndIqHlsnlO769G9vEJMen
         3PGSjUBJBs/M2JhGJoM+TNfpZ+MIG6LzGhZSOQ6kODG/bxwe/OdQ/cTGzGH5Q+9M6EVU
         k+/LhpKrvl5kEBMAQeOF1TMlSU7jwfP+Jdl17ngcBFMTcWxvGygbr8DOkz9d4LxeNhB6
         6t8ZPAt6n7YvV9tqFEBHpFI3XgYxLvYsgDBfXqKdm+fayvKHTYYTs3meKc9I/lW+FL1E
         mJ3ff5GNxdfvFfiWml/ZuAiZ7QcV+xZfwOGw/p+pyMswpdvGahmfXCwZSSHU7BiHtRBc
         vfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964535; x=1778569335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VLOa+aovvb/fUff3rMrQZnsi91wgejZkNFCjTClpec=;
        b=RBB+UC4+srKsze+DrmxPH22dThP9caY/16TKczZu3H7zoWcWZWRh8EKCeULyEQwK2l
         eiG+eO4yg9Q+4O7qRKXf/BC0Na45esXOxoHSxof4CWqIw5w3XSNspLkVRTsFMf3naO0Q
         zQ7cE5rYHjOieLDKuwqrvWVpP2WGnS7+Mlk95PnqLBnp1zgRQN2DoiN7slR/OLqr1mS1
         cur6lv2qqaQeI2HSZbPATMKMpkOQw5uBqjQKzwmO+nSQq6PPuQDtXkJwjxvNl+srCuhd
         Zjbl0qubwytb/A/Hej77W79lHFvsi+y9CtLeeaWZxqFfuJB5Vnk8/ohjNa73vgvhNGs/
         6mTA==
X-Forwarded-Encrypted: i=1; AFNElJ8/Y/1PhQrFeXfU7yTxngNMfBVTRGdwr+W/QEn4hA88qWvCFQF4l5ehQk0QukZsClwv5+JmM7ugxPsk@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXjOSW/a3yamCBb2uIHdOAio6D5eqo/0TVFVFRIPnirWapFML
	BPpHA0/St28lh8r+QjO+KDh011ftZjU6uVxVIp/hvwFvPTAea383psu4
X-Gm-Gg: AeBDietWm5Yy7+6oyinf9WV8Wg3aQkaMHR4DGMXY+GLFdwIBCxyKFi54EDo1OBQHZa7
	tcESxvK8VX/Mi/CrRSdhGTexFC2HVbqzeuz/4AGIXPmJCiiTsX2RiK7Mq+ySdLeGrKh1M4hgILW
	orverqkCJXa71sXo+7JfW21NDzW/PJVqYm2QPt5b+XFCegqZ4Bq0y4Fiyf8bz6rReAYYxiRBx8O
	jsQkhwOBtdSBBU2KvLzNQzFKlFIes8aN63Vt83cs6Zyp6Vn5wRMnKiQoMrqfXax0pIpeh9AOwcs
	wB8uxsE4FARPjdkZmFh4sPXQuw6rbHas3NhkYd06adAZ3vqgzXgnVQfcznsKvl8On26n13DVWJj
	th+FKWUKlI/ossFlTYQSk/rTrawHoHV27l1iPmO1Em7dmSWSYkTHHhRc4PxTBmX+bviEuX1w/Lr
	VFSWizzhGVnU+3RKZoe3jezz4UivVCKK6427qfDwk2zimEEjDLkVbhfiBjPoE=
X-Received: by 2002:a05:600c:1e8b:b0:48a:6315:da26 with SMTP id 5b1f17b1804b1-48a98676d48mr206683845e9.26.1777964534592;
        Tue, 05 May 2026 00:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
Date: Tue,  5 May 2026 08:01:57 +0100
Message-ID: <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
setting SW SYS.2 to OFF position.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 29 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 8384cec7f056..9752d9d6a59c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -11,6 +11,7 @@
 #define RZ_BOOT_MODE3		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		0
+#define SW_I3C_EN		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -33,10 +34,28 @@ / {
 		     "renesas,r9a08g046l48", "renesas,r9a08g046";
 
 	aliases {
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+#if !SW_I3C_EN
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &keys {
 #if RZ_BOOT_MODE3 || SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
@@ -52,6 +71,16 @@ &keys {
 };
 
 &pinctrl {
+	i2c2_pins: i2c2 {
+		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
+			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG3L_PORT_PINMUX(2, 0, 4)>, /* RIIC3_SCL */
+			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index bc1178c7484a..fb868ea99b7f 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.2, Macro SW_I3C_EN:
+ *      0 - SMARC_I2C_GP is enabled
+ *      1 - I3C is enabled
+ *
  * Switch position SYS.5, Macro SW_DPI_EN:
  *      0 - Select multiple SMARC signals active
  *      1 - Select LCD
-- 
2.43.0

