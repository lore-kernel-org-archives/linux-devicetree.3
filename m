Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB23A6EEB
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719480; cv=none; b=GHcSse7fGfq0P7k5sJEfX5hmqmUbC/phJ+abPWw36sDUIQZ5lywMLOLMh7uXX5jMY4YhgmZcXAQ4K1oxFGfUyXqVR3Uhz6bRnNT414mWHrkdiVMqCVYMA+rikZ+5YHzjNzb4WhZWxSCNpMqo2SJ+iUWwjdf0/gZJtc3mVaeTZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719480; c=relaxed/simple;
	bh=iKIxZqfsu+EMIToJywvJpH4PHUmMH3CHONIBEcDeehU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Khda7HvG6WPX7TQ0Yvb3XVuFOydYI7YFRmS/U+ZjvFTbNrwXJdUuYDEOhgT3zlgqnUxp/Rt1396azGQMQXX/X3CCdMKJKcBBCGHqx4NEUKkylXmQKxUCANzrRdfJP0ibAeqIlLpjVulgheDS8Bn9/XNZP+0rBYniXSeu4wyeAio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khdyjHxC; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khdyjHxC"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b3488fb31so55522121cf.1
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719478; x=1775324278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=khdyjHxCTnlRot6KfYBHxuz4IYh86+QfvLT3zOX2EonuFekGOGa5cfUAxKK9hSOT+r
         bhWYBoHQceSneJPt4r64ayLAApROvRWp83QUjhuLISuYdswkrfd7//MF+GfdOqjGxXUW
         +0zbYE5tI9w8cbS/rLDZVSRT/xGrm+NciWvKnNX6rNNeacHuocHR3Qxfq6tyIJGk/bow
         +9YN/EWbwPphfX58K2l05fTOMp967hyQGEkm84hVnpZDiz1C82FI0hG+VPDY+bJTpMLn
         xRx75rnuuimpQeVY5a3DR5z8yRPeIlgh2S+cxqcYuQhgwODAj4fbOIWPUrlnqVVNoO6A
         RVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719478; x=1775324278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=MiDw6OKK/wUwWLoozIugF5HMX2Ivb8Nj7OFYyfE9zoMA7okG7Zr+SQnAVjV0/O9Cbn
         Za3OAuujHNFbewqTFNBmQGb5VWjAIDKWlTAItuReC921qD9AKOCru1RaFsZZEhnd5fqW
         KlvHcDy9mGTg8dt2rsWzmubpaLHukMAwOIUJF9yrXyJv47SoKcedp00CJv56MEJZC+N9
         KaS00SL3eJWwA3CwwFjN1dNG4gxAqCX1p/brJJsZW0fB4yY93gW/ii4YItsybPjG9S8F
         0ul1j6Mp+vGVqN93uucKvH2k8N9KfXGXu7FfgUvVDajOSUIAmCVbevwHQiqzEBnDXxXa
         lqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI33GmFMexAJF6rWN06ywLHpLHe2Uz0xzzs8iqYT+nRIP9VTat+/dfpmzqrW+pdvIfT9yJu3gncS3Y@vger.kernel.org
X-Gm-Message-State: AOJu0YygbCVGY9mDnXWq+x3Z/VhVaFHnBfwCHab+iXM4WkC3tsfG6DTh
	aoPbAlPtG/YxRfmhfaOc507qeMLSocXvioTBXozD0tY9r33IyLBM/QhP
X-Gm-Gg: ATEYQzw6klLNZVjIWR88OwULM8oc8SOR5QaWym4vBfy020zEHEsHMBaZMyMkaQDqATf
	/dgsdDVxrL+Q9NkVON6EiO/SKmUaJ1oeCG7rBUiGp4SRHPFLrtfB3Lu+DLhasXjMli48FB/OWM4
	yYWhzeiQFzG8KLPW4tVLvL9UjngHAASa0uhLDz9H9l0kT6KffCH5mEV/uzYwq3Aety77M/9MIIW
	dpv4LiwiG6mkhC1a9VTvFEOsx7wCavyHnrfm2/eAKty9oXmBEoiJgXa5ZuXx+aYLeZRdSyJ3YpX
	wGoPFmhJ2ZjQdDiJS+Dfm84e9FQ2fhccHrXEqOxiM9rw+4TPFbLhnIrkkpjWFxx9MMNZ6ClCDtA
	cBlivUoGpuDNXfyLO5lfRO770MWwPLRjabwgRhVDIY1N7zANf8WvTX0zRPgvvgo7Lq9E+tIs6Mq
	d0jUM48gWSXpGY2RPv3cvBeG0Y9E/j/7cijvIu58lwA9G4Ce8Tqj9KnVol
X-Received: by 2002:ac8:5e06:0:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b995b5a1fmr123076451cf.42.1774719478554;
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
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
Subject: [PATCH v4 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:50 -0400
Message-ID: <20260328173450.219664-6-josh.milas@gmail.com>
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
index 0000000000000..4ae44b40f9edb
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
+       dr_mode = "host";
+       status = "okay";
+};
+
-- 
2.53.0

