Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47AB32E72F
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991545; cv=none; b=WcY3LyrPOHAm0tzQNucG9DOp7+h61q2vZY3mId5qTpHFuLDJWThNnkNKusaMT5/I5iUDruPn0/smM981WNI+kxZ3rKMVxb0j+d0n7Z16AyQ3tLuAcsHGI/idtgWQckeVlh5Db7TYek+oevw4oleXTj0p4WNARGs4LdTwQZtLISo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991545; c=relaxed/simple;
	bh=Pwd4YSfxEyl7HnB6nRuYBkHVUVP1n0LKb+GUrztoMgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLZxlZ0EWw/8tYQfLsyKk+pvSFVDJ3pfGz7FP4vGz6aMhlqBTQA7v8maIEgXyoO7I5ukjd1GDzp79/EtYUf3kQNPcA962uNmCyG/cKElvbplnlwDdVlS8a5+zIUxS3GcdeD+d/ZCMh0pzmRqglZJW86c4A7xn6YDcIr3Chnp6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzJJuIZM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzJJuIZM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7854678cso820053f8f.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784991542; x=1785596342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xzb/s1u/mCU9WDH925m/XnJN8r8j9QkReDz7KZh82UM=;
        b=nzJJuIZMxqWId/S3g3CVHY6P/pvhOITCFL4lJ/ohKyKumvMdYpTPW10rnLctZiFC54
         zZ8UgQWkIeKxKS903tlnuz0rvM7XLP8nooGnpsNplkzNpuAsQhmAQQfr5/E/8oCzEjcB
         V1iWCt9ggsW3R2HNiglA+XV+5xvpJw2fHsKD6jGdGYaUOjaaGpNAxWCz8RHSdYPAsd9C
         pQa33WejQmvuG9oH06ZzFxmvVBJeSjhF525kJcTv3edrKf9DvEkf96k/9W3O1JOeuv2D
         E9ve6ANFBHrYeqFegn7tAqJefN9blV5/2rWBtj9bUm0tOHbShabWV6/x3Ft4/1cxRG/J
         nfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991542; x=1785596342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xzb/s1u/mCU9WDH925m/XnJN8r8j9QkReDz7KZh82UM=;
        b=a1APn74bKrk4KS/b9jlUg7Voa9RxPiZ5pZdtcgFJ5vk/x4f5XSGZuxdwruujSrNi0y
         8/WUoLyzKJ1fl2MNNGJybggt+Nv2EjdkvnwesWk36RVQGRFX+UFZlsqof7OwnpH+opP4
         5Ugq3P13U5zRza7CYuCi8bLvlUUoB3XvMEr8cE1lC73b91zCQ6E1ZfZ2A30lwXIHS7id
         6klmd2W6wZOIJk9Pc8HCL8cspSj8Q0mLJPjq8YO6eaDiVQaNesruFuMYXgvBuxlVkPNr
         eO7Hb9OhQyhkzJdaF1FOANw+gAVS8SQbpQZB7s1pS5y3Tp3XrcEyRF9brDmi/2NETNzw
         RdTA==
X-Forwarded-Encrypted: i=1; AHgh+RpMRqNSa8ScnBNoVv+EHQp0bKxY4ZHB0E1uPWmoygTgpAg1JE6yS8Hk4hJPESKwOXCvQ+eQn5skkBZV@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWGoDlOAcMm05sSqncS29f7RarV3FNcfx+mCUYZUw+22HrNwD
	P6pflv3R5z2nNKNogRfXa0CPMM2JSrDH104h96NPzstV/WDalXZgL51E
X-Gm-Gg: AR+sD10nb8km4IfI30LlYD2HKdhnb4kRcM10/xs/d9Pn+F9XONnOpAbwnveGLJDn2E/
	LLMvl+Zo86AmYSb9fLZUOkIwP1jliKl+a43fVO0xvH26Y0FiSYIv2fXXZEacvSUnzzGO9kgUJA+
	H7znjqVD01lzUGWfVvS1UWQWzoQkeIEran9n8ENE0nbAa5KitPAJ7ci7X5RgMA68zcNEvC//O60
	1cOgs+BCAV8FykvJpK+jGmgeWBIUgi9wO163SlkFTHsqlwbgw0QVq1Jn4gyZEsJdq8fr1POkyHg
	PvLn2hedoGpynmwFlQYahhOq5TCsS/KsA2rihIMsLxYYQpH/utgNWtvK2nVU+VP31l6ih0a0hgl
	X03WOtI8x1rN8ZLvQwjCFO3Mwmg1kLoxkkxr0icuA7f7HZA8kvNmyNHOpEdJ02LxO7pqOVWhAZE
	fcZQ==
X-Received: by 2002:a05:600c:1387:b0:495:689a:b3ff with SMTP id 5b1f17b1804b1-496b56b212fmr34762135e9.8.1784991541892;
        Sat, 25 Jul 2026 07:59:01 -0700 (PDT)
Received: from antoniarch ([78.212.96.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm79704435e9.11.2026.07.25.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:59:01 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marex@denx.de,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 2/8] rtc: abx80x: move part autodetection before RV1805 configuration
Date: Sat, 25 Jul 2026 16:57:12 +0200
Message-ID: <20260725145718.14733-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725145718.14733-1-apokusinski01@gmail.com>
References: <20260725145718.14733-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the driver is bound using the generic "abracon,abx80x" compatible
string or I2C ID, the RV1805 configuration is silently skipped because it
happens before the part autodetection. Fix this by moving
the autodetection before the RV1805-specific configuration.

Fixes: 75455e258ea2 ("rtc: abx80x: Configure reserved bits in RV1805")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..ca3af91c2997 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -814,6 +814,25 @@ static int abx80x_probe(struct i2c_client *client)
 		return -EIO;
 	}
 
+	/* part autodetection */
+	if (part == ABX80X) {
+		for (i = 0; abx80x_caps[i].pn; i++)
+			if (partnumber == abx80x_caps[i].pn)
+				break;
+		if (abx80x_caps[i].pn == 0) {
+			dev_err(&client->dev, "Unknown part: %04x\n",
+				partnumber);
+			return -EINVAL;
+		}
+		part = i;
+	}
+
+	if (partnumber != abx80x_caps[part].pn) {
+		dev_err(&client->dev, "partnumber mismatch %04x != %04x\n",
+			partnumber, abx80x_caps[part].pn);
+		return -EINVAL;
+	}
+
 	/* Configure RV1805 specifics */
 	if (part == RV1805) {
 		/*
@@ -865,25 +884,6 @@ static int abx80x_probe(struct i2c_client *client)
 		}
 	}
 
-	/* part autodetection */
-	if (part == ABX80X) {
-		for (i = 0; abx80x_caps[i].pn; i++)
-			if (partnumber == abx80x_caps[i].pn)
-				break;
-		if (abx80x_caps[i].pn == 0) {
-			dev_err(&client->dev, "Unknown part: %04x\n",
-				partnumber);
-			return -EINVAL;
-		}
-		part = i;
-	}
-
-	if (partnumber != abx80x_caps[part].pn) {
-		dev_err(&client->dev, "partnumber mismatch %04x != %04x\n",
-			partnumber, abx80x_caps[part].pn);
-		return -EINVAL;
-	}
-
 	if (np && abx80x_caps[part].has_tc)
 		trickle_cfg = abx80x_dt_trickle_cfg(client);
 
-- 
2.55.0

