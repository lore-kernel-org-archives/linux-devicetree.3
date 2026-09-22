Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FA3AE18A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087649; cv=none; b=h+51hS17OtvX8qQA5t12heuwtyuW6+QhDIWYIrAYrYRTeaHOYnFC9Ft+maSAb+dWlZXCLHY+0Lboalmx0STv4agen8anuluRmTEh2QWBQWsCeAp1EUBxGa07rnwiLJPrui9g1t+rJKGUE60T2enBMNCbvXn4WLrX1nOA+DjxjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087649; c=relaxed/simple;
	bh=kMN5YkIDcnYKVfhct4H26E5RszOMPe0PSxCRTtVviqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq4SvUgpaO+DcoUrVKEiE8+/J9OgfyVzICFdDWe8s3q21ogyTMInOIQYWtZf7CJ3rnCagkFemm9VwsSItO5BE1gL0uMW6/YNPcUOMFrihvHB0NjKM7psDCBvGWUmBt0g369wC8zHGea7d4jkMJiug6RtMPrwPpSdiVj4MFFph0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h85o2Nx7; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h85o2Nx7"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so6332746a12.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087645; x=1790692445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=h85o2Nx7c01ffKQy49THruB5wKBGoR8ZecqrCra5nbJe6FoUQhjakfcw7/0bgHNkPC
         vAtxPrdxeVP3A9qW+CT89jOaQ8d4215rKDsamLYcioVdS3c05dTHKzGZRP+kAE66iwcR
         KYAxjZgiD8VjlLqv3tCfQJer0e/81Y6vb8hG4eJ+S3uIDrJY8zm7fGOtIVH2Qahbv/MH
         dJvaUlFXbBz2f+atYXc20fOZOoFZ2G0FEZU+WJMyUBUcmrTSm4WuQ1yu/ft7fIG//kuv
         3HmgT5mAGMo1b4UGG3dD2LAU0MLr5d74bKNECPSVd7vH+7MrjOcQw9cfDjiFimmglqr7
         4t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087645; x=1790692445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=1SDzhI9eRHG1CefgT40QK9VXJBr4twhnLPXBSTWWS8mdlXj8R8F+t2lG1HtDCwgC2J
         Ys4s+dleWz5RbyTgqI/9+k2lbsPeNhod/FCJcFPxTTLUPytBatS7OOoGEf9Gc7Pz3gE4
         a+nIJ5k17YL2cjmu9prM6gmsWJKYwmUbyD2LVAJq8SU5SBPtLavVEBNv04QVmJ0cT4T5
         WRQJ7bj3cGkxsk+SVnoQK4xu50X4ad3nLVrLQI88MfC6elf0i8MK5TURmYwLABHrqZ3n
         e4D9y8JW5tY3hFYfNudbkYoRFw29Y/4alK5poOGBt3dDh+uEp+qg2gI1l9R7Ycrb0iZU
         rYrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDndj/QM0GVRfdUMHNcXsayRgvPhowTyAP3EqqDCmKbJv1pt8HgmLM6n9YLopn1FXCJ667tSTTfDc2@vger.kernel.org
X-Gm-Message-State: AFuF++lFz8ZDSxyYAeqzwKhm+P8/uyfm+RiueJFLd00UjIW9w9CAioS2
	EiJSCmpXzpQ5DHsVduqQym3M7o9eu2RQlymQhaCO9GPE5rfKG5XTqtfY
X-Gm-Gg: AYBFou16jrGHwpVp5/Qgi0pYJB6redvNvrxfsCDXFu9dPTgR8Oa5nrEjoeQL+c3sQWR
	CvGHNwciePAQTbKmjNFmDFDLXUfV7PmPVGdNivLK1SwNErklXkW2kbTSFPvqLvSJXGbgU3A759J
	3dsQ6swLkrso0x7JOx6f7+fagz3tgdcNgoRhGg4Le0u/HppSB0LKBBisxnWtngDnwvqZMiwxviq
	RtSB1M/69/T78JvQE4+ZpEeM1nXhy3eQkdomNu7wTqiQ9dJUSHM5++Tw7ietAJ/9uGfbU4o1xqm
	tAMZB5dmzHn41UyCnoQ2o+3r3ss3spW+Hu9g2iNNhkpCNREFd1wbxpvvFF6opY4DMvO8YulmmuQ
	NWkmoB5LJzP7UF1IZhXHgQEHotwtxouCV8LqUmx9mSC2w9zU7Cn7KVZs5H4FHC8bh2hjmj3pUmF
	H4roWpBoD+2h29+ucbb4O2f9DSizTum3Fl6Ow1N9ziIPA+aTtM1lu71ZxlclGpseYUEXQDZWrvE
	5pOxdkYDMsc1+IxpxHSjFpLo0q8MI9e6+WJMUxjHCdZFBZRsk+BZmu7MtWTZPRWe3T1EUqPRn9y
	93xjYrqE
X-Received: by 2002:a17:907:dac:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c2a15834020mr1228411666b.36.1790087645170;
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:46 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com>
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

The NAU8822 on the Verdin Development Board can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Verdin iMX95.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.
The codec and its routing are already described by the carrier device
tree.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7944e3b32513..a7ae74a706a8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -959,6 +959,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
@@ -966,12 +967,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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

