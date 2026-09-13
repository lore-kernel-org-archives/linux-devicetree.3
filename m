Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6062D7DC8
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272324; cv=none; b=buj/7x7BTjL/JKwYcQ7FUks92tEfVxqcLN3b9Ia2Pb5raMEPsYS9Kan8hvl2NyZ2yky2ZY8Tf74KAAT6soySQM+Dh0iNAnVZMagCPDy4V1P5q+DT7JczCXoJt2tJgFPLWFOCr0Lr626LwpS0YD5HOhn+qXfx/B1GKpM/wxdt59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272324; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enYpX5Il3b5rTH2T1aZ8BJUZxx1mx+OgoIngeh5wSX9JrsJR8q5qlu996GdG1MnU5gqBL+PLT94gdKRiJ4w5FA83+7RO4jamvVAlX2mNZFLyxFfdlNqidnlfP5vdGg28MfPiTi1rKSXvDbZNYLD40QgPWAmzEcB02oWNjNBafjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBahPvoM; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBahPvoM"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so1170830fac.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272319; x=1789877119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=TBahPvoMU33zcyiu7G3nfeGUiv6lrnzRIGV2FcLK/oXV3yblTllYF3GurMd43GyhPI
         1tQzmAqRyfjQWIiZJPaApiEbXcHUtX997++KanuKqhmOwdc9o+0AK7lnJ1qou2Wxo0gk
         H/L4V2kKZ7AvPaBQbsMlS0mg0KAoaBxMDlzQ7uO+N3GJCcFu8nIqX+RS5a1YVkLSge4i
         bL6tOdPOoIh2lgRClQCLZIiF52lxPVhdHoA4XJe7vBHWy5Ozvt/OCNduJZNLsT6boKSB
         0K0cnmQntbB/QMYi3Bpz6WT7fQ3NFSDcPjkqXPJwniNUutUZeonU1xg+cFXDTUSfxo0g
         guYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272319; x=1789877119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=QGlWYdANEkMrW65DARSvS8lpSMrqRUfSMIibCUxX3rqaokr/kR349TOnPWCw+hp0nv
         JwuU0pQ/LODup39bLMH9FEMPFd2muZIbg67j+b3MoUMH8IwzBIEFhOGCboUMTN9C/bHi
         30jpBRd2OGhdUw1W2U6vbTx3E2/Np6fcCBTCnKJs+zJwF9TYyZmQde92PdmpW3cQvWwS
         do463q3Eb67ZcYvUKXa5r85Kd1JVJLbn1SIzXJKAw5o3KuNOdzxEks3oIsHQxYMbntCq
         nQLXy3+fbR+pKyEJ5EEgIpim18A2Dj7iGVQxGvArkf2dHyfzZ3saqjCQS5w61CvgSFF4
         A5MA==
X-Forwarded-Encrypted: i=1; AKwUvBwd5n8xnTzrQTSLJvDBAaYurz3UG0y5tERiTGlWdoVV4lbLYnqxVR7z5yMzHDHc220fnErq0EJyp/bv@vger.kernel.org
X-Gm-Message-State: AFuF++mt9hhPiVNS45OK7CDicghiaYj04UVlAdhh3WWF5GbR+AgTWYjm
	3s7p7PQs7dNp71baMyRPWRzLcyCYv9hOtwcIKcSz2gnQ+nAKLeMO6Pjd
X-Gm-Gg: AYBFou0YmoR/M5U2zGN2UQSXX5efotTE3koM+tqqOu/uod+FPUbX3nOV68edYvU8k0J
	5oycq/QNHmsZcdzI0h4955PZapFzzv5UwZ/Q7vz0rqNDWoTGTE5qu/5bh7q4X/bxQbg3ZyH+llM
	01AEe9K+jAr9OGmEE8a4gSNK1TFcHT9rDkleHx3+8ANZyoMMC1YWMv4Dnu3QRPnRjcIMouFi4SS
	7D2ahM9c3RdeqGwUjrNHHxWkyg29t9I1t5eb/Fo7z2R+MR4cWnciqrmbwxXkpUX/ttphY+hw4dN
	MB95nx4zPMu37HdFxkvWiUJBzPd2hh3bO1gSlmJ3CuEQWgDyaCNE9+IWYjGYYhCT5ZbfevuK77U
	ZnJs7/kH8hZkUauKyYBDgMRRFI19pPsOy0CAbNpGnx0UPmd+V77yaEGNYOShGpX/OdtWVuN06Eb
	OiXA8qzcJkvV3BjYUYgJ4xuYFEAfKx0hHE4tIXLwSOW44+nRSubsmSwu+DDdL85lsLTbbuIJpFN
	cJuipF/943z3SHCqBSEE7f6TZtIz9+dUJ66wuKgM2TQiifzJ+9+QwSyyHuEIOmLYqurpZiq2AKA
	48jH8psnNo70SLyuT6jiDlaNYb4mCWqll4xfRZ6uHkUJ48ih1DqorG9X18wownkKjPNNVulbgWV
	/LCkFrn8JKDxn9tDfFGutHd1jh2UuvMMRlEPvNaul
X-Received: by 2002:a05:6870:9386:b0:47b:7862:c1c6 with SMTP id 586e51a60fabf-47f59a2cc34mr2957205fac.23.1789272319247;
        Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:59 -0600
Subject: [PATCH v4 08/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-8-4a64bed94229@gmail.com>
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

