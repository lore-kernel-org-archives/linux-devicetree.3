Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B135A938
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 01:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777945061; cv=none; b=jbu8uMUJ3jt+jwDz4jQHCw00yJgwNceoOwO4HISj7Eb9G+vOZJjFNISnQ70DuVGIpSAOHsh7n6O3QmHI2OZEYp9RNQrLpNtUZOHYCnyqHJF4KNwnSBwcsQFqeUikgyyuED7lEchmBSvxxfaglyTRU+y45PaOLJZZXkdUfrkszUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777945061; c=relaxed/simple;
	bh=nc9xzWGieI96ay597NLMvP3dG7sK3h1DVK1/mbeJvZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bZtQvK8nj5NK3P6ZKgpNR3n6E7gs1RCagt5nmC8oiHtbsLlBG6cQzUgl1iuXTy8kj75Q19eClwk+Y4vB29uromTw+fEpI5N+8QqamDaYSFcyNJr4GEbl757pWO00n9oTTxegXB9hUvAZ+uJTZUj+0CiDKlCXhxQjAjx4E6B9rNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw/LElw+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw/LElw+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so972123b3a.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945059; x=1778549859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csjPh52S+pcBTGEpydk3ocZJOCMxJr2uaOVx7ol9BXo=;
        b=aw/LElw+lH5TTcwVGkD8qWxw0qy19b2hzqW3KxpXsDrl038tQ8+74jV+w5uz8Hnk1L
         GrefSHT0e+XQ6Gug5Wt+6vRXknf/ycNBuUCLlsXhStGzyyqxizPtAuYtpSn7WWsCPH2L
         3Luu69gxDlQMekm78NUfp5J4au0hbDtE0NHBRYVV6K2Uer9MQBigNS2g9aD5LiSAvutN
         ldNNIRU7M98gi+gueMFn5EFoDwtjP4rxr5s23mQurNOK+7gn1JhTBD36XsM/KjCw3bbz
         +uye51/xHkEkc3R+UPAICmspzN1rzGz6ez4+Kn0qlJ6n4ipo19QaY0p3aamgY0Sll7iP
         RI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945059; x=1778549859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csjPh52S+pcBTGEpydk3ocZJOCMxJr2uaOVx7ol9BXo=;
        b=smnVdMkD3TQq1ObTjN8hAV2lIchNxs88qL+7ciOwllQ96/gDGHgJPllwQMtj+uMsfB
         y/VWe9kqmAWoZ69q9KPl5wtsTDhPt6TcLQai8WSlbLqFNKBclZ/dDU0ZKSVihJ1zKBQJ
         XxEMB3FaLTzgqHRm044uoAOSQDVBchIxIlz6haLdrd727F3qAzVbjR+6t8IAWBlilCHW
         CYtZyr5lzoavTEjQsooNyHJXmGGG+j6fjWnxdYmv78H4AmaOmt/om7itltobkKE39heK
         e9ElMUPmXAQKG69W5ewGX0qtqTnOGk/MAb6moQPMHX2I72dyUBGmCWQ/47Bvf4U8/fM3
         C28Q==
X-Forwarded-Encrypted: i=1; AFNElJ9rT7vQnMMY88dmNjX8tAw4+1TfCWyxhQsN0gdxXLzSmYH7908etGsD0qUFl5zFG0iusiwKtDYlmCSq@vger.kernel.org
X-Gm-Message-State: AOJu0YyZG4oOlKn0PDo9NGPmQkEXFbGya84zKxiHiEXOZlnyId+zuatM
	k4LR+oL59uUvfWrW8IClapzoNAB+A72fzyRkDDNQ/7Axhnb7uefVKxZC
X-Gm-Gg: AeBDieucGRnQnVfcY/dZvGfA1IItX/ghO7fWENMMDINubGh5cAWmfftyb4UxtKOfj1J
	cYF6/5tEuUSDgJDeBUhwV0071tLai/rssXm0j7eOSZ09XeruxlMMj6GZnkEV7jur4LEeXdB0JQu
	3LkN8RoXusZjyUTPoGQfRIrukul4T825Ykc8mIb2lIgu0jpPiIjJ3/4UcFTW3E1w8Tk+PyfH+uS
	xRjOKbUGbhr0OpBc6ry2bfrMEjyDyUSg46wosCpPgg9ZegHsICvN7ffZdD+UkjPoZ/908EwaSHi
	nHWeJMZRdjAj/0y8fAo5uuZCJUqA53IeaLmmyweq1KnIZb+IzfD03sV/YjmCo7ofvpVnfyd/GSJ
	hkEHnnCmpFyTh+UJZS9jwIXHnnrsU28hE0xcTqhDZpux5GCAp60nQCo6TVd3iMEO9g1f24kDfOR
	zQjxDp6h33B7K0eOKG7r5Y1eAbKqxpF1hkFNlMBI2FJ9egH+lrslV9lzJj
X-Received: by 2002:a05:6a00:4208:b0:82f:47ec:944f with SMTP id d2e1a72fcca58-838fdaabea1mr1434680b3a.16.1777945058692;
        Mon, 04 May 2026 18:37:38 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8629sm196721b3a.36.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id CE32C4163B7D;
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
Subject: [PATCH v10 3/3] mtd: spi-nand: macronix: Enable randomizer support
Date: Tue,  5 May 2026 09:34:53 +0800
Message-Id: <20260505013453.980249-4-linchengming884@gmail.com>
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

Implement the 'set_randomizer' callback for Macronix SPI NAND chips.
The randomizer is enabled by setting bit 1 of the Configuration Register
(address 0x10).

This patch adds support for the following chips:
  - MX35LFxG24AD series
  - MX35UFxG24AD series

When the randomizer is enabled, data is scrambled internally during
program operations and automatically descrambled during read operations.
This helps reduce bit errors caused by program disturbance.

Please refer to the following link for randomizer feature:
Link: https://www.mxic.com.tw/Lists/ApplicationNote/Attachments/2151/AN1051V1-The%20Introduction%20of%20Randomizer%20Feature%20on%20MX30xFxG28AD_MX35xFxG24AD.pdf

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 38 ++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 67cafa1bb..7dfcc34e9 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -14,6 +14,8 @@
 #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
 #define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
 #define MACRONIX_CFG_CONT_READ         BIT(2)
+#define MACRONIX_CFG_RANDOMIZER_EN     BIT(1)
+#define MACRONIX_FEATURE_ADDR_RANDOMIZER 0x10
 #define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
 #define MACRONIX_NUM_READ_RETRY_MODES 5
 
@@ -170,6 +172,12 @@ static int macronix_set_read_retry(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
+static int macronix_set_randomizer(struct spinand_device *spinand, bool enable)
+{
+	return spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER,
+				    enable ? MACRONIX_CFG_RANDOMIZER_EN : 0);
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -231,7 +239,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -243,7 +252,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -254,7 +264,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -266,7 +277,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -277,7 +289,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -327,7 +340,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -340,7 +354,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -381,7 +396,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -394,7 +410,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -444,7 +461,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF1GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.25.1

