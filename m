Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD331985D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910284; cv=none; b=jDXREhPcqdHuq7dbNl2aBJH9tjb5ByCBZrhdju4hzlEaVb3JsIhVyAWMhRKB0nvyyjusJIuxbuywpO7fCoXeYtG4ZN35Z6gspxfns3VXNb7OMh7pAbqsTqvkyUxbXdfe/qB/5FFJ+j1/ALKQQi/r8fUq+SIYiZYhjYGFFepMLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910284; c=relaxed/simple;
	bh=xZsPZpBIozX76x33uid6osTEvOMu7gP9Tz9RTskpCAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tjx/TFjmqOcDWcGYp7EarXidpNuOnQNHi6aK3qjacLdLpDbd9yo5+AyZQH6/be+vnEVMuoMgpdTn8CqmbH5dP4PxJntzYadLP3lwzRiEO24yPTzp1dpzANLHN+eHn8dDQ695Mqwa1jWBVOrm8I/09i3IFxs4BMf1nCpWlNQV3Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qfi4481j; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qfi4481j"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso4635545e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910281; x=1785515081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=Qfi4481j02AXWQX/tdAcEKVz2RlGLV2ZRMk7/Cwu9T7I9ifiBoqtSgbo+B8CrgLk0F
         xNdTDkJZ2yQTbJT9ezRAWi7HYII+EbVqW4LLVRj5tdz5J6yFYRvmWzo3sA/4Tx0dLoop
         beTvWM+u5gerqXCMFj4POEAkwpi+xWTRykG5mxv55TQI7hWHp+dmh8zNGzKHot9umMsF
         K16dF+vUv/I+PJBsxBhWIZMFvUIJlZwXCV4G/Oe11GcdIHSL4GJEYvHBr7owSmso3fY6
         RM5DBTOApzYVkxLv+l/F16kuXF5iurrk8QTccEpchTlXIihq4DAO3i6U1euwFwZftsed
         nIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910281; x=1785515081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=Hjnh9GoD1RHvGpT7rD5qWtFUgYvccw3zdfDZdw1R0nfiO0/7brfcNEzpx0008dsw8f
         vuP4ebp19k+RVU1R4H6m7IHIqb8pMrlpOfnQR7Ly3lmwccLOutPErhIzdDRiNtNurF8R
         mP9w/Z2JzMi9WzBy3UYeWoZVp0kY19Dg21BhZlwEy3P1NYJmJLtrT4mSl2Uxv4NNcDnx
         oheaGrg0Uv7TLiZiw/nCE8p70P6Zx6d79aXovsCAlXVgkN4NRrSmJIR8tsdZRnA6I3IO
         O4Gm3mOkGNf5Yz/71WdEOHCCMSgCEj4mDEuKHZ2jX3+10kwPoLW7XynHLvCnQdgjOny8
         Br6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFNUEuKUauDGXD6jFIOmQQLsPsJe6lUkx8kxzi7f/1RGZ3quE7pqKEFNfIvN+ep56jmxT/H4vEfpMV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qGTaqbLUwOp+itAbnE4yU00XrRAUOIUqQGXxn7DbJN48H2G0
	5g7nlYZXpJ9MaPFmGgi7uD2aPvXGmDSwH2snj48OEsERzSi8a9i8DXmw
X-Gm-Gg: AR+sD11H7whulko2OWnLcKvUR3rlqPOfWnGHEkHyUl8T/QbxKFsquXIsOFzb3kaDWW/
	j7D+ASICJCVB3HjYiViaxnymtV8DlE5Gd1ljrgKydcfy8nBQ03iA66+u0GaJ0uNgoMvCXiMnVOK
	rAa/pVCkCmnukDaEQUOLO30zz/UZ2Zd4BTuPhVUc7cbA1I4A+d03obybedQCk3hFOV8BBujJncy
	BQavWPMqSriIrPLZWvZB6Fc1S7BkoPtdLxT3uEbuH8OSnAt9mTWXuAWlxIJi7gKzYISOpd3bBV2
	PumGKGYnh7cClVFl6rv+qO6yivyW1yB8tOBzbwpemjSj0TWMaxyX+iQUEjR6reAkIOeiOaxEeC6
	VRTnsnk8JcF3Ad09oPchyCQ0/CKmdne9T1ohjxdCHHvzHAVz516CjE0cZu9E9B3yq+F/9Ou2lDP
	LbLTcnqf8tK32Rklk9yXjE8gzK+yjwMdxe37Nr8twUrmcbMlDS4TAfWOSUkc+U02bz8krsHOEig
	FSz4g==
X-Received: by 2002:a05:600c:4f44:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-49573c8d564mr98485145e9.3.1784910280700;
        Fri, 24 Jul 2026 09:24:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:27 +0200
Subject: [PATCH v2 1/7] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-1-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
index d5c2dc720197..dcc0464b4e80 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -184,12 +185,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
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

