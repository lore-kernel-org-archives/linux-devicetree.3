Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF90409130
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538516; cv=none; b=YRObgtC5NGGrQ/58WNP+RkMfrKHlbl43Clv/d3QC+/XEpbUmrw+8nWQaZytBCJMdordT22mQxcumxeBqRHnkfhG50XzysqgUIhmrFqBoCmKs6Te0xp8AftrAkhqP4HiLMG5FkcMYZ9OrBsq1shdjv57szGeIApCrnE6m2atp0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538516; c=relaxed/simple;
	bh=KjAInLhi0v3E646PjFPpNWMeDadi9UVfbjjl8YmdQKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRplrJXZJVN+F2wF3cZdS6/UHgBfQlOzC6UnxbYUXXzVxZ4WMiAJtTgOgPtfQzE6hztYT9XRgpiRVBCOdgd3KVXcby3N1CGBeguhjN1x296R9QnuDwN+CqREYoJlteuIttyUbdEGYohfx8BVuHPCO4yvHmg+y7Vik18hkmIwTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1ih7L1+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1ih7L1+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so2606673f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538512; x=1782143312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=r1ih7L1+GmodUONyenUhHVQMd5IVlMTTHLKcChGYJlFfZYgEOe+j/2dknG3CbWpj/+
         Q3xuYh8w3FUFXXF88cdQ11L8nVutEf+gQN0QMHMrzKQJnmsLdIVsiAkFfYMtx3f5QVxy
         ChRbKCtXsYnh7efJMz0vW/+LY3MPKQsgvM98TeuICuQcItQWl/D0Mu+cLEXXsHlWVehy
         ogfbP5lnIYnUvKRSHzMeAD6Y/lwHvIRPiF0fGeUhlHeeL5ZCKzoV7/HNagISEIbpcKSi
         AN2ZF14tEy2SzhZ3DNeWJu7e1frbA+kb/dsQuE4T44rW5kpwDEEDRgjMRByLQb+bsE5L
         rbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538512; x=1782143312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=qTys/9YZBtgen20YUTd2IcYt+oCE1fBZHw6PnfmtTXoYQmeReAYSdElfcbf68qWiCX
         9uZKt3stBCi3x00WZqFem3A80a2DZJjLMCz/455rv1MlXe0T4N3cn+w91V6yJ63M7F60
         frhDdGtezqmvblakp4VHpyAOMPQTKsNDOS3cNtiCNIXoEbGWeU9f2H0UzH0IwMvOyRIN
         VHhmR7EiwTdGmrk4Q/B9+IKfqE75zyECpcdaiO75EvomcYcyU4knfsSLmJVeEsAirPWE
         ya4Tj8+XydGsZFV1E+ugBZoiv3SoPrvx002pGT8LYBHbUDsbbtOQbNiEdOM1BddnvTI6
         4MkA==
X-Forwarded-Encrypted: i=1; AFNElJ9HmhICv/1O79YoRkbojJCKijQzj4z0wWp5CowmZZYfEzcTw+Q+qqp91ek8qtL3VPgGmTSVHj5JSoPO@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgNx9u5uZdWYjUqcIiHfdIUK9OM+Zr8PKXK7avk3WiIB1z7d3
	h078kQIT1YjlawW3pijd2sEbSLHjZ55wVAl3EDctsoiGHq0TT5AFSHazDDwDdp14
X-Gm-Gg: Acq92OGiYSd+ntxPshydWuMZE+rNVEsDFPVCOPJP0vrgQubIvAWXnS0gDzSfz85eMnP
	7X1ZBp1RtOilCrN1HeQO/LSwiC1SBnKdJgBxVXlHolvGVC46IGADAcirQNJNR3IQNSwuaQQNwb1
	QFPfgArn+SobO7lYrq8a2sGV1CcqoVfOSwi2K7Tg03jq/f/nlMp2/X4ToZggspik/7j3/5rATpH
	fsWoQnxjmPQMgfehGG6CNX6o4E4qDnLfiWjcdEDiVwaQwW5o8aJVvN8RFPe5i+j8Ku+DzT/eRjf
	lgj399wroysnX4CfnHuLtLE/h1wAcx9nzMSWdR5P26E+YKU5nd7HZCTv54NP0Xs/b13v74wqyBo
	xHd8YzOsp8pTzj6T2Ta/4OnJWf6c0Z+ShdoRgNyEQ85ru+ccMpm6FiSLnXVIyzI5mwPyl/B/tjA
	zN32Lp6FJBuQLhna+c2Lyyar7FKHQ3FXMBKzj5jgOjoJDynPBYNCWwSww/GJQtpmHUnABOGGQgC
	vxHCVs5AliI1vKcsB1F+KDFokD8lCpVccgL
X-Received: by 2002:a05:600c:2d87:b0:490:e18f:d0db with SMTP id 5b1f17b1804b1-49220104dc1mr93190035e9.26.1781538511922;
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 16:48:05 +0100
Message-ID: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new compatible string "renesas,r9a09g077-rtc" to the OF match table
to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.

These newer SoCs integrate a closely related variant of the RZ/N1 RTC IP.
The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registers,
those registers are not accessed or used when operating under the
rzn1_rtc_ops_scmp configurations, making the current infrastructure
compatible.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 9f9cf9882fc4..dfff8dc8c321 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -597,6 +597,7 @@ static int rzn1_rtc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_rtc_resume);
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0

