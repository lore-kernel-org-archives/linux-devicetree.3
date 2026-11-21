Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223474;
	b=IG75Nl1I3qvfKlzQcO9iiC6UF/OF3WC6zyq9Arh+OMFk8+i/maFpmOZ1FmfpCi/rG6Q8
	 LSjmj5UTqmnkDlQ6GZ35JhHnmR+CflWSq1pY9+Pauxd6+lFwstnHRnQc+p42RtyTKt3qh
	 qCf51aFwuBMSCD/tA40VHxdtVbSnGeWQiUvUj/p+b3D6y98z7pNdfnhcwLeIlAqMswXQe
	 tK0dY5lmHeW1Zg8CNDCH3fSDPfcrEmI1QRj1RGAzBsaJsJFpAiqWNTK4aGI6JqgKs3L/n
	 EEGx9Xr/XXyCODVQ//6cLNBvqBTrED414wAxU9cmDHUevyGP8r3YSRtEEqvRL6FJixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
	b=HQkIdd5ehoDjogR5nRuSuPow/nDBK+cBoA9dB6BIJt/LaijY5OERwos7I6ZfVXrnShYk
	 UtqGFx4PYLvkBNUbjprYWT0vSywVJbPyKDU7pod3fmRtMan3U0mttmuIQpp6WK2BZZ5cZ
	 iJo/nxGALJXUqZsOwirtYgZYmViUTcJkacbqN7pqubq7vFNhU3QMWZko7PjRcyZKpRUus
	 OQUuFYEuZ7ApxTAaby+HA1HTHfteILmZMnKPpt+f6EkSppDZuW+H/EHllHy98Wr+xv0ME
	 1j9XoPGuM75lgJb93pD4DOtBTYLXg9AKNSgXGPQ7OuyzRWW9TJ3s1VeM3ZLOjtv4yFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urHA8UV9;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD96C60A2613
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD96C60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urHA8UV9
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed188ee81so910567fac.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223462; x=1795828262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=urHA8UV9aC9N/3eLeoNbfkRK7TFK+v/AKaDDkdh9ymQgcv7WDKnq1ql//pWdy6BGUH
         NHHon/zLIuUbD9ipU9zLNKXcK0P/b6hKHsRqZkPk/+GJ5mnFZXffcAcPYEYwLB1bjVbI
         4fnEXZwJixKEu0gmRZz8fwEYqggdEpXx6WlkS1FMBosr78lB9WiH01IMcRT6T8NtNasY
         2iqs0aMTllNEzFaBVg7ci+F9anEN6o/Mh8lHg0wRTW2LpQlsE7vZDyGBs2mtq6A/oMhi
         8261VDcwywEe9wb8uWyL7OiLPyKt+lYe2pXkzlVILuoxpRhzCHtWjOxKYN+Vx4OFkO23
         IOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223462; x=1795828262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=U9nDIVkCFDR8KqArhnRDE311e1jC8s25GuqNhSptFzoWM8RLZcboQXncslXWKzkkGy
         fyA0nUgU+/9aXG/88p1HjUNL6p0UDP8fErI0+NN++T+ux1ausr2utX5JYGSBp+HATAkB
         YBEdIHFgJNhecAHOdDxLy6z0kpvAUhrQ4/W31NM4OKEHP0VYMNpJXFiCyTW7rP6FU1Lq
         4k77vXaw5MZYG1ecGacHykBKSnHDXIq+Yv1DVRgMMeF6qu1cLh9MxmNdAKmdUc5s0Eh5
         sGT7h42ACELBnBj3wldcEhWHhKV9SksGz6+nG0XIzVTICUhJs6YqN5gbtl8Fr9dYKcZR
         BQZw==
X-Forwarded-Encrypted: i=1; AL+hErFRuVkquDo+8+XKjzYhPKW1uLrBW2ZYeT91hVHoKBB5ruqSFI06qEQdIg3APswpOzIUQL2pVMNfyLjX@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ch+/ytUYR0szZk/IcKh8YIbQoxRH6vcLc/Xscg56k69RMNyId
	dxYUVqQTCDA9NdTR6m+YxWSh7q53Vo+as6mGI+YA3ZuJQ3ZOcP7CFccH
