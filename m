Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC5C3A961A
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157688; cv=none; b=JyRONed9I+YojHGiDwyESXmyHsVFdhajNCMduOZs6IEMP/DpRKTYtDt83HPq+y9oWG8UWZ3wTXGXFglVqiyfS26aOPEWqoqwpUxSVoo7f5LYuqB+1hsldpSW07etYjCmaFfcuGIrEJZFtzOXSyJ43nP/0LSAt04VVYIqMQ5lrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157688; c=relaxed/simple;
	bh=Loh+6OFz0mK5GAhmzzCuf5Hf8ndCuL4EPmodSWxlT68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cupdZQYloneDtDFC+fMquxzYYcUZTx1tZTuwJKH6BX3ynXt4ZXfdDRBpBS1swpt0ifmia1Vfu+KpCY4WDYAcW6JeKa4KDN/bb1E6WQSe3jABFmTwEuU5pa2+AsB4eKUlwb6uJVRbsg7XYxork5hf8sPKOEz2lgQvj+s3bQAfLMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kysWX2du; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kysWX2du"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so14294905e9.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157685; x=1783762485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9IzQPHnBsRY2wO028pzZOPJ0v/NMIURbeDWLuoqX1s=;
        b=kysWX2duwXYR/N9W5A9JzosPYsl7eimyYZXTGTcYXA1KDRfoWNWX6VCy6tU3uhqKuh
         bBQy+21/VXAHz4HiZZ2qEgxDPCkUxbLTicdL1JWHBEyfzYdNWVtcZxI6p5wI7g0/j5Ku
         mNG/Qmwc2tqerWfjbvHDnSOe1JqKzhBoyzIQIBWWQ4ouEB6oVw+++kf3BK6xeRO9pZ/R
         jQQZZL9fTXhYcWHxbS76WxrBpMPH+MJO9fydIOiBtrtEXFFKx8/pDzMLA0iveiswAAt8
         t91YZDGMANbazBOi5v2Om+NtTgv/JgKQqV0fiA0GBKv+R2LZbbj/4JhxUpzEKFO/ixzM
         gjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157685; x=1783762485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9IzQPHnBsRY2wO028pzZOPJ0v/NMIURbeDWLuoqX1s=;
        b=h0FRkbGFON5oGHGAWMhi6Nuzf5G9pABQae228XCqxdBjIrp0L5GQa9CqUWcNoIAwqZ
         2GEyCZna4zbNFqULabVjjGXAEcbBVqGdPoDQ+KT18cM8FpG0TZdDjR3Dv/uRx0YTWMGB
         aPUnUphyw4il+xWIx8A/II7hsuk2o2VKUA3WhugdbFxfEHAK10NIR0q1+zlAAZrk/XHf
         +e+ghSBPkIACVvQxE8zygRrSFA28dGT50ZQ7CZYozp0SBA4YIJUm71S98HkJJ+o9q7dn
         IWb5uJgf4qog4DiNx+3cwgLZsHLndwUGiAoLYH+BmyKlaXK62pe5O8B2NRTdkImJdPWh
         cNzA==
X-Forwarded-Encrypted: i=1; AFNElJ9QoqyX1y7XsQq5dh6PdIvEo+kz7NX/ZBdH2N6iQMC+cCtxQnMkP3+ABrbAPOTR+TYvSHbSsoawLoln@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnd22Ql00JFTDLZC6IW+QsTOaCTA1Hg7D5+/pDd/o9hkfHSxA7
	O53qX5UvKNDWF4ckkadX9sj8aUY/AA8kKUmNM/fgtEJJstN85PwbERn9
X-Gm-Gg: AfdE7cmYDKnUjdvJJUuqDdFLFFzeJ7g5VuYHfQxvig6Y5WbXfmBMiZQBd8v6z23eTMN
	WUOAiSrj1COB/b21U7Flm6AvdE4dikV3ncP/5AEzUPv5a62tK5GQLpV7sNnJequy5xmBVP0boJm
	Ob7rkkKMLqGdHQXAZwhD9EpK83FLAnur4yTL2E1GnPpIDMJu2Hekihyd9nuY7KWVwERuab1f7ko
	R7iM9n3p83CUlcQcXJjDM3GVqSFj+YsApcTRttdBeIDr69mFjsN6wN2Y2EPP1ufySo9vd2TpW3p
	pb98cgT8vnuiMCv3rShDiCXRNWuqYfDE5v7+7fk0Ev1Ptqlf/QVUEN+6ciCcYcXs9OchnsIWvCp
	amj1lc/yl4/hpcGl9CldgxO236QtBdSB3of3FMOcUNvQEDkhcDV6Da/KmCKAIr7W2es0RsFxCQL
	TeDulBlR0uVHD+bLYrGPLA
X-Received: by 2002:a05:600c:628b:b0:492:3237:ddf with SMTP id 5b1f17b1804b1-493d162bb31mr23450765e9.28.1783157684741;
        Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
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
Subject: [PATCH 14/16] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Sat,  4 Jul 2026 10:34:24 +0100
Message-ID: <20260704093433.273672-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index fe2779d334dc..a8b45443a78c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -795,6 +795,43 @@ port@1 {
 
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

