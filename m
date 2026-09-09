Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158435592F1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957308; cv=none; b=oUc2LT0Ihu1n7bHBb0RzxjbPpABA7TXh1Z+1L+qtZ9QeKSQ2b3di8waRNvqVLxElfchF84aFloTR2ao5yhzcFLGoZXRAa+g2xGA3kknHEkF6afGsHSlcG3Qhd+8auV8sLGA9izNV+u4FlSddW0zyPkEwmhPRlPDclCwngYM0osY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957308; c=relaxed/simple;
	bh=yVtL9D1/Wj7jW4CgDSaIkKq7ZVcdtGzj+1oinlRj6+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGrpym2TOuOoNqiaI9acxprTO0tpdiPIOmTTu0/wRzQ71NY4Sif3VVht4anJh5/5ZSQQvJsPRjDnJ9wFRtu/XxEnWDW2jN+N8VVRw3mE1s8YFfe2CK6f0M6FLk5EMmJeX3zH4nvGoip04fOnFIWsLh/lfSHfhTNCAg71AOzq7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB1dnvD5; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB1dnvD5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so121380b3a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957306; x=1789562106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyKDUP1nZZUAqox8fiTqoJmWbZILKCs3z/CNmlWToyk=;
        b=dB1dnvD5jMKuiemDBdn6176fPKheqDZ5zI+/5L8mGdYqWteE+NjyIvM7H1foSQWZzX
         zfDnhFO/PJbDBXOtfL0zYRcC8sfri228P3kBkVKDbfjZIqpXZDBl5fOIdrsxfMF5OytN
         O16B9PtBTuqLB+rB0bFoSWFyGUGU/YJZbTbd54DfJ8aMkFaanpzOKT6QuadOfgTVZkYn
         GikTcS8JoO6+CEFlhj8+IafR93ngwSYH3MsvwyMpy7JuglgRw1a9oXu10CSanK2Q5cGL
         /iyzBP67EOdaeFr4Kf5vLT1AgyvLxmrgNlolELv5ohUble//ELGQs68EoQEGLr1iCPAw
         I8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957306; x=1789562106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyKDUP1nZZUAqox8fiTqoJmWbZILKCs3z/CNmlWToyk=;
        b=HdlMN6croFS+5O3zv2ad/euq/RxPk+gXAEdJrRsiXS3p36Fz2GMkQL5qDf4lt4Slzw
         9y6oym++3u55TJ1bQJWxyNPey1Zoj7HoILhLQNJYlDlvkFeost7WfkSQ4Uh+So6Iv6EJ
         XmZ1lHA2haDdYWPoZajSbpPgaFu3cAsxuRKlTRRhvdy3KiL8Oyoi6RBApPm9W6R+AHap
         tBY6LGuczxE+MTZE/0g9Jk98XDxtml9WsNv2iWTQWKTy/R+eMe5LTmp7eQaQqJ28DIL+
         pi7YTJIlgZ+TkY7AmXje9AmXjA0Sk4+jnNOhhs8K6AoK2MFNoEuyaHJKr7401j7CwSPb
         UNOw==
X-Gm-Message-State: AFuF++lcBWHjZZrcw1mM29LQi+ZPYqZobF2xc9C0nwGsJW724BgKgRMK
	IpjMw2N3wPSvxOuZ9Qtow53TYn2UpyclyG1gdfM/WvAtj9R3ic8fj+EE2lAk/gEB
X-Gm-Gg: AYBFou3/D5k2iyGROGoQuGcXOkzQbcMteEtbvqi1j4+jpoPYN7zxbR1ppffp3x+HAYr
	FGlPkGWSiqA9/Z/+QQpKMQQhhYxH2bMBhCGiXEeCWQYCmxH6w3U0wRpTJ1MFbDC46/oszvAqRCm
	X8FAwFxOhxOiXq3rhzGqjA0Pa72tH/SQcHdU5CqwXhVKCLVzXObr4u9i1coNmU/ry56pkJfe5pA
	CR5UCZ6DNaBJaueGSA9UMwDae+GzvhZ8M3UUmibXh12PMkQ5eC6S9wDSOpnh9R5F76Q42c+aCse
	y39SpGXALGSCvas7s7MjDT2q6W1F4pHGsOf3qr2+rsi/WjI9kS11bBrj/Rtt/s4xG3Soz6BomRi
	vfHOY2iRKo6wljCBplrL3LXolGOhAMrj6l/tXWS/+9zbPsnrTBZBkx68jVlOlwx4VOW1nFlicmS
	5Og0UI1BUkhFt1CrX7Rb7k28jqQq5GgmwBSxFK7wlW9bjlWRR8CcXfxFnXZwOXAidfl5Cz4FpHB
	8EOWDEzWDptHMB4iEbTRdZ5Fg==
X-Received: by 2002:a05:6300:6702:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dacbdba23dmr1334869637.12.1788957306260;
        Wed, 09 Sep 2026 05:35:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69514341c88.4.2026.09.09.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:35:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: fdt: fix "Cound" typo in fdt_translate_address()
Date: Wed,  9 Sep 2026 18:05:01 +0530
Message-ID: <20260909123501.215711-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above the count_cells() call reads "Cound address cells"
where it should read "Count address cells", which is what the call below
it does.

Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/of/fdt_address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt_address.c b/drivers/of/fdt_address.c
index f358d2c80754..2e4e46a58cb6 100644
--- a/drivers/of/fdt_address.c
+++ b/drivers/of/fdt_address.c
@@ -172,7 +172,7 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 		goto bail;
 	bus = &of_busses[0];
 
-	/* Cound address cells & copy address locally */
+	/* Count address cells & copy address locally */
 	bus->count_cells(blob, parent, &na, &ns);
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_err("Bad cell count for %s\n",
-- 
2.48.1

