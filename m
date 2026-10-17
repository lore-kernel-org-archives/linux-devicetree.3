Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF4248F72
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266800; cv=none; b=OkcCAhb0qFT7ryz4RH4P3M1GtUJ2YG88fQMW580uKMJ1kdVE2FEO25paphYCSFStztXiH/bnTXL5dXgorTh0K8TXvz6LVrKIvOZ2qjIvo934fAJJDdsXHwTr9am2SQq8Dthkn9gZO4i1VESvvnM+3q4AZiYr4JZiA+qXUJLS2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266800; c=relaxed/simple;
	bh=53QYWE27UsXxj+fYmOb0Pfq2oxCp5h+os5EvQeG7UFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMoPwPwSTALjE4yyM1FCeBWtuJjSOBJIsftV2/xDgEYibXdmGO/tjwKPF598gp1AAUT3/XjnzstCer3cIbVIswm8f+PS448gkxhKWWc//He3H8Bv80YF4oIJ34Wuh6Zy1L99Fo974XYg0J/UuhV9Nv9IZy0/A/faXJxrfm01/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgfIDVPv; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgfIDVPv"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so1044930eaf.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266798; x=1792871598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=cgfIDVPv8+fFuLcDNp7nzcOx9Vk83VmXpeUGGWjbmFs9j5zznVLMycgZ+Wa4B6CUbm
         3rGeEUe1PCMip2r89xsjIwEDuvpl5munu5+vub0gIH9rFunMSt0RBfYzr2ud01MAW+l9
         tdIdrE05KyavBU1cFEn+lWyfWZ49vqdPnfbPJTCeERwFbYB1zypy9GBj3RTMgUcyjoNZ
         zYaHndgmlY5D2XxlP0yJdATVHgbI72++c+daZqW8+h8Vp2yyohpEL2tGMfDjgTxhXPkC
         FEKPqyjY+MKAlJdliEzCs980oxNaFtT2QMoWURiweGesl8KYI/FYAQ3i529DjJIhuzgH
         p5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266798; x=1792871598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=T9GV2KgfHaZekjzD+92QAZfR00SW12TqSzC2Gq8n/Ybr6xM4fcy6rs1Cmpn2iI1Jrq
         RCqXQXRc72zgWP3BUbrO9VvYaasThBU/J1TM/20x5qqErCwJGKrrEl1BH3MUhfod+BYM
         GTvLtj8WccXvRsbKt4hXdbmtVc1n1/02M9jz3F+8in8gNIKNq/bqEsNmPKMHNIkiZOMD
         G1she+2y9HrDMu0jOiygyu/TCD2yk5iM70hGymzWGyacVmTiJIBaBeVJsgbR+tvTkSpH
         +xmeMyldG8jKaE92pbVJgzyCQQlgmr7tV7wsSXlhHk3k1uaE296N3WbXLdQJMLskzyut
         F9Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzp+L9iGbDEcjqtQwjcG5GT7dXRy+sJ7E/fJ7ExZtiRo2x9ZppjlhGYRCreI/rFgvYEE5g0BAEPph1B@vger.kernel.org
X-Gm-Message-State: AFq9FYIieX3T9aCg6RED6K06EcUgd3st8vbEEwFEGpCoSN8eflnAAZgz
	SQrNR56DR1UtD7hsLIZBEJwA7Xy4h3VGv4R23OEK7yo31cu7joT/yeRn
X-Gm-Gg: AYBFou1eq6p6WD5HRWJPDvthQsTDuI3xEP4zq0DTlXBNom7DiApOPHwxeJLsW68a7Bq
	vOlSzWYVAPKoTTx6wYg6YORxEAfW+1DfHi5D1odwql+Y+RETNeN/ivfDfpJBqxH1HsbW8l74R6y
	pwNB7MsgdRNvTSfBCIuk6L3O2HpE1Kr6UdoxZ0Ltg3TAnYTISTbpNml0uvtAxzroCx+JDynv4BK
	5HRiHkgnDn4TSQBUK5YkPd7qAKgGltdSzWK98E8HUin0L6OAHgeAZ/lriQ5F7eb9L8EtFZByE7i
	w6f02jzT23BmTJ++EKFT8I0DeRJRozvhJrM0bve8ilr4TXbJmJ1Y6X3Cr5hc3J3oY9kD/OdvL5+
	Y0YD2JZ7AHiFzt+Z4PHAJ1wlo2kw3GN+kKAqblf4jrhY1b4TAkTuB5dx9LfivweNjngm6wveH+Z
	KHLG8cYfdAk+onijviec6u6mQ3QEJZtea42KDPvMxgdz5+5qsSQiAEE8atdTn9S8Wi25g0DVcEB
	nru1TxvlCZNFWertv7ZM4ben0btU4a5CPSJUysY61YkCHtQShL5Ybci0pYSE1Aj7waNLWICH2We
	/zrVsrs7u9KI37Y9fbi5Ntqp8/dwycUlcTPIHqsJNo1Ntfmga6JtOXUMbtwcMbbmndfiYBBaGdA
	IS1xgVuMIOBYB/zUaZHi2LYh22II7EaScMbXQrEx45c6S+3uzPEMFaQ==
X-Received: by 2002:a05:6820:c2c7:20b0:700:da68:7396 with SMTP id 006d021491bc7-70357791d36mr1496668eaf.67.1792266797756;
        Sat, 17 Oct 2026 12:53:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm4829795a34.24.2026.10.17.12.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 14/18] mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
Date: Sat, 17 Oct 2026 13:53:03 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-14-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a12ec60c63b4..993e2efcee04 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1655,7 +1655,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

