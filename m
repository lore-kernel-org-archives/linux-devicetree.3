Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C43C4B72
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484044; cv=none; b=Bv38OMhGaOVRq0c2vwQ/I7hVsUi4zsEcLM524e3HvqeVQAgDamub5mANAbiagN3XY3+o9YAGuDfoIQySdqGYYWy6CPcDWqY4rR96P8YnIebxZqn6XutOBhrL86YdYulZqEkNyH1U5lTb6YbGwRs+JBPUXJ4ZwJ7QVrEORjjPL2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484044; c=relaxed/simple;
	bh=lOHqOlIvPJWO2MOvJv0kGLGvV1DZo4M8ElXRI6PgaVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNSkqvknkcr/wSSomrmd9rzp3J5SDu+RwZuUUFr/t6KhRKSOjT5AvpYT42PcF1nBf+cUQ9jZegIHA8Rh8d5kwEy/Q8w0O1S6Cj0SxlMd3mu+bjI3/HTEaAOur3JAHOOFpRibUtqhDSEVy4PkedGyh8qMS/OLdYHBCAcFjVDP8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRJBnE/9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRJBnE/9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2022323c37so389670466b.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484040; x=1788088840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXbW16L5wvPepfurbHdIAab5lg7qHN9GJKcsA1M84NI=;
        b=VRJBnE/9klHRKPMsWMz0i/UfnR2hN3k5oCq2HAomABU5oAAlYQOkd02sx+LmmgN/wX
         M+0k06PMDNapxwrnRYwRBMU8KGVoFuqkE3ev6kaSFBNeu5YKno+bDPH0Lwyp/kfMOUhF
         zXxnXsNOHfVxfw5X0h4Fu4e4CkGhEq6Wik/VaSxVNotdSP7qgReGS5Okh5bCNlsFK7ku
         k6fcdLGbGuAp8A347JEul3hBptUyiAwStlP+4nX6t0HBeqKXFos0h0+frxmTnBXssJBi
         P0PkW3fs16uxvckeOzFMkq3vZpoHUxQmQoZdydreAyutUgkysQfqAWs1TidU0IXT0psI
         QPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484040; x=1788088840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXbW16L5wvPepfurbHdIAab5lg7qHN9GJKcsA1M84NI=;
        b=EdRcEzyZR5fZVWbS0XaIhLlkVQTI8z+t87hz9/ytVIKoNFxCHIIX9BhahrjctsxBGm
         DhYKwulhDJZxfroTSDFpO9d4X7D7NZoD7NyB2IKY0cpmFqTvNZe0ic/dojRwmK1y55tH
         PopQLhIjWvFH1K4263sZwNOWpkxYCrHvH+HcDuwj7ML5ixDwG4PMMKs9Ibek1HeX2sAK
         QKMiKfCuzxrV0dID5E1Ja0V4to2u5xS9L/sXrbQNy4KwIaCqRoGSFzGS60rhlpEemzsT
         DT7Osr1cwXb6bcd90f6QZ4tcpn5BYDPSkU9IXFy+Oknblp+yOdAVAZKO7rpAtlWtPeKi
         B/Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpLLnxaWlJzK4Tf5QLte5OY37RZ6a3jtFLjYRJvkyhcGn1dftu0hU2jRYWuOklGe30zvPPa6Ma3l6Wo@vger.kernel.org
X-Gm-Message-State: AFuF++nOXDTFlABrfpvtbrMdZ0e5ZmDZdfu0NyZbsH7Hg2HOSWQtHy/4
	7nwcvvWdafh/ev+a0b2gMS3TDHy3ZN9JiO8R/KqeIzLI0BQGTjM/+OM/
X-Gm-Gg: AR+sD11hKu3HG9mswOj3ZuRDeephMEc+E4z0lRtL0yREinhnkKAwofm/6ApPpy4FMgn
	SJ6DJ3OhC1uA5/XnT2n6M6uS/Y1xYIF+ltGrJLELFK5T0g/m1VWPgrgsea/FLicPqN5M2XwTezO
	Rsudd2UQ31/oBe1Pvi183Ta1Jz0rucn/yyuTB72jfgaYUdlLZif+j9S/KV6ovZP16tQIocmP3v4
	XDqBUTGzKaqO37CfsJlx8bJQOZLoeo7nD7J981a8quypHktEyzdIepyEMxMPW9qzWm3JA2juuHa
	3ZR5LY1/5p3dPcstxOESl1wx9Sa2fZp9T3IBZQJOdKMHN5tW1mZO8eFg+9FTN2tJvB7+tWl7wwD
	6KVzhJjU66gAwuJxHOVFxYz/TUEkw8d0e6KTg4Tq/L+d7gkkFqZGpnB1jtIyT9/8xYPODs5zLQg
	sFJ2V3xuuy2E/GgWwWyaBAGHOzAaQ3cJmrunuuZRG1SyOzZhEelrz0eX44xlLEuyuBYw==
X-Received: by 2002:a17:907:1b0b:b0:c12:e178:9e68 with SMTP id a640c23a62f3a-c246a63071emr1921055866b.19.1787484039486;
        Sun, 23 Aug 2026 04:20:39 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:39 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v5 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with C99
Date: Sun, 23 Aug 2026 14:19:57 +0300
Message-ID: <20260823111959.17029-5-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823111959.17029-1-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd130x_spi_id[] is initialized with positional initializers, which
easily create easy-to-miss bugs when changing the members of the target
struct (struct spi_device_id in this example).

Change this to C99 initializers to guarantee each member is initialized
with the correct value.

Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index b52f5fd592a1..be50e5aa2c87 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -160,17 +160,17 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  */
 static const struct spi_device_id ssd130x_spi_id[] = {
 	/* ssd130x family */
-	{ "sh1106",  SH1106_ID },
-	{ "ssd1305", SSD1305_ID },
-	{ "ssd1306", SSD1306_ID },
-	{ "ssd1307", SSD1307_ID },
-	{ "ssd1309", SSD1309_ID },
+	{ .name = "sh1106", .driver_data = SH1106_ID },
+	{ .name = "ssd1305", .driver_data = SSD1305_ID },
+	{ .name = "ssd1306", .driver_data = SSD1306_ID },
+	{ .name = "ssd1307", .driver_data = SSD1307_ID },
+	{ .name = "ssd1309", .driver_data = SSD1309_ID },
 	/* ssd132x family */
-	{ "ssd1322", SSD1322_ID },
-	{ "ssd1325", SSD1325_ID },
-	{ "ssd1327", SSD1327_ID },
+	{ .name = "ssd1322", .driver_data = SSD1322_ID },
+	{ .name = "ssd1325", .driver_data = SSD1325_ID },
+	{ .name = "ssd1327", .driver_data = SSD1327_ID },
 	/* ssd133x family */
-	{ "ssd1331", SSD1331_ID },
+	{ .name = "ssd1331", .driver_data = SSD1331_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_id);
-- 
2.55.0

