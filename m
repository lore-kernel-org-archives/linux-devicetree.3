Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5239EF20
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087651; cv=none; b=hECqtjJ/xfuBACDY7X5+IqSxZ1WYaXVLx3H7uBP2xHQIfmwgWxeoL+FRcWPYoZbJMEf/sViQOB5EmSsPD410rLh2uQ5adUUJAdk0aCJN/ebV+Uw99nY26fq/cO4dxbMplb3uGgRveKqAzbYK2Za/W7q0QxkjTtHJygyvKz5rNfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087651; c=relaxed/simple;
	bh=VnZx+mhFjp2ManlYLmoeXCKWNRbtXIxy8RAd2LNxni4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifbtcG6Ht4mzLaY7Z808s8s7d7B9j+lAjw+ii/UoAERsNT0vxGeV19xpuO+Qs/d7oSlR033urA6yHi41LbjMMtE9h7nfIAPEXbUyC6iqlsxOjc1ey5+q4TdhBvjjSXVe6Rf/j9DYsarh60gdwdkS8+d5yTIvPNoH+zm4D1I37uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbTaDwJ9; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbTaDwJ9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so637462866b.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087647; x=1790692447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=fbTaDwJ9nGseURLT+AwE4Jw7X/vnXrqExL2tLLOKlizfismKplr+RFvxqDyKfBHtSy
         78DEoDqUZi4dDahogOPUfXEfsvpAeKeQFcIJIftG0ODXx9hIytDPJZbHD1bBhWHtftE5
         lk849lre/YZ0dI/CHg/+AEYNYrLkBmvvFjLc27bSpGGvGX3dcGB6cGg/jhNKNOVkfUIu
         iAFixALY+zB2x7STahsn/CNf562MbbJjfM9fVBJo0BwAeZh/iJPdxAie2ZtiCu7ET+LT
         XkoVOsdbV8OXMuHF7fuBhm3OuxtssUab8iTnXwemaQuJgoFh6MReqajRSXty4x4CE4iF
         jc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087647; x=1790692447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=Zfx7/Xk4A71bkxUIvVh152EBOdljopc3SbzLf8hVI43Vf7jA3ndGGmkZM8Bknbj4Q9
         I7CKBZzf5qsapu/OGxce5tfWeeLPX4hGGwAxOm9R781X6OG9mY8qqxNuuqkirWIcen0v
         6UHW8P7ba989UVdKYQHm8EDCWNzVTi6/zH2fU7jh3T4qrlDJQO+6wHNQRgXQRkQAb9Th
         KPRwcJ6tPy/0DB+WUuWzqkF9J4L7Ip72LThYaBpyjkEWxHb+ZUXqrDuB7AeocHQcWHFk
         02vPDqKLmoOcGmJAHhM2Tv/QWxzL8omiUgCiGu+Fd8v8qF1Zvi3PFexexweMFle9Aiu4
         3W+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5ClVPvr23nLOnSTFqtlMKiUD5Sveg6jVsw6a07UvdVA+YlF36ev6f0Yz3n1Gknt2Tp9mXRty7EKe5@vger.kernel.org
X-Gm-Message-State: AFuF++nDVuJjPFBPAx4axQvFhrx42LZ1dzuOsDUY7hdq90TE2erXJYPp
	nTzoAPJgdI39PceEhbRbI4Vxl/3mpMwiXRauB4B30LFDirQUCF+/U/cD
X-Gm-Gg: AYBFou3GVaoHjOm0aD4HG2mr4QRe24mRNVYtrLveJV7uS5ih4aIBzEm1ltmEzfPMQtN
	+DnrGWei0WFXDQqQ6P2HI4lyRKFsD1BJoh+3jvu3cuxyc7vFeqV7YBqoXos2LO+fzAYWEumSIrL
	ZjZzEjbAj6PyFP6XlxqlpvgOnGtYUGRtvNpYZD9xudg074H5XTSzv+2R+V81FoLope6aMflSDm+
	KIg21nRrWPJbxooStHi9rhX71P/zuCMevgYnlEQmO4V6wsph01KXZnl7wxCg+Iem2cImZUktAyG
	lrkn9uzzMK3AFVVQ0H2qdck7HigZsoT75Zp0zUFtPbQRoG14Kfo5+fGcSl7IpfPVEJ1zzCVllTr
	BujQPj2Dm/wAIu5Z+pACBQeUyVp5UzzNqamvkTGTw9Ul9YgB1O+N6ZXFeaN6JOjFFcVXayS7KP5
	zsGvTWL2usYVM92uI5lZDR8o5a9f+PWoF0Du1Nd68kVjQv/PbbU1h8s1wJA45iuyIUn/1ngkiNn
	rtmsVai6K5rQbEySM4YVIsUKxJN5nWp87TggzoqT31QWiFRa46W50Nl4HXFgfrcRPT0Pzd5qA==
X-Received: by 2002:a17:907:d18:b0:c27:420b:7c82 with SMTP id a640c23a62f3a-c2a15e0e909mr1269150166b.48.1790087646940;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:48 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-3-694100afb4bc@toradex.com>
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Aquila iMX95 Development Board
device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  4 ++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c283c582d974..b17fd5b067de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -954,7 +954,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -976,6 +978,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
new file mode 100644
index 000000000000..140025af4d53
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Aquila iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

