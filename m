Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21F423EAA0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826219; cv=none; b=jpqP5y6m1X1BGlYuY371NdZ0iX27WfzLtJ3K1sWCFCzWQY6TKvlwlTOEfywSEO1t6d+bx6vGHapXlOFg1azcWtYxCEuPGgs1trcO0hXh7RtThFliHOIp+oQJCiN87yVVuroSfzGvkpjk6TbeZOOiMAm2eBDYVa1+8xeNTqPh+cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826219; c=relaxed/simple;
	bh=se8oO18KwTGJI+h1AL7a07PDyLW5Lj3zt4kqe00qAWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9KqyakZzEZdTFTIcDaqqis/bgC20hr0OmBYrlHB1SCWdttwVn7dC9+Uxe1/Rxt03GFWm0hoKZ8kg41tb19X0FqlSHSeet5ts8Fkxk9CDaunUiwYzfhsngZZQjcyQaCx9Ciz1cpxlR0oedUF0S66A4uNqA/+lvWg98YgYvBOUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZZ4wZI4; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZZ4wZI4"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8e9c9d63815so28246236d6.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826217; x=1783431017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=PZZ4wZI4qKGtR5TIMw5s/uRJMwYpT3Vw5qz4HLCUmrxEMONwqUw6T6KbZvmyR/z36K
         NA7FjvzIhob7Db2nq1D5LI6WaZ3L1Fqtk/d9bA2lDsobYj4xC2RiD+4va3zTGrQR+eve
         0BlBmvvibuT3lUsoXxsPPVKlbWCSqzuJPGm7+VBl28UjYjK6+71RRIeZbAAc2brpgN7H
         Dd0Zx8QmONFHMzD9KhLVKnJz2DiaiC9lPf652LrGNnzMJHoicY/J1vz9MnGnMmWm5ktF
         blU59yDM/kSjkLsg2KEQld7fa5Hb4vJd4kZj+nYN0JhH2qUrI0QAG0YeCrWkXo7uMO7y
         YfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826217; x=1783431017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=LASrRA11/LEQYjYo4J9rZTHCoe8KWaaa/fAbVEZy1NvjQ7EhKNBKBbtkzlChcTkyAZ
         xuOzYwrfhpUlL5Fb+UxZdzn94SsiW1REAWC7J+DdjeZS42gOZ16+nxv/hG5sjYFsY8YX
         QUPhVQFiOCSZWw1+IL6mem/Feah1W6nP17f6SlUfICa16BGLM9a8VKpoEUHMqwpX9FCy
         oiBarc7j06SUrprGmYSmRajG5qttzfqJ5ktoNM1qTO5PYL0Rfzurftnwt8RwWU1/2Q4x
         uGBu7dPKE0gjUw0DbZNIfAh/qD+AEwPbw1aj6TksTDzr1BQyrxabqeqvqnr0H2KCYu5A
         7Uqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro86E6Fz80CSy5anP4KNnedHo8MghFAHl0NmHFy8iTqgfElmUKiq920SWNtkz5gMUZ36kPmqePSPbfo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qImU92wTbVZj3K6JuX14C7+5p2nuwPlhENF74jNiKsixZQzF
	y9DgkEyY25TgvXKMCubBh4N3OntMSTWGUFWNh79IXIChLP0LcacgP4GK
X-Gm-Gg: AfdE7cluhgVqT2D4L7FvFvBV0TyCjiZtM31BY7BzBy/0sIx8bRtl6kb96KEvE5SR6Eu
	AF5XFiRWAv5oOGcRv5hDxfU5KaJdlRxkr2FGT11foeweppWrzyU6q8iI0qDaMlGzznEGzTUE0EG
	Puv3syveHaiCKPZ6JNFOtE9Z4LPY2/6kBaTcYW7mYR9E5bj0857n7aa5MBWzfw8q1ECNYktMAZQ
	wzMLurut+6tyR+YZWaQqheF4B7jFKYfY2edxTYAdOSJVPBSvcBM4TJ/Do9+mFx83RnBej9ojwrb
	Lzl8VOhQ2C8SDGcIAhgKJoL/JeBGlPAs7siL3rl3setC2E8xTyzSDyyFd5wSrCi8oJIcCfgaEl2
	xEMtAi+s3OYovw4PKuAN8r1+ge3i333jlCw5y3/wzfYQlFWMocFXCT+KtTy3YyLKTcdpRiSRtce
	ZiaqPyEMO+vka9tIxj3G9sh7d8fUCA2el3Zdr343SOosyYlA==
X-Received: by 2002:a05:6214:8082:b0:8f0:ead1:a00c with SMTP id 6a1803df08f44-8f2d25b4bc8mr7948476d6.55.1782826216155;
        Tue, 30 Jun 2026 06:30:16 -0700 (PDT)
Received: from dev.lan (c-75-67-38-46.hsd1.ma.comcast.net. [75.67.38.46])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8f1a7b26b2csm23003536d6.45.2026.06.30.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:30:15 -0700 (PDT)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from device tree
Date: Tue, 30 Jun 2026 13:30:00 +0000
Message-ID: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath10k and ath11k support reading calibration variants from the device
tree to locate the correct Board Description File (BDF). The ath12k-wsi
binding already describes using qcom,calibration-variant but it is not
implemented in the driver.

Many ath12k designs expose all the radios under a single phy, each of
which typically require a separate BDF. Without this, the radios may not
come up or will not be calibrated correctly.

Fix this by parsing the device tree for the generation-agnostic
qcom,calibration-variant. This allows the driver to properly select,
read and apply the correct BDF.

Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
---
Changes in v2:
- Drop ath12k-specific binding qcom,ath12k-calibration-variant in favor
  of generation agnostic qcom,calibration-variant.
- Link to v1: https://lore.kernel.org/all/20260131003222.2011259-1-andrewjlamarche@gmail.com
---
 drivers/net/wireless/ath/ath12k/core.c | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..52c28864c63c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -812,6 +812,28 @@ int ath12k_core_check_smbios(struct ath12k_base *ab)
 	return 0;
 }
 
+int ath12k_core_check_dt(struct ath12k_base *ab)
+{
+	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
+	const char *variant = NULL;
+	struct device_node *node;
+
+	node = ab->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	of_property_read_string(node, "qcom,calibration-variant",
+			&variant);
+	if (!variant)
+		return -ENODATA;
+
+	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);
+
+	return 0;
+}
+
 static int ath12k_core_soc_create(struct ath12k_base *ab)
 {
 	int ret;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..3cf39ae06fd3 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	if (r)
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
 
+	r = ath12k_core_check_dt(ab);
+	if (r)
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
+
 	r = ath12k_acpi_start(ab);
 	if (r)
 		/* ACPI is optional so continue in case of an error */
-- 
2.43.0

