Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733321;
	b=ZkIo63WV2d10xZU2jdhqxWz9I8/atY9lkEOWkJCAd+PFshITxKqghfZLbdxJIdvoRCCW
	 M6I6PpBopR9/OLYumbAzjmtNgePn664YdhlmRSyHZvbPFdsf310DNp/GJ91jmOeIjcPrU
	 yotYnePuYns/agKuP0C202L3mAkyIikDkTNsBiuTSayMUgnygsEHz5rk24qBS5BZxsYJq
	 pbMOSOEdoYD/PwB4xF6Yq0O0VvbfFLl0zyEge/6B7+jUvdIhpHofroiL6hFHX5+WTk+oo
	 O3QmR+mQcsDGcFdBF+v854X9Z2zufsQtlO9PKq9r8lxX6i5SdTMZft/FRQqzw2vRv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
	b=4ObKPsjr0n1w0oxSRnM/Z8tPKsbHGuflca5VwYWXH1BtaphpmYL7eoQmR31oPdkRV/Ed
	 tLfiMFNh1aPSCn9QZg2zGujvFWjDpbjlbP5ITVs9PgPFigWe759dNhQB9lHrd+M5QknNC
	 zjn8IhgSNjsWK5YSc3h5sGszCs+2HrVD3oooAo13XaG43QKWfwZXSHlKvcIyD58Lk9uhT
	 EcrTCHKF6e2hGrDw4hasF2VTYtcj4T940FilDhaaNPDl0FXsnBAro+qQ43zC+XLUnSSmV
	 YTG6UDh15d0amG8LkfFE76ut1/Htwt0EaIullEqHj9hjR+ymWd9QMj0riw2jz57awgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNNHiGKv;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A3D606A88F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A3D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNNHiGKv
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50cc7540b7so48307166b.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733319; x=1795338119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=gNNHiGKvUgdaKK2FtN5sAB7gAUaSGuUc9+154Kg0i5W9IotmqgxUqVCNuAzu4azr2l
         wluagkfyYAHKAKcLegZKf9F9jBNE/TrzzXL/7g8MpmgiSoEALUZ2WtrAR+HABsjopD+8
         khbqQhpisvs726Mk/rFdPfM2GGvPL1ZE5fthneDILqnlQrJ8LnaIyfXryrbqf3WTprAT
         3Z8ckUJd5eiUDngR/kojstglXGvd0jtweFINC8hyavD0NmRlzrXWHJSaTvBNlZsrm7Z8
         jjIZ73C+eUP/yBr71karcUX48Nl1VlNKkKCC1cxtUeybnM0hayeyIZFQMcDQYmdpxqCJ
         Wi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733319; x=1795338119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=VOz9M8Ol+Rz0BisjqSUdT60e3P1xUo4tlPZToGjezgXqdOlFORWRyDIfGhY/gdOYuW
         +DFg/3zpbsKa5qJUuAuHljeg+B5dzVm3vAWccexl/Aua2Pwvspo+h8yrQMB/1OSiWS0z
         s/yj+HDcUGmmgyTaB0zo8ZWHopejQEfkLsicxjWWQ3R4zaIuQfAyik+MmtwM7+nWh6wt
         jS8tq5XuICI0ebhNc0NhNwMLpKL9GxIh6M2yUHM23M36kSQV8Dc3SMZ3ofFBAxPmUmpE
         gROf0EXoEqAPKW0fZrZOp33ZFtkCewQlC2dy0WURcn6ODNEkcanUv6UYwzj/RADrHsrZ
         T0Hg==
X-Forwarded-Encrypted: i=1; AL+hErEf8hSJPCRh6ou6bxMaocr3bJJxcVN+6idX5j42QMvkfrsDc1nMDKFzTkUdPi4KDdI2NHYSCWXdu4W7@vger.kernel.org
X-Gm-Message-State: APuU4Z+ziOiTE7s7uahstqElgqz0lbuAsI9CUr8fxPkgfC/XKomyn6fV
	G2h07Le/3GKFJral4qdwTfWoh3HsUmG54U/Sf9eABywrGNLHXHUpMz9w
X-Gm-Gg: AYBFou2pCk56jq+7iEYWt9duIWaz2WWFs1cTnlchEzu0n4E27X6H/nxdmEpFNDtwsaN
	e/86Iy9tlpa5vhcg+takajsyBNYYA7BT/7abbwqJqj/P7c0qgezL0i2Wh8I8l9s38cdtf7btmnU
	d7MwOTlCs9bP4rm3CFdxlrolHyg4A2o6Ny1vhIez1Z6EvBWWgOH2Sb0YfEOc7qfdTTpfxaDzjhN
	pTP+uleTPu+IgzIR36B/lQ8BbfaJTIBeykHiX8cAJuLtX0TVwMJFTW0sHQeKagcIuTeoQcW+KJB
	hcQhxMxwxifBEvg/37BrT9NMOPTAQZy3yf0m0gGyjhEILTR20Dq2y2RmqQy4GbytLxNkuBV6j+8
	SAtQfkH1/2fPIKIFSt3HqJW548lSiSI0c666KciZfiKjGJvR2BgcKqIldAjETOeWZ9TiUXL+dpQ
	vrZtfk6d++AKSoYH3C2Mf2npHON0zWsadUt7i44bVwn0SjfFWATKGa51N4RzUHpIgly8JQjFUxm
	dX0YfR9TCPnmpiVNo+FGtwnEejSL9+j8tKz1evCXD8jg9bNWXZW+GiBKoWKkmZfVEG6oyMJf//H
	Rd5S2Gbi9ahXJKxTzb+CnxcFzJh8UqQvymXDnzI2pXg6GHFTgTYyl240TD1Y/o3BfDN1Uu68NxT
	3pShzMuX1Lg==
X-Received: by 2002:a17:907:3d4b:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c50963b2f7bmr651176666b.39.1794733319040;
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 2/5] mfd: max8907: Remove platform_data based probing
Date: Sun, 15 Nov 2026 11:01:44 +0200
Message-ID: <20261115090147.95337-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 |  8 +-------
 drivers/regulator/max8907-regulator.c | 11 +++++------
 include/linux/mfd/max8907.h           |  5 -----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index ba06a49c9c60c..d5d40d2c7c425 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,13 +184,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index a9f014eae4d61..5677c59ef5b8e 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
@@ -331,7 +329,8 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		case MAX8907_BBAT:
 		case MAX8907_SDBY:
 		case MAX8907_VRTC:
-			idata->supply_regulator = mbatt_rail_name;
+			if (idata)
+				idata->supply_regulator = mbatt_rail_name;
 			break;
 		}
 
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

