Received: from mail-oo2-f13.google.com (mail-oo2-f13.google.com [74.125.231.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DB4A090E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420212; cv=none; b=cfYSB8OrFTWNIeu4BOyhJY/PNdfWYvVXdrT+Mi5w0P/Z8tRXRsI/Xi9OaeYMQAkbczs7Ec0zoi81E+FqXHpbpMjNF86qSBXolz5t4bEZvSEwkSc5460IPncjEy3kEq8+3jg6O5jcHP2HdGuTqqYAIayKIc3jcJ26XrRA43zLhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420212; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujGeGo9Qy3rYCmodT3uI5F/K1o1C+m7PcX4fgQdTyv2r+xXV7XnCqUNajb2BXe41HVSfMn9Wlikd6MeJpSogvU+iKzKFGLPSyEcid3jUhmvroJUWvgv75myVRxz+frn2mhAx6Nc6IP+qCyA+jEe16RyBOAS77Uoe35VO72Vz77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjFsGnUE; arc=none smtp.client-ip=74.125.231.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjFsGnUE"
Received: by mail-oo2-f13.google.com with SMTP id 006d021491bc7-6b1ae7089c0so1335220eaf.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420206; x=1790025006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=OjFsGnUEbpAqGya41cP7mMU4oHk4Nxv6gUrg4eYoUERC/WZGyNih53fnxnGH7KOUT5
         sdl/BUlYPnM+W1MYeTmrEqRSCH1/8LOqdmUix7uUNot9/sk1bfytZHZQqkXy6nW9IBz/
         dDN5v7ZR2b2Qnp7+Xw5wDGRwNQnh0jwRK14fhZLWtPm8d/Szgz6hKO2vLsNE6skyJBrq
         y+vLYGVzQ5LPdwTu3iDfqKY3zDM93jAy4K58LlxMrk/C8RCYx/1kqK7KYMhEicSNZwao
         MCSpPip1VsfDk3qrtfNmWjRXshfoIxM7wLgCAMyc5t9TnUx3+4mWh8iiZTzQW/fz2HPC
         DRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420206; x=1790025006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=m3rTbCFJnrEwgg3q89SG984pOsd4sDfyU4EbOl1O5fpG3U2FqqdX/UzLL4XdUIZsz2
         dgy3J/cu7xHN33U/MIQT5yvjpFCQ+JQifmBFrMKX/3BiNTrxM3VecX6bd8kCRvzyJMAO
         HttEcWSSYel0CGqkRrWP9dtp+oElWw+nH22/NbLHlY18FjD673DJW9IPBrUIeUGC/S+G
         WVEGaoOo86oZrcVLp6QgMUJvw8USADNQpxhvO41XEwFt0v+zqWrRhQJQKDkHn9aW8X+2
         bgplIdVbW9Bzx/1yyS6r02Iyt1Um6+sfXJKhKZMD7xkDfmu+488kPXPkeqSOfmOEQxb4
         GTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGKuooblWb0MCwbkevHJSKhSgG7oqltgKIseW6lPXSQlOiZA8Uy9cZAxni4pwGKCJUYJ+SK5NuG+U6@vger.kernel.org
X-Gm-Message-State: AFuF++mr3mtFiBMU5Mo3/DNVn5zZZ68y79P/3+cPbQ6o6j2JfX+7PFYI
	N/MNFV5RztCUWQcT2jPv86hpQK+qa35puoGAJMujDKVsVYvsEaA9fhqs
X-Gm-Gg: AYBFou0hKTrgzhdApCBRj81RaDvm7nLhHv79lLh7n2SZN9qNM19U0T9t7GeO2DASMe6
	iRRuUNHPs1NKLCVvkirjMi/l+g5PcIV7TBeu8RIkkSZfjtQc2+LwGaU80+5/0GU3rqZolvA51ry
	peWITLbr8r7agw2h67Npe+x3uBEIO/Eq8aw106TgWh6EKYk2JUmQYQx1aUnyHWraoSP1vOq/tHV
	9WaXQyH8djwrnJPB9D6Ecx8xrUnNJLPbJ5TF6s9vsAGuOmzwSoQjfTPpYmjy7zJMCxr+Hgy8XQN
	nhHKlNcZgrHoRjHCNwmG0xTbQQPpdOPCGDzypkaOyOuQ/pKnZiXtTGufn0TRS/z9+8t7INI6RlU
	NHREkdwDfdrSE+MNZJorJCjtI2OeBIFvaAU6p60VxNlI+4pa3219w6bsOr1Q33hAyOAqyRrNffQ
	4KcUzS5F+TiBw8HbIXZWE7+Y6kxuHLOTV07YdTzVAAPB7n3LuAZOzert4y3BB95hcg4Nwx+onaw
	FmN8KKiskOvuX/4pTw2VmDZHz5xyW3zZA9JPAm5YEwSuqeXaYZ7+RAfrnFuXGNqmb2C722x9/zy
	YFnPyXjL/iKn0l5rvdKO8Wz5pmqKnOZIJVzae/3OM2f6hEf3IZAilSTEXAYkRfhUX/66sOVxid/
	vAxC9X/u+Xn16umM55oA+Tn7t9joJ
X-Received: by 2002:a05:6820:c85:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6c541457fa1mr2615579eaf.38.1789420206238;
        Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:54 -0600
Subject: [PATCH v6 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-8-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

