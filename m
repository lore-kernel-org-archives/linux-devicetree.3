Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845C3F23CA
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374601; cv=none; b=uhnQ4GNrnjqh/ZgaUA+7IXMDfO0fXUVGTPIzfQtjh0ZU1cv66LSutWPh/aeVhz2NEXoKw2ADWQEgW6Dd6erByzfajLAC8LwZz+HjZl67SL6dDXRuOuTRfvlNbSjlTfIwTfuQoxoJXZ1xvdbfbr48IIA3TiQlJPx5Y2qlh/CmHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374601; c=relaxed/simple;
	bh=suAsRTHjFrIOqwv3lU2Jbx+BstiSTswg+OLRbvjhTRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cK5yKvhifDwFJnFySEu+vvDgckGugfJdtCXGIgmPk9cNUCi34Q89/kp+T0j9+ZSni6kWMM/4woDil9SAZ6a68RC18rPQuVp624ZGMI/SxWqh8jFx0LwAVfEQxh39qRpyLy0bCfqvfQt8tgdy7ZyxJYa4tHMkkUiDfQ7qs6mYZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dsmgvwhh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dsmgvwhh"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso3351161a12.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374597; x=1777979397; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrQZFdee6AdXqtxvEmtEoQ/GrYT0udvFIVRX406KnNU=;
        b=Dsmgvwhhy9WB2zGNzf0Ni3oPx2zAlmB8E5FfVRJ81CorVQB6p3S3QoaqNUsrbSQEmT
         /sNTJ0aYCW+2OaCLW5tu0lk8cVytf3faS+i42MvuVTouutdyqhP9eX41pngg+tGRNX00
         02aufaz4qT8sdAsZlRSGkuI0R3yHgK6Oz8ctbDT204aOTtjMtKZIWFl0rNTPIMs5qjSR
         QXmCH/fGrpAfOV5q6cZ1IG1jMEuRvU8oBsbXZhAqJoo3R11kZbmB8VcF7Gi4f722tIyp
         M4KTAJT59wgiplf9ci4ig0iNR/lDTpPwFfq90Nzgaobotjx1t9llc/V5NxUKKGMYZ4nQ
         9TXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374597; x=1777979397;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrQZFdee6AdXqtxvEmtEoQ/GrYT0udvFIVRX406KnNU=;
        b=Bya2DpTiRQR2aWZ+fWyu8kI0s6MYXcAQVXYaMnuQd5NXcEnX4Sy8BfJ1fmWn0IdGgL
         kdnfFtzgrdMrZREDVWrr2NCSUy+0za6FuXokZcaVpQYNZ+XdNbJRZ/Lhy5bJyxz9/YZk
         0LnWql8cEdnWVs8B3zdr5CsGIYHB35e9M3/kIlg+ZDAVbM0KPc1OcWqfAppX5PUIa9I5
         +tlBXnIvQQpweEVxLzK4NvVoqTyoMzwBp4vcZLyhzo2Fu3DI3F7U4mD2yMzkrc7mdVV7
         G5K2/V4hEm1tZRCK+gBTgL1sIwqJLLC8uDzwrBAt/1DteDl58YPJNR7mg6DXkw85Faxb
         5wkw==
X-Forwarded-Encrypted: i=1; AFNElJ91OgzvsOLWjV5a6aTv+94EMXBcQGAeX+1ZISdTbswV8NNlxvob4FimU7T2AvuQe0JKPFAeSrHguwdG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24vPYAFD59a7FdNYSQgaOdLeF1y6S+RJVZf4BtAkQxh77vTvH
	6oASsxKTuCuu81pfSH05RYHPH5h4kjMol8/fgmNm5AHFX/NcicWFHqsN
X-Gm-Gg: AeBDietmN0C+/sZlZes/5c2VcPukfEueQhWlH2czTjIgG4VsdZa57e6srogLNrBAvb1
	/sCNnKLnLDezjyTj1XQx9ItdN1W7ElA+tdVh8YuS6ZID5HwNJ2Lu3EgfqkOb6mp2qPBIzcy6yHt
	sDOnXGa56YJh6QiBw3Lu+G0CvwRApfEhFbMwMkBA057qj7aQsGiEgrCk67KuDa8IphG4fdlwNBt
	FxqSFdb7AFa76uvBTuYdHqtb5Mi5fgesgpAkCldyeZWglrBP9UgoqNu1Gw24HyAMrXMp2zuCgKx
	+fOzEHkaoNCP5ct4DCj5htVxP/izSa8DEsaU3VGQTR8qKgFpjQ/jhakqhMzxxop+YhrH5fSsp7B
	UEq6tSnOxulMij3oGKhBrhSbv3ZmHu+3NwOrB3i16hwUp6tP6VZ2vtvUj8ULFQOzEtUUVgWmNEM
	EAc0lN9B/i/OI7OeXCafrteoegq2FY8NcVSMRp4lqttOrISBCV4zu4o6qpundPogE=
X-Received: by 2002:a17:903:1b2e:b0:2b4:5d0c:7a85 with SMTP id d9443c01a7336-2b97bd5a7a0mr24741225ad.3.1777374596559;
        Tue, 28 Apr 2026 04:09:56 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:56 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 3/4] hwmon: (sht3x) Add devicetree support
Date: Tue, 28 Apr 2026 19:09:28 +0800
Message-Id: <1777374569-59233-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add of_match_table to support devicetree based instantiation.
Specific match data is used to distinguish between temperature/humidity
(SHT) and temperature-only (STS) sensors.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..6437568aaf73 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,25 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht31", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht35", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sht85", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts31", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts32", .data = (void *)(uintptr_t)sts3x },
+	{ .compatible = "sensirion,sts35", .data = (void *)(uintptr_t)sts3x },
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

