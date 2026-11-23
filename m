Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445629;
	b=x1eYjAXfbFD1pEqEvb7FIf6YNcOnvcmeY/K1fPqE2+B2QTd9VRDfWeSRALlnbUYxBdLN
	 IA8BLyjFYkplGuFWdjAECA2TbZER7FTtx9Gem4Hloiq7AZ8WFIVRowTj46TS3tCFxv8k5
	 2yCgNl8dULyAtJZda7uVlfDGJ4XO3YDMY9pE8wDaJyZcRH32XU0ZAqQWajWQgtjzLjRj0
	 9Ij6XdJHwMTtnV9w3grcPEz1jO2zwyqLmp7lsdKnWwBog9VsSjAFFToxaia+gywKxSXr3
	 DIE13ZNzEynf65jap5eDB8Gkzjx4U9Mkq7VfIQY0SZPWcHTZONwhAtyogptBN4D9KkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
	b=rMqWMM6wxO0c47aEfnL/IKEQgEKz3EzhsNVOeNhWoGo7mjtvNPfdzgiwTH7KvFxPcDC0
	 wd7OAvgj2GxfGzGgIJQUd3coJzTgYV8mskTg11tl30mC7xbJxVm6JfWvwqUBILHQbi3cW
	 mE2ljDC76BEywbXMXcThBkCHyoxTyCfKDww569ptXBpCk7J4G7PuO6UioPoiAhGDIUrmD
	 dFCwLeGXHeC14HgVNpAevxuKpMJSwt0Bi+0+NVTq2USPy98KPRIr3UHX3WCyS7M9xJ/8y
	 c8cHGb7XgBgN9IM+5eKOPv3XSlp9GLvliP4w5d0TLRA182zOIWZOSy0y9qG689xkCdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F560A380A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 677F560A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33117175e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445627; x=1796050427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=euNGAZ4K+o2frNtFCLSaoc+w1MzWYRrC2DJ9LD03fOP+T3gQoBvowcTrX/72ennQDm
         iEBv6VXUYfx2YhE2Sx136lkwo3vVp3HZoVB9p+uerGtN29cyH7apJ+JuzoDOQbYL0e23
         TyCKEHzMIpKR72r+56Wn8b0QqErByHwrqMaQU6qXN7J+3KOL8CHjrdqXy0eFl/o1TRbb
         xKNmJRHDxhR0oZCHhDERJtn/K7DyeNMVI35IvrxROrRhcaGGDnVFkLW57QfqLBjqbmDh
         0J0aznUTlcp33hv51SPkPHpnDd0NeDkfeq3J1VU2ZUU5HWBkB3yknS90YNhsg+31TjbB
         Ly1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445627; x=1796050427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=S3pYQ/6IxKOahsBiJSQb9sMxAC++5jgid8SsqtGlO7zsyEOfI/AQ2Uvd7I1Zb97Ew6
         qTWJMCKtAKsJf4ZMSbenhKJQO9FwD5m1474HvbnI6qBHE+Sju8flLTl5ufpHB31EGHif
         hiTjl+x6F2dXF/b/irdr3o/aQ9OLrGggHMGjCja5ij+TWUrhr9Sm6ixjgQOTiBkgUOe7
         2lvY3JaOB0QZ086zvoErBEVP0tIN/wfMardNqvUwOBZMiO+GxQjok3cHpXqzWdmT8UMd
         nT6S/a9d1HxxCscEsxQJH3fuYRjLf9K0fBxeRDzF49vVhZ/r2gmYRQOhU2GK/DxSb0eU
         rVZQ==
X-Forwarded-Encrypted: i=1; AL+hErFyCW5rQFxIPReXZG+aSq85E5e00F3h2ZYRGeYoa0yqURW/rPDwTUcwBtc9/MUDDeF5ndPEtuhz461l@vger.kernel.org
X-Gm-Message-State: APuU4Z973QsdK7MDvZSpYV47XqzRCTlOvP4CpOm5aLQfNBc2xsoXsU0G
	H35EiqUX1EsSYLbZ181IXkiDq9JqkQuMfBMgw1Dew3K1p5xpBtmsuabMxx1xCziR5Yw=
X-Gm-Gg: AZFdTZekWNyMz5AmR8RrUi4NcLv+g3haRIpiTqROv34dwx+p4DlvPaB015o97YFtzUt
	YwWutmhErM2Nt+hA9L/v9DiO9tJraIAQRihDwyMPGXuUW7g3Z9aqCAVa6GqKC+d9sFM+bR7R0Oj
	LrL2R6TK8UZgBfTDA8zY9DhFubi4UTkaMROvArFNNxCHovyfclC4hMnZLpkImiNbz+gp6UpS6FQ
	mcFa93915tkjW6MhsA3ZCUwhZb4aKoEIMNVlorrSX5zzS7EZTPH8mgfqBng49dFosDvSznsnGI6
	DJYLyTiYPaluYzgzXoh5e3GsWfjQmtZ0LVeFS7fdTt1H5w35zQyeZLmzATfaYr69zPCmmSXvNAX
	M4BdMCBtf/hBG7Vrx1rGwWqDUkFCjBXD+LpyyeMzpss3wV/dk/v/SMRwjEL2CRGjR9jrR8SnNdX
	krgcdVhydHFZJ6MkLAtCGnrTFMLyZLy1pTSdop2//lxzI3fHdeVg2ucBDbKAM3M0+UqKp1UTlcz
	27RkXYgnTU0YV3PCrfBPYOzZKO3j4HBtVfjgKyaWSilokw+gRZ9ntSR620pMhaM3yNnycn9UfiK
	1yJQgqnr85mmIy9I26AP1HRzhSo=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr212865605e9.1.1795445626921;
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663237455e9.4.2026.11.23.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Mon, 23 Nov 2026 15:56:48 +0100
Message-ID: <20261123145728.29082-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 77b3e2f58ac5..6180a2737e07 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction != DMA_DEV_TO_MEM;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0

