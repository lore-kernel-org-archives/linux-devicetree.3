Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779B1D5CC9
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272323; cv=none; b=poI69ibpEi0OdydxdkN4ff7G1RFCEEL5+XTeNrZQ2sw37FlG906bXMAQyO0vgqnkRptSxgoWpQbxyxCVriODWS9itfMFCMCRV5cOJpXOnOk9xfYiah73ZWzGsT/JzPHF2I2tKsRUF+20e7c1PDJV2yoF2wPBcmHMtipV84N7wNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272323; c=relaxed/simple;
	bh=6QXvhJNkBJWcV5Ntyx9Vdimd7EE2MpJdJCkLfrX8lRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oB6wFOIf0B+pYXU00RXbL0O075u+FeEJYj5o9OXxzVHkeFVt+w1i5ywjJdbx3vha6Z8gSdqUvyp5aONJvoaYKrBJU8gbH7KAXoTi7TZjRZrFz35kdMF0hNHQBxEEWcJhU00Jiq8KmZ63Iqoyi2XGwHMFmmkLW4/n8LTmUZt0y84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci+DbeK0; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci+DbeK0"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4765ce0573eso1370159fac.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272318; x=1789877118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=ci+DbeK0LNidhy3MWpW54gq/c75b1E4mjWHmJjVEN2iwR2+NxNxsiY+QEFVqGHFI+3
         tbOQADtbKqe7LqYKjlX3+x0wlzb4PLpEt5kyZSalaQSDIXJiZMcz6eOYY/1KazaTik1v
         s9GT6Iy39mrcvDF1OnPcL8epaWUq0wzi5eLGcusZaHBNErMfBQSPb9qJbB/IEUjcnOa1
         1sAm/Opxjtmu4kbaOLK3UCiZtLIl57MC3BOtff5uX7bNAN9C3nneox0tuBdChe5ByEa6
         m2tRFb1g0zH8eb3FPJsuPlIOTBtjawSX6fb9GCUmmpdzN4mO4IhT/89nHYiudaUy4O4K
         nxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272318; x=1789877118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=qhTaJKsYU+gNFWJ58yXJOwE9ubFkmowqWsT5GIxYJgYVy9AcgICQb5dBPyWh3Z1sFb
         /ztBpHwb1qUqHgwQsw61yMN1QEPxhEfxEi75x5dfqy940o28m7BAimCEJ96BqdZcC4RV
         q8c+HND4kSr5jJfPM+q4w7EsHl5QEoLyxe+ySdkIXz1fda5lODHv9RDZfGrSmpEEaNFs
         IckjEZ8uzCiGWhgy+RsBjvmAr3WBo59hMmU8GBLLA/hpmHK9rPD2LG0dBJzT6vHgJRc/
         mw3pDaiCKQudk+O1a0lPz2sEPD8U2qMAiikS3hH9Ua14xgJNvXUiIjM4xdnrUmRQPP90
         PblA==
X-Forwarded-Encrypted: i=1; AKwUvBxIsrZ8gQE1L3mzm/cSpjva/R5qmmnyNwS1wvI1XIAzwfwsGXnMfDq+JtH2xkWkBKKYIy3bEeUfr20r@vger.kernel.org
X-Gm-Message-State: AFuF++nY5fG+4reyO5Vj+ChzQfbgPgmqkx9wlmBPrYAmGjc2B+QQOE60
	AgWc9/3lNC+u38MV5k0K21y9lcwyowO8MaVQ4k8iiIIX68vAXgRASpxv
X-Gm-Gg: AYBFou2nk+3OvMSTZOTzT/DhpbMvJK+Hpy09xXEhPd+B4kvjWS7Ic0iXyIPh+gq4e97
	GQCzLSD21tuMcjii+BS2AHJjaIUbzX56XGPYTV2L3KRgU/rCaD7tVatvm4SXISEaiGCazutrcIR
	+MbudW/yfLGB3gFPAkJaZpAbMvQeExWzmw/iyV2HcS2uJwnSLbwPdk4RdylszKCPYJ36w07XHG0
	Fj55xBNeHONo7EFJmTfE7dzEAu/O5s4Q+1Pe45AOflk7r2mXjd7SYjyJddEoEjlj1m5fC9z/3bu
	tM68CBjLjNjgN4rHgifOG31b8Qvaad34BaQrwq5rgyEIuR9H87QttLZpK76OLYBweNkH8Le3HlE
	IAnMoCD2z0L7q2towwxcDXm5I/2GEM20nOgm8Lv281uKjoky9Mw6Ov/98IIdSPLqevVtp9EKp9D
	gz6XxGMHyOv8jaQIxNio8QpqfDHUw9wFrLPMfBBWosNK9Ut5HYHuUt/qHbMLIq2+MjBb3kQ1JN3
	WrLC2FcDoEy3adqwd0kpPoL3+vLe7//CKarqUrJfCDvQNuTTeUk1xskooGT5mi337DovbctOXX7
	0sWrCflYItKF7lrscNPghqbs2LFWjS9I+PjfsfBGPR5lRjT4ahPm3j73cZGz9blIf1RpqPXt0LK
	l6CzqUqS/3JYjy3toLATZdL5KXqJEwbkA8Yc2Dd8C
X-Received: by 2002:a05:6870:8306:b0:469:fb51:b351 with SMTP id 586e51a60fabf-47de8fd0c3fmr7839424fac.17.1789272317809;
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:58 -0600
Subject: [PATCH v4 07/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-7-4a64bed94229@gmail.com>
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

