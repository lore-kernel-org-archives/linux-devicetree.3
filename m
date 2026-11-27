Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781958;
	b=ISckoqUPR7U2Fni9Eu6/zNuXD3rcxhqAmmdO1BRmyIXcw7aWJSioxgOWR/axOat50Au7
	 8FCcOQq10R9YPiXpMPilbELsIf+of3zyZ8EGJNsub6eYSgDDWCIaBoL8n5hplf7fGaU/H
	 o+7Hnmm7NXlO9T7R9XUcT6SryH9GIV2Ak4YTFKCE/3TgtqNVaoyCopMD9KAxypynjsHRS
	 W9n5gHiXKHffyPHvrY71sFJQhgeNVlsHLoGssmbLHUjA4k4cbyl2FcfP2dPptPhgFx5DB
	 DWkX3HFC5TMyCIovigabSFbOyKWAno0Xwme8QFm8RmT0kOHyhGpQHDMLUW3Z67YGKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
	b=FcyObUdbmArD3BVryFcs/5Qm8vmn6dc7wdBKBTcQj/E+pTHk07ndmCD4OF1JBxY0GzPm
	 LFNUn2UGPUsE9wezqsXZ13b3sydHxgA1rcRiCF0zXVnHcpBRjPnsRSM8rVwxJpfNEPxpo
	 NkfJWCgW2lH5B3oNnaqzFDzrzzqwcmgiQUNO9zWDj8or4OLaqmD4iIawAGDmjDPPYF7WS
	 iAdVp0CAsTMXe06s3d83ljoj+0UaXvOo3M46oQoP+x7m4s5duZFllECdWrGqDfunSywcB
	 00pvEJEQ7DN8C414jOnUHT4suWCo27nW+CePZZ3ChdKPjVgF8lMfUKqGB62Eh2OuzKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DjIBRJaE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DF60A2625
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496DF60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DjIBRJaE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75638815e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781957; x=1796386757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=DjIBRJaEN4ZJKOZQQ9LSVf3UfMicBxgc0aHX+/pe4yAfyDZkY3cA7uwfQAQnS1sSZc
         +np2LfT2AfMmvk1vRPqdWujPE2eSeSG5aTT3lZFH/wwat4beDVyk8OxOweS0gVX77XL0
         G+c70JHOFWOCxAlQ/kszgaNLUEgpZl5N/fH7ZMfplH7ZYT3hWITx6eKpG5q4xSt4Nwba
         t0sx/xVNqt7rnc5wYAQSJevxknVYK1pGLd24Zftxid9DwtqMsn+xCwyBvZrnYBeC2kxU
         ENbW+tlztZTKqjd06eEVC4ZVOxfACQbMJSVXUUa168xebAnbEmrZluP388evlsbItXWf
         0eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781957; x=1796386757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIqrTXpQ09CNC8YvGhqJeuUImdcgkDCbE32TjDI5dig=;
        b=x1BkRrJ9naqHD4JostswCYsvCMAyn+rjdzFiIImW1TcflxHsXdJuxVTbzAtDkP3ue2
         NgwQi7wDeMrMHDpxBixo7QrbpxbRuuWdJBCFZeGu2iW6ICyFr9l90lyDfktsHGEAO6L4
         FAZ6mYdBhiUYdatshMMJh0aaPDfqwkLG9PF1i8XiWvziL7X4l5p/YOt351PrC2INLmrF
         I06oBLQ3DJrQQ2mektxcen3Wd9YfRlAV34W2T9QJZ2Vl/aVdPakaruq7HQS4NBz4ccHh
         Nq5xVgAJD9EO6Bsi3bHZ/Hy7l+Za4cWUhR/l8PL8sF2OvgxEFkSU1/Vcmnq9KQ+5P6ke
         i8Ig==
X-Forwarded-Encrypted: i=1; AL+hErH6CnXp6VD3wjiDu21wGhuDOLd5BsXOskDBKRKafaCC/HgPTkNvvXOtoT7GI2GPOE+A7kRywcTOj+15@vger.kernel.org
X-Gm-Message-State: APuU4Z85TBhVJ/8LLkG5pnK6S9v4vizg8w3aQryRpkd3a3jptnPTPLat
	5UZnwWdb/1RA/C4XkJBGT5Gk341/YCh3CIiB7+MFo5yZxlM3Wd4QPpf3hhpRxhkXU6Y=
X-Gm-Gg: AZFdTZdhCbdOS8UQSJMVXKqrJrBeWykE/L3MsfrzqLZAUg61+kaDnZcUYF4Y2YYcWMD
	ltZNFgbFRYxFm4IlD4d+c/I8puMzvbgj08QUxq9C/yOTYuSLgdtG6p9jhDW5S/sYhtSzMABxLJV
	N1DZFKF5wQzC+odLu5h28la6UxOhryGlILv2a778XyDn2rCbVKGFy+FnZ0BdgIa3WczmWNu+HHw
	Vxidh4+oLN8f/xGFyGrx7hRsUqZKgGW+VSdIwW557EDKi7iwXnCWiQtv0Fv3cneHOc0JIiPsJwP
	PrIu+nm7PE6lmOeLRL1i4i+ePVd71TgoOlXmpLldztkk8ODb2HreE9lqw6dO0c6viDecpW2Bfye
	H7KgaJ5x7l3ylQWoVbzKNuf+i7PJ4oaWldgJlrrJNc+NUoYs0qnkTt738Zt2P4uMovA0gMpW4au
	99qnZep9qFt6BK/CPW8FS1P7zedqdEE9t4cl0yCMsA1zfTOL2+hWgAADQEdLfFh82SOYc11Mxc9
	TsmaSTAQBq8tUiaFlZ9WOxSxP8p9bBF8WhOqdo+DlTgj4grsGWhge/JnXhvQebyq3thubceV6Wk
	+5UDw8B6zJpfQwlP8D1vuodobQDg
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr522882365e9.26.1795781956697;
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm663488865e9.4.2026.11.27.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:16 -0800 (PST)
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
Subject: [PATCH v4 25/28] dmaengine: bcm2835: Add BCM2712 40-bit DMA support
Date: Fri, 27 Nov 2026 13:22:15 +0100
Message-ID: <20261127122236.4976-26-andrea.porta@suse.com>
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
index 8fe71de2be0b..99c5e0b9298a 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1546,8 +1546,38 @@ static const struct bcm2835_dma_cfg bcm2711_data = {
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

