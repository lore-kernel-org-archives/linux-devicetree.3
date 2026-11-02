Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610449;
	b=W3zEN4Ba9yMjVQW6/n1DMGVz+zVimmIth72omkqTzk2ShNb8oHkgic34aw6BHjCzH0Qb
	 os1UlBWYdKOtKhWQYnlvwhUymeKZorV2RJTCuc1AR4tnX7YNUswXM4DmH8i5GRxgyn4X9
	 TtjZKPxw5CjOrHhqLcky1nLiiAz8GhLbyb2xbj9tkbU/n0zazss9ej/DZCOe4ai2isVKI
	 +c/rC5QW6bzBILnHA5ZmRFMCvUsSHV6ZJPUsyXqBpI9jc2nwNyJZjHNX53tZiVTeUsilH
	 PnANCW/yC9bCORJlQJIdqffc0413r1UyeSunW3O8aH5+lCuqV+U+8Gybi+3wf4zNCJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
	b=eEuSmTjk9O6I8zSfsG61QkkZMk6lBby5QbzcXr8tLB7Uc463MEpHKIcq0N5LwLdTj7ZO
	 fT36bnETKxnCtKEv2HXxawf8nMS7H9uexp3IbLXMJYxRRWY4mloMUk7NhuSly0YaLuyOk
	 YP0o8/B6J1ApjEgfj2Wzs+tXqwkjYrIgr+6yZ2KoP0riFYxL+YEMlzNmdD5Z/fCxbW4fS
	 yVKZVxlT+Vc/jQWEa1wN6PxAH5qYeKIpg2EXNHXEinJALWOIZxH67SK3qAjL12K7BwoVU
	 /9DSt+Ub9R8dqmEMlsDlyB18CYyVpyiNVHuY709DmUyEtJLVzcZjdlCsRRAQSRR/g0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW17MtX;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E1606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW17MtX
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so27657605e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610448; x=1794215248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=PjW17MtXpX9lXyVomLePz+Cq7rn3FeUy4u6F5OeDuJ7cuI8iYA5psv0p1cvsdIH7x2
         ddJj6au6GgjFmGozJm4fMXyTuvTgA5g5QBLB2KcITdA9CtLlkfIi9QxmO7fADJUL1Ee3
         jA4jjOgGWI8cm6nLlK6+zmDV4gKJIibs+Blvl0CP/apIr4Vy54cFC89fnlh5McMEwI7p
         f4bvSSxcRzrI633Gwua64FTuEAb0U3nzmPqUAtga3KHhB84DN4mLi/INpMRocvmdeO8U
         f/D1MzXX3XmEMYyWyPMG+pbgI+0tb2gxYOCdplx8P5SRfUGEwU8GeqBs50k72sUUU/rF
         aDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610448; x=1794215248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=HU3v8UAYXzjsPJkTJW3Yn7It0rAnFlt2fa6/FbrRgaAsb4V/SeT2l6RkshZ0snK/kX
         QaDsLYDPWFnzWdd5rmC2u76iZE3bsIak0lBju9/l6uVUBsAaPWBMNnKB6MmH/DyZaaGl
         vwzUriskLjTJCwjHKPG+podUiAoAovpiggpYRjqmYRd1BmeNGkseE9vKg0oJ6NrhENYz
         /Vy89i0+UQwYRCbVZ24niZ2ZmaelRF36TtJ8jmGQmuIHQgMYPJjDRqbLt+EMLJdVFmKV
         g+jTpmm+hGEmaetZWmtEDr4ijAQJjeHGaBrCdrsf/2kh+bhi50hm7npZHUdt8YZfMdNS
         JM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxr6hXIfXbZJTHsGeBkFCLd6wmI5WZqozFSdzuLuinNz0CDFkH5oksjjJhv1EebZFd1b16LjfxAT10v@vger.kernel.org
X-Gm-Message-State: AFq9FYIH8pWB4ej7SFet/iQ7OpJVCukHYQFf3pr17L5OYEIpvQH+wL4B
	heEEOTLxxQvqOwDUzyTOzHZoBv/pgjaOx8Jkl05QgRY9IbiYry088QLV
