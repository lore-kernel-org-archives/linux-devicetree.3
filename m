Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7083C8182
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913389; cv=none; b=OMAyJz9AQuctNdMyvwEPY/qNyhp9k8Sczd7W/tFKMrn7QuCiOmhOPkxMwaRaVR3DiUbzjEQjIKEBdDZEeb4nRKa76/h2/NZxI5Rchi6g4ciAIbQ+240+Hw8+SEewGQgNnwQj1C0T0Te9PSXF/CuhGdRXG00mFMpABekzCZoRRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913389; c=relaxed/simple;
	bh=YSnkVAoOrBbPmRqat+kAffrtxCW463tFUuzW9G14zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oM5FLs2Y6Zhfbk5nJ/MbBSQMbUNoppFk9Gg2aYh2VwxkzKKxek949kVMdxVtZPk9QuD1KQi61Sc2PdacwJc9JiR585YSYluvNonN5Ns7ekG2ApsmovrGx6ggQkS5qY0m77ZtGHdmxhiIpZfsulqwVyIu5QaWhV8u22K73SEWX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOLVi5wS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOLVi5wS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4602e2a0372so2865360f8f.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913386; x=1781518186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=cOLVi5wS8GkxBBzCzzgpoZ67aHWejI7Utxx2uqStBezfJvMML/yHN9cCfhJllay273
         BuwaiASy0A/dkFtBdl7+tqa81w9mkByFg92TcV7zRLoLodEe2G/ZgYA6Mx6z8MDru7gc
         bbeKK7CJUFxoDE2CcC2Io8ODRrbN7HDQCEKx7bAie28jUOk4IYG8rDoCAT5ZCvZbIUaq
         HFch9MgwGXBIXpoaeyhSmzMRjmdnY5CzZ3qacBEAgCCHGCrfem0f2vl/nQD5rLomyT9G
         NRxLaY9AJJ9pKSzF3vOM0L/h/Osgnp5pDQPMQtGuhPBmwJdQ5ECYjrMytKZybuKINOmn
         7zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913386; x=1781518186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=pL+3Rr076L7Rk+PF4Q4p0Vm6qhBguVjDCjhQ6OWn/gtavBzv/jOQyrJAghs/B8I+qg
         Hohzg0QJZirfUGSyQ6D8z+GM3L0AOQHZ8hnxVY65PszpmHImjrCT133HGEd2iiE62R66
         Wgk0R2oxK+vKwWVIzAVeXYTdVA7z5UcQV0FZeoydAY6Wh59qRTX1FShMM4WVz3XBDs46
         qJL0CpVk3Lz/apq4PY62262rpzlOmzd4lPEEGzg60xq6Q6kLzIE+xXoOAPwSwgBNxcrw
         JJ26kz2pnqh7lMqgC2Y8V/sbDhwJ0XgZxB8yPQpRUuEudRcpv8tPf9IcNT4OtcLyj586
         MO/w==
X-Forwarded-Encrypted: i=1; AFNElJ8fuJjyNMjCp0AofwDTgVNM5YM0oE/IWAgblVoIz5tC6n8wlNWC+cTe0E3C+lZj3hQFRwauuBEE8S/U@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZ10dE7rfMV32BOdqU8Zi+6qEgrQJeTZDHvlsirAd8RfxsIhi
	H0J6lLcOIZKef4IdiFaHdbazAQkvooquISG35gEXToaT8UhJMaIdNcsI
X-Gm-Gg: Acq92OGVjy5SvJ92pksF9d7p0WkPo+a+9VVZsfabqXWXI3jIps3qldwMNc6tyeAlvCo
	A4Zv+ZeSFdMAR7w5RDuHqCJTb2jKWVZO5XVHUDZrbw92V3cY7DXi2HOcobmKA5N3G5x07vJPf4D
	y5yMUA4vp7LoRrtAN+aZvlY0qLXncDCyZShQVDjtVEsST+1mmOCkV1i92i/JxwD3RrYwjTj3zgT
	tpjQRrm2zf0RuydaaMl5ltfs3eHMvyY1vJSm4tiwCJCjeoKvsl6wmnpu3IcB1tUpFY4dA5hRlXT
	Ut2OzP+/N6pHj2kuSl8U0q754tXA2YOqNGE+sLdsVIHWebRWpSKTDL2Zx35hMJAcJL/XzbA40KY
	RIRYMeIwWOFa4h7KYeaDdynqE84v9bVE9ZcKfZ36tyIOMHysRu/tPMqlLx1fe9bQlxPUgD/9o/9
	8sjpD9ux1HDRcfmR/5H0k4l9Hdyy3IuK5X3CJYLkNgAqaUR9xxgsgNdFD5kN+3iaUs5zL7xvJmT
	9wvs3z3xEgwyNMmSjXr37Vl4xzP6NrB5z41s7lZk46wkca9
X-Received: by 2002:a5d:58f8:0:b0:460:42c:1133 with SMTP id ffacd0b85a97d-46030510ae2mr17045022f8f.14.1780913385911;
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 12:09:26 +0200
Message-ID: <4159f23a5a3e52edb49964b7b3dbdc7ff4b83f50.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f27ba602c743..bac3de6e1530 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

