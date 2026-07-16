Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0D40911F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227398; cv=none; b=SlD/CLq23/0mYbr3JOMf4XULQwMC8JGOuIb2JE6pS/zytZtv89deGOWkVcWcZScZh3pvhrxVzKFIUgs0Z+hjlZxk78ky2oGNL8lDVCh9cSsteNv/6HPsWi0zOcJi3ES3hkcx49zWSTAU1H/lBaWCEvMLaiLGjc91M91Gputjs4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227398; c=relaxed/simple;
	bh=80pRUxXJA0RamBvMelg7QY+l6H1tSiiSe3Wug4vxrbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ov831iXJYZevd8TQM49doytaJlrfwodmmkszF+8t7Bbp84B633jN3lccJpd01YdquC0R37h/seF10ge9HjrjqBu5y37/CjJ832bDuQFb0jlH/dtwhUZ9nvsm0nCbYOUMoE7LpfPxXESMvw7wXyrakiuBuq7rxQm3QniySCDoZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVDuiaS4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVDuiaS4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f60208a5so57995035e9.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227395; x=1784832195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vgC7U+53BZ865eCLhftXj3EWV4r2LOov0iIrURTfB4=;
        b=cVDuiaS446bLUXs54Y03idCCwDK+4PEh6WI6+CMduTO2F8035BvJsJjZYh+Nb1DWlc
         l8U/maR1dy6APJAkO6HSOSPyGH0x4fRkeV+fjMxTzlhOFqPSJF/NVb4Zx24J0ZsVSJXm
         UBq6e+IAkCrVjuujcNTHkFgGyMhhyx1aMMith3T8qgx11H5oyghkmowEiibZ9AssYMN0
         EXCimNUfw5FAEyJCMMFk7lQ6ZDKs5CP7vjxbl8fWIkoLnzBXcw4GiZb2KvY+uvjjPWkR
         uFKwnkkko1RWpSiYjU66A6M7+f/IesJkB9qq4fJi8/DxjQrvbKRdf3KNlM51ExOm2gsO
         VmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227395; x=1784832195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vgC7U+53BZ865eCLhftXj3EWV4r2LOov0iIrURTfB4=;
        b=YD8yEiWcPXA20JcqNFsbxQLGfKQy55Dzrsgt2okVZz3b66Ec2PkIq0aFxrlO4VdIxr
         8/X8CPjHZDF7tp7jagahzfdwl4l1o5TXoZlJZLMH4oSyQbW8R/cMmAHXmkc8OvW8vIot
         /fDf4cPp2QM9FRXJCueBueo+cctAxOWSNW4AouAGRFUMczi08XCw0s3gmCh1IvaxUGba
         dHG+JdiFrPhZBMi0YqJPBO2vZlrcIzLW2+G080eOV1tsoxHDAJwfq+88Bj/YAqWvM7k1
         sV3xvyAO+982SwNbTxyhqZlv60277kQPhFGwcK8pndEduqGf9FBHUL8GxMBUNfH8c4+Y
         gkRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIp+1EhwW5FV+N5Pzr5UgSC0nKQDI3waOGg6udUlRR5HWVl3q+09sXPakzv4ZhDOUbZNhh1DKj11BM@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAoGCv8bWerBNFJxUCDOA0QmCvkPJ2EvEISWhEYJNj4N484xN
	DmzPCHpt26aaYBIA8EPd/lpEuxs12UvcM1FLNTCH8pBY6ZUSSYzn4Nsg
X-Gm-Gg: AfdE7cmq40iXkqqPX5iP6QWVdZjMXAxHmR4ra82RA2Ty/MGvOgTk/b1QfE3fQxrCkbq
	quXspqXCEShUMuPL/uZyhthUV7sYzrXnP41sMLRkT/73BA1CUdYxbtO0ofoiWoixUAESWVCClek
	/B+3UK9XtH9/ZL/YhRKtehwZrLrHGgiAZ8IsLlMsubksDADzSrAvQKdHSCXRRev7zLHz1HsHLwz
	q5osLjjkj7UkDuM5182m6+XVCvU4RVwmK0iTsg0N0I/dOjKNSwAmMZaBtDiBKoAG3LwPca6b3cr
	NKN72pYWhNqdGAAK3KATFBxH9e6O1ChC1PQWdXU16/B4Ok1lg0aPgRQ8FRF39l0lfav62iDMAa/
	Gcxi+uKcddvY3vQa/fM3QxPDd3d852hErtuyL9ohMo0fXjWJzTUvS058AsgRh/QXdolW7UHvTfy
	5Xyt+k
X-Received: by 2002:a05:600c:828a:b0:493:b84f:9c28 with SMTP id 5b1f17b1804b1-4953c1452admr92988135e9.4.1784227395299;
        Thu, 16 Jul 2026 11:43:15 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:14 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
Date: Thu, 16 Jul 2026 19:43:00 +0100
Message-ID: <20260716184300.85413-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
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

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
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

