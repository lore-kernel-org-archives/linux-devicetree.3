Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028633EA97A
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409611; cv=none; b=erQ1nvmhl360jPqLk6OHh8agV9vkrT0OIBRsV/G8Ios3Bk5BEfvKaflDiyqPksFGzAOxVPmqwq6d2jUbC+kvHesiQFeO8gy6n0el64+eaEoOZIn765XgIhYnEozh45dGA/lcbvAdmXTwwckGHKW3Ey/DLhFscqYvMNx/ypRDVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409611; c=relaxed/simple;
	bh=YqgJiMQjllXS9qLJFTvhe1JGrg+iUao/l6DVe+SLAa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HN/qWF1pgLhlpxQyesIgCmFe1nX3r+IUepvBZ9buEvkx0QC+WYlgqfENiKzXrIqbRfrx2A9SLeVYJQM9YhjQKGCDiZv9zyijvpeGsUGX6KmeoXhWd3PckDjFBK9hQyHFCJLVl7/OGbD6ibvjY2JUKhOrRrLVYINeaLkxWNvBbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTyNefAp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTyNefAp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso8998755e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409608; x=1781014408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnWXzQAZ0Vo/VANt7mtlbu3rnPUwPJXrj9Dado/eFQI=;
        b=sTyNefApM2GPnKx8p0J7d6pCRn7eH/E0v1ux00EMAbQAS9Guh0BZymG+yVBDfx+9gg
         +XcxJrFK1e3BCQcPRxJ73W9d3+wAzbezgPdrzQ5GdOV0WX6Zc9dHwZArbQBsNPnjzlQA
         vcCD8/0k64Dd27+yrbnYnuFIPc5gDPbvdoEPmTx142K1GlumKbWKFYcnoy9wMTBzgDbL
         bQO6N/cELX5yXriSJEomvgtOCsbiYU4YTpoLKngDfz07bGnkVAUKBLiOzzlf7Qp4bgBB
         Xf/nEHBHkzETuf//3iJo8YKPYWp269fLO4TrQuHYejao+QVbZUVxxH8PVLl5gswuVq8N
         kpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409608; x=1781014408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnWXzQAZ0Vo/VANt7mtlbu3rnPUwPJXrj9Dado/eFQI=;
        b=TwAy/+OyG/AkkW721q2EbX6x7Q5ExQp2gd/dch2Gz3Ap91ITVKvZnCF+h9brmAXCzV
         gazxQ3rWDWxQJxZZB2ufYYyUzsmH8AshM1Z+UWLgnilS2IgYG/0QkfHA6uBaC7Y18wrT
         G+JnQB/zXN+oyqmQqXFPLSSQnXj0//RXCO00piQ++3caLXkdIhQmdkHYkabGTG/dtmnE
         DgMhQDVVKGJNMCvgdWWl+gvjZVx8PpvsAO4Q+folb1ZqGSWjFjH0vomi2EE3jE89BR1D
         G+8JeP4wv/fpq6sEXuMqI8AfwcpSCzfiHRAUEI5HhS2TTLEBCztWvxtyUdf3U43H2O0O
         y9RQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Uw+Z2p9g5yfum5Pu9J/880CCsN8Cqcc103Gxt+zNTb3/QbWVHLt+ppUR0QibgjmYBzzQ4fd6BNwNv@vger.kernel.org
X-Gm-Message-State: AOJu0YyHl/6KIWXJ0MbffoQWSp5F7Lf4koET/P6XrTgB9bDYwWPMlzp/
	n7aV+Ospa2bwZrNMzjBCfEjvQERy1t9w7AEDW9KapBSy2TOIORpkUb65
X-Gm-Gg: Acq92OG2/mcWONrTuf8gQmSQT96mgfGL4Kzn1OyH7vD85XRQAO6JbOXcSkMuYs9CNIr
	gzzEBP3U28PmJW/UvzgUsNv2rKET90Eqxp4cFAvHsBibsFAj7ff1FzvYZjV8WxhMmYedLq1k1G6
	ElqcJ0BNRqa2lfqYh/dHUPhGIKwWrAP3nNcRU5+/6MGBh4FGQdoiYI7Qbd+U6a7eQ2YRNRENsop
	r3Xfrx14E4+lq7zDkFuLd3pErVzrX2soMsXe+8QN2u1IOAFxpA0FYNLTS0Axm9pgZYNvGpTjmoG
	D5iRkCCArS4cnMHQvz1zscsLJtWha2UCT43M6op6fFqOBPs7BMPY06PidwJ5scdnkeAmmqnb2Ye
	cGzMf15hz3XTkhF44I2m5cXxuw2sGIOkf7wJo0h1QPr5qF1eXcNYRF37iVDUpuEvg5RVjIsLFRD
	SYIuYkwA8E/ehrYsMh015TVPGv2w==
X-Received: by 2002:a05:600d:8495:20b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-490a292fbbdmr208200895e9.20.1780409608315;
        Tue, 02 Jun 2026 07:13:28 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:27 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
Date: Tue,  2 Jun 2026 15:13:11 +0100
Message-ID: <20260602141311.1366818-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f2db3c878993 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
@@ -274,6 +275,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-ov5640.dtbo
 k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
+k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-dev-nau8822-btl.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -372,6 +375,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-imx219.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
+	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
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
2.54.0

