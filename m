Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071F443C3E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125498; cv=none; b=SrHudvLIFJIgOvO2qi8EElBdNL5ZPhWe26LxfjMXiUNUEh1eMOLPnX10f6bKSAPbNk+3u8EehLNrpGpXC6nwUdeDAgeNmyexw3j1G7WcHTDUVYF5XHL7cpEgHRAsCY27BV5t53+B/jOxS+hUCzDY8Ug9LOUclCbePPQQr8mmaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125498; c=relaxed/simple;
	bh=mhbdJjLcWcQrWxoxCQqlUnOAIweP+fW4TKcbmVB9Eig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQ0FLhEKoiwroJO9ImNre84AYnSdqIJvXkl8dEJyIhCz7PPHrV6xRuC5gVa+FuZpa05+FzwsukfjJtywxjHdmZykjDN4DGNHNJ27dwbc2biT4DgUR3i9dl3z7B2O0xrpgPVYaETcc3ZGTEriXj3GT3hxwxXy/48St+eKxjJZRy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErXaCt+k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErXaCt+k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486f282cad5so199964f8f.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125471; x=1789730271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=ErXaCt+kNp1vI8oYkkLEyUfI99AKypmjL7CftTqJl7kG1PXLRQ3C153MzSFyipEzdL
         AbcNz163gszA8czf8VqJp8zcWgDGQTrX3X3Yuej2xNQdwoS+T4HZl3PdLLhvEDHgw61H
         DxENJd51k7d616osbajPG51hlKDqfSoFzqAB7+/Vqqx1ouJJMYDA76WbcMPJwzQkxN9h
         48ZUKNiMRu/NyGzZEw2mIMnqBWtSHSezI607NrGLQSA05JUnUWgWhyDGCCpYm2SPZ6O+
         zaLak4tfq1KCgCGHRCRIIrt/eGhA+DVzhoVnmi8H47lx4Es5IGoAQ30FfH1fEanaS6GR
         NR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125471; x=1789730271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=g81s9qX8JRQ8RSY+Aejt2MbDAkRqCpltwJ+1HRLNot4CKbKhtQZETkZVh+oBWaoR4P
         ATJlKb3mu6vDCazD/MtKpTiKCm33bwu30EH11nqsfUECy3whjoRxklYEcNs1g9M1Us2H
         ZRDjPD6W4N5m7MLwVEkjLLVJB2X0muULwMrqzyITyOM7P/Qtsum6ZcblUpvN+fA7+8My
         0ctsv9PGElbbnxzquFVV9aFQiyJV4t+USFLqhl5AyFuacs3PXuj5CEp/sbMJO8BWAssW
         0xZzZcI8qtq4uK0+prwBTOQvte4TfHrsygzU6HPu6faA6a2GpV0dBh3HiS+kIavh4v48
         43eA==
X-Forwarded-Encrypted: i=1; AKwUvByUreI1QNoYgo8tfETmYHcaUZVY6BbDOPD0Su8hS11zaMZ8RTegNpwTLw1AQ9Ho304fRjzKbj5+a3Mb@vger.kernel.org
X-Gm-Message-State: AFuF++nBr/YAgu43UvTHoH4ok1hWvIbvJ8axODtRqDS7NmAubp4lBTJS
	N9BFmDF0xfjWT/2Dw/SalRbLGFkjjOE+FKRxVQJYLTvO4cEnkumAr036
X-Gm-Gg: AYBFou2TwOTWXSk0ZpjKeNBOc7kowHXJI8q3dHHcDg+nMBDNPp/72PWvlxC0NisLqLy
	VOenpY0t0WUcp1M35VJ4evjoagq8F7+YrPYM727+rgQsW74c9Hdas59S+M9Ofw+UtANP1AGtTAc
	4WN5FKQx/KI4vg1Gg0lObyjoMQksZv3CoA2dMHy1xwLtFo4eOFzNVDm/VFERg6NLmfPaDvQFQcI
	GjM90EoRaMAddyUkKqARZXsSYmlwLcbmtq5S6QBj+XZuJSExF85jBIMqrOuHHne7Loeh+0yb4FK
	FCIoR+qbeUyF6O/QdH7AGMdsDJiB6E1GhhBNUQYJ0LBs6sdNWheQSlyw3kVP8OQIhty8Z/L0iDj
	PkWw7uVuile89fCt2hecNJu/5qo7ika0EL2PkfBfYcn5w6+IIBwut9UtUPLbVagZESaMkfxkq0P
	ECsvqE22QHpLucCZFtfyWVuP9BHB5ADEGXsSQf+2CjapKH4Wy9yPZnQz+JyQwfxhlT4E3zHOU0O
	vZ5taWm2sdaR7gfwb3T4FzB5/3f78i2rOvjPHWaTwp+hQJZ/qFsjreCYgpGkpMY2eAcO10keJGo
	nw5Fk8h5HwrVns0RTA4=
X-Received: by 2002:a5d:4083:0:b0:486:e9b7:4868 with SMTP id ffacd0b85a97d-486eb2ee556mr3524487f8f.20.1789125471098;
        Fri, 11 Sep 2026 04:17:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:31 +0100
Message-ID: <20260911111731.3404308-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 813bb0cb021c..3ede2e89cf67 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

