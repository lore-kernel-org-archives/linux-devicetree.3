Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23638F941
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272328; cv=none; b=gOZ2NecjVa6ZmqvjtVF4CVj70T/IpyoKyDUdWQ2rKsW435e1e0ib/XLD75hqBIOmr/vhs/59VH/kDoTbCdiqi8dJz40uGVAflEnWtu+fBwGl61UnVh6l0gybb09cCMD1YNvRfnVPMjSrGxw2R4016VxWL0QCOgk/ljfkrASvwlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272328; c=relaxed/simple;
	bh=/U35JMG7PN0VQxPSNjTNdzYGYwq4m+xXswxlipe9peU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZH80HF2KlXG1uf57wFm/S3YOTq4oJem7/+72kXPa03lEAt1Havu8xzzUNBsH1gR96+TzoSEIkPY9cgs7NNUo5jFwPTvb+4qeTqgpN0ZvojCYoEdvl52ELqJtav/h6b/G97qguER2WpxPWhjqBaCVwiLSjUq3Imzrf5kNr/N3Yv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ3lTwEx; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ3lTwEx"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-495c49f8eccso2539190b6e.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272325; x=1789877125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=gZ3lTwEx2a4as1p/vS6q8A+eHuOLhZU02wK04KUj7UpmDJd/cxXGgb2i6XINjqcssk
         5nIU4xjLe9mPnzS3oYKOLXs5jBpI+L+KsSRZbBv1RK6Q/3l5U+w8BQiAyxyEqnv53Wsl
         5EyK1Fm/EW0QGaGhpjEMwrA8S0at6C3d2V1uRF1oQ1sYUXB7a95MXuR8GpAA2EdV9CJq
         eJWKEt8y2f8asjLLWvQvJBVDYsesNPnMf0QtjVA67Uv3sZmuMn6g3rWhPzbDo1r37hIH
         sDR2RihGtz2YzRCoOcLZqBzVLs9b3ch9KV9cLpMYrFNqLcT/26l18TnFp2kTqRY70iG6
         M5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272325; x=1789877125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=KQmAVhIuCOKXELS4FQN5884AKE+0HOSjpclKr22tqQPvMtu5uLxBuahq+EuIKGp/cx
         30aBn/I8Mh8pvIJto7q91WH9/Zmhydp36P7SP+VAJ9wpdnWz0mvJo7dDkhLUrNQfILgb
         Yv6dZqSNUq27bZIjshSdG06RJ0RkNy3doOnamq46Eey1UEso9bLgKkJos2yUYKgz9/mI
         loTD4Lsv+cMJkxtTQItC3s6v2VkEHeE3WZvgMkBMXTJzIB39h5J3fnVUeCRAQ3JA3Rnh
         07qJ2+Dqso8mtGKPH2gUeuVCCk205elrM05y2djhQdLWp2RdhUYasCSp+fYNmbrZgzrc
         7wXA==
X-Forwarded-Encrypted: i=1; AKwUvBwb19nN9Cb+EZJyoa0BLXQIfFTem8EL0rzB+DVdL3NOh4z2jtyUPxzbYaszvMJ3wJaD+03rW0YEEe7s@vger.kernel.org
X-Gm-Message-State: AFuF++mQohYw6zFOrj9V4eMnfPmLKI5U4TptU/WoqWejakR01ZQV0TLM
	EgxwMr82QNplHF6NIgTupsqV3HOnD6TifBt/SEYZEqhbFj1tq8lyF8TC
X-Gm-Gg: AYBFou1XvodGqbIozMcD4+3pLpw0JH/+/o3r0ALMdwE1I6Q/pfrngDtXX8Jf/fUzOTJ
	KT1YNP5X8fkicoxOvROqsZGuoWXcKUlupkQOO5u/9W3XXj4c7ZR649oO/nv79pLDsV9vy4uSn/7
	16LDG5PaStcdJFJx2qE2gIWNxOwgjX5QVUsjv91wyoo32Wlu582aUbKRPGAAwQGGQnUhMw+fyn5
	5oMS9EPRVocA0RnhiY8cbTnw8kK5A4DLPQRkH7p/aOWlNJEOhKxWlLtyl2sTOy9F30gfpMlXTtv
	t0F5VVKaXQlnOY5eWhBZfNnY+0zXLKKZLi+VWI31sVSx0QtS+QQwmvJHwjiaYxfaJhnDU4i9jeL
	XeVeXG1QV4oN6qx8m6/aOfiPfm4JFAKbO7+iWfDTLzYZeUQm+7nyNDPgBZSG5NHzjzMK47lkeIQ
	NGp7r3gFSz0aMgp5F4TKSeJLhDjltlYWcHNYhYr+xCthQ/e0E0hLmA3Hymn2k5ucDC9zGsPlrtP
	WRS8bgwBZGc8x8hjUScMXVOEalTVRGfk0rWwm3Oacg016PWpCr3SDFZJTfbfoRUuosjTrjjEiDa
	a59nswQK1mUVySnmAMm21/D6EwnHwKuA4fZwGWI7cV/zkOfemfDPprE2BpuQR8m9HvZpaRPafwJ
	7N24ibOYzqlWrAVHZ17Va98pjQ75wdqQ=
X-Received: by 2002:a05:6809:28e:20b0:4c3:7af9:f497 with SMTP id 5614622812f47-4c37af9fbbemr4704298b6e.38.1789272325105;
        Sat, 12 Sep 2026 21:05:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:03 -0600
Subject: [PATCH v4 12/17] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-12-4a64bed94229@gmail.com>
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
index 725cc302df9f..97a4b4470dad 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2360,8 +2363,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2377,6 +2386,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2437,6 +2452,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2507,12 +2526,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

