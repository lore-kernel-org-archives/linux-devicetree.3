Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223478;
	b=uSueT2rBRfI97KowWxFocfzm+QiaL34qsOxsJjbtLcApecOQKPu0ifPl6OkVSJrMMfSK
	 683FlaADJ4F/Agi9Tws96Ehf/Iv/Ps6sivbGJtLkAQBAYtgDdm9yUDLPSUCsZMm+pJ/qu
	 lGr5NOjkS9S9PfAqNSEuUPDNHWb+05IYiRMaPtil2HWwFd5c5Lt/bvGdVu0WRvCUiQOuh
	 gEcz7PnC8DwnQ3tSarOitShbdEXzQUXNVZYTzMHMMl79kmSr6EY6h5Sv1vPc01n8fHxys
	 /kLFUieuRp8tqwh6Gm4epn+XvUjHUXee+CQBZPxVrvt4u+Cw0Syp7RDoklhXyr+Pamw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
	b=dcD/IJ8KeGclEUwyV66Wr7oC6t7IXCcPwzTNBM9htPqnXE2CKQLfyVPe9pBV/WvzM+em
	 QeHYc7hIkWhYNS03Fs1ypJ6GkuK8LvRrG1+79n+tj1XHAezHeozoTg27+zeBU88cBAgV1
	 XrPIsf2JnztU1FoDUbRmiXiFBcY+oXCvn+I+AxKK75TuknM+GgGjRIHws0z+xaXOUBaDU
	 cz9OxrIovuCLoP7vOW989Yp7Yjzh6lVI/WtFAOOvRWYa4awTc/EumlLsw1IbH5y1Md//f
	 2PUlvVRST2qjdmk6M41HZpW6q1t9S9NIN6x66L0IGlfauaYSLTeiK08XxfukPyXak8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqXc0xhq;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748B60A2613
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5748B60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqXc0xhq
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-571eb508edaso714181b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223474; x=1795828274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=qqXc0xhqFvOrz+emUqcN50LcyxA/hdj19c9/d3ED+FnXynpC2MziW3rvSCPpPSdxHz
         jVNAIn3jfcWZl3roiF1TgWJseGquJQX3I5f870z6DJt41sX3SQMa8uysQxD1SQFsEqq4
         DGwv2MqjjNqEgchHT5ArCT8pE/WFrf+grTxlSxcBnwAe4mcyB0ZXs+MrqITvH/oVHrl/
         0Uh2+kO7Urn4H1AcQ0Zp4cmE9CDg0T7bXoLEgSGjUhSD5lnZ1/z8AWX9P4NEIuFiYKfQ
         9JSgMvgICxYJSmnrmxAQtfWYYAonBNe24ynX/Ow8Q3rVplLCDwUVvmfLc9AuCHskBDUF
         idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223474; x=1795828274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=LVqKRW9jeUuuZY6q0jmSMiYIfqwiYSE7hkHuWH2l2v174meTPWms9OsrCDj4tI7maK
         1p+bJowpNtFKIa5sD6OaFgOCnLpR9GplEjtTttp4r76ZUxrdJDJs0WzAFcje8voHhkAo
         bIpk9xcYlV27HNN/BxJZSbCs+3LlpBNGLnAf0wtoSc1eAhLLDqbvwVUhPaBZ6zLf25Sy
         ieqS/q91xJ8LtleI2WfQtt3+nLoFIqIIaJlG6+bIw0OJT8RGVnHJr1lElKGMY72dKZRR
         XV7EVLvroQb/mJMQfhfdRu0N2o+674YisYJWdEpBKLYYDbthiTzNiH3cyF9axMH1yqPj
         Jxxw==
X-Forwarded-Encrypted: i=1; AL+hErG/XSbCBT/BhHv9sZoQXttQhKUvwGAlZ0b2E558qxbg9bww2QSMXuGONUD1f7HI0ZKnl5TZypQSCEkg@vger.kernel.org
X-Gm-Message-State: APuU4Z8lnUEbWTT7Q1gu3nknVeLahHDv/MxYghIUIn/RtWxqne540yGG
	1MNPL+t6Q2mVDBprFKMGDcDqdV9N6s5V/6kCv5j6XDKPUfuVyiekDPSPyqCTn0bj
X-Gm-Gg: AYBFou2dkGbPJni3U6ldLsF5O0lk7VRj5hCQQOhp2YXu+y1fM4c5iHQeUXay9/xPMnv
	oOajbUZS477fWDyDpZH3xyXDjwHMJ+aynK0N/FGE9gD7Kr4vEXCcr4cDGecAnQT9bhkELRijFYK
	tnZ+61/iHpaNUZpHxIJUdRkwTU9K56V6SibT+WH2mxcgboagEvhQZY5lsWgkcRUSudiSZtc65+g
	gyv7Ld7i/4mjDrSWgs4gJi3O8pc10CmwCDABbPS5+lkaVDg14rkKIyBOdngzjSh5g55iYfdikrx
	XSmSXB5CNSu1iFzmPWYEm3xmjtNEVnNt7xKxksjl75zwyDE8aetE/J1k/B+qzB542dVbSqMAyep
	aKOLA3Sq7fyV3bi2aJvyrWnwxxCSElDg79VXyJaxgNraraT+TwEMY7TgRo0P1CgA+IzAvnZ3zXs
	txxEvODORvtxxILhCNzo3yOd3aWz7LE1KhnEyEdgH4Wv02Mm4pKn1OkzoBKf35Y7vie3uEuA3Ja
	7pTkPMTxprIAPDWnw8OanOztzDOOdXkYL+JWNGbCUfmRm0sgOImnMfX4YJ4YTAODb7bkL/xWP/n
	puN8YWxNvssBu3LFmDYq3YkTB6yakcbeY+AT1cv6oQi/orjTFbJLWh53vMyW5Sgp5xp2ZCxwyra
	DV8uT8OZ6AO/5rblWP0/KRbsItSduoWl8aHBKl6wzHdVNRTGUAKXxjvrYKJJceA/bBGgUK307zw
	xBNBnfjbMXgHaR6W6yPRWiSDtT9PppW3YBAHhqR5WmqECrWKYqnwVQ
