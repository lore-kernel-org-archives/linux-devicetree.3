Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DF3CCFA8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079776; cv=none; b=lempJNnWLM1P7Vj3Su//y0IZ6G9zP5dGOOijE2O/Nn/STRfB1Gf6l4ZDZgEaE88hio84U76lB3V6jfSVaCBf/obygjKLIlr3PbDUt48ENzf7VWJLLompL4npPRiPDimsgUftGtn87IPNJNXFeJzH/jIxnIhIzm233ydLAk+cp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079776; c=relaxed/simple;
	bh=/CzTqVrHPhxnQw7Hy1iaVnDjpPgGlbej4Ff3rf0qhOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQkiQs74Uy/XRG0y41c+ijVYsCB3q3S/tBWaF3Vm/1HFQvT93yn4gNtF7+OoGhLYDs4Z9D6Cip6ezp15iJgLtPfqmwC34kXIkBHHvlU0BtJ2GIQlvEk2SMwnSMor0d0xXsuMVIYnxFE2eRIZ+ymFuxQf6whwHXd6mSVSqwCx8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W+p0SWk9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+p0SWk9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a69ba83dso342410b3a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079774; x=1783684574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJOQnYDmj56BFKnk3PptuIiEN5/cefcVZ6+liIWlLhk=;
        b=W+p0SWk9tyCegO7QtLB2ffoZjsSagYfx7OYaPgW2A19NlsvO76SVuVcXwSkQWC9KRu
         dgeezReLfqjhZ+lCFCYfFV6Vmuhs+rBPvr0Oocy14DwAB5CxfMlyj4pzQxp14io3Tt4g
         RGkSF4BZMDkzxFA3bVnORb0ZMQOc5piVT9nQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079774; x=1783684574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJOQnYDmj56BFKnk3PptuIiEN5/cefcVZ6+liIWlLhk=;
        b=Wect3OCSXPEdUMNVNfi/bHWm5PqlNRJ63pOMQxPjMTtIihPNygtrcj4xqKT6p9N1p1
         0EElRZz7sfdl7Mr53WtliIwmQNTmyTm7OiGFUeDhaZvOMeg53wsZptvlSngtFaDBjeIC
         aJNOSiMKotAMCXWqROzqRwNj36WYyXjGG65nFMDWdLm5yU3jkHJlWJa+UFmXcWehZ63Y
         DDEmmjWSoaoZCD5FQsrIU2lyHLxmlhsyWFzQX5ojXqkHTCll1cWSKxNC9GGJIKYYqL2C
         MxHAs1S026r/Oo5zcvCWplkIRjdPcal/6yN0D17q3Yet1q8V9t85ua1YnRu855H32L2G
         ts7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NtWlkkprBV8rqw3a6WjhgwN2YOJ3YEHWtM9G2vtojahx/NrKKHWogdNkPK3MNkf6iYtC7gBaew+BQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrLnelJ2y8JWH254I2MC0pk2q49UUawIQsIJTdxRTpaFD5RPG
	j8dL1UQXa+OOXcmAMJfS3wHUkIrwp1cpMhHjqzrFJ74kADEhqR3k/HAiTjfLm5EAFw==
X-Gm-Gg: AfdE7cmRU/1TOj7CRQMk3ziwtYIwKpK5uZ018ZworC3qHN7PNpSa7o8YDSffePRhFkE
	x5zC5GYmdXQ9VqmVJZINMWHxPtif/5XgoOiov4rCTmLZq2G7hYcqVsX+GWnVWCEIPobBjrHDx9n
	39lmLDz1J/4pM/erEiyqjKT/GDUQf15NkPf8Yt5vg6S+MIRL78IpYA3hiEVEBryBNCxolwhLlS5
	RbJmIuBO7qpobvXWD1dtSePXMwNAzFTLIwYttyelYdeV2eR5BJ5APTjMEVARnmrwPRQJwvEiLFp
	ZS2oAUUibn1IgjU0e3zqGF8g27NBxTnrQ4TxpAfwlT+sAGqkrmTgsRaUEhBvcEtA0pRXCScfk9/
	KEU2vg6VQ/fUiZY3CP2aKMjCVjNBUDT6wTJj3Ht9MCqHX7hmudFE5ZhbYHcdofLT/X03t4wweP+
	j7xdPR3M9sq4OuyynUbnfx46116qmG39Mek3JqZ+I1JWHmWghay0X+0w2Fq4DHXTIxxN9Ssg==
X-Received: by 2002:a05:6a00:cc9:b0:845:e23f:108 with SMTP id d2e1a72fcca58-847c088ec3fmr9998078b3a.42.1783079774322;
        Fri, 03 Jul 2026 04:56:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Fri,  3 Jul 2026 19:55:54 +0800
Message-ID: <20260703115601.1323491-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Add proper delays after regulator_enable() calls. To avoid impacting
the boot time of existing devices that have the power rails always on,
skip the delay if the regulator supply was already enabled. In this
case the regulator is either always on, was on by default at power up,
or was left on by some other driver, such as the I2C OF component
prober. Either way the controller has had ample time to initialize.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..db48d7ef8357 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -47,6 +47,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY	110
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1219,6 +1221,7 @@ static int elan_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct elan_tp_data *data;
 	unsigned long irqflags;
+	bool supply_was_enabled;
 	int error;
 
 	if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_I2C) &&
@@ -1250,6 +1253,8 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
+	supply_was_enabled = regulator_is_enabled(data->vcc);
+
 	error = regulator_enable(data->vcc);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
@@ -1263,6 +1268,9 @@ static int elan_probe(struct i2c_client *client)
 		return error;
 	}
 
+	if (!supply_was_enabled)
+		msleep(ETP_POWER_ON_DELAY);
+
 	/* Make sure there is something at this address */
 	error = i2c_smbus_read_byte(client);
 	if (error < 0) {
@@ -1406,11 +1414,16 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
+		bool supply_was_enabled = regulator_is_enabled(data->vcc);
+
 		error = regulator_enable(data->vcc);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
+
+		if (!supply_was_enabled)
+			msleep(ETP_POWER_ON_DELAY);
 	}
 
 	error = elan_set_power(data, true);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

