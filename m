Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD519480974
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992862; cv=none; b=Y23vALtK1oKjpoJbYu7R5jq7BiogkduYz51iZPGqQ9JqO2Toe7BfuPLDW7DCyqfMpB6+PSG3YCa+uTweCLd2vc7vDswjbJTMUzPRahBp6mJlSkQx5Pc0uGGHoHf05xrVgDguRHKykmdIm5a5KcAwctjKQKj0Fqjen6IO0TMYZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992862; c=relaxed/simple;
	bh=E8KHLC1Nbi3NBLgVxLEsG0ZdvPc4VF3KSVAQfL9DEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaYQ6cC/FpeUi85+Ijt9MQHlkyTklQPEPiwutzI0SxVHPLOAWzC4GHwC0a+vNH9tmFXLdJ+zEXoZvu4vBJBINiFXQKcAqoyHcCwWcm6vYQCnIEfEv+fjGUFthfcUPQny75gHbNxM+ltNCd4EeNZUelLLgH+ZvRTwb7Sx6nRN4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYzHeq6W; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYzHeq6W"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3954294eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992860; x=1778597660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=qYzHeq6WNGys3BuA872VzgwybhvpPGYaROUhlO7m1IWe4dUrkdusnv8DT8rEvogWIZ
         94aiz5G20Xz4Gwq+ucWmuHoS+XKssjKvVi43YWnWkqBgojNzckLO0mg8XJ5YDxJbbFIW
         60T8IaxduT+dxGKeRxGOHC1EKHK+jyELnoM4Q/GLaYdrB+0RFBBGWsfjQ2Sv2DK0Lvwy
         XO71DB6aTjm6OFTC8qpSnG2ifXIuxmEpk2PtS6EoNuiJke0vEPs73mO9huu3wAFIe3Wa
         LguDHF5toSOK5Ry8kslPzLoghvw3vhhfqZCKSUz281Hwo2Dilxj7LzYYfFkNhD6WfGZc
         WJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992860; x=1778597660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=AAHidutsjhrCoUlgkEy1S65cWxDhoa950S4+INtMx6N3X2/Nb4+l/ea1UmHaDIHLd9
         IngYVBTe+IQseFBoM4LEwhhyVyGWDd7dL0GZ4Dlh+Cc8rSKvkfb3TwfvTY49xtL2RJNe
         rmlXdC+m3MWT3qkV0v55nzqpvpW16L7Vi3Hq8peyHNDvTaNlc0ssm7JpJrFtJhe12gtk
         664HZhk45Qfiv61FH6IVPh/TLT2suKXM/c5tVjWWWbqGp7zbDyn8rbRQhl5nwZDpd3Hj
         uBfMD/AAGMFYEmq1UqNRPYVnJsjPVbamGj6jzwz7WlrlMYJ2ESyCnNvMNKCYHhgYnnO6
         q+pg==
X-Forwarded-Encrypted: i=1; AFNElJ+OA5vjvh8IKJA4SEDsTpWwX2PtqBm1UPBMAr2wI2RWxvx1ozf55tGeQ8CWaHORybNHAH9T/3mQV2Fl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WL2z1yk6uPEmSKRzfnxI2dGvr0Juc5KboVZVtHPtoHuy8o6n
	A4v909V/49qeylpWO7e44WNvPFuYWuFHX0d0P04lPSjBauNmbQU+6xjG
X-Gm-Gg: AeBDietrQdA0tgt3l2ktX4ubOQ7qtmhnz/n27A+TB0Xt6VZBlDJBlchGftaaPwBg/N7
	JB4yXhH9jFLiOJ5GlFZ4UQ2sBef5AHABgQrjGWvjVTXVSXosrOSBEUkjw/CTIPw9nEFezH6VIKZ
	BbEQG9qtGyZdufZNlamV+zNjNh6BDmKbyrWQyI3mDsRt1Voyu3Oghr6prQdwg7gFmQVmH3ukqFz
	yOjD177NsoKinS6bGQfOa53rjtJDSHsPd+JHWo01g1zy3h3F6eHFK1UaWGCiNr8DZ6PI/2x12Ay
	fd937UgTZB0ARvUc+yfBVFSicUTtJJlzseGsQhMBkp9EluSUIZAH1ZUXzW/uHVHu5PPO64Um6Sr
	Yi23L8Bn6+qDI1aqH0TVWQ+qAdjQAC65f/u74Tk4a89O3m+LYQ2lIE24oxsMbVTlcweESCXMpbe
	20vUBn+JafS1a8n+PAzYVHSidnAU6EcuM=
X-Received: by 2002:a05:7300:bb08:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2f3ce9f2e5dmr1644089eec.7.1777992859864;
        Tue, 05 May 2026 07:54:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Tue,  5 May 2026 22:53:53 +0800
Message-ID: <20260505145354.1267095-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware shutdown
mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..57d779e07a62 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0

