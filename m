Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD8D26CE32
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758331; cv=none; b=ZNHxpd48rHCAtRam9P2878f0eWFPO6RIloZ/LLDNuJ+q+5GufAulrVRAv/E+uXelCTA15Tc/uArrV4ZqsNe+vyYnRDIVMrTENOBhrOpM2aPdDVrvJOiYHzd16vDcq9ETpwqberqk0j++QqJunGXBo8ykcrdKeZPhIgMafwxwA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758331; c=relaxed/simple;
	bh=5eyF2S7ViTpP1C7easdlz2xSG10ngTk27LKK60dNnt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZQBiqtmszs4/e1IBX9xVXr6s3Ep574r/V9qJZqscstU0d6m2Dmnc5WYV8kvmJ/MIU+EetIz/K/OBQVG1Nxnrxq8XwDRWKiaYHJqsiJQCW2Kbk8uXPnKK+BlJHo/ZiMAcTvVfkjz5FHVPyMIr939MujfLMWquMSEwcaOn6CAc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMgzhZVs; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMgzhZVs"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137dd523634so4740836c88.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758330; x=1781363130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDvvIEJ397Z9hz/fjkFik69Td5t/Laz7R7T1FL6xIOQ=;
        b=IMgzhZVsmse/rKO+/jmbUK6hsIqLyIefjhObsNDHWQIWAntOhG23iKWC4vBNtEYBQE
         FSgmziwlWYv2o39Zn2w5jvB2KeIK6SyBLhQniJavJO+G1uKJLESfgU2L5q6XbHznsYkS
         utFEr3DT5ZVRxEVLAeSD3QO/DH22UIWvSwxU/bSisnEkGjumfUR1R6GJGYqnYbAh53CR
         FZ5dxWtQMDrwfOnRbH1fkpofpTiIdhen5K91def5CmdKuLqNfNWX4n2+biMnl4ND1w0J
         ETGGCynrT3pkj+HyV5VjAHj2nv2s0ZTbJcJn7ExAEm3acC9sJ059vKxQiAcHZ67CDq0U
         a/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758330; x=1781363130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QDvvIEJ397Z9hz/fjkFik69Td5t/Laz7R7T1FL6xIOQ=;
        b=AWuEzlOCySkHPdRQoyB5aHOc2CvHvEG7VKcVirsMvpWnhchq0aMKxIxgEUrzQhNJm4
         MqeSYiylFFnof7odtnPazN/YDqspzdif1CnIFRnHlTIj8yjLSn9bv83hv0lgqL1qSN93
         ambVkC/ZFm6CbCipRLkGDSPuuznn08+pAAP0Almq5c7ICQmqB4gg/UahG3CV7mLS8TBk
         hoKOgDqTdXARAsp71sB4opE50BMpicZCMqp5+Whn1sfGqaKdk60W0Nk5lbuvIzcFDzh8
         Xk3NUCcmJsOMnWAO5y0XIn6nmsAj83QynUK85hsVtkZdTX8WQoZs/WFQ69ULlqMbTOxV
         plUA==
X-Forwarded-Encrypted: i=1; AFNElJ9lL3SKARaUDIlfWPWhitbS1mPRW9DuStGb9q6IHJDqb+xOxKJiK5YdQJv3bauCYCBL63yuoo4xgWNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NUoljhSzXLDL419kfxhy14n7MBRMmeZSepK/Uiao8dp14tJJ
	yEvL+pAtjTNRjqkMRAC7bwi+pVwWl25UZfBEIEDblW5GAkNOsuZl8O9E
X-Gm-Gg: Acq92OFcVDhcUMuI7UQtBZfEcIzwSbfUtByfno20NEWj21zPY3KD87vmBnRngI01fpA
	nOnVD8P4MdfEUnPL6z4unULZmM0DooBzcm83Cep/38PZJ0QBjMd+HccoiZ5AWfpKYTyNoCQv9SP
	ymv+BlEO1gthMykYeZpQGALAZAPi1RYqmce2hyuXXMzvVu9Tuw1mFVKpyB28RDNQTiKoJQlfOvI
	6Doeq3A6d/tQdiE4VC6KQ8Tw0wkilSa6He1SS9QvOwC0MxB7V7fyouawQwpSEYmfPYYu5oaAMBS
	zvLyj5AU6AXO0aHInPQUQZywApEssc0ATPaK+Jvd/tcypdrjTr1GoVHobxhW4fdPTLVSKTMQsRs
	/tm1f30Hyr9x9aRnbayDVlp2WVVHHf6p7ufv7fSFulbxGxnaRH5NBviYVPQgI7AHO+ZsmBm9FRX
	eeF+yP2RSQgFfzs1OAYULq1gUKcSg9jfxQHeCh1ZQixqj2YLb4qA==
X-Received: by 2002:a05:7022:221e:b0:137:fe07:8a2c with SMTP id a92af1059eb24-1380671fdfamr4297594c88.22.1780758329731;
        Sat, 06 Jun 2026 08:05:29 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:05:29 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Input: cap11xx - clean up duplicate log and add probe error logs
Date: Sat,  6 Jun 2026 23:03:54 +0800
Message-ID: <20260606150458.250606-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duplicated device detection log exists at line 537 and line 542,
which brings redundant repeated kernel print messages. Drop one
redundant log entry to clean up dmesg output.

Meanwhile add missing error logs when I2C communication fails
during driver probe(), helping capture abnormal hardware access
for debug.

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

