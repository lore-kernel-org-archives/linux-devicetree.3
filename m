Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781935;
	b=xQA9z/dxksD2hmC5227P4YfIfaEP+YNsqmf24xPNkhwndPY8L8hB9ZVx05Nm9eLoEgO8
	 uG6/b2sUcdASI1aMJsD5Zxp8QT6m1ZJf1iw1FL9Dg0QkFGf5kVlVy9k1FWj0zqFsdtvE2
	 JD7NEfebdv/hiBJ9YTD5NKpaUThhiH1h2hrPbWR2EG9r32XK28Hwcfd+acW7hIzZDTvX7
	 R1uArIOQeuoU/A/dIzqIkXBgDK7KSfT3B/D4CPvIVqp04goWlzOc2J+Uhk+iJcvOBPxvi
	 bOa9F05utB8KYMxIOhZw6ARb9rkm7+w9yzX3N/CGXYrjxnOkJ3fQag9wbTEkaGNU+qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
	b=IMfnY559EB4VFIT/kA1sjksSfumWkCbA/muAEgNqhhndYXcxHndvTQPNUcg2LBRxq405
	 +TPFRcz6ACH48Qw6TX/lLHkrONh0U5d4c1hzFJjkn5htdAug4MAOEfnfi5bEKh3roAwAJ
	 6qU818GpEQ9GRmyLlb5zXH3oqs31ZYLbGg8KgYEvi4y/iPu7ohxThfXWHcM5jmIH4N/Z5
	 IJBsmhF+mRTJQ3bIrxQZFi+Pgrkme6xRfLo915brj4dmMyShIWcIGPOBclI1ffk07hFvA
	 JdTbniuE+Qrc4mpBlFPpForvR4s/CnHnJUXdfS6/+vs0ppiP56ThGB/Ac0yC96dmQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14477606A336
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14477606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a9be758734so5073938f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781933; x=1796386733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=fX9B0SILmEh8F76TCxRPqNwZrOyG8r32Icr6Jigt2ztTYcXfaXHVVPSBDvjJZgQZZa
         t4KeG1rvtDeLvUYLmgayXGG/12HY8RMXbjutqr7DzfaPG9wufX8OjNpK5yFPkZnX0JuO
         6S1WbElCD0q856RYuLJtyDTKdbtKWG1jZCW2bd8ABLM+2wVEQbHdLxvnzkxkXgVt7bvs
         8VdkDWY3Oan1uTdIHSuimSBVUfDRbejgPhL7Rp/Y2gJtlinK9TkHgSXa+uLeaxeJixVY
         2fRwNS+hPlYgNecjc+GXy4RIA1q6gPSjQ99s2L/zM6+HGIhhE3Jg3TxG1619W3Jsug16
         y6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781933; x=1796386733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=DQ6AQSHHsWUqrXfVoYkdQBft/QcfyG9ec3+Gp5YNZnYzpSH6SM4kTcuhGoz0f/nXnu
         sr3dO13SjmCaJFPDSnH4Okcg7Iz1SJGTrZWGXkwGfY8dfDdDpahs1w5kX4/k1uQicC5k
         7CLTIaqmHM+XAZv1Kxplb0sUy6sitjFxh2iLoIylHz4LvZkFg9iBtaT1wZsstbui7w27
         FQ05/T9d2RVdpbviRP3qpH1mzoR0MW3C1t46H3UATBro9gORs4CgCzoA5mLV45DI5CCq
         XghZlHnfUZjrCrQgy/63pIZsDytZyR/yQgYcJs9ET81raTOqqjgqdkfyhtGTHWcUadVI
         X6Ow==
X-Forwarded-Encrypted: i=1; AL+hErEHpXH3jHIFwOgoRdgQFMhk+95+yxk4H690k5rGuE6dDZoFvpyr6uwI4ey+DbO+yP00YRNsLywRo9KE@vger.kernel.org
X-Gm-Message-State: APuU4Z+PbQ35v+NRTYEEuDkaE4KRZoHhapNjZ/ZwvlE44WoUizu4Fpaf
	gYivaW2hFFH9xo375KNiXs4v6qK9iKSPLWOwUB9XbvSHz9Q3Lr9fPFsu9cbD6OEUCkA=
X-Gm-Gg: AZFdTZe7MHJ7Y3k80bYti30eT9NNfx1s9wrl8qGEDnHa0uM9uVxm52uhhCxKf7CNr3s
	994viqBQuCDrmL0qHP+v5DGp53b78SGnAnA2fe1uuDYtJluvWyHJivnHuvNIYrWOYYSIIQnfGg+
	wgjSp/Z9M7pNtP70VM0iRGaLEIHBQgHXTSOf8jIXIOPKNkq+fHVi375i8MG3MWqa9uJdpgVSVKl
	jhPvET1sKn2e/0huCgTnQkNwP2GhuHIUUuUBua+IEqheotp17EC0KxFS50L5X0/YirthBVCHQJR
	RLxSWKwnx6s5NdDbu7cCMf1RmECjIHrqDReby9KpZwHgTKI8Qv4rLazq4AlkDHk2aZjjPOT8D8k
	b/aSJeUDBr9iA9Iw1AxsB6eLXG5y5g6DSnxoXeDQiJCYpKFSs94Aj1lR/8tC++/1UaIBin/V8f0
	vLxgrdaA3EpG6hWwQ+whzUxPHPy2PEY+XqARfPivZNYqS9tv85z21e/Fw+8uFBgFa7dLcRnHq5J
	5lW50G1uenBKeG7QH2NjhLHv5b9YqIMYYEE3kF92mC7u9xHLjPWNxcDPI6AjGoSVxCaSZj8K3uE
	rJUAmENBZqvRur+m5YIktdz41vRN
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr49731029f8f.42.1795781933498;
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38491893f8f.35.2026.11.27.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v4 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Fri, 27 Nov 2026 13:21:59 +0100
Message-ID: <20261127122236.4976-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index eb306397b0fa..0ba23ec6b6fd 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -255,6 +255,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -659,7 +679,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -690,7 +711,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -738,7 +759,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
+						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -754,9 +776,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

