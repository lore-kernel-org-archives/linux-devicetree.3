Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445638;
	b=E2mVjacLORihnyudPGlO4heZgPTykACLgop/FjNxAVPK8Y2I3E/JJ03LN6Xfr6FI95JO
	 2dv6qie+GDNgjV3OCmLhX0iDnyp9AYmOGAZpU2DV3FdkYx6jysg6UnxuP8r0V/H2Iqg33
	 MahlwZ813X8dU/bpPjX0dQX0/6C1Cojm4cLTyYNzMW8J3S7t9+Ic6t8WlAd1Xdz8QhN2M
	 jK3xfO/hRyf6whEa/GAyY+cSPS4cwTcSnkfDSkZcOWIlHZGUwzF+lJ8dbVcUmSsF75QHM
	 3ut7VOLtVOG4Qf8Tusfq0c0VCcO+LdW+qkMJ6VVwqtw8DD3DgVWrUMKvUJB4ABSoUCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=VgoHaTYnfQz07kD4mnU+W0eDaqTv0Aboe+mA7Bp/WCCA8jjr/YZ3ODIdcFehR0EL3uwI
	 L8rNXXl8LWObn4y6zmRsGdkZrP+X/lLDQ6BfU7xkSQ4wtlOQdeRlrzXt09ezeVUldYBNz
	 TZNao8u98BboLFvrrSqkwyb0i81kOzmcvJ5kWrmcYKCa9d1K00D0UDXc86s9E2T0nc7ZY
	 SU4ApYpIchfLPJepa1Uazk0U13HhoE1HofLrXt4eZ09rlHU8QFz/PbHwpjxwN8T5HuSG5
	 67uRz/0/QXPkOQJ4BQ84K1W7xRrRmbAhkfzzBy9t2EcC6/7V5HJO3tnsk4tCiKGQTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7960A6F51
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C7960A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2001091f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445637; x=1796050437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=ZXg8n3IQn27O0EAhb1QV0uH9WnWcXpQh9UD9Fvi2XTr2ASnA2yqy5YIIR0EGymdyk9
         g7EAMbPzyM5DOd0ZgSgIkkAED/fKpca6LzxdnKBGE+EMIbOwm7Y8k9L8fpshjuWqU3iR
         hWyi1JtgEKqmmEjZ7T4mZWKTcDiwAjKST/MmKcbhG7GHFy9PUYr3l4I8uu5doG0Rf+8h
         Jv/Ja/9M7YI2u9z1sGUcRe58XaSmCFSWsjkJ8aV5PXNK/ARgkcE8azAKcvlAJdWZtKKo
         3a3x+7CfZ0Cm9jx6aBVsHvAaXnRmugE0fMfySQmQUcyKwaoSaLwmt7mG6/Kzft3ZUXoq
         LEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445637; x=1796050437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=sWsGf5FwBZQOYhf8rig5kpwe9Q1f8/cSIlfWzzhSqfJDT5e4TMFP68Op72zg/eQfmC
         fvR8DwMbAIuEUv9fuo71Np2PekNJlQHc6hHuieQzsVDR9qz/NJ+aEouy3jLeP0akMxkD
         Wjw+479zgvgc4XrSwQOU0I2kKtMyswjaLeyxsAGuGLKgR10Ma1r7wrrA5V0rDykV5m7d
         gk3iDnOBd3HB4mZmoOthKETXSvP4EkR43QAVIWUdboVkQfy2jLh3FMoUXXO3epelE5et
         9+ITshnHw7Lr+FS5bEzCmch5DIxWfjfnnPrIF7cISfF0gpbn50hLLnFTK3CNqvLExzO8
         c3rg==
X-Forwarded-Encrypted: i=1; AL+hErFDy7UA3M2UP7v9WfYDvT03nMwzhzvMMco8pbwMsgZtE7oc4qZOvh5+cWaF/Go+f5ck1Wht0G1O18d4@vger.kernel.org
X-Gm-Message-State: APuU4Z/EsK3tE/IX1FvVJBN8cvxY9KRPINXhNMlmZuIAzEZ4pqf/SOL1
	43Qa8hNwhkHEb2Tzn4Q8r+oQgc4HGvSEIO6VRZ7kNhJR40tu4J4JKEIylFatj+9dMto=
X-Gm-Gg: AZFdTZciLiFE7gdIymc/WBpyA/ZExIyAfTw4h9fPNX8su61IhwdgtBnpwg07poDTNWS
	NiaXS8/weO/t1bMzvNQEQz2bjPdWnDeJB0PhB2Bay0LiVTRB8/vsSxoOBFEfLXj6DvQJ0VRZMPt
	nalNkcasqljjoD/rSRGfgrqbMMQZwW9OEU21X4N0WRIQymjhkeHOYXvL/BNWQGauXk4Gh2Riuff
	qhlMgkbqaUHEcnO2mNdmTljQEfT7OhMvZ0alyZOwQI8d+JeW6uYaSVNVQu/WFfP2cMwqfR8BONT
	kwnt5rdoevYlCIhIXP0pC/eNiBAJLlve+9L6FQuZHUsc1MH3yjmNMbcD236LVY2ff2cGY6Eelll
	akAZqI/BPmm0BrRFiTGgXUpiusoU8yVCC7KooAIleNwrZOTBANaiiSD+ugKf39g2gGqeHx5U1Bl
	btD2ldK/5T6W14GDgMJ1CRSPwpLsXEFsJq4YFphA2eE/2wMleJt9SQ9yych/7QlV1W7zWhjIcQf
	rw7vfPPuEJ2FY1IfcK8e8F6c5xfFChQNv1GvSftmwlL9o1PgDaMu9o192wrC8T7GTbMtRSLUyuS
	WFUdTmjMAmscsnusGOqfIWa++ar4TiTFIapyHDKenC1hWEhY
X-Received: by 2002:a5d:5d82:0:b0:4ac:7595:6f68 with SMTP id ffacd0b85a97d-4ac75957253mr19069216f8f.36.1795445636715;
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22292067f8f.10.2026.11.23.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:55 +0100
Message-ID: <20261123145728.29082-18-andrea.porta@suse.com>
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

The address of the DMA slave is handed to the DMA engine through the
dma_slave_config, where it is meant to be a CPU physical address that
the DMA controller driver translates into its own view of the bus. The
driver instead reads the untranslated address out of its reg property,
which only happens to be what the BCM2835 DMA controller expects because
the DMA engine driver used the address verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 208977828254..ad95412cc8b5 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -30,7 +30,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <sound/core.h>
@@ -843,8 +842,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	struct bcm2835_i2s_dev *dev;
 	int ret;
 	void __iomem *base;
-	const __be32 *addr;
-	dma_addr_t dma_base;
+	struct resource *res;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev),
 			   GFP_KERNEL);
@@ -859,7 +857,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 				     "could not get clk\n");
 
 	/* Request ioarea */
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -868,19 +866,12 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_regmap))
 		return PTR_ERR(dev->i2s_regmap);
 
-	/* Set the DMA address - we have to parse DT ourselves */
-	addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(&pdev->dev, "could not get DMA-register address\n");
-		return -EINVAL;
-	}
-	dma_base = be32_to_cpup(addr);
-
+	/* Set the DMA address, the DMA engine translates it */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	dev->dma_data[SNDRV_PCM_STREAM_CAPTURE].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	/* Set the bus width */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr_width =
-- 
2.51.0

