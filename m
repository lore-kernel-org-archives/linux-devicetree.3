Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E4390992
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272329; cv=none; b=blxXt1HFxJk5GEFuEHvhASxpExreWZlf6301XGJ5PgIavRYodMkvo+EHJL5pHHBkE+axCNqvEtiWe61HZbQW+vdPjpU55qDzXudPFSUIGlu4yQ9Rkg/NJDj59glo+N7mQ6Ro877KnAbzKtY1E+hfxmGcVuoitTkN2RVFMvN1uD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272329; c=relaxed/simple;
	bh=z2BPI/pmixq5cvuOueHRhY4+nASimyd7pRom7zs4YWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hztKR4nB8p16WJ2RH9yP0W6luKF3+CuWGWkcDe+zjYdSliDrGhS67lmtYTkFOHvsJXe198RfkizBJUAwwnoYR2sop1tnT1k+2HZl0vMzWtGWgDm3bkMhsbNosgBbqvmbYskPtohPwlRO+9JdxPDzLg9YgqXvkmGyuAQQAzwxXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0mC7oVB; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0mC7oVB"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46f415ce6deso1178487fac.2
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272326; x=1789877126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=G0mC7oVB97qiFJZshq1cbmBnqqgxl09weKf82hbCoFvDr4a8AO8brwNLKvbTEaAcl0
         BROANUkR8412GPBf4RRHiROm0M/g/+vvLjziMqUBlcaNRNbi9tHs+NC7YWXxKaWE4YiU
         7oFXHUSufFCFJSNlVCz6+QKJd8/v/a91Tcl+X8h0mYb3ot4yKQKQrlPt8owfOEWXolX4
         vET6kzzpkU2wKs4p319zgraQuMXt9z1F9i7yMeFokFcomrHmCvtgOlzh7Oe61G4speot
         nHopnHSody4rky8dgN8z1+CTXOD2nNvDuEyEHQlAlcALO6bi6/ltEUt4qzbiSaA6bCng
         LD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272326; x=1789877126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QAhKpDJSEoLKbSmhwyQO7+fj2kwJfhM4m0kCMZtpNg=;
        b=UYBqwO1w0pU42Llzq5BXmqBZ0HlNy19hOAuzrNx9On7QbuFvWDjSVP5DYEv/4hleG9
         stJwDgflrp7DUPIH0UDLIjo6qyShbxdpTXPhVwaepQdXqkCoYqWkiPJShb+bA8DthWqv
         3SIe9N6fWqJKcdexjWS1vBIW+S2VrKQAwgIPs7gcTEdoH1oIq3q5ufPhd5BVmH4f7e9A
         g8CjrXL8MmMCPfSi+GUprINSSTAJJTKlEPcRXuAndRvJZlxGPCFrwWSQV6yqWxamxD/k
         DsL5e9iadGeZAxHHzi6QqPdNUC4U52g1JtRKuf92RCHJ5wND/UKcR12ksoOzZ1frJpGr
         xsIA==
X-Forwarded-Encrypted: i=1; AKwUvBxtyLVHPIgPQbY3gKzEAdhK+pk202IV7BJxs4KeRBnXkZppyUZZDU9hqGpQo1rScTnIQrZS3+yxbF0z@vger.kernel.org
X-Gm-Message-State: AFuF++ml/SNkHtE9DaUZJ3Up/9gKGcfFWr/xbb904948Gwsafqw8aimM
	hDv91iOOE5XCWBM1Es81WAVXOdQlkCtXPL8TykLRpDaYN4B2d3plJnWi
X-Gm-Gg: AYBFou1m7EpQ5LX4q7V90TwEqKqeJTdE/s+ajHGJDPVwxRpjwdmClbUSIiDOgJPvv06
	7XiTFQY4XmSLG7UgalmlOYbkiv1l68FqawqGB3NwlrQ7EgAj0z2OYTzWN4zd8HReUY7ynALff7+
	fARZvtSUMadNfL4lMqKAvSC1gKSpboghoblGSpjD9Ms+lSKHpowsOMmGz8GSIOJ5PLRwSe4lFqM
	T1ZvyOIJDpklKNoKl9x05uZRZ4ZyHgaZoG5uppROZCYws8yfLkGx6vzd6/LsuYg+qb4GOXxFz27
	liURy88jtlGWLmYnc1qHOG9PQ7vg6DK0jh6UvmkVcn9BvULlql5xePNM7cs1Z52IUc2KD6LYQm2
	XAcU7hUwscdsTla9G4lK6MaYrWQv7aw1JLcPd+qanNWZG8D8qlDGtPUQeULppxslPReWw24b2Ie
	QJNfjyIve66D5lkWrSGJ3emW5YrEJ8dAOOSw7YzPdIkaGSJnw4b3MaY9IS2y8n2/R6dd1cfZdOT
	ILJGLBkttLymmxEyDtUqT6qwHE8J8ZeA/rM0lWLSqkl07GY5DxGtyVmg9+Ge1DjM0iwGLeDZpu/
	jO7w/lUnORP1TW7nVaikb3XdHW6Tv6x/l3W26n+WN1c0zS/7Zfu6czmtOe1cB/l2ETx2QlOupjz
	t9LCpKn6u0riri95YoNxldVf7O7+qpQ==
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id 586e51a60fabf-47deb6b21a2mr8028318fac.37.1789272326342;
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:04 -0600
Subject: [PATCH v4 13/17] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-13-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 97a4b4470dad..5fba3c111a4b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1424,15 +1424,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1443,10 +1456,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

