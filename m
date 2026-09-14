Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC02332EBB
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354907; cv=none; b=X600EUljfUv4scPocNj6pF64uOYiKPT/roX+iaG25xKWPlozor+/05OaIPDFY65fk+CcQeVzvZsOMzWG95+s2/JmZ16olzqgNfDdpBT8CcD3i9x0SXbv2j5IyM5jqndROZgQSVjB+ZO8XXbh4i8vWkz6tQpkXMPBaT604RGcAK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354907; c=relaxed/simple;
	bh=NlWMHvWo8eC8a5062ul0UGSwTs8Firq1Hsg3xcZzp2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkH3bIHs/Amx/Wcy6Cnu2Ql0qkPH4cDnnIltQjGK4IPf87GLt5EAPrKNjInSo2oqpo8o+ZjcwvbgzbnQ1Yp59RoeMVXzjeM1+s7Ih7fl4+i5F6z54SfZ/udkHUva8TvHmCDC25IXjJPUucOHOTpkDlnkE+cxEIJiieMIk3pu+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSOS9ipV; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSOS9ipV"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso757181a34.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354903; x=1789959703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=GSOS9ipVsEkoWjZwrv4Y7Z/wqjFeIMJ14k4zhVlTUwlhCjW+GUWwXbbLQLkqK+jCJt
         xu+HfbM12yhTxmsSzrMDop//Vgs5QIobkOJiA9OUcu577xBbxJ0KQAGBZ153dijUrDZ0
         B2JDz2a3Jk/fhX0eLhCIbPUaZjTGhGcB/9wOnpECEPv5AE6f4HlcIH9kixmZopCAEFyt
         6RojfNE0tmdl3Q/40Ebv/07dhVXf3hJ+04U3jl15iYY7FvwgzZNoXGLzZBgEoV9vYJtl
         YVn++5JAiryUwIVQOQ7dKa7HMXTo4a1KtSHEF6BTpbKRaaM1my2oMOae6ogpAMrm4GRC
         cCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354903; x=1789959703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=omIdx3uW0LFNuECV+XK3g5Vb+FYrmaeEeo1+bgvoA0S7VEiuqjepg0nQHH/KrP7XVz
         kBm5xEMEAOIshzuBFbdlhUIA0d1YEbZ+wN/ypPvlEDGQ7ZR98GM+RtR4pAFcSIoLsQws
         JOjMTrxqjLZb85MSed/cgxz1fpzw5viVdgEewRQ9QcZwVh+kGFcRhZ72mZPvUMgKX+zX
         TxpSjKGXTnGQme7gSheD6na+XVhHvrIU2p9x9W95+vNbuCR7ZOuWMAGOgD7Lw+JfYV0K
         RNwYtbrj2wCjj9lRopQqNoruwm7Yqk3XMaZPXY3QRqyenQ2amK0pCgC85xtEe1VqE6tb
         dOBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVuEgbqAbuV7yEVSD6y7kEGLOzQxKA6MBlYKVGdgXudloNwcx+YBW8g/BSwsD29zUetp1NSge3kZl9@vger.kernel.org
X-Gm-Message-State: AFuF++mr7QyV1JJx7fYLffsA2Iw9Z2bWLS+MVRHpmVZNo1bCK1+SVIw1
	UI7zzC5/INdxT0Y15fGjNX2Gl+JmkgGSktCthURmq/WC6zpjvIMn7JF+
X-Gm-Gg: AYBFou2ksJb79z1ic/zOnsCbWRFTBnaAhBqxxT1/2TmEgiH+BfIRwdxosi+fbjgJdxY
	/x65s3mycvfhOgwoAa5UkKbg/6QlW489mLEVRMuUXmfszofv9IV3gLK/LlmwRt1kXb9P6p/5oWh
	VVeVchBSo+dqJ4nEAOUQI2iCre5Npi79fLHL3TPNR3ris6moJUO45vLd/YnH+v5FvbZ7vua2tzs
	3Gs41RbXS5poIKJWrnfJM/GjeZ4xvNy+xR6lADCf/ARW91Pewt54eqcRsurJOVXkYX45r2pC0+5
	+g6sUWbRxMTDdPT+FXx/ARq2YFnKwZEYj6Z17e5ud14vEoeQEQOFKjixVeELwFTPin15sgMaFta
	mLIxZ/y/iC8mU7XzzJj60d0atgkt2c83hCrT3D4x3Z9+Lk3lTJhUCrZfcSMb742zKzKldGJp+S6
	KiFVcRmyneFVNFIjasWqEPh3I2PYdZK2KyWLsIO5hsauqBzVKsApHg4k8kITZxK8anQMT7vl6AN
	kc4H6w5tUCnBHcF/ueEgw+tbocv0IcqZXQA9USkqDOn9T+Mn7ccmR3YYSPTAPCz3ffSauUdJtMc
	mBDWxIouCh4EXO0cE3+c9c5lZzVZJzMTOZUXnejpC7N47me6iwfYrk85cwEcFz8fXN8Y0Asp7ZR
	DekebsL2BNxF/9BGI2Ulq92G0K4jBrg==
X-Received: by 2002:a05:6830:3894:b0:805:9f8b:bef8 with SMTP id 46e09a7af769-8089974baa0mr554382a34.14.1789354902809;
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:10 -0600
Subject: [PATCH v5 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-4-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

