Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49C3B38B4
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162539; cv=none; b=FSyVGKv1GtUswDzDGj4z+sXKT5V+txG/zyJYEa+k6flBk9BpCAcmEY0pYpa0zqFQtuCLaQoQ8qj5gULPM9MQuITW0aZ1vGuJguJr5yOTuIlfU+M9OuNeW5Iw/7LbazIBXh1CZ17C6whowGbn7ZpvzgVbABf06IB33xYf7q54aMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162539; c=relaxed/simple;
	bh=ifciZjFJsSlLqvMHHqbkFJuk8b7OaiYXAH2dMXVM6NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyEg1ioYF7JBPSOpVfcHSQ+vzUjPT1TuWTTipA5/C4Ov60/wB1445RAi/8h85vBmVbnJ4n2vrVYOIlxPuWlADM9NFWoEkGNFVPwQH3e6HaLF8VnOl+J+ImEDAVkSg9P6pllWCKHNwRUnssDBatW15TxZjBsjR663JjuuPDPjI1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2d34jRb; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2d34jRb"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9153e2708aeso100617585a.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162535; x=1780767335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=k2d34jRbMg/bFRwSbQHdKOla8WThiQRzAs3S+dxQB4azETrfXAueJo8flBj1Cq5X1m
         Imi5w26JKlHUZuvTNLLmnFkPCcauuh12tpwtbRxIJnLjEG+5IAEUPpNFovK+OZIejUTm
         fZzevjFoQ32ebudJPA13+sS33/1JVh/jNbHdlBpDRspd3ax57TpNufzPt0IabdZojsqn
         z+trF1yAQWkKgLCa+RYDGewPJY7ymNVXDBAf47/WCwnyUI2IuwKrxhisIBPAmxfcOAcW
         sjKYcW5Y3C+POJW6Nk1zwfwu6f/vQ5k6kTrzPOxVh9R+3w1fDWNlUcan8No4XDWi3tSU
         tJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162535; x=1780767335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=G1JIgOjU+M+FFFbPcTN761DudCjSeHafBX4xHvJdYofs59Z/SW50WYr1tyA/c6mtJ/
         2wHnTMYzpL+hAdgdJRjLW5BFz+cHLamJ0pmmQ2bzMRU2h441AxhcE/H/TKwSUI9WMsF+
         dnjYW4SntneJHf9/yk3VgI9SizcT2NWjFVA55MfRCKUssC3jykArwxpQN2DgZhUYEiXw
         QFQ+HD4WqbYbn3MIxarsKCYVay29K2zsdsMFErCufKAsMbwcvY/yF+QlUdqqlsQLytu6
         Jq6Nc7AI4TXisW/UHZbb2oTLvkrIDnadZakOFuw4Bl/n4CHqDWYapwH52KWsdp/VlYQh
         LfAw==
X-Forwarded-Encrypted: i=1; AFNElJ85h4akYEgcrWvOwtOC5FEXfYLc3cmtPUVs1mYs+vWuqy9ywrj4Idpd1TXG3wujfkbQr3wchxijyHpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMXRdHdhXd07FFKCDhZcATEDpSwhtcGB8R1RROGkgvunya+5a
	PuxknO4P7+BMSz8DuNZQ3bRAyRSbYYuwy96OhbDqhSB8jhTWLGYSRHV7
X-Gm-Gg: Acq92OFq5+pSKEm1N5PIOB/rrl6TFDLR24rGekpKVcDX3/mpcECbifAZtkksR3q/36I
	l96yjtqT2+rYXDRI7hWJNZEP0wbvb2Kze0CKZ74sPnwuG9OaWxoK6tjg79u52iUsHKHtuLESI+P
	fvkSWRUF81JY3Tj8/vdbofc6PBAcwAsE50FkmhBr/zKjY8gzOqkHVaGaj/VuOWG2j/XYfLpIv/g
	0hMTNv3M+HVeDbOBC45nkqLvsOrXrqjZdfSfgNSex9c68rXg+dj8ZHmjYtaLUMRBSN4hZuMYK9z
	xysepNdMFD8lpJo1NkipCZq0OJ9EY8NDwmSl0Px6HzXkNlMC1u/RmquYDJgpL5ZTvKe+bTYXa36
	zyLVMkdFUjsKQHfe/chF62Dnzk5OXrUEX5DcGOfQt53yWEyISmdZSTwcacrxH0y0inikkolPNPb
	6+CjBLmRC8vicfpYiWdUrXXUsrN964MVJX+ORdOkT+XfgH8ryPpmW5UYYtbSxo0HL3HNFbEaDId
	+Bw1A==
X-Received: by 2002:a05:620a:27d1:b0:914:e6cb:1e74 with SMTP id af79cd13be357-9153d99de4amr681017285a.19.1780162535602;
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:47 -0400
Message-ID: <20260530173347.33533-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
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

