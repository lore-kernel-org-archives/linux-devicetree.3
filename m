Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193C038BF7F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261095; cv=none; b=FM+vCaIpMc0iB7jziw0CWxtnN+YexSKKTM1qR66JdQ6lJZA1KQc8JhnxW1xoSCRspK1oNr+52h8T+A/lYwbIVAos2iBZXl7JPB0Sq5TyeOJDc1rqPaVS+ft7PfBnRbMZfVpWPe6SV8GnT98Nx4h34nivRT2FvOO+hOp2DAcGUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261095; c=relaxed/simple;
	bh=eukNjIBihqnDwPVnfCgWbR1V8gBGtpQkVjwyh2mO1Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATUdOkFzfUeqUE0hHRosNTIXn4wp6Q9q//qVpMBjs1WmdPzbhodXNOB5BVsTCD+fm5HQZlQNqZoAVYDHKtOptSjY957hvJVJ4Gt/ouCrXO0Lh5/ffBYUp595Qq1DPsJKmPTKMpPg8yKPvvoJm6A3hIVqxXU3N2guTqFokUQGKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+IgKm3p; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+IgKm3p"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a655cfab5so2581827b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261092; x=1774865892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=f+IgKm3ptvWdQNmJv/tjlux77XWuQPn563wmJLgyBWy581I4Gikjaqrdg65KXQu7st
         aSSTruk+F64rk7LP+smXi2xvDFPhqwY+GJSV5Q6ZxruIuzCRcADQehD6jlQuH02B29UC
         VCdFIsjvlaUq26QdrmVJFuJCUQG47GYxfVYUjI06c4Ymwoc0gz3HgW2fMzjjsNEtSq12
         AufyNqwzeKVH/udHtSuscBrlx9Dn+LUyF+vCNamk5ez4RynO8scf1WRMIoP4th4np3br
         U1e7BC8GofxLf48da/ZrvQycPlGnjaikUxaH8RUcw+KSd8mbfb++o+p4Rynz8UPqYC8h
         QvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261092; x=1774865892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=dioUXZmUubkQlkXB1Ok9kEilkW4E0lF+EpoI0Y56FsJ3HgdmZ/Ulc3EH6zKj/PLquN
         261Y7TMxhCdW7zSuTa/tdXJGy+D4fzfpFJvXWZ2hiLidS1W0qqL/XLWy3pLTbznOku4y
         DpIDu3HTUT3oQQxC436uID1aeGQtQJCOj5WE98vVdnLMRRHOam/uIbO4ntdiEUuHPs2q
         IJU7rJYMVRJz9k9No4a0HOpFBJHBDjMqvM0b7oNvMYyWHTAuD84zJgZjdHs+sJ65ehaa
         PfjetrQNwEZp8FtVhnT1hS9pw0mAfmyrr+c7CF7mjFidPMbp49Mk2oCnOVVmhupY6rVz
         DJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUD8C+ELu3fGSszHZcuS179CBvBDoKlowNLzjBbJTJEYCIN6oN1kEZ6AS26+kMG+6OgjtoRAcrI+V4J@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBV72V1JwUIjzdxIw5F2FbbDLnH7W9FiZLun3bGnZVF0Viw80
	hvfo9eJrnZCjXyawIHCezSVV8Bi0ChHmV48FgpbJNimRBQWDv74YEpXL
X-Gm-Gg: ATEYQzyAzXq6IOqoPaBGOzDBunmc26lqTAO+1w7cfC7ass5yRXouoxPwSnFPs70/+bc
	G7cdAmj64dVtjgdCD8zdiCU4fXhMerJF971jKJavkIj2U96fGBOku3TfTdiTFXKiK3KFKhen8mb
	MBo+xF/MQx3dEg8i7QH9QV2pGZDT6z5meLPQS4COrZIhyjV2M35v1kUK4ZJ7t750JKnoBYyodG1
	t8LB21TjvxEMtSNPrjmyWphDCgoJDwIsfOqReCjo5Y+1ISukSd5Cl6kB0SpKbjuJEvqSfqv8F9+
	vNUUPtXftoh3S6TCuPIp0Edkq3BllbNPZrazew+9a+GDt3sNYYZsyHjpLYPMxgU6d7Jzz7qtSL9
	Tc35LWRh6e84BL0zDldwYcFNZxZ2KbQXVNEto4STSijXS/oiNwURQk4u+l2HnNAZz0boTnmjvGp
	wjkL3yZTo62wcRjjrXszMpWak4BOFdtSk7hSbL0J6aKp20s+6g22dxoa60Cmc5knrNSaQZFA6G8
	5uD3D53l2r2
X-Received: by 2002:a05:6a00:23c6:b0:82a:899b:d804 with SMTP id d2e1a72fcca58-82a8c353162mr9822673b3a.38.1774261092458;
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v15 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 23 Mar 2026 18:17:55 +0800
Message-ID: <20260323101756.81849-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 +++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..78534d613486 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,26 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a029b660e8dc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,25 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7228ad4735b5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 };
-- 
2.43.0

