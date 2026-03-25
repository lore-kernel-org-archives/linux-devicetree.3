Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8E3368BF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429716; cv=none; b=oNFEYpXK9hnlwnxnZbYN5gmALeLuJq+7VL/FnqkuLDod7xxeB4Nyw9n0MPUcHmZ+1YBVTXA+WMlBM9Bpg0K57S242YLYiG2OrUyvfXSK4aqyQ4wnPE1lG2jgZfDu/Fsq/VBpeaKJFANhUgEBH8XsTMDLXxHy6X2yGRd2hI2NR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429716; c=relaxed/simple;
	bh=4aZiUsgt+xSsUojpAPZM8tmAn9Cz4nlX94Ji+aNVrPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VcocIM+/ISNyUAEsY+q3G7UZBU6AzdJ10YWBPDpqo2zYiwKlYzc25L6yKYQKmBQXS7EkHUlLXnKlaJf1udWuAHZ+VnNmc6f2Sfpc869o5MdwlBF6xH/pYEFTllzmeo4jjVE4yaVilQo8i3AhCnAgIxHCF4u2ijawmCMjVRbgYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2jBFh0z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2jBFh0z"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82735a41920so904110b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429714; x=1775034514; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58pr77FsNif7HCk/WKA1+2J9HLLbVNeB4mpW6v36PgU=;
        b=o2jBFh0zDvp25EVW8B0EiUcUZa6pMrTQ+JJZkeKrFtHSBVDqzNRCQWgYo2qIw7StVE
         nmzjuMAgy+2NXqof8RRMtCXUG1M4TXMy89VkRWD9+8RfBp5I9xBJfflwWvowX4vEEf1R
         JJlO2fEEHogDPVR+vE5WBdm3f1DOCatzC1HzbL5sa+cLgGRMHnqaX8BMU/agyLIaf/5U
         9IQzQyTd7z53bGAh1zJI6uA8Tgg2eBOSRIeDRk5e/oAFPUvUMtmVZMa4o3mx29LwOLWv
         og9XNaqPe0Yh/V3SaoGY5Lmi0WvTA3otFPDVsr71sk25QKYOavODp1NjdNR5XoU7fQvg
         uv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429714; x=1775034514;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58pr77FsNif7HCk/WKA1+2J9HLLbVNeB4mpW6v36PgU=;
        b=U6y6/NbjcMxBdITraS+qw1PWqATN1lkf+1STzUuZUz+p0JydhIhKOyfRHPS54BMR5p
         ANp03vC6MbWSFHC4LlaxEdgSxV2vMb9dRpbzLs4vw6OkN8uczlu2fZIJrsz4V/cnGZa5
         97/HfYL4ROrmE60OBrxzUdYOioAHovR10qyWQvIyildGJHKazqxiREKXTa06EHmmDe3D
         0ZGElSNDKRCEV0zrgX/YgrkyZqIaGlCe9kg0Rmk9bf4OPUEvaW8kGyH6LlnPEvT/4MJf
         nhPersEgbpLy/kI6tUzuCy9/ucjgoybHYD08S8s0qnxThoNeM+QRXE1BIL8PGCGGQLSS
         wyuA==
X-Forwarded-Encrypted: i=1; AJvYcCWUPhxJkSCMdcxfbHrOF6RbatqaW6KC78ea07l0XOHmopNXB+tO/asxBg/6HhWDogU5Amtt/nKMQIXC@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhtirlR15dPWcJYQBEZkgaCgwpfjNLrkaLNpjcjnFPiWCej1U
	e5gaFqpf9anhhTp4w9hzf6F1SBDbO0orojGoOccJBounk6K7VNnrLeuC
X-Gm-Gg: ATEYQzzHeStm1oxNWPCdW74oKkJjARQwO17dwi2RWU4D/1SmHYKIB+xhr3k8fW5KpjG
	7U8WCl+HDLR6O2eJe6gGa/mvm9LTlxUA8F6iip2GXySK8Y3+8xYtQtgPqPtMGttWKAp8q8oegBx
	3zrutXas2qYcCpBoko/1b5snstTDb1NI55GLy/37M3lbI7l8/21XgNnon5wQeA398YI4zElC/6O
	0DSnjCeWUpKDsiIk6H+PFoUtkw68/6h0SnA1DBeiXnytoz3xZm1zluB6ZN6FxLjxE8JXMew09/u
	T0qMh3XfvEY6+kQxsWMRF/+ebRjyS9QG7tMhzkE6BjI8dIu+PPlPOCWTNtigrOZU/9bptNFbqFN
	rKrNbSEy7SJxCffM8FT1qkMm2qNRvt8LqzczTtFRs5hGjvh1o4WrnxQ6sr5NJwxS1igJoImTZO+
	a/FMqk1HSRgPp0jlkjsBUFhaF8OG9kbk1rHtxxFyvUq3N0WyhmINOuWLMkuTbFrXE=
X-Received: by 2002:a05:6a00:6c8c:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82c6dfb1f4fmr2606847b3a.46.1774429714164;
        Wed, 25 Mar 2026 02:08:34 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:33 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 3/4] hwmon: (sht3x) Add devicetree support
Date: Wed, 25 Mar 2026 17:08:09 +0800
Message-Id: <1774429690-129139-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
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
 drivers/hwmon/sht3x.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..f2b1d3b8eb23 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,19 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)sts3x },
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

