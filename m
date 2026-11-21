Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223486;
	b=nLK7nEydmzhYSnSmEilQoxRLxLN5nCQ26otG2ch658bc8x6yZY4xcZ7YaYQay/r1+Ww7
	 ELcIwYoVBkII3gYk0BDFK11n8ryjj9CGoXI9Z3C3B1b5fzlB5q64dxJ/+uNBmP/KB4qEh
	 Wiyc0wR+mo/5t0tOxaDE8J1LHsqr1lee2HuzBR50r0kFAVtHfIHF5QRI9wLNI4tDzfVrP
	 inrtk6R2wa7ry6lm1Fn2vRHkEWxngRAlkPdkJ00uwAue1+czkwgFxgJ1nES2+QG27rF2t
	 BKjLVSqIDODzWgyWWIj6qc+8TX+zREYs1xi1lhE2U6kE33S0hDiBp45+/Ujprxe8Ofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
	b=WkonaJVA5u9T3MUJA7UXyPwLsrkEYKoKHfJNVaWi8ChC1+0Lf9sBR8iBKryQLW+TUE4I
	 kHFETVwkpCiRWqH8ynnXipPYylKMG0o/np8o/05hAEM/+PINhM/LF6RNgpHqXpVU0jzyb
	 KgWO9fRj22nvPJ/Uil3dhnTeqN0JZQUwL4Ecun0OXWwMacqR2GLEGM8PyCnp1fiYO1hZw
	 tD5ikuWpmSEeAw6iTK7sXBs1s+/8xhtesy44/zwOD8vTo4vvSfA3B0OAZMmgvrRnp+flv
	 AMu08Oz89rP96iYhD6wjUA2scoV0rHn6AagTKzdR5+0LVHjlf2B3OuZxK5X7U+vuDZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbEpg+3g;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496F60A6F5B
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6496F60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbEpg+3g
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53dda625f63so913207b6e.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223481; x=1795828281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=vbEpg+3g4jekdTHkPmtrwhQLE/eyJNgkmQOR6nfJD59QnllJNelKloF+7dumVGj+SS
         A/C/55NWWzD0XPSlHaRHb8BqTB1Ap3SJHcTNyOimn0WymYFd73Q3vukeXtX/Z13ebpYh
         U2UQWGNKLKIlN/ZHPtZEyvtJDZQgbfwePkDQRk0wMTl0i920kspNKG50EQdJYctqO54F
         lzFYKCFW0pcoffYZpQ9o+ZZ7JY58io55iLLYhLFZUSeh2WwE2eyInyGDfTvDzHbCzgHT
         /WENzKHLV7DUG696NACwUQ2I4Yr+895RgQtmUNXDYflyznKUAca1ITmHLtTZMyEJbNSG
         KxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223481; x=1795828281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=gGwFk1q4lZDV0bzJ4JsRefqOY7ZOvVzB3CBeZ2Czbycu8kK5ncbvFG4USGInh0J00s
         AxvG5EZiwT8yurhxqCSquGDDhpaFe2W4GjRkCzRZeUfaJb1n7Nf0o9DZ/AlmD7JmmWUn
         vuXFmWyjxXKAbk/EvXl8PWh0dJ+1aE9YZjEwU/5PbfTqPP9GuqIT2KQusTm1aBj9qD5F
         ijVAN/akYfGXdUgJyRCXh9ICVSbB/3UugMblolnAz4Mi6NmNUMZhqKs7e5EAgDv8Tt9Q
         TsOP6uuiup1hWavGiyoRdzK44BFpSfWp/fP3NzPmtJldzwW5KkDSa4Nsm5YEEssVpUoO
         r83Q==
X-Forwarded-Encrypted: i=1; AL+hErH0mL4ZUxeN0L+iO4LKGYw5ePaFh4gHPysF/iFNffbduuD2btKH7cSkS1s80SD1NmLOt9hFkGo9YdLY@vger.kernel.org
X-Gm-Message-State: APuU4Z+eXvn5lwKS9O8QhX0vY3WQttIXHMHTFvm1LptJkIiFgnL9f5ln
	9vV157HT/X7XMV6QWML+P1YuBxkZM2rnGu+M8TXlpEDSd5yEvn9BgUmn
X-Gm-Gg: AYBFou2IZF/pWun4JcvoYT6eJ3l/y6oya3qKWhgw8fW06+j+eXSAAyhmr5wFF8D5RfK
	bCWV6+l6MCO/kWuC2tndq+fXsQOmrECjruVvVJUazXw5aZn65amvmczpjoh77m1fKR2pYq3gu1w
	nvaf3iI/iohd5LkiQZ5Er3q08Zi6yctruEC/iyiT7RLNUSK6xzpoJJ+rLfn+84NgXKNzCtVs9fh
	voyTSFRH0Q5AI5ul06w8XT5/qdywD1apMb9y5BuYtxV9uq+U88WtmpFVmOSNE2ZloecwKPE4w0O
	R2k9u09tQcKOSo2BLFLOq6lpudPm52VEO/SIjh+xOVfCnu5rAO1OZ6TeQNgQ/RJe/+wz5CY2f4l
	for1uoExNK4c/fglIRhA+eiN9JCTIZyh5gWynIg+7WwQ5+471SN0xJm/w8hMWhuKEUmdcQC1oAP
	pAOOZE7QEPoyONOPGVzuFEPoTbfgl472GNGihc4P4liGB7WFc949OB1gawkhNTd2nQpMkxqkp0+
	AiI9PjngJNp7CstloKfcQWawsK9TMqm48F2ZLf7edIE/tWs3AMztHt/iyqQniB+AB108sh0APhm
	CmNWH30y3wcvBBz56FqTTuicH9qqpzuDwt7l3cAV8nhwRYcgeLeh2Z+s7N/yKiP45w/67h96c7j
	kj8zAo7ViCMx0pluzDAoybjMqRsDridrKNcdW6djKhByAS9T/4u8SW7TtoFL+15FFDVDuKTV0sy
	pqnhc9OxjpiS5KfLzUwY2bufZ00uS9hPHis0k1W9j91UR0GHzwNz2FHTwvD7ahS4/8O3lGtp5ME
	g==
X-Received: by 2002:a05:6808:152b:b0:53c:156b:a16d with SMTP id 5614622812f47-57a0a70b0d0mr5784172b6e.56.1795223481233;
        Fri, 20 Nov 2026 17:11:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:41 -0700
Subject: [PATCH v11 18/26] mtd: rawnand: sunxi: send all address cycles in
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-18-9721b1905ef4@gmail.com>
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

When an address instruction exceeds the controller's eight-cycle limit,
the driver can report success without sending all of the requested
address. The parser splits the instruction; nand_subop_get_num_addr_cyc()
returns a count for the current part, but the driver treats it as an end
offset in the original instruction.

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
index f8bc6e3c3ac9..ee68ef9bba33 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2410,7 +2410,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

