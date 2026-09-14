Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FCF4A33F2
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420224; cv=none; b=d+ampfu5DDAxogPD9N/lcz1hQWqs8t+zX023WBQfZ9+6DMZWPFV1NTAj3tpgYwVF3YljQzXOQTwp9+BJ9WJ7a9iWaUSKoh03WotyAbGzMRVQGjLUqpwgytLm4Ae6hC6d0xFbs3E2kd7ewAFNElNKcCiHLSB0MwtO91BU1CzYrnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420224; c=relaxed/simple;
	bh=bniJ2L4Tvp9lAApOs8qjlReFeiPBCiiQVEC33ZRnv2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOUpHyZEx00DGcefNSAUyGfpC0pcNA+0CIbPIItK6QmX/EY5PzVg0k/DXBHezGC7PAZotpwW1VjZv2/hSGVMRsCbL1jAL20DSYWqkSrTK6bbtcfbduln7TQKFKyqeGjB1QzpFIQvJ62V4fP8d9HP6vw8YtfH9V+sRpq7ufwBBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNAxY3Bl; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNAxY3Bl"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c17f382ff5so866463b6e.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420216; x=1790025016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=VNAxY3BlJ5Vt6VYYxn4+frTvTYjOwLeKHWG1ZV+K+2dTEoHyhD1KWjPQJZebW4OGQH
         E7qGEtbmj8XCST9BCCDDvDbSlJmZKkjqKNOOAvGnyNmhMSLbHI3YBF7EUwnZ+dpqkMSq
         1WD3JvqScKIQCLysdfvwc4KIpmdI0dJEbVwx5CJtC/+vYsUzwQIcXC/el2xQOVbTtL+f
         lPpsLwP/c6pY5UCgByV48DUgWey8li6N2zgOZoKXh9NHNAy07boELcUlN+nW6tdl1Qbk
         6rH8VaDRI5fbLk7XAbHyRVh73XPEGmYEWjX18ApMow7xeRpKMvOWa4wTIAxRySOMD4LN
         YI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420216; x=1790025016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=daHhIKXSKZj1yLlcCXqxd3C+a0cmgDltMoNtG1WYteK6ihk4XMetOhdP70Ck8luaZf
         NKLnKBLr6AF7BsZZCFQycUD33wdzyy3+VOfaISFKb7rjljYnEMU39e97fBpZWARCBXQJ
         dyDaZJoz/CihtakCs6BIHTqtAG4KvWtWzdLWvvA+Bkr7bDtWmcOS66COKLjDaUNdfuPm
         fAvAwFLPPlEqla4im2BSYTVhjyvXQTu4O012//UqAv1pOH66b6LYbl1eBK5Qeu/EKRD5
         lrhexyNlG9vAKnMoEXF5QrSdmacPnZA60UkrJ1sFpgGdvAEIaKLpuKUx5j5rB8twi3sq
         i/hg==
X-Forwarded-Encrypted: i=1; AKwUvBxcmiOx6m0CP7JMnr/iLOnGgleMkEDdbCRK46aH38Ico/Bn50AtigxJ8Wqjt4TlI+yqPep8DuDb6Yxi@vger.kernel.org
X-Gm-Message-State: AFuF++kPhRcLn//aFe/M6DyRY9m2O/vnZzF3PHqW8bvkyWjmc8z28CYs
	iuQk+1bdwjcP/iIyQGik2Hd6/wBKVBObtDCyGRTK9Qb5ADKZeD07rBuA
X-Gm-Gg: AYBFou3kky6bor0mT1ZluA9iWghGLvzxSYFBNt0dTymma2QpLTfmWW6f5cm9mH3+yi+
	j76x+M4vBaBNNJ2VS4ovIMpyuG1anhHCxJMHBqiTJkRtmQqSRkG6icBQ0ec9nNZbtBheicuNafG
	XSjRQGTpCPKdr7a7Zm+5sPU6ca8RLf8QHzaBN7CEIQpjHmsI61hyqnoX96U/b4TCNWVES7ftwb9
	aI8Hf/1kVHukS6+r7aRmHahaAYgMECsVAcOKTpWtx0CYdrRSY7xadng3+9Lx134hcgNnBLl403A
	2gE8fdjV2M7BOQFJLQcJghjTRScqMGsrbZcD052OIHol9bzm5bCi69KUEbt0OYUgcMkPCxKnLpd
	yA6PfaFINLWKX+lszR1wW/k1ZFHf3nndFT/d4BrQreMsu8viUFl1CHn1BsATNC+iCMQa7we9iZa
	KucglYz+RBzyqDPtrdP5nyySAgL9JBJBz/NgB8AD+MCg+0Qn7cc4Kqda1gUXG38N9s3HoEZSN30
	913PO/tRFiRw/8SjCiWBC6AcgV9wG/ppgvcRcBIMm/i0aIetxXceGsYqOuKLl2S4jc18Nv2pqBU
	QCouiaJwiWTctTFYdpyMvIMEvGS9Rjsc9eo9mqVzaAi3JOfqPSccgjS5OOcwq7IQyHTF62k1bZy
	st8vVHMlmVrj+q/y2eiKcQ2ur+5oUuweFToODJXA=
X-Received: by 2002:a05:6820:8c5:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6c53ba3546bmr2248641eaf.0.1789420215927;
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:01 -0600
Subject: [PATCH v6 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-15-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
index 8b0d0620e1d9..f3234d2831ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1435,14 +1435,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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
@@ -1453,10 +1467,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
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

