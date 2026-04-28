Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA4237B41E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416485; cv=none; b=daWa6IL9+ttqMDUBnaqqZ/k1w3dZqph+b2zDAhzcUGSgNKgna23Gy2UczVojbEAixQVr5I1+3xNy+DKtBSnSan6oSlJ+u6mPcbfNW8c1CeUlUgVAQdnSOGBtdbAbdyXKdqUjrleFZV6NKjkBBVeSFqgQNMIGYEmM6qfJr221zOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416485; c=relaxed/simple;
	bh=3XiWY50iNUQ4D540F4EKHqD0cSM4M2GY8uqotaTPFig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGgAgXPUA+3BisZS4FdVP191tPv1SOUcoSOUHDNe2W10t691zzBOiidg5Lhw3AF5Q7G0Bf4vJllp4s93I5T2C4OcS06yoyJrYZDNTuxJn0CBwKi2blQfauUSMW4GPwUAKrb1LTMksMwkdn1Ge7MLT1OjNUQV6z9RHNvd7mp9Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=OdOuHSl8; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="OdOuHSl8"
Received: (wp-smtpd smtp.wp.pl 48429 invoked from network); 29 Apr 2026 00:47:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1777416479; bh=Xswwtzad7rvDteRWu0qhZE+fNx0Z3gHT3572TPLV83U=;
          h=From:To:Cc:Subject;
          b=OdOuHSl88j6WGUcECjLjwCpXzlhDihv2yzS4gkGZm7bg9CkgHPjpmcqHV+DuXktSY
           GUq73+1pNp8Iyvh7mCPqUS8u03QD1fMVjcgd18pxke3aT8IRo2BW67LRB0sMZZhy0C
           wOFA9zHQgjEAqhqcucjif04KFeV9mpZ1hjAraGL6vQ9HyT2PR4ylUPLiuC0Lzrajt+
           MrMCMXT8ZFWWFWvKjOJcgWQ16KObem4jTrwIymirCcTIvaDmJkhr8JltZhK43A42LN
           CAKN/4jlxGQvKw/d++X5LwY4MMvxNbKiH0qTUo39mCeMtivq+yoS+osWLk0gNOxwYP
           ArGJhwFUaFv5g==
Received: from 83.24.138.167.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.138.167])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 29 Apr 2026 00:47:59 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3] arm64: dts: mediatek: add crypto offload support on MT7981
Date: Wed, 29 Apr 2026 00:47:43 +0200
Message-ID: <20260428224755.336843-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: c4c1a66eb78616786b6a9a28261e39cd
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [IeuH]                               

The MT7981 as well as the MT7986 have a built-in EIP-97 rev 2.3p0 crypto
accelerator. This commit adds the missing entry in the dts.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1bbe219380f9..e63ba3ae395e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -150,6 +150,21 @@ sgmiisys1: syscon@10070000 {
 			#clock-cells = <1>;
 		};
 
+		crypto@10320000 {
+			compatible = "mediatek,mt7981-crypto",
+				"inside-secure,safexcel-eip97ies";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&topckgen CLK_TOP_EIP97B>;
+			clock-names = "core";
+			assigned-clocks = <&topckgen CLK_TOP_EIP97B_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_CB_NET1_D5>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
-- 
2.53.0

