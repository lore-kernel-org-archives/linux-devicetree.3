Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5078477998
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845862; cv=none; b=gBqh1KyZWgjLE5eP3ZiIOsb7p1aVOiF9RQXkgfjChu7WmyvnaE+VDk2AXqRrV+f9DeOEJkA8IRQMNEfGTG+7ire+QUj5MNF1DUVetEvDbCIaAQ3UouarE1pALCDhoceSqSEeg6orY17HMJRxkNRsxhOgS8xvRfpwJyakrkvbaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845862; c=relaxed/simple;
	bh=zgdW6+r+x1rBS1+WVhWuLw6rj90vBCLZ2HVd/YgdLbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdBgI+urRBkgmdKW2BeSQDB3TBE9TajJnVBTVbnc2F2T6Sr6qxqb59Fe2Q51ytfInT5GvR3vku901uvMIvCN9yaQdO9x5E8emfD6GPYKhu9lTy7EsgGBRUxWgO7NZ0KAdnqWAIrKPhbFR4yRFepYBsCRcnJS9QZfsys4hc+fNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=zl/Q4W04; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="zl/Q4W04"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso3488513e87.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778845859; x=1779450659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCJHKBX1/2/0XhVxv+J3PvII+iORt4DXAiiPbyzOSnM=;
        b=zl/Q4W04j1/UkkcrkxdxzzSB8aX9a8qKDWaYumJ3CXiUoHHOfihCEARVUMrjr0gBPZ
         M0EnG8jPYLAASuRN9R9wrICcxJlVcKhkQiLufcoZDlEtOl0LyIl3+mnLCl10kIDoBHtr
         c2Rcq9aCq17t9gXHuiI510xuExXgmPn8TYCCkY1p+n8mGE9c7YKBgvLrDngMH75zuiwc
         NUbjhBhP5xLqM3abw+8g1NMU4aAdWLLR9ggGkT5kK0IZ5nij4o3q5Rg7P5EsdG8FWim6
         Wcs/nX+9Sn5+dOZwFAtAVjJ2u+PlO9z1kZmUJtrlHTEY5gQkydg1Kj9wSmjZWIQmLcUo
         I2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845859; x=1779450659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCJHKBX1/2/0XhVxv+J3PvII+iORt4DXAiiPbyzOSnM=;
        b=f9bgwawKWNkhApMswa+0r6DbcQbMudatGNAAtP016SkZwnvwbpJ+7pyh4hNwTxOqYd
         Tbfa3xZUcCaoIxLOxkmCEK/AdZ6zhziGQzcXyX6C321Luz9tHDakvKsu8BKDL4D5j1+J
         g6uV+Fd0QC32HJQJZ0A4aoXPHsTrgv7R+ATd1Qymec6ikSNhSgfjmBs157RSrivU9+iO
         Jc0xQz4LMjpKijMrqJCinVAvv+nOAQA9tEcHYSb02NYV0yT8knb4geemcM0SAzQoJguB
         uE3tBQdYpdeCDE39dryFL2fe0NgVVPHFFMuaoeHLaphPaaBlyZmnk0m/ZbsHzyOCsO3G
         DQXg==
X-Forwarded-Encrypted: i=1; AFNElJ8N9NSm6FC4WNJYaVQSWhKQd7yQ1A1yWYFF9Z0EPQctxx/6IRzmb90h43wnjkL0w2thDBBP5v8Io2U+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ogx/I/eksRy6mSqi1SNjkuaR0+wOAtU+Pn4LkauoY/XMiF8n
	2MYvFCAXVKbPHoGm3hG5HN8VsatP/CmfXStpwMZ90rh9gcuSz3RXcYG5xsCnyyG/EBI=
X-Gm-Gg: Acq92OFcdHinHU1vZcLZapKsJA4IYU+oQ9tv2BQHg4WteJfvTk4dBsx47nJm6BPO7hd
	srQol5LMQguHb6OmV23OIpapDY0J72yrAQT0OJ8Dmk2fQGwQJsgzpu3MBKoFRFxmexy2Ve4rpYs
	jBCo8+znKYw+Ia2aLhzUTdDrVaslYKFBRqbH62fFhciy39vTS3Qs79KdDJyvT5zrrEXMEsJ5Wh1
	i64/S7FecYe+EC942CJ7yA6Gmt+jbvsCnthLfrnf7uqW8cppYo+Y+t0MNGFGlGUAKZMr9ELB9XJ
	e8cNecsG8iYwF381Vls9syweM/6UNg007OpcvpXhv3Xp4+tx4Bh9ySW72CQEzQbwCzGIBWmsvku
	DqcdZ9zOVlwkIbxtwXiQnqIJ6JLN79vbCrgHmcJQuJyZyot1F1cBw33auvhWPKjSM8kkvZ40cjF
	ZayREDkP3Pvd0uhZRTA/1QM8zM04IWx7brj0a547/8wh4cEmlr9nH9JLmsdyA8IgyC5ivzGKVDq
	gFaRBqPbrcHrS6l5tdApg==
X-Received: by 2002:a05:6512:2393:b0:5a8:9511:b906 with SMTP id 2adb3069b0e04-5aa0e769bc1mr1119872e87.33.1778845859201;
        Fri, 15 May 2026 04:50:59 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm1278617e87.41.2026.05.15.04.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:50:58 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 2/2] net: pse-pd: pd692x0: support disabling disable ports GPIO
Date: Fri, 15 May 2026 13:50:01 +0200
Message-ID: <20260515115050.691119-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115050.691119-1-robimarko@gmail.com>
References: <20260515115050.691119-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Marko <robert.marko@sartura.hr>

Microchip PSE controllers have a dedicated disable ports input that like it
name says disables PoE on all ports.

So lets support parsing that GPIO and using the GPIO flags to set it to
output high by default and enable PoE on all ports during probe.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Use GPIOD_OUT_LOW by default so that DTS reflects the real active state

 drivers/net/pse-pd/pd692x0.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 4a3c852780f5..6c5c5a26bbaa 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1757,6 +1758,7 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	static const char * const regulators[] = { "vdd", "vdda" };
 	struct pd692x0_msg msg, buf = {0}, zero = {0};
 	struct device *dev = &client->dev;
+	struct gpio_desc *disable_ports;
 	struct pd692x0_msg_ver ver;
 	struct pd692x0_priv *priv;
 	struct fw_upload *fwl;
@@ -1780,6 +1782,11 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
+	disable_ports = devm_gpiod_get_optional(dev, "disable-ports", GPIOD_OUT_LOW);
+	if (IS_ERR(disable_ports))
+		return dev_err_probe(&client->dev, PTR_ERR(disable_ports),
+				     "Failed to get disable ports GPIO\n");
+
 	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		dev_err(dev, "Failed to get device status\n");
-- 
2.54.0

