Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445638;
	b=paRSvrZzQiBKfLuYZH+F7Rf4/gk5snBTAm952d7tKll2sx4KiCLssDl4HzDQpajFvy83
	 H5nNzm/kTrv5MyANq6GuxFJLSESqMDyBeH9pVmuTYqTMnAQSzMlCJTPKk5cYqnyk1VXcj
	 crFiSf3QaIiHQdoXY5+8QZyJicIxj2ROZ5XAJy1F+Bcx4M+ygMLF+ZGnpiRzi3bTAn2sv
	 iO7GZMw6akNB0+plesqiUsHXQE3dDRkh+JAuBSBpkNAduUJNrO7d6dRz703V10vCFhYs9
	 gCAcH7EQKqI/NbVboyttvr8L2CU10LNyOM3mgwlgAPbmPRXBGOL5dAsf9y/VLy294ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
	b=YbQfJ4X2EpWUQq+uixcV/OwPSxVQjz3z8Kw01mZCyt5g2H79sf9X9pk1oALFmZjhg1Ji
	 u9nSnqaOqVN35RDEeuZ2L5ncibR9TbE6+4qG4LkAPirb4GzLPrsB5IPiQJA7qtVrwfl6B
	 NEKec8jcuXGazs0PJij0vJqd+T2pEZ+qm0lDtZjTNJMhnhgVAow/NLUbmhi0ihO+Q94ds
	 n8fDOcOVAIMRoFPHAEUv+OALiZIjB4eOH3Xqs5iwlpRiK+FQ7pFYjLi5ipKaEYtL/KSWS
	 7wi9XvoeQhUCnpO0j3JywMEDAvvWTZcAni8oeoCRewB2Q3110Ug7rtrfsRwaszka9LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9260A6F54
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E9260A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CDqXCh9g
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32706475e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445635; x=1796050435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=CDqXCh9g3gBn7Gqu7xnGzzahRm9GSKxuyxZ6SM9HRNndQ1marzSteyv9gBCp+opb88
         HgZXD+ENDEWRoaevbhwd8sePn8YCn9cIpKL74Vn9lG0vWUde6lQq8dffrKtyuQoIY7h2
         Lgvj9aMfhJMriO4fyWX5nHqygFAr1qCiygqgwJzbw2NAx3lY6HBBXX0anWHxSrjnFt5J
         8NDRGwZ2cDjME4rPp+tPaUwZUdNf8qndp5tfZnI5HM77ZOenh3ZoNQ3iKJDNLcVOPSvZ
         DwuRkG9TIgX67/6L58XuzqkB8So/KHrLKEw/kHbp+CEpNZarHD/NfHKqrf/OK5dJ2D1M
         /i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcDUe7weJJYMrvTg7gVHHmg7tsUoApLJH7Q2bv9KvGA=;
        b=G1BC7EEsn76XUtKhEG4nEzHwEV81ADa3q4RRnW73U4bJs35dJ7EOIUkp/F6R1GyPVh
         GI6SZ72yvTL2aKsHFcEwwY/IYB6C4QxSGoihDJ0l+b+7a51EiDUpZzklxdZAJ2gWzh08
         6as3C6jMFklImGWL9n2hD2xBnSsWqu493d7a0PRa/0HXHJ/I5uBpFz03tfQC/yPGrjCc
         vIUh16+Pett5ONKz8aDY4wPpkJNfn+MPCVQSXzpSFkpScHS4c/LE5It55WVSg0Mi+FWA
         yBWM9+TCi+20nbLk2o4YusSkJN6gD+MagBryL+Q8AU/vFJm5BbBnYV7PPN9V+r1KgUNS
         snoA==
X-Forwarded-Encrypted: i=1; AL+hErFkOWSrS/3lhJwsw4EU32W1yRCxo30QKld1WxKzMOc89Q2DQSJK8CyaMx8+k/jaJwi3ddrzm7AZvE96@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q6nq/Q/b7IwTe3ZrSJ/B3bHXcqxUwt7f4oKQrbfezvTEvP6s5
	o39gdGfQC8xFFRiBg8h+gYLp2wxSgH3lolQO3sc+T8ctC419WtBFr6Wl1FctVMYkxXQ=
X-Gm-Gg: AZFdTZeydgIb6i47rjxzeZhtQ674SwZbd7s9aetdLqb+RkVFJV3mtE/Zpo1/mMHdyyc
	vz5zRg3Lk8hLMQOAqcXi66ZfZSSwh+udT1JwUwQSgGAO45Yh7IAYrVd0tZvSh8k+AfGxMJ2R8M4
	Yz6+AyhYpoygIfqDOrmQCqa/K9uD3WDZA5UirvNLM9KCzJzlOmzRK3gsJ0k4neRzsS1aV5+trCM
	mVKOI4/HTeMYuHdrtn92yLEvE3t9J/C/ZIUBHwtGENYEe5WVNBi75edoa4v30DyoZZ4W3YcPv+J
	Vey06tyIwLWRaLDPWbJi99pCE4Az9NygCwRL7y7XT9LmUbLMypkurVisqyoeSO1Dngs8kTg1ogy
	N5QcrEHVW5qzhtn2IjfCYI1m6iFw339Qvze5VkNr1UWECJNXr7YYrocvZkF7cJuzdOCPfc6Nqc3
	trFgeq6O25IKC1pq/CHpVRGduJmMvFrAFKe6Gam6u4D/UxLA6HSYlBx5KREdVDP/CObU8HR4huV
	bXPxrFx98uFTF8aoTB/k+yHaCVNOzW6+qtjN7G9KpN7O5vR1rMoJ6e5K/Xf+KeKw6UASsEmbTxC
	smgcVdiiBY/2bNlauG6ptm2e15w=
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr265842135e9.32.1795445635536;
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340088765e9.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:55 -0800 (PST)
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
Subject: [PATCH v3 16/28] mmc: bcm2835: Pass the CPU physical address of SDDATA to the DMA engine
Date: Mon, 23 Nov 2026 15:56:54 +0100
Message-ID: <20261123145728.29082-17-andrea.porta@suse.com>
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

