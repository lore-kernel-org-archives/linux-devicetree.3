Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2A51B185
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087652; cv=none; b=HxSym14RphWWnRxUUVpCZmNHaxaHACAOwnDryvu5TKXiVbPNnVWS/Jz31W9fO8MzesTBXMr35BH0sWjpT3i4gXMuF5FyYgYeuJCmSQAUXYLtq8qiR0IIZmdvwPJYxm5DofJ7IqId25bS4GY5pbcJ9NEmIgNcTrekMOl65TXXfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087652; c=relaxed/simple;
	bh=V8m5/G0gsUE3E0r8Gud6pXvk5HrB0GOT32fRWrpmLec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKB/JtlqYhA9i9wHkAXtgXvZgl00NpyBBmT/4qi3mOsghnVoWF4agyAFWY6M8LIvTXKkcvegVUWpsUds3tbqsx6N3NwU/KsrqaOAJnifKrp99xxGgspXHiUyB3+jqbj+dUL2A93d6gW8mfVdy/5b9XjjV4QKKlHjU21DvhDceGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib88Ugkd; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib88Ugkd"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so539090466b.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087648; x=1790692448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=ib88Ugkdr2ZbGk6Fsb/wcyb/2yBSXG/lXkI/2JdCSt+7XXpewqltoogK7kF1+tkUso
         svK8fqO6VKiPQ9Z7ivRPz+FracUn9QgZqRv/Fh9DUd5rRTdaiVLmrbVp7nGnTxLP6ahe
         uP1LMq1ub6VIWKjOU+BazwT7lygHbn3ohPYt+YoZR4cf6ivNJTUp4Hl+RY1Yr/11irPi
         5RPt7ujxLNPTg7pHvyc4hDc8MrdVaavqXlGNjZqnajQrJQvpDPTrxWdu2paPuHAoC/7t
         39eAsvYqHMyKo8sgImikGsjWyjlcO3iSdNJUv1g/4mDvI6quwfOAWCtS08kkrVIzV0BM
         ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087648; x=1790692448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4lRt2va1gWTtMW/M8nVRxRv+uN2TcEpeTG/w57BdiI=;
        b=FukerGx1v4e/Y4x/2ODGWp08FsCdco4lTJZkg7pEE4/AlmGI22qK2VHH6p98Tm+6HY
         LEm5YiuutkCtCgQ/fP1yqure9Sz57zIcZWQ6dhw9adoumQjiN2x1k92jhcjzFwcwY9+v
         puYA9D+tjTNviBU45RGYa+5bvNz1h0sDvZJoXKBIb3xhoRYUE1ZGyvxgbimQdJMutdwl
         x76M9PMflsdtRldWcQc+kn3D8N1MIGL+85ArtJL2RhrvCI8xW/Wej4IFdJIIHRWBrUKU
         6jD7i9yJq13vg+HcT+QbFjBRyjmnGqy7Gf0ldetG+IIkAKDMM9IZFsxlk5SGxKbRjW3i
         Gp9A==
X-Forwarded-Encrypted: i=1; AKwUvByFKJcp47LJwo2yHFV+O4WsDT+R3TYnNFYWEDnPqpC0KwsuRD2+o06y+hRokQg7ElD0aW6CqLepCtJF@vger.kernel.org
X-Gm-Message-State: AFuF++lQ5eMChJAZx6aXvTNMp9Q1D4R7fI4CpmGaZUhISgrwsatGto3A
	rdhqbXcSSoFYG8D/8PoMvLn8dLWoN7Nkf2sVxOVvrghs4UKxOTWyOfi5
X-Gm-Gg: AYBFou00Y1f8moQXK8x9vmLTTMtA6FFjgu1FMf9s6c6puWZTNl25Ta0aHH6sYUsFkCk
	qmy27feEnIBiXFewT9Yo8X4MZmbUrfqEpcXsS7QwVyDE+F6MtjmMKNTiBLbEnEyg4jmD06nt1gs
	M550Ny+9EtAXbcQ9QnUG5RShvlaaWNhCsY1RhTQzUffhQs6XrYIQxlxC9io72KfYrA3eAF5S9vf
	3SemdgxmyKnM2kkJwQBSDiUkNPURHLP+TjBvDOgDSa5t2uiRtQmhVMzusFSspWSsEvaGDwOERsl
	clImSaqorbiULAmccNx6J5Rl4pmwkbgIN8CEhCd5fq7A7RbWUCS0X8vkdNLdIr3tNgKaAWdzGqB
	DpLtVuJ7t8B2rK8jV63ODSmf2PRqJRvGbu3S2OpVM8DNKaHQZgGKQPaOhL4IGs/QUSLMhWHw+lw
	vgJGxYyRRpvcsekMswDOWbVE3UUrfanm3sOhXQUlw/eiS+xL1AcOgDeKuK6G9b2bmMVD4Mfe/wQ
	pdPmcyvwz5MQ7dgt+vDYmuouV1+ZVr1SyL9gHO8XCL832+zxIeXcC837Do8ZqWx/sHXPGceZg==
X-Received: by 2002:a17:906:ef02:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c2a15877713mr1237309166b.43.1790087648344;
        Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:49 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-4-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

SMARC SER0 can be assigned to Cortex-M7 firmware. Add an overlay that
reserves LPUART2 so Linux does not claim the port. On the Development
Board this removes the Linux RS485 port on SER0, while the console on
SER1 (LPUART1) remains available. Firmware must configure the UART and
its pads for the intended MCU application.

The overlay is also combined with the Toradex SMARC iMX95 Development
Board device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b17fd5b067de..489da1fb0012 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -957,7 +957,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-ser0-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
@@ -980,6 +982,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
 
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx95-toradex-smarc-ser0-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
new file mode 100644
index 000000000000..cbc58f1af41d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex SMARC iMX95 SER0 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* SMARC SER0 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

