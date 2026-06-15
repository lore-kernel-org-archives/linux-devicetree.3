Received: from naesa05.arrow.com (naesa05.arrow.com [216.150.161.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472E5354AEB;
	Mon, 15 Jun 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526027; cv=none; b=hEPZVkm8dIgSFYr4MYVyMESZf/Wt0LlRtFtBId/ZEEn6Cr3fiyMxQlXuv/lHnGsv5rEDF1abWATpUTilnKQwfyHSAJoSh4p4cB47PRDvQQb2weDHY2XC2Sb9v8ZDGdYj8DPfCg4IQPRFORpuTZbAMY/XdWTkGD6qXIomFeWSHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526027; c=relaxed/simple;
	bh=r3KVjac0dfAixKGN0M9PcSwDE+/AAZuGqwZGlJwlqpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qXVZUvIcam0lnnGc4OdXloslGqNWFpg6zomX5570zqBIy8101NXIZcy9sztx5YIU7ImK0qk6Np5pj0eFD4pW2Bz26muRjvquEF8RFWx9Cdq4BQc4QOlVaEAvkdoiVJV2IyKgZdn6O1NceEVLP6YFxdyr2d3vXnRSMByW6+Xv64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=c9ID4DS5; arc=none smtp.client-ip=216.150.161.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="c9ID4DS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1125; q=dns/txt;
  s=NAESA-Selector1; t=1781526026; x=1813062026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hT//GF9zeXsEraSo0H7p/1xw40IC3Pcx/rQfarynoP4=;
  b=c9ID4DS507BoyDXXM7o6WP/GLACC+iUmC/dVO+SGvk//2v7LWWkuj5dX
   a5eeNayMN6t9nPMlkThxA3DY6uDicRpS+9D5bU770wpDOswTuECcyOI8s
   wdjlIy8KqS2lOZk049/fjFTa41tI4xEyrL2ggofdxC4b5pIu8FELLPcBD
   N4xPZLeSk+jJ6PUI17hVlZKmYH0ErEMm7XsnXvd732ISEUGlKjc6E8n9M
   6ggS+ufpHr1iWcI6VajynnCm7QjdRQUeNjfdvnQ8lxdAxOIx5VdBjT+qY
   KtrrSxB06wdcHWqE+9GT4uprPcRW2sXos284igHMk1UH3E8J7BK6lXwfk
   Q==;
X-CSE-ConnectionGUID: gUMV848fRQuJ6mOYHshQGw==
X-CSE-MsgGUID: 7cuz4KxQSvCxoIf16TmHnQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984208"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:24 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:16 +0530
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
Subject: [PATCH 5/7] riscv: dts: eswin: add hsp power domain
Date: Mon, 15 Jun 2026 17:50:14 +0530
Message-Id: <20260615122016.1110206-6-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 15 Jun 2026 12:20:17.0021 (UTC) FILETIME=[53454AD0:01DCFCC1]

HSP CSR is inside the HSP power domain. HSP CFG clock must be enabled
to access the HSP CSR registers.
Add HSP power domain node to manage hsp cfg clock

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 8798c50f7584..f8caf39616b2 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 		};
 
+		hsp_power_domain: bus@50400000 {
+			compatible = "simple-pm-bus";
+			ranges = <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
+			clocks = <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			hsp_sp_csr: hsp-sp-top-csr@50440000 {
+				compatible = "eswin,eic7700-syscfg", "syscon";
+				reg = <0x0 0x50440000 0x0 0x2000>;
+			};
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
-- 
2.34.1

