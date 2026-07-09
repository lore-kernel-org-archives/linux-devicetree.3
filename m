Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6434A78F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569904; cv=none; b=T+HSUPJV3a8plLpEjeuXG/f6XTskG6H2l6fAspT5BXKgI00eXGf9XLXFkU2dquiR16eYfLNEoWiHSfR6k7hbmzIMvzaTyrnBrjcra4Ccs8BBGyZDkXTnKq8yG+rBwkQi4LbFyvuvmHQQzO3+bb/MSTwsiezrTkjHmdFSMkXxSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569904; c=relaxed/simple;
	bh=tfVr+NF13X1N+uPpE0gkMbM+4nUXNcSV/zcJLFnR9q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSRnXTyGGF/7nwDHh2SLXQLxDZCOWxhy18qc+ipkq78PDVNGjJlnE1PHuFQ5ucglIaHkhpqRYw6cz36axI0fKHCZHwR9LZOi+zCq2HqNRfErhZGwsqYIaZJMRvTMQHLPJBV/YrSITOB26LaElXpepq3Zdntifnw1Yggqhh5iul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X89rJrH0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X89rJrH0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so508995b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569902; x=1784174702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lkRwsHLNpgYt1jIp//joS32o1quiaFJu8sJahi9Pc=;
        b=X89rJrH005F8pvsds5T1O2Ddx36+89H3mp0hR8b0KLSC3OcW9k3RQ0kJF24pOlQKws
         GVtQeIkvLxWRIDaWYug/+eHU3dShxBBlHTuA2vLmoLBcBdZgWLnf97hOu5/QqXxQwSSK
         XesbQzbcqW0FoqO6M3atK2xLNoUQlgUrULKiDKj+eDHvh0jYvsZGcKxKI9ly0sMbfc32
         9Qj0y7JhHW8q4IUf8eG86n0FlAzxolIwD7+yXC6CWVn5xiGZP1bg+DbhA1zTqXDdC7Ki
         mFZyJPtezCKCnXgtoa2+HodRSKo5PlzcK6D/qRTjz29jHf75uXoeZPvRumQtrAiwOvjG
         cX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569902; x=1784174702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lkRwsHLNpgYt1jIp//joS32o1quiaFJu8sJahi9Pc=;
        b=B/Z8Y2lXSmMsmSm6JYkVTD+UYnjoE8mKRyr43sZ7uN/Xwyuj00uVayfydYLmupSMAc
         j+m6Sl2RiwahzMqrjfby8dli3sGMJCZqKwbgZmcq+sb5HxBllwg+Ns3IPbPFvcq4gK1n
         WyEBT8nplvg1tD8vrXAJc+YGCuiYVlP7yH5YEmuaQqT0OtngrUmsWrh1EUZosw2bJAfx
         3jMFH1wD8xL7dVK8/4mEX2JY4wWDODymZmqupzxL5U40GefAIRWS4dfa8Q2iRD6q2/F5
         sm8b9CNu1KTfv4BBcFwRrrme/w30fvZ7HJ34vPfTJ+KagvV9pq/bJe2cZObn3H1EC6RN
         HTPw==
X-Forwarded-Encrypted: i=1; AHgh+RqilxvJ+Il5zDmfoMmehtq6cA3cstSBp0gEE338v6R7ihjzFiG0R0XPc05WhhHcsvwGgURpO+ok/2qS@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeXdsKnF9NqPQZcIbjBx3mA7+zlUPuseTy+H7Ao/DtBnTTH44
	jS/H68Sbxy2fhEtr3Wv5HaCBorA0kZCkxSuLyRtZ6BGbiRvLFXUf9lPg
X-Gm-Gg: AfdE7clC3tOGikt93LGaP8SrjWYdFRokIdDkRy5Q6gvumNYK/Cu4pjCYccQ8NevDIaQ
	WhSVVeP3Ik7/qqC6dMUvw8EGKszn6p3TFabU/0YOpTdJ+93BzGnVIaWwGSzyk4BUc9MQlqarhhz
	lOKY65dmVQzvv3TRQgxP9lbCFzb3Cm6FHuXwxuvHu9bUsH79Sh8VJvg9qD5Hsiqfh3LlnBmAdi8
	Y3e6vu7YZrOC+GEEHcwvJov0vOqkCaBk+oGY0aGB3om8jjHNZpxDlYDkm715uXgmk0wOE6xD2/Q
	J1RtHnMDlOUQdlsIh1RYM0Q463cVYTNjx4o58lbBF19cBV1/mM1+ssO4DFBBL1WSUHE8rvfidmR
	29hTonAz2HZbegPtx1QJUNUdwAf6zGm0Usi5i+gCBPERbXxSW8SaT0qutfUQIGh+j
X-Received: by 2002:a05:6a00:22ca:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-8485aca3bd0mr1379223b3a.36.1783569901817;
        Wed, 08 Jul 2026 21:05:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8485a44876csm335615b3a.27.2026.07.08.21.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:05:01 -0700 (PDT)
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
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Date: Thu,  9 Jul 2026 12:04:14 +0800
Message-ID: <20260709040415.977784-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040415.977784-1-inochiama@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
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
index 82c9e2da82e9..53cfb2ad48cf 100644
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

