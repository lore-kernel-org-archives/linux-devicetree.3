Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223487;
	b=qJgSQf/wD/oLr9BwXUkiLvtxw26OlaQ3j81uouF2XwMCDWIBz8IYXPXvNUkSRFizPo/a
	 Op8L0s8O1tZla+gwHgYLc0SHrFkyW9mDkjuFrG5SDJP4l4vFED+VsnLM2/ZWj53SlVuCE
	 6GTylafKXAKUIOBMCRq3iX7HQNsygafcU1h2YYu73QhpPLSXJwndKLnY3uLWxHEQ8q3L0
	 TD4TKaZA23K1zVK+xgHpFoQTPx6AWL08VhYGNAOQzOqOB7lfysInfV1h4B0VFZdbeGOhY
	 vx7Elpx3GsGvPoJY7pDRZs0gHtpk9jJKsb3F7BKgOXolG2kf56yVcei4+15e8+C/1jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
	b=vIO3Ds2T0cdyPQPT/sdoODvS5Dd1W3mXW1h7ItPjU+9vlDGNVHuY9aMIbD8CQqkM8h2y
	 3PLrxjHPbbXV0iCfvIbVgctAiRiPR3a1wDfwYI423D8qDy1UZ0aix6A9gs99UA1WIcr/H
	 AwCCN79RjKSqW1wDKfp7UElMTLWAl5vxBxi/zW0pq3zD08152tbhBE3Dloimlh4s9EOpx
	 8fkvIhKsPzl+w+M6+fSQdkzeKfqLotwqthFVumJzCviU+gkYv2BL3bmE+sv8b8GfzluUo
	 Q9GdRJjQOH9AK+A5/T50qMhoFsjjOQOcd9pUdtG64YrAFApEgaVPBDOgLeeVyYzXCtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLlkzqVr;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE3560A380D
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE3560A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLlkzqVr
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5642e0910a3so741995b6e.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223475; x=1795828275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=xLlkzqVrwIvQ/Aq4hZS25GlBJqOwghvMTImGsrw4s4VdZqerCIRCIRX/EeNmBJlRbQ
         x/u6646LcMJIvq30v6Q+U+RDlgNe7roBsE6UYr2qxE5iblqnzpN4tdPmJ+lg45kpvV7F
         5lfIQGMrBY3FyoSdZmV4HOgRjYcypLsHxSkqkux5/ioOQWaXVcMzhWwNfhwLJOpzoH4I
         ukvdTTNOt4NdrJ90yuMs8WvTTHD9JPSkL755U7uyjOsqpaRGyGtK2JItCVrdAeTvpYWS
         DmRrh/ZnvJqkBnQ3X3gbZrFIvP3KUNPs04JEonrCc4Lk12x0SOeXf1sqcEwRB2xXL9oI
         1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223475; x=1795828275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=aI8xKYdreRiE7eWrqT9XuMEJHlXm5kDs2wZqWTw6NDGHZ2CtC5KPehsV3A/I9OoPtl
         o3qzBIuzt/70T5kwPc2ZaZUAl68HDWCYIP9pJKis/NZqYJByN2CO2IQy/DX7gHoTNoYQ
         mzb8AwIJDlDv2tAmVE5X1mbMY3U9IS7UuVYHoESpSEq+eZkLz7gBZwRiEb5JK1OcJJyo
         /5ZxJ/0TLOhBMCfNB/SSTaQJ2nDv1e2tjgg3vOXo4pOdtf4wApStHT1SvrT0ccdFQqj9
         IOWn1JKZtX9klkRndV57Fa/+f6UkOU/ahPx572Lp6G1edmYxnQkapHt51wz4Dq1YxOAh
         3Wtw==
X-Forwarded-Encrypted: i=1; AL+hErFyXPTdjTHYag8pehlHw92WvB1lOfbE3sE2Gs32uVkXwz3CiPFBSRHPeo0y2sPZRVmHQsCtsTY+LwwX@vger.kernel.org
X-Gm-Message-State: APuU4Z85WXPRTVTEbqBcgxz/qLM7y7N4kBhGlCExHTJ+GY2CwBGmckpR
	ea/7qv/6ouaxBJM3NEMxWWu9+OF+nre2hdhz5KZW7v12vNnOIusnZgmh
X-Gm-Gg: AYBFou0fAzfwTHld19gya0a+nohAzF+o79VOhEqAfVQZDbRVRfr6lgIPFJ17mZkej49
	9JZnqC7WTQcBjFCXn2mtrFi680Ab5Ain/xpWj6NNuUVmMqasAElG7FoaEK3pZCExwWfgSOMBAcz
	HLn+IvB4Ro6CtjRoGQmWvGOsosv5KdMBshkUbABEPNY0d1uPJucbBwcgcCoojirueMAIo2zJgoO
	R9FzS8aNowN8JwN3n4UVIkK0YATMpYmiOBipuoUOCNOXfwJ0Y8Bd8nxcvLdqK2yMZJUqfFToK9/
	7c4Q7nn/E8VpQTDwzhWkchVcePzKj+eM869t4Zou4HBZ+T9qTaWnlDR7GkIM1JIS7p/gCMlccTJ
	y805K6lo55pWeBzXdLNOC4/wL8lUdbIrBBDRhMhMD1njGzhSQ1oOnU2u7WXU1dwk3CRpf8APLc2
	AQyOsoCG5A3M3bzL9IPlEK5OcxbkZdS6GIiSBT7T+pO5SLnjWaLLJGAss0qK6bEQ7Wqm5QYfnfj
	Rwdx59SmR+Wmv0qYRlx7z8hYgDxGocK/UVWuJMuzl4QvRWLSAOa7ticPIIv0gObE9ae5Db61ytc
	Rz6dSL+QW1wZTE2Y+qhfawA6GQRQC4h/SY29VmH0T5FJj/QOXWT2OIm3S63nU0+RUCvFtIZZxva
	1kM2klCZLiTbi1kBsKenQ5aLonxDgQRQB9ItJQ+DG+BFCWloiCkPlp3dTzo6H9AQUywnKi6Xhbb
	gBTT9BYlYBBu5MtFeW4la/X7vMWD81XJzPQFarI5A4OXE6fLp2hbFN
X-Received: by 2002:a05:6808:23c3:b0:567:f5d0:741c with SMTP id 5614622812f47-57a0b959e91mr6046198b6e.34.1795223475472;
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:37 -0700
Subject: [PATCH v11 14/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-14-9721b1905ef4@gmail.com>
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

An OOB-only write can report failure after the NAND has already
programmed the page. Both the PIO and DMA page writers issue PAGEPROG,
wait for completion and check the status. The OOB wrapper then issues
the same command without another program setup or data transfer. If
that second confirm fails, its error masks the successful write.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 712648864407..7f9bc0237cea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1779,15 +1779,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

