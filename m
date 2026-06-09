Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269972F619D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968702; cv=none; b=Z/dgZMhCmVdYww4mlLQtkAofF7JyhberyH3dArsH55k2nQqls6i1JfBmJMtWpjZsXaMgiAXZ/93SDDRGAzsFcq8CbrIGn0hgiNWEo7sDeHC2k789uUoBliOcNPSF3HtLiw2WnnQL6wFjbHeXTixjIJngN/pOo/j6lxAEnwMgyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968702; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJsP1Plhe4ynMBkLtazBHiLRVolhRUC9RgQw8JBit8YJlCswsSG/wS5dpWBZv7vFtMH0mRvw0xg8hBPmsvElYBpCBT7U9DXpZbBhO5Q4gv7FucboTz4O2td/pgbZSL/GS25MnZyiH94rVu5ckmkwiO3Lx4tBzoYkERbX837jwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXSzfxzJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXSzfxzJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c35980fdso50315695ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968695; x=1781573495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=mXSzfxzJJUjTC+Ud3E+iBxBseQjM7nv8ALErbgpnmHbTPtAExDLGzTnrm/a5mDTdUs
         vt2VQegvXoyuVvUIW9bWaIAnxCfi3encV2vLZyOq5CspH1avxUPUppQnSP0a5dxUFSiK
         zZJpc6RKM+O6L5t/lCE3S5XJr7FRx4+Hy6JS1Y9n1Gl7Ww7lAkslYXdDZfJev93ChxyN
         SvUsabMmC0+YTzbKt+NKCIiaqlApEtw/CjDb1P/66qteQkWrmjzc3h3OUNZ7SHyn1bQW
         xXa5LKrFu0xVx93mBfZBVE6Xu9aaUZtNgDBlfjWD52H2lW9FhAivjsZ4RumUo+mWtTeQ
         w9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968695; x=1781573495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=QZSgU8jmDHl/OBns0hLKF12ON1/tTDNuGGKQjrhoko3c5+caPAKbMSmhkb98gMLaaR
         5VVYi809Hhe/IGh32G3cGDjM7vbwKaPChCEz/fG71gGpiMycyE7lXBwH11C/v1VA3EjJ
         KhPtLVD5wc0f2qy5C6HrC9bBD6I8C4S7zbEKrRbLP2KmL4esgBUgKdB+MvwId4/M/JVC
         6Rq6Hc0FFfIWTN1yqojSF3dAtwTwpX32BpEVNsX/+yi7dD85cHGdALvhiDit1/T5J2eW
         h8H6jOqUXPCwIhlQA11Tg9LtJ0HFp306V/ISzDJmIB3L7/itF5FJCZEln7DtbtXgD2C1
         OJEA==
X-Forwarded-Encrypted: i=1; AFNElJ9OsGoY+G+VYMdyABZBB7Xy8sO3uiL7kclY4AFccZeo2YlzEHH/5dedylUW1XwhgeJA1TKh3u+85FwR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4uFh25xuK2VEDqkJUQor8z/QHLTWJeKdBZolXZRYOWM+Bk70z
	F7by9s7McW8FMLBxPts6jp+Rpv+HtaqiXASRuGM8UL1TEirCB8+b3aDY
X-Gm-Gg: Acq92OFmGvqUL3pOtCsnLHL6/RGzPtP0trsar5cYl73OWvXtZN2UVrUW5S+bbWbhgR8
	LQ+a7rQpGUmJlAEFL8T0nP6GZwdHZm/3YxRaWtsyZQxkFHIfYASdUhU0hjQsYLxrd5YMJR10e0k
	6LtvWM/PIuM/ZXCAKP5KdwQFiDP6SzVH1oaQnpG6IdbVjabI9YY0Q6hoiUmDaE1ib3GUg4BzRBI
	V7zOy2xsMV9b72UmOlcOQbwpPq/UrJye2X02FCoOxx8YcjNzTWhNDMWKpS1tVUZDXKiULQt2dhn
	0JAowF57PStUgFKVFqOLWYaWBpdq9fNfIu8tUzxiRdj0XiA/N5mN6s6llG9G/OYlljbDShDQVQW
	2cmwo1s5CiYB6aGuveiv1DCtei4wc9e7iwJ32eYLxMVyU0F4ZWHW2m58ZEBvWE5pZUnkha6gc38
	HzPznjxKk5UNGvJEPZ7ZByz9NIzTxZBmKc5G0hEXQBZ+bnVvDhnyNmGfIfmYuusCilo9iL
X-Received: by 2002:a17:902:fc46:b0:2bf:2188:a90f with SMTP id d9443c01a7336-2c1e85c5ae8mr196563145ad.32.1780968695349;
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Tue,  9 Jun 2026 08:30:58 +0700
Message-ID: <20260609013107.5995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU bus clock, icka/b functional clocks, and xcka/b external
clock inputs to the FSI device node.
This prepares for subsequent driver changes that explicitly manage the
SPU clock required for FSI register access on the r8a7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
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
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
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

