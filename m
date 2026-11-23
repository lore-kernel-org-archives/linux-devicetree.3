Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445649;
	b=ihgbb8fyGcMsDEkQ3zvNpn5u+LOw0DBS5NiAMpgMABkF3sKnPV/52qCRkhkwWHemLeDu
	 EBGpWUj48EH4X5vSGjYXRsWmNkTaR35y0ig37NMMHYYrl3d65QrZaG5xEo9nSnKpCvi4S
	 4KoX77JhFKbUyVc8WFt3CZPYdEVvWk+tjA19hYv+fGBu693Kkdoy4/tjpvNsXGrPbBS/i
	 A+//nWdESbpwJ4nu9w5aCgQuUpE309H4vUkLTYIdOx+sJ+HLS7EJKX9lT5kCIyQFVKhU7
	 C6TMeI+q9bmFMqszCFWib1VvCp/Kx7/GKQ5DUZZBI6kzkLspLGsLZhf4JKWFIi0ExRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
	b=RdtpGfZWhnTcLfGbEvKAtJwOSNonTkeFJRjiO0kEDD5tmEv10vLss4obICRpx5caZIO9
	 5b2C0gIwT62o4CF1ImIv3Zc7Z6nYqRC/XZQIFPO91cnYBDWUv205l38CPbIwZ01KDFxl4
	 DQ0CmimhWZ9TLYm1NcFpNZmz7cAQIMpn+74ArfdYyUz4qtVnu74jssnPP2Qf6fpD18p+Q
	 Olqtt2+UFH1O2ZBurqWBYfHDP42ch2T5jvl/Rcs4IFB6WheBtAWrNR1M16JNYNND1rI1L
	 Mzr774ueFvabIaA/BoubbuWMVkbV+G4AJBCx9GZiU+jhdICTxGs0dCd1mBZbQI5AQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gf4oABcd;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF4606B0B0
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CF4606B0B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gf4oABcd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso33578455e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445647; x=1796050447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=Gf4oABcdK2jy2nzIAQ/OfHqcxS3CQPw/HJ/SnE5vuEs26Tx6OmnMfa1TT2owBWaEi0
         ot7hmUF6yM/UqatFH17Rw9GrIZmUofi1h/6U/mBQeyzNpy4kJKKn3TYYtdaDtXIMPIw8
         /UJVsrkOKFX1FAXT2JvT95IZj+Xuwe6vjX1g1ntmNRoMZyItzxkn8XZUdG84CIqwdNEU
         tDIaJoXWS/B8WngO3UJ5zmIRUtaAzO1yxtHS6BzTZuUibbIyQ/JTjVIT8Lucv1XamG66
         o8KiDOP5BmWY4nYlQf/aBr2E3EqURH29Mgb+c1l32c1RVkTXb788h+x8zv3UJhzbccMG
         yL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445647; x=1796050447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFGaXI7w6YoB2AF/0GVKcoFlsFRelQZrfqIbLHit2Pk=;
        b=RB8suvm59HEo2rPPft+fo6BUrGy1PBCDK+6fk/swLLb8JWiV24SIB49vzEBXQM9elH
         f5TeFn8C76REB8Vt3kTlFEaInjqNkFnKrlJuldP26SLxZUVPKFcO6sEgDsU4LdDkjPvP
         Sj83UtXfqAnRtsMonjk9aceGYUM44W/EeYMdSIuxGzLnZSZR4/tklb+3gp3NS9oiSkRf
         LnmLF+itP+p5Z+66QMfaS/0pTxGDdshdHRYs/FNihuHNnZqypCKVOvn07cAIvN+iPU7n
         y10G+ze9lW4WPC4vdE8j14adUyIaBb328tZTsRKdjt5PV7GrTTWnBUNg9NlcGZqNrtFr
         ShnQ==
X-Forwarded-Encrypted: i=1; AL+hErGffvLE9am6R9iO2udtHTW6rx6yVPGHQz1ruejIGxnljUvf2rUMGgAasJ46h8jf+aMkmsQbgjwzeGVs@vger.kernel.org
X-Gm-Message-State: APuU4Z8uBv6dHgQmDzUQYcIDTSm7THQxn1vUNSnDhrL7uE4UEOi9qSVw
	BLoYs7XS5sfutcWX4W84+YD2WXxZ8RLy0NhX5D0m5Jd5h68RlwtL+q6jpXjV16R3mRk=
