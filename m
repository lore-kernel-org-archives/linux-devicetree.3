Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086047;
	b=zi0hY19WU1YDdNuysCHvLlLCxtmSnMPOb0VRcjmud2I0KC3LhkwGV0EezFUoiDXVF90Z
	 RzJY84N8h5KlIBp2sJLCRDuIBi7fimdigFw6Z7/g4OS3HzTcZ+J7kzN1IR9jME6vxmoGu
	 RvyX/CuUdiFa4oXYgAj4oLXWtbd0CDYWwClaRmBc+7wkDS+6jNy9C840ztsLuRf5ELE46
	 thlxNPaWAQegRNIrGmF/hYJ6HOEN+Ehl/97FrgdQJ/YtHefuqNvmepujxbWAMynE0Yh2A
	 AtjKO/JSA/bk7a2ctHizStX2Eq0i3bU8WCrP5j00BpKR/dPrnYD5yEH6aDtpCnxIY+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086047;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=L1YcTl/uYfFtLb4iHc/VuFExeEr6pRbLZWly8UMoO5U=;
	b=lKwwoiA2B4OR2CuyTmQo0DXvbiDndp7tkdgCRDFJvBKQRJhr40MC9CE2/QdfF+WqYxYD
	 Cym8aLzLowt1nwhbpe8o8ZAAvxct4EZivr8pXmhAXMloE69paTDO0yBAoxSV7mWIBoPiP
	 Wa5pwv4plgwxfDaWproPfuR8srkI63TZ887WIb+weJrz1/B0qT2U1ZALQS9nHT93D58BE
	 CGolHqUQmXHS9ODoTB5DMJHG7tolfsRRH76pcCjCojib5eOqE5A68nxiatzJKxKgWFWx2
	 dY5PiVFj4GUJ48imisBmqtYDzr41XbjczSy7IcU5VfIvJaDwXgHBwL50fhESlgzGupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HSjafekj;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E886606A324;
	Thu, 19 Nov 2026 11:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E886606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HSjafekj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 544CC1A1650;
	Thu, 19 Nov 2026 11:00:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 286FD60237;
	Thu, 19 Nov 2026 11:00:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CB4211BC0CEC;
	Thu, 19 Nov 2026 12:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086043; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=L1YcTl/uYfFtLb4iHc/VuFExeEr6pRbLZWly8UMoO5U=;
	b=HSjafekjddeaYVUifFSFc5T5ypeW7/EBd6uqpPFrocF2jq3K+kAc9a4q8HVkqzILmc9LxN
	EjMYyBHAaNHnZz9kj+IZaVZwKpcWMGhxa55fnABASK7/kqDUWINUZ0/ZQ8yAVlGozm/Vl2
	gVs92Hg1htoEP9bDqv+6FHss0vBMIHCdsK/rQ+69Vzd1umOvXoZBd2AkFnb2B8Y36/6YLU
	l4+ZPr9WhFYOqcpm4DT6KSHcrlHT/6VolYpUJhi8uI6qMgWuhOGXzvKvIKSsN1t5SHKJSN
	ycTyybIE8wP8a2p2Nn8KFXkNFgMKLF9r7ahcuvO7tmMtQr2T7BKA7NQ7yxOVCg==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 3/5] bus: simple-pm-bus: Remove child devices when the bus is unbound
Date: Thu, 19 Nov 2026 12:00:09 +0100
Message-ID: <20261119110014.582363-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

During its probe, the simple-pm-bus driver (simple-pm-bus compatible
variant) populates its child devices but it doesn't touch them during
its removal.

This leads to bus child devices present and bound to drivers whereas the
bus itself is unbound.

Be consistent and remove child devices when the bus itself is unbound.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 45 +++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index e45700156732..23ac18551fd9 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -22,6 +22,46 @@ struct simple_pm_bus {
 	int num_clks;
 };
 
+static void simple_pm_bus_depopulate(void *data)
+{
+	struct device *dev = data;
+
+	/*
+	 * Bus stays on for children
+	 * This ensure that the bus will not be put in idle asynchronously when
+	 * all its children are removed.
+	 */
+	pm_runtime_get_sync(dev);
+
+	/* Let remove children */
+	of_platform_depopulate(dev);
+
+	/*
+	 * Lets runtime_suspend() calls simple_pm_bus_runtime_suspend() in a
+	 * synchronous way before disabling runtime pm.
+	 *
+	 * This guarantee that clocks are disabled and unprepared before the
+	 * bus is removed in all cases.
+	 */
+	pm_runtime_put_sync(dev);
+}
+
+static int simple_pm_bus_populate(struct device *dev,
+				  const struct of_dev_auxdata *lookup)
+{
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (!np)
+		return 0;
+
+	ret = of_platform_populate(np, NULL, lookup, dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, simple_pm_bus_depopulate, dev);
+}
+
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
 	const struct device *dev = &pdev->dev;
@@ -71,8 +111,9 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
-	if (np)
-		of_platform_populate(np, NULL, lookup, &pdev->dev);
+	ret = simple_pm_bus_populate(&pdev->dev, lookup);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to populate\n");
 
 	return 0;
 }
-- 
2.56.0

