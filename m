Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59604435AAD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509488; cv=none; b=bzLRl5M7XtmEa8HvPKlzJ/MJ8bC6uD63WqbBZa5V751VvaLPcJBfGhdTqOH+QuTd14X+3lWwP+0FZj+G3RL5VLC6bC0HUnzG9oBJj7tVIOxmLhcATVr20yC0s4HexTH+r32oEpB3powp7M82fNYWExYwGr5hz+0r0ZwVTOdF+eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509488; c=relaxed/simple;
	bh=UUW8FDjbH++M+5cnKYL0HCr0Tn0/mkah5SLd+++eEF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bht+hXIUg4iWQZqMx5spafLMkH6vLxtL4kB6RgMMTKcKFeG04KjAGPHaj/iM1JJUZNEntZ80RpnusAIQ4PccxTia8qzf+Cgyva7uAIH+BIiXFGR1e9JQxdpBr/oDiJuJdt4fzF7ihFRtJXjSp/EOWO5yu7c3v+VV646INmRheQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NPk8KZAp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NPk8KZAp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c83474ddso4881845e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509481; x=1784114281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=NPk8KZAp97H8/rl5880gWadTickFoCGeJgwHQmRpVwXb2XLv2k/EB6WsEXkVKR8lyO
         AyC1kjjBl3Hturd+YZ3WLSftR+3L0vuJJhy0xQfacg5nGk28+nXgdx9d9b2PDAVOrfFH
         wkfNAj/zi4T3jahS+bvuNF+LF1G/5rKVedijmXS52W1IYAzqQASY9/p3q5Jbm6nB/loN
         huRn4Y2iZPHgicSbVNB96dcJCicXv+Y3/3nP2I2m1cQx93aD1G0eg5PgrE42HpD88sQ4
         G2uyit/V2WIjfd4jboICHBeLj0dzryX8euXa4VHj9VSPUunkYoBtzjV7d986+fQwchYo
         y+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509481; x=1784114281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=rF6YMbKlI+voeP2yvkHotIMgwfq3PSZCSTZybpVIxaakmAgCJJpXhw9a0yUhpMUnN7
         A2xx6m4nRZ7mHHGjWdYojkbSagb33pjUcNlegwkqIppxM7ujLbB4JpXE+P+El60/TuzL
         nlPyzErR9tlPUfp+HYYwrrC0oPBJtcevhfmVJb3Gj/15Jo5OElxFvsw+ZXnA3Erp2g7z
         XfdzhU+LyI5otGUx0o79vMlNNJYWDzebOx4LwNKwNLLZVkzylHa7/78Q/Cugtzv4P/+p
         rquxm814cCJI23kKWFVq3cqnLvxufNNCBkr9R8SRO/RQz6qeDxbllD8y+5H1XqEJDLHe
         FRkg==
X-Gm-Message-State: AOJu0YxUPaOlFmVJx6VTJV3E6wKH5MhOnoPjM9LyFRVMysTer/DEYTBc
	8BlD2xhAZzIKyb2UbNdAvx0Mm41jwyBqLghLpv/bRkic68FMRmgUtd0cH0kndTOhXXU=
X-Gm-Gg: AfdE7cnQCK2EhlMaurZ7n32srRLOG3QBxQYwH0/ngbxhGU1+1QKfyOH+H9FMs2fo/9u
	JAeNJYMGiXTZm2enX2wjkLf7vw4APBsd8eNacQ32zGqc5ACE167wY+1+xbCIYu8epoPXEXG5WuM
	oRwUb7/LH/WJNIPbxSSXhL2NijGkI5b7DQKZ9ywmnjaEj3+UB+cO6vrJbBnpMxwE7oh5bSvjlZV
	AQw2gRKxOiK1uuxSqBcLGyX5A6NUKai0rU4xeH/5qgajyyM7Of//StV3uiwyK2DxZ6X6bJN6+u5
	wTNva0LoMmOAxFhQZMUevTB9TX7h+XpVOUue+ZSZj/seIuGr1WYpvK/Gnf7qHgnilh4OcbtEUpD
	O5CN+viqYo1xWfGBFXSO9ijYjsIchM+eMg23aXk6Vhcy23x9V8gR2ibsVMHlwbpGjtfwO4fuA0j
	fvaZntTfjIYQDxgUtXoEaRbytXq+8lT3WqhckheZsEdx8oLbl2kC4Lw7oyjWBEaZU6762AoBTOt
	sZ1qA09qdsNVMhZxA==
X-Received: by 2002:a05:600c:a55:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493e68bef13mr21155325e9.12.1783509481596;
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:41 +0200
Subject: [PATCH 2/2] serial: 8250_mtk: honor DT serial aliases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-2-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

The Genio board DTs provide serial aliases for all enabled UARTs, but
the MTK 8250 driver still registered every port with the default line
number. If uart0 deferred and another UART probed first, the 8250 core
could still assign ttyS0 to the wrong port despite the DT aliases.

Read the serial alias during OF probe and seed uart.port.line before
registering the port so the 8250 core reserves the requested ttyS slot.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..841d64f6a707 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
@@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct uart_8250_port uart = {};
 	struct mtk8250_data *data;
 	struct resource *regs;
-	int irq, err;
+	int irq, err, line;
 	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
@@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pdev)
 #endif
 
 	if (is_of_node(fwnode)) {
+		line = of_alias_get_id(pdev->dev.of_node, "serial");
+		if (line >= 0)
+			uart.port.line = line;
+
 		/* Disable Rate Fix function */
 		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));

-- 
2.55.0

