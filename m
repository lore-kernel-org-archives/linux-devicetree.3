Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003A379C5E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558403; cv=none; b=OmMl/XG7EBL6MmU9hH4b6NPGxLnpF3s0p9yCcGrH8DcSv98Ns7wsCZVkKU+eNooYgA2+eH2Fd+STBynimLSdv6SMi1D//0dolZ4zjiAkhKbHUgBRDRsCwCFfJ1+1rfy+Yy8+4m78S9yJjA+pYLm+WDIUpHlwEcEo8Mtt/Kry7tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558403; c=relaxed/simple;
	bh=xqQ9VgRdGKzpJILJX0jsyXyl/q6X+3j8xqBdKhoxWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsOGvMCq/s3VEpbJul/Nutmkzdcctf7Ms+qQsFL8wH0Kaio3Ni82rtunFyi8ATmm81MLU1eEvkNs67KwUmyZT2KXDbMH+ZNh+iMxP3TvnMUzg0mccjcRn8fiH2T4AMGZCZPLPmttTD0vCgMAO3okC2rmi1jenX2no90X5gjAN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efMY7BO+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efMY7BO+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caea3f742bso49462205ad.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558395; x=1788163195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jyLDP3AZuhAYgYy6LRMaUUAZeFv7rhhN8YTWF4FaUI=;
        b=efMY7BO++Jt/dTvEi2fKwNtK+Odw5aDPPJiQWQoQQpN1xyoXzFMN3pnI7G8sxv0ejL
         ykfsysX+r1Nj56KeN+GMynWybuATKxCO8b41QqNtLoakQop6qZbFJpaR2GC6hbBMo0TG
         /NcY5IGr0TfoqmC7TryRg9RVyO814O6lwwP3MKdESfoRhJNV5mtmePkh5zFu7jnEnY1/
         zkfB481QDZyoJoWqWofBFo1jTwUcP314FY+yR329iEm/NTC2O+OKcRqc1n23lsxyyU58
         ae7QQqh+8NqJ5S1Yr/IheNHPNFsMCIKbr9Yoq3levvGSYkE4CYrYctWMlNOhEPJqmMuR
         j0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558395; x=1788163195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jyLDP3AZuhAYgYy6LRMaUUAZeFv7rhhN8YTWF4FaUI=;
        b=cHr6Ent3iQE5TzEP+v/qnaF9jC9lS1KPIbZ4E3c5norSL+QDxgiin+7zuhRh2sIlB0
         QrU3TMZmmN8x5xOCTdwjDmKjQlcAUNEaTM9I0m1PVgMwaML+DiFvUiCNyyp4iR3VGzdt
         VZaL4nRyKPorKjjMLQL0HnlPyZCM1tUtNjlOz73EFrVXJ7GgVlTr5nVUpQmZ9taiVMcC
         QjyPcnSxD4LWD87kwYqQ3K9ecjsfZ08bW2yTMA846QDI+lONYQUzhdm+ouBFlDRuFHOY
         llkvwD6NjvDwCEBaOeEP2d5o0RTfLIkL+pgRKiMQMeg57WoSbDQpR5f44CEIdtOgWfD/
         K3eg==
X-Forwarded-Encrypted: i=1; AHgh+RrokyAR9QxQrKBsqRmkJlMDoUqc7AZItKWQQmUbqU9N4cYMN1+/QBcT+14gQw0I4nBb8MyQQBNICY5L@vger.kernel.org
X-Gm-Message-State: AFuF++mLqJVinqfZeD2fcIMRiSKbM5Yr6W4YyZ7oqmC+YSfCz5MKkzDc
	5Mqdux2/gJVeU7REv/Cn7EQuzy5sDNzJoeAzAmKVzxWrrK3HRdljrAko
X-Gm-Gg: AR+sD1000xTCeMci2YESRyLR3yoCjGLZePhAWIrJQtILQFG0i48GWinysyhw7DxuRBK
	g/ZPm7YN3Yjw38rBQzJkV/sgLmuYMZtMR3Rgl260sWwQ1rlBUup+ex9Nn9rRCdvaatlWjnrFyWb
	O05iZKfD59VHHswvbd2P/Vem23VMJTfSh8RQNT70aE1tTuQOWUhvYAiHOfndOnmL73yZrIoR6yh
	GdmrX2FvbgMoi6o9kP/gtBRatLC1DR/s50L7t9uKhsvmPJPHHMdn+szaVOIF0uxjAEQo0VPri1f
	WyjActlnUscpPCUzXBzoOui9FhnKZyXImWbt22+8fWOITVXtjtyIFMUixaNT1Bg1Dc+XbbJNydl
	j5VL+n/7XQx5rBOoae7kwk1JhbzQrZt16Zm3BIGChDOyUF3yKr3ii2T49feWP1rRzd7CLvubvie
	NdSQI7XUIm2BtTSyMQJJkWfnwf653Q6B27IbSHEhFQdDkEahbwp2XGiUIxyeCGzfK8j4iUAHQAQ
	FnzENKPH01l3/zKMw3DGFHhsf+LFsW730B+Y2q83mqhJUeZh2jQe7UuZf2MyNMtVutG+oH3
X-Received: by 2002:a05:6a21:600c:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3cd2fd8e339mr49453936637.2.1787558395066;
        Mon, 24 Aug 2026 00:59:55 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node
Date: Mon, 24 Aug 2026 08:59:34 +0100
Message-ID: <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Real Time Clock (RTC) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index d5eafaf23e75..33f953c110bb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1173,6 +1173,19 @@ pinctrl: pinctrl@802c0000 {
 			power-domains = <&cpg>;
 		};
 
+		rtc0: rtc@81009000 {
+			compatible = "renesas,r9a09g077-rtc";
+			reg = <0 0x81009000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G077_PCLKRTC>;
+			clock-names = "hclk", "xtal";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.43.0

