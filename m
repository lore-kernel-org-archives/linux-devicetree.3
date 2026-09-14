Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD84365A1A
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354924; cv=none; b=ILeluvQ7uvyNhPDoum6IIV714csUUeNcA7twpYc9bGaQXbLpWEJOjmlfY+MT3lwsSQWnn8rtOPwrgAcYqFtwgfJRKs3JJRs+8jv80euUeJHx7ZlkFiwamt/n9LJTwEzlxkcmRRmOLedjkKck8DX+nhTU+Y9JKi/virIl5jEBG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354924; c=relaxed/simple;
	bh=9yChzot1ui7noQKhTCzhe1/zvJdG1xELLE60VMQMFlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7nV0e6KkgyXxpXYPf0Iv6fgNez2zljrW4+fjUVcHwyoMJ5W5kwVKKbDLnJ+cQ4c/xfBMuoCz3aiNd1H9Weo9hKNlX5dbvFtl6L2FltG8iRzCpZRR/pGUU1LemDt06njFdEHONxxsHdEd4v8UhzcT5tB47VRF5JiZ5kSfT6E+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T12uBWq5; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T12uBWq5"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1513359a34.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354921; x=1789959721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=T12uBWq5gfywAqFjPOno9Szyor5FeGw5rajKxKOqXylGoxWBadMR5DI5bcIazkk/8y
         kapDCyBrW+iNRgkgJ4KBtVbnNoFR7w4nqzAyHat+rGvV3MRAuQvlpVPTGAJ87HAvX+0O
         O1g+l2B1k53ouQA3XzZaGamXKmtJ8hMFg0ePUpobSqBMW4wmr8jRvfUqir2rplTdIXMW
         VVg0taukSAsSQsyJpCLHhppvz7TB2N1XZn0OmTr6e8qmY0A3zqqEs1h0zRi/Dm72IKPQ
         dkhZq8u5Vv0TAkuV22QMUOyrPP2DLmxf54TVRJya23WhDY5ZV/te2PiDkOb2qgPO6BXe
         Qsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354921; x=1789959721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=dfXK2/P9m1n9NMy+ifk/LAAavjpGurl5LMCoMpD53npLluMaL5qhC73QSc4X0vY77u
         R6mCbWbg9iOj0qhs2TQyd+N6zIocDaB0l9HddLkx3IThtp54cTdarS37H076zyM6NvTO
         oOl99hGEiWuh4G6jccJ/Sa4FxJkLz2dzwTjke3F2DINfpyE825qm0ov2gIaCde3cYT7V
         u7PbLsQK1o/JQgciXkLPjGA+QYeCVaRyFk4hkAoQT9hkZxQy2b+JFNuGEcy06I9Npx9J
         VhKOFaJJMkZbCVMtXkFAa5jFliRkMvSVSMsHaGx81Cy7IDuMq5KtoyPb3va3wwyp62lv
         un1Q==
X-Forwarded-Encrypted: i=1; AKwUvByhMl6CGK1gmzy5sCqgE2PxEBZA4kOp9elALVjvTxtHKX0CeQZoMGgf7snGUrkfg48+L4gr7zlPIUnN@vger.kernel.org
X-Gm-Message-State: AFuF++kcLeVQa/ISGSW8va+mlPj34wocDBbkYnYw42f0vDyky8iOC46l
	VfF4pZHjNmvGsB5z4Hv31loqeRU1WTqB2q/8iJF0QGMCXV8RhoYs+JTQ
X-Gm-Gg: AYBFou0I2LjGSEMmJOuapU2CJ3LB1Llg3h2Ak2dUfPvN4wjHXm/8QPqfm1g86DECTLO
	UVvHmUXuZ8zm7eCqa8gr8MW54OYzWacePNfABzxjjEqFsTawyPTuCQBlq47kSRDaVjYRc3DNuXJ
	2+N7JQiZKzggIS8jiWeDx/a8moWApCOLYy51qpGyiz7AZKxoR7xs927GPzUahdNwjY0JxUynJ5L
	e9J89TKA5Bsbf1anNOX5BVD3+37T1B+LcNszcuI0FvggcJ73VEb3ezx/s6SVAKjkTeX85vksbvR
	lcMIBU8aKCr98DUwx2zCGaStNvUZXWQN133ShlidVmOtUXEI9C5McvB1qbzqyNbU0AAZM39hFM3
	FSxeJlO9RnMuttLbRbkghjCbltnhnDPLugZ9UCPj/2p35fYXbSoKsRCum4/bHmFcufwGpSD1Rgi
	w3sfUZt9Sb78DXa77fDc3pO6K7DLSQ5O0rOmL3CdAf58Q/H5JJVUpDq85aaLw7ObuGeMuu+nH+P
	iQPVUiz7CjUQ8J+NZkK3RCKgKclhEa7/U+UuadoyNwvsEo3BQeqjmKHmWp5H7vJj3zDUXdmkDBG
	1K03lNURoUIbwGqnlFvsW9U33XKtjzJioWje3/mmr0FTgvSp/MX51TWa2dPWFpjUbkmKEvlQh2H
	A0wojVR//74gjSaGjW56K2Z5UZ3Ky8Q==
X-Received: by 2002:a05:6830:81fb:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80897097a7cmr492616a34.2.1789354920841;
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:21 -0600
Subject: [PATCH v5 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-15-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3fb61a10a441..b7ac8d7b0301 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1421,14 +1421,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
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
@@ -1439,10 +1453,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

