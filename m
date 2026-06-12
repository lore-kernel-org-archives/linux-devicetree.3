Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8E3DDDA3
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249003; cv=none; b=F+bm2AjlUwnCnxZjCCerR46fPehNkRrS+7AdsiyusVddUHoOM2dzWn4fURyS/cqsAHBfFSksoRZZvYWpTy0ZAIx64O6/FXWXkoWtUbbGrbhGTQ2N7Mvz08zR12LP9jPKZFbohrsv9jI4o7D1OHuZxpOZ7G3DgZhFvzb1ffcYU94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249003; c=relaxed/simple;
	bh=L4IGNbM7y1d+TqDRCJgF9JoD/da1bj3QcNTtav1CsvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYfNWqqoBh/g0C1nRTnrr6FlLmmpgDgWYF3eMuZ+MJw0vGxxDbTD2puVr+/LlllJHYn0GUvkm85hrjfROWu6vdoBRzINK6iwZIsIrGdMZVvoqIbXQb/hJDrJsWrApcO+5kLFS/9+XpuK2nseLc5Yts/O9XYq5wDVyUUxHEQM8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBz4Tp75; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBz4Tp75"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso12979825e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249000; x=1781853800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xutruK5RfR43rmAYdiUjHl9bnTWIPbtUF5GMeFFCbOs=;
        b=bBz4Tp75X9vsRD/zUcOkpEb+HJHYOdgJutMZwCksCDWrXbc/6yj9Lr71IaYgwz74lc
         NmMFpvnuEE5SyVYmqGEJwcxl3Ol5lACPi7I6J8Uk20XyL0SmMj7VQh30T0IZzVDuxG3k
         p/nE/7r0WXUapFDJYm0fXQfn+bTASi4Fo4ece8aCig+neeC2js2lcTld5PPkGI63f6AJ
         VYrx7fBlsqGO0sOUDCV2gTp3rOaLqv8RFDPULcH1TzZmVWMFHV2Vx0hQPDB3USgDd/hR
         /j513fr3STQrF/kJcynm6V3VBs6mCGqHxSikoy/rpp1QtVxrou8rJsIW755AZku+XFmG
         g5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249000; x=1781853800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xutruK5RfR43rmAYdiUjHl9bnTWIPbtUF5GMeFFCbOs=;
        b=BBp6r1GtyfA5OneHNdLlURSvyViuLXQL2hBocphEOSSWu5DNAgFoTeQDV8YWQzfOi7
         G4svDMIZCtYEcw60jKsqsVXLaB60UFQtHICE+hZJvvatHFV6qsUIr4dqYslzHleQv6NK
         Bdc2v6tSSukJyHcK47tVmEFpb0DvWM02myECdBIMF9cE5FYbLskd/GgmiY90tQdc0qzW
         594OJIVTFlZdyCboBVq4R0gX6BfxsJghdi2gOZ379fMkSdZbrDIfKNtLwl8cSGh9wiWG
         KPSqp/N6HTQxPOxp/OrRrviolOyD7Y30bqir6SqsR286vNo80FBlhHLGAqQDsKyhWRZi
         G1oA==
X-Forwarded-Encrypted: i=1; AFNElJ8/U1bqmbh/hA64WysHbCbEmpj4EOUXJ/6T+y1nWpEeKpMyELp0bMRkiqOLC28s2punQW1wM3kLGldL@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGDMH1mHGENzB2vaPtqUWa76FIoBUHqPyT6gAyUnLbBlx271A
	aszXxz+PB1AqvEye2Va5D+e1FO4kymUXwv3QNx7dY9Jjno68cXzUwten
X-Gm-Gg: Acq92OFVs3mFttGWNId0I03RzZ7Zq7MpVMNGS9p6DM88h8Leolgi8TksT4/iv1VKXWi
	gJx7EG3G8j/ECI6NlI2+tYUbWjjTiNs5x5zrOhHhrsQ7HcXauka/EJ6iL0vpGD5OOazqDITZUnW
	gL1bOCN3wRG9SPFqyKoF3ZNhk3Vv+FVm+mh1cX9vqWor3GoSmM9TloNnawzSdODjiEFc3Ngx82P
	xJ+0xS26pbB7p1679Bda6LFWUVFfsmFknWc2Gjxd7H0FzaWNDRjO7QXZx2fYhdxG47Rwoun6h57
	60mxjCxaolwYUugCLphIf2U0DeKw1Y8n5bpY8Y7shByN6f9hkDz7XURtBlx/U/lqr03KeK9cPR5
	G09iY+47I1FccvKPnFyc50vxDmovGncTUPIWr2ZUZG/wIXJwNEIfEzSNhC8/3SwYsv8GvZPmOWm
	YZb9aMMf8RDz2sieS2mOjVx0oEhyjFEx9qO4fl1Mo=
X-Received: by 2002:a05:600c:3542:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490ec480e65mr14320715e9.4.1781249000081;
        Fri, 12 Jun 2026 00:23:20 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] Input: cap11xx - clean up duplicate log and add probe error logs
Date: Fri, 12 Jun 2026 15:22:07 +0800
Message-ID: <20260612072237.1177304-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
References: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duplicated device detection log exists at line 537 and line 542,
which brings redundant kernel print messages. Drop one redundant
log entry to clean up dmesg output.

Meanwhile add missing error logs when I2C communication fails
during driver probe(), helping debug.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 2447c1ae2166..485d8ba97723 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -512,7 +512,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 
 	error = regmap_read(priv->regmap, CAP11XX_REG_PRODUCT_ID, &val);
 	if (error)
-		return error;
+		return dev_err_probe(dev, error, "Failed to read product ID\n");
 
 	if (val != cap->product_id) {
 		dev_err(dev, "Product ID: Got 0x%02x, expected 0x%02x\n",
@@ -522,7 +522,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 
 	error = regmap_read(priv->regmap, CAP11XX_REG_MANUFACTURER_ID, &val);
 	if (error)
-		return error;
+		return dev_err_probe(dev, error, "Failed to read manufacturer ID\n");
 
 	if (val != CAP11XX_MANUFACTURER_ID) {
 		dev_err(dev, "Manufacturer ID: Got 0x%02x, expected 0x%02x\n",
@@ -531,11 +531,8 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 	}
 
 	error = regmap_read(priv->regmap, CAP11XX_REG_REVISION, &rev);
-	if (error < 0)
-		return error;
-
-	dev_info(dev, "CAP11XX detected, model %s, revision 0x%02x\n",
-			 id->name, rev);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to read revision\n");
 
 	priv->model = cap;
 
-- 
2.54.0

