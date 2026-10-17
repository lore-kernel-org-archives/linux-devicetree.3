Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B149364C
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266390; cv=none; b=CMwdfgCy9UHuhDMk5gEQnXjoniAPj/ebL5Gshpslplg+d5Fu/ksZN6v5ttiCbt1GTYDJMMG2puW9/xGwWQVDQ91LNq5gdp08C0vBcc1tLm+Xa8if6gVUkzkrvjtf8+ZG+CecLnnWR5q1tUVH8+Yx8KE5/29FuC+UYiH6Gb9jcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266390; c=relaxed/simple;
	bh=dbYKQMzyNYaKHf5LoY3DE8dfg/ieSUwcZADEtitOIW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVN+jJnZf1PNDN2CqZGb7ab/HTfqa/xvszynhkg3oH+jl/YhdrNvxBZ+12SqD9KRshH+c9YjJzPq1awDjNNvSZxT23bmVnx+lL0fYLMJsPyu82vU/B+tzP5rsv69nekhXQdpTJE15P0e4MvgJ8r5x/HbWRTfeVqTdCjMl+FO1ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPj/qA73; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPj/qA73"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso123123a34.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266384; x=1792871184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=HPj/qA73T+1uSp6oI8lX1ISlM66YZOlJrPwggR9OljbQ3U/Vrj5a1CS+bbyPc35MMh
         AcrG+j5Av6wpUcRF+wR7k3ZsA9whqR/6IOhcoW/gkUNHfFpHfDuP9dnLlHCiwQqZqkWl
         oNPxpoXaLakU0swWjqzeITeQ8qJBu2kwDrKgNxPQPOwgveSXQI4leOwtPKBnlOSVTSVI
         hrqe6daLfTnLTBdy4LuvbIziYgNyxHqhce8eCv+zBl0HXgFXT/EbP228alJRMYsCsMxR
         8IvW4FKUnPRNTgDL3hoGOfCnxgL6gEYdY7C4z/KYjgCLt7uxfeiCibpagfPmTw8C/rtY
         NFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266384; x=1792871184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=rD8xscT3hRWinHA3QBO2XziAWtQ4ns6o6cpUsUNmIc02haPUo42Q2gmjzWuVPGHkmX
         Lgumy8IeQBJNEdtVF7ni4Zi/mBXTE55EVsDR/S8+5iqTqWdPBI/1CgTGeSKUhyuXANAW
         hFcTQYxoJALKYgPEztP4meVPm09yhKgsjSsPFR0HWB+6iJPAodhnX5+DtSeVuzxrmeM5
         Uio+mBEUe41iMWpc7rll/33QNEE0iUpyEItEuo0CELhYkNNIANZeis4oUyGiQwd8Xzba
         RBJiyILxbo6bnm9JLrzveJi5QwDE71+7igyNXVBIgmzSGXeu8LHaQ2Skcf/z5HB/zhl6
         Av+w==
X-Forwarded-Encrypted: i=1; AKwUvBylT7JsTSMcliWkgNnLa/PS3mqXS4t4bDwYRe6yz4xC2D8pjZ3XWYegy6Vpurs3xDptTebV1BmuGwwa@vger.kernel.org
X-Gm-Message-State: AFq9FYIWWwMrjuOATicI0vzjojLqCSpdiKeyryhL98XD0RbqWlp7BhWj
	25gqxGKs83cPoi+iqjOfYhhzzhxD3wWsQt3mQOMNXslKqUQUZbsSQUvI
X-Gm-Gg: AYBFou3e9kBGhyMe4BVF1jhqETDm2yoLa/IXGzHGQOFldR4bAX1wLm2lGOXJTI+4bQF
	/XJaOM6TW/FFv/T7r4RQnh3Sjt/nOZdHcEnsjTibzZ8HNBivCDZ7M6tF0/chMwfglh18sLFXZoz
	9n+N7cirUVwaDP2qbdSV/Df1tFNWObwETKHKsnB5AKAnCbM/xlNbDZYvLUwMsXvvE4OXKUVAlBK
	V2Nw9AvnUpwzmACc/3YAwBXUJIp8tgauTcGUw3rM3/qrfRrKljtXkP6p73AwBcUjqcQxbsE2cmy
	VBGZmNhCNbeDcTaamcBv/w7y6jACILJPJagi6qkAuCgh7InvO77TO7UlakiSCphOISKilCAnlRE
	JmTMXnbuwEXgGbR0+jGYZ2yfB44PQ+4EoqT6tSmQuLUF/fbmoCCERv+OsYJ5ZkBNo3O5V6F3N5s
	bY76yP/BjQNzTHZtj1/X/BBUxxZW3AT4RA2cs3vHYDml5ulbIrbMEXkz7e+7TN6hL4dOoy6PDBN
	TeYUBGBpbHMiNko2i3mF3u6k8u9JIR3dp8KA41azxACJHg9Mq3bYtOP/jKn0YO2SMg66ecMGBne
	DY1kDPfJINYbYhPwsgat3MCvejomIhE7hRd/mm5eegfZ013UQuBHL9BMZVCx78A02wmM9Dzua1i
	idyVzfe/zQuReNJB/IfpTDo72nxRa9b0=
X-Received: by 2002:a05:6808:ec2:b0:503:aaf8:ef12 with SMTP id 5614622812f47-53ccfbb22ecmr2554952b6e.34.1792266383632;
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:02 -0600
Subject: [PATCH v9 07/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-7-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1db6ee18594a..22cc8998d49c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,7 +1120,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

