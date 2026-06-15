Received: from naesa05.arrow.com (naesa05.arrow.com [216.150.161.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A073E8678;
	Mon, 15 Jun 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526030; cv=none; b=t3PuK4LKNNQpn3YOsSeMePgTN+mPaWfSsIe1jc8giu6waxWd+fNCkv54h+bkBXlpv+oGxOT1ClXxfS7y5zkQm5TW2AUBCCmmANhKt9uEEgwXsk2D2le3ZrhtQbMboeYIO0NDdHrmDhH0VqEDiHL+/IEe1YbpUyl4zRR93uOfFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526030; c=relaxed/simple;
	bh=fG8E29qlwWg/NO1tdQVKlCDg7btJ5WrXVmkAEUtVAdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCl0N7aJYgEA56jLKRZga4pLrRm4+HgPlU1GtA7ZhnZy3+KIdHY8I6lmvqaygPwJoiHkhvJqXR542w99nMoWx8W4Ce0g6S4Pd6nfnq3CHFLHltwTtGUltW0qivqW720G3KXawmkXHglqicV0inZZ9lLdheUEmq6B57k4pKq5PdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=IWyGZKHj; arc=none smtp.client-ip=216.150.161.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="IWyGZKHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2449; q=dns/txt;
  s=NAESA-Selector1; t=1781526028; x=1813062028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q9lQpwaA0Hz3D57THFfabjgfrQUdMfIc8XvBfqBDOG8=;
  b=IWyGZKHjDPVcHpomH1Sqba9JK+mi7iKFL73EILlz5evEzFUETe0/Bon3
   5Wp0DSKKwvI0zNX7NVliz2b/adZw98PCaYHTvWY+5ZY62LDKPJL988c1+
   7d4hUIZynpMzEecsN8HoctWNJcKwGgSLAvwEzQKCD3upaKb1IqAwV29e5
   pNKI7CHmLrEpfZ0SxPgJhRIE3wXYeJG1CzAtgCqS0pNYqfCXecJsHSQnP
   seyJ0f5NIEBv2j4Yz3dkIeY2BZoIvrRtdp0q2CxkOkYzEfX8ByH7Hc9eS
   hRnX/hXdg0ZQcM8p6W+2RapxZ0ggRA+JNo6T+sVcPa+MEb7s8JeWCs8aR
   w==;
X-CSE-ConnectionGUID: oJteXpTOSuWWGk0jdC0lYA==
X-CSE-MsgGUID: +azUmjJkTMaxi0ikW93QVQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984212"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:27 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:17 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 7/7] riscv: dts: eswin: add watchdog support
Date: Mon, 15 Jun 2026 17:50:16 +0530
Message-Id: <20260615122016.1110206-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jun 2026 12:20:17.0084 (UTC) FILETIME=[534EE7C0:01DCFCC1]

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add watchdog node for ESWIN EIC7700 SoC and enable them for HiFive
Premier P550 board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 16 ++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 40 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 0f0c98474c62..a188a5e1d526 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -193,3 +193,19 @@ &uart0 {
 &uart2 {
 	status = "okay";
 };
+
+&wdt0 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 28706431b2c0..a59a9932be0b 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -265,6 +265,46 @@ hsp_sp_csr: hsp-sp-top-csr@50440000 {
 			};
 		};
 
+		wdt0: watchdog@50800000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50800000 0x0 0x4000>;
+			interrupts = <87>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT0>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@50804000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50804000 0x0 0x4000>;
+			interrupts = <88>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT1>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@50808000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50808000 0x0 0x4000>;
+			interrupts = <89>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT2>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@5080c000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x5080c000 0x0 0x4000>;
+			interrupts = <90>;
+			clocks =<&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT3>;
+			status = "disabled";
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
-- 
2.34.1

