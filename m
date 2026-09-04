Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939DF3FE359
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557021; cv=none; b=B00FBLEJO6cfTKmbDDU2xoVP9mNA5TrIgaky8gL4M1a3nOdYjL/TJxKz2snGe1EAcA1k/T7xN9oC6cQYhN1s648FXBfV6ssjJ+3Evw2OgY/i4+11dqZCg+KBUYbjqSylvgrfPs3FF4iuIREvLawmuSd6GMQ5wGo3fHK1S9TE4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557021; c=relaxed/simple;
	bh=P9VhO/j3MukvM1aMlXTflvte2/XJpvtBnpClC5Qa4Bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKtA/UdmmzbGi4qUvcYhxS2tTVKV27pEYHBv2zl8aDba53WIXXKKHpR0MTaYlb6DFpb0JkcrJ+ekNKDTwe1DYklPZ3/+nLUFcoGx9OFXEljXTYkZmHLJY0cU20SftFXDqY5dcMlj3IG1p7vYyJQykoAnyd3uYpKNY+QKP64d4ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMoCAop7; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMoCAop7"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b37782d003so1055564eaf.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557018; x=1789161818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=HMoCAop77ZUbkd1i3oeZHwv+MC2U8Rq/zeMA7xdeKPTOfOBDJkkwb1A2PHqs2e+q4f
         twgztz3XAczgajbZWH2Fk7kUc50PyERaSBVCOJ7yTsQx7ONX7au2UYI0od8xbrkS6mju
         2ihrT1LE0Y5fJGUt8B3cNy4/OUKPz1yLEvOz18R0sYMP39PwzfXCkOb7K2AQ0d2j/prT
         g2H8QfgZQ9dEI+bR+4Z0RVy7PpkO1DEy2OyQTo+xn9qa8Js/zD0inI0RhWck5J+Kx32O
         obHrKoNYMcn9OeJpEsb6B6qlKJvJwoQ4ekJUl/os5OSth1T0iiPDYpkLHQMXobL9PfAc
         rGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557018; x=1789161818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=HXK0ZPYBEdCS764n0yfyZvvqY9S/FcJscnBaiW+jvweInthxW1IEYsuvvSStHkYAmr
         10Sskap4K1Cokn2soJ6czXL9JTJqfvEc88971fLO77sjC8u4aaS/JpQE54vGW5AJZK+o
         aYgT9MthxElyXBMZPyKuoQ9IqWq6eVWNCJdpPehPem0jolhwCNbSo3l8elZahsKcIbWi
         SWoQ4ZJyGHanGpBNa+hLmUDI2aU6vOZjTnaG8TT5WzBLXyoYxEKqpWXKUy0kHQYzOV0A
         s/XED/B335WPr2X45FBjdBPIEvMOFTH5JwKuz7Jz9uKydr0875P0PzhQfASX1NyckQTq
         MP8A==
X-Forwarded-Encrypted: i=1; AKwUvBwqsl30RYn1fIioiu3xv7O70eQ/4l+zdYv7oWUKXF5yn0mStFUeadE2qZ/B3RnFJd+cbzlg/aFbXy98@vger.kernel.org
X-Gm-Message-State: AFuF++nyqIa5hAksDblyl8xWqWk+OhD8lXzjBZ07cnoAn8Tqn4C2sScp
	J3I7Y89eamojAohVz3YRmMOJy+i+N+zwR4vJCqdHKcSEzpE45tjLrGCs
X-Gm-Gg: AYBFou2lTBza+ydRS2Z649y1cF+wONkVezqlGH1Szpw8KwasOU6XgCgschyRYIAEwig
	Gsntk8mt5XTEyxJ/URZKyf79Q/tFbF8BzbHrHuHwjAHzcM39LI66+Rj2boEbPu7xAO5xtteViCS
	CntDJ3hFAFXsidFDRVvBh2sXmTQqKKMnS+yvIoBhAikUFgYqLo+OpltTjOqmsRL64474/NQrWix
	jDdky2o3OaO5Na+vlphe8FiTyrLmppD+rQMx9Sknzpm5F0uX/jLHWmO75LUduqH+M4PHVsjCzpn
	TTw0ZZxq7R6mbCp5qeMCfgK1EIqUYARDVLj1W3QuyXuQl3zTy8fiFI9HuFyn9NSZjkzrPosjbgg
	Qqx4HFz5Fac/0GbciKbKvpIriXaagnqIRO/XtfhT2aEIkf6Kpq7RUz9NejyLtwTKRToUdgNznB7
	q90UtD/qBIl6ZjMmwIK0Rwk2MiXP7ce7ey4D86DbINAQYCQL7tnIcDwlH2ae+yoOK3FyuJMZL1q
	Np4NCs8PSilUTtSsH9kDW2vcUdSjsxHkAGkSXnFZDYah7OlK5H5zC3SRGHu//CYok8mWav8s6oB
	lk7729eMFjDMd5IF4f9NDQmu9zNaAuC1QWqohMFzDwwLSUpegAfQwuSwOX7dKr9gK9hov9+eams
	qeqQSs1txktivUhgBRfM=
X-Received: by 2002:a05:6820:180e:b0:6b1:65ad:3181 with SMTP id 006d021491bc7-6b6fcfd957cmr8410089eaf.16.1788557018080;
        Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:13 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
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
index c1246a9268ca..1265d900fc27 100644
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
@@ -2037,8 +2040,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2054,6 +2063,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2111,6 +2126,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2177,12 +2196,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

