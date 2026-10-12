Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D4044839F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789950; cv=none; b=BLAeotWlDxKUB1oCpwnPBnHlyQznXnxlPdglYizpNFOQdvQGj8w0kcG+vj0SX39MJC9zg0DrPGTrCf7JqZ8uromkrxD3RUwuM4QNELiqm9WzMshFX2hccPtOWlH7S5wOYbFEnjQyRlGjywmsPEsk4yq3WKYav7XmbOLxW8b3Nn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789950; c=relaxed/simple;
	bh=mvjdRzEphXMCTb3g7xXVWiYmQKB3zaxOriOJUT54Q2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1eAwybNNmG2LVVgJ+6pwD3ME9Q2ifxCjCMWmWXZFjWUTp5wFE0K80Fp9QHXXdKN+mFOypHrfilWI9OVpwyTdCOe/WPPhH51x2P2vbPNO68dfP3YwMytWfY3Z8TdkDa/R0hn/2OgsktXnOgjshB2eVDnGjtqib8JN11AWATPhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0fkxtvZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0fkxtvZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b03f23305so1276076f8f.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789946; x=1792394746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=L0fkxtvZ4dXv+qaDPrwJnHKlK14oO80JTgrgwmMgwpqe4YC2Gq8tStSkLtRJmnba/I
         hj/8BjYefeaI8wPqGbq079LT/76lsiQ4yB/pHfM6OfUjvISadjH3FPV91AX7k0Q9ouCK
         I9Ba2mq5A79qdK3TTJFFNSuzxDImawGf3fIuiVU1GBU9byPQYR2RV+6yBNUfSc8My+1N
         iMAI6vXmELA2OgU+sV8nMMZ4Y1MGGk2CM/zURXFKXhvQ3O0mfuKyyrzWhT5l8+sGg/YF
         CDZzW5m6yIW3tHvVtj1kH8Jdx+tepFUMfnRV5AQ4ulKIMUW4qHHP0nyOcSDrqSFQEWb6
         9eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=JWdN6nt1KIkwXpzgc70ZrOKvk8DyhJhSZH9aUWV3iTgWCib38gj033US/o2rNMeTDe
         seeCjLjfYZ3ijWnjXCw2XK32lySFPx8yXC3i9vM6ep+GogL29jbCsT8QjfJan5sQTRvo
         REuog5P0fCw6bouSesPRoYfEbg3h8TADLfL88oP+Y8Mpv1Vdnji43ugoiZ/lkt+LsWnX
         wfbXTb2b6miFNa8pz/OyDgRg4A9GL0PMGMI/4ZlBLnBdilGGBxlP+/UDRfKCQr/FlW7j
         dxt+SqLikD+ZnDYa6bCgTbFrpJgnG4CAf/emPvs7Ga9mpLV9a0mJa7yLmBVU6Ht7Bbcb
         GuUA==
X-Forwarded-Encrypted: i=1; AKwUvBzmL4kln8JSF8ZhSozV8atXD+upxHSN3kg8tHBt2/cJKYk/g+7ITwtNc8jhuTXlUlBbvuCS+FS3Qbqs@vger.kernel.org
X-Gm-Message-State: AFq9FYK1RFzpjvFAIdYeA0SCd8s04VitC01Re5X0ruOVlv4EU9g5Q6qB
	3C3PegDblBttW/+849JnBr/xJmeEggpoclAFZo1Lf093PPuOtlBEP3dxtCcw27Xkfd4=
X-Gm-Gg: AYBFou0ISPzZWuCFNHnJ+BllDpWCDI8iR34s0hdMFJKipFjhoEBV6CG8GPNqpStnxeL
	lRxpqIRKUCrxnWcIrs/iTEi2z9c37AZOkuT6sY15k76+bhGW2/0UrLG1ott8Ip9AFNFhcaoUDC7
	7LOIDmZN2sOoelywdwghekpdoqyTjgCuBCQX58WT2bcR6OjZASIMGZjzG5bcaefOTDkxJnTAZLo
	goA3G0s5aGxCw8BcKe7fDoIuZpPIU4Vnu5mDe/dmP5ghEB3oJYSleWwrpRdnVrrCePOF2lrsU2S
	cx6MYHfzpPGOkeAsAtTeKiUrte3IQz3SnlLcE+P19HbHNgSnVg3Vptzhp6SWPA4tX69eDTL9pjz
	9EnGfOXCs7qKB29HWTY3vlYZoLymbYVWYzrE6QPqdYiYciZ+a5y7sn9sDXN4gXA1/lLr9UaDKev
	6JeZzj439xGYWIp3IoRNjlf54MyIvO8eC+1IZ7fG8Sb7NS37ZTOHI5Zr6ZJo2SP/GEXBHijUiz7
	CTBj7e0MGB5aqyG9FHrn9m7sWBkQy3ktqp+wz68BK02FP+b2EJ49Wgu5iLAztSW
X-Received: by 2002:a5d:5f51:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48dbaaec8f8mr15252003f8f.29.1791789946187;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:25 -0300
Subject: [PATCH 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-3-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=3858;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=J15XFPQXwHwXqajYWDHAsZeClrpxiXPgtU/y11V0Fb8=;
 b=YNznv4USjYwddWq+/qaJHmbbnVovBRRKYP/qeKShQ1yQNEDDt04txudw7FbYWa1YbUcBfvhlF
 4c32Lwb0NINAXgbhaKdb/hcrLlgT4dfPwEKirLnrKQUQndhNJbVX9qv
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..b5ad9172e1f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-eval-vga-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-vga-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -184,11 +200,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-vga.dtb \
+	imx6q-apalis-eval-vga.dtb \
+	imx6q-apalis-eval-vga.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-vga.dtb \
+	imx6q-apalis-v1.2-eval-vga.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
new file mode 100644
index 000000000000..a449ef9fbfaf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to a parallel RGB LCD interface through a
+ * non-programmable video DAC with a VGA connector.
+ *
+ * The VGA output is available on the Apalis Evaluation Board without VESA DDC
+ * I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	disp1 {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu2_vdac>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb565";
+
+		port@0 {
+			reg = <0>;
+
+			vga_display_in: endpoint {
+				remote-endpoint = <&ipu2_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			vga_display_out: endpoint {
+				remote-endpoint = <&vga_enc_in>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "toradex,apalis-imx6-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&vga_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&ipu2_di0_disp0 {
+	remote-endpoint = <&vga_display_in>;
+};

-- 
2.43.0

