Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E121EFFA1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538023; cv=none; b=HpFISHWwdozY0tsjMtXubgBmTMxsIA4rJVcMUOXimnz07lprUNlfh86on0en1tUSIkqaqTCljDGygeqVfVu3lTQMDOun7EaCmCVgZ9b/IPVDBPGwA0kD3oQdHT0wPs6eMITcXrpaGtYBWkL08fhkQENWLrHuJrWzBUwFZgpeO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538023; c=relaxed/simple;
	bh=PlXYwJVoZcAitcoMd6oDDEsPS233Fq9jXMltFsPIzFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijoSbfor5/DZCgMVAQGGPVHTj5WlpxqiDLydjSirMKq/grqNQJLRgZ1OqIcamTpmavWoudFWhS3omOmdTVqatu3xp5jxo2z/GuJRviFWepl4eRq7WKTy+59pFS7rj7nILHaidCASGuvAzVt7p9GaYT7GZGNVEgRqZ4FiErJpMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxgBYSNm; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxgBYSNm"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c85b2139015so58895a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780538021; x=1781142821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfiZ5RhZBSGwt/42O+oDb/ZRmStHvMpcRtGY1P0Mxm0=;
        b=SxgBYSNmiZ6U+ki8Uk1OXzi0pgNPStDuuAByBeCa86D1KoIjvzeMn/xtaC1b/aHL9r
         X9dYKTjDkextjxKOEh+NTLDKfOFWjKYHpmd3TQdR8RdHzDfRLzTVKkb4Ur1Yb9Z2d+p5
         gZqjAVC8cq8QwIt9YOPnDFd8tIbkamgUSyPpLOBMI5vi0ZjnYa4SSeWuvePCehejB56I
         MIkb9co5byNUoXV/mZScc5z6EUGdtmpoo3RUX7iW0NRfcZAF9eYz4TpHgTSyGXJNY+tW
         kWFtlqjbeFHSBQmE6ratdxUbC4ApRdHNuPoMLQ90rDmiBHH5hyB3X/bNNhX5oNmUUyJS
         WP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538021; x=1781142821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfiZ5RhZBSGwt/42O+oDb/ZRmStHvMpcRtGY1P0Mxm0=;
        b=lDUB9+m+5QI3GUDKP7vYWqYMlXPrkIKn8v3gala2juLg4cjyciKoShf6/SUzQf5eES
         XSDRb9+xy1ZXZerPOb/n9GEC/P5rFWveXHh3L85Dlbz+9DIcPt9cQUpmmGhorHqq4cmv
         Tj/DwCXTaU0wWH1LLxB6Qvio31axZaZqhj50UmK03qCy4yiL+WkYUUFPQzUel27uIb8U
         pwxX6OmLWvPx9PMwbTG8UiYwiyHVdNE0YESv4TU6daPuc99rgiJQ3tx8x2x6dTf4gFf5
         x8ttb+aKiobut1BfqNLQdKkK4Ue3U3ioA5DkFNrXi61k4QMtRWNWxtYimBtmcUdd3mUv
         oiHg==
X-Gm-Message-State: AOJu0Yw2loIcYrC0J4IxCOWh3BaemcrdTJ/S9l7GkkMCUe43vPFlJv7s
	J4zw3BiFDuXGoisZWX1QJ2WnGF7f83gorOdZw064IVrZhTsLXuxBWBXOMrKYrWsRoVNWNw==
X-Gm-Gg: Acq92OHf+FRFhtpHar/FWHcScQ3OXbsrBD2ERcTciFk0rpmuPsYv9zDkO7CD69GxRNG
	xkB8PbJQD1bOXPOlzJZlxHeYLY4cx4G4ijuZv+LQmuA5ChicT6iyhqDI+riXnaqDPndW/ffoXRG
	NcrU8aNoZhMqRJcq9P7QOyx9JrTtsLoPZdeNAAH1J9UgdZNsKVDsxS2EVKP3vE1cVO+ko2laQVG
	vbMRuscAOq/JA2lNVOnHso3YIYUGa6QzianBivVnS805o0/g4jNbptKuXt8xiUJxgb8GZcPs7KQ
	Rw36evNnDb9SLDIfqK0oUVWQUyLKj5Ri6lFM/NUrXHWah4IeH/tCZGQvGk3TjMPRCLEQZ2NGAAn
	stWp5lAvTJUFgkwA2snHKnHuNH4nNHr0/oDKaeVxksxKZE74yJrVEG0xxoXs/qr6HDs65nk6Bf+
	oOSCGqeRdC12fSjF0yDOh5nxq+m492SyjgJztPk4cgPMf9BXA=
X-Received: by 2002:a05:6a21:6e88:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3b497a4269fmr6178467637.43.1780538021233;
        Wed, 03 Jun 2026 18:53:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4b60sm3388969a12.15.2026.06.03.18.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:53:40 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH v4] of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
Date: Thu,  4 Jun 2026 09:53:32 +0800
Message-ID: <20260604015332.3669384-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

The global pointer 'reserved_mem' continues to reference the
reserved_mem_array which lives in __initdata if
alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
exported for post-init use, that would dereference freed memory
and trigger a use-after-free.

So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
fails.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

---
v3 -> v4:
1. Move prints to 'fail' label.
2. Change return value from bool to int.
---
 drivers/of/of_reserved_mem.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..deaea58c74f2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,29 +69,32 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static void __init alloc_reserved_mem_array(void)
+static int __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
+	int ret;
+
+	if (!total_reserved_mem_cnt)
+		return 0;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
-		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		ret = -EOVERFLOW;
+		goto fail;
 	}
 
 	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
 	if (!new_array) {
-		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
-		return;
+		ret = -ENOMEM;
+		goto fail;
 	}
 
 	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
 	if (copy_size == SIZE_MAX) {
 		memblock_free(new_array, alloc_size);
-		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
-		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		ret = -EOVERFLOW;
+		goto fail;
 	}
 
 	memset_size = alloc_size - copy_size;
@@ -100,6 +103,12 @@ static void __init alloc_reserved_mem_array(void)
 	memset(new_array + reserved_mem_count, 0, memset_size);
 
 	reserved_mem = new_array;
+	return 0;
+
+fail:
+	pr_err("Failed to allocate memory for reserved_mem array with err: %d", ret);
+	reserved_mem_count = 0;
+	return ret;
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
@@ -266,7 +275,8 @@ void __init fdt_scan_reserved_mem_late(void)
 	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
+	if (alloc_reserved_mem_array())
+		return;
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-- 
2.43.0

