Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABE3F7878
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354904; cv=none; b=Ub5jroL5wmLDWAJ8USx5FRek5eA5+tMMHHKYQIvSqBGShDb/lwUyIf+5Jdg5pnJPxaGFgIkHwZqaOEPCEWzMgL/h7DZTD9Qe2q8uaYbFUQGyYcYDiGBITALQoyMlJxf1gdtr7wjtbt43BYplKbZMzYSim4eHngWEY+UfupZYqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354904; c=relaxed/simple;
	bh=AUx8FstDbbu+ZQlA6z4YmFRV2wZZ0u1yLkF/7qjbQJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L1g6hjGiqxxVNNrxUssKcAqtA7AORmR6bPf+PtnvkF6mi7EEXbCuz/jQf7HYMcwJe2SzAIl94smb7KdwFdwi4m67EvbtPR0oJZdXNvR9b5nJVL1Ks4Ht1v0xolk9J3scsZxylWj/wIMrMHtYVX5pcitjC/1nWB8w4rKi2mKbow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbUfyq4f; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbUfyq4f"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso643240a91.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354902; x=1774959702; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9uhH2liBN3NmDc7LnY+4t/w58Z8uzkgXzPx2s61DrE=;
        b=kbUfyq4fsx/f35LCiUIaRIo73KEa4EIi5yz62SvFuYZ53anzvN4NJtI/ds7+Gp8S0W
         mlO2m11eC9++xSAMucdiWXF5FwfqbiwuMPxDWpPyPfnIAJjqga7sem9kIVNUxYMC7a5H
         qG0F/JAUQYtLqPynbFE6EmHWEF3sIssMg4u2kp5aevnPmR1CcQVJ+8h5J39HXgQ3HKJk
         mnmKlzvEi7TjG0+eje5MJIa+wsORcx8xRTmZtpyO2nuUY8QRiGTfxIs52bHB3Z/ukOPn
         kuFdz/+MDn2SwVU5kWBmEgblhXJOENcZBsRsdeA5pD+7wGZjlpq0aWV2BhW7jYJ8BijY
         Cj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354902; x=1774959702;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9uhH2liBN3NmDc7LnY+4t/w58Z8uzkgXzPx2s61DrE=;
        b=eVLzwzO5sBrWP+HwcZjyRR4cttCWC5/llUDPikMyQyXeTI42LDJghZ64a238XXXrwy
         AontSJlNpGzKnv7Oa/vou1rEPT8SxhrB/7rQ6hnsdm4ENKaXV6P3qJY7sesm5MKQguEo
         anBL8ZCykYcsCva5+sEY9SYKYlq0oDyw/mu+ju1WVhb5pL8zPNyo8Ssn8mSF+EJuxgfC
         T/uNCHD8YwE57DEJ24tgo6F7sU5BjhANrVYhrkaaE7Fe5GJ+SKqZccSURB6bvF9H+rh6
         vZF9VaoNhQjPgZ1oqNmQUq0buhyxnMLLShgosFr6u5JXd2gh4+L/HV1l5CDirzyDrLmh
         gveg==
X-Forwarded-Encrypted: i=1; AJvYcCUWD5/ANJM2aBn9HJo0uwwsFnH5ssRJI58QQm6AXyj1MVjbRjJyYkZWHVLnNEiTabhojQHB4Mef+ZSF@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3tb6KSUdswLaSA5Tk2UTcnGST51YzwSHvncZZh+3vAcEoHAa
	SUPSR5+PzoXndhvgSvv+yyb1o/qwlgG8XqWkR5jJjtc1+dwcljtuWSazWTb0W3aJr1c=
X-Gm-Gg: ATEYQzyTayQN/fARF/73AidG1N/UANFYhr4L9nc43oV8Bo0AqfONyWo9QRJ3wupM8nw
	wo+oibdMjTqsbID1QI1NwugHRKYJ73I0DeaJZ2r6WO63ETC6Q/AX6TuhJ1dXoH0ROpVZnXCOya5
	R/XP3WxiMRsaULIFYwnRM+hlIKl6f+LZAG0jlDLqSWPYBtUw/6pkmsSM4F6ciImZnoood5D+jbW
	A6HG7WhvzyEMza6ByPc0WuVBS+pkZ8IZCL97kZLwaQCK0RpTUlw/J8nF4k4bH3+Ux/eGqiTlEkU
	gKmz2U9Tl27DUYqM8WhV06C8nMxWtWGxEbMt/Y8XrGNuza9jgWY+mFYpKwA6cssGAyN7MQ/NbyN
	DXmv/Cw/KMFsOz1KsDzxY50cxvn6u6nHApX+liepr9J3xxT0UWUjU93521fm74KeH1Tm+XhbgOd
	D39AZftvigY0ajgcxY5qBA2kZXQpYD58LR7HP+W0RllWqBtLi/myGK
X-Received: by 2002:a17:90b:1dcb:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-35bd2bf4d56mr14915578a91.11.1774354902526;
        Tue, 24 Mar 2026 05:21:42 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:42 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 3/4] hwmon: (sht3x) Add devicetree support
Date: Tue, 24 Mar 2026 20:21:08 +0800
Message-Id: <1774354869-119736-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add of_match_table to support devicetree based instantiation.
Specific compatible strings are used instead of wildcards.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..64404fe83f0b 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,23 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30" },
+	{ .compatible = "sensirion,sht31" },
+	{ .compatible = "sensirion,sht35" },
+	{ .compatible = "sensirion,sht85" },
+	{ .compatible = "sensirion,sts30" },
+	{ .compatible = "sensirion,sts31" },
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

