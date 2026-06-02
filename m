Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC23E95B2
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409612; cv=none; b=rOhjscTxhGR/zD4ZR5g3VLFtvKO7YviAz1Lq3GJuIavu3r6i+aVhSzBkiOPmriE9v7Sx+joRYCBHNUO8WzX7jHKeBMw8o4/6WNcs4Hkk1aJj1z9MF53LnKIJDFUx1Rg2nuNR30F9aA2mCfJDQ0hidiUx31nzFXI2fsi4ub85KGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409612; c=relaxed/simple;
	bh=SeBDhZdEKiFIoD5U8hFGD3WTPx2B9z+uBCblk9yrumY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHbklk3JEdgNukLGcfwEqbHKpCWjKlIlznvVDxY/fcQkBR3abGxR2rxDHJeyqX/KH4gCalNiYEEQsOQJrlbb3rfaYC+AHLaRpAyJa+IYTfDytWfsi3Gz17k9ljMyV26nFdOmycv9qvxVTJPsOzGuuCaEaAsR8sTE1QGy8vjuAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/BDL+MX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/BDL+MX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso23371565e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409610; x=1781014410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jQ8I6G5OSQI9Zc1AI/cbg9J6IIMEuuRXgGgav8SlWE=;
        b=d/BDL+MXbUkBEDyEijfcqTG5mMF8MchN4rW2WA9BDvHjnNYZkqLA9Ntkz9Ig8eocYJ
         hdz/4sz3KJZpBgV2n/ZuVK5LyAXp4qvQauC7eAbHhCsAOwpGwYXJTbsfqpOpfDSzUaWm
         nrsmvYX15DW55WZkYjTl/emvUTgd6uQzOg12OLr7cUUUQBgRrg38DYRqIo9hnCjJPNoD
         8JNi1OMGM9u3WEHZ+XSYmUlDdpC1ZSxx0dYlr48aUvd+CD9LyYJ2As+yMR08anHGZtZ/
         8QXI87hUFWg+sY92moCDAKBpoN1sozzqNymF9k+cz56jdkDZkArM9EcsIGQcYlPvPuOV
         I44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409610; x=1781014410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jQ8I6G5OSQI9Zc1AI/cbg9J6IIMEuuRXgGgav8SlWE=;
        b=A/wbaXymwqft6oKa3YH41H9DTo40+f16dCkuTe5U512zbzgx7hSDS6tzflKjKPeODa
         ZuXfLueg9jd5Qz3LwoNDhsOMJB9LfNiEnDFppyF8LPfvmJQdkD1Ek1Va8PquUWwZKZi5
         itNslMWjm1R8/vEM+ULWnY9XGaoBlT49JJ4Zvj6Wrmv6hEafb9c8VfPS+ZQfZcM6se5w
         CxpR3J6yPGISRGq1EEpXBNyPb092AXrjZxXYvg/nfhJ8RLKKjy4jf0PjRiyBrlMb8cqY
         +2uOvLLPUjPChp0Syt5e+Oa1HaM+JXySkgMrJY0S5MplKcbEHHSZK3SumQePgDVbaXFK
         RbNg==
X-Forwarded-Encrypted: i=1; AFNElJ/LrxKIwHOpC5lD8DzKh0EdPDHaxdtzNh2eRu+XVqD1ZIOkm2RQMK7lvcOyLH8UZhUG9ixYttKjFgi/@vger.kernel.org
X-Gm-Message-State: AOJu0YylsMSLK3Qc0qjNmW0HTX5cshHn68I8rCz6+zXot3qfYxm67wPK
	gdwlLPMk1skr3InbEaNgZ53YPrVBxHwIX7lahC4dT+qLtuDCpIQP5x89
X-Gm-Gg: Acq92OFIJFqoe0zmptnopiGmSfatVOJDXI9A007jDnhD5IESAcrw+4fz4iDD6cLmpMZ
	bWZZUMcfRNDn3a2Xz538YF3c7G39RPQNHhTK/sSzmAB9k2HH5+CIJYtXKwx01eKTIh49UdnaY51
	LL9B6zgjJsVn2ca0fea06ny1dzzhNDZcL3ZOs90z1RCIS68PcLfJ1bha6IK3+FGYz7birutonTE
	2dPuCdeT8w0VDMt4CY3733kPS2yNEKvS3c0xmBZN8GCnO7NLfuJ4SoH7NDdUHOzNm3W0yrPUbNc
	zilEPbEZ0zhLfR/rXKRToEJbLtEdOBivgrh03fNQ1iIFQnciO9Q0dX1XXYfmjqXztTcrY9VitDg
	wRO7rLIN5jpqboFCv9O5ekbyK5Z0k2AMGSO5PRK0+pFqSSgYrA1I426VcXvxVl5bMIgzxSWHmvQ
	MIpm4XUe5eh5W5LyPcTiBP0bZPw0YNaDBUKBkG
X-Received: by 2002:a05:600c:c4a5:b0:490:b432:6f1e with SMTP id 5b1f17b1804b1-490b4327145mr19699815e9.33.1780409609821;
        Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for Cortex-R5F
Date: Tue,  2 Jun 2026 15:13:12 +0100
Message-ID: <20260602141311.1366818-7-ivitro@gmail.com>
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

Add a device tree overlay reserving AM62P MCU_UART0 (Verdin UART_4) for
use by the Cortex-R5F co-processor.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso     | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f2db3c878993..27a56abb1d7f 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
@@ -277,6 +278,8 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -376,6 +379,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..ad5d6a5c17c4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62P Cortex-R5F UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0

