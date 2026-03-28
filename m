Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0133A63F3
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719472; cv=none; b=dyQPFZ5myE9puw4MPgbKjkVdYyafqZ3KAWWMFygO+lcnfk7ZDoNYUPal9B0+cwcfxnbhuovdMgM9oCBoW1zYcuOjRdRBkfFTv12vEbsAqZMnPd5zKslkD8S5EZKXTqJks0mWkQ0U4T4185RsncLGBpxfs++E88cPohqOvOVba5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719472; c=relaxed/simple;
	bh=vrfhOM3+ysvF/Ll57Tf/JoWnf8bZUNDlRILzcG8aTAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ak5G3apUso+yeQCZW3f21Wi6aKVMKTFu2OnGk6QHCEQoy80lx2Tg7S1coRZqgT8iXBqXwAgm0Ic87qA516pCSVzrUa8qMyMkzzOcs1XRvURT34nz1d02hdr7EpbM6QLPwMiwtl0pneirKTKYy2KC+Mk7gbKv9S424LO7GCRxVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNUbVDRn; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNUbVDRn"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfd122d78fso514945385a.3
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719470; x=1775324270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=aNUbVDRncgjlPAnRfJutTCHPvPbKSQjWDZk6AZAfXwMemwKPZCSUw6hyFwCS+iQTVV
         ia1TU1ucwfjzf36WwhJ8ildFD9igQ/H2TrWTXRoulkD2YRZr1WXoGLkZ7bb6Qlky5eKU
         tFfgsFgNOU3Ml0NXn/jBTeV9mAy7bDH7osR2LhaTQBS04S7JIotvD2E5ghWiIZfKj2Tt
         srv7iUbug1uIfxfauJleQJJxgXCO3/Kjjg/UwuHeJdtNe13Roc2EGg2uDpEnm+TY36Cd
         IsvW3jvu3QzSYcm3Bh+QyYGAa45GvaWQIKzQDLq3vvpvUJeTNXeQe26KALGlyMkj/7By
         NLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719470; x=1775324270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=ZNfQCrPlSPqm6TGy4yoA2jHwB6pig7bKlRnumpIgc6XcbaD1Rg70LmoT1q+DJoQ0Ch
         p17FMMPDnMSMKBiCCvTF+2yRrKyJPL4Dt9gHiSybIa6q5EYTatPtFD8UeX+IChXtyXLF
         E6TD1L8rkG62Pt2WwzeuymrChNrcwgKjlojROlJ12RdhPa+OuF1/Zduz0TwMYtJW1bar
         jzm2gJRDe+NF2hgIoAJSvd8LGSkDHhH9XBK8DARsljRKcfMQbOdDJjav4UdEVMooUsLz
         MPI2acvc/DptrwK6DCZUfE9X6vZdru8xGaFODr3oeCuqg38MfX1tDeJ4yo4q13V1tQiz
         SdTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp54j2aLPgFtAlq7dSsd8zGrNjKCgFd2Gxp7g1S43rDVDG310WcQmaI3By3j6tyDzpgMcaF8q4KBNy@vger.kernel.org
X-Gm-Message-State: AOJu0YxbawG2hXpOpVcR+7oEWkWAmTKCyes+8qxf2EYgZQ+dyrQO7yM6
	2jHaiXsVI7YswJejAB9kRZg0lAabhwKqDvRupbNohZrF+5m49ytPyFXe
X-Gm-Gg: ATEYQzwnax0KdqYTBsmmEOj/3nLoDRfiPs2qlQvBydwb+oCMpqLzEXWvffJM8jTAkHI
	oS9kQZ5GgofpN1BnBDH6sicZWXtZgTXNqULk6AXY1szPgvxWyEUtUUkLwFIflOB+1JArqapN+6a
	hLybqGiDl60BRs4dIDizqhjbiGvmRpVM8jee26xVWK+AyDU2sZZ13ixVKUcjwcyjh7+dzObGaII
	TfpVTtRrII3yF6ezsRVyjnOXniW5xuDRaohJxLAAXx/pInzpswb4aGEO4lkrgTUMSTHMxkTnMYm
	EdXnR+mis1ufzeL8m65w/uL2r9OhMbE4N2Y7roKAT7GFJjARKGb4+OqRERhRUbH1JYiJnHThKqD
	s/Sma9bysiA5azI0TB1uviw6cL3tmn+/NFOdoExTkExGOUY7acLrZ5oZ7nVD1lUbAP0EG1LVXMx
	WesM+9tlX2r1NyHvWKOKaSl8lA0JoeRlHL9YET0GzKH8QWB5mniGp7l8fXhQvsovVjHQE=
X-Received: by 2002:a05:622a:1e1a:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50ba385b769mr93585621cf.27.1774719470058;
        Sat, 28 Mar 2026 10:37:50 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:49 -0700 (PDT)
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
Subject: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:47 -0400
Message-ID: <20260328173450.219664-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
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
index 0000000000000..4ae44b40f9edb
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
+       dr_mode = "host";
+       status = "okay";
+};
+
-- 
2.53.0