X-Gm-Gg: AYBFou1NOoljDkTeQmq9oKpf8h40G/lzXKMCO+OXPUl9lmPSsnmHDdFp+gXfg3v9Ybr
	+ng4jlc/5y15RBrMiHT+7h39b/+PqaQRLw3oy5AwvhlxuSYKbjINE5ByeRrOlfXk4ztxvqsZJvu
	GguThwhmuCLEM3khp46Dz2EZksrdrigV5Gtu0Cmq/C+9RlU+HiA7VR4s0iMpfOF7NJghjnfCxO5
	pjAPeEYzojmvK4xiCVaND4dxeVQHB25xve3D53HHRdGZX1wSrBtSZzN0essKlIoqk2V/rs8m0NI
	E/YsAo7i2Ow6SMCM68xn/wqi9mU7M+GEgY25JjSW9MeOccKBFLi/ceUBgqQialDIH70h2jPrDST
	cXxWrmeCT+bpyRKdB88p1h/7KnucjhxHTeNOZIrOCeyV1q43+niYweaF/VritxV7SxffF/yXwWw
	Q4irkX44YANcZaVlz8+SeCisS6lzl+7AJGhGww/UBFtzTqcfXbszJQJdL2k3HygV6Ab2Hql38Wt
	qHheHbeTEjFAuLl+w9BQGtry49LVzVlx5tm3il52QFOAygxD+tZrSojq5OEXtKlvAvYM/MSGnEA
	IQ+1B+/T7HyGzIzk53JMT6Tly5BMTAn9JFgFKX2zpeG+yYiZfZOse+H2a29uTO/vF6Kf4mrUqDE
	ZwsFAYQObZyQtuIPopHsZ3dRvEEH9lr+MoSuau3cd39aGLaSL6olEqBdPwPCEA1OoB47spDSiGG
	xJ6PBaEfBiujAV
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr220479815e9.13.1793610447989;
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 5/9] dmaengine: bcm2835: Add BCM2712 support
Date: Mon,  2 Nov 2026 09:06:55 +0000
Message-ID: <20261102090713.896324-6-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

BCM2712 legacy layout channels carry address bits [39:32] in the
STRIDE field and use 32-byte units for control block pointers.
Channels 6-11 are DMA4 engines. Peripherals are seen at 0x10_7c000000.
Add the brcm,bcm2712-dma compatible with a 40-bit DMA mask.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 35f8c47dea89f..f06609b04a098 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -44,11 +44,14 @@
  * @chan_40bit_mask: channels implementing the BCM2711 40-bit register layout
  * @periph_offset: offset at which channels with extended addressing see the
  *	legacy 0x7c000000 - 0x7fffffff peripheral window
+ * @ext_addr: legacy layout channels carry address bits [39:32] in the STRIDE
+ *	field and control block pointers are stored right-shifted by 5
  */
 struct bcm2835_dma_cfg {
 	u64 dma_mask;
 	u32 chan_40bit_mask;
 	u64 periph_offset;
+	bool ext_addr;
 };
 
 /**
@@ -212,6 +215,10 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+/* BCM2712 legacy layout channels: address bits [39:32] in the STRIDE field */
+#define BCM2712_DMA_STRIDE_SRC_HI	GENMASK(7, 0)
+#define BCM2712_DMA_STRIDE_DST_HI	GENMASK(15, 8)
+
 /* Legacy peripheral bus window used by DMA clients for FIFO addresses */
 #define BCM2835_DMA_PERIPH_BASE		0x7c000000
 #define BCM2835_DMA_PERIPH_END		0x80000000
@@ -271,6 +278,13 @@ static const struct bcm2835_dma_cfg bcm2711_dma_cfg = {
 	.periph_offset = 0x400000000ULL,
 };
 
+static const struct bcm2835_dma_cfg bcm2712_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(40),
+	.chan_40bit_mask = GENMASK(11, 6),
+	.periph_offset = 0x1000000000ULL,
+	.ext_addr = true,
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -349,6 +363,9 @@ static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
 	}
 
 	e->cb->src = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_SRC_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
@@ -362,6 +379,9 @@ static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
 	}
 
 	e->cb->dst = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_DST_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
@@ -1127,7 +1147,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 		 BCM2835_DMA_DEBUG_LITE)
 		c->is_lite_channel = true;
 
-	c->ext_addr = c->is_40bit_channel;
+	c->ext_addr = c->is_40bit_channel || d->cfg->ext_addr;
 	if (c->ext_addr)
 		c->periph_offset = d->cfg->periph_offset;
 
@@ -1151,6 +1171,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_dma_cfg },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
-- 
2.56.0

