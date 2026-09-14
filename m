Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2D36494F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354923; cv=none; b=lrnyTbwgEg94rywRN1IR/g1qnKBgNsNxsWlzivRx2aklYEHMdrbLkXItjzvgQ6URpuK3NW2iBqD78TmR+j/OhJjhWPSSW1a50YOJUeB+5ERvOl0V6NmTslOB3t777dL5DsxDWmRc2y14zzE3yL5AHk5IDfW0hlmpyiUINYSvP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354923; c=relaxed/simple;
	bh=InyBxnnGJUHrfGks0KD/ITzfsd5gn5CTfPJ5EvLq/i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwc+G/s5z6723HlE2Ti4kF1eNky0+50b+fDmzBl/Yk0bxCDUtme3XT2lDSHsjSaTyClZH2H1srrTGWcViPNDAZ3ZLIXHtj11TYMfYHZ3hTHlfvNsOj2FRSjCqhxRpuiT7yZQ65NLIQ/wr9cgv06zp7n769uYfNzMK3SympW2hHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfJsYctc; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfJsYctc"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0dd550aso216254a34.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354919; x=1789959719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=kfJsYctcxo/x0PXZmO37cKtYMundVPFy8+eLFK4gf33alvh86B23jLjv44D62J1ahr
         5fFrvB5DKR1bPlntgBtLeNqtSApWqonRxhPDcMnm5fzmMHF4opfolhil2FqXlrJgEVAR
         VkQrRaGTU2YTB9bSimYQWll1i4g3q5SGaPw0N8OebKK8deKnW+c8tUvE/vqsToOtELm9
         VroKiUGoBHvLEf7pGqrtrBc+k3GHDdkpFqK+egYrNWlujCPe3c/M3EiTQcmqez6RAjjt
         p4UKAGXgcFFZZV6VPd8X2gzKsjRRM6OmfJWUdACS9AnYUFNmIhE6wlLS/ujn6ZO4gIP/
         XwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354919; x=1789959719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=kHITz9vAf1D5uKr6Ja3DVJO4fsA5VQZuSrfVPoLLIsBLweYjCgke2NBSw7puC4MP4u
         u+tKGSCssxQeNIqHxdnF/AmwmFOSma/ues+QsLW1k9vuYj+sgS2SpB63Fq8Id1wXPmJq
         GHTp+dGysUQIuhc8wY/KNvdXAeYzUBikxX/8xqbH5ASEkYsAkQNUehezExu0fUCKXaZF
         IozOqfeR667wZaJo62Jo5DrAShcphWyOxStHP9w+joeC1y5mOGv1H8QL8fjsj1bBwSw6
         mOtB4zLnXsv66sdoE8Zn9LQMvO8QAG6LtiuQUPYizNrzNGl6Age9xNUHkDk+01L/jI7w
         X5qg==
X-Forwarded-Encrypted: i=1; AKwUvBwdcO955erLmT1JR1fu0P/SVo59/u42Ycj9zOt6xRQTngWfqhBQi77Jx9i9qPEjPjO3bP5Z9N9LVjTR@vger.kernel.org
X-Gm-Message-State: AFuF++myk8aXOp/9ZazJK/zWchD+Wte8cj0hHbMCf3GT3iBJD74u3ZBl
	YMN6s+ont1/Ti7gi+6WqniXYs/35wNdLn25Ld/6PbUYxES0K0PVMe4Au
X-Gm-Gg: AYBFou1bceurDQdMHSUJupFp7j0CvPobf4E3iw+SWKuMJiVpZrMswhbyXgF5tsRIG9/
	kC6sUhkiPHjlB6KxAI+lMGWlFejgAoyye7y/NHDtUQsMPPH0vVHvaIGHsR9/pnc4Tl34jij+lTR
	OlJoO4q+pVw7ZOvDRj/cD1hflV5KUFRyzBUg2ts3qR3SCZEwdmxLemP/6Oyj4jIyzOsy0ObNIz6
	pFSBPX7BuhKmCkLUMKQxq6v6nE3wzhVfT7pADl2CCtSYO6MQI+TrtPmz3ZzIq6yKsUu/VgdFDDW
	6W4biVmuP79IyplUeghzpUyo271JCghdV93ZBGVESdZsELwV9CYlRydabklyd4qV7kTt833KFqL
	fmd89EhjzS7sJOUvRpF5rxFppla3pdvDOWflhFXcBVsy7NrmGFlY+TjXO+dLhAtOucMsw8nfiG0
	VBnEhYsFrI/Hw+JSiWHXoQEhG2uAD2h+SkgzCv5/HnkU03G2+UpbJtcIz4dCwSiJl0BtibV6Fbp
	RrBgipV9N6e75OZMDgVRk2gECSjS7HREYuTdXuwJQ5Fmf8Emjvj3MGPxSXkjtnk+9eDGPeNxZnc
	CbpbDQlHopKWkqv6JiIH352WRvozb/NR6AOkjI2NgQ5G8j1FZBifC2gY5nwXL+JGlfOOsK/X02o
	L2X5zIYMMfAnGip0s5SdrfvxvBTqqjQ==
X-Received: by 2002:a05:6830:67ca:b0:800:bca4:5626 with SMTP id 46e09a7af769-80899266b51mr285872a34.19.1789354919239;
        Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:20 -0600
Subject: [PATCH v5 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-14-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0375930042ef..3fb61a10a441 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2417,8 +2420,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2434,6 +2443,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2494,6 +2509,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2564,12 +2583,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0

