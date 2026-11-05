Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904935;
	b=JRwG/6Llww7Eq2hfrhGDC24pkPZeiQdTBGvK5K3LoeMDh1g+2JAQKU3YBu9pHNFV4U2A
	 oQIV9HTQVWDEPLH8XLF3hYsXd90ChA50IdPuaZQ213Tgp2vUnxJ9p6GtpZ4RMOZTi4Wjo
	 PE5MatKDlUWBslEVJzcM+eJMqUtiL2m7E/7ct/Fo4l1rYF/GGxyTh9Lb1noChNodFijrN
	 cfvvWzGpzM7rXl/hUPV+WZ097+ftzL7PoF+HOiKXdubgBMNB/JaBuSPX/ydpA7co03gWP
	 O4hqFXR6r6wt145TwZOTx1dcvytZernM6r8yvF5ZTHRfQqoAccWB2YVjbM8kFCiUn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
	b=SHK7yc32sInvgfuTpbbUKztnz2lpggfoKHy79EtYyo6enHy+PMnCwA+Gp5l3XPhEEwGm
	 hQq0UdzRuslb5bY7Z49mSunAVbWqqM2qpq/biygILRo6fNsxE++1zKwrGlPwZqtzV/ftn
	 otfMrfXM94ss7qLQviMQQOrynfBIOwrFXmcBISFy7fy4aGSH/R5xtlLsBb6bJ3ezvStO7
	 Tel6gVOnTTXCm9auRis2M0vb9JrW2z7Eozqxa6bzHxTsOveyKHQUffdyiTdT2J4gJDkG0
	 U4Y2ojQFio7uNlIhmj+tjaIoDJcK6M9t03ly7AoCHYfI+gupLJ+SpM2hjki9OPde1Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E9mA/Qi5";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056A606A33B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7056A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9mA/Qi5
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b19e291cc6so1958340eaf.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904933; x=1794509733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=E9mA/Qi50Yh252C3sQFw0oB36KjF12g4wiG58NPgxE6CGKp3W4iXLmEdVPgKhAYj1/
         UL3vEX/70hHZ9dV5QWOEiuzD/3Q0ijN5x31MeLN6T/u+IHis512XjT8HnlPqEH+yERyX
         k3BEYgsyu9iUXJJIFUNMV8AHZfVDG3emRP0Zn8GzdHUJDyVjwOFipYTGowceDmWM7nlG
         4mM2fC/tdu14eyoH2kH7XpsTKmq9MtKogkRgf4DIeqJ/dE1Rzjj8/vWZMxm3IUEHZ4NI
         syVGeAUicyQmRqC+KSuonkJHIlVaqkFSgKzJw0zcFoGAQ+Pc+OQafwj84+Ppm6OAmJZz
         mgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904933; x=1794509733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=Uhv4KNqTWMwfLF3MOHICmjZWVxBDx9IjLy2ufctIgDjcxtl/a+1DNT+uXHxDNhxMIt
         NZU8c7Uvjz4hlNxfCQVS9bIb3b4PiZQGbPfaV8Y5fRvHmuN22kQv21hWmHQxV6pcLGD1
         ci+hTcBVuS1tHrRsf4vNvhPZlgRt7hqq2v6/Tpl1faWdYjG6w9mo0/iVMmT0gJI35rA5
         VT++dNwg/eEMt+fzCA3QhCSn/vHjBq71qWpp8RhaRRQFFYbyvMU49XW8+hm3/lyV1Slb
         jf9DTd1GWFvZWO8sx1fOtOOsBaw8Vy7t1KTG1fbtyYOLvXCJ5kU/C347buJflNaLY3kf
         mCLg==
X-Forwarded-Encrypted: i=1; AKwUvBzz5tenAwudSEr/1mvRDuaWqb1emIsvIqdgQR7qzEOGPi7xQt2SqoRtldwEqhRKl4L1jFDWaty2xXkc@vger.kernel.org
X-Gm-Message-State: APuU4Z8s1swKInvhsrHOvL6e/e2O6HIx4VC2R6hIAFQGReOJWTOfI1nj
	Zr6AFlj09ntSiJCsj4oR6pqKAi77FJqE7cfljU4TEpyGImcFMg8KMBh9
X-Gm-Gg: AYBFou3mIk3ZJQUbE/SONGB9wOyCcdRoEDteG4ePDOS0d8jpHio2YxyMF9nr4lbdRTA
	MA+gghSXZ3pkh2+45QSvljNkclLJmdGQCzR6oXM0WHBXR5Pt0M5BFEWNYPHYVspVhVBt0onPfj6
	pA9uQ/GxHs4ldkxcN9vjhQNeJ5t/9ry3On+a1gBB3kLaRn6j5BcOtRMbg0BfPghJa99mAfNL23J
	h46EjWhBOrqyLebjQY7TRphYG6whPdjCQErBBfXTnxsiH03Ioe5Ji6nmFGm4YLQ4drPJDy6jYL6
	A4ywomywB/B9sLVnrqofgHKQurJEYMZfSAcmPBZVQUpj2cdPbs/fEyENqSOJrSr4u4b5i1AP6JW
	uOnYmn8WlVeXrThFbnsGic0/jVFyyeYO0H5aNZil8aZPIPmPA2siF7NDUR6zniv07SuH/PWXVr1
	nuEQruSudd6XbLwuwcYAvA4WH5LNIXWLhEEK/c7U0+GCl+rSKJaMPOCXsY0RXQeNilr4WxVQ2fD
	fUI0xeRd53Snh7+wDzMRlc2E9FuNRTedPGjEtCykwzyFTPD6+UzDvvLDxL7nN6hX5AVSDBWtUSy
	Uwdyb8T7+jTXsUScKr8UkAJvKqRWLUcOlJbRjzwoOVgfwo/6N9OcCj+GlOqGC2UlulluS2jcHs1
	IV/IpXelDawEKOqpg4ObnhOvQZt2RASEJ/8usxnR4R9W1dK3GEDs73lUvQ78EhTQvLfucouuPwh
	8bfGNng3+wODioJnHBqMTB7KYO928C04qeUYCoeeypx2IJICAdszGzHsyiQqxwQDjfiu5XyBAxf
	Q==
X-Received: by 2002:a05:6820:7048:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-716e73a98famr324182eaf.13.1793904933325;
        Thu, 05 Nov 2026 10:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:19 -0700
Subject: [PATCH v10 03/26] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-3-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b75984961699..662d96fc2535 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1513,8 +1513,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1537,8 +1535,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1562,8 +1558,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1589,8 +1583,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1612,8 +1604,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1652,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);

-- 
2.53.0

