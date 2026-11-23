Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445617;
	b=xoxFvFFLgHZzQ1G9bOvTKT/iFTxYgUP1UfbW8bxkpnsL+Ep0wKJiwWBwNMcC41cOL+dA
	 ibjj6kt8Nb3nOA3Wh4mQxWKgcqxWctB6vPutDnKAlVjvRLxUPB3YAGU2syyCJWkRTBBiX
	 1uc/HU6j2Iob47TWJAF3U3cequcm+3qkB6vY9sLzC0id8nX/fR0w7QF30oP6DIZ3BdS2j
	 rM5FxF97O8JROphc/RYTz83kGglt+TqJHsjO0Sbq8hFaw2bz2Kc3S5Ijvljpg8IyyU8o+
	 uEFbZNvIEMCLasljkaMpDfch9hjvmdtI2vBwDzNXHdQgKeZKDp5pVMI5WT8Rxef3Gag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
	b=SstdVV1MVdO5oOphuR58YpEs3B1B0igH1UhAQ9wZ8N68DaDTJDxGNP58zXGdJCAT6Nc2
	 UdGdix79+yTjNRNrlxYx5d8AANNE/zs88J2NURnYBbWwYm82XWAihl5wl8gWYRSQoqkfu
	 JTaRLnl9WLH/RRTlscM4P3Kos1nsim+sQWtA1EnGxYQ2QYkfKFu8zrNWX7AqRwYJECpnd
	 fryEZ7+HpGtOlDGKkHaIUoDSi4dRap/NFdF+AFNhyErzjg3oKrTlxQTlbF9+NeQGm3eih
	 EruApQMb+eOgVUViulbnaK7Itma6Mvb2NKr/fpNfWNEWXjiTRvL635vi71LWMoQ/o4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B6E606A688
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B6E606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1879080f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445615; x=1796050415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=XkVqsZdMeHpiJh4TE4FyZ4rGJAMbAslvY9zSoJ6LUQLDl/U/PQ9u1OeVW3wbxvhHKx
         kX/pztzhUIpaTZ+2DQLK6ZoUnETw3r2gArj5GEP/QBZ+Anj4sjUrLXFNPsf4lshi+/Xe
         AMwL117lSaIfAQwEP8+nmdBnxrkv28a814bMLCFljC6G2qHN/oANg3FumU8aezzJoAvT
         HBW4cMrT6WaUj4FmZNuK2yJjT8JrWlCFFL4Uyohrbj8LUtsO1qbX1YefGEzIuSY3L93f
         b4EP4GNfVWsHiOj7XLdIclXS6HI6RKjgVRYnNtTJ8p9Hb9R4MMYDf0ZlieL4vbdj7rr1
         vcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445615; x=1796050415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=nm0SN4AhbLOItItB8J4mo6jOSRWMBzveLx9NQ0djD4OKYKirBZ1Ae0kfBpTGisgC6n
         s/KlGlEjth6VwUusevKGhTsOlw8ZyahvnYCTP82ycCo8Z6jEEp/AuvVwVGr1+t3HBEhB
         cBXexMUeEMnTzGaQMbBlJrsXwgdbrp/utYFEEEmtw9kpCR/OGaPE92eeyRjcKZDrK7VQ
         K2dHr6DZ+Wo9YbEgdKruoQvyxr5vXaE+Ukk85VPJ0xhVJ0cmYplER8yJvAH5szLD9oUi
         m6f63SsNed1H8r3Ma2cNNQNHVTbz7EFeTWw/V4J+xmpp6KByTMmMBkOQEO+LbbdiTbMy
         VJDw==
X-Forwarded-Encrypted: i=1; AL+hErHaiuj5j0CUquJhWcRFpkY/L07W+j7r2MKBxO+qamRrOc27jIaIRF6db0geYiK1ouMC3RCE/W4s3Uw5@vger.kernel.org
X-Gm-Message-State: APuU4Z84qWG+4o4A8VV5pFprFGFDgWPkLo82fO0KoOs/caAbN6wjc9D0
	1lfD1IYVdyxwuGy2jenYTRS6Ly83xXYbRMglAjrguFPIGjIXmG2h9KlsEhS49bjJHXo=
X-Gm-Gg: AZFdTZfjA+hFcsZiEe718la9IAv7oFWrPeLBdZc/KrGZMRoCL3QlXQPOJXIeqqM+iYX
	JbfylSLXmOi6yP1iG4PrOvml6nenRz7tQD29q/BdzAbPESz2rzVo8fkQEg8zESFkHJILH1bcofX
	D+wypB/Dgzb+Ld5Easy7cfAi0xtKpjRFTIYMObbQ78d4jm4zAKNGCcp6iyYe24/1XeE+l0d6Aq+
	iHKwF8KxF+0rx3loiUB9LOjZKpv8+9Qrou26Yjohwn/5xnxDSprnVbM6VIcQeHD8Og+Tog4EXM9
	z6TZY9IkEqzcmvYOJNjAmhqFp1BIIttZMJyuTn2utSI1Vm3jmUcJ69vHIi199zJKpyY0nqZ9QIh
	oEnpmn/wk0xEn+vhzyMidAhGlqz4iSE2RlGUQfuxNq01IPZZZ+4d62M8psI+sJLMMwoEl2eMCzu
	/9fC2X+cz7xxpz5vabfRTd/X3+vRka0PseR1sEqotM2XE54u/WtBaEbDpsn58YqwJdjL5+Kk4vO
	IJSNEMMBPH3MVTjKX+/NGX/ux06ZaIvS8vbrNQ7bXWrTgPmmfZj9eNgOzt/oG2TmK23O4AjjjPr
	71xNGRpPwP+LOpMNRND5beAD51g=
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr24213933f8f.14.1795445615277;
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23180331f8f.54.2026.11.23.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
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
Subject: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Mon, 23 Nov 2026 15:56:40 +0100
Message-ID: <20261123145728.29082-3-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register. The motivation for this
change is the ability to set the DISDEBUG flag for SD card transfers
to avoid corruption when using the VPU debugger.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index b19182c6e3df..690f5ba1c439 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,10 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
+				      BCM2835_DMA_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_DIS_DEBUG))
 #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
@@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
-- 
2.51.0

