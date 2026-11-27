Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781947;
	b=ae7oGUmRF1btoIi0qQMrPQ6OZfHBlefibkgsQs4emgC4PI9omjndh+OaaKubnc8yCTIp
	 jvcAYhnUE90C6zKNlxhEy3ybQTknFaKOiuqldcTLzjGiOiKZwu2zC/NbJfMwFX/vgWLQc
	 WikW9os9aZ65blbU0FsOfz/B4yWS1Um9/kBcP3wgenPb5zkjn5TmOlZjSzJMTOxfX4VKq
	 lDeaeyd92yEODcpzgDiigs33SpASejGvfsuo3RbkYliNORGH04nFrZlH/CSK/Mv6BVULJ
	 aY+n8MwLEAHp0JL4N8NefL/lqHBdhTpkCgDbJVaaGpH602O51ukIdqbw9xqXEJHs8Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=Rk6LJqFhB42X8PhmdP86NiWLlrT9d+xEavF5SliNUmXgNRFBt5P2Lk6NLbAhH7ODHViV
	 Z2SO0nd+JFJBzU2a7jJCk9UFvRUS6dLQvVb3zCO0KzYHviI5M0wa1VcEPVFqwr8m5qvP3
	 0mfF5uzNf3cipAXUt56xI5PKeKCQFu8OpwNo+Bv4Fa1kkv/76eoGqUo3qhsjSj3zSpTHI
	 sz5CA/3zyOV76czvl3kFDzSbNLdvn9UQpqVZvAQ/QK5ZV87rcrEUQ7zH3y0DToj7rxfw+
	 k2gr2WNCs9/Mb0FRAU9Y16IeWQ9D2Z4hcyp0obXdAay4JZAQSpNBuCHq4gKUvHlWZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED860A260E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DED860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5447120f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781946; x=1796386746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=cK7VwD4lhiEURNmrx0uRZYLZwsRUZX9XwpeDLu685DQ/eBv0y4nmUjDgVBok9vrqJ2
         MRZlocRElF4uFOlhpGZfJJxce2M5zbNRfdcwhh7wZDUq553Swtkac8kwNq30pCLl9ecT
         8JGfgoPQZIWpohDlOHOT0Ph7vonifkWou1dg0DiBOO/rohzEnjuy7ynFTXsTELHq2ezB
         J6aG05JPBIVhfXAfcwnBDaT0luBHM5Q0MsN4qZXR3rsnaRq0ycmZqy3mpcd9QuGyH/vC
         AHcgkQ5LHT1bQadT69LdoRYEYXonfOJHMLzfwwjB+UgW4INoXSxIx4IGucob/t6iJibi
         yO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781946; x=1796386746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=vzOtM49z3M3sESaOe4zFL7NkbOOPAak8b3w00zSKhF7l3jvtcw25Ep8eXjfxivb0pi
         4xtXuVS//3rLz6AyQwSZ09r1iPBmICOILvGlx+/1uUg/L1H21G4sfN/Tn/GME6bsJOds
         LetMfDZUyA5bEVZ9Yyzh4NPm6hmlWeozCzrLB4N/Eg1pxXfpSay+ZA7bDcooR1HrdXwC
         kM8JuAWdZrBiHqpimMa9zOqnBgYumMtRn+YmYP6qIpfbbsQHlFgu6k7qCbbN9EjFUvmY
         5JQOYg/GcUNmuDIu930TLJEHAjP6ZvkSw2PY9IOH0Gpcxr7LXyaq2Koi2RFWHl8Nm/21
         dXbg==
X-Forwarded-Encrypted: i=1; AL+hErFGo1HR9tVLTWE7YP3Sucmt+mxz/QhItribSc40LzQuXdbxvj3ZT1A6+JSEF3RE1GgtuF0I7gTgQZgB@vger.kernel.org
X-Gm-Message-State: APuU4Z9CceDcd4p68nwLBlCl8ICCmwYk/s5ccPidICz72ZNyK6uOx+K3
	NrWVF0MwUqUURc3qCsCdX1JNgH7l9qhBgzSbN9Gz1IaK2ex/O8R0JysePEbu5OnRFCI=
X-Gm-Gg: AZFdTZcISznvxSJtn7yE5dxz/GWPq2hLGa5YSJAEnq7z0rtI+DtPmRju9dP8JaRkFjK
	B1vKCzNNxEeqRw3IxZTdNDx9Ge0VHbxFTn8qs3+VzgMzSnTY2u3W9xZrsPgCn2MgVtA+2hrTBIM
	6oT5FnR3Z+g7Af+Z279ZZfgvn1qVLW3dRi7btESyUrOVhLFADbcoKlHIssNpchngvvyd6jyTow3
	5Tj5tm68okpNbL9udKbexKu1gVnN74TDdsHHaPjcGUXdc8g0JMKPrI3ZG1zaGjWbSJXfC03qFYs
	GGNgLACAILNItiB+aVvegr/XL+sDvaLms9T2OTW1xFJpiQ//FXuAkrLaiFKLKjx8QYIY/tyK2Ka
	jnVMq0YQ8QInhPn7TEDwUnTUVL/bdDvpf/LbQnXRbwu1uTns/M6/RNxJiZffia4eQg1bGeN/Cdq
	DiO7VxbtANfc3QK4gWVoXNfHzZqQugeGdDDDiiWJUADfcKaJhoAUYxAuNL/021d5yL9s4MmFjqC
	Al4TTi2xhfTsIjbq/fsV5BbbS2ULmHlHE8sUpZXooK+FtNAcesqubf8z7ICks8cbgZMP3GOsIDI
	QqSjx7ZBMQIsLxojcG4zB5yKgf2C
X-Received: by 2002:a05:6000:2685:b0:4bc:9b4e:62c7 with SMTP id ffacd0b85a97d-4bc9b4e64ccmr8999178f8f.45.1795781945689;
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3454109f8f.53.2026.11.27.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
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
Subject: [PATCH v4 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:07 +0100
Message-ID: <20261127122236.4976-18-andrea.porta@suse.com>
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

