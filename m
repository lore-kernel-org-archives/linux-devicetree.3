Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086038;
	b=4pppG96wjgXQGL3CuOLRFPkITA8xEmez4JMm821a6lyO96zrnAw75b/UKII0tvivVcvy
	 q0SQoJnelPEL6v2/aYbtd5uOx+w5N+4ZWneaKRZ2dCYZAAbVKl3aS9s2/CGB4s3tScXj9
	 3DRbziwfAfqmESJ13xq5zreIYuqK3b8CHAVRq7sbUqovbSDAncVaYr0RmPM7BgBPTWX4W
	 mt9LXtYurIVgZdPTfxjqySW4csADJXKxy84O50rq+mpZYK3FfwDOtZ2K3r4VmiCz7KHLD
	 V2plasnZT9iZpFtnYZI8yByCTIUkEwRjII1czC3VnddRFd+FIDvuhrVAwQC5/6YcFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086038;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=;
	b=0Xefdp/SzNqyBP8IWleLIkHCv+tdCpGBHWOsgSM0EYdsO+To4mPEFnw+hzrD6SRBPBIr
	 lGqLzJi7zeXYmom1Ttevj0CgxFJxnY87EEOXl3JbTWAP71Mdkwll+9bvDIsGVIbzD96+i
	 WmCgFUYQGvLK5ftjd1QLvAISMlzYShn+KL5NHw//Go/V/Ts9CNbQLAr0yhYE9K1pFw0Jd
	 8BY8aCuee0mmDUzygDZxGqLejbzW5Wu3ZRsGylm8yRTn7Qfk3uthvdIB8aun4Z8TMCMcV
	 4oLukw2RcF3JDwNLoOw9zVrEHHTuzZ/58vEQ3LsWvxyzeCcJsvSQ5/fovMmcLo47iJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZI0ZBnr7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE8606A320;
	Thu, 19 Nov 2026 11:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFE8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZI0ZBnr7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3882D1A170E;
	Thu, 19 Nov 2026 11:00:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01DC060237;
	Thu, 19 Nov 2026 11:00:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D5A11BC0ED5;
	Thu, 19 Nov 2026 12:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086033; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=;
	b=ZI0ZBnr74DvtuFdI0t1iSYuANqwPuZZs8/7yPwybnvmZkD+2bqra+NXMQeYNgl/pEwPTn4
	NbWRHXsDu012v6UoGT2GlL3j5wuiDR2Mbr6MD7spoZubyuUSs5oy7pQkvER1Ic7gZXfdiQ
	ZV0Eyi4nmrogKX00d6wcEHS5JRc7IRcDvAwblO1U2y4oegMJfYIOxqdzLoSD8vjbdrCFQe
	kpyDhDHN5ZikR3adV2fP31LgjPgPXGpZr2C8ZmTcYXyNhg2b7vxIzVI0i2I0GLREvcg848
	hmBborznpZx1Ya6jbbZxIq+SVvcqw5wHnjeFwr8T98ArmSCCzuNwMXn+wNt01A==
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
	Herve Codina <herve.codina@bootlin.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v10 1/5] bus: simple-pm-bus: Avoid inconsistencies between probe() and remove()
Date: Thu, 19 Nov 2026 12:00:07 +0100
Message-ID: <20261119110014.582363-2-herve.codina@bootlin.com>
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

At probe(), operations done depends on device_has_driver_override().

At remove() a call to device_has_driver_override() is also present to
identify operations that need to be done in order to revert operations
previously done at probe().

Nothing prevents device_has_driver_override() to return a different
value when called at probe() and when called at remove(). Indeed, a user
can set driver_override (or clear it) after the probe() call and before
the remove() call.

In that case, inconsistencies are present between pm_runtime_enable()
called at probe() and pm_runtime_disable() called at remove().

In order to ensure that pm_runtime_disable() is called only if
pm_runtime_enable() has been called at probe(), use the devres version
of pm_runtime_enable().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260630105701.7D0471F00A3A@smtp.kernel.org/
Fixes: 98e96cf80045 ("drivers: bus: simple-pm-bus: Add support for probing simple bus only devices")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index c920bd6fbaaf..4322a778e801 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -29,6 +29,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 	struct simple_pm_bus *bus;
+	int ret;
 
 	/*
 	 * Allow user to use driver_override to bind this driver to a
@@ -66,7 +67,9 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
@@ -76,14 +79,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static void simple_pm_bus_remove(struct platform_device *pdev)
 {
-	const void *data = of_device_get_match_data(&pdev->dev);
-
-	if (device_has_driver_override(&pdev->dev) || data)
-		return;
-
 	dev_dbg(&pdev->dev, "%s\n", __func__);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.56.0

