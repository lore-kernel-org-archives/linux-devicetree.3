Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494D3F39CA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145671; cv=none; b=bsXTN0NE6YrcRgeZKsC++ozt+q8xWQSrwVWPcmkeaFrRHt5RTtqNVanjku3HQBhJnf/xzbItbjepTKCgNif/4VjVQgHcTg3jTtL1uRLes5c9kRcbCLhbRbCirusyq1irTdHo+W2ac2albUZ7CJkOhfCdfdT8pmLSWyUm/w0+2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145671; c=relaxed/simple;
	bh=re99Uw5flpooZI4bdaNzxSOrwxynerNkjIFaOSZ4Fsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsqUsgOHwRwLjZdEZL+npBBIHzYp1S+dyPco+QbsvynWlvG6BfPBWxwsy8RE11w37hbJetaLO6yEAJndynKcwTzQa4mXtFeB1JQpdTA4Rmsotp5kUDlGuUtNBi5mf0x1mWjbQZC44HRLCF8Edjqc2h5V4V8yBCGlxFB4bQWpGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0tD/HZH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0tD/HZH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ced3386430so25340345ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145664; x=1785750464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=Q0tD/HZHe0gsKv5NohZkT3bEgnHU/OyydUiOzgo1K57Ws07OIS51HL5+WC1nMVQ49m
         GdWCCfBAkgTEVor1ipC1hUta0mN46a+UseYQn6euyHgJbq59UAprAVdbXX5XAD7BE5go
         E/VxYW2BV80zGt5qwTGc8D+uK2wJiqK2FVD/efOh9OEH0hXc2XkL3x0px462LzbonEsx
         3QN4bt+fioMYfyXFGGgKf+0h/Y2NncL64EcQ5/IYznXhrrKTqyTzASB+HNpRaFGA8L89
         mo2vozC4LUFO5/UEi+8w2jQi46JDEpo79uQdC565P23EUK9SxzqI3TuW300mMF+FLAC5
         cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145664; x=1785750464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N52ZF/IjKhZBIW5738KSh9he99B/S0uG1hHgg20oHU=;
        b=SYIFBod4GwAkt47hnma+6OA95a9ZKIqYNlByx4xPKdn+VfTHG2QMmBlvs469XIcBGR
         PQCrG17VM3Yc1ItnivLN69709J3SPSiH7XDIfbu2yKLMCcNehj8ZgajW1khjDJoNFIOw
         cp8ly7ayvFO4JDlIBaxysVyvRCjuQuDwcwK3KdDe3UuRVBWRTGo2+nPdCbsoyxMixjQv
         1QahYSji3PxSslpXOU64OkzMKzWCw3uVlpAPlFNC7jfdeMVPYQHXbAyPNKfZHgG8sOpr
         +xTOVQfWrzK+/9FFYruq8W8masQq6CYxZXokwUyLd6kxsEtRxg2XPPAB/LXhlQ90UKzm
         r4sw==
X-Forwarded-Encrypted: i=1; AHgh+RpfFsNZprw5iuQUkiRInwLRklZUgHuRsKP/xxNn7wprdGzgxe9eFTJtEKXRvMGKN//aha7jUe+STMkv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/8yzCiYXkQYZkGvWXV+5aEpp3QDus49s1fyCeggnc/8rNv5HZ
	dGw3YM9joqmzoUHx9VVBEk2mNMkN24XY2se4EjvCZvs85eWl3t6NkCd3
X-Gm-Gg: AR+sD10g6tlO/YJFOSIi3+HTiL1aHdqOXfywlUyf4c3khhMm5OWVE9D8lAhdnZyHUGz
	xb3bFYfN6XNjFwnNgUOr0QKVwpTkltM/o6lnp85auEK24xCRhK70aSEFS9GjzdZSt63UrHYy163
	KNfg3C5rhlvJNmOi1QgEhVHvWqnnSBX+Im3ytbtaEkI+zz+UdNGhlSyFD8Hq0lsKr276c+bP/gb
	Hs3fqu6ZxprLmpFEZhU4A1AOG/ViN3jN0E1DnxdgkfUtVSz4w6uDlVmsqWRDRY6+H3YU1fAp7OD
	Sr/SvICXU+BtuqUwz2sGXOBnq/MwprPrrWDZFUWFtI8IHYPAa1z14xUcDlYqDLONhH9edsF6gkI
	nCdoRoj1BeVmvgLx+h2+M8ebwjZJO3UPpFg8drWXHxmNtfKDHK+7Ajo2DG+OlK3Z0U8WzxWO7Mh
	9y
