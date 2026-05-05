Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB95240B6D3
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982541; cv=none; b=kSgNnHKycW/NKqPzngwwRzAvMJlSiCAiis1juCfIsNwILtz7/sLQww2LhwNtvTsrQMs0XIvuRwIO0bwpQT36StfghOQmfUxEqoMucfDmhSzSt3mZcPzmAEkKl5vO73pU+ePzyDUebFY2ATNvNnohn8azJATpaA2ksi0b5nOJ6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982541; c=relaxed/simple;
	bh=nyDAkXQ297bC2hhhcyANjebrHdsEJhyDOOdv90RCoCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epYwpG6CFEm1AFrC/HUIQ4wmAxM9n7y67l/4cPLCN6zqMZLSNtIX633k5t8O4BYpYmjIM4yaIOf/lqE+lp278SIkHDmEwwCa2aqJvpKNByQPF/F67DYM99oMEJeTJtjmaf+GpEZt4ZodmVtPzPkRqUtMajB6bVdTO/noSbsSx6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTeD/7FO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTeD/7FO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so5949874e87.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982538; x=1778587338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaJj/oLXLFqOqhgdWNSv4aF1pZo4Id+fK6SJZ89dQWA=;
        b=aTeD/7FOVF8hvdh2HqJ1tZfzz1oXRgcJsqOxFMWLDWjiJfWeOesPy42uD2Z3RzfBTM
         vaadz+4/ntzpu6CELRodNp8Glt5xdwcpk5EaduA9VPVrwOA0UL33RZCSTwH/sRgYCFNy
         ssjtCelNgcAitgl1bsS4jAcilwxyvdX5wT3FjZEoL/BqkxyRBI3/JkVQKNUaMh/Fp1HP
         7/c1eSVE5LHVvbSlx8Gaxko7EXP2huUZTCfVlNGBY1d+KCuTMMA3+SlcSPzNU7bSby/A
         23W18lJc0DFTl/D36mKPD7mE1fw2VbsIuiublNA416WtcA1AsmuLYxBSJ9pskyqwxfS1
         X9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982538; x=1778587338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaJj/oLXLFqOqhgdWNSv4aF1pZo4Id+fK6SJZ89dQWA=;
        b=LNo7S+CsjMGVN/BZUutDB9eeK23mmPV8rzKCSOCizn5o4DZ8xLo0FGHGP9KVmywwlX
         k3eRt2Wi7g03PnWcl9j+aFUBSmhVgcCFYSMJeJLXRPPDEjEVQfjBiNM428j9whBCtITs
         CpARfkpOmur5Q7e59/0d+gklKrX0/VVTt/PdnnKgxlvL0vfgLd/4qvqanr85KxfCt0Co
         wRrFzpmnyoZmxaX+/jaWwgTThieWqehV8thp1PcW+psVgnB9T9i23n0QoyCpzu+sVpOL
         /6oVRQixuhn8AZCBQ7nhzc/9q4QrBGl1r8/V6LS0TAtbk84yEHl8QEBpnJdeSBPfPBK3
         6phg==
X-Forwarded-Encrypted: i=1; AFNElJ+ON/ATkcXuPQLneiA1Z+0lXG5G+SnOct3oLANU6QNfSpn1GOxr8obp+PrOQGBzDn+YJuWasuD83Xx4@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAdkXnmpQ1kdPfRY+fIIp+J5sv1hSv6YkHcQsoNxIWHRF6id7
	h6cyrKRbpF+9nUgZRPUQu3hHo7CyX7qfIx2+Rlv+Xsah2QpTRwvD5UYg
X-Gm-Gg: AeBDiesUbXa8pQoEjDQS6ZrTM4F33CwDmib4pUWlDdXh6vu+WZKL52rQyOuCeDtDsPe
	W/h30y/bvYh09xEFk/vQ0ZuvabxwN5lqNz5rolkVU6IM+KTqcsIhuMpBnKONQ0/Ja6k95x02J6p
	9LiLowqlHnli1oFlBHrUyZkR3l5CZTpZRI3KLUMvcrRHhnIYwNqY0rCVBaSQgFx6ZHYgfNOEYVz
	oIvFd5Fh6pyOYUYaGAbyyDnVlr4MTxcMwOD4gEPPRhMzqbSHuF5TXk2G0lNnzk6vZvufSz/gFSN
	pjauts4W2PoOkvoClBKPZ0Rhe20iQS1IKDMZIuNQcgJSd9plRGVJhxe8niYpabHDQ4OYsoONrnF
	923QnDQ7pYgirMbRzvfARkY3C5oyYwlVvvp5JYiEar3Cxw6J5mh4V/GBg6AAW48T9ofUdYLN825
	r19VUYQ5rhe96AJ1b3DG3a6ngk37D5G6BaoVNky66D9Q1pCvwo0z9rw/VU8Vq08P4XY9wGPq1mH
	RUJNNCknTCesd4yxlZA7YhSCEqLMeq6i8mVOdGiTG1R/0bTYwQwBqTHFSIVKvMLotRK
X-Received: by 2002:a05:6512:3e20:b0:5a8:73c3:f277 with SMTP id 2adb3069b0e04-5a873c3f37fmr3001152e87.12.1777982533511;
        Tue, 05 May 2026 05:02:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
Date: Tue,  5 May 2026 13:01:51 +0100
Message-ID: <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add xSPI (Expanded SPI) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
The RZ/T2H integrates two xSPI interfaces.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 3761551c9647..a5b570ae82c0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 0x4>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		xspi1: spi@801c1000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 5>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0