X-Received: by 2002:a05:6808:130a:b0:573:7a6b:f32c with SMTP id 5614622812f47-57a0c4b923bmr5275123b6e.50.1795223474187;
        Fri, 20 Nov 2026 17:11:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:36 -0700
Subject: [PATCH v11 13/26] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-13-9721b1905ef4@gmail.com>
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

A NAND read can report success with missing bytes or bytes from the
wrong column. A write can send PAGEPROG after transferring only part
of the intended data. The SRAM transfer helpers stop on a FIFO or
completion timeout but return no status, and the hardware-ECC paths
ignore some column-change errors, including when fetching OOB after
DMA.

Return the transfer status through the randomizer and OOB helpers to the
page callbacks. A read with a NULL destination still fills controller
SRAM for ECC and must report errors even though it does not copy to
memory. Disable the randomizer after either transfer outcome, and use
the page callbacks' error exits to disable ECC and skip program-end.
Update a tracked OOB column only after the requested transfer succeeds.

Keep transport status separate from the maximum corrected-bit count:
zero from a successful OOB read must not erase a positive correction
result. If an OOB read after DMA fails, restore that attempt's
corrected/failed counters before the caller retries the page in PIO.
Compare the tracked write column against the absolute column of the
OOB tail. Otherwise a small-page PIO write that has already reached the
right column would now fail on an unnecessary change-column command.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 175 +++++++++++++++++++++++++-------------
 1 file changed, 117 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e76f7cc67081..712648864407 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -663,7 +663,7 @@ static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 	return min(len, nfc->caps->sram_size);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -679,7 +679,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -691,17 +691,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		if (buf)
 			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
 				      cnt);
 		offs += cnt;
 	}
+
+	return 0;
 }
 
-static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
-				int len)
+static int sunxi_nfc_write_buf(struct nand_chip *nand, const u8 *buf,
+			       int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -717,7 +719,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -731,10 +733,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		offs += cnt;
 	}
+
+	return 0;
 }
 
 /* These seed values have been extracted from Allwinner's BSP */
@@ -884,23 +888,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
-					   const uint8_t *buf, int len,
-					   bool ecc, int page)
+static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
+					  const u8 *buf, int len,
+					  bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_write_buf(nand, buf, len);
+	ret = sunxi_nfc_write_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
-					  int len, bool ecc, int page)
+static int sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, u8 *buf,
+					 int len, bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_read_buf(nand, buf, len);
+	ret = sunxi_nfc_read_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
@@ -1135,31 +1147,39 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
-					    u8 *oob, int *cur_off,
-					    bool randomize, int page)
+static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
+					   u8 *oob, int *cur_off,
+					   bool randomize, int page)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
-				      NULL, 0);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	if (!randomize)
-		sunxi_nfc_read_buf(nand, oob + offset, len);
+		ret = sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
-					      false, page);
+		ret = sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
+						    false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
@@ -1212,15 +1232,22 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off,
-						      oob, ecc->bytes + user_data_sz);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
+				if (ret)
+					return ret;
 			} else {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off, NULL, 0);
-				sunxi_nfc_randomizer_read_buf(nand, oob,
-							      ecc->bytes + user_data_sz,
-							      true, read->page);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
+				if (ret)
+					return ret;
+
+				ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+								    ecc->bytes + user_data_sz,
+								    true, read->page);
+				if (ret)
+					return ret;
 			}
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
@@ -1251,9 +1278,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 				     struct sunxi_nfc_ecc_read *read, int *cur_off)
 {
-	if (read->oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
-						!read->has_erased_chunk, read->page);
+	int ret;
+
+	if (read->oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						      !read->has_erased_chunk, read->page);
+		if (ret)
+			return ret;
+	}
 
 	return read->max_bitflips;
 }
@@ -1272,13 +1304,21 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	int ret;
 
-	if (*cur_off != data_off)
-		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+	if (*cur_off != data_off) {
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+	if (data_off + ecc->size != oob_off) {
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1401,13 +1441,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (data_off != *cur_off)
-		nand_change_write_column_op(nand, data_off, NULL, 0, false);
+	if (data_off != *cur_off) {
+		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1433,27 +1481,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
-					     u8 *oob, int *cur_off,
-					     int page)
+static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
+					    u8 *oob, int *cur_off,
+					    int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_write_column_op(nand, offset + mtd->writesize,
-					    NULL, 0, false);
+	if (!cur_off || *cur_off != offset + mtd->writesize) {
+		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
+						  NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
@@ -1574,8 +1630,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1698,10 +1754,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 NULL, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       NULL, page);
+		if (ret)
+			return ret;
+	}
 
 	return nand_prog_page_end_op(nand);
 

-- 
2.53.0

