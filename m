Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B13FA5D0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253997; cv=none; b=aQdgregf0ZAx078fU7rHey/vrGRrEIbcd+FQY6eXFQ8LAQljFNaN0qj/SWIonNfDOwMqftoqdPbgi9L+aGew1Cvb8QHioVqMWVYq1llBRTQ3Pm5zhv8pQGagWk4fxwVRzbdv9a0goZ5N1vDS7fOC3ZCA6EnVwerZLuOo6FI2nXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253997; c=relaxed/simple;
	bh=8Qwf36rId+Ems/1eDwX4FkjrATBDA7Znl2SUcpy1ZKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klDrevk1V4YGGtYKXxznn2igEiDFRImuC+8NICY2ofzJ8abxdgGbGsT05eFsRvLjIplZOVny5Z0nhiI/XYd/E1M4FxkDuQl3QufQ+jOPJMViSlY6P7aZeQuLlFbIpa+F8gLn8C6TZzEScrxWxqIutoVHtQXLkQTqCncBQtJNrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQQf0al+; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQQf0al+"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5527372eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253994; x=1778858794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=gQQf0al+Ql9V8ivsZYRc9GP4KYBcCsvgTIgyDeuSEae7IsHOKlyQ4IfUc5Euslx4eJ
         WBSYsD6FzKaQWBfYutn6tqQRKqkYox/Te07X2cODbclAcIEHpixlOvB+Zl/pQR9m0kxV
         cExVgIaxzU1cqb15oWo5pvV7q5VbiYXn0GwpDg/Du5fcd9wDrMZXwFhrotsoPgg8X4se
         jJ6IfMRATVuYBUkaq/tp5d/QNeP8ySzZ/ixmLSm+aTvHL43WP5fw1OkB82KuIAuhUDfZ
         LffHzPkvMZNnx/9WegllhOxvECbIRV4kHXmEsly78Xs3AdlOYnYN0kCW9SGV6eTktOGD
         8uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253994; x=1778858794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=lO5aubMr/tapHEVbIcBYxojXRks6nvIw1HTg7xkmuuqvP6gIvM7T8QZHnkDOd5tAbP
         06JWZ+p3XI2YAXnjIqz7w+8Y9ULS8OdFWC0RfeXRmq6+T9h2ukmxwi8Dcaq4duXzdlPu
         +PfGoWBAsfX1KfCE6BIeHZyrzWzJdMhSaw/13HK1pviVRLKV1ZqDJQKfHZjGr6b7DZD9
         VJN6TeiHWLPOX8m5YS488mFCwVQRY+V4WqpXf55dRIDbFp0LAg+eIGDSW/8TDRtoXf4W
         GvPXO8Q/jAxVipqZts/j8IZzu8fTn5UrSGfcIjmb61Z3dfNd++CyGEDd1ds7UECAtQVD
         6GIw==
X-Forwarded-Encrypted: i=1; AFNElJ+j2YGBQpOJjG8W93YXZBbx6WswDt2g8sgajTxOhFsj9oeaFGWI/FbQt2lnEXF6QdZBgYPkVC2vGpxh@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXc9ZpyL52JfueKdUKVSvcCquhXQiGp5eyZLepF0m4HDNA1n/
	8J6WbJ1NNBhxz5jyVlle8YcOSEr4oz0Hh2sMsnN3HF2nVvJ6LNsdneGP
X-Gm-Gg: Acq92OHXcLkisj01YgFCzMekw5DwKD1SopegvXbt/73eiAI1lib/230xVUeDDiFFXPg
	mOmzK7Nb4HK1BrR0Idv7AdMdACT9l/sGTy0DnEZyO+O3njQ85rSBsMMlOTM4wNmONh3Js97TV7V
	0kbYq8IXBv6iYtxYeQvG77d00AuInaaYIYrmlOTzuedavUc5Tk3j0sQBJV1kMKTA15DOGzCxVBh
	SWiC23OABBzfPekviTxFG1oivIqkPnCie6oczAv2t7mGqTPL9VP7S+wAwEeENRMGwLaVCaWrd8Z
	8Pmj3KtTEQ6Qhp1vyChDa5JKSQdN4FBFybdJbquC30PVJu/ymOZr/OxkI88dd0wBfswaRPFgK0R
	LJagLvGxgP0SEyVPTNCS0fy+oem0QP3wM8lVV1GiAylJWMoZrFQuTN57oulxv4oY5Xe5ofie5/X
	R6pOEKsecNnb4s65fZFjzh8QO0AnO/GZektfU8Am6QM0ka9GU=
X-Received: by 2002:a05:7301:1014:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-2f95c2a01a1mr155628eec.13.1778253994365;
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Romain Perier <romain.perier@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Peter Rosin <peda@axentia.se>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Paul Barker <paul.barker@sancloud.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Fri,  8 May 2026 23:24:19 +0800
Message-ID: <20260508152435.21389-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..c947f844c756 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,7 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +506,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0

