Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B2345750
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354911; cv=none; b=N7E+I/ahlA2G8M2YQZs3C97jnwbo0/Lval3uBpsX267nnZdikCgSFSmYDlxjga6EnkhVL6Vcdjiy1yjDxY76CGXDetBnXwv19phTc5QSzLbKFUeTFkSQ4WT/H3dFOpVGa1pcRss+DjVlGnEa+zHY6H+H20q1gHIzgh3oK5Qk0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354911; c=relaxed/simple;
	bh=ovOsliEdUhvhRoeaXGSGPM3LycBRMZNPRXeHkTBG1HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tigYZ4WgkB1OettC9Wlnd+v0jNdinWMw4GKg2tMeB//MGG1jwjxOn5DITvEcTFag/l5tjyNxHCHOacxURGUa45I1Vn7G7eESNS/O85gdIRVSjC8qKDwDVzfATnMTLxUWg5s2Utua+5sv0k+s+ISEUGkKaYJgOEUSIVjeLpyuWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwR7hW9m; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwR7hW9m"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1103211a34.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354908; x=1789959708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=rwR7hW9mIvGADlnH8wTrvjByc14LhkUwac6f06ukK1bpURHR+B8+1+HG40klkTftan
         uYfzALM4aX3HcWJOiw3nlcc23/GzlQhyisWcstzBsBOIAXuOP0PEfN6/REEw5sD8vMOZ
         Bzz2qEmng58Xcgi49e0yVxjM3G788g6UMyj+MeZNDzIILZn9Ld7RMRiCtCqvwhLY/JSB
         AcWKdOM/3hU+wquQWrofI1GaK9aszcOgQad8vVS4r3tgr4fXc9JD5GsdaaAEgnImXDqY
         6RQOPbsm/8d/rYVmObuq8C9jnW9q+DhW5Xp/XLY707k7uK/AnN+DV8VNHxG37WQr2jrH
         KgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354908; x=1789959708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=YLGHV6Bxy9WrCFWmTvuIN0OW2MVS4RAeWNIzEqMZQOjJnr2ZBhYFCKZKdn6SBAyL0o
         N2uQyfvV5S4fpnaXgikZrPrMPvfV9kftRzaxYhyn47RPwv6Em1+3sI9VgmIqQ4hB0S1H
         fbVXP1z7uTPE3NQSZNt25s0Nd0Kd034LgtJ+WBzYiKIkUO7sBOL+ioHeLJ+IbuWij9ft
         WA7QUQ8AjRMHgj7yl9ZcFOkTE3AB5vq6QRD685Oh60AnxLwcdaaw3ykZgGjN6IALweAj
         BJfZN0JNmOAOSoUIVDzOW7sHQrfyGcXnjErsjyZ1H8x7ht3U06cREeTuellNFIJyYYd1
         Di3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWhHgQf3qq/SgZ4MvtZkCfmctoywbfII1EYRWiSnDuLAQOTH06uEa1/t/bmmbwb29FPr3sVkUrc1UZ@vger.kernel.org
X-Gm-Message-State: AFuF++m03iJxOLX7ygmxlQE3IKCukOeEs0qnahJduS9Jvq2diEjA9e6x
	qS15t1dHJYn98CseAowUju7Rv9fApvaJtFOw2oMWE5/F+GwCUbtCYCtR
X-Gm-Gg: AYBFou1jp/u5trRdO/0yuT7ekkulX8Ql1zgrfdvOYsPxjjQs7+5/54Q4VHTflXwFeku
	S0JgKJOCBFE4hOelEKMbNYOI8gXX4lmJnDsXNFUzr3F5CzGO/SCBIs73cAW9VA5wwHXKOFhwgR5
	RcZP0cdVusUweyEQewDwQ1gdaWbGhz1OSn4BwXDcy9qNR620Mvwt4BJCepN4A0T6JIOmV1kGPtA
	8v9njgSKtWc5RQTTA+WbZFENi3W+HevLKMdGYLx21o9uhRY8q8Gon0KN24RCPEgeaiiquin12Oj
	ciZDmA0hgxmkI4ZLAzVxDSFWTQBHVKzdLoVRH/q16W7s3Lx3hLe86X7VsiSwhStwXj7CZA4iims
	GXU1AF9goV+c4OCOBBpKb4WYnVW4JCuNFjPp8YtdBCXvhMa/tGUed/L8AhPqc9hzEdoEgpT91G8
	XUsdJ4TWYyfTHMfwmNI8MGjdFgVASlpKD9sEUXwfN8T3w2mX73fzll5yZBo6wUy5AcQ68lCJBfT
	ztFY0EyA1zUHU8M5SmRP3pE/uT4EM+3wJqObxW61ioJhxx3hPkBJ9L1f2DCKVPC70W9GLOZrlAG
	Ak2yR6kuwmCxPYhmDg7KCgL0YPKSlED3YhzMKY7uWJSooftOA8F2MqnEfJt7GCee6bHH7djB1Bm
	C6UDQfehht1mTPI3YiedaMAa3u/6FYQ==
X-Received: by 2002:a05:6830:4c18:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-80897c868f2mr541126a34.8.1789354908010;
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:13 -0600
Subject: [PATCH v5 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-7-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
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
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

