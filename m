Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D0318EDA
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946357; cv=none; b=uBsj6lIj67GsMwgOMZemS48anjmFJ9qMkTD6f9m2Lm1J6n5yJo53X+x5ux3XVJCHyck8hF7v+xzWTWNul5ZQfVsmOG3+XtHqA/UtJ2L+JPv04Os+DWoKtLxF0uKNXVqdNOvp0F5cIxdf5jLTL5ZlCUrj2DW331gQ+d289h5zGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946357; c=relaxed/simple;
	bh=hK+dWBAA+DEcDok8uugHzVY5yaaIHZxlJhl90Etmrh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9xNvkL1rqVPeLgxjdaVjihCYNb/McJ7F7Y2gly2/Ny17tmM31KqKNZbRpkc9WLNAD1xCZNVZsfkfc80g+9LrvYnKMtpgA8A0GDy6Hmd/KWUKoKJ3AwltWLRvk8fnzZD4NnMUhpjkaRFdReRH9sP4eRaOtprilRHOthWgSjfRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hE6QDA9v; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE6QDA9v"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bda62f13d90so1292960966b.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946353; x=1780551153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJKsTc6hq+ggH0YRoZKQwr0T1aAAX7cAjmxTIIxV7ck=;
        b=hE6QDA9v+jbzzjLzo20zCiZNUj13uICepUmoAwVflfku4xrCR+2MbdLS9NWJzDVIou
         wekwO7fo4IFxXlm3bR/Vi1onpa+8F8HCHfrNcPW/tko5+0W92Jl3d7jAcZtjEN+4s30R
         jVIc326SWa/Gh6aPlUulPdrgMfHiqQpUdZOWwCIRd766LglN2LGCxjkglZtJqE/eUhwc
         V44ZSDzhklgP92Ok5uqxK8jGQFOXvSPeNBpswipuGZAXv+fEbGnEtrJXgzv0wcr72/e+
         X/Vl3SxTzdEb3JHtBqcqabKHyVBz/Yhwk8tqaxtv3fwd5o76XnriYYB4yFZH6Ugcf31b
         yyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946353; x=1780551153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JJKsTc6hq+ggH0YRoZKQwr0T1aAAX7cAjmxTIIxV7ck=;
        b=GR5kiawhzQ3hFOFWqjojNlLauayxyq+h2qzkHq6nQLFvmDapw9J8H56DfWIaG8eG+m
         /I/fYop7TF2pCGxFwKlqxX3/kiALMTEiSFQBWQ9oQGIzoXY8hHT/WuHgiYlg6OoYNX7X
         lfQDyP2ya1EpyZyEr2BpRqBMBWCLPVg1croZRVGkF8kjEsDKvxjGvGFgIcLOp/TWrTms
         kaaeI6/ERc+5wJJMG6uwIpzNQPtGNRXTeqX+dIJwVyhxBHCZsaYqT4dfc6C/C+r4Z1w9
         fw6RMAmEwebjXJn4LF8Hk91VihCoj3Kvaxi4vpn/JQfzNVxo+5A4JGnoX9f/of6UJtZA
         6gRw==
X-Gm-Message-State: AOJu0YwtVnMM2qKeKH1vz92vROwDrHkMA59RKkhpqiXio/+brUQl25mu
	8/EJizyKXIyiWLK25MPPgEIebCf+UhDSrgDnvfwg7qvyDPND5BhrUy4+
X-Gm-Gg: Acq92OHu7Cafn+SzL7cG9+wQLhJIqnK0LAZKisKrAioh0N3jzEb6QYJWSbNxngwBDdj
	5RfryzUjGoIqMif4VjGqkXDDv8SyhgQpbnZ2TwKIx7zkW3gFwfifKK9s8IRdNTRWFvVlWUkXrPG
	qRAzsNsHZ31uMXLu2BmmRd8vpq9DzLx3hIjXj3EaoXalK8QFHO4J42AOPZMEIuAwiajzx1lvGVI
	WSgywa+f2qNYAS+6C2vgNLtJWsY9/O51Nh6hFVysfTtLVO81/9U2iZJx+tQYPQ2cHe9yBmQP2dc
	3qTC7a4a9uG4+ftU9b+v/KjZ2sl++5wPIq7RNn7VwdzASMGkAWSiG3YU1/FCSI73P+l/bhH+3tD
	N+x+dyaN3HApUrl7AdBVEcWj7nYMl9+BUTtzWkASM7fJa1ZVEdekpz1HrzXZaLoXsx08xuZrkXc
	Rd8nkLzUE8z8I41mQA+4wDCBc=
X-Received: by 2002:a17:907:d113:b0:bd8:f771:ea9a with SMTP id a640c23a62f3a-bdd264c895dmr1593311366b.41.1779946352946;
        Wed, 27 May 2026 22:32:32 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca616sm693427966b.30.2026.05.27.22.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 3/7] input: serio: Add driver for ASUS Transformer dock keyboard and touchpad
Date: Thu, 28 May 2026 08:31:59 +0300
Message-ID: <20260528053203.9339-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528053203.9339-1-clamor95@gmail.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add input driver for ASUS Transformer dock keyboard and touchpad.

Some keys in ASUS Dock report keycodes that don't make sense according to
their position, this patch modifies the incoming data that is sent to
serio to send proper scancodes.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/serio/Kconfig                   |  15 ++
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 158 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 5f15a6462056..fad29b950309 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -84,6 +84,21 @@ config SERIO_RPCKBD
 	  To compile this driver as a module, choose M here: the
 	  module will be called rpckbd.
 
