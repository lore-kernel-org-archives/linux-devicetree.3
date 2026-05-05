Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBE31E840
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777945059; cv=none; b=aQ69xrBbtZ1Mqt09PcqeF18AEPZhbYsP3z43zJLz6MCyMdnnbj9e0ldyvEwfloKiILFQ4jM9CecA3PDinA5Be48amhrvhCYx9wZpDcPpvPsJ6k5qdtsaOWlyuqbwb1/vWi6VsM95oxfWgmAsXsbhTt8GwwAgrNxCW7jG9HrwfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777945059; c=relaxed/simple;
	bh=D0bTdvdTCm27EjO74DkzZDQRGni5mOw6oHjXGNcLnY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sAlyIrn7irmRJqQy/Qyzuj6TmVZxn4/eHEQjSD49h8EBjmyTblsMNATCQuUFM9WUb9OJQlFDyu6zjYRWSst7ZEn921+pj2YPhYzriUoj6Mn0N/J1yhrKS4XoP5M7u60cTS/8N1EErDvMRADVllq7phmgDkxiZ+nO3duoCuHW2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkLaSlOp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkLaSlOp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so40440545ad.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjrHxUF0jl2CZOESmwQoL3r7trIxfKHjRfBdfvvWu+U=;
        b=pkLaSlOpIkXEbTsFJIBZxUQ6bZWuWmdQyN173Mbc+XOhci0nU7viJgGPI+Q5mThyea
         oyOUJcksdvpZMwnXdT8Au+4mBMjAVc5P1DfzvizJwoftAGijeHZemrvv1ClqHCncqzTE
         9gyADe3DbzAvIUQZMiZgaL8uFIaxAGPFSMjVnUmJb1Q3ljCN25vebu2qgQY3zbZ6cEBe
         CcIb7vALQKNbk4Nb/dWe13jHRInW5IXXBjtwwtt4VAoefR7AAygtx2Kf6+HVWC8KPs4c
         uee3Nwe3K4wapRSoEahKfC5un2lCh3LBkL9XwliWHpzrOBPorIO4XXdjvFVgx1pLR/O+
         hcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjrHxUF0jl2CZOESmwQoL3r7trIxfKHjRfBdfvvWu+U=;
        b=dVcJaVfR2XRTPRcqPhtnj+SaldSweQ7QPnADVmFVJaCWV1DWVZi4sPfoQ20AhP3LpR
         Dvwhlc/FpI4MgzIKWX7WVjd2W88OgsHvZRtgQst628KlctNuGhPtfNjUulawHZNpIsEn
         LGLwacviJrnlAtmc0un7qVAF2G/8ryd6uE6Ze8kvMzyM6kNgS4wug6OkpltHenOr/Mwe
         NyrbH3oR/K95jq7WKMnlkUpvW1Y2DQVOuRcgHgIi0IpRqp6cCtQSZtc2Sbv2/0z75ZYo
         u1zEW62eFRPKeFuVG+ZBlqxv+m5466eyk/4xHOX/nybpNLEz7fipAvZLYnji7rTTUfsa
         fWuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YZuvWsDev8cteosa2r8+548FK3zGWAlzdn8guzjmWKnbe8mmYY+81GpG+jhqJj/Acbs/vbpRsVXuu@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcz30hopbqJNPsICobSFoxqkcFDuuo8dtNGT6gPuV+C9lUwsc
	aDXXn65R9JfQ4eFzx4aDV5+a1aWNoY0bKp7xkko3e6SVisVyIai7lL6I
X-Gm-Gg: AeBDievOCNQbM2e88x9PobT+Y9t/hC3dWHNVzDoePL/1JlJnlcjSr/Lk9wHfqDZU0M+
	t+R3qlpvmlcuOTx+V1GOLG8ShlFzLn1O3A4k51SFRy1IAth9fHJs+hE4MqFvnz2HJUm3WC5Mcaq
	h/0vOU/N8PvLAgBlN0HhPe8vi/haiEW0XGeHOfbt4WjON+umT+6Q/DsVQcehZ/482Sk2vfRsv2U
	W/piocCoyH5y4zG+DeOA1DyhIyICz59GkJNXUQc6lBYtJmXw64+Z+Gh9pIBVvbF73fYfVOv4tZb
	GjkR4YisEgB5lV1a3qCobdrvrTAxkaZvZsW0Li4sUQ0RsreAUw5pYnBtfZTQXOfaKjff+DnUfte
	3un1owKQtKGobVsZoUnc5C5gU4hJHpmRcX8aRV85ePysp8EqUsj/HnJGtFniwe2EaGQvDHTo0uc
	qTXtW7UbxIbeik1nv9R7TcsDbiYzpF+k5z9ljkrjMbVgeig6cwuQWB6WO9
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr79860945ad.35.1777945057671;
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm121946995ad.78.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C90604163B7C;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
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
Subject: [PATCH v10 2/3] mtd: spi-nand: Add support for randomizer
Date: Tue,  5 May 2026 09:34:52 +0800
Message-Id: <20260505013453.980249-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
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
index 8aa3753aa..78557e48f 100644
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
+	return spinand->set_randomizer(spinand, rand_val);
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

