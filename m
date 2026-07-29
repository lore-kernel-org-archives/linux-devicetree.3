Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDA485CDC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329766; cv=none; b=nG15Z1V9lm4/023eXKLfOuBcpJ6fcOyzmOnp7X5jDAz+LeaeNZ5JQFeRsxnNQH3h6phuQkaQvn8K2VnONvYpNcbYG1I3XBOiJMoVCZlbmz60vEkJ/gMAHUj06AsBSrCN2HxZUUakRhued558EqSZdH2y95CE/2YsTHlkx0ZiwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329766; c=relaxed/simple;
	bh=jKuYe1gjfWOfeiEBjkLMptmfqmvZ5RHA0qmCLGwyojI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTtlogK3scELB3ajyacsl5PfqrmNoMJUbkVRbqjYLlRocYkOXW96a5dirqrjAOu8PCA5yZ79DxrZExiiqgLn0B6xw7n51AtXxib4jimnJkLAXhCKzFmhdiDrrksyYlXP2N7Wkj8DYH45cr/SDx+hGJmoCMvOh+ExJop6GUhBjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJIEtZtd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJIEtZtd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f752b3423so592333f8f.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329747; x=1785934547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6oFe1dKIkM2bpE8E9b0CLYYbXOCyfPkm1wpQCExeCo=;
        b=fJIEtZtdMEWi+wJ9canab8Px8ix0efeTR6VJQmjACSZmcPcL/Q9czWOwELMycyDNhO
         rYU5Z0EKgLpS39y2tT5/0O928CdWuG2kano2jVNrPyoCCFdXE8HNFMZpq3Y7olgRoKZk
         miDX/79YsWRNpR9Box+Ltfarh+i1rjOorE2ZHS4d3uomEkH0wEU7aw9UmSYyRNW+4ZuX
         TPDnyingaHm3efug0ETRCaebyrV7+9S2z+ptGZC1Eni6uIIuya2wD/paf8zd0ceZ+WDy
         /TwbWL/PKW6s+o5BN1zdg3kRAwE/4UlR6rWoYmkbNCkxOoFmZjxilNV5xjJvAfKEiixF
         7Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329747; x=1785934547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6oFe1dKIkM2bpE8E9b0CLYYbXOCyfPkm1wpQCExeCo=;
        b=Ef3RYEhfLURM9L/TOOBdPfPVDT9jFXfAqpkKEvuGus0W+S4SEuOsC8t6f2RO06VdrA
         iIF9pWUNs2IgtFdD3FZHjyzq4CG0u8NXskw0s8enq9Ct7IDqnI/T+HvO7ojoZIxx+oWs
         QYeL77uDWYo5Zy0F5D/wx06ivk+OfrNbjXaF0vYQgxramgELQK2Mpsr/y/hCAbbqA4lB
         woUmSLs5ZKqfhitKTTXAeTEuds1Zl0uVpde/euYEz1lLQsdPhVE3SqRrGhQpc1SAvdeq
         9D6EYd6HnT2J/NecVO+d4IEiZZd9K2CTRRwePYBBAEkX0Fv2ZCUZOE+/rOnS1qkCApoM
         v+Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IgjTp6C169qCFjTvLgcEGJGzZrIlrT6H/hHH2RKzfyyVhpegrvxJuQQTZR25EcdMYHp7JadZAQwv@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMJU4B6hT8EG1Y8Z0UJFLN2Ylh0RSoQke9OPHonsFjVGTMm81
	1uhVHEE8h4hdkTc+d7UCNoH6SBhz0dV9wFE55BYbn4FMp4FQzZYxycNX
X-Gm-Gg: AR+sD1198CEV0xEOGttSQHA09fzqiZcwMikcJP7Gv9jIJiZd8A0RQIQJ16bpMAOPCOn
	UWSy60SIHG0u/JBysDyMQVlOnn3PuBLxtR/6s5auVwejXpPjvF7lS6WilD8guwdWZh9Xmu/vynH
	FOlOvFohQyj+Ll/ErxOLINSWL8PvR2bgudjpUXIcZPdazFSbO2g7NXzncn5zAdkZN9L0VIlnL8w
	R4rGjc1t3f2b3kIO7Kl8iu/cm+EVYTIipABHfJ+sk6bipMd/feWjI3fAVXpEk9fYPeWlJ+uASUt
	3gxWGf5S20FfNr733d2hJT7NIRoCNgjb/h/gQND4yUxFU0RMuumWCR6VqCVFjDpovppalA4ZYJv
	fHpA0XzsdxCvCXT3gU8mXk+67SFHfxoUGQn64WgoeLpOYLlOs8JREs0uX6j/umWtwisE0GwOl9O
	/ynaH3VsXZfkaf1tyQWBsAn9P8vyETPJN5e8KPuNuA6cwBt5b+P5O/YDPAM3LIuSKhFrxjEGI3G
	8FMn+PDy0nsKw==
X-Received: by 2002:a05:6000:40cb:b0:47f:697b:de65 with SMTP id ffacd0b85a97d-47fb1f30f67mr7822735f8f.60.1785329746690;
        Wed, 29 Jul 2026 05:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 14/16] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Wed, 29 Jul 2026 13:55:06 +0100
Message-ID: <20260729125516.230757-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add LVDS node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 8a0bc4d2b150..ce057b5db285 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -794,6 +794,43 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+					du_out_lvds: endpoint {
+						remote-endpoint = <&lvds_in>;
+					};
+				};
+			};
+		};
+
+		lvds: lvds@108a0000 {
+			compatible = "renesas,r9a08g046-lvds";
+			reg = <0 0x108a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+			clock-names = "pclk", "phyclk", "dotclk";
+			resets = <&cpg R9A08G046_LVDS_RESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+			reset-names = "lvdrst", "prst", "rst", "arst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds_in: endpoint {
+						remote-endpoint = <&du_out_lvds>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds_out: endpoint {
+					};
 				};
 			};
 		};
-- 
2.43.0

