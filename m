Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAF480970
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708654; cv=none; b=TiIftXuYTyGxWWi0iPqKFOwIaxchB9/pqZo6Rf9+jsijbtfFlK5OOdJdXCqk/81OtT9QXHk3FfAzOuVcMbH1xP9+LyUD5VbeP65ueEPcShtxn/o8BaNbZOvjCcSZKrmqZrH+U65INsLvLhNYveuoC78cHuaaZ3YbOm8BlsjzHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708654; c=relaxed/simple;
	bh=L4IGNbM7y1d+TqDRCJgF9JoD/da1bj3QcNTtav1CsvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoTQ9AJjkcHx24KCcrXEzY6qs4whY1Vo1A5Y/WSQl9ZnYqgxrZ+cAC5kvKPtHjlf/Kc6nlC+D5XJwWvlin1ozjYSY+IYDskm10cZmNMNiBfN030te3pdYpwYpGvOv2tRmUhwPqiQ+mcMQ3Jldu6CfzdpiIFy109d2sBT61WC2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otTXlGZu; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otTXlGZu"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66077e90382so5245967d50.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781708653; x=1782313453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xutruK5RfR43rmAYdiUjHl9bnTWIPbtUF5GMeFFCbOs=;
        b=otTXlGZu4tMjsQOhZf9eYDlmwRyNfU7RoQnNVduXALNGlO2Zd+sIIKM//nVCUhQ+lS
         7c09DinhsPVaoSerHuj5ZLUOvpik07xV6DpQBClL5G5ota6eRz6LYBBLmkQXdsQcd7O4
         hqJXu+JMcIfC3eE2awDKG6tdfM6cu1hZaLBm07YEaWivJC2pqdf4Jep/A4CsusPm+FdV
         rNu4DrmYj5dTdoVRVYtMsJuHDaI+jsWl7uVU5WNwigv/uEuWfDc2nAc4xpCp38ztf4Bs
         CxwTUsmxeEUvRywaQ3/d1sIAguqL13wvsxaiuBrnm1658ZQpIcyUUTJcSEEPppyaGN2N
         euqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708653; x=1782313453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xutruK5RfR43rmAYdiUjHl9bnTWIPbtUF5GMeFFCbOs=;
        b=KZjMNeMzx7OHs0doCGoFcGmHi6ydIzwoff3ANe+atQb8bvMY0dfRDdBnXn9WjsNyDe
         pQ47R+RQfv7aUuTrcTtTQLIKwHFzPxji8oHoNEkLCVV51dMpENR8tK1aXDV3zEelURrw
         rVZGZ3o+eIEjGHTQjrVUP9z+TV5vjdZXV6AogEIQi54D/Ue1MPESHynRvyhnMnJPpfUR
         XRDnFSUcokXTI6hMm5rvDqWwugXCmToGk6w5TU29IbtWgDjrIFPmdfEeqUbplMKvLJOI
         k0fFVerZTkKvQxwSjRzUi4g7RTFspdwOEUhSgwRJssheX49WtVD7/XF5EZ+itmxBv5lV
         Y2Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+n/+X4PXK7UE5hLy3YSKFdQ7cwDzI5R8V03JhCYKywVXvXrfgidrg8TLvnZEW3JZ6JWiG+HZ3d9dDY@vger.kernel.org
X-Gm-Message-State: AOJu0YwFY1zepQC4DnNLBTPEqxI36MpLpvL3fofmrTzgBRhD5+T35l6a
	UjPhFcpeeO57aXQSwQ/h1dEa47KARi0Jd+xJIuxUxCA0+ML60j/sfFm8i+/CGQ==
X-Gm-Gg: AfdE7cm8j00p/2O6XO8XyNJRJdA6r0bKPmw7wLcakmxE80UZfXL11Q6UW3Bii8uSAGM
	/gUUw95UEH+rgcx3UXw+L4eFyl5bWIbHwI72wwvTvsoC7QC2eo998O21ISphlav7WuNJij6Zgty
	3m3gs45PTXk99ckSJrthLvWbZZGzwVKm7U7T9bWtXXtfKWmuGX8ARgEJ7BEyD/1Itt1tjOnYtRc
	NCnaYIN7v2MG9Mwx3XMhIrxqLXwxR3dGNUHhW0bEipRQtL8mtqsyFgA/CaHwTDx55BzeMHTYCB1
	i/y/cmjghyQkDAeDwHSfXj1YxK/5Bus2JX4chTbTj/0bDdso5pInDH+oiHAj7JvUiQA103jFHXM
	+DWQjYDEkMxU04NrwQXnxOiA4e+3tb1cJjfFAUj0rXfSwY4vVjTc2vAXhmU/tgu9Y30UU9u7r8H
	V9bVOGZW8Wcg==
X-Received: by 2002:a53:a94a:0:b0:660:eaa4:5c17 with SMTP id 956f58d0204a3-662cb8494d9mr2924093d50.2.1781708613613;
        Wed, 17 Jun 2026 08:03:33 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-662b976e47csm4387677d50.20.2026.06.17.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:03:33 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/10] Input: cap11xx - clean up duplicate log and add probe error logs
Date: Wed, 17 Jun 2026 23:02:40 +0800
Message-ID: <20260617150318.753148-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150318.753148-1-jerrysteve1101@gmail.com>
References: <20260617150318.753148-1-jerrysteve1101@gmail.com>
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

