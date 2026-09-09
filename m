Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987E471247
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942666; cv=none; b=Clf6P5UjyOwT+W+CDixSdCXdtn8RMoHCsHi0ctFSNTKZ2eulC+OAoY7y13/Ab9EqZe6UHU6Y+2LwbeTrQ3l/TSyicxOuT3dhBhlHc5SHguzKOeS/MmDDuyi+9tp2DIDrfYKNjlL7N58EBttPvgfatysidEb5OVCCFqgzJ85zxJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942666; c=relaxed/simple;
	bh=Tmcas4j0s3Gf2d4qRloLyZr+HYYU6fTALfwrcrP6U1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/A2r2pov9LWX6FCsWe4n+nD+e/iiQgNU0ZGxWh9Bw5NJCiDhBVwRide7w902ICACTiq1Nva9Nx+BUvN9DZq3I62LM0Kb2tfgyDnZKy4/7eqjqGRZ8Ui8LNxjWOC94/KtkvJbiNWzevpy9lBnzzzjW1m08FGbuEnmfZVCgeP6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csggK5j6; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csggK5j6"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-475920b9ca2so1771186fac.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942661; x=1789547461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=csggK5j6a1Hpp6vJPgctXds4Hzg921R8zHgTNUqrOD5zC8DVA0LVKo/gJsTEQVPCK9
         pDpmxjiy8OCZzG4/nsqRjzsSoFw2vUciZBnGE/OWDhxfgYcSpYTdus+xTXTI2/pkbujA
         8Nm+mrsa3THA1TtaT0LwIW1dam4y7FzhT206SyRr5w9vEzNWMWh6oGDpKWMCUCFXx9ml
         Kkrnlai5vvGtZbcyDazrkckVLnsk+nAqiKUMQ6FyFZJRtUDjt1l4DEYDweK5H/s+m+Ny
         bHDjAR+4FrSx9V9Epz2SWzc5dhCmAd/SnRN6xWJTzlxwLuBzJhTUWLqRZRFMX96/OaEV
         uF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942661; x=1789547461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=pQjO4+7WGBB3RqdqRuXSzeo8hVrwFvhIciNUr5sewobbem5kpL+2LzA0CnZq8ITD67
         uesxKno0C0gJYSX8uhfYUJ+tzXACbuGutlPhEEEyqu7+oV8KvOmYiK5gU5vqif18iteC
         hU4i7p36GyZSr8M9YfGow0GWiyPeyDQS0qBim9A1bHvdGLFCkexpqsNGe8OsUHwkl2lZ
         XGBE/OlIK312JeM8IJCkRCC0xsii4ebgNAOhP7/QklK2U85D17hn11P2/HU0sxxJxk6g
         RlquYRVKfCB/01xXbuVa0E9C9j2yHwkIFo6ZjLnPlAAXQwS1iWJseNg4M4Z7mFnPELfs
         l5mQ==
X-Forwarded-Encrypted: i=1; AKwUvByb48RJnc5I396dCEr6i6Jbwi/BrckM9MAXE/zUSvSj0vorz5TLvHDGJu2Ow+zEE33hToUykQ7hq9an@vger.kernel.org
X-Gm-Message-State: AFuF++l3BimpIt5j5ZYVo+qYHALJjJNE54nSJNgSiqZqsXPScIId0hdl
	j8gLYXuxmiDLPB6+BonGIhlGO0dOtP2pB2Ct71QMe71hrH4X5T/P/6Zk
X-Gm-Gg: AYBFou0bzyq/PUhdD7OKnRFz+OB4igM/i6LgAXBEjHtOjzrQ7EOfChxiMhDO0H5pD1J
	Yl1xKwFg51q5HruRv+7MlODhgeWGfyEcauUNuW/Oi2yhB8dQ4j5i3iWrWWXKHCpU3C+1zTgGMMT
	DpzWt7fIoygVoIEF5NTwp7xzFOBnv0sag6MnNwxXA+zhqZOMtWE4I9J+E0S+F85p+wKwiBDrUzi
	MDH71/AMN1lvYr7G70UiOmmNMN995Ls3pCJEvGYIi6VAGNg1MFLKSqVHr7YtcYk+ObEChs2B3or
	WI8WcVtj30i3U2y9iwB1m2KdCdP/q/EMiFvIwReu5PZiINOhuD7mi8xAxAG8GCxiyuDtBCPBiKy
	Fsabnva2JOZ5bwTrGmWFc8KcLvj7o6UM+UgqcZIUCOEvDcyGs/NQ/I46QV+Q+FUcIy377IVwrRG
	89WWKSb/nN70FHM7BOUD5gn+C4onFvOTw10W1DT/HQyeSKv+JkcXbnhEvQPjF/uUM8dWhq25g4D
	Y7JI2k39qAqbHE4DJfgQuZXA1dklLuQZGldd9+2vV+m++xGMJImpHRpsADhl/Y4GknFZ7SBkKsf
	uTIqGfE3dW0vpxgIf7COSXWSoZuoiVzfCOkKOwlcBBJT1Ms3Zd8SO4VvHYU0eLcolWzaruths2+
	oQVKgNY+5MkVdZEk9NZGzf942EtTo
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6b6fa7e183amr19522399eaf.3.1788942660818;
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:39 -0600
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-6-838cb0ba1547@gmail.com>
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
index 7081df77f63e..545da54b8908 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1831,15 +1831,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

