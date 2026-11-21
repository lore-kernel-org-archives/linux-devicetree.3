Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223473;
	b=V9jfgw2W08rOE/xA/0gfDGhEi5PEj3kgqGOVR/XMggBPBnzn8hz+INsP0WhG1GUDLnEn
	 odwWsY6Cn78CXeGobx2crvOEMw5fyNTf1YqGIacBgxw8OBHgtcunhBJEIXE1bLUKZO2tX
	 rkeep7m4FLTaD/GcsH8RkzLku/ywMC/TA9hYGedrLxNR49hFV8DOla6MYegT3q7jirDo4
	 9bV9QK+LZLZlt0Zoo9HUq8NhfXNoh6/W1F5p6MoptHFZbLdnkPgjx4+Ws1PYTKTPkBcGO
	 Uza+4ObYRr0wQ6REC0puPyGkxixRDV+UFVaPPBM+q3/yNokw24U16XpMYjhIEnphvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
	b=LRrWsHXAwypYEtrdX4/fiMv98ndM7q/uLoMmN8SOWXHrwvyMLbpS/hZN+bEUU/A+8qVE
	 N+VE42Ps4GYXm/ElHZFoF51/6oe8UBUA/wSnJr8dROvp4kGVxDnf4gwm7CptdEzyACUkR
	 iCEmW4FMBtQx46w/J9VUnP7Wc6v2YiBz/mISVOeBfidYI1aorSxapyVN7uBdU30CD3SR/
	 5RJnpvE5GilbZZDQDp/Duf+2oSUBa3lZ3Qny70OLNWsUOPhYtNqdCgKrowFEGhUeSq+Zg
	 eqJEP4/My/g0M4wGiSnrCSFOxA2pqNelRyj4+PeFOOa7sv6aXanFdt+AXaR/AmWqzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGgaD8Wg;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92260A2611
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E92260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGgaD8Wg
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84a248254f4so949443a34.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223468; x=1795828268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=BGgaD8WgiBeyw57h1wjj+17CzfgitgeZ1ndw7lTEr+MChWZ5KvVH4kJ4SuaP6seaED
         VjID66TCK9/4DClQfuFcMKg+KrvHWPNrzpkDpotP/QEF/JoqEtgU4ZsMc3z+028fQLNv
         nYNK0Rn7Y5q0u7PGvc/RX1RpEooEZPUX6QqU2ISFee7c0WpqPQfkGTxQ5w4oLFn7V3MY
         6TPu7/jmlEmi4/tWNB+lslT1bIV0ic2d5tluhKwYC15wMQeOKlP4RlOoWE6bkw8fk5Pa
         VoqcBy+lp7MEZNpDNd7LegEWpev+YxLs/Jl8GRJ6PbDLKdT7Fk9VBazbficn7q10g8aG
         PyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223468; x=1795828268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=LIvw3xWV0y9jBYTm2c20aFPJvyX3efGFh2tVGtyo585cua5C8zqmHu6WrdNX/6bGkf
         D/E3wERppO3xekZ4mfgwmHz5m0FZThyaL2MPow2kHyDdbrP+nkAAZ717SZ62YlJlU8Yq
         7slhxbuiZEzmlS/+usvMXWP05pE7uRFz1ejZrSr5E1sMY0+JT/nmRc77njWJfxCE+anl
         JoqBHju+kTV/WClo39JqCDCJccBzGvz5+IW74GAk24fbB50efPFa/EZNl/9AUrIUpWG1
         +2fJRfjnnNry0KsxmCaeHjzl39+QdtnOADi+uMuniOzNux9XfIDSc+17dvhrZWbP7Fjt
         b+Mg==
X-Forwarded-Encrypted: i=1; AL+hErHLt1MPjX0xhPcoEiT7eVBjeEmxiAn7br5APLsIzoMyBymfBLX/dtHr7nw2O7reCciQca54D3naQhWq@vger.kernel.org
X-Gm-Message-State: APuU4Z/kpWk5c7GckLj1C2tHAwf6nu48ewWT1px/IiqIX8q8mu1HOeNw
	0SJYpbfmx4GPKp080jkAgXXHIJA080OHeukAvnzUuO6gQQnbosbuDzdn
X-Gm-Gg: AYBFou1m/jkODcDfK33/l2bi66B5QQLXwQqL1LPOa3sKy4gECXJCcxanQJFNTQyc6Cq
	pPr150Vxg/joPWDcui70kEFacOYac57NkdkDnZoXZm0aKbdwuYgWZOs1v52erEWtZAPLzZcoiaz
	xmn3O5gALInfv7HTh+2ZxC2epU7quTmdmq/5Gvr35+BJ7drCKAADN5kX0Wjx74sP73nEjRITG0k
	YT7xr6B4kSTVoyUJS+Nu0bvdTHDwy5pIIqOOfFsgyft5CoJ95uDAT6wR1UhM7e0JQP0njSph5hn
	FHH5bU/9iqAWTW94JZp2RVAB+P39NvcdrsKfwQjbMWPPOPQs+6g+GZKUSRSA0nK/NzGuAqFY5JQ
	HWd0bNa670OUl9m/bFUAXnJ1ZAjumeB9qMMfkvZOsApIl//xulOPF1b6iOXGqrSitjc25ykwgQ3
	0Uy9O6hJihsMtoduGy2/EgCe956JTHS96bjxT2sHpBjxkT54VA3+hr6VkCRb23aKte2RHByvCRf
	2PenosF1W0+N2krrByjaG3xXPXOWO8C5sAtab6xrOvqd+Yvm1yD2qUpUHq/LfOQRLGOtA1s1wkw
	JvANL4SJjWLFKrzO0a5KkhNYALBkTSIDa0ToaTmBpL2k+wVw8GJ/OFEx3VLqJ2Dqv+sP/v+VERR
	jAKvrhtA2NJhnvVgF0GeoENs/lLjMvaRSBixRcxDyHvNAuYa37KjaAky9KtCpY5bk6FL2dUCgoT
	Duvc6cQ/w+FLQ4tt/ef+Jo7QNETfjwD37FMxRPrWddDysxhR1CjzdiPg==
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr5691634b6e.5.1795223468341;
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:32 -0700
Subject: [PATCH v11 09/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-9-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

A page or subpage write can issue PAGEPROG and report success even
though sending the setup command or address timed out. The PIO and DMA
writers ignore errors from nand_prog_page_begin_op(), transfer the data
and send the program confirm as if setup had succeeded.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6d7384aac917..76f60fde7a86 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1578,7 +1578,9 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1593,14 +1595,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1616,7 +1621,9 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1632,10 +1639,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1676,7 +1686,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

