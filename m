Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445622;
	b=mZZQ2kG/5xrTUY9RfJALM/EBlzWdxIEtZlDA/SndQhXn11MatOdWLtwOq+kJAgJrHBot
	 +0Mk32n2xUcre3JUDChSqLQwAoEKbQxeZC2haUhl70/dfifCbynjtdzlknz0h63NO2e+C
	 qT5SXLhxHjzlXt2WvfdGo4kIQbOTks4yBikCyaxABpjzS+Q/sw4iux6sn31FZ/WtEoq3T
	 yUqAsMj21KHlUSXtGMDtcrYhjriqzQj5VvmZEpRfAqXAmdvDXkQ47ey3hitc9GVnNJ6ac
	 JNmBc00Xehlp4O9P7RG7Um0X+/3e6iWP8oOqLYpYH6BQV+EtwSKhTOzu5MgVvDM3+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
	b=t3b5g94BIcOweoDzkxKNUyMr6Us3takSd+lRIECWZg0Vy6/kp06j2zGSiSPgAZvU/gm2
	 Bl5cjTSOzqSZWszGjzC2CZgH+IwqLnEHxDmDn9faBQPsWbQV3YHkCT48pJcZLW9xUh4RT
	 iI9GscUT7lDjljTUYnz0nx2pyLZy9a2DbAZcYBn1YRiHEChkR/tPPrN56F2sIoKofkXtl
	 jL2mdGVXRGnNaB4yrTmQ57Vez123Qw4duL9Lu327jZHbxMkcyComIoijKYIdh62OXiZUd
	 Y6BQif2xY4PkD2p6VAqR1po0p7wgsNiY56xp/5MrfFcMC4AphahnM1LsIW/q5U5n0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72871606A33A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72871606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so14933015e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445620; x=1796050420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=I7xfCsQWNGM6/3t3IFhuPig70szmaXPdWqHR4ICLd5EYf27TdS6LYX/3vN9VvL4QJq
         QqTt1vGn6XcO09FmNlVlM2JCkUMdRmbbccEZWIv3QW4PiQGOOfvsBC4Huh69PxiFsupZ
         iZvTlMvf53aouuFalLnWFe/2YWUwgPceGlafMd40ug/87CsMK3ysW12IfI5f44asr9iJ
         hqxhK/ff/NNMlFEJeuoN9quCJHovzK0Z4WISwy2gAHdxvXzPHFnZFdqz3/V7QbKFu/k+
         Tf4rGrfYp39AS7LxGmcc10xDf7/4WKW8h4xzNtxR1VD6M+konYD4HrgUbmpRBmnjyHTB
         4Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445620; x=1796050420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=fJPAFJOqgltKIB4ERnWU/aKx3BJlec+sH4Ak1dP/18C5XbIzmekPDSeEj3HEnnEbyp
         yBUz0DvTfFDOduac5ZylB6yD5vDVIcXoBi4BbgdeHO41UQlSMPTOnQifj+axrENuKmwf
         ffrJnVJ4iy0s5YAQndQNug+/IIedhggndmb5q7ikY8+ij8O9aSTxW2huktBomalKOFk8
         guj5CI4BeDej3SGMPFZ8hFhtpdWgrZv4cWhnvMFG65jAapjBgn5AYlylGQAG6vMA3wMm
         DfVly5Vf3HTfKQhj1hDmfwuepkVEGkgfbCXpVy1BoheNNQJ+rN2/Y2oiqAZKlambAD3Y
         y0Yg==
X-Forwarded-Encrypted: i=1; AL+hErHP+H1EeKDSAY4RD/w46HRY70C+K44eGKfOryiQ3/YrZ6R+8vN4NpB7rses/0KBCH9PQA/YLMSXOU2D@vger.kernel.org
X-Gm-Message-State: APuU4Z/esyvP2ne0OoczKd9U1J2nGejogjt4VHkwZ96sM0+r4IvgbJ3Q
	DY5WNByv7SNcv3BP1IdeOzb6wX4bQoIjrEHHKplhJ11LTiDIOFZqqn+ynWJVJ55Hg1E=
X-Gm-Gg: AZFdTZd+Bh9/4I1tLdPDnv/L/xQWalZ9C0XwDwpUH3cJl8446YZ+Jhr/Z0fG+aDXFA8
	MdKfgAhdBpD5C9c2hIsXw+hzZEUb6j2J1BclwqznLFgeaU3iCmqmir0cGEypcepg1ZE/PGqxRn+
	9W5/z58Cub/q+pYfUGxx2l4x8Cz6iFOvqCvERDjTQ9myELuNkl0ZZi7oNWJvtp5oMEQU27d8L8+
	3EjpMjx5j44Z5tH2BQqWRig1+C/CipoUb9BDMzMFgjZQ0bW3JRE9HSgv8sHD7rR+kTVN8QEMREw
	7cSrUnExItJafK1mxu5Ig1u0/HfJTe9a2UCUwAEe2Tu/VBrzAwyJYc6gMpUnJZRruGwTgQ53v7Q
	tJs8nJqwVfnZNCy2sReXOLHjp0eCpkwrfa3Qjk/lEAE/xOmfFFudM1PqgHJOcN13Y4jz3AKtCuH
	wZnocyvMAsLhGt4h2UzXFPalVtKbdNV4YxaySXsa/fbYyxJHRbnSz3ocZ9O0Udij4ipnKbyuFDF
	YSt9Bj6UaozQqMXxm5Wh1jNKCwNRm2xLJq3oVJdlPDzMaJ5cueRGwDVdL5QrFrBgwEMO0LxzUBa
	clOM7dJSou1GZ0+klwrG1nGENg8=
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr233321345e9.25.1795445619780;
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663224295e9.4.2026.11.23.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
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
Subject: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Date: Mon, 23 Nov 2026 15:56:43 +0100
Message-ID: <20261123145728.29082-6-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

There is a problem with the current abort scheme
when dma is blocked on a DREQ which prevents halting.

This is triggered by SPI driver which aborts dma
in this state and so leads to a halt timeout.

We attempt to abort the channel, which will work
if there is no blocked DREQ.

It it times out, we can assume there is no AXI
transfer in progress and reset anyway.

The length of the timeout is observed at ~20us.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 063e1b2aabe3..51e3a40dbaec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long timeout = 10000;
+	long timeout = 100;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	if (!readl(chan_base + BCM2835_DMA_ADDR))
 		return;
 
-	/* Write 0 to the active bit - Pause the DMA */
-	writel(0, chan_base + BCM2835_DMA_CS);
+	/* We need to clear the next DMA block pending */
+	writel(0, chan_base + BCM2835_DMA_NEXTCB);
+
+	/* Abort the DMA, which needs to be enabled to complete */
+	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
 
-	/* Wait for any current AXI transfer to complete */
-	while ((readl(chan_base + BCM2835_DMA_CS) &
-		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
+	/* wait for DMA to be aborted */
+	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
 		cpu_relax();
 
-	/* Peripheral might be stuck and fail to signal AXI write responses */
-	if (!timeout)
+	/* Write 0 to the active bit - Pause the DMA */
+	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
+
+	/*
+	 * Peripheral might be stuck and fail to complete
+	 * This is expected when dreqs are enabled but not asserted
+	 * so only report error in non dreq case
+	 */
+	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
+	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
 		dev_err(c->vc.chan.device->dev,
-			"failed to complete outstanding writes\n");
+			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
+			readl(chan_base + BCM2835_DMA_CS));
 
+	/* Set CS back to default state and reset the DMA */
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-- 
2.51.0

