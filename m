Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0A3BADA8
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074873; cv=none; b=nocYVP3kG0K4p896IY+qzsTvVL7Ll1/qjPkudzVMbBLTRMQfcbr46ZxL2hPpUrPnM8UWQsGC03jlM5aBKqLi3euMY2w29vrqNLR4R+Jd7DxFLEye1NBhzOusa5z4urnW8raAzg0ys+Hfd2jqb07gcwGXueazGZL0CPqOGdbzvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074873; c=relaxed/simple;
	bh=gbzCR/HLA/ONbOES45gBPkfZFyPZ1gKgW0aInfcMl0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd8riAdmoczKAv5ux61jUDUn8LkW8zan7T85Y7Ek6R8FTQX5BO4ven7y+L+btag4tXG2Fo44gw9rVLT+xiXroNcDiiZfNm/XwhfbVO3N7V0LodvXvOfZdmnz1DptnMiU6v2Fzym3bNYljn+kzIPTjHJHQIEDGKdsflhDAun4DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWZVwkjW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWZVwkjW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cd70febc7so2824555b3a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074871; x=1776679671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=oWZVwkjWBjynTA7MKyL7Q1FapKZKcnjORbSmOsLe8tcYcpj443RwZysljgLXb0rCQv
         3A9hXoVHXDzhfdFOYJjSAA8YHR+DOQUtltz15gbBorh+tcYpWEAUaJlP5vwruewSK5VA
         9QiKG8AX5hlI/s1VSTFVOwmEwAB7YRhX5gEAPl4DcvPaGTwOjFNdIivLFPaPbp9TacbB
         K/nHMvzvM1nj4aHbQ8coRP2KbUbRL8P0VJpQvEqCBjMead7svh5CfrIE6Jq9c4yUTolY
         AHsTLaiShwTwPc9tDFLmUYTVvMSm/YwD3mJDk3kVSYQ90cEDRel3coYAfoyaBZyi16SB
         u1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074871; x=1776679671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=Gs0Nxz1FKCHdpcLBLAnM7ifAF42GmVsVuDGjpp+EfvVJT6wzMR5SZQWBv+nvfvubgu
         rzNbTos66l+jOoyPPXlW+Gbi0OEE0L2WyUYxsMOG4GHlNkdY14mgDT5vzfe5xFtLBO4V
         Lps4D1+izSPBA1m0CdR5JaKoZlMVKmw0Mf2/tQtZdqTsSauiy1pye3+7Jm0M6k/iEbWL
         c3o2d+rX0hIa630XcJ+hZQDuToIN1OVnAHVTE9srMUAzG9NDeN56DTpvXJ/I03qv4iV9
         FcgKF5OHCs2hvlrnNqk08dDvff3bdP9OzmwI5vIdQ2XTdNrHeFkyofyc5vKZiJyuW7LW
         SO9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MqbyiOPmbsMvousSwvlImTqlPR2XkSyfFPhpBrrsixskpc4gQj9UJkaqpDCJJSb1qikfws9zGJwf8@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZPq8UKBGSk9tDS5HXz2PWREekkQkRy0nsvwOdhqO7Z4pZmDZ
	W03HxX2RL9QaG2UNrL2X/aS6784IWqiPVtX3zdcPQO70FWrxzLlVFYY5
X-Gm-Gg: AeBDiesagBH3YSNeiMEIkRfFj1TvtdtV4lGMyMeVM5DBXjat/PmwqxA0BlgbYwhRV36
	tfADKkIxm7pcKVmwgV5lAZsSg7kysQtE+rqXNJV4wabNvREEvoeq5ov8+NNqyWFat7FNOhiA20u
	EUSMgRo4g6I75XFY3VErh6E8V6WV9SjEG7vPRRs3RaMJ1cuMDnkQNWTLJ4ClfVgBBCrAImP/oBn
	7c3MhxHbmiDP1scGNuBcMXxasZaypogBXa4NMKh/ycTytZtJr2KyWUnIuhjXmF70evnUfUTJNU4
	v2RvJtAonedcodi3NmlIt9aKXmTxW2HV3IomqQk9w4pPu9GvdC5glzi0tG7elMUFXQUFYB6IhAZ
	yLuCrhcyUsfO6Yb3rmf5tzHwaYnrhAgfOtDLWjKWALJA9oKPUYCHwy2FaWeR3a12BoFqmDlIZSH
	Y2qQHEB2wRA0gGw0kA1Bwpy43HgKhKNSZWx0yMSU7uVj3EBV6z8B6aG+E4wQ==
X-Received: by 2002:a05:6a00:1c97:b0:82a:5ef0:210c with SMTP id d2e1a72fcca58-82f0c234924mr12333653b3a.24.1776074871294;
        Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Mon, 13 Apr 2026 17:06:59 +0700
Message-ID: <20260413100700.30995-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Also complete the FSI clock tree by adding:
  - CPG DIV6 clocks (icka/b) as functional parents
  - External clocks (xcka/b) from the board
Define fsib nodes to support the clock hierarchy.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename "fsi" clock to "own" to match driver implementation.
 - Add missing clock names: "icka", "ickb", "xcka", "xckb".

 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..b8d903b711be 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "own", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0