+config SERIO_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's Dock keyboard and touchpad controller"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y here if you want to use the keyboard and/or touchpad on
+	  Asus Transformed's Mobile Dock.
+
+	  For keyboard support you also need atkbd driver.
+
+	  For touchpad support you also need psmouse driver with Elantech
+	  touchpad option enabled.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-transformer-ec-kbc.
+
 config SERIO_AMBAKMI
 	tristate "AMBA KMI keyboard controller"
 	depends on ARM_AMBA
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 8ab98f4aa28d..fedc37ee102b 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SERIO_SERPORT)	+= serport.o
 obj-$(CONFIG_SERIO_RPCKBD)	+= rpckbd.o
 obj-$(CONFIG_SERIO_SA1111)	+= sa1111ps2.o
 obj-$(CONFIG_SERIO_AMBAKMI)	+= ambakmi.o
+obj-$(CONFIG_SERIO_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-kbc.o
 obj-$(CONFIG_SERIO_Q40KBD)	+= q40kbd.o
 obj-$(CONFIG_SERIO_GSCPS2)	+= gscps2.o
 obj-$(CONFIG_HP_SDC)		+= hp_sdc.o
diff --git a/drivers/input/serio/asus-transformer-ec-kbc.c b/drivers/input/serio/asus-transformer-ec-kbc.c
new file mode 100644
index 000000000000..6f10b7f1baae
--- /dev/null
+++ b/drivers/input/serio/asus-transformer-ec-kbc.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i8042.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/serio.h>
+
+struct asus_ec_kbc_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct i2c_client *parent;
+	struct serio *sdev[2];
+};
+
+static int asus_ec_kbc_notify(struct notifier_block *nb,
+			      unsigned long action, void *data_)
+{
+	struct asus_ec_kbc_data *priv = container_of(nb, struct asus_ec_kbc_data, nb);
+	unsigned int port_idx, n;
+	u8 *data = data_;
+
+	if (action & (ASUSEC_SMI_MASK | ASUSEC_SCI_MASK))
+		return NOTIFY_DONE;
+	else if (action & ASUSEC_AUX_MASK)
+		port_idx = 1;
+	else if (action & (ASUSEC_KBC_MASK | ASUSEC_KEY_MASK))
+		port_idx = 0;
+	else
+		return NOTIFY_DONE;
+
+	/*
+	 * The data[0] is the length of the packet including itself. The data[]
+	 * buffer has to be at least 3 bytes (length + ctrl + 1 data byte) and
+	 * must not exceed the EC buffer size.
+	 */
+	if (data[0] < 2 || data[0] > ASUSEC_ENTRY_BUFSIZE)
+		return NOTIFY_BAD;
+
+	n = data[0] - 1;
+	data += 2;
+
+	if (port_idx == 0) {
+		/*
+		 * Remap keyboard key codes to match AT layout:
+		 * SEARCH: RIGHT-META [E0 27] -> LEFT-ALT   [11]
+		 * MENU:   COMPOSE    [E0 2F] -> RIGHT-META [E0 27]
+		 */
+		if ((n == 2 || (n == 3 && data[1] == 0xF0)) && data[0] == 0xE0) {
+			u8 *keycode = &data[n - 1];
+
+			switch (*keycode) {
+			case 0x27:
+				*keycode = 0x11;
+				++data;
+				--n;
+				break;
+			case 0x2F:
+				*keycode = 0x27;
+				break;
+			}
+		}
+	}
+
+	while (n--)
+		serio_interrupt(priv->sdev[port_idx], *data++, 0);
+
+	return NOTIFY_OK;
+}
+
+static int asus_ec_serio_write(struct serio *port, unsigned char data)
+{
+	struct asus_ec_kbc_data *priv = port->port_data;
+
+	return i2c_smbus_write_word_data(priv->parent, ASUSEC_WRITE_BUF,
+					 (data << 8) | port->id.extra);
+}
+
+static void asus_ec_serio_remove(void *data)
+{
+	serio_unregister_port(data);
+}
+
+static int asus_ec_register_serio(struct platform_device *pdev, int idx,
+				  const char *name, int cmd)
+{
+	struct asus_ec_kbc_data *priv = platform_get_drvdata(pdev);
+	struct i2c_client *parent = priv->parent;
+	struct serio *port = kzalloc_obj(*port);
+
+	if (!port)
+		return -ENOMEM;
+
+	priv->sdev[idx] = port;
+	port->dev.parent = &pdev->dev;
+	port->id.type = SERIO_8042;
+	port->id.extra = cmd & 0xFF;
+	port->write = asus_ec_serio_write;
+	port->port_data = (void *)priv;
+	snprintf(port->name, sizeof(port->name), "%s %s",
+		 priv->ec->model, name);
+	snprintf(port->phys, sizeof(port->phys), "i2c-%u-%04x/serio%d",
+		 i2c_adapter_id(parent->adapter), parent->addr, idx);
+
+	serio_register_port(port);
+
+	return devm_add_action_or_reset(&pdev->dev, asus_ec_serio_remove, port);
+}
+
+static int asus_ec_kbc_probe(struct platform_device *pdev)
+{
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_kbc_data *priv;
+	int error;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->ec = ec;
+	priv->parent = to_i2c_client(pdev->dev.parent);
+
+	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
+	if (error)
+		return error;
+
+	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
+	if (error)
+		return error;
+
+	priv->nb.notifier_call = asus_ec_kbc_notify;
+
+	return blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+}
+
+static void asus_ec_kbc_remove(struct platform_device *pdev)
+{
+	struct asus_ec_kbc_data *priv = platform_get_drvdata(pdev);
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static struct platform_driver asus_ec_kbc_driver = {
+	.driver.name = "asus-transformer-ec-kbc",
+	.probe = asus_ec_kbc_probe,
+	.remove = asus_ec_kbc_remove,
+};
+module_platform_driver(asus_ec_kbc_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-kbc");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer's Dock keyboard and touchpad driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

