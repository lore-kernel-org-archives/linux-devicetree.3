Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38C3AC0DC
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214964; cv=none; b=r93aXbpXknfA6yZNc2J/5hZhNhkci3257eI5zjWCQzOn5cI49iuIBDm3y+Y64StTjE2+QGr9DPiu/F0VZwsDDAcymX1/um1g5n7NMWuU1v6g5QROS/f01ZNez/0TxlAHzzN6XorOy3x5Qvv4q0zbwHps2/IQVfDW2pyK591oMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214964; c=relaxed/simple;
	bh=VJhjDbD9k93v4xWoMfUMeJOvaM+SAKtvPHI+Ks7kzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYQG9st58eYzKmF+lk5QZLph5JZRefS8J7LYS05kKeumzi6xeKPVPSpl191yVYWciK0Igtw/Uqu8xotBk7ek660fyNsBN9kgFsLp/zJtCSw0YxzvEFqhTRFKMlaGGOnE3m+esOHsYD095/SNjyk/FanJfsHjyYzaeGG7NEvwGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owtr+P9M; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owtr+P9M"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50b29c4e554so22742981cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214962; x=1775819762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=owtr+P9My57Fm1ejv7MYf+EUmrhAADDUqrEZb0TjI54yldCYM8Z3TbzGQy5O8568/7
         VtDmjXaW/rMwQh/8hZbVwGQ7DTzSdSQ1bd8dypTxzWHFSS51XZaWPsEUcMWlpzusVvxa
         VlxFUw2OpkTM2GtvWmQwYc2jev1HwYAoc/ynrLllxyCOWLRmegtPqya/T41Na3khUggj
         WTll0Kxjd/3sM4bolwGQeU16bqqHDcDKxoiVfgChJcXavbGFQNcKJpxv/bIeXMQdQdQ9
         mWbG15BuG1OEntGN5KyPkftQzKFhzv4XwNivvkeYlILLs01uomFBwVaz9fN4zQZjTSbo
         UH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214962; x=1775819762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=RXC7pgulhLgLti2zbc9yMgyXqpDH3TeIqytn96j8sccBWmxKrUhTyT4Qg3JWGG4SJd
         S3AxepC7rTS6aU8cI3GBtcrgBtZbrHtEaaAVmWGcKTjC8ggZUeBhtAKVD0qTviqQnUBC
         aL7xoAuPF+m6RibFkTkSy80sHleUyvtz7Esr/q8HCLSxI7L2sQ6PwH9xeD3avEepKjXY
         mLlTII77JspXKiLW7IgMat8eXf2Y3U1vMQ+1sDI0YIiAJ3/XOWMMYK5hzdj4nhDjrm66
         7gd/nPtsIySmCV5a8mR+/D80sovpsV6oh7CZNn/W9CNnDwp/SEDfW5WS1/c6B4Qmd9ve
         rVdw==
X-Forwarded-Encrypted: i=1; AJvYcCVpWXfWYKRJKPv6YH04YMF47gGl4pQa3vTIDXEY323ETTdtmu1sbyWUZ0qSySQ4Ck2jJj1ermhdxMvb@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYvrbwrAUaRL4ZadEUEpyNHnVomONg6wjJo87HOkpmzUhjUY5
	MMVFKPriV/wAetaNE0/YDzXFYssevg1dKkmkMtnTO5tSBNFmXcvvcgWR
X-Gm-Gg: ATEYQzwd9MxhapXqmn5TuLGBxJXBGXOhy96avKh6nIUlrtGPx+pYDpgoTtVVPv/SRFx
	615ncDOq64u+utnpxX9GyZ5x+iw/VQdBtgdHe4oA6o/m5ob4b4eT3GCwpfomUh8i+ZbP80Y28Bh
	h9Axw2uuvJ+OnScE6yIA0FA8j7+WQLR676ULszWwacSxkDrrXqX1Hs+hB5hfMP67JbNGcfw/UCt
	+NhtYvQANTqVEB/zK98pW9o9gyaQ9aa5aBJ1LcRsiZF8repfedPyrkRlVL24eDdQp8Xiz8x8yQe
	Xm/5yTMBlpDSOBUmf3ddDCkGl3SY7amXJKihWvOBksRF7vPTmTxZNxq3pGtetuyPcKrJ14HRaze
	48CvheF6TWikGDFW7TViACHkffRbi36Yas+AR9BrBfUTY3KAFOm/qKtVoH04wQK878b68s7RIxq
	ZuR3TvO/yLvkh9/JWzvPzbQtd6eEEb
X-Received: by 2002:a05:622a:244a:b0:509:4342:9980 with SMTP id d75a77b69052e-50d62a3e46amr38156841cf.33.1775214961635;
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:13 -0400
Message-ID: <20260403111516.379795-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0