X-Gm-Gg: AYBFou0Q5MAn1MJWdUM//FWN6temZfAR9nZTam3kyH/2dvLHWDANmEWEBd+9+pI0JI0
	mi4CPooqfAhlijMfW4YVRyBxRQpk/kwVG6JC2X23QjObYPFSkZXsIBxsn76xbOC9ZiywHx+A2W1
	PLbYvv60Erj+fxGc+s3tO8KcR6+pz7tTCO9bhmCzP+tOM6EHJE9GoiqzgkACbRA8jhKrTzWUkBN
	57sDe0TNMRSyeER7MveA5gD/bWW5gQSOCnO0wbWjIG7dW+TaU0YvzRryohW4qDgrAuabOgw3Fzu
	/wdBrK4+e9vlR89+eBT4thdPt4rVCOsLjhRb7S9qLs2SvA5dK8m3sY8WjzhCzx/BRADKsl4LiEd
	1ZqMJNRWYebrMmiQsLIxZXcZywa3HhmgQVwN2Z+DVRNchBWVVFrKLO8fBkHLFHC6kjGbHo2nRrm
	ln+luVDaE5LcNb+uaCxhz7s0MZio0GDb1x/eLC1CDib8GdpnK9t4rSf83QI5XIXfLBQwkH+e02l
	YeaZEJwHzFam8Ghu3ufJPwzsPZNoIg8BFYPZ+9YVuHAjz1XS07jrXuAymf3NFdhwA+6TpKRWVfO
	nY+UxYxoNspFYGOtLzYwktJlzctYT4qGDEA++IlXt1BZgeveUETHIv8oYNFciYPiHQMmkHlxAQ0
	pfTciryXOYoYVCl3j/V00HF/ZXPL85N6pRMbhY18jbHTP8yGOeqheiWk0OI+r5R+k7usmAfoFSB
	d+TVaPt52pqy2Q0dwP8RaopcSKvh5Vi8WGvRc6jxsoxbYIgqZU6/5H
X-Received: by 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr6207418b6e.16.1795223462573;
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:28 -0700
Subject: [PATCH v11 05/26] mtd: rawnand: sunxi: reject ECC layouts that
 overwrite the bad-block marker
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-5-9721b1905ef4@gmail.com>
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

On 8-bit NAND with 512-byte pages the factory bad-block marker is at
OOB byte 5. With a 512-byte BCH16 step and 32 spare bytes, A10 and A23
can fit all the parity, but only bytes 0 through 3 are user data. Byte
5 is generated parity: programming a good block can change its marker,
and a mark-bad write cannot set it independently.

Reject on-host ECC if the marker is outside the two bytes reserved for
it by the layout. Leave the on-flash marker at its NAND-defined offset.

This also rejects some configurations that used to probe. On A10 and
A23, requesting a 1 KiB hardware ECC step on a 512-byte page could
trigger a fallback to software Hamming. That fallback kept the
controller's OOB layout: its first three parity bytes occupied offsets
4 through 6, including the marker at byte 5. Selecting software ECC or
no ECC explicitly does not install the controller's layout.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbe851b87c7..086618dee999 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -221,6 +221,7 @@
  * On H6/H616, this size became configurable, from 0 bytes to 32, via the
  * USER_DATA_LEN registers.
  */
+#define SUNXI_NFC_BBM_SIZE 2
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
@@ -1939,14 +1940,9 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
 
-	/*
-	 * The first 2 bytes are used for BB markers, hence we
-	 * only have user_data_sz - 2 bytes available in the first user data
-	 * section.
-	 */
 	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
+		oobregion->offset = SUNXI_NFC_BBM_SIZE;
+		oobregion->length = user_data_sz - SUNXI_NFC_BBM_SIZE;
 
 		return 0;
 	}
@@ -2099,6 +2095,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
+	if (nand->badblockpos >= SUNXI_NFC_BBM_SIZE) {
+		dev_err(nfc->dev, "cannot store bad-block marker at OOB byte %u\n",
+			nand->badblockpos);
+		return -EOPNOTSUPP;
+	}
+
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);

-- 
2.53.0

