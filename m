Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B9331A66
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122334; cv=none; b=j2zaRz2aWYj4lUJVN1kv0iPbzQ1TXMFeT0ocPnU7ihtQ0hRIVbZ9LJ0qYHj4YioAJRUGkf1yAscxRfqYLKLymI2nJb99/Zy9q6yJ+8EqyqSaQJyaZTH8y3plySeu/8jAmSTF5A4evXMXGdRKxrL8NgGf3V9WTjN2vMXsDiP23xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122334; c=relaxed/simple;
	bh=5swNrnjhpqGxZeyGDlWe9TNZCEAsFDPalqzTOJ3Aefg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNbiaFaVi6AI2duwqmcj7aLvQDiCdMludEgVpXtKHZ+0JYwmdLcw0TRanLtPpg4+hGYDq+wSxSkL9OvSAx4bBQ3D3LiiiZ7pbZFnIJSIDowsmnNgZVKZJBsyjCu6ZtJcyUGA74shm10WmPCL0AssTVt8ATFo5zt6JdyE2cUlvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoERHVDO; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoERHVDO"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d7e06dbcccso3679317eaf.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122331; x=1792727131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=XoERHVDO9KroWu7sUPToNRi4ONvhPPV6YE8g2bflJP/U4cuemALja0TDAYYFsFNZC9
         ALZRYca7dyUcA8AVcrmLRE8rZEhUvfsURRGReQlDL7B5XaIqrl6k2QLA6arL2RL1wis7
         dgcAnEFas4msYGEJ2azzZmQS5UNd9sWpUoJUSrJ+T1IQ7bUm382k7ccTU8lOrGODV1Tr
         b782ZvfdGK4tKpBump3wrCacQTpEG2Wu5wIr51OLAmSfv8tFUQda+XRJxneBiVAo139G
         u5yVpa3Ug2C0rGgpEpvklfTxBB3ExA4OWpuTc13qvFW8vwPNIbXA+IrAVp5ka+mv+Kgp
         23JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122331; x=1792727131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=U7Gn2n/428HVSAHfWIQbhNoCIeV8bIEZmzZGSwRjj42VaORmOrAUdwLUV/yYC4AE8e
         t7Sv0dnfjA2Xx4Jwj6zOYYgzEtJP12tBVL+9eGqPnVeGImJV40gnpEUZAmALFhpPCU9C
         +8bm79BVCxK77exX9u+q6qW0KDP09IS+iA5VP1iH258vb149a/YkVgWFrz+yhM4i+MDz
         mvoI/ooSPyDv3MmMAY1oxlzBJXNPQNPqm978MnEQe4aV2gLolHJnCvP/DsvOwYml4HNN
         XkbZaDuyKyEJIqlQI//Qhw65EGPwJSg+vdzKx/hr2HZS2CJUjfN6KBoXEJa1jC55UyXd
         YInQ==
X-Forwarded-Encrypted: i=1; AKwUvByegyYkdrIQmzPmnorGfMClQXGfKGhBUZ+mEmCW9IREiaMBnv9zfEy8zikGIHZPyZwpsWnY161NebYj@vger.kernel.org
X-Gm-Message-State: AFq9FYLYmW8NoqrvRRbPDn63QlI8LvxBNcoA12PEbQyEcMgbETYdsVmD
	Eslr+nMILvMyWUVqEn4tdF3pQPQoAqZh53yp9af4kkUCREAPGw8jWg85
X-Gm-Gg: AYBFou1wxlY7rOGLtM/ezR2xz35RML5if37vxbfC9tLSXUlH49B+XsNxElqPsOD//g6
	GRjnjqkuMMR6yLTa2sis+JH5iXwX1ueb0KbcCqHDqQIhcDIu7ar7rO3itbSOhHaZFKRXmeoApN9
	Hv8AXxka+zuU6WGMjQlgySBS0T+d8dCv5ZrrXZ1/zquO6wpjj64DQdbZ4u5CD3nXwF1HZTOxiDR
	VqnkljnF9b1MWsptcHgVAPyCmGF8r8HQ+NBwmOo5Ia8HGma3kEZt6aRcWgShtVyyA/dOSyaiRJJ
	ziRTw0YSqnMuWRJEGka1kjwoIvRskwD8fEsjM8Xak0+OSfoO9PnxbbtYNVVBOcEFeYm7u/Z8oDg
	0EkHzMDQ1a0bOEXjB1hT+yE6EH/oJusuz/wWNA3qwiN1QiJqUjrzLYlleg/xu1LLifH+9/SUwfz
	5nBSHqHNmMeI7PJwmiCvvWzwXv/IkGgtwPG6W82c+vycxJbrWorTZoepPfErADC26PCaALic0Xv
	sLnSdUJk5Sa8aqpGl2fK+2o/NLCcKpa0+2vnujs/n2tPkHjILFzPvUjwWv3CjxmaU861m4zKlEO
	QDNNGEUwT1801c9z2Wpzy+XBGskqiGZ1EaSc0bEffyZEczaliFxH/E0M2raUk0GioMjE8xAGoqG
	lM8DpucIpvADaoDZEuqsD6Q==
X-Received: by 2002:a05:6820:1503:b0:6d7:cd0c:752a with SMTP id 006d021491bc7-6ef0faaa6f2mr17901293eaf.54.1792122331029;
        Thu, 15 Oct 2026 20:45:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:18 -0600
Subject: [PATCH v8 03/17] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-3-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c2e97b8656f7..6c0d3e2d2be2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1030,7 +1030,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1042,10 +1045,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1317,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1325,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1378,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1456,7 +1478,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1464,10 +1488,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1480,7 +1505,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1505,7 +1532,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1514,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1532,7 +1562,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

