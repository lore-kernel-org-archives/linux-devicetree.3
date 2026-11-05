Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904950;
	b=lkC354KNUxcbB2oK4401licYLP3F9a6HmgPF5xLL2G4eFo9EWG1oywpyoqTMGuGWIAPs
	 DAfkRhI3Sn6AuHVg1XFX71Wl4G1WsdgZMAdmOhhgrXtDIzb83uS4BOOoFU1reoVtEqEZa
	 PpAHtRN5dA7vI/imLm5YU/BVnK8q9jj3EFE1kUNnM1ApgTfZcrWOztc7y6OmmS6iLKXzJ
	 zMuD6et+7LtCbcqlmXqnpYVfUZT7RMOISdB0P/K4kys0RyWxLTnR2jn503m79tOyEsJGV
	 9NOKQgAC5M7c/UJxllV5+5xUK2KWIsGhWwGS2hBVJ2dNsO3jn5Z210tPJrUK59YgRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
	b=Lt7BJ+3U9jru1GhTwIAsGjWhpF3cby5mbWb/KlhElcfwDEocAjjaR8Na42LY8+BM0Rm6
	 34ZzsRe/z7AbhlEAlawdXedIGVTM3Vn6Kq4CyY9ASxMHrQGdtJTvJJeePzHg4sdv/SUww
	 7MwV+vedu2yUKEhRrznG4Grc8rrwcm/H3Yo7hfgAs66XH1PeWotoE4qP1Qr5gVjeK41Eh
	 fuupmSMvc5mebalQ43jIwcx5lcg7DIEscJPTy2qGXEO/+UK+/LRo5wjsXkwD0x8wiUmL1
	 Qjk8eqT6+qppDG93SshrpZT3L0aY/5qFNnRb7bmcstvbkXiPLY4kh+BLjSHLrhh5M+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCZXEgPc;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AE606D803
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3AE606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCZXEgPc
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f13so2019248eaf.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904949; x=1794509749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=SCZXEgPc43pOgavVHXYM4opuzr6pdZWTBXpupakgkGrx7onatY35gYQrjXJVzXLugT
         Nm5Rakq6phVY3zxQiRWoR3x0Tbl4gAbee6KDcfesL66iTrQ8AEX6JxaEgEGQz0M4yqRZ
         J6jhEwnp0EmIPfHRKJ5MxOZzVPmarmxh2p6SuPCTfeR0/JFrf4jj2TWoUJxtmqI2Vyxc
         sKQsZQ00etF1rpek5hk6i98FMJ2HND5sO4V9KZLhR3s2ruXQWzTZQG8chwZxW2C1qSFG
         Tpd7vD/afWGbS9ujjdFzyVLmUityPY11dNA6PDD6Lcu/pb6GcFy7m/VjKtDb+p61LjbF
         +6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904949; x=1794509749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=eYBCsUaregx3G8Yy9/h1NVWL4BlY4uqPukUeYICmZVsN6DDcz+GEHT3MqB6q+0Rmtv
         qgYUERHL9jpuJVHXDR3BeDy8Gl3DtNusGlDTrzy8WYrCqoUWBGZwN7klGLvsQUQkzlNM
         mfbziSjIlvgKUIqzjB7d+fTWilar0mRjEISK15W6/N3BhGy8hRzNLS6/D66A7X/7GMjh
         YyqiJpDvfKHN1bKbg/XNkyAZ9KmaCeNPD/C3D+laYX7yU+OyDZa4ro4n3XHBiYfxwbBY
         vKzMuRMuBn4uISwfahjrnHpgccJ7MA/+07fn2haUC07nRBpf3fgxPKjq4RzGc4zjt+lP
         eepg==
X-Forwarded-Encrypted: i=1; AKwUvBzbd2/Tg8XrF59Cbpw8xsKFmI1woJ7mMGoNXX3NXL0V5kECQiyvfoHESkVMn4+WhmJ5mFZxfKgoTgHj@vger.kernel.org
X-Gm-Message-State: APuU4Z+KQBywcfbItBrU8Xg2pdw55efJfuoYLwPiSsMa3o/pUjP2vqir
	Q5BErA7DjzNdDvkyybUa7qYDHz3Ia+ynusyxygJMnFfKQFoCpvcBfbZq
X-Gm-Gg: AYBFou0J2Ss16PCt27GjKUMo5fZc0AjWcXHr/dqJ2+T/nXWrSjLQzsGy0asINk5FBAK
	wtX/9Jp8AfRGKJ+1bMwqkv5sh1RVwMs0/R+YvM6WiZabJIc5qZFVUa9T/pUOjYnEHBCU1kiI793
	dWEW8pKiByVPYCE58mOIF2r9oMDmpQbRCSepMc2NIgni/vPWGGvzmyeexy3R2teo2fFVJdVb1qR
	RZ3tZemPOeidnuwRQduLF6Fjgd+9C0rc34QQ5o6DsocYXn1R8R2GfXGxnX+guBsSSBG2rP4t4LK
	eYSiX0jFUeUCPw/FcJw/Yf2QtzEwDvMuBEgnT5agkY2gOG69bMm/RUDzSpIXtzdvDAhJ4aJ2+Jx
	stoDSvoXESfk4SWuWRV88J51gCUt4/gMDjoLWbWa5RiBOP8F9OXPN/OzKIOdtC+HLyEOKCIJUGn
	wUkKHZKixox3WGMjbhvJOA1ev6lG8WRVskqUB/24YePX1JvCIXwp7uArSvjcMTKBvLvWxdl2DDz
	HIDt8BXFRZ0HtMZGWCQTPd58uFtt8NfGr4t/BnlODlnhfqGD4poj3m6vTM8eiQcjszxmcZCGRWz
	+D7dsrcmL9E3iF3kjIDZKjcY8OpBWEOccSKQCcxg0d4gFpQ7MghRH8YBHSX+PVmHj+uutg0KTwh
	wna240hvIp9je4+CwZma6kecsTSAQvAGaM3pTP0xO4RXCJMtvL+XdZ5403Ub90Q943zRdHhSxdQ
	4jerl/o2tjmjgN+Ksjgx4DzHqzZjsVYoSDVxR8LzTYm3Df/kDsVZCM
X-Received: by 2002:a05:6820:824:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-716e744f8bfmr419274eaf.11.1793904948781;
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:26 -0700
Subject: [PATCH v10 10/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-10-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e952d7f6abef..e79fe46926d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1236,8 +1236,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

