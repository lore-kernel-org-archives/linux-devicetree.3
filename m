Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2823DB33C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541843; cv=none; b=sEH3xj35iEscrcNdZaUBKPosycFLs2TgZXZVhm3WbnikHE7+fsQD4zK8h8jFjqAZBDWUCHJKzWtqJBlTUjLGWNE9WIeTr1xYmJ28n9sbLMRDfI7xLTiHyr0Yy3hn+YslsGMtccL7tpoOp+mrnPWQ/i7hprXyNxLG5XiQ3m7Eoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541843; c=relaxed/simple;
	bh=XTMjyn+ORwg/a7Efs4utC9VvgtsOY6Ae6mRbx+tRPr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kunGPvYANj15zNMd8haJEXaMyCr2c7QyK/EHXTD4/ccpli+1UA7RCDC/qKKvsZuOzC13Hw4dli5q09McP+1ZigqWRbs8+YEahaQUgJcACCX7CHRY5/phPw0VOnJFWRduunyZOAYI2P6ct3lImUDCy6LmFYQ693bzEoMUBDIdRUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=ffz99+R2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="ffz99+R2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so69069515e9.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784541838; x=1785146638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeewQmM2+FoXz3FOSyBPMuplKaD/0MTIgbyaZFmgtY8=;
        b=ffz99+R2zw3Pls1mxEsSqFUtKCRa+GTAq17+7m7CsUHxtkYmxr+q1I3S83ARNc62RZ
         H8VuKfRiem1I/DNfmW5HuzHHfjb01+AXTmU+zTB7ZxpKnbeqYHSQDCGvj8aV/z6LTjsl
         +bZHGjGOpAF4H/rlxwFNRwB1HjYDfmFMZ1jhPgdD8IIPib6fwEM1wIG5CPlrCsOwUMd9
         IVYFvYvqS0hX24WeH+pEzA7gbg8ohB39IXBlcHFBKACptAAys/EcRnrlvsWtTzZMKv7r
         kbcExgDeUjj2nHerYvvSJJvBVkQR31kd1uAofwWX2WxIu8QP0XqdCjQYiFiQLFBcO/pl
         Q7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541838; x=1785146638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeewQmM2+FoXz3FOSyBPMuplKaD/0MTIgbyaZFmgtY8=;
        b=eW3E5YJFmxmjgEa6Bov02K2F2LV87OJWreH6s63gKERB2SqgUg3Ur7aR9BTOENItXs
         /lExo8QuVUu4R390zSqdzgWZtG/YDtSGUmqapHVj0gRvOWNsdXoWJ/u5T2RuRZ1/d4or
         BEinGpq+RzQ+Mnh0dx9vieVBoUnkMobzrxxQNgqVr+ujcgR/35J9RjpcmuTmgZJ5g1k9
         HiE9FSlmozZqNUO2gv/tqXOS9GnhK6+vcs21fG8MOV/VRl8fY5Be9awRjgb8miXEsbB+
         F7hNqdz0+eKTKhtDD8Dq1a0jtQeaXSMq+jUQ6Ments6zT2GWGRMMf6J+WfCMRLCp8XWk
         90TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHMX+FJV4sY7qD1o8acPofSVoOcYKY0+Orf6lC5ypMPDUA1H4LWtolhRk6yVnBPPSNQlrTyOcqoKMp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2IQ0FfR+dKbitlcDH+B5SLYMQs5Ig4QqHWwwAHRJO48IJ84J
	tM6WY1cio5itWZuPN/W5nuGuY5hbctLoZR1efgChj8OhEk/RQ+VpEmOOQNyOZOLgqps=
X-Gm-Gg: AfdE7ckhUbrxD+WT6UrPCk4Lg4c1a4/CmHbqMrsRjJchhKM7rbdbPX0+3meGUo/EFeo
	7bgmIZpgcOVD6h47Mmx3mhLDduXKYIUvn+d/LstmIC5Pmg8wrCAdIgEoaGHVrgDpWNhCP4MG1xz
	P06K5AK7gS2h+PtlHXVJdeD9FN7flJgrDJJyEwCiTfwwYQqIePr2CUPLMwrHBEWzo2EohUlsJ4u
	IrkaS2N8OAwuATFIwYBrrR1P24DSeZity3fn91klSYZeSSHU2Ai/0JYVmuiNqq7AZvbuvGkDOYc
	RMeJe2tcAoN2kd05D89AIb1n+seAyDz7YNkYAzud2pP6h6F88vLsIVKFmF3FFPk4uakJ+Z5CAmp
	h908O28RNcUV9POOuubcxrGPeKs4Fs/tDE37UdJf7BXMx+rFds+7pPkrrQthYwj3bumb4Ez1UkV
	x0XJjJ2+7VgF5UQjITLiWFTp/kNmVRqj2CvwGQ7mbBsqfx8pjw8yI=
X-Received: by 2002:a05:600c:1d1d:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-4954a3d0d86mr135834695e9.8.1784541836998;
        Mon, 20 Jul 2026 03:03:56 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495516c68fasm191854485e9.1.2026.07.20.03.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:03:56 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2 4/4] regulator: fan53555: Add support for mode operations on Silergy devices
Date: Mon, 20 Jul 2026 12:03:36 +0200
Message-ID: <20260720100336.62004-5-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720100336.62004-1-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
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

