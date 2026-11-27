Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781946;
	b=eAcUtOcTCJzj/dcwP8w4SQTMgBiaT8BL0JbNjlFwFrUn9G6rKTHt7mkT5b/vP35+Ttip
	 +TUAsGjYQIVTYNzZQ3dy3gG9wEWBHa4rsNIo7u3rpO6SXIlhQiah3OzHWGeZdEkOF4ikI
	 tq6UqHhghJX2wcJFYgIUtu5LwsX+cIpFAG8U2KOxI7iC8StBOzewNQ0f/jexg6AjnoI03
	 6FwwIJ9xrM2/ZYrGlJuJHuqSwInch2ldchTJ+E07EoRhnSGbc61iQmIX4vcoH9/2Mf16e
	 aIBVkjd9tGnUBz7GTo7EnDO76rpwTysJL/ps+VPgsS9ItTKxeD39U34oSY6woSOOsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
	b=pntaItv3LzZL1Uy6A9dhxglB88E0XmVa3d50dF+SDJUP0c+k5aTrKZ/noD2UmSxBDYPU
	 NcGM1jqZIcQWeHmwnqDOH9oXmB5gH77EMurC2SQXCv4bwYdTMMflbKz7RmD8M6KQ+chr2
	 49Mnz/3GQUwKcup7eETFX4mpnPSb7P5910K+Jd8XpTaNGCI6zPqy0H6l9+8jVtqeODtad
	 r+wrJinGPI185HBKEr1wURUB00slN8eJLhSSVu4ObbzFLpE7rX2ZP6rynxj3yTKAXy0vl
	 0Wu/Yh+3uyiS5kkMwLwAuOLZ+iBv3AZT4lco7iloR8ociqtAt8iBuR24It/O67yV2Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LlfDG8Yy;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154F606A6BA
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D154F606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LlfDG8Yy
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6814190f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781944; x=1796386744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=LlfDG8Yybx7d37cHaAKtJuCuShAmNgy6eWz/R2KOTm7I9hXGIXKi0sotFty3knaimi
         HHrLuLUb5LzIr+Jds4OpxTFmx2Hd+YW1Q8x/F9l6mQrhRKaWy7JNHREl9cMkwfxvdk9R
         sypRCT9yjLx9cVwWn3LrI4/hdXhUbltxjBeEYeVINpc4Cpv7xOiyD8T1JgBbQXxXSdFg
         8vRKdVm+OsVMbrZXM/p9QWru4RkckRMx7uuR7znUSLyZpuyzyO8oJEd+wteYJ2N6mi0Q
         vcQ8jBTpOAMvCizu64UdHAT/AkLBPIulPoWJ4NUlm9BCX2cw5RfbKdXS4I4Wyfp9jOTp
         CHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781944; x=1796386744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=oYonjP/oV+MhWKzRpO4b7rZuDLzVcYitcK9FU2zIGF2uF8OAQFD0luJVa4pWuoBLHc
         OQlwqYlE78/zvrqtdDnCaFsP+n7pZH6wQJp2Kt4QsFYBbS97pR6cfY2YZSgNqWZNsPIF
         HffBRiTR4Evx1uZLXgnTqEY31oyjhunHiiS+zGF2nkhD5gWHbbsFo1U7t5grTGE6q9Kz
         z4hJHA//dzV6CFwrPVZt+MnAXAJ7LOz1b1WEPFSS6dubar7zdbcwkIRiA31Cvx9hohxt
         RafAf0S7l2wki5ZtsPYy2YC/tMufkrOA+VVOZAm3ELODsiy9xc6v+nAzRq9/P77jG5Lz
         ojcQ==
X-Forwarded-Encrypted: i=1; AL+hErGz9uZQBhXJMyihk7sT8ARhTR5zSvMtBVkS2fD+AJld/5vJp7ORS5Q8eq5ttQ3jKDCiIW3NKSfbaBL1@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ifWjoLqly0eWWVWhjlJp89nSsIi7U0Hdit9mps8KOSli2zdg
	9/4uWUnzwB4sy4TvCoH/Djuvq+WNCHvo++UZcMNgraVUKvqySqhO2zGW3GfoVlBMBc4=
X-Gm-Gg: AZFdTZcH5sTPVibE3RHrb0LCb8MKwKunWRrI5nFkPiDC8fwGLWqrH7o24z1ejejKJL6
	GQb+JI7ao9EEvtlXtRHdA5E8ssaYxg2k5l1bAs7ibecWtDo9iRP02Q1oLtZw3xY7XoBgQctb+4w
	BEsyL73rcwuIehuuFtxSXesEFZx1lPIxleGAK7u5zSegXfiRK2sLSa1iw88Dta6ATT6it7NI1H3
	VwMPCihpSCDX7UNV1AR91h1cqgdZV37Gl5ujkd0+Ys9KpYr3co5apPlXOb3Fo0OpPcl7s52Xdm/
	BxoB0VeJOr3dkiH1Sma4EohvBD6JTOXk/tmxfH77uxc0I360J2b7B0Np15T+dFD2dH0cBW/dLYL
	/BTnPdn/9DpGL5PO3F9uftGdDhqRhmz8J7o6Ibk8ioiMhwYwo9ZVJXvLZbDH3vTqaNbyGi+Gq3o
	ZbI+U2cxxTTa9UxEP4urtmbCLrXD29iyROxIbArjQ98C6Y7SWKzBg2NcTVCWNtmSO7XMe4H78iC
	q8XI2SwSxsxR1VF/EBJ2LPvdFOJlqMhGs2PnysaHc07X4YvBNE8F6EH+CDpx9BfXcCuQeCiFAxg
	3oksBDQmaZwlIvwFbUmAxID2em+R3A==
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr524524725e9.7.1795781944276;
        Fri, 27 Nov 2026 04:19:04 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm702530165e9.7.2026.11.27.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:02 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH v4 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Fri, 27 Nov 2026 13:22:06 +0100
Message-ID: <20261127122236.4976-17-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mmc/host/bcm2835.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index efd1903c3ccd..cea7b2b6d2f0 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -38,7 +38,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
@@ -147,7 +146,7 @@ struct bcm2835_host {
 	struct mutex		mutex;
 
 	void __iomem		*ioaddr;
-	u32			phys_addr;
+	phys_addr_t		phys_addr;
 
 	struct clk		*clk;
 	struct platform_device	*pdev;
@@ -1369,7 +1368,7 @@ static int bcm2835_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm2835_host *host;
 	struct mmc_host *mmc;
-	const __be32 *regaddr_p;
+	struct resource *res;
 	int ret;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -1382,23 +1381,14 @@ static int bcm2835_probe(struct platform_device *pdev)
 	host->pdev = pdev;
 	spin_lock_init(&host->lock);
 
-	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	host->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
 	}
 
-	/* Parse OF address directly to get the physical address for
-	 * DMA to our registers.
-	 */
-	regaddr_p = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!regaddr_p) {
-		dev_err(dev, "Can't get phys address\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	host->phys_addr = be32_to_cpup(regaddr_p);
+	/* the DMA engine translates the address into its own view of the bus */
+	host->phys_addr = res->start;
 
 	host->dma_chan = NULL;
 	host->dma_desc = NULL;
-- 
2.51.0

