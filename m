Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228EE340283
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028064; cv=none; b=nqL80BJ0S6rA91WEpsJ8xcUQpcLJPV0ek/0rMtBrNZa0jPiFn/V/uJCJY06WLxF4m+kuaRBGNbsjFLVVOsehxWP9g6xTZ0xtqECr3KNd4GeYNSy75u3MMPEVDvtWSY6tvdFYJYGjBewX2Ay+VU8K8ISLZPC8tymvJ+IYpqQXHIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028064; c=relaxed/simple;
	bh=JonTCMkfo5CDzyNZ0Z71f8IamWNK7BpOBHaurYUB32M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgq+Bb87dsIYjQ5oA4gKplTyGqjcdc3CVC2w4qp9kfQ65NviOBh8sY4IxU+Mcz8imePrZrSSkGg1vKvHnlDjnkU+rWx9soQIgtSUmz8hF01c9Kf3M7XI5uunbGeSUi6vIzXjYBIGWM8uP5jQmGPsU7pvpsbR8N2Uqh5PfViAfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIoejT+a; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIoejT+a"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d00d120b28so2928862eaf.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028060; x=1792632860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=TIoejT+acZtGozJhbfqiOg9l9wydjd49pnsfdTJ2OjuvTgEzlem8hKascL5382n/Yb
         QaOIApVDpH3SKQiQgbsbqKfcUBquPu6cvjLzDtpH48Bau3VoP7rGHyT54wK3Xjv+5lwy
         obgkq8SaUIDMsJeRDkAM533V557t16N2ZZOXz0jge/bTJv6QofCC7diBV3KKs0CLcnNp
         dn/cx5sBKQ8aXs91MfW8Ph0uz8GMQj1/LzH31V2YpOUEWzThBYdXc5xFgQLhleKE3iK0
         DZtk76Bs37RhOx8rreTS7a8ZtEIl37m8l4Rt7QJtjncmFUiR10Cz9kjLAs5WG3+AItVv
         +iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028060; x=1792632860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyWvw8mLllrKH86kVSbt9VISfrTspBfEjHuwdH6ZSfA=;
        b=AStKRKcnq2hhQ/wBbJIxGe3tq2/Cjn106Hf2sSCmKQPO0eNws/MI9M6NjPpMdeaDy/
         yWDVTGZ4dG7hGMZ8F9puoJdv4xJJGAPxvFeRH466dJptBYyxb3/l0/jKGOW6683HWcZH
         YGzIqDpIgph3U+OCIIynhHQSChL8thQ7DMFXi26MQp20QsHZaiIGn8rf0Vq7ABHRxx3V
         ZfpqZkBuLc6uFMpea9cBSSZpL2rNbRVwb4/KTOxjW1IwapL/rMFTTQD8fe6+odvKVI5i
         niy3gchx6hni/N0oE47+FQDqOCivtwg8tJ2Di5RGsj6dew9XyL0dGwEms2AC4uK/lENo
         6e5Q==
X-Forwarded-Encrypted: i=1; AKwUvByTGN+gIZXXcmbtku8EES/yEGqceA0Dovd3vmzuWEFHbQYFfEsYAd/BIlFIpVjgzXiBj0Jo9AG/t+g3@vger.kernel.org
X-Gm-Message-State: AFq9FYLYdzsWXxkYU7bJPKFwD+58bjT0DLyMts+v8ckJ0aOPuE5sKa3H
	AQeygXdDd1bI4tTSLtEdq5Br2414CvfQnE6alRzo6rzE/vJvoFcXfb2X
X-Gm-Gg: AYBFou1UU0950yNwEtospHXG3wQ9gLreacL9qZMgFTmYBKfYlf+dEMosLoy56zrobRI
	+aSZRAtUVzFkmhhnqzSF1IKZiUXOj3XintErCmUnMh6yUdJGW2mtxENZs/seXQ4VU83siw7iLQE
	0ZZQNiqpqLvV7Q6k8Neb16Tk+UyuBSmbJrMvJY+mxGtVjeaLXJke9nZWxFNTg12WFsLVpnKV9iX
	CRU0DcC2BNnXUqVZqjY7RPL2eXHklK8VuTRbf3QJ1JSaRnCcMo9cqmegrebxsno80kfqjl8L28N
	ycyX9J+nzvQlLoHXgF10suVjNW+3NsHucOwrNgICp99xyYP4RglAclkFaoDM23IphKW8gEhUwhQ
	rH9jGWGWVuxPjtJGmfeTeCokyay+f8j8pt08QAEzVMX4sN3B+xuWVTaLC4Cnyt2rBtDaV1QdK6a
	dFzBpWpx/SSU+d+5MP+Ws5OAOjkwqxzui9YrObb3e1Yh2o3lKYk04bZhIloF9va3JEajcVK3e8i
	juAw8kRVVW7iru4Nm/3xGXx9bgsvhc1WFz7Figi5mn1bmKZ43+LoORIyIDMm61GvjiCc790/r8r
	wfFRw56gOTns2xH9N7jbVN1tf1wNCVwgebY1h3baQLMWXvRJG2wcuVn6VaIJqakXOmFf2HkJ2F9
	adAju0YyN5opfFE7T62QG
X-Received: by 2002:a05:6820:4d07:b0:6cd:3fdc:6001 with SMTP id 006d021491bc7-6ef115523a1mr12486639eaf.82.1792028059992;
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:52 -0600
Subject: [PATCH v7 05/16] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-5-5d3fc6ad2da1@gmail.com>
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

A page program has three stages: send the setup command and address,
transfer the data with ECC, then send PAGEPROG to commit it and check
the NAND status. The PIO page/subpage and DMA page writers ignore the
return from nand_prog_page_begin_op(). A FIFO or command-completion
timeout can therefore be followed by data transfers and PAGEPROG, with a
later success hiding the original setup failure.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.
Keep the successful setup/transfer/confirm sequence unchanged; this
patch does not add a new controller-reset or NAND-abort policy.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index bc38330c0e36..57df88099206 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1595,11 +1595,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1614,14 +1616,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1635,11 +1640,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1655,10 +1662,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1699,7 +1709,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
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

