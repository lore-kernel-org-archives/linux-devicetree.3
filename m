Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84634A796
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354913; cv=none; b=ql4viZTSwRSQsbIFklfjYPWMnyIKbGaqJS+TDXq3TLQXxSfxnWkUHl9cf4O2fv6g81yAaZ+sC1hPwG6KQE4CNa8EthW/rSxjK5UPDy47hfIna6n4c8eDTCDJOLCRuubMfPkgSelERENORc0wTrVGo/JsDK35fR704eg8LX3WaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354913; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoB9a2eDDNDa5apsW6CYTD4UroRClBxu6kS520EQP/k0a4El/RcxdVfpJvGdbasCVTf2HwqYXD5+awXgDQm7beVt2rhx0+xDLdQvZ/vti6dmup52gBLSJVd7nQE/5lsaGGvwM6bUAxcoNjgNrfgwc7MX5eLue36QRV1qtD9d1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mom1tinH; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mom1tinH"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae739df5so478224eaf.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354910; x=1789959710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Mom1tinHZz2SDqXo7HhMUZSwWMktQvIvDyG5owl8Irc29i3PircQuWNMMthhIxPuA6
         qcQSzfhxUIrYAbQcg2Y2K/2MeD+lH7HLMWaDOyHUz5QKVexwKnU+KLnITQj+2Na36SDG
         2dGzUGkOYS8FUX+feywlrrYAkCWLRJbUfL/TkJOxucm/kM4ajMj+fWinczN7pjDJLdHa
         x5QTJrNy0QoqVo9ycsod8NQARvzgSIoVUcSUid2ZcHHEGNpceJwiDo8qaE712egHKu2W
         jo1EHxRkrZ4A8Aw0ukokiFZCMdB/nyM3I8/PlfMsN6+OTOcfo4bmn4hHSzDQcl4xcpLW
         2bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354910; x=1789959710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Kl6HI8Lj+ccsyXA5wXD5HtmEKeyEnPm4un+wVLaVVNIt3cyD9z5jtCmVKiAGbqp0rE
         X5tP26zoq68TKZok2fnMro52KqM8vvAZXkzAT+YbkY3Lx23QX72wvO+JrPxEkvO1ySF/
         tnqe29rkWTTnRT+ruZyHnXdBH10gCK5WEVs7CtxVkw6Wy+t5m6DQ2bZXVQZk53oc/lml
         32rv/KP/70KRK5AVD3Ty5yKGvDwYGB8imrVN4tybuZ073RRSn1l64d9PHbain8UyD74i
         FtGlhGAtp+vXTAfxoqOzXoHhPQ6WCpTBn4ca+v1w/W/GLi5ik/gQ77jSrVHL3pEaEbbH
         sIig==
X-Forwarded-Encrypted: i=1; AKwUvBy0+x05he4ZDGlI7OZJHzzR0wSatnfEKYU/ARGGv3bBet4dVh9HEhxcLgyXQs9semMO6PwJ7JPuuqv4@vger.kernel.org
X-Gm-Message-State: AFuF++kWJkLfTCl9oDHtjcetedqRqRIwukJulqo3aFGB63kYXHStboEW
	iCIXiu6Ufog/aQHvTj1DijHtCYIjQrVNBjo5MHZG31lgy3kEmKKsWFOG
X-Gm-Gg: AYBFou2bOgUQQvXQKqtcp5TmnDoOIIb5t5QmkBmtzTDS0RtKKjXTS3XyRHb2UFwWC11
	W4tSGp0m9ExClTqJQ6Sqn0RE8msJJeD6PCcMR0kpaGxRx/i6jAa4Wn4LZs6eJ3VEtiICJuJsUWZ
	er957x4pliwnDKEl/fzqTCwpRHwJbmJUcAifR/H0j3SdBBWvRWjJQq7OkkAhUyOZ+W7ad7QsQF1
	3hr3kG0tPuRH25K//cNXYeWTQAtcMjXoiqpAqsjFO9hkBf3UjX3NG55ARNn8an6gW2ellbUCLU3
	9+fZC707D6n1ruUzfIPY6J5xY4OBY2Ldu4Nh3u3fHvYQ93OzNgepgqdnO8HBKD8WBgtppLc+j0U
	C9FDavt0abrEvMuTXv/cgOJp5hBT90hUDH0qwrFHKBK01EW8722Ad1VGI/hjSARrG53MhcqV/pl
	7b1SK+pe7RYPjn5LtIymzsp+TGbYLQlGlN08bggPe03m1rNJ4zrmbT3IRLMqS6VXha2rQAgHMW5
	9f40Q8VzvcVWjTf8hpX0/wUNK/GaHRHo/NMDW9hBj6YLZmZnKmcwwI8XTyRdS5hAoeD+Hu8UEKz
	29Tm7H7c6FrQJPjlepKuOAq6eAdTieOtKPxWZ+aBVu4imRu6ULa7M8yCPea1qOoupa4kAvBByph
	1mFat6H5RXyO2f6XIOv/Em1Oj/seXV8B0pipLBp6J0w==
X-Received: by 2002:a05:6830:4486:b0:7f9:555:1def with SMTP id 46e09a7af769-808863d0ac9mr310838a34.11.1789354909720;
        Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:14 -0600
Subject: [PATCH v5 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-8-7d711076a6f7@gmail.com>
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

