Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0F423EB1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184101; cv=none; b=g0ElP2V0IUoLhMSqjxl/1PikwMI7HPdcXvf///7IoPLqEbn6MvyYWtz2Wt49zvArEsLgN1z1EdJoNHiIXwJGje6zcmFR+E/cmu0V7iqC8S1ZCEiWR3wcETyMM97xWjFz0yOWhYFUPKiT48lGh66+5NNpjXZAi55Tx1MH7HHl460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184101; c=relaxed/simple;
	bh=o+YQVo/tgf43wCSxZo2cgaLX3t2oAo0oUNQNuLMAWtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsFAhYf7SPqvSVjdZ4Gx3S9hlgVsTAi4pfdLoFYU2ZpMXMKChcwr4TLBHgrJKzMNyYGZ/mb6P8yzgUOkDKgGQ8/Vy7AzYBu4r0QpGDQj3+xwU3sUhkulpJWm2k2KiPgvWqKP6nf/v+bX4HkQUSk50zmU0H6wcW6DxjxUDhzv434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzkS5tHJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzkS5tHJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2733968a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184100; x=1785788900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCGKHXxtGl6+x0K8ImCCepzCmvd/Lbkwu0KaZnoo6vI=;
        b=JzkS5tHJmXOK3Thd6br+Hlt8TRo/ACu3+ABuYxS63d0HLl3QgqFih6H+Ti8A8BPGKd
         2H+T/Rx+Jypbnf5ubiL2jSVXoEyZFkIwXkzuraVfWoSCEbEJCK+b5Nh+X5OaSoqv05Bt
         nQTRkyi9MQLdpJ7Dw9zZUUPnzyt/EKsF5exg4kjxkYlxMBFXg1xqbbAB/wkzuX13/50I
         8VdolIJdCbvbAcLdE9NhCWnTygq1YrGfYjEqxuGfHshYucHb/LzEMPnnaHv9QXjJtzY9
         cxQS5nG20o+S5JPSkJdlr5IZV89KnO6nym0rDfqxHIX6Ff3++zdO7avA4SlcC4jfpLze
         JHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184100; x=1785788900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCGKHXxtGl6+x0K8ImCCepzCmvd/Lbkwu0KaZnoo6vI=;
        b=ND5awQOBpnpaS2A7nqrIMMZ3xAekwpfGLBZa4MC1Utka8ZUw9vgKuw2uP41ub7e7yY
         PIe2QqyDjzmpIDaakNjInox0I2s59jzD5D8SUmkMUZzynwloYMhgy75v9EoradmNvDYl
         mwDCwCs2h7tcNaPkpVPDaAi7NL1fWldkEXR35XMJ4zgqWi97uiN8TbyqMcdjZVkRJF6E
         a+ubmvp6PKeU+Yf2ei8BMnmfBbFkJsnS5UeYui7mMtcoIgTkPJebOiw1Se9cPZWaDoCv
         Q4/329lSjMYTnmXMxaoaISK2OCN3gnpODM4D4XeWL2GcHcyUEM6GIxffZr+Gv9MHq5Fm
         fSiA==
X-Gm-Message-State: AOJu0Yz2MCYg/7MjQNxRcXS2v8UWs32MhgkUuSijGLHv3VArIB6mfqGa
	e0wxR42cMplcQFxxoWe0adTUJ54n1DEv7vRfrWEIipPtLFaH6Dn0EFtHG9jnjcyO
X-Gm-Gg: AR+sD13qCZSmb8lwx92O6jzCdyRC03p8tqZx3ueIt1RbVm0riyHM2qDE9Ku+8nYy/Yu
	qwcAEiGSTfUK61p0z5TDBuok2/tOIoolNt41N8dANnnbuKKiC8JYol70SywWb2FNwo/88X2SNxb
	7Td14FJcDLcJ/OhBmMshEQbGLPAlqTjLes6HblKIVbpU1YIZmo3+Rh2oi2tck9bWsbKizY5Ig+b
	ED4G9cnvD0Pr2HgC7GNxGJuBxHQXlZeLlIjITdW43ETzaMiJoEqyJ9dkhTRCdg2GVwEF4P47MkV
	7LLcTRV3mcvB/4HD/8IfhwXCyiZ6vxEtIIBVmJ67ZtxmpkAAxGyKqFvdBNsLfbt4ke4rj5rs3sY
	eVBtWxcqd0VoJ58A5no6QDRuRiPFADZJKC2bv/wK5rvuePVRmhLrfwnCRMHLHjha66CWNeKiOuA
	bXfF9Q/VKXM1S4X0LS6kXwj6Xn9Hik0BH1p5ter4Mn0ilaZUattQM2ec4uRK/KIe0ckINlNaSvg
	0iAA5bQAk/kT5JTkrzXx0JYoDAn8KGFVLLqriJi+6p9J8YP55t6EQN8VhjbhqNWxg==
X-Received: by 2002:a17:90b:524e:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38f64938266mr765946a91.3.1785184099513;
        Mon, 27 Jul 2026 13:28:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1290sm35391534eec.1.2026.07.27.13.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:28:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: SR400AC: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:28:17 -0700
Message-ID: <20260727202817.22085-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index b226bef3369c..03f4a6d37a67 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -25,6 +25,16 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1eff0000 {
+		compatible = "brcm,nvram";
+		reg = <0x1eff0000 0x10000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -118,6 +128,11 @@ &spi_nor {
 	status = "okay";
 };
 
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &srab {
 	status = "okay";
 
@@ -140,6 +155,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0

