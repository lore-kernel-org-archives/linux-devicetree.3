Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD85414A1E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596024; cv=none; b=Ne1UwzFgHEMbYpMjHISvDdJtFI6CQfNq9RpxwKRLNaNr1TvUFL2jZao7QHQNDSUskyYTJqZ70x7T4HXW9pOduvir2YPzRUAGhiecHGgMfBW7HEegGo0X3QoLLeZDUa8gpkzh5ocjxrnhRqHqllzhKa7270srOrbvzS6DCQ0zRQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596024; c=relaxed/simple;
	bh=YerxN599C9K5/WkW/n/MaJlm+4DTVduUUon9gz0fQMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fb1R1MiQeX0+5YOV7YXxNIaRUXZfn/K7eHw7R5fzAlJqSFmMtQQzBS3s39+19+t3/T4ZXYTmw0SD5S2NmI80O/e7NYDlRtFHfyyIOmRFAmssbopE4p3bxTROA2ZYkzcEKas7cjMw6Ldzmji/pEHpihrai44ro2ItD/I3a/+o3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=jdZsNiCo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="jdZsNiCo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso7006005e9.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596021; x=1784200821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=jdZsNiCo+6BTDfnwFVKV6FilhibyrRSCHHhmmNXasPcRUZbRMvTC0FQM0tpeYVuaI/
         p97o8OsYJiwVImBWXjmtjgUss4hdr7W/7mg8E9Ndx+OEeDbFkSozfbsFpT932ak136gS
         NXgY3lFAI7gIEUVvNGi7NcZnTu8n14yXqldQjNUEmglBixY70GRiTQzSrfeyWIpWz23g
         mDSnChRZKQB6t2SzqUqLRLsPXhWgZiOL2+xHx211wuYwJybe6y271H3ZYsYZQVqEdvpT
         znLkKtxfM5nmhvYmEY8p5ZmSEHwb9ZMsJcGBHj4E09GTKvIA1fJUWMSelULa6UjQrQ+k
         zuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596021; x=1784200821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9Qpcj/wkj9TypLUNOyfNd+pq1jx929AEvSS7+Vs/LQ=;
        b=a/XXgPZOLwEm61s7zq0Z0jzqSx2O9IXjb6pyYHDMbNY2M0JtITIvI3I9M4eVdm5c+2
         0ZB7Ed8fXlUh6w0+lZ+ca9gbwxE2ZXOD5h6IZW3Dp0nelZ3VIP+n4TebEZ/Z1U/FN64P
         zx8N+eChi7TeSm9o5TTeb+10o+g1c6KGYT2Bz4CNihwM0dUrEzs24ojRsU6Cjvij8eYF
         PoDzySt5Tz3lQc44YcRlQ4JeL2tXsyKkaDuGI6niOvr+aJxfFI5V7HcVL1sSvQmsI27J
         dJOCckglrvwKMvF8stU0o6zhvFrGuVuIvLVPYvLkQ1LJnisn9+OyrJzTQnvYmvbmkDVU
         Da0g==
X-Forwarded-Encrypted: i=1; AHgh+RoF+9vS8xZiXetBEgu90tAozb/lnAEqu8Vc5MmJEwCHd5kloqdUm7ivcGH40r7ekzLjSeAsiaKGKFuV@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRa9yKzIyrUF2OGL7mFkWjgEwsALvDxNx1QhDPQOqwNYiSFrS
	inkbUHqZ5fPBlreRjyEo5KAXmDBqtH7uBaMJ+1IoiUlzs0kaLi4/8rYpWWVk8dM+Vk6GMLnViZQ
	Zh6ht
X-Gm-Gg: AfdE7cmZvxjoWAowFMb0qHkblMeBQDHfAwRzCYxSXTiXyZ9fXlugT5uy84aiZlXhjDj
	ryxxqXNj/i4Zw6sGN1gf4limAI8eXJatiozxp01efPemKNoeIHe4apmwZUnp/TSmH6q97EpSisV
	DvjB41m+brDjDLXylR7a79ATRWgyuEOv0HOPhk6iO6vMvK4VM+/ySfzQA+VEcTmMsVmkBzM4B0I
	tTS37C2NRZzvJbaXQw9LNl2yC799rPhhlt2+f2Rvt0MbhWSc9ZSM7mxeRkD4O8fjtLIF8IawSPx
	I68NVZUBiqjGK4yXLQONX4IVOds1lNx25M05befuH+ZOuqs/7NDq/28BMnmS69lQ8idJ9dn5X2d
	YPhoQ/shP7FrYw2AZ9pPEt2aVhnjrxyus6NxCpUREQJetrCqSC7JYIt3NV1ml25c54eZbhC6Y/T
	C6vWG8/VPXR1r3nrhxjdiArTcCd+6cxTw4XarXcpT0g+9syIhnblM0Elxt5Y6rqeVzeolgFcB8n
	mwNRQQn/JKOWx16ZfjPoHyT/BEdClzlHXJ4F1Gm7+cNffPWDsRiug==
X-Received: by 2002:a05:600c:8b6a:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493e88760f3mr51787825e9.34.1783596021331;
        Thu, 09 Jul 2026 04:20:21 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:20 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/5] spi: atmel-quadspi: use init callback for gclk variants
Date: Thu,  9 Jul 2026 13:19:09 +0200
Message-ID: <20260709112006.390742-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign the existing SAMA7G5 initialization routine to every generic
clock variant and dispatch initialization exclusively through the
capability callback.

This keeps hardware capabilities separate from initialization selection
and lets variants override the sequence explicitly.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/atmel-quadspi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 62ea84d234d0..d1aec14e3978 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1159,10 +1159,7 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 	/* The controller can communicate with a single peripheral device (target). */
 	aq->target_max_speed_hz = spi->max_speed_hz;
 
-	if (aq->caps->init)
-		return aq->caps->init(aq);
-
-	return atmel_qspi_sama7g5_init(aq);
+	return aq->caps->init(aq);
 }
 
 static int atmel_qspi_setup(struct spi_device *spi)
@@ -1576,11 +1573,8 @@ static int __maybe_unused atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
-	if (aq->caps->init)
-		return aq->caps->init(aq);
-
 	if (aq->caps->has_gclk)
-		return atmel_qspi_sama7g5_init(aq);
+		return aq->caps->init(aq);
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret < 0)
@@ -1638,6 +1632,7 @@ static const struct atmel_qspi_caps atmel_sam9x60_qspi_caps = {
 
 static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
 	.max_speed_hz = SAM9X7_QSPI_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1648,6 +1643,7 @@ static const struct atmel_qspi_caps atmel_sam9x7_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7d65_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1658,6 +1654,7 @@ static const struct atmel_qspi_caps atmel_sama7d65_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7d65_qspi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.has_dma = true,
 	.has_2xgclk = true,
@@ -1666,6 +1663,7 @@ static const struct atmel_qspi_caps atmel_sama7d65_qspi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI0_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.octal = true,
 	.has_dma = true,
@@ -1675,6 +1673,7 @@ static const struct atmel_qspi_caps atmel_sama7g5_ospi_caps = {
 
 static const struct atmel_qspi_caps atmel_sama7g5_qspi_caps = {
 	.max_speed_hz = SAMA7G5_QSPI1_SDR_MAX_SPEED_HZ,
+	.init = atmel_qspi_sama7g5_init,
 	.has_gclk = true,
 	.has_dma = true,
 	.has_dllon = true,
-- 
2.55.0

