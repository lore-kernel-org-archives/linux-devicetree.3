Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EF329C40
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955216; cv=none; b=TpqgEppRsn7SEmwdZH3aUcje9cuK8FJ8RhP1Lv2SXXKU1Y7xfeWbGvlN2VSmcMaRRoftZ718aWs9gGcOtHmx5NHmHCI6iCGvtdfe6sUWuF+KdBrtr++FRVvts3DkdbpYA2T8uZGzF4m352G5Puow+s0CuOQBElOnsWx5OT16ICs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955216; c=relaxed/simple;
	bh=jlnzdBWKihd3qQboZyNAz6x+xJB3wNO0aLpCSwPK8QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncdgldSj8g0RQUfa5VIXjU/VdkUt2MA9U/WwEQdoaVF+mJdSbYZ8xY2nifvBu2wRzdKYmZALZx+kaJBtSAMal04Ywo90u04pi70QfQwSCtmn67YBimES9VNVaeudIFnrcjG2veEeoP0k4xXw/a/aU8Hs39AUMEChuwqUlAKrtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukt/KBD5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukt/KBD5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f60208a5so28477355e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955213; x=1784560013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=Ukt/KBD5N00DQJ++yHd1smrFKTvLmL67c5YhbbCnlh6kfNaHjTI1P/fAe/wRmg3YAa
         awzNQ8SD+btWVNSGaYSsZV1dbNwhqaTU1RZpyDRlypSacDWVDVIqxzK91f/RrZrmn0Oz
         +ocviNolFwyoyQ++Kpv35oj2MNWcMVitpqSbrEeITtyX8Tw2rK5bhEztFgMqRH94IlaN
         OKWGBaPq3YMXTr1YyfX0aB7K6DqX18SAM95UUyAHh6CqBOhz1qvyZcXIYbn+j4qgilJa
         pZmEyuXxG/bPMjI81Pb/dGiBB3ZudMjGJxylSsTkq5ryiaQsidQlIX7UIUwLz3GLc9oV
         v1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955213; x=1784560013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=fX2sPwjZLwwZTb5FxoLBaSVsMQssNzaxil9w4zs9jEPllSHnOYpRtZpdTILZJpzTi7
         LvZzL+QX9dV805SndWPSPXjKEbznkpooPtPFoCOywGhHZadMmQJ1iQ4Z5FApInoiYN0p
         ai9dcdIxzpVjy1SEp5fxGN5D7+xRV3plK4SFM3V0Crw1rv5HN8nb1LQNaKfMywlSBswc
         aJKDazW7bVYiSPF0PjrckRoJOZrxqgrJzAU/IFIHScG9GUJpFZDpwMuYLbW7Mfl5yGvZ
         w4Yuy0rzCEP/ZJKj2DOQ+D11DulHwUAueL9pTqDSy0vJmQMkdBkzwMlfZYQxPWOkoPLg
         IZSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAEeKTpMNBEJdDGNEvM9vPORrCdwWJzZhKpTmXFdIn60yxcg8jDi1Z9sKLXqRGOev9V0ulOWVrM3aV@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTPIjZTOJ/6z9yFOIHTD6HH12VptZ7C91Rft8q7htdCO2pv5K
	JLAQKRCDCrBnrY4j33FdfTKPbWgi4zWTJh3kwsgtkEGtlOWwRyP0kppy
X-Gm-Gg: AfdE7ckLjU2Q7GrDUFbhFkz+mbAjiiZVVfIogPzDpQVq9u3FVU7vMSwIY7vh6qbrgkn
	jPE4zuKKK8SdypPboWitul87ZZVLqN+KaPh1cO71ydR2ftmjkCgTSSSUTtyP77H43cLrO+7q5kW
	gJbaMF8diQ8GhzopmyrYIhXvpzUIKYzwWYg5epB5zjJA9Qpkb8kkOerH7A65T7jwqWSbsvvJFqo
	TCvWgcVvOp/3nvpw6kbGBH2QbF6z8UmdMldHJHEM8yZswMyla27lXXqdrsowbp8n35ZHXDTMb5T
	xzkfsiFcJS/NusC/PW5QL387g1jFmvTOK+yVwwhJEksDvnG+EKazyjq7nlzRheSj6hOsncRY6dh
	iSNFURTSdxj6Fk1ywDDwCb+JJl0Kpz4f/Edycer/FeLiF8mw5R47lje/WG9VP9IjYUHFSPSN+Tg
	9FsUNmjD42ctyv00pLFkxU97+9xvA/Cj6iVwnVhzCCmRjCYV6ep8K+CZrzxI5X/wsi+HldyWdTS
	Dxot1ivxKC+WjdTeRFuFnCAogM=
X-Received: by 2002:a7b:c447:0:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-493f8834f07mr69080305e9.36.1783955212518;
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:22 +0200
Subject: [PATCH 1/8] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-1-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for configuring the NAU8822 loudspeaker
outputs as a Bridge Tied Load (BTL) output on the Verdin Development
Board.

The overlay adds the codec property for the BTL-capable output
configuration, where the two loudspeaker outputs are combined for higher
output power.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 01d4ddfde098..f833e179ab3c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -176,6 +176,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -183,12 +184,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0

