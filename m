Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977704C9549
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525471; cv=none; b=j36n3IOdHn1hteQvHhKJVJLwlLRhfcwsSH2t7aMQrzONcm6GBT0eFf8Ib/ccmLCVXIueby+1hIDkgOWHVV0eTNc3se+18La7MQKfjFM/mv/w6UoP8TB6DJ+Z4wB9PfWU2balwtdJJHQNUf26nNdwKGih6LfRoSpEucYHa+K5xHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525471; c=relaxed/simple;
	bh=JZCBeGLfMB8LJuneUZA+6+fLkw1BbiXPSFoC/zVqo5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8oVb8d1sKHEB0FSFOMbwuVjwRxFYpndT8WVTv+3B1Xm1z1qHDvo0nMtcRefaZkfdcJ9A0c3oY2z+CIgqxqDh+BIzG26+vK7lMeRe7sLC5Ce0WkKBF3uHVk5zO8fQ/Pw7RGZW2o5+lxRuugSs1emwmojz7NCRJaCBurGEPZ3Aqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPbrN+ed; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPbrN+ed"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso41121995e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525468; x=1779130268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKbDKt2WJzz1x2UtlmgWA9cf8CPcU+RwykUyEU48Pcs=;
        b=OPbrN+ed5o2+JLtioT9q4xmPZ9u5CgKNeytf2RwllnHQkZSJ0GxppGA/ll8iOymOxw
         EtPp/mOZkxDegFMY4WqpB920b0JqDNewRtAQxQ1nCohE/cqZgaBg/ususHEctMzA2ayX
         Vi/t2nAUlH3N/uCpnQRRsEXmjid+xgI2vtbK71HuITUTBDTW6+VQPNaI4DjTr4e4k9rI
         bv9KXeAzTEEzcpSoYNJ8seeIupjmCGov0nc80kaCCKjopQDEunZBMUS+uYIDyMP+LJFE
         w/lXxpwXcEkABHJBdvQNj3iB6l8UeER0pfILFKRXPOxXCTGZuJP6NJK0QPbxu1M/byUM
         RHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525468; x=1779130268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKbDKt2WJzz1x2UtlmgWA9cf8CPcU+RwykUyEU48Pcs=;
        b=joiWu+hyvm+OLAcGzwvAzUHVX7cJwT2D4Gkj9YguF+sVNdphxnepXBt9LlyClvdGpp
         Vgo+qYc83CV5Jdi+NCnZ4MEBa4RAF/daFtGEWTGzdEQTe6P3TnhGEipvOVl4KUvqRywC
         eLumhaWAwm4/371IcT+gwgiRmS2GXKdAcfeJidhQD4xPV7vj6MwiZHmDJtM24YXUbmbt
         OVu5fq/ZEAV3CIWFwP0cVTpHmzGhdpz+A899b6JVFfL04A0hVHVm/tuJXLRgcsldXCyS
         Q9M5ITCSMDY9z5TESJI4/eLUm6g3igdje4g7fxxMo9RZiC1Ex1wCfjW54F+V0EycMXcf
         w8rg==
X-Forwarded-Encrypted: i=1; AFNElJ+HoH8odvEo0up+jMFrncHNilZafMpp6Kr2956SCp+ASKUPYfXG41Wg6hFR5H0/4Rlayx+CoheD82p9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7p78b1pBss7sV9w8SpuV/Y6nG7/klaPOczyaId1pHkdwm8AP
	JBx4PYLt8ffK4RLIA6udVe7+dxD75Em/3px9b3wXRGE/XCrsEzH3twKY
X-Gm-Gg: Acq92OGhWedapxZYjFMPIsF2OdOoBC6TgQA3zTYrKLgPCbTyIJSWrhFbB+hNnMXoKbv
	QMZJinypLf/Vjf7J/CDLWR5874NOfAqRT23Qju0QK4H6Kdkim2pXxidUrI1DX8+EW1TKfO7/JDE
	ntJxEbwQNZOC+ntb9YJmdVwyq/7xoFVcWVJU/66ToHVOEN1a0zHsdfIcRSQegqVukdYjTHi7IHM
	h/NDoKVafykdLAX/ze/5S+ZQioAAeFpXL0TcYv04QnkZxW6STOq7xx/4+paVPBgpA+b7vnWfD30
	nWaNnvklol2rN2zJ//oYoOEjW6ED4WLWfn+Vl9Td8oC+m38dGXiz60d3v9Z3BlkLrcY0RJZDWZU
	7GwkbU1g/JNj7P9Qh+/w1EKroZlJSRNxnGgj2EOHYSvP8IdYOJrBgsvgfwHGZM2bF9pEFyKbIQ5
	eFCLcidLemz3LBik7EOeoEroWJutwKLFtz0CKFyQBEdV0FyK4Iv4hvfvg0EeLYS603o7NwF+M5n
	DDbCuE/h+8jiX8seAcwBBtoJbwzGg8Lju5KdQ==
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr166018355e9.11.1778525467756;
        Mon, 11 May 2026 11:51:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 3/9] arm64: dts: renesas: r9a09g077: Add system controller child nodes
Date: Mon, 11 May 2026 19:50:52 +0100
Message-ID: <20260511185058.1926869-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 3761551c9647..59e5de743826 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1015,6 +1015,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0

