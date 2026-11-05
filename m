Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904961;
	b=T+nXlHYqx87ZEVM6Mexvqy7TH3+PxZdy6TsIy2foyRPkg03wQABx/s76u1gpeeNBaeq2
	 m7eIbncq8eKww8V2zeK/4fSqcub8O0oF8HRXauYigcMIcryQQ4a3ouJYfvRK/WZ5PkdTO
	 Cdg1uHNAYDJVdWvVqx9s3Cuhzflgc65aWy/yb5nxPe4t7+8v3R1/fUACUZEdaD+e9HrMF
	 zWumJM5H+UCA/GwDG9hO/cIRwDjUfV2ceQkvKuLV6xXhbe2pvdkZ/Bv8llP+uZYy4HuZo
	 ZC7vh7TwDWLp5ZC0nKp+jUhtLEdnT35Fem1XrAJ92Chw8NHmD4psd5uxEPQk7P01bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
	b=P8AXP1UHRtAiSya7mPYsbBn65kbF8Fifl1MxeJegLnup6FDHxWeqtodByakOZS0lvrHS
	 a5fY3tvaajEiVt5z6OD8EqC9P9itvAbizreelgtSWbXU3AURydXsd8bTcH/ar/4UFitg/
	 2TyODPLj04dA96yo86+YqbcBlp+hEpyrddq6rbfqU2OXyfH2D/N9VtAAWN39uESNGvj7k
	 KvmWvOvfs1K+EsUN0isCfGQVKBSEnJHZuYv2yVYgRax8X6W/vgNRydRvJCGX0OX9p7Icy
	 qpyDsU+07MUg5zAg5HD5s5i6ttz6s9T7SdpMCm/BIXQ+byf3jpoFYAJpH4Cffd3XoHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB9tIId3;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EC608360A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2EC608360A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB9tIId3
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017656eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904960; x=1794509760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=GB9tIId3+JGtHdpSj8+SCUC05CYMqrh2iNDHeefPkLPhwIlVQYoGSLLXzN62bIvE5/
         VQfKsVQ4nrrDLEiHvv3uhnIZ18lyeNQIHh3j3dX7lMdt26zkvyuDBTUDwC+j9dcXiuWU
         sW9cotx2d9rXGJTTqFBtowipegZqAoG/LqADcpJOgRgdHGdIx5IOqyYPqYo2U5Xeebq/
         HnX9MLADFI38vZrnfeBIsTQtOhu/9iYMuOd2L9cGqjUBoZav4enZr/BC6vHqVSxD7+YC
         m47JblqnuWPMFX66foWioU2EoVpailTF36iPZXglXidZYHtV/wZ0bL+SqPqvC2th9dU/
         G02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904960; x=1794509760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=odjzJ+QjFE7KpzTA96hA2ksGnFpfHWjwdbgm4vJNm4xWYfLwn/kClew3yZYei/PBZO
         Rsdm3QJE5MDFLydRgFT8954Ond9oG6bnu5lz7WP0gqrfdfHsUo3fjhBTi6oiF+oh6CZD
         Uje9YhKyVTSR7U2QhuXqVTZz5/3yAyDQpAt5Ld1d2bv0Tl5NtbD+vUZpxZd9Pebo/BeZ
         AhB1/bPN4zu0sUpCUu/eu9imS8XZMl5rs/SOdxh4rEdJm/r7wM7Lv+qxZZiEc+ilrvfi
         4HQdmcueUoEaVq50p520L3FgTM0mm1dK1Alczvn4RN18fg6X5pKsIh9cJ/evvi2dli+n
         MROg==
X-Forwarded-Encrypted: i=1; AKwUvBzLYbm9/x9DBE4xRw7lCreMUnElpinEIJuscRBPJU7LXuj5ITZ8az49CARAiPBsqMyirIShZx/7v4UA@vger.kernel.org
X-Gm-Message-State: APuU4Z/YTCNmvkCHwWSz67BtlhVV7Xo23PI7K67ZcQ9GGvfQ6JoLYDfx
	lfH6LjgdAn76eJcjCufOPrw3EAoviQ9FwLTuYV00QEJOziBgRYdTEb9g
X-Gm-Gg: AYBFou3owW2lw2Lfk3iEtNAyC1Hhfw0P64VDUjW+UkrnVAWQNwA1oSOhjBzNnlty7Cw
	dayUIfrTBwzNU77qgQwWN3gk5kY3xBb8fIkB4NznNBE382aEdIzS9qly965InZvO43QUG6ddGLb
	vSufYgeIZVYIU7sC9uF+/ocf0XFRfhsT2UivZEuBkrDmI7bZu1CxvURn4u0EpSOLwgkuia/3sfm
	lrGVxb8LoeE8C1dH52tQuTtbbXv6JkC7oIIPCxViNE+N+l0xbFyMdkUWiG1iuxn6jBHl2xojFey
	jFcFHb+zUqCw1FKLwvFl9x4yHHTLTn5uYFF2NWEyXjG2twHH9I7Oo9WA/MOGjg1crtIeqICk3TW
	nHtzxba3m2zD0NB5CP0NE4B4KQgUQoJ5vHWxEQmmhfwAKBdFHjcjLVDhKJ9JyPZcREBng83BrJk
	uXGYWKSorU5lhQGjS0Mh9WyWzHuDQ04UhZ1FFddCSLp1+amGGIxBsl4woR8Ejjs0igHDVKkhWT0
	bM3XW5L2pZAAOMENbaWksAd9/bQ3sKYtzHUMfyZMPTXR9gJd8EC6Q4dJFCDKnrzWsDNxVr0IqAD
	fohOnjjINrQ2PyY5D4iWBWcP4KhgkL++o80HesEtLTszUO/AfckHW+gOaO+ONUZzmjvI6Xp6NfM
	38ZRMw3iIslEdyKKCpkhxR3SqhATb/XGQ1dxkkbG6NWxf1Hw4iouKlUMTE6CHu7nre0yHCITczM
	urt059R1WnJnTvrjF2zqYto2TGAx/M7q7A5HzdquQSPTNM3qy0+Cd7
X-Received: by 2002:a05:6820:160f:b0:70b:9b1f:e8a2 with SMTP id 006d021491bc7-716e73de95bmr322359eaf.3.1793904960035;
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:34 -0700
Subject: [PATCH v10 18/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-18-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans every child of the controller node,
including those marked disabled or reserved. Neither the chip setup nor
the NAND scan path checks availability, so these children are still
probed and registered. If an unavailable child describes an absent chip,
its scan failure can also prevent the other chips from being used.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 636a04f49418..3de9ed6795fe 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2771,7 +2771,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

