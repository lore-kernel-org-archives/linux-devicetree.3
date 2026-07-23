Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73031429CEB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799619; cv=none; b=B3TbAyYwWFF98W3PUj8wn0RiDJPGOiHlbF/ZgYevTQyDIUk39IS4zwlZ6Eu4uiGOlAtsbjzycghP6Nd8TktIKzqk5l3ivM/groSYb2VCpnPZQz9pCjLWGvO4jzMVI4hLJ8jLKnoKe8F//Wtp2CK5vfIVje5puo29VefqElOp2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799619; c=relaxed/simple;
	bh=XTMjyn+ORwg/a7Efs4utC9VvgtsOY6Ae6mRbx+tRPr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EG02VRhueW9+gXtresFCA5R8XGkAnsBdG3MEZ5YKPtMMqeVhVWWCEEwVCrT2tLoMWl9THrptZdpiXy4yOwekVHAPLOFfzS8oZXMRIIL44dt3gI9IEN6cUowd1Jk/vuqBaiHPi04OgR0ucQrIAuXkqSHE5QbRLr9Bdx5VrNGOB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=il7B3sY0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="il7B3sY0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso2811775e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784799614; x=1785404414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeewQmM2+FoXz3FOSyBPMuplKaD/0MTIgbyaZFmgtY8=;
        b=il7B3sY0yUkhxZiegNSdF8RDf3+z+4zoT3eA777PyfJc+jFP7gh9c7cMTasxOQ6R/C
         9wZaQo3bImyLa1ERlWi5t41D8ePhzKygK8obk1b8LVItJKvbB30TaZc6EFRNoIS2AIWc
         TyNZAmeCbFIDXJsM2UrUzNW87iIGGp920JUX/QDQD6lRbEyxZYpNmbQzMK/PR3UE6kpQ
         YhOVn+FaUIWJL1x/E4KlQnLGXfJuzZP/ByHxtIUihGqd85FjlxG+DnNylU1B7VTHfwCA
         5FaOlwfIVGMsYbs88GIJ96o4/jEDDLyFhnVUI3iLq2hxLx+aHB5gO0Z5OvHQIa1NG3fU
         gWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799614; x=1785404414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeewQmM2+FoXz3FOSyBPMuplKaD/0MTIgbyaZFmgtY8=;
        b=CHoE/ncRp5qANUJQu9bjKvEigX2FViN3Igwms6Ln85pDVYwf/Dqwkeb6TTpS+w6zRD
         yfBa2icK5YUFStdlqcX3YDJI0xFsoxvMGlex/WMZ21+/mmtnFPfd9dUI9XE+8b5IY4x6
         wlIiFxjCSVWn76DYmwOwjXzFxtVaQVUARuteiUJJ/li0GMkszBwPW3dQNEeAR37/M2+Q
         88YDR4TJeNyp9uOUOBMU4Q9l2z8m3AgSenKsDnY/m5T8Sen7NcJsia6uRaNb5OUEPOHW
         IO+FKb0ciELyCAxu9GF7aUE36O3UiNXfuf/k2MOgAnkGI7xe8CxgDo8iYKRI2zOG5p23
         DjjQ==
X-Forwarded-Encrypted: i=1; AHgh+RouIL7lslJbmYat1K4q3vzaSkb7var9vJLrMNbZN1iA1PBJvNDMEWjxa2xwRwaLuvtg3j5ho6DNfWU1@vger.kernel.org
X-Gm-Message-State: AOJu0YzTreUPmVRrQ7n9foBsUZDf8gPkZY9CZv+tHSMIGFK6c2+JBNd9
	tQSJaomYHTekCZMqomtuP8oAAgO7c6gaEIeGip7jRqHIFa4bKj9oADXsFV5uanMFZDw=
X-Gm-Gg: AR+sD11diLbB9C6xl9Ik6aHS4zNQvnlfmqvOqC7kbQbv9kW5WlT6iOX6qNzAMhg7u6S
	Gg4ByWQzPEVSeUpDA9mA4Wl0JqpVcWtGI8o9C3QxRhq/8juJGy/8SRkVjGH7cPj39NHrwPY9Jac
	MASNkUtADFEWfNjbPTVljKi2/HMMURsN0Je1iKuQSLOZ2O6VX/sQNMPRxZBzIbmGUmp9ldwgKFy
	cy7NGphPWW1OQOI/WrzlTXqJByptCZ+23Px4lug34o9JCX050I/fbxutgkwVNwgW/bsSMjbzdd9
	TsADt747Xa9t/kZdmdOPebGUvdMTpi/5iEM3eMbITCWRlXXStjRYBE3QPZMQza1J06ob0+fxxzv
	YvYtYGPvT+B7Dkz0Xz7JvWrLCQpqHFAtefDYJ8YWZAiH81pg4BYvmcnEfU3pK2u+l/ybUpltKg9
	xc+XnCrp+bonaxKqN/0F3rMI0HZG02IsvA0EAma9qyme4QM23F+Oo=
X-Received: by 2002:a05:600c:8b83:b0:495:515a:dad9 with SMTP id 5b1f17b1804b1-49573cf8131mr24716895e9.37.1784799614228;
        Thu, 23 Jul 2026 02:40:14 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b030a64sm100986245e9.3.2026.07.23.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:13 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v3 4/4] regulator: fan53555: Add support for mode operations on Silergy devices
Date: Thu, 23 Jul 2026 11:40:01 +0200
Message-ID: <20260723094001.120264-5-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723094001.120264-1-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the PWM mode configurable from devicetree. Some boards require forced
PWM mode to keep the supply ripple within acceptable limits under light
load conditions

Support is restricted to Silergy manufacturer as it is the only one
currently tested.

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 drivers/regulator/fan53555.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index c282236959b1..85f46874eb49 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -21,6 +21,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/slab.h>
+#include <dt-bindings/regulator/fcs,fan53555-regulator.h>
 
 /* Voltage setting */
 #define FAN53555_VSEL0		0x00
@@ -389,6 +390,18 @@ static int rk8602_voltages_setup_rockchip(struct fan53555_device_info *di)
 	return 0;
 }
 
+static inline unsigned int fan53555_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case FAN53555_REGULATOR_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case FAN53555_REGULATOR_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static int fan53555_voltages_setup_silergy(struct fan53555_device_info *di)
 {
 	/* Init voltage range and step */
@@ -586,6 +599,17 @@ static int fan53555_device_setup(struct fan53555_device_info *di,
 	return ret;
 }
 
+static void fan53555_device_mode_map_setup(struct fan53555_device_info *di)
+{
+	switch (di->vendor) {
+	case FAN53555_VENDOR_SILERGY:
+		di->desc.of_map_mode = fan53555_map_mode;
+		break;
+	default:
+		break;
+	}
+}
+
 static int fan53555_regulator_register(struct fan53555_device_info *di,
 			struct regulator_config *config)
 {
@@ -686,6 +710,10 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 	if (!di)
 		return -ENOMEM;
 
+	di->vendor = (uintptr_t)i2c_get_match_data(client);
+
+	fan53555_device_mode_map_setup(di);
+
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata)
 		pdata = fan53555_parse_dt(&client->dev, np, &di->desc);
@@ -695,7 +723,6 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 				     "Platform data not found!\n");
 
 	di->regulator = pdata->regulator;
-	di->vendor = (uintptr_t)i2c_get_match_data(client);
 	if (!dev_fwnode(&client->dev)) {
 		/* if no ramp constraint set, get the pdata ramp_delay */
 		if (!di->regulator->constraints.ramp_delay) {
-- 
2.43.0

