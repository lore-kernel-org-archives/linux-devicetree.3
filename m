Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8344E042
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193104; cv=none; b=QYgi8zGn2gJLHfWxNW0GngmcJ3Fzvmd5Yl1I4+M3ti4ph3Qw1+dYnJww0IfrkJeB32yEfhl6EvLc32TFGv2SVYnQJb/XlxWJDoqal5Hym96S+Sj7gTL8EpOJFOwVb5TTvqQv06J6BDzOE1ZF0j5rmvt+iHQEp5myBzyfI7CUU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193104; c=relaxed/simple;
	bh=TptV6f88hXIUqbtGbW4D705hFvtXNKkk+IwN1eoGE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFSjQb58j3ppYrx3hEqOHHr3BrtkUO0kbHcn+lEQoC0s/LvL+A1Yf/Sl6ITD0uALPCNu0iGxAbHydL0daXpedMwOCOV6DNKQr4EFEbdws6OYXdy5HKQHh6dPXoxAuxn0AtQA9DHBveqHXb1kb6504bxikBLu7r7+SpwqSCNXsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGYXcKjd; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGYXcKjd"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e57ee1cb0so120189a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193089; x=1791797889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=cGYXcKjdznoo8BSRcz+B7lvxWedrGPq5Cpa+h89AqOHPt6YaafTnlDWWHHIGjOAxB5
         OOIOQhMsOq9WWdji0HTF0HJzHLFNn/W5tyrpMzexxGWdi5e1tzoNmYxdOdstETFNXUQw
         bcDCNf3GKH5rr+viy9dHt68WYc9/Zub5Gn4jzu2UtRQpk+TdJtfRDm0piy+L9czS8Gcw
         HVG16f7io1f3sJJhU674AvNFYw0lDUFYstB/p60BZsHSXENqCLx9NSDphWeHqvcBeEaW
         VD40unEoSbt9AbKaARRHJpVa3sQ8Sl5a79M4CeZgLBQO17nt6oZDfLE0muxX+d53H7ew
         5r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193089; x=1791797889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=E+i5niF/yy7h7C+ePrAoZl67aNEFIRZBJt/gFidVcHW5WuxWvjozJi+GZG3Mt37gCZ
         KpaXvXaYCU6wdjPNwVRS6cihPgzliHhSjcrhLyP1KmSWr49dM5WCD/y+FBiNmFk58EF0
         3/7DAux5s0oy9fewgV8IVdXsBvNLLdNXB+UGlu3t6Zz7Kqs2EY7Q+II0FI7sIwNei8Kw
         +0NLusFrYWs54VmSmJQrprzgJOkDxAgQRkeGwI/zpEQ7eYXuOWuVOCjweQIysj2VDTEr
         1Jz5RkGyy3GPACdYjh2+jPXMSc8P1roIPuEQAtVcpM/JF53sEPnVOg0uC8clf/azbgTB
         DODQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQt/sImcKCsc7IqDkvz9bLCauzCv1EQJR2MChvtMzPgzfxfJq7fxgkrXyO18ET4VaQN7VnC3b2Oy2H@vger.kernel.org
X-Gm-Message-State: AFq9FYIsqdAkWGOcdUaXTz7BRy57nik7W37NaLeVKeIDGy1qMILAwAtB
	npg9SVMvIZc1TNrRUlX+kScXoN0pZRv64zqnaBTMsRJUS/qP1/vmPVpg
X-Gm-Gg: AYBFou06shal3LyZS14TKZQ0yKHc71/8KiCf01Q+PNg6sBGvybOzq1wCyHxcLRIY5LM
	puWlCJIJPXS9UV3/7y8myofYZThbdSh6w2o05KTYkIEOLUa+3LtbylluoJk9C0ZKlAdvH9JEb/m
	wRF8J+HrK8ic+KWFcO/faXlBKJBO9qcLiCXM5mmefhXCvZXn1/Lf35bE2T3PPmiJqeSwYUUn2oH
	zCUimQxrqLJwXpYlaBZZ0GG1lgUQlGMRVO7vuF4o54r2kxz7SDbYx/cBemJ3TcaqcgLrkn70j5w
	OyheVvYtmbJYYkDtmQtCT59PGcF+Q1oWrL8XfXRAP7v1gNFhZM5gE4LczbgtZP08ZKdUAmkF3JT
	0C0Bfmpf0HGjHvhI+uDwM6e+lhFS9R/UZT77DDVekhMtzngRRLnJTIXPAHesRyQgcQBpw2nP40E
	pkAE7zxOlCovds/AM5HdTpmFpCKL5a8q5Gbrgap9PZIpdf5ejkfyNgusJiRYNkihihTg+mFfSQf
	2EeRtM/xHvEa+ubIWi5KmM83IRXLWTA1PoxMqLHacGpm7MdGtYlUOqCjg==
X-Received: by 2002:a17:90b:2f48:b0:3a0:e7ef:bc81 with SMTP id 98e67ed59e1d1-3a6ce7c94edmr14943856a91.3.1791193089049;
        Mon, 05 Oct 2026 02:38:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:07 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Mon,  5 Oct 2026 17:37:48 +0800
Message-ID: <20261005093749.645014-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2002 has an internal 10/100 Ethernet PHY, but on the Milk-V Duo
256M the Ethernet signals only reach the RJ45 connector on the optional
USB & Ethernet IO board. The MAC (gmac0) and the MDIO multiplexer used
to reach the internal PHY are already described in cv180x.dtsi but are
disabled, and they cannot be enabled in the board devicetree because
without the IO board the same pins may be used as GPIO.

Add an overlay that enables them.

Tested on Milk-V Duo 256M with the USB & Ethernet IO board: the link
comes up at 100Mbps/Full, the interface gets an address via DHCP and
passes traffic in both directions. Without the overlay, eth0 does not
appear.

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..49639cb0888b 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,6 +4,9 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
new file mode 100644
index 000000000000..cc93746d932c
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ *
+ * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
-- 
2.43.0

