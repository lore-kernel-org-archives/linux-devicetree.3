Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3738F620
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272322; cv=none; b=f/zsQIJ44VxVNqkBo2izVk/8MGKM7noqd1eRU9wT3kSlJBkafNcB+wPI6FCmxKh2yYyVHkrJlDj/ax4KRywus7ZtaS420VJaD/z6lv7DOpBAxcQEEJPmkzvkSN3ynav/0Kyr6YOO9ikVLO3NOY8BIxHl2jTxbYZzLS3vc9ZKJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272322; c=relaxed/simple;
	bh=ZVisc35YlAHASgRL9Dg/dczoW+VnaymOjG/nj+ZynBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEUTLM5tBhI0GvblC0rcRtCp+EP+REvvADpDYbT1UUUVyARX9PnYjXdTJYsy1wsZX9B83F9iIu+eTva1MQVeT2u6Ew2ezssUpKpbiKq071Mq/h+rkiH0xpdX0zCHayTz0XPU1VshdFCuImml9OppV81YHBNJRcme66KyAA5xJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM2FXVbJ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM2FXVbJ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-495b27007d0so2155710b6e.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272315; x=1789877115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=MM2FXVbJasFx45zvbhckhYsR37nQ008G57Sag+vXx8WNk1TCYS1pUJ5cFJqJ7/LqtJ
         QNbVb22LwNitmLHesFmdpuHYGNEetnA0/GxCOvSSqFaunOokmRLoU4NqRRqrvjDXXi7p
         k50lIuvbwWJ/7pBL5oJvjix91HDMb7KVvvBRbT88KsaZUnHsdbVmNG+c3xGIdsVi6+ND
         gjWwgcHP8eFLxKgCLYlyqOwtfZpkSNK+4oFbtDs5ALZG0i7yLBRx2Tsdpvk5MRynNhwD
         1B/XFdgB5T7CX/VNc1wwAUsr4At6Bly81hYMXdXjMWwDeddGCRyk1KCQEGvCr1EL+CtM
         6UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272315; x=1789877115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvHpZ4p+GIyvL8ZBW88R4SfXXqB8aP1HME4Kv/dMBls=;
        b=o3lwELn3W9mFQFVQGD0MI8CkjwtjnM6NwIPnox2K6vNpx1VxSm5vgW3pX0v0LaM4A9
         KXjTBpHHACWSiZ9s6fGjbU/2wR8bogZyDUp4l89keHsVmyQQ+phy32jkaWPiFOMZYsYd
         rjTr2act3d1us3X5pj3f7vp1PWuMKWi17KAW00qLNbi5jvdmQnaUEpK1XANMzkbxzY/z
         DK0OdsSajSAlu3pCKEwCyaUxuoEJ3Hv+MnUKBjeE7jDNQOSYkeojs76QV33OM+ati4Ss
         51aOOSn5CWIWlpJk8U6KGkjpYEHErsxla08k6F5RXmLKN+eb/XuCoijci5fNo6O4JCwb
         Qnxw==
X-Forwarded-Encrypted: i=1; AKwUvBymVkywlC2kI6q7jARJ0HjJVptUPPlOjvpPOIk+WWZA3DYv+1GioBEQ5K/y+sYrIrH4itp7IpOLuVd8@vger.kernel.org
X-Gm-Message-State: AFuF++m5dSRM/9HpUaJYkZ+s3QFXmb7cSxNPJ09Xz4WdzThJeW19ojyx
	WVzTRqwNBfKKERzMxJ19eRB7svFuU1idYtrAn/uQZIWvjDlgCKCSokg7
X-Gm-Gg: AYBFou0CsqZgOtpezFOscr3PV16TTRjTHw6MUTpfEcEJpK85AV8ep75xaYu9SnBH3p2
	6Wa6Q0z3P4PoNNWhr4XUbVNfgxRS8xvvHdTPcusti4j/Y9ZIa01pB82hHZ7a7RcSLnEv6sbXrjh
	8TliCkpla1RYSjyC6kW+2TWN3A5QT0U1Ly9yLz2J+TstvuR5w+TLhMXRb1cLmVDugb4LTzTNu3G
	zkqE81SNU9rOyd8xUt39vYbzwqYVDyMWXAL2H3bQTxxUz/J3tFS9i4CvjDcfWeVwTm7gnnrQoHZ
	9vSfjzVSKForwKOHKOdFumBLk0HLtFLfcGod3w7uUgN27R0DAWho5AR19xQFvMcT/U3oksvOKaq
	nNW47XlGpIuNhCq3v5t6cCPlmdsfNGl6WM1SKwfuZaMN5fNU452VdgXHtRWAmFKwjXgDThX9xN2
	GKAmUl6R0ouJjKsSeWre9iysJWSbf7APaA0STaGPFiHARbbPK83YyNo6l6ynaHG26BDwd8IITsg
	IRTlpr05U2j6hCZRVi6sk4dxDAlKjFgaEhE/C/DpwA/u58JTdQyRN07gfu3HVdmFJeLV1L9B6tb
	rcNAoZcS3UFQcPOohSqMFIji+Cw2JBECYNPDrrREAUmSOhWXiqGDULD9YutYdqYO9vu0b2V8FEv
	gOoHn99N0QWwx1j9B9zKJpJd6ohHdHQ==
X-Received: by 2002:a05:6808:d4c:b0:4b9:e5fa:8907 with SMTP id 5614622812f47-4c31b4c5e8amr7737916b6e.26.1789272314888;
        Sat, 12 Sep 2026 21:05:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:56 -0600
Subject: [PATCH v4 05/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-5-4a64bed94229@gmail.com>
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

