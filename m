Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDD371D11
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145665; cv=none; b=j9m0ivqcirmZTDZb8AWS8FC7hzurco7Dn9n9/iNUCJqTxnL+98zXNNe+Qg5dlQ6QJS7FVpx1o3OM4k8s84cIf6bSLVfaDQtICiFIb+RNBANux9Re/Af45R/Bmt1v2J2yXLXJMPM7wTvfU4XfucY2lWsFoYvAU6lrVGSpyXmpkU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145665; c=relaxed/simple;
	bh=rplW+HwOp3qf7OXyNELEnQynbww+W3JHrQvDBdAxtio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRYGA1H8koyhHV88q8ktF6LxoKeq+2pqOxpFLu389bjVS6Lk+fx29tYEFkBvOzMeveKWMmUiM0zGOttipixOS77sWFXQwT+ZF2R/Uebm00wJc2mWGjwr3X1t0Sug4nN2eyR6fjtVWrXKcGW+CpoV1IZloxOiSc8/CYmWytUxRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldRfOk7i; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldRfOk7i"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30064875ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145661; x=1785750461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=ldRfOk7iU/m6j6O8jqQBvhbUCXeYLRjYbswBSnVMoKchuJtkT9JzF0jXim2gZ7xjIa
         aszaMqOIo6/d4hkb7RJSM+gna3srgXuqxJId8jiNRkYtx5Q2GV09h42ri67BkXl6OTPn
         Bo3xny4gpa23nUxz4Na9mEHNwJo8L4TONQHwa+vANAPO8nPDOhGawF4UMjXq6gu/wk9g
         MdqRtlKHXpBEtpyW3icAWHn/KmziWgfX4D9movsBI6xglDujMSXK+IEUSVH7vlzRNFDQ
         /sC1aCromgaNVYe5P+QPub+EMMXpYOb8LzS4qGO5Yu8WKYl5q8BfOfksQwdNYZs8fqtY
         Q4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145661; x=1785750461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=IGZqVfnQSZR9mDQsyD8UtthM8XEWKFMiK0AhPqCBxyRFOiiRxw3ZKud/DeeTH76LwA
         SiRCl1UYufNFb5DOB+dUP7h1hgkl+6C3t7yGkYZt5CuduOH+9X9PHEWY5m8LqtY8Tg+9
         G62Udwak/cbBpCkNYO5Yew66hERQ9iPKGVLmKV4aCI3h3YytkOQ97Nt7OFNq2vqJGBIQ
         XwJTCzrbyCN+5Dzss+/HZ9IOVWs51vBnEgvytDHPsXKIAuHhq4Z4mjROrFDYc14PhxJa
         RytrTiON2FXhNca6hEHbnJHRbaQUoSnw621SUikWHwdVoNNonqWAkH2+fJjMG2t+sUMv
         NE2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jeMGlhENw9qSTXvMryQBQILzloRr8DcCc/WGPM6T+bkFwpyR9zwnin2BVi6rWBuhZkVOpTydwq8T@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTTjJUKQakysQaAvlxC7s4vpEtF+85KVS57TgNY4/hkXGd9i8
	nqm3Mv8sT/GqEH537m9x3EfThzEfONKKyfUvU28Bw5M7+PzCtuXIlCEC
X-Gm-Gg: AR+sD10QOEAfEsaerylBs0fFgNEJShkjDRxdnf1hEhz0PfMG+R06XM6beGwqtjvij0e
	4O7Avvr6FsU5n5TfmqI+HUG0L+3WvgbdU7ouSZwQPmyH6U+4FeHWCzZF6gXuKplPrAhIz3RLjsP
	ox5XkuiIBCMdsRw9+oERpdg3BLFqlxmT+qOz6BvOpp/o/NUzO6j3j1JLn1d9vsExzVarY3KythD
	GLWiXsQ7nHSaNXpaw2n5lgXhE3jSCc2KbgaL82Yucu2OhwXl8I/nn/gu1ucn5SfYhDDCUZ7JupN
	Cc0akJgNu1cMPbVHWLGG7p35/+d2oqSvS5gkho7f3S9+G5jR22OJdcSphBmVjBiiGqjojs7Hpn8
	elVByLaSdjpMFapTF2dFUPcafsBTLbG7hH435lUMgHfYqZfXTs02Jg4/4BBFf+QSNFBRganyj8D
	hY
X-Received: by 2002:a17:903:3508:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2cfde7be87dmr72267495ad.17.1785145661135;
        Mon, 27 Jul 2026 02:47:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc49sm31701585ad.7.2026.07.27.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Mon, 27 Jul 2026 17:47:23 +0800
Message-ID: <20260727094726.890179-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..7863ab7dd308 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0

