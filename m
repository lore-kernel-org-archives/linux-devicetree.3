Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7330244694
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261489; cv=none; b=jqwfi/5okeCRBqYU0cQLmFE/+U5mWERmtUXaCWl1MxRshzJvfOzoAre8iy4aROtoklAN5v9MioVOSQWggWeA+LGY+nkNtUwO/U59ukqN+zGljTz47Vi3fFaKYxJ5pg7tmbeCvHzEqVbDN/y6bgrHXZoBgWKXCMzcc7OYvdXwPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261489; c=relaxed/simple;
	bh=A343E43pW95EP9AO8BFmFQukqMiRwvLdirbY6h+orZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VE7qr121vviVz8c/YTDYjZjpYDXmy6oRa3NQgDkytSvnS9cYHCvunu3WjvJzyJI6brNKXd0mE8w2mmcRPcd0xN42c3NvLVsedU1Nr6KGNb8+Hwdxo15vkzx2Az6SZCJsOmWr1jCWVKWOqXLSsLWGzk0dqpLeM4OBszVg9f3jaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=st20g3eS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="st20g3eS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aae146b604so64769675ad.3
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261488; x=1777866288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=st20g3eSaLO4SR5RZZy5U+ro4XhaAUD4EDcUnClaEoStmSW1uzftJswByLnDm2Exzu
         3XGjbTy+s6K/Q0fS7acAUmlQ5milQXKvKIuiJN4/x0PDvL44aydKSyEiw1mu1BERNKX0
         2bHlo5eSMDj4YysrZgg4KJAfxl5stb3grzm9znxCyUP6f5tMdkoRfFDvKo1tqqcC+In1
         4O8LFLX2WjLUrkA1whvNeKHKoDgj7PasfQlE7Ga1Ae6EChPWr0jspMbl0NsWRSTP1mGX
         PoedB1ApUWTkimv7XHUwKuIbCfqJv6SBqQFm5Ffj2I04gAi3jsfzMLLYg0TmpalPRG+f
         Vg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261488; x=1777866288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LnJZvLH9bwq8rkIs+Lcwlv8aSN2xQ6iGFhBeGaXxuk=;
        b=DJSQNv4rvgoQvltlmE9uKkucURG5HKFJ/sp/ni+ldfMhZ9EmGOyGKcr3oVwDKQWDpa
         pJywPxasbVHPykxsU2z1LX+8EL5NQ3VGk134rtoyiAHJI5NtIIGT1uj4S0JpWJxdR1vM
         Vu3Nc3qk4GCRJk2pLw+RHrqJ3ZZ8wAp1y6u0LwsoIHcxoJP6aacQ0/kPSJK4ZN/VIv3N
         okuiWbuVzTUd1UqPuIcq7wfOfuSC5q/1Hfw1gpoxQmayBZZHd+cqqMRn7oG/LUB2YUoG
         VbCg2n0TFnLE/2B5dwAKvBt4x+FSl7jZMTTNMP6AG+AwKjuZaaL5QFNpY4B6Wb1UJu5D
         LU0w==
X-Gm-Message-State: AOJu0YwFjrXvMTkwF+HJChq8NkccSb0jbkb/qU/NPvBWhLNebR8rdHNT
	ZfOcRDQGVujjlmbKQL0KDWyzbhy3Ib7O44QOPjJef+fAAhubyN9aRTa4shPM2A==
X-Gm-Gg: AeBDiesbuMjl5LKDnhude6vUD4jtPSjwnKP2Ij5k8ul/kWkX1l/KSmVOw5wzNmph46/
	yzvM0j0rIAS+KEnlNlPgRr7ejs4eGDMFBdQ3Usa0D0NeyVS4jISNENYGc5eaVuGGb0UjRCBBe13
	y4Oa+v+u6b5uONiY9konjjuMFAny1XIuIitZDlI22ua941kLKrPNMHdbN2F1AMzueuxzOnGLB8u
	AwMA+eP+KDveCM0FgwFg6VYruyJu3SAKsJ+roo0LBfsLt/JBkA8/0hzBcilHpkK8JTB/X9XiM4w
	iq8l1mlrAS/kyCPTYaTMoesmW4ke5S3slYoSeiZ/CKZyTlA7B1RDmdgPQFRvLAX81OPo4akDI89
	sYvfkuZ/lh+4sqIJG5MplXn1cNsYH4wCSX2Bki7Bq5YgIzsrPxyRJYmu45urAXKr2X0NCBR+1B9
	woSm+A85kWG9u2Nt3h5KVCVut2WAirkn1vjccBloUZENkVAo3P0E51O/MPsjRtvLQNwKqMS4K/B
	7PRLu0KppW5OgAPKSMNoGsedw==
X-Received: by 2002:a17:903:120d:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b5f9fbc5a1mr463142335ad.36.1777261487655;
        Sun, 26 Apr 2026 20:44:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 1/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
Date: Sun, 26 Apr 2026 20:44:25 -0700
Message-ID: <20260427034427.881389-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mediatek,mtd-eeprom is a deprecated binding for extracting data on MTD
devices which has been replaced by NVMEM.

The latter is already in wide use with mt76. As this is the only user,
transition to NVMEM.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/ralink/gardena_smart_gateway_mt7688.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 0bfb1dde9764..a8a8efbaf527 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -155,10 +155,20 @@ partition@b0000 {
 				reg = <0xb0000 0x10000>;
 			};
 
-			factory: partition@c0000 {
+			partition@c0000 {
 				label = "factory";
 				reg = <0xc0000 0x10000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#nvmem-cell-cells = <1>;
+
+					eeprom_factory_0: eeprom@0 {
+						reg = <0x0 0x400>;
+					};
+				};
 			};
 		};
 	};
@@ -201,5 +211,8 @@ &watchdog {
 
 &wmac {
 	status = "okay";
-	mediatek,mtd-eeprom = <&factory 0x0000>;
+
+	nvmem-cells = <&eeprom_factory_0>;
+	nvmem-cell-names = "eeprom"
+
 };
-- 
2.54.0

