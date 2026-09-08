Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E952122E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859748; cv=none; b=F7eRRNqljCSdttIaNVSxXC5jSTp9i9TM8eh6hOHvSQ1SSKooSYGZG8t1PFpHfGoLyb+mLaecXmUqA0a4sIelYwT7FbEIAs3rh1tu+5lhE+jG10DmK3wp6WjLFLAt2kSM/UCiJgmM5C+pS+EiL96YeSd2cbDV0BkqtWUphfWDQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859748; c=relaxed/simple;
	bh=HlGrFMsRs0IybKeXdKiG9q5NJ5arwAx2J4jsvINPDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XydhGrKZf7xUNTwpoEtJSkaeOWhQS47zS2NRL5h6z4mmIf8s4vt5FhzHs6fMs+5/wdzjL8xwMfgkgamaYBaByhNP90YP+SyCZ4c05IR/iXhJAevcHEgWbQ0C6+s28S1BRkJX9oZp7yTFXRGAgheFR8RFTjJcGKoJWdDl9QuZxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOAffkoh; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOAffkoh"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2343334a12.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859746; x=1789464546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=jOAffkoh1fH/84lQajs+py7zI6k4AxG2y/Z//VrT48J4H0NW6FN+3MCbucJCSjRRxe
         jj1cqvYwWLBMtEaVQHqN5ksRSsZ79ANyjRNL4f8hWH/LmcJEyF8boCHIFK479dWwRIi1
         E4sQ4zjiA9+GDBiDc8CMSxZtgff9/TmUl3Bvg3hV/GbrluEO/OaOJgWVa+igvb/hzZ/1
         e54YJFhz+HD53AU4scq79Nop3tXggZydP4u3andGBg1w3Q2qlwruj2G94vuu6vllV4GK
         IzVzpzNsJmX7uK+Sty5syiCgMAbBjPvvRvNfk9ljwsprIpqtsCtIMn9NnoARl6GrLdUj
         kcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859746; x=1789464546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=V3jCXkrO5FKJPb4+RjkR7YGFIU4w3y0u0oWJ/NHprwMwduskKIKvvlqFZGZ6wf4TAv
         CIRAcAhE2DLqIqXRLlu5i/KzMk0Sm2eBMCWABGuYkT5NSF1KTS4oJEw5T7En0Neiq2ib
         ui1UAQYqgbe6SLPkSFIA0vL+R8qBoR6WFxiAvQETvxfGcKAr3xDXpBXt3nEH7gkZEjLp
         myVbzShXYAOcp7iygYHKwsfDNyttHaF4A2S18Sy6Pf+lrPuKa16g9v6UG/+6B1BkTnt6
         hUA8PsngNzXaFga+6MLfrfVwtDw3ARyyLCw06OLDU8ddIsbwY5viUub2wfioX9Mrjzsc
         kxrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlJ9tU5jSXHn00HAKuU3mzEs75SjH4GxShs1Vu806S9RAywVsyClG5FxGbr0JbZ1QTeJGNgMQ3bjtX@vger.kernel.org
X-Gm-Message-State: AFuF++mi2msgrhzhK4qZE3kr+Aqhqkkb2L0mHtf26h6GZDKNkxUGOnxp
	zI45Iv0nYrs7rDIVLOalgTgUQnZu7QWFxJQ1lX+wkSKkMQy+2vZYF/ZI
X-Gm-Gg: AYBFou0VclZVnXvCA5pg9hE4cLQcULppBQiS6E1JyWJDPSkerE7z5unEPF3bD790mFN
	WP8FTSjvDZaxcyBA3ZKz+ggTbma0C65p0IlNXXgNBNIfu8NMy61Fe5p9BE7aipRKvszv1r9QS0w
	vutArzaQzPcr86tgyJXFDJb+C3zukwvnMgIyOSUOQmjf7ixLip3rbfeAabFi6rpBi+0RWMT0te/
	x68FMha1/q/kOu4R9dAc7m/aK1Xk7MLNkezTbTG8ZBlkCAt+iETIC73QFZNmCqQBsUSDUr+woFz
	dkbQOk8+SKmcx6SRflWZC3aeBAZcH3EaFfafuGdn2GRyX4SDCCX6adN8boBXFAqiUgSB48qKTwi
	KBFP3v7B8OCQ9G8PxrgsI2siBCY4xi10WbVcN8TLH9Pe//VbJqeDheAZ+roL9MwOoc5T4muMWJt
	MGota7IFBijk+BK2F+ElM76891Em2r1q6CZ/OItKxqmqxqvCzumeP6vt6o/KPQT1ebO4TCP7PF3
	HXPnmH8icQ16m7uzwMMKEsdnnYqTCziqh+2IMqMdVsSW34gOqWo07MI4TgcInc=
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr40172772a91.5.1788859746500;
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 5/6] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Tue,  8 Sep 2026 17:28:39 +0800
Message-ID: <20260908092840.225220-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f7785..7d630a667a3f0 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0

