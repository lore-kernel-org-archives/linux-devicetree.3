Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445624;
	b=ot7adrjqfV/u2I7WTvJCbc1YjjUKzoT2gIGNhlofRBCwDHxe7cZ4hVhl28XN5lm3/njI
	 uxJ6wbE0rlJMPsq3Vny107lWXvprbHojQjqJ12Kqq1ILoVkCWlg/UrDIhf9BySCpxAjwD
	 a6tsTICdcycsuK7aeBBd5M132BoCiPaFfWXiH8z75UIApTjl0bNWuyqXvQ7m39kmEdqAy
	 2fiqJmzuMQ0RBnqMFjYQsOVMPqMQ9acq0ZvdEue3/R0lvfzbOL2HCdISdrCGXFY2BZXb7
	 AJKEfBspzmB6piVBw6NoRZ3YtPdIPCw5S7/juqaZCK/31QSUVogk9Ly2Sr8PmrSkoBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
	b=Ew0wK6/8qJo+GDodZlPkZtZQnLLKW1J/jNoQ3TG6YHKRk9Dm4/862v4A1oXHZwTNRgSP
	 Vd/PFxibxb/FUZvTu46PDsvdadPns267J0m7BWzuGZxes1+Jhcm7Pm9eHe/LVKd8IoZGu
	 SHfX0wLbDP8mDsLscVNu95tz4oLNXVJn1A0jZDbWLz5jETauRY/9E6kZKYhgQMHBK12nq
	 CMniLa9NChO09fxkyEO962MvVqJj2ZoBKPWiTOrNwbFw9kdFyBYWD2/MCe9dojZb7oVF2
	 OIihFO00V9im3eearkvIzKfTLsLj2StdjywtGR8K5DSOAhaI1cezfqmfzKFL7gAedvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBD060A2620
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBD060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NnumrRdf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3042853f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445623; x=1796050423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=NnumrRdfEux5gfgyZcOFK95vPXTjkeGWjRPizY4vGc1oc5gkOETNYiNoq1fkUnl0dM
         oeCG0ZX3cxg/z85w+zxVEKRBmU3WmgXi3B9BTQ5fkrpjcd7MNdP34a5zOLYBlkUcet/8
         EcLgl3sHpfxQkNNp+hj6n36kcfu2g7uMgdzH7XQmYzXBXRU38b5THI3pX5QRsq/zIQ7s
         VhiG3OQWjRdwTRM96qdcBQiU5gWsWEH0l88FKXVtRmn9bvkKI1GCbvXpKshiiv1F6UCv
         oRhj+qm09zUUznmdSbNle/aasJ0oJdIwG9ihReM5dnKf0DvBgNUoa0/wFxjgtlFMwuCr
         Wx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445623; x=1796050423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrHCc76aLS6mD7wsfBCrlZZx8i9gK6gdpTx6g5oieAs=;
        b=M4Q1RPtOjMwfGOXVV2oyaNf/BTLVKbizz9wUnGvDECn8UB53p5BIJHx82uH5MZk9EQ
         4QpntXC9FqqB9W1Z7Cg+7o9sC1xgvX/wjubyNtFXbJA2pc2F5TX8JHwjF3JzyL3q7Z9S
         iy4YM3KP08VXldTBxOXKZxX9zWsK2STTrhBfFJvg+NLt5GvgMay1WB9LhBZ4GeJdlq6f
         TZB5ajKcQIyFBBcUdZfP2H4gjdEoFFmyynZOmm78BTm+nVHOIFN5y3O+fmONHKzdY/Dx
         qAk8+QXAtN8yrxtmv2cjiTmBDLvpr9bYIERLXpZQ67/So2GqT7DRI39L/I83vQggAGEP
         ZxQQ==
X-Forwarded-Encrypted: i=1; AL+hErGdnzFGToCPswdXEe08eb7Igw9MrUQ1JkzjvArubtdy+MLq4rQS0Z6hgv10rFS4N8gccSJiQyJU2GSr@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dm89s2vPwpM9uoNqO/Rix208M5nyKCpN/jonpAJhdquTZ9MZu
	dAyST3VPi1zyRHqvKOWYFDwsK8a5HLCwYjHFBjq5GkoJXe7pBaSxmVK9T0XK2BjVWcc=
X-Gm-Gg: AZFdTZcuEbZLgn9hGhOGwbaG7gR2M+frjmZo21m159W5ikdVYvuTAMPtXlpkhk0pcUZ
	QkdzAiZZVnNulaGPdCRFrW2ryeTVIBrk7XQU+T1TXoYY7daGFg41y9uVzElHOrh1wvv4unGcDFZ
	FWbRwGXD15fbb3mkVzCp//4KYY1D2+45g4jPe41AAgBpInSRrOyJaaRYwumKBTWj5uFfuyP3bmY
	yUpHF/yEy159qDSjzZJzKo09VtzpLCGXbsNOwX1mmtlnD74agQXtAQeUoLaLjU+Ml3Cq2Eyo2V1
	S2quHdEU3zNvzmPJyb48FcCHs87/zL2YjRFNImQ163xtXR+k4B8R+3pge8dYAz8DqyAd1OJTLox
	sbYgtSyvFZb+mpYMRjc0FhW8/f6fuRBaM5LfFUK9rZwixkYekAhtUf83VP2xaIh7N4qy1CsxItJ
	F8mv730zn8WEtM/rUJIq9jDlyCNiUfORg5bXRjQ8G7o8s9ttEXiVqFci0Pcdmirrg149h6chIVr
	/13GBzqeHGjXX+nqUTDXu05WZl0fAtH0dXSDmRuPm8gyR5iPSW0W/up8g8RkJQVyJ6AzRy//pe0
	4kw8NWKU5l1c511hUZUJFBOI218UFEMrdJc0FQ28UgMZvnYU
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr23600375f8f.25.1795445622898;
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm22447029f8f.38.2026.11.23.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:42 -0800 (PST)
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
Subject: [PATCH v3 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Mon, 23 Nov 2026 15:56:45 +0100
Message-ID: <20261123145728.29082-8-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 51e3a40dbaec..1087157fb242 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

