Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58039934C
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289657; cv=none; b=YXdPnVhX1iibF3y4YSD3VTTetCBYAEWR70DnPNOI18SQlbuyNrrSZExMmjb5tQtiJEa7zr6mkYp3/h76NjKCwWYTSl9FZSTTkarDQ5rpVWi67fwUlNu3uPg1e10sXod3CbjobwCAOfgj1kjI5bwXzPNSqsIEloUdz4tyKpUURWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289657; c=relaxed/simple;
	bh=VVdY4uLEM+PSjSa4BxpP6hRuJzxXf0AWV+5KTiKJqRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkoQdBZzPZhq+WhV68VbJLsYg8ivu8hprb30CJCBwSF4v6ePf4SVG2VvTSZNfMUV1MgubtClX17WkJL+DUqAPUa5GVvRegbth8+qBDs5Gs6OJv0LnvHPh4MNMWRi4hSDLf8WtEWB1FFQdvbCQ7n4+jSWzy9npFv0XdkBBObdONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0OESqIx; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0OESqIx"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b92ccb8e0so5885445e9.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289653; x=1789894453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+XuV3zRF3c0btBQBa2v8yLmcPdVUtoareQ/mmTC3Tw=;
        b=m0OESqIxqhbdNZgVZKunL/mesyu7on+gsT6fvBHAttwWN59T+NhkY6tYUqMcC1+i7l
         Zfbr8l7oOrSrX5/M5YdGrdmEeoOSO7bI43JhWhgmCRRMMLpBdLsSJihZ2MwX3bOquUxN
         PAJ+hvJcyIUhCnmlGLayFuGo4EjD4XxJhjujy2vovwXCXy+U314qZhIoFu5Mcqk3rSjZ
         qUs+hOVkt1pO9XeHFblzrBER/ijgMSGFlSvIB5FzALeti/+uKTpzVU/OsYWvMSzY4Ksx
         VZXpK7Wng97FzDFfC9KlQKofvHeSzynUpDjo7mef20ObseAAtgJu2s4ifEePBq3z6HmL
         6GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289653; x=1789894453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+XuV3zRF3c0btBQBa2v8yLmcPdVUtoareQ/mmTC3Tw=;
        b=lF83VFnyBTQEy9hyfkIPud1IOA2gcG+WxSjDw6AZK1umzU4px6cyhkmOtIDsnTM9IE
         Z/0fpXmqVTjs9f39rrs6z3M4uuOdFsYlNlXodR7FS40WMMzSuz/vhf5YMnoxeVVR/2dF
         spiqSZYsYui2F3edK5OMMIs22TE2Jb4YPk/7pFBV1IEQhEjGes5C2wB4tPCTZZmdLxBd
         1ENlCrVe8g5GFKOUfGK9Ni0XbNEElob5zKIf4+TaPZqj0rxZufQiahj0NbPcFpC6EbvO
         1miXlQ7GTgEcuzGDE6aKeDA40/2qHEzWAZADfVjNe4ois8l5iaDqbiEGBxkn7h4tujBm
         dNtg==
X-Forwarded-Encrypted: i=1; AKwUvBxQm28IsxPtynS8WOvVBz9BiFYxnzfxtEmhnZeZHiAuYif2zfcpusVcfYIhs1aHfEwNK742HwTsGRmK@vger.kernel.org
X-Gm-Message-State: AFuF++l0k95stDUM/tgYprIB+F50go/+WHIrtMV4UY2gpvbwAKfJ8CJX
	IvsEkHQxUwGJCHQbBuC4aFO55S5nY5hMfJe6WTpJBPCe5HWYQ/fgwula
X-Gm-Gg: AYBFou0igVuDHN6HzqgpEzXS7AueaVCDOF3oJmqKfOgGYukLgSeiBQm4naXH2gIyG9y
	25l5sJiS/zOlb87Av1lYTotjDnV7+gvRbRzn/oW6W/y8OzP62lEsdA5I5gt3IOcctMQC/qZmm7r
	nRYBel8PsLlL432v9uKVNRRgf0ocKF8hH5tBJbsH6SAOcvRmJ3I4iQA0jTsXx1LQJ6KpGPWWRB3
	sUzNZIRW4gF6HPmWc3ZvNt6bA6kXNy5xVh8XpEl4hJI6OJPp63ZUkjtGtjqJbjnhUK5kPvSu3aX
	S9mrq9EeZ2LsabUo1DWbpDKIkpg0eyDtPM/cPdC18pcuXc1DTCKVMZ6FZ8JQnk3/lh/gENeAeEi
	1dX2kZUgP7j83zHKjfaDhgESglCTrk4Ws1a/gavrKtRWn7zssAnf8aQbaa9ySWcXujihjvd+7DT
	KaSVjmYnWa+sO+jFoq2qLQa5o2KW/dAv3gef1NeMDjXNO7LzgI3XOriPin5/c/dTb9mYW90GRmO
	9/v3UBbq/7N0C6PYNc=
X-Received: by 2002:a05:600c:1385:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49e619bfebcmr113344775e9.20.1789289652755;
        Sun, 13 Sep 2026 01:54:12 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:54:12 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 6/6] dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible
Date: Sun, 13 Sep 2026 13:53:07 +0500
Message-ID: <20260913085307.13846-7-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 has the same external interface as the already documented
ADIS16201/ADIS16209, for the properties covered by this binding
(compatible/reg, the DIO-based interrupt pin, and VDD supply), verified
by datasheets Table 5, Pin Function Descriptions, in the respective
Analog Devices datasheets. Some Auxiliary pins differ (e.g. adis16209
marks a few pins DNC where adis16201/adis16203 use them as AUX COM), but
these are not represented in this binding.  Add adis16203 to the
existing enum rather than creating a separate file.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/iio/accel/adi,adis16201.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..3ce5fb1be 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -4,21 +4,23 @@
 $id: http://devicetree.org/schemas/iio/accel/adi,adis16201.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ADIS16201 Dual Axis Inclinometer and similar
+title: ADIS16201 Inclinometer and similar
 
 maintainers:
   - Jonathan Cameron <Jonathan.Cameron@huawei.com>
 
 description: |
-  Two similar parts from external interface point of view.
+  Three similar parts from external interface point of view.
   SPI interface.
     https://www.analog.com/en/products/adis16201.html
+    https://www.analog.com/en/products/adis16203.html
     https://www.analog.com/en/products/adis16209.html
 
 properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.43.0