X-Received: by 2002:a17:902:fc46:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cfde851bc2mr78137205ad.24.1785145663832;
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a0asm31819215ad.34.2026.07.27.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:43 -0700 (PDT)
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
Subject: [PATCH v2 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Date: Mon, 27 Jul 2026 17:47:24 +0800
Message-ID: <20260727094726.890179-3-inochiama@gmail.com>
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

Add all PCIe device node for Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 2a6d35a64d5c..1eb5abbc61f9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -205,6 +205,44 @@ phy0: phy@1 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie2_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_cfg>;
+	num-lanes = <2>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 2 PHY_TYPE_PCIE>,
+		       <&combophy 3 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..68aa21a5279f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -689,4 +689,37 @@ uart0-0-pins {
 			drive-strength = <25>;
 		};
 	};
+
+	pcie0_0_cfg: pcie0-0-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
+
+	pcie2_0_cfg: pcie2-0-cfg {
+		pcie2-0-pins {
+			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
+				 <K3_PADCONF(27, 4)>;	/* pcie2 clkreq */
+
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
+	pcie4_0_cfg: pcie4-0-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(77, 5)>,	/* pcie4 wake */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <33>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 7863ab7dd308..314dea88b4a4 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -439,6 +439,201 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pcie0_rc: pcie@80000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80000000 0x0 0x00001000>,
+			      <0x0 0x80300000 0x0 0x00003f20>,
+			      <0x11 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82900000 0x0 0x00001000>,
+			      <0x0 0x80100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTA_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTA_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_A_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_A_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <0>;
+			spacemit,apmu = <&syscon_apmu 0x1f0>;
+			status = "disabled";
+
+			pcie0_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_rc: pcie@80400000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80400000 0x0 0x00001000>,
+			      <0x0 0x80700000 0x0 0x00003f20>,
+			      <0x11 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82c00000 0x0 0x00001000>,
+			      <0x0 0x80500000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTB_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTB_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x11 0x80010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x80110000 0x11 0x80110000 0x0 0x7fef0000>,
+				 <0x43000000 0x16 0x00000000 0x16 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_B_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_B_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			max-link-speed = <3>;
+			linux,pci-domain = <1>;
+			spacemit,apmu = <&syscon_apmu 0x1d0>;
+			status = "disabled";
+
+			pcie1_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2_rc: pcie@80800000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80800000 0x0 0x00001000>,
+			      <0x0 0x80b00000 0x0 0x00003f20>,
+			      <0x12 0x00000000 0x0 0x00010000>,
+			      <0x0 0x82d00000 0x0 0x00001000>,
+			      <0x0 0x80900000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTC_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTC_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x00 0x00000000 0x12 0x00010000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x00110000 0x12 0x00110000 0x0 0x7fef0000>,
+				 <0x43000000 0x15 0x00000000 0x15 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_C_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_C_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <2>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1c8>;
+			status = "disabled";
+
+			pcie2_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3_rc: pcie@80c00000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x80c00000 0x0 0x00001000>,
+			      <0x0 0x80f00000 0x0 0x00003f20>,
+			      <0x12 0x80000000 0x0 0x00010000>,
+			      <0x0 0x82a00000 0x0 0x00001000>,
+			      <0x0 0x80d00000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTD_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTD_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00010000 0x12 0x80010000 0x0 0x100000>,
+				 <0x02000000 0x0 0x80110000 0x12 0x80110000 0x0 0x3fef0000>,
+				 <0x43000000 0x14 0x00000000 0x14 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_D_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_D_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <3>;
+			bus-range = <0x00 0xff>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e0>;
+			status = "disabled";
+
+			pcie3_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie4_rc: pcie@81000000 {
+			compatible = "spacemit,k3-pcie";
+			reg = <0x0 0x81000000 0x0 0x00001000>,
+			      <0x0 0x81300000 0x0 0x00003f20>,
+			      <0x12 0xc0000000 0x0 0x00010000>,
+			      <0x0 0x82b00000 0x0 0x00001000>,
+			      <0x0 0x81100000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "link", "dbi2";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&syscon_apmu CLK_APMU_PCIE_PORTE_DBI>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_MSTE>,
+				 <&syscon_apmu CLK_APMU_PCIE_PORTE_SLV>;
+			clock-names = "dbi", "mstr", "slv";
+			msi-parent = <&simsic>;
+			ranges = <0x01000000 0x0 0x00000000 0x12 0xc0010000 0x0 0x100000>,
+				 <0x02000000 0x0 0xc0110000 0x12 0xc0110000 0x0 0x3fef0000>,
+				 <0x43000000 0x13 0x00000000 0x13 0x00000000 0x1 0x00000000>;
+			resets = <&syscon_apmu RESET_APMU_PCIE_E_DBI>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_MASTER>,
+				 <&syscon_apmu RESET_APMU_PCIE_E_SLAVE>;
+			reset-names = "dbi", "mstr", "slv";
+			linux,pci-domain = <4>;
+			max-link-speed = <3>;
+			spacemit,apmu = <&syscon_apmu 0x1e8>;
+			status = "disabled";
+
+			pcie4_port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.55.0

