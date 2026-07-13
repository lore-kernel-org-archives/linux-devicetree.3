Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E1394490
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928794; cv=none; b=qdORebBu7/t4c14kFxfXahXrjXcIYium1L18nmZcV/RfVYEgDJf4yAQUvG39BngJ4VpVLMlZEgh0G5I0hJPrv98XXwPSacvc4xpKpwUUb36XbLUjKSeUbyqGJx2eOG12I40+jEOxp/0y5NX2aKsjBuziAsg0HWCYdEA28/y2sAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928794; c=relaxed/simple;
	bh=qNUzWMILPAZO0p4szJmpre9sZOFFrs7wKaz01ErPF64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5pll7kOKVFFLH6eZZkMc20JDv3yxPSNSzX+ujTIdgVTTS//XUjhbTN8WkEnHKGIvXgjTit+fTVZb9uDbz5EMLRDhMA0eD94/t3+aDFOPinzRukXlzAA9gr/5T0SmG5boirM/K0vtScUPzX9CXQTSwpqJfyt1rMWycLZmKUcXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeYFemyg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeYFemyg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cea3004256so20419535ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928792; x=1784533592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqLWa6qOCBXZnPyawtHFyqbZUfQTxYgXo+F6hxou6w=;
        b=JeYFemygWih8CNTk/rn7JCSEDqhYr5hIReKF/CVYGudemfie6i/5/ocI1VT5xBdnss
         WFSG43PSUuqSsMExtWsTuI6/HGG+ZmKa1yjtYN+D3fxsMZEkTQA56Q3l8uhRsFurDaDT
         MqTl5MaeVcjZBE4rdLPVhRoBKLBopOgQkFReMibWk7RTDio5Q2lps3sR3GNNVdgFs9Ht
         mRtwfbq6vF/2vmX3iQlBcHzkgcQXaq9vtagxTse2ixEmycZdRtwci1VwXYhju6A8+VGm
         MHb21+WCUyv85EYDVKE16yj0EfOVE5WkSWQmpoTyZ+WpeFOafVuSSIy8UGzPrMH0vdCO
         Miqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928792; x=1784533592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekqLWa6qOCBXZnPyawtHFyqbZUfQTxYgXo+F6hxou6w=;
        b=SZ+VRXgFdwCngZz6PXmx4LY+s8YJq2Pfl17Yy7+AUT5itIB1+B/ab8bzrHNEkPZJm0
         MtPSYiy5pRBuHNQU1PacgiEWKdSvelKOIh2sGkzw/27vXi+g3Vt//0Xt66UVpXwPQLmi
         9Al44RSwui/qd09xTa/c815Bt0jdYgLRiLiD7oSoxSAT8g2U8XL+bNfx9ZgzJ72mjkEk
         HXGCxcs6OKUscomeJPoy/C+Ona+N0E7cIRnSaqWjAJd1x+6TXwmIinLuy6CqDADvf65f
         bjY8Jz7t3t8niAQTozHhYeUps+Dv82MnI/ugljGeOsl7wQIgaaxYQzbJHRkMU9xsYcBS
         7idw==
X-Forwarded-Encrypted: i=1; AHgh+RqSj1unQLsR4IxZIPmLnI7jCXsN5QTmBvynQxnJyHENCM9RAHiKoVp5BKQXikV3iI1JZLYuhiUFoY7C@vger.kernel.org
X-Gm-Message-State: AOJu0YyNNrSqoXBFZbWtLoyNuaPZuKMRq+VXbRjdqeJ3IYvJ3vEDlBaj
	HV50va/gfadkC/BGqNnsxGkQkLpkHG8hjbi0ChruQ1VGZxfAusslECAe
X-Gm-Gg: AfdE7cmat7W8kgUReZmp21O3KEBl7n7w0C/RnLrN2Pgbn7UWAy41odBijEangQ+nVTh
	YFtTA2p9isRvn0NrenGkGm34LcJbPHJkxixn8Om9QvwfaSC6yLdDw6dsBgZYNjbHsUDJngr0T/E
	/VezUspxt+ICcuZe17Cvx9tW9D2R9EDtFnlQEv5ce8me1AW4Iizv3HOfc1HA63uqcKdaGugX0Z3
	SeRvxR54iGH6fHJ4MKqDXV8HxR9BE4OrplQfPeV6+t/cOVmtIXQo9KS6j0lSrKgvlbuPPeS8zgl
	jDizM40b2ur3GMm+DV7Z5X8qwWmesWFGX1gxnATSGWxJcwbjv2Nfgy4bjxWv6JrHrRiVB6dpHTz
	U1QjRkQian1DnVuJnmCQWJ1Wk2+2ES3ljfuZuiEGWRUZSqYq5WhIFg8LIIrjX4T25cup0BZFquc
	ZDVz5dBFNA56K7LzCEJjHUmQ==
X-Received: by 2002:a17:902:d988:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2ce9e9ac01emr86979945ad.11.1783928791635;
        Mon, 13 Jul 2026 00:46:31 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:31 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Date: Mon, 13 Jul 2026 15:45:58 +0800
Message-Id: <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an of_device_id table to support devicetree based instantiation
of the supported sensors.

The devicetree binding models all higher accuracy parts with a
fallback to the base part of their group, so only the two base
compatibles need to be listed. The match data distinguishes the
humidity and temperature parts (SHT3x) from the temperature-only
parts (STS3x), which require different configuration.

Start enum sht3x_chips at 1: with sht3x equal to 0, the OF match
data for the SHT devices would be NULL, causing i2c_get_match_data()
to fall back to i2c_device_id name matching, which fails for
devicetree names. The devices would then only work because the
resulting chip id 0 happens to equal sht3x. Non-zero match data
avoids relying on that coincidence.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index c2f6b73aa7f3..6d47cfd340f8 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -61,7 +61,7 @@ static const unsigned char sht3x_cmd_read_serial_number[]      = { 0x37, 0x80 };
 #define SHT3X_MAX_HUMIDITY     100000
 
 enum sht3x_chips {
-	sht3x,
+	sht3x = 1,
 	sts3x,
 };
 
@@ -939,8 +939,19 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)(uintptr_t)sts3x },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.34.1

