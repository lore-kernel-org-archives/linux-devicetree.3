Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428924418EC
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403108; cv=none; b=M81oZUB5sGllN36E7s7i/UR5k0ZxoJnKDlA9P3trGMD3Cs0sMadctAT8jm1TqI37g3W1ZPEDfkftTg0rbLdPghF58BCaqX7mVyPBg1QvtVHVL9GUZ6Ac/V78/iv1KsDiVcHBUP7mkAU2euSSbpUFId53lbtNyKov717Cs/zjX+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403108; c=relaxed/simple;
	bh=Be/njScjEbeVgMustlkrQQ4N8+vAdJ4W8DhUcCS89Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGSr+xvq6BRMcgO/FEJJOdttvOVnTR6RukDrrXYTRd+GEd6E6amZgu3Ru/dHSjIk/gq46rTvUTO+4YCB/s2s14s28OWvRZprfJzMxcPha4qr5/wj7M3FRSY35NcZMOm0g2tLY8kzLKHlRoIqwoPNYsbtf7P3sLthVdyB+KfJHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GysAGzjq; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GysAGzjq"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb787dec99so1460327a34.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403105; x=1787007905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=GysAGzjqVTpGBFGMvamN1ofShDy+l3iDe7Pkfw15/YTNXx4FPkP4kVy75oKkIAIw+e
         gC1OTSarAjzthbIgRFg4DFmYfsbtqox4IGBgmYhQHmEkONsN8cpbbXmMahpWbvFQvknA
         Luaq5DAY2owl/Lx4nURGR2BPA5ZF7vY6C0VTr2mBZMBOAMafc2rDzm3FtuUCppbk+ewv
         gnjU/5VOTn0+BDwb20tSY1tp9z7OFm/KK27rp9m/vdc7GZ81lN0zrbTLaAmUrRMu2TWA
         sqICqgelI7a95yplwWLXs2kOqJXvQ2ODRFJBcv7WczACwVl2QTxh/6L3yAFXzhzfY2el
         cJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403105; x=1787007905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=plcO+8p27+Bl+LEcs15nrXUSCBhdnz2IDJT8vqOVvARWkjs3EdqJHoDU+N//pCU5Vl
         4dbZBWQeW5G+Gmr16o4YhqW00lzy3rj0LP8+B2wTm1zU+MHjU9d+a2Ingj/+Ie4cLQWp
         PjzcpIBzgzCm3YkkF/nBkH5YWRN4vuE8KwPVT60QWOxukD3rTJa1/NPyexyqb6nNYYqb
         5VEYpDtQH8yDfCZUwFB8+7WpE+dBB16aeQOi+qxSSnIVPCbXc9NQTRLNPOv7HPd3IVvx
         hOYgPJPPTY4ETOIl1bq1gbTiYeT3/hoxHX3bfkw+oKm2s2IngM6LecDtZR+SsAFzWhz2
         HMWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEKCx9V8rYIP1NAIYgmG0MlO1PUystFaQEp1vKLDOlvvmkAaJhzah+ijQPOmD7zS11/w1XmwKZpaSZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyodN/j6ME18WEJM/RCd8dfcT+GMi3O4tZ6oJsMkTm2drJaZxYs
	Em4t3VIkQ+vywwTpDaRNaa9G1wEPwRIxgV4XeD85WuQNqlahaeveO9ia
X-Gm-Gg: AR+sD10QSp7TJyma+5JEppXnGGsPL6EtjiKio6RY6zg4Axyf6L1MbDl1E6JDOgPbYZP
	U0Nnu7w+tJ0Xr+fNM+YhbojAzrq+ayf1UPEp9kMvbkpvOCpzYH21ghmpNlLmC5hVbFItwPLqxal
	KfuXDafVNQ5baXTJDQISuVxUL0js5FWgzUNHdRO1ttpBexLn4fESdVA0vF86UvNkme3kNkbjuxa
	TphYCtF/bTUKihLFZsLYLTREfNQ/zSDGQdeyElryr0oWJ5PySdXk90hFzjCCm4RCaG5C7/DHf5g
	f0Lv/5BEQfSUz/n2APtKCpSnStA0syIr6KUOlmFNcwL6gTlsT5WuTWysN3TC0igpAYU4c8DcpxD
	XtIc3TqPN5eb5NKZz+7VrRfnnn2QcwrNbGr6iK76he99z5PtnnhYcYR0K9frG1WXLe61PUHxPFn
	ebJnQdTGr6WAazhz/pV4GCS+rtdtGgyIg+Zh6RnO3HFhkuR6lgAxiudTw5GO8aeFPZwbmp41lgk
	aGIaQfQHImUiCkoTGEeQ8obJj9wUYQZkJ+vi4aoUYP+5BYGU3bGWaRfDA6nTAWxMMAe4gWQFvT/
	clAQsO5Hi/7ItHRjUq0ovy8kpq6pyfQ8ZxYyZ7g71McgGU4HuBffHAqnPiwIErlX2jQuiZ0Hhed
	8eF39dNCL4twwVSTU4w==
X-Received: by 2002:a05:6830:3591:b0:7e9:e5c0:e0a with SMTP id 46e09a7af769-7f39a872f1cmr4107850a34.5.1786403104757;
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:51 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-3-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
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

The allwinner,randomized-oob property selects the randomized normal-page
OOB format. When it is present on H6/H616, use four protected user-data
bytes per 1 KiB ECC step, cap the total at 16 bytes, and assign the
entire total to ECC step zero. Reserve the same total before maximizing
ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
and need no additional placement change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 92b26371a6d1..2388cc361685 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -223,6 +223,9 @@
  */
 #define USER_DATA_SZ 4
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2036,8 +2039,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2050,6 +2059,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2104,6 +2119,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * remove at least the BBM size before computing the
@@ -2170,12 +2189,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+		sunxi_nfc_init_user_data(nand, mtd->oobsize, ecc->bytes,
+					 nsectors);
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0

