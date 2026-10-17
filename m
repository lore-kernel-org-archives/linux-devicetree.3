Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34E3C81BE
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266388; cv=none; b=WqeykGaRcZYw9mlBIHqD34wvgst2bLpmGucwnd2Y16DL9/xs7OZxuc3haAvFAc1qkGGpBBxtx6xbXKY4+nXocyaLT9zlavN2rMGsAUZ2m2DMR2k0A4igjhmdFlmAilHIzArG/Bi3r4VfIM/f9ayAQbY8eEUWEY6Iaa8h0hBeXYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266388; c=relaxed/simple;
	bh=a9bbrlPbxY2D97Or1Weh83hc/hd1sg2iaNGPjE+jr64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaVGmxvVOKMhim3+mS9JaHKtbtNJnDgJVIBv7P5DzKYNrbsNm+FTs5taWG/Dq6HD7yyRAXwiuapuKkR+iAlLwpFa6JL9b6xTpTHewWF4IV7YCTE57itokSuoS0FQCOpZgIIU8ScLUacBz666TPJD7X1j94knInbw5J5oL6aNDxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMiAuBbG; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMiAuBbG"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84621d8c7aaso208247a34.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266382; x=1792871182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=lMiAuBbG91EIUtGsIHONhB0w6Bp3fLl6NSPiZg9/3mK52hMufyEGeQK1VYwCtSRHsh
         5WoAwQL6vSlRpP/FcYjZg6Puag9YTGBLETLrqeDBGxm+EHf8hTPVzKxqGBWSsL+eTpmc
         MSb7s/B4Znm8xjnu8CLDbsWpq8SsTqkDvfyHtTB3dFepgOoFHNAcVSvwAScru4Vu0F/3
         6Kc2yl119VoKSpOyOmx88pETSlhszUrjJDnBms4qEgZMrHq2gkHM6OGnAXWPiNMpHIZ4
         x5q9cV6JZHMrkPfsiZstJVDf101HMh3a43g2fXL/T9PsrvlT5LK6nNX7PsLizBdrzzqe
         r7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266382; x=1792871182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=bNkWfM1bAtOVQ38osml4f5VqHbsGlU+GS2zS5ZyfTWRqhghciMwmJvSTYzlXwZ0oN2
         DU7/rVJ3+t3Za39uVcuKqQCd+TsC5EXmDasewGR0Xn/f/xc8tnFcwO+XJj74JMV98Mz9
         y0ybuMB+/f5ldPUdV7ZFb4aelXnkUosUF1q2UtMMiWYiyMIaCt5SRruWw1bSnHwqcAGt
         r4np4woPJRWdtJdjpkON05wqsa90cdbAmSl9HsKDqLCLKbsSTogHLvquTLRLSf7n0S3V
         7xOFBfeKy8kDKQpnFYYNELB0xPj8paAHmuW66ljV8VM9I2cQ7+WgVbSyHp5L+Kti3MZD
         Etdw==
X-Forwarded-Encrypted: i=1; AKwUvBzilfnRlHOAfDHbMMIPP2GpjnUI3q1jYQak+h89nj/0xkAXfK5b6/c9yUEaC3+1kCQjtpAVSWK6kcYg@vger.kernel.org
X-Gm-Message-State: AFq9FYJYaWPIjmFo7YhkfMLVGpbYSGK522SqyBWJKcLr1vH8+4GQFOdB
	R6dhjMZQWNyqidVIbYeQYw8lrIGSvHwFpmaR5zQe/nJz4Kh+xtNu0avh
X-Gm-Gg: AYBFou1GgZqJ6ydh5leUEdAC/5zsEKXS99KRxGcx0PIgA53Q+ITb+JLjkJY+HyQ87Jy
	Kpoy8z9e9dq7X30TFeP2D1y72mzEo4bCaizRnGywUaUynql7fVYOqnk1fAAJExpcPu5WCGyOrSN
	IeQr5umNAKfsTFj2LaC2ij+R0uMD1uj1mENbez4W0n2CATFnrKVJrbwaE6LbefE9os7EzTFEnxQ
	SfElmFGH47oj+MO6nryQpmt6s2+yD1i9s9AM90O23ni4xgsMO24pebqcrUZoTlyh26G/4yRdvRm
	h+UZseO/UsmBQWHve608NXWn5ACj1THt9arGOyBckkwsq/lUEIp6Y8ly/6hi7p1gOqz7sYUwg6g
	ZMcq4ggLQW9+jDwDxXbzFui0GjdKY3Fbi4WPvPQUW4rg9S+QIGFrhvLkUiFPPKg7PYMdyHIUhdS
	tB7p8XNG17e2XJinS+FTTRKS6VvQ7ymFqZHYjyP4GZqwdtD0H6lZiCjqC1FjNcbYeE+b2qQB+92
	c6fo9iCwgkw6WL1C7xSEX3lli/WOB3lT8s3YxbUHMCp6lAkIpKuILFi6eZD7yPXYWi7ACxmUFQT
	1WTZolP3CUfHVsiNrko5MGzOITrjADJKkCQFpLkMC0QNtnFjU0JuFXnLI6bdXgHk9mJILwShir3
	zzRYH+FBNdEbpamIV0cOx
X-Received: by 2002:a05:6808:3086:b0:4c0:89e5:da46 with SMTP id 5614622812f47-53ccdca9f83mr2990622b6e.32.1792266381790;
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:01 -0600
Subject: [PATCH v9 06/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-6-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
index 5b736a4a7fe9..1db6ee18594a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1614,11 +1614,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1633,14 +1635,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1654,11 +1659,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1674,10 +1681,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1718,7 +1728,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

