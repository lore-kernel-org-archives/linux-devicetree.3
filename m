Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD283033FD
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028081; cv=none; b=uShlMlZvj2mA7YwjUoMoHunLgYN79OiV5wyDbSiC+mU0L32cADLIXZk11LKGpZdtu68KV2bVn0msu4XiPCw3IRz2vKwhUbvtU1j/Odj+HA5jqA1wQIcLJdRJ1TvpPO6Yl/PgxnJCm6fLI2pHTSg+RyDtNd+/HbD5agzUvB1vUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028081; c=relaxed/simple;
	bh=FgRIeZq0vBdVC5LoWFzee1DIYH44/aMP7otHatXZZIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcPoNdJP4MuibD+/zFRzojtWqSeixTAe4QMyiDPJw8qaLO1aCwcm91EgP/wxfnrymg0N0ucnQ7vgx1UGCtQ53Kzg6MLgbcHkxafGi1Gqn/3X1C9uE0PdAHl6ndD0m5Y5XEsbMRxBG2RV0pTiPr4vzbjnrPqDChw3S3hV24osmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDWz428/; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDWz428/"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a71d0c4233so3121fac.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028078; x=1792632878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFOJulppXNuW58TbWJxKvDHpAzEnFrxmkp8urYvlaAM=;
        b=fDWz428/A5NTbalvNW7X472iaddaqwKYza7mVeWkWgybP+Z4p3xcECKPkTwnA4mE43
         9nFKp+e/R1jm7XHWlJVLndZXICYXQE05EqmHuJ72nebg0frz5ueycL2fPgn8OK3GkMpD
         QVJ+0fJoys7qjEOcBVMuiw418KYtu0nq2360UiTkzGOgQX/05w5NpCtN19H68Qbj2Uex
         VD2iiwN0xW/ONYax0iEsfbtHWamsJ2vEIn8Ye9a55u0tsaabWT3xaGvNpCbk6aUSZ0AL
         ffNSdELh2qqRwSQ9Gi7sdz0032KWfZTl1YD43yDhxkCy6dMc7fvna4GArMIL1APE3y3w
         s0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028078; x=1792632878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFOJulppXNuW58TbWJxKvDHpAzEnFrxmkp8urYvlaAM=;
        b=omMtAv4nVfRvBLpMEgmuSN1UkO17LiJrncVRVTQTxgcLDrVmBLVB67BJDD+M8sz2ts
         EO+28Cdj9QvucCwm45Dv93GOOQta5mL2WlPNM8S0HWxq0PQ8Awaivsskz1CB0AF9uTUs
         TqJhBnDcpQLY0PTYARgolJdzUpAhtKJcIPGUg8sdOfLYVgMpvkqoP1jKHfmjUjqitHgJ
         GgjplRx0bqdOCPOJc48BHBlUyUZSiQQyIsQL3QANESAhWH20NzU0py6VDf0fXrkdBKep
         IyR62YR4+u8FA2ausI4GCuKBhw/0IDOhU2RbOXscXkaopNm1j+omS5EtfyQYwVvBx9Mh
         1ngw==
X-Forwarded-Encrypted: i=1; AKwUvBzzAu8B062rHAXouVZHcuGpScjqKLDZLLNP+7bHHgjLp/12pzTXrprJpUQHu6IIizj/locSYIsYTkD2@vger.kernel.org
X-Gm-Message-State: AFq9FYLI8z2ISjJ3HxWq/dx6VI50OvQMCLwiAYErcQPAyoGLOu1LO9Wd
	nsOAN9ccsph6BzHnrVdNFjeVySSMq6tW49xq+c0C24CJDdIN2LLFbvR/
X-Gm-Gg: AYBFou1bgAko2J9KTVQxMUG1neblPwaOHhWPWFheh8hWpSGq7xPX7Rnp3PMUVLP8vme
	TeP3L+rxK0SDLi+pZDKNS5r4wHScEQrE0DB0F1XJWK+Hdnw3wGtT/qgZRlOIHQD9Gob2Jmi8sFW
	HqWQJUpMOWA9vcyJlxe8k/oP+ovLBUDQgrciVMxtqEgbWSzCL9opOvkPOXrUR8YJow/iftHwoMs
	CkuFluirpQWwGZkVST1lQ85R55MNbIQI97TGj8bf9DrfgtG+iV2cvt/eIHZxvY5lXfKuT2Dgb1C
	ESIqNEv+eAcMmbtj0znLfwPybxmzU/WL+HMAww3vu1K118XsUO1lRAr+T+nerVBJaDEhcuV20Le
	6aTwEc2zDayfmlFe6qH9a7/8b3jF7RPnjKG9wLdPL8rlJ9207f2iik44PK2KXDnAAf1hVmPmZRw
	0d28RcscSX5CfC3vLwPpGpoEn2NB8K5uZpckyj6xZzX9+940GZ288g70/fP9Ubq/4IqMEe/DiUl
	mzjdzpRfBHftjS+IcJgEg3gz1pQLDkNaff8geHw1+CGDT0NIZP6ntRTyF7u2Ka5iN2Fw8FxbYvJ
	T0547euybbcyC8QSOv1BU0xtX3QlfQ6VyTWN0OkiuiQ8kRhDL4ZlWCN8++3uY2iI2ZEYeSyC/2H
	nT/9koMn2UocWKlEjDyGIXotIlaWVO8o=
X-Received: by 2002:a05:6870:b3ca:b0:47b:7709:5568 with SMTP id 586e51a60fabf-4a2a89dc998mr15538918fac.10.1792028077989;
        Wed, 14 Oct 2026 18:34:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:01 -0600
Subject: [PATCH v7 14/16] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-14-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4e6fcf1e7aaf..601c272d8c54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1018,35 +1018,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1417,7 +1442,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1446,7 +1471,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1467,10 +1492,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1580,7 +1602,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1847,7 +1869,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1855,7 +1877,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

