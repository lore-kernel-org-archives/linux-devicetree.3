Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55330BF52
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214974; cv=none; b=Yh4ElAXcjZK9qp13+6OutvMf6J6bjAVQAFjxUllapjdx0uJJZaGY1TIioRfxTbzYr7XPU2rIq6fA74aADTYgdn61/nbXgPZO3KX1PniI9GqLsZUFDoDW4wHyx9DwBimtmwK/hSRtqvUjX+c68bCH2gsgcYyNXCUUxLAHp3wNcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214974; c=relaxed/simple;
	bh=ifciZjFJsSlLqvMHHqbkFJuk8b7OaiYXAH2dMXVM6NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSzs/FYPBb4ZRDddsHZlqDUyOuyald/keAR4sc2I+mrQSvh2+KmyjjWj60xlfm1MjkC9mcWya3uulTZTQ97Gh5tp1mQ4aaKTL9y29X4pj+dQDftndT+c2/z6A9TRnent6N9lPHmlGCN+pE0JRYYQS1HVuHea1beMjCafdvf6Pis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok49FR6a; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok49FR6a"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfbfdabf3fso199635885a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214966; x=1775819766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=Ok49FR6aURjAd24hPWpXZufIc2IuGiqhDCpao5caLwRx6iBBz5siaVjdKcGk78F6ne
         KItZoptTIvljo7XpQXfWx+59t+PdYax55VJhTmC4S63ZHzEAQS448Ix2oTOXMtdOTGyP
         JagwLGNNyM09RW34CrSFAlWyJzce5lwrVjyyJkGKYicACSxl5kZ5vbPVNhmibSQbc2i+
         KTW8Sfadnb1XeaCAC1/8tFHuAFs0ScWsJOAKQyYjI2YAIjPbIdvn+i0DJBqCXJ9ODM/K
         +TeNH2PdH9fQT+GSbL2KjaerxonsKncapcMsAbuje8DgADmi3/g/m8216GBa/z0SAIvw
         0akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214966; x=1775819766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=WkoIljaOzHle/cVuz8TgbiEtkxFE1injFyFu3ZB4UWhmuPrvR9uDRp9NVk634m982X
         WIcGSkDGLMS5Qi9PS0JFmYxQJik84ixPuZyDtZxMMgfzeMuOr/gmDvmN4GcnSal49XsJ
         eJbmn+wGDv78D9jjdpOGHjiNKVjrwnTEEF1yS+H8RDbg7hnxCVhZ39mpq+ncEkLZo32U
         GTcR7ZpulRCu7DEeFc80ylz+ukbnTO1GuqLVxUW9ERv/XCHsFtlShhrcsiIH7FXAz/Ml
         VyOfh5XGa8Na2Mu5EF7rBqYFOIIUrVDJsOWkV5K5ZKCjlZxsWXHv3Y44bAOUeO1e+6Jz
         HNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1GKcNOwqEiQG/jigL5KGjtHf27HiiWbBInsmycyOVJBARzVva5aZJDQaAqFTwCz3OFiWnLc8EP7kW@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHytmp0tjIGgC0jIfOc88ClR0gcWVhCM8E5kIvR1icv9Pw5Z6
	iZaBgwJdJSrQfR28W3cP5oSev2/ZNJ9qds7OBq2c7aseL1Aka+d2QLKb
X-Gm-Gg: ATEYQzwuLKCqapl3rrgjqPh/foIfLYTPU7JFyErIEbjSx2aeqke5nPx9amxCh8WFyvv
	+IPerpqv0swBt/4JQhYU3KC/F/vGMxiGbi40fHgsKqUqrkRDuQPh7itazmjpegNj/5wSF8eYJor
	shEs5nTVZfRz7ynCBvy+xv6WxfNx6Q3AVz4Hyl1zf0gLml77dSnSU4R6N8zUqkUpH6yrbOHgvMH
	MRBqQjFMoCYnhwMLL5PAzwQLVzH1gGVPs88hmSeU+gnS19uMLA1YOSzdGamM23DkKJ0waTQkye5
	uuv6/ZyMqm/L2CFJGhpOnLd80wxz5necAud2/aTNbSehqJDmHqPqcv5Y9GNZmWmPkv+r6RUWnE5
	e1Yfsa2IIa713JsecslxjhjCqOCZGsoZh6lmF6E2+ykK2U44pYtgAffs0dCPb1sehT5gZKoDfuE
	DHWloTC6q7k0FIev0OJP6DOWU+XL4m
X-Received: by 2002:ac8:5785:0:b0:50b:4bfb:1653 with SMTP id d75a77b69052e-50d62cc15d3mr37333391cf.41.1775214966031;
        Fri, 03 Apr 2026 04:16:06 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:05 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:16 -0400
Message-ID: <20260403111516.379795-6-josh.milas@gmail.com>
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193b..58cc6b70d8de4 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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

