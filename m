Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE828C2BF
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841415; cv=none; b=gWJwGjOZpVhHGK9ME+GUIal1LgTTaFsmKExcGs76/VtRM8DX4x+W1tyJC+ffNn3SOJlaio3mwGRcHdS+y8Yjg9AlH16EXbLBBbtlYrVn4g676MLY4Wa+HEV7qtU0lT6BpkGw3WT91Td8MVQ0HmXQ8XiHTYrgqzP9x0dS/2X9SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841415; c=relaxed/simple;
	bh=jJBb87yqQMsI3Xcl8dXaK3nFLeADXXMejAQxTrLcVTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uK6cxeH1xHNfnnLdV97JWLlqvV6anjD2vm6QvfSCkVbHYyeLr5xAd1Nbk+BHt/k89/hk877udoZiM4xLkRQfSbMQ5GsV4aWpI8l2lY/t5/UFmjWC2xT/bI1Y4HRV+Le2bzL3rTVXlc9qjosuNtuAzhDgn9/svifQUWMsz3y+ww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s52URz4/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s52URz4/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so2351927b3a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841412; x=1777446212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSXRoXNyL2G9tTF3pCq4QLzdSdaD1DteZMo7+cFocEo=;
        b=s52URz4/isWxI+rJOYDo9nXHx2zqPX95F3fwrpRyvrpv7tPwxd7UvvRsFoUwYOtzUv
         Mx4Kgi4GFSgmQAqT2+fLZc8LWnF5XlHxrlquD++WqLqxxxDQyGQ9upLnIs2jNwFiJ2il
         /+HnlmZQX1tmV0r1B2rzKrsKubq4Be7YQ8HZU34dETf50x13cuYYb0sE2HoISexX6VIk
         vBa4OddKqgpQcJCjE14El8Hw2NwodsUyaKuKMqMgUFLm6JPmD6VKwfKxz+dWN59gJjk5
         nbjNP5R4maObLElycUJdl9VvFS0R58AmVB2kER4rEKn9elDu5S8dZh7zV4qCDgdhy+lh
         jvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841412; x=1777446212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSXRoXNyL2G9tTF3pCq4QLzdSdaD1DteZMo7+cFocEo=;
        b=Wk2KA2tbhwRDWXJTfr9ZD/xy9UQ/ToriLD2yx34CTujGbWINIxBwESi9EaKmLCH7LV
         Fp9Zb7g8RSLoZo54OjcE2z3V612roZzcr5qyQFz4sDKqTVhJec+Yd/xi2ShcTeulgjzi
         P/p9SvG1OVL411TAs7RMmFNQh9JNNHYxdWX2rIigOOFynZcVCMGZ9n5LKq8a3l6UD0j5
         0K1ZZwPtobTLNuKLKuUQ0OtbmZ4wlhWgZeXD09d6fXqQANv1gWiw2o5lFmVtYbp+q6pw
         I+r4z0EYyA4QQxTsb7pl6uM5alD9+XqYzZFnJ3Z5ZrHMwx9U4lQXYxnR19RF6T4fykjT
         9OCg==
X-Forwarded-Encrypted: i=1; AFNElJ+lxYAxGWRDyTV01rzcZ/+1IMNh0ey+ROiQo4E837ACg64vMWifdzVrGKm+dZsRL2Hd/z9kAL//LHvD@vger.kernel.org
X-Gm-Message-State: AOJu0YycbqRYVlBEJ73UUqPR3xvFJet6nIAMbBVhv1mwQNVFLt2/G1dL
	14o2JWyGoDfMLBz4vcYZTXDMCut7QcZf3I9YRE2wxBAdvI4AbzJi5xcV
X-Gm-Gg: AeBDietgVIaKc8clMQjeo1uey8wY/1dnmnsDuAxeUqjqaYu0O8aXIFS+isY/mxiQFNR
	nWbzzG+mZjCr/2e1XRrXuVWHmflIKVCj78y7VXFHzdJb7IKrxgnd0gLsD1yCRLv4VN6og6g98pY
	6TXDImVHRT9M/3ODhLZI42vo8rvIW7qNj8ZyC4gKNOgXfCk67lDQXy1AiWMg1SS7rgdW2q7QZ7Q
	EegRin4ZGluzqagXJEzjYSP6g35UDbNGLWqgnwsJXvjsticl9zlfiEU2MVtd8hrc15YzMw1G92A
	IgEteKotZwUIIGL7UWJXvTPN46LFKa88iF6SWtLpInU4VPkWoz0nj0KykIQ0ErnPp3K7qF5q9QP
	1p3OuXkjM2lbUFzq1hcJJng3bV9UtUxstAARIHWBOdbHRFhKGrgINfUvxhiIiHw7+MJTCO8M9QO
	MUeX+AJqWo4N4f+YAAJ0D/qrC/XynHjPbfYHWnW+Hv6P4J4ZHySww7VYk9
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr18881373b3a.30.1776841412109;
        Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981829sm19411466b3a.12.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 23E63416A045;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 22 Apr 2026 15:02:02 +0800
Message-Id: <20260422070203.698716-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422070203.698716-1-linchengming884@gmail.com>
References: <20260422070203.698716-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch adds support for the randomizer feature.

It introduces a 'set_randomizer' callback in 'struct spinand_info' and
'struct spinand_device'.

If a driver implements this callback, the core will invoke it during
device initialization (spinand_init) to enable or disable the randomizer
feature based on the device tree configuration.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 20 ++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aa..fee9a024d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1307,6 +1307,22 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	u32 rand_val;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	ret = of_property_read_u32(np, "nand-randomizer", &rand_val);
+	if (ret)
+		return 0;
+
+	return spinand->set_randomizer(spinand, rand_val == 1);
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1594,6 +1610,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1881,6 +1898,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306e..9ec45b727 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -585,6 +585,7 @@ enum spinand_bus_interface {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -613,6 +614,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -669,6 +672,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -754,6 +760,7 @@ struct spinand_mem_ops {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -787,6 +794,8 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
-- 
2.25.1

