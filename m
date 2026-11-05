Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904957;
	b=Bl1qnlrIqvz6P0tEl+Qfn6zOgwR9LLJC7r/Vy+5EUnnFlbkgC0DOQxG0EyqDhxLxlln1
	 VFAV2OiNOx/+nBZ2aRPxvzRb4gCd1WWXsVV8NMfhTYfbHfkVUMfSqhCJPzFaoPGZa364H
	 r/aDygzIQ1eVRmqJURtTM2bCjAVTFjgyiRtpt7YOwUtr8aE6VQATnyiLoilF1B6Kycoks
	 gPMiPhavEeItIqzsvI3Eiiva2lrxA6cnR5QtjTmMFzA/aR0W2IfMzgG/x+XfL9Ka7LguM
	 w5VwpvM5B8K+tvc5YusiJ2AADXw9YwWHSzCkIb+hr0a+7WTgwK7tT69RiOyiQN8EXVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
	b=dsXVqprf6O/jO1xIc8JpSJioFHKaBDmGgStCwjJx6ake25M8ghjwiB6n8pWAclYr8X7z
	 HFGMw2+9Xg6x/ZfBo/LEDYXKs3rOHABidnpdtl4zw6ybrAkYvr04gsuP0XV9IBhIl211r
	 vMAPSdKzODYomoZTY2bqn2SO40h2a3TRJJHmil9p/GIqsQR+9FtjtzCiVuukQUE1WX8C9
	 lWhbmkt0mIC1Q5UWuUpmvYUNemgeprilL62YcfaHGyuoyeXx95TXSpwCY0mbJSPcWrfrE
	 48PIK7TaFHz+8QU2yB7PWRubT4dk0JulPhx5liKYhqLEfha+GJOhQMhLR+jeDjb6cUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrjVBdin;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37402606EE95
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37402606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrjVBdin
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716c0217635so977736eaf.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904956; x=1794509756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=OrjVBdin07U0hmKvCMZ9PMclAx9H4+yb9/A04IwZlo6oZFG5NB6iWco4v6CHg/IClY
         pIaoXTlQypSazq/H1ULpg60jyWy+B7KRZxz1QbtIHyaen7/OL/0T/r1S95pK6Y82E18N
         yL7kOJN4qP8JZp2qbHBNRM45dxXROLyqKRUJTTROMXNH8Bnb5pPW5IwnpVQmZz/77bQQ
         WKsQJ2njmA09y41Ri/qD/jjzZ3FJPfnLKnbvffsAd8d3Sdt5B8LG3PknEfGep/7HKDGH
         vp/plFStZGbyIgWPdBsakRnDF2Gj75N0yHUcdMst/7zmvTo12G5aUBrwA76Mw54noigq
         VmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904956; x=1794509756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=IomRNkNGxOW4sG7fhEDgesd8SfCTRuBkFx6mizQPE7PMl9aX6QXg9ov60PhHIS1RXl
         q/RWMgBDu6a5e+w9VhBaMVrCd3oJHZg+WgMIaVqX2FU3fN/qubjHfNPQ+LXykANLfOgL
         zxvT17x97+eMSLei7A4fNgGGQ7unHNia9RWeJjh+N6HY9XmI0VHfhNzMRMyCU1bs7d80
         BkyIv5xR92/QXjWBECuCfyUpqE4qwxLXEf5U2lV7ztPMy+rhOi2YxPMrKWt8KRAXKEBW
         /TJA+bKbE8i1x81LLV3T2ElGDpYAFJNkVIJI3MDDWJteVfsmpBi4LliAkHor6aOHnJZ/
         6enA==
X-Forwarded-Encrypted: i=1; AKwUvBx+Gl5bAAgH+sg7ms1wcjqNEgOPqT/7JcmlWGWVWQHcmqmr9onWE8alL5+tXxsHmntar9Q3lu7MVr/L@vger.kernel.org
X-Gm-Message-State: APuU4Z+S6MoIQqMifG/jHLqvL4JD1hF0GjarUZUdJxFObmTw1wPc1i+K
	N1b8ZIsibKgCdC8sjc6Rj8OJIFxRlWyzslMKJJQH3MNTy5AW2/GSCWp7
X-Gm-Gg: AYBFou2hL5lj2ioijLA9JpFqs2YvsQgwlPDbR6Hv03U8VbdeQeqxKHe3GY+QFhMCpf2
	WBE5XDeL7bvZdWP2bYoC0c61ok3CwmIT6NX875zpLT1MySjrSqUJU/o4kIznwtC5G0vH4z+Colt
	hxUkoy0H6c8Ux/IlPXS305YOjTmHovSGaglPnWK5yqV2MpfEMjDw5KIVnsjDqqEecP7XePHZ9sl
	h1EUTNe20dZGLIbb0+DXtT9/GAPGZMNxQy1Xt/+mLNZB8Xt1zltmMir9C5xtITC+Fs97wodhF9T
	onX6+E/rNKCJXCjw+34bgOj5WNjZf/3h76UT4ai1fu/qC9ffZyKCDcGvHWYtHqfTpEVdnHjt9Np
	pcDRJoOp3hy71QaXicN2RmGPMbZ9ZhFOo1qHfqBcYwZ91EY3lmj1NrI7QasJlg2TJdHbQ9FsQfH
	rtJ5r195IxMr2GLFEH+90PxKxlBEyFLym93OZE0ZevNjKLw5l78eEF/HK3CQRgnhKQ8jy975mL3
	m/MzV55tRIMYhXpOtmigOv3Sx+YorpNcj71vk2TdWJ6LsF19byvTQ4zxmEHq0OikXJcbDJovGtd
	KECo3civLicqgrTo0O78602d56UjF29XQrSlSigjCYOpMTuot7MuuEPBcFGgPFO2yhyR8zAwKId
	/KsSksBy5tBeZAIKuGOLDlw58tluSvfVZOMbIipIiHz3Zky81ZYzMKChMHiNuqixoERcypH3+wq
	UHjXImceCCU8MIS1cmL+SoCWlGE2eqEsvUL5NhJSXpjHlNgHYsZBpcGg==
X-Received: by 2002:a05:6820:a03:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-716e79e8336mr261121eaf.42.1793904956099;
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:31 -0700
Subject: [PATCH v10 15/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-15-dca1f6ed29a8@gmail.com>
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

nand_subop_get_num_addr_cyc() returns the number of cycles in the current
suboperation, not the end offset in the original address instruction.
Comparing that count with the start offset plus the loop index drops
cycles when the parser splits an address instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 54377f1789a3..0b92bbe19c0a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2518,7 +2518,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