X-Gm-Gg: AZFdTZd/mMuKb/dyJO2j4A7xSGTX1/WAMIoImrxzYVUoNmKpMKsS5SkP5taT2yhLwBk
	Ai+Hkytw6+C/eYT7IH8vx7mdaziiKruidKpEmwfF6hHyp2Naq2KLk3UIpmqWKwfqkTNx1LVxNqM
	757i+Nx+PltJXSK8Uf0iQcOjXxwy433MwqoAJiqxIeH5VNJm+pWy7Lm3lusQLkgqxf8Ol/7RcVB
	OXUVwQgAuIb3r/hFnVusk+gg+iyuLTkxiuW5F6bQKjl3uXdRbx1rbHj6e/03VGropOSCvkw84DE
	hopJ2jsy8tYScfcUA04K3vdBWmj9+DFTOW5cOvEFU+muwrsZLczX2qhVI7DU+Gc5p/qdXHSPH/N
	vMTH8oOhnaGHbZSQBqtiakHc+SxgbKYV+0Tazl3Jt1+Pdlqgt6vHZdY70AI+UsYUdpDwita3pny
	7HlUFdT4y9OsADnn3xmsKaaE109MyJBJolyS29ci99KdpucXKjk0ISx9qUUUWgreUJjoKcta/KH
	HihtsyjxpVWsnNOBNuKKa2MtC9Mx016hOVge+jVd6/nsmBJ5QMaimPCmDujPZYSUjkLcIWN9FTq
	p6LRLI8pzZdRXyxEYgp32MHeXG6O
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr244080575e9.13.1795445646859;
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm185598285e9.2.2026.11.23.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:06 -0800 (PST)
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
Subject: [PATCH v3 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Mon, 23 Nov 2026 15:57:03 +0100
Message-ID: <20261123145728.29082-26-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same programming model
as the BCM2711 40-bit channels.

These channels see both the RAM and the peripherals at their CPU
physical address. The bus they sit on maps them 1:1, so device trees
without dma-ranges are handled by the same fallback as the legacy
channels, i.e. by reverting the ranges of the parent bus.

The remaining channels (0 to 5) use the legacy control block format,
extended with the upper address bits stored in the stride field, and are
not supported for now. The downstream device tree describes them with
the same compatible, in a separate node: such a node is rejected thanks
to the channel mask of the platform data.

Link: https://github.com/raspberrypi/linux/commit/99c26cc709c0e3658c3f8d78cfb856cc20bdd0e3
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index a98ea67d3406..cf435dfb04dc 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1545,8 +1545,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
 	.chan_mask = GENMASK(14, 11),
 };
 
+static const struct bcm2835_dma_cfg bcm2712_data = {
+	.cs_reg = BCM2711_DMA40_CS,
+	.cb_reg = BCM2711_DMA40_CB,
+
+	.int_mask = BCM2711_DMA40_INT,
+	.active_mask = BCM2711_DMA40_ACTIVE,
+
+	.dma_mask = DMA_BIT_MASK(40),
+
+	.cb_get_length = bcm2711_dma_cb_get_length,
+	.cb_get_addr = bcm2711_dma_cb_get_addr,
+	.cb_init = bcm2711_dma_cb_init,
+	.cb_set_src = bcm2711_dma_cb_set_src,
+	.cb_set_dst = bcm2711_dma_cb_set_dst,
+	.cb_set_next = bcm2711_dma_cb_set_next,
+	.cb_set_length = bcm2711_dma_cb_set_length,
+	.cb_append_extra = bcm2711_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2711_dma_to_cb_addr,
+
+	.read_addr = bcm2711_dma_read_addr,
+	.cs_flags = bcm2711_dma_cs_flags,
+	.abort = bcm2711_dma_abort_chan,
+
+	/* the parent bus maps the peripherals 1:1 on BCM2712 */
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(11, 6),
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_data },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_data },
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
-- 
2.51.0

