Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9191F3CF692
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138039; cv=none; b=fdRYGjRfCL51tWoAnbtJC+w+WACyieC/sg7t8Xo2u8mDmoswSNstThxgDJ6e74Rgcp/zUPI0mKpdamigtmROGjCv35qBBRM7QW0i96SABVhl16XynLN+OwGl/nrL/6fzQ2N9nEsq8YCmqPISNldQCLJiy3N0elwyhLJBKNvufuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138039; c=relaxed/simple;
	bh=UUW8FDjbH++M+5cnKYL0HCr0Tn0/mkah5SLd+++eEF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrZnHiwbNJ5Bq7xFElsbtM6jajC1paZRDgpSmlXFxniOrEaLL4OjoN59iGpIzeVINvIvwHL6IANcNqXqZbGeNxahq8KDxmD35ujrBgem5kwjGwKb4xMy2V5zhJtwljL5EAhkj6eftj9Bni182NXVKb/mWw0Iujyf5UctNUqpF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jW6AhHqP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jW6AhHqP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47362928f65so2237893f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138036; x=1785742836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=jW6AhHqPRQmNxEJSDIzJa5B0bNbWbCSQyVsuyGbdql/7mofBMKGkKzvJO5lhFLUtSn
         eVySjXSvnazcKlrGPu1V8KVtWFcKELy10sUXWv5JyxA8Bvlyezj8fqcmNNsIpmrf37AO
         LsikGzs1ozG846MFe+yYxMFaS2vDG8hAHxaqolCMAgHfJOGGmbXbHW5/SfALOEPBVtQY
         Q2IXoo11FEBooATyGPKiTfbeU+GpHkucD78HeqkPGaaFMbamNGLCUFf93PRRxG2Z+906
         XTNrcwfFUyYbaxslL4Q+8p1iK2FNZwATCt/hZazcNddnV7bTjLz1WusbqCEJ9BkxaOnw
         9meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138036; x=1785742836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=qWf7O0IJA7sBaILms7br/ZBEo2270RePD7dYYhE71Dc9PueNJPCm+R2KFfN8DzJVKB
         nbyqfxt0ZLusQpmxs7yCNyC7nyT0PKdXPmfraUfj5cBSwzmT4JMJcGteHqnoB+Cu6goY
         /IY7hFQlEH1KbPmfQ3N+dNI8ZSMzyWfyQdzP4B+6qRYRMosRqeWqQn8yJynG4pCaMvdw
         2feOoxZhaxf16SNkGBnmlCoIgLOZbiF2QgAlP5Cl07OVqPMgnP9fveLYHflz/XdhzWEw
         bMmj2mPIGk9J5qWXQhGhQHjDVnFfvzyHP+OwLIuQ1kuTqweLP3OjHIM8OnQEain3RkEu
         GHfQ==
X-Gm-Message-State: AOJu0YycMWZuABJfAcXyV/EKGwKY30phabP6VfwMoLB4Z/RDXJQLhEKL
	uyYqrFM+sPFqKt9TTJ/56FAe3cA4BUOxf/vw2ICMxUudNFJ+0BH0vRipDeaf1yVUMwc=
X-Gm-Gg: AR+sD11Zhq5NpISic5dhlnX86AhyIGtt/iXmcM59iaHs5vLpGBKkwPN50dosgZjTmE0
	CQ2ur2nbieSGweZAKXNexuWioX+jEpUcJD/5sBr0J5+PCGbm8jk7TtjUVuHhEOZaeBZdIIhP3Sh
	TYRml5Ub8JtX2nVO9YufBA3mAWDCY540U2PovEAndX5vl2ZqfEdYMOjkmdJJbdlCq5ErYj98KQN
	tTDvdWQEbNyI5856iBo5rU2xqgWhHDz0CYWs1wz8nvnlbTbaUZlVUYWg1tPP762LOhlu7HbYWe9
	1JAWLeWqgv5YEEiOYoyXumeJgdkLJFlw0EDGvnqhQfNATYc3Yym0ZplaElkPfJhkaFBZ7jUmmtT
	0qjCvS3kTQd5HUm/do6LaP4+Dp2cBvSufKDK9GHJMi8gnnQZ3ixXeymXSnLXlD6+N4OCug4kRdb
	RjdcDyqQYR0orqxLcLsBRlFGsCwR7j3GjGaZ0D1giF70srGZShwS5Sr5fxAKZaRMQWjDOG9DcZf
	eSzmOMLfn7h5coKXMoHaIWT6w==
X-Received: by 2002:a05:6000:4382:b0:47f:45fa:98e0 with SMTP id ffacd0b85a97d-47f9febc7e5mr8981992f8f.57.1785138035650;
        Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 09:38:09 +0200
Subject: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
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

