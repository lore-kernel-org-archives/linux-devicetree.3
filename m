Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599A35200F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942657; cv=none; b=RNqFg6BoTOcxA2qLuBhAI2bM2Lbx81mLxM1IObhnYvlOaq+Hoo3PVxOSyG7syU0cQxPcqakLhxSNREpfeQEqwSNCtSbuCvNSwYuCZpG909wGTlfnhWiIkvETm9gjPMHTLcaQGc9Wnewv9N+sHTW0W//8Exa8DkuywrPi95fmwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942657; c=relaxed/simple;
	bh=5dneiBhhffoEYowN5rHUIUIaXuJyOIeTYGA3L5t8iSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaDS4HHbXJdlab65d8Zz6TGM4aTgNujvj2me30ddLgIAo416g/bDJCYCoIoezkl+lVdVdHUxYr2Xw3ilqvFytHVkVH+K2f5cJaaKaLnK6+KbWHA3IqvKMjqNLwm4Zhajqw2LhV8TRq/z58l4Qz/p6UnKvk7STg9X2gzpuPhxQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phHd/X/K; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phHd/X/K"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8016ab5f277so327332a34.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942653; x=1789547453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=phHd/X/K2rfN8pLqflGC18s2o615uiF47M1hGLRf5WTOf9cFzT/ciJ4qCKTUOsmRMy
         GTdolOceu8BrGsMgkByAkM8soaBj6kNi8yxqhoG5nTGsX3Ks819T+2t0oEELxBZL2TDX
         y3/CGlPa6TSdCkYJu2xbfDzFTE975FTEVStoq54cqOCEZB1RSn6Nf9OkXARPp79oUINq
         kfb0aOAtBWq8YoA2WYMMYGEWNi5SPqgu7tySlRL4gfzDQzsqmg2H7nEXhJfy/jxxltxi
         +s/GFOpGixg+yWghZG4kog7REqjGWCEhEfD/VkhppoLpJPjdu8ocy+Vr9PVv8+zNC7BS
         p6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942653; x=1789547453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=MJN6VG2THqFHvJLHqYX8xHfGNivL8ktdLeB89eOritHCOntLHDmUzPd5pS7f0x+hOp
         3XaN+uvGEsh0HQISsGuTgm1iQCLshQkUTpCq1Ef/PYkDE2c+fxVEKDjFdRS15BHF1d99
         1b6BcP/UoPowFl7N77fS3dupiCOVGOM7eIxe8Ka4xkMN9BTn6m5C3vdz8YLoVs5Ts4gV
         X99eIvwznONiSuiuG7/KZuKx9y3bgfEvn0q3qDw5+vXon6ivvGRj/8WhwcmzjICdDFSp
         gFzpC8FdnYwI9F+SPlHqScOz9emaGpfUMe2Mx0URNZwA33ZpKdLyjRcrhxC4qSOKneQc
         6bnw==
X-Forwarded-Encrypted: i=1; AKwUvBxe1oC9Tw7Io/hC9pO/zcPqq4RpIDCUrrXLz7fe3H2PhKyBhpJe1DFd6vq7MiJG51ec/RQ+MeEcWOzN@vger.kernel.org
X-Gm-Message-State: AFuF++mVDbvOPrmPSiYKpLlv/UUfhjRp+UwMFJhPdQzrJmplrONQSS9x
	yEVZinu0GUyBRfRjOb5h9pNqCj/0VhmF4ep/9fMruU17m1MvnfE8oB/VmOfAGIWi
X-Gm-Gg: AYBFou0h0LjrWJr6Fa8keS8oXHuh89i4lRxEx9GaaSOu3AARvnWzZj7rRoOya2YUXNt
	TK7vrfRkL7j8yhyBRjPQVHvBXa9vJ3UOHz4MBqm+sKu4OZ1m0pcM9RZxFgU7fdLjBpofTEdEndl
	ldnXB7Goy8VG1dxf/Fz0MqZjpbYg65lQ5EA7aXi7bhZrETSgGn9qWeCp33CZ9076SOSccn2GX5S
	98Q6Lg9WhrlbCamvsTcJSRkCLBwdvDhhZdavwty17lkhhbJi2xQnVEQyEyyL9RQYs5+QF6qCnQO
	DQ9Ykil1pflqUmKAztKWuTqmj8T61aj2O9/TRL/qjQMzIzFnaMr2bIyADQZeEHnOXZIJwpgPRzJ
	phQ+/hKgIZwIlnqpNemaF1pcbgblAqWT/pQ7rl3L2I6gZGXa7QwMMF7ZzUKZlgtJd95oGFOAOyG
	6Rm/Y9EMXG9CQTLU9ofTauLsxBusCRrg+f+/AYKLetuw98ddeEIi1m0qJqpWzx2qy5GYTCQ5n8o
	QfPyx5o3kBVIVMEKeGzfxps0+UhyLLxPDc6ma0uOqi4YUT4JTyCjj7U19nkT6FjhqLB2f9TVe0Y
	kbEdjSQU1kV1HQ8Lx4v20QdNSACg9HoRUnpTUQ3RCBy57QoRGZAIKF2vF4DrSYQ26Ubrhyf3v7E
	gSmI+jZYWD3gidbLG+8jnr3Dgab2A1w==
X-Received: by 2002:a05:6820:3107:b0:6b7:46fc:1df with SMTP id 006d021491bc7-6b746fc028cmr18530314eaf.62.1788942653399;
        Wed, 09 Sep 2026 01:30:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:34 -0600
Subject: [PATCH v3 01/15] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-1-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..ab4003ea6fc4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -999,11 +999,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1057,11 +1057,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1143,7 +1141,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1311,7 +1309,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1408,7 +1406,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1672,7 +1671,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

