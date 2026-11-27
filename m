Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781932;
	b=XXUlH1gojGx0sxL+iC4FgS/EBeSq0/SzRTjEMT0HdX2tbJDtfNK8282uyH3SM3I4m0Ir
	 3Am2Bq6r2pxkts0Oa3oqjTW92XIWa+9DGqr4pHE74XJex2kZr9km5FO1pc1PvFQ4fHm+V
	 ypGJLXCtxNFz9k8QBlbFBsPXFSJCQRuU0qaQWZDRo10Uy94qrg3NpDmuwWjNfJi0XjMrT
	 40AuArKAu96tE4oJnuKgO+GGDqW3jnpoWIOgOa+89W6JywtspDdMqRWbmxBfQoSxIacUm
	 w/xAeiMIjV2LWDJ2n/Tf/bmAuRvKbgfgGXtK/lbL6tZDn9C8WUU1HBtRDzaheFAEELw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
	b=ejS92lIunlkIe2uLHUChwr0D3ib952qZ/ia08xmxH8TaZi/c7uKdx7MlRBK4XFGD5fx9
	 yNiCY6xWgQWRPZXxWXxiSahbjW/SRRFYxv1FwigL0OFhqUgv0W1cpvigefxi+ggizq9fH
	 wtJMl52eJ4YGcBKTy4eJq3zAYlYhVqRkjZhFXgCzEtYYBhxBFiz0nRwquQutyRux0gWxH
	 XRFuO51FmCkA2znanJLstLKWW7dSWBEw1fvpoZAPK0NHSeZL/aX1wD25CHYz7eyOPv2rQ
	 3cXv6WQjZ2Rt0Y0TncQllFEZFQElUP9HHwBw/ykZiXo26MxG4B1tIjqCxlWBiMfDcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A360A261E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634A360A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5033616f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781931; x=1796386731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=Bk+dQz1RJPEOaU8C7jk7QY1K0V4efd1qfGIPw9Av/4rR4y7jiJ4BLwJP8RiG1psv1E
         WXOf8wVGNFLuU9gB4R2mIP9iwyYHCU4hkKwDgXn3JwZRjZJW6uC/zpHPkt8dfs9vY+/1
         riz6B56rTXoKQdqamDsJL0xTemfdXo552kxQ4bhVhCLCP3ZEepkpMwPI76wFFBQh1c3i
         vqbrzbcN82w82Kf6b3E4Fk1leYxZ1D1FCJKDFlIs+3Du1RAldh4nstao3hq/gW6k+eTH
         1FNgVUn7CDCkiDWZXwMQcBFLULXcZ6b+R4smw7Ca7+lTHi7w7t7U9uSc+j1+4KczAmDL
         YxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781931; x=1796386731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=dKgRG2rEdhkwcMr9MqBhQHYV1D2BTHBr/qwZmuqVDNqNy/9uAbYp8fpPa0arUPvY2Q
         1oepQqgwlxecKjd8gZoRoCIK2REEOV1p99pFNpaQmvzC3VZ+VQhW0aHi4W8NDmQFQI8A
         Jh5f1AAVtzNF46iHxNClX0GW8E+pjTz9kr0gCu+eWYual8yQoIuMdE62oVxXMtfIAxc8
         zl2q1GrCk/KZxHAojkPRyUbHb6FkwC0K7t8PUpiCBzkSYwVTtvMYiebicp6rDB5lqF3M
         ScSppOg2q0nFB9gncuqFKjYn1q534xHuqoK3mK2txh2KvHx4D/gzwMIgYoPZV0lPwUm3
         t9ug==
X-Forwarded-Encrypted: i=1; AL+hErG/GfT4T7pivcNCVzJGyx/QL/dAeRuD6XLD39aAs7S679ObtpxJfXAxVtbRH6BtU8Oshu+cdODViXVT@vger.kernel.org
X-Gm-Message-State: APuU4Z9eMxyvJRoK0J4otuygudnRCqbaHbOS3zpyO95B8wF//OgjJzTp
	um8ALs/+mO5x48FXi3L7XFvEKKYxlpC1HHGmUTeN6MOAy095urZ883dITzm7GvZRdtk=
X-Gm-Gg: AZFdTZe5FbYJ1SkV3gRrYRLfTbisXZ8mnXu/C2jngbSZ7swLKKWomZibstRlU2MrH0B
	ai3EqaPZAmUHJkAI63YK6UnYBjLQGg5nkJLXsIdxVnehX0oTqSTxtjMYn5PFJEYIG3+OtdOE8LB
	8bWjqTy3rQhwZ+2B6xAIPbisjJTcRFwhYJ8ifJ0WVFN7XKs+FcY5MBXbQNWjndbDrYB30yJJ99w
	+coC/p1aGEXn+OtbZoMxu5QsmJPSKV8LjIVeTpR29UuN+QEKGLBIIwfMQGldjf3eVVmp9Wc5XWc
	zbp6C7aMnZFzGQECn0Kc8FK5wod+7sNXZF5OBnpjRkQKixwwwcg9k1EDsaYWiOhmLTecQ6zP9gk
	8viSMlq4tPyT/YPZDBjKiyOhx9DXzMZngLNkYqT8Zooq80VckqB82d0QclJo0XuljTAUiGwFg5V
	qplEp43YebIYlolzuneEwPXRLBCy2TovU3Y5Cs6gHtmPDcB4DnGTmvue9u+ISh/7SzTDH78KcTu
	MR4khuQZ96WQeXoOyOg0SiN03QVuu0VZ6x0zssRFSXYgM9at0O0xx0w5i8X94OwPiEg3eU0OsI1
	ZRbhWaV1gOx8HIkgZFkfjMXA6c83
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr47199743f8f.4.1795781930826;
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3453019f8f.53.2026.11.27.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
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
Subject: [PATCH v4 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:57 +0100
Message-ID: <20261127122236.4976-8-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d65a93be5fa1..d2e000e94347 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -982,12 +982,20 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
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
+		dev_warn(&pdev->dev,
+			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

