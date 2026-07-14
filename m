Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676A34B1B0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024004; cv=none; b=P0JaNq6Nl0T2jjnO9GvyKK6jIXosc1GmuKcRA66NIR5w/oUmQGZTbGzuH8F5TdvvAUteFU3WKDm3hTQN86H2H6klSwAsWpbFXNFocVbCPGcbQnax0wcj21gOSX0iYPJSowqS6QBfzYojcKPJ0WiTGzskxnh6Wk3a80k3/LOoRxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024004; c=relaxed/simple;
	bh=zvwhYgtOrT/65A46qE3CGEVniA5OMZ97Og1xXdmbsCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjsZaW6ubcUD2xioX2ydMMTybw/Lie8YnELbcaeqEoU62dFrYZlg3iWI3VPtZIKaLZe2YllfxCgxk1U6JlzsQPta9QwgqIeniJt5vXWy64gCatIS5mu8qEeVzf7XzG/NnaSAUH5Xa/NdJkP2BvpsXyYEhrC6fJ6x1oXHnqJC8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WS62cm+j; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WS62cm+j"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47d70879764so2653847f8f.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024001; x=1784628801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzgCndSI4VOkYsn1Kv2muPUKgfIbX1eQd1xKFGHexkU=;
        b=WS62cm+jKJ4mJpnQ7vG+xSi3mloGFLR6VEJsUfiY01XCc/it8A3WC3/pSgacuSSVjH
         Jpd37C+omLhYTZW1YdaoHy0BZ5HdBwgLjGudaAeEhwKFSXzchqQiQKEtJsz986S08IAu
         JhQp+vFnAKhF2gLYW+dWUFWwhT9rmQgCRrPOwmUg4DYjuBn2tCjmdDv8yS3PVmhSi9E6
         81Euj8b3Vz7ehP5glWT3Pfzel77i2l4sFvq4ofnPX2l/dpKkPjsHfuMiBp+NAcWGpk8l
         y3lNGq4XcBgDnuBsRjnzxlPBFYYEMDAA8DwvCV3Wdlpch3SJvIqflKRUwIkt83geHAX9
         CYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024001; x=1784628801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzgCndSI4VOkYsn1Kv2muPUKgfIbX1eQd1xKFGHexkU=;
        b=Oofs8wKHSZZVyLJdiZhSSauPnr6kooPuvvwVspMLwQU6OyzMF8fq/Jnhl0qmNJNFvC
         GpyI/Mzp7AsAAX7IwxQGCAumdtKuw1NAZPmU7kNZw6PQDZb8jLR6Bv55BBx+VZ6Qmqig
         v7YlwTaSyE6vdmhY5xN35el05CvDZtgt2npMPsFZs18y5hXXsr7PH4mTT7KeWkdB+Qcl
         vW0QlpnzTdxUsv0jlNE9JuWP3VR2LoDq5ZbGKYrIvZPNjef4RQ3Q65x3yc25m/ye25RC
         lHcVr0VhIT5asW10h1g4q9MO3Zza7a9KtnMHdeHjXVC259h1Ol0+CLrhM/Rps9d7Hq7z
         oI5w==
X-Forwarded-Encrypted: i=1; AHgh+RrZVxoNm+on05+VYjZGlKT2A+hHMATl3duG+gy39u1g4ZUwWa74YSjIM9Aesd8R1t9MQ4raqsp1U22N@vger.kernel.org
X-Gm-Message-State: AOJu0YxTfZ2/HndK6R6EnrRM9b7RezhD/EONDdFkUYh4jfY7mDXd+Hxk
	ffv0X7RPIsqwqVN/rdKn7HePdgyiXqdsTz6T8effDDgIIPLWKYtF2uWs
X-Gm-Gg: AfdE7clRYXXjhhyQe7bhEML/9XfDYqno+KC/lQjlR1WN/c6y4YYI4Lg4yxFT8NuXuy8
	s00F0Z4+zFe6A8lZAPDg+Yh6IzPSHVRQNjPV7IxGWD2/9sXCK8itZUT3iyo0ddYnZ3fY5vFxnd4
	3hkFmpzxFNshTJsEzlL9pqRMuTTRKH3sl9TFZw6+lPTRdTJlC/PDeyaku2lebDVxOVJbQTyjd0E
	iiU2mTHOWjuM1BjgJXCDhdZg8tW0lPKxfbKNa4RqYZJbqOCg4cSGn5BKwBLaPIdGw7FWB0gn+a7
	sWNYB3UwfSkOVIwGEYFhAn3ibeqR/rE4QUWg3mnMLGy05GoEWt6wVcjQBZOBSDSoaP0NNFtT58x
	lps6tylwMU2XwrodcvNOsNTGd6ljC3rjxYitEmIWJrIQWfKzRFiHQ2KgPyEvYVMFBWsUQyN+4z+
	XNBIbjuQTCZUh0gY3C9ZOQdEhIWjrbz/R5ulHsDuT/mnK5xpatsEuHrqk4bUp6Xf+Iz3V98kGN8
	uK+BXO2wfZWbaS/k7yf1KpPpfBA5IbyDbLxLNSrtMJvDU5j/Pc4jY/4xNY4ae+6kw==
X-Received: by 2002:a05:600c:310f:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493f87dc3e8mr124581685e9.4.1784024001316;
        Tue, 14 Jul 2026 03:13:21 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm7788927f8f.22.2026.07.14.03.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:13:20 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [RFC PATCH 3/3] NOT FOR MERGE: drm/glanda: Add x86 platform test device
Date: Tue, 14 Jul 2026 12:11:45 +0200
Message-ID: <20260714101146.200416-4-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714101146.200416-1-kieweg.leander@gmail.com>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register a mock platform device on x86 architectures to allow
testing the GlandaGPU driver inside QEMU without cross-compiling.

Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig     | 14 ++++++++++++
 drivers/gpu/drm/tiny/glandagpu.c | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 7a15bf95a..156713746 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -67,6 +67,20 @@ config DRM_GLANDA
 	  basic modesetting, dumb buffers, and simple 2D drawing
 	  acceleration via custom hardware IOCTLs.
 
+config DRM_GLANDA_X86_TEST
+    bool "Register a fixed-address test device on x86 (QEMU only)"
+    depends on DRM_GLANDA && X86
+    default n
+    help
+      Registers a platform device at a hardcoded physical address
+      (0xC0000000) for testing GlandaGPU against a QEMU-based digital
+      twin without needing a devicetree.
+
+      WARNING: this blindly ioremaps a fixed physical address range.
+      Do NOT enable this on real x86 hardware. This exists solely to
+      let reviewers test the driver in QEMU without cross-compiling
+      an ARM kernel/rootfs. Leave disabled otherwise.
+
 config DRM_GM12U320
 	tristate "GM12U320 driver for USB projectors"
 	depends on DRM && USB && MMU
diff --git a/drivers/gpu/drm/tiny/glandagpu.c b/drivers/gpu/drm/tiny/glandagpu.c
index 8f87ae096..c1e9370f2 100644
--- a/drivers/gpu/drm/tiny/glandagpu.c
+++ b/drivers/gpu/drm/tiny/glandagpu.c
@@ -741,6 +741,34 @@ static struct platform_driver glandagpu_driver = {
 	.remove = glandagpu_remove,
 };
 
+#ifdef CONFIG_DRM_GLANDA_X86_TEST
+static struct platform_device *pdev_x86;
+
+static struct resource glandagpu_resources[] = {
+	[0] = {			/* Single resource covering VRAM and MMIO. */
+	       .start = BRIDGE_BASE,
+	       .end = GLANDA_BASE_SIZE,
+	       .flags = IORESOURCE_MEM,},
+	[1] = {			/* IRQ */
+	       .start = 11,
+	       .end = 11,
+	       .flags = IORESOURCE_IRQ,},
+};
+
+static int glandagpu_register_x86_test_device(void)
+{
+	pdev_x86 = platform_device_register_simple("glandagpu", -1,
+						   glandagpu_resources,
+						   ARRAY_SIZE(glandagpu_resources));
+	if (IS_ERR(pdev_x86)) {
+		pr_err("GlandaGPU: Failed to register platform device\n");
+		return PTR_ERR(pdev_x86);
+	}
+
+	return 0;
+}
+#endif
+
 static int __init glandagpu_init(void)
 {
 	int ret;
@@ -750,6 +778,13 @@ static int __init glandagpu_init(void)
 		pr_err("GlandaGPU: Failed to register platform driver\n");
 		return ret;
 	}
+#ifdef CONFIG_DRM_GLANDA_X86_TEST
+	ret = glandagpu_register_x86_test_device();
+	if (ret) {
+		platform_driver_unregister(&glandagpu_driver);
+		return ret;
+	}
+#endif
 
 	pr_info("GlandaGPU: Module loaded successfully\n");
 	return 0;
@@ -757,6 +792,10 @@ static int __init glandagpu_init(void)
 
 static void __exit glandagpu_exit(void)
 {
+#ifdef CONFIG_DRM_GLANDA_X86_TEST
+	if (pdev_x86)
+		platform_device_unregister(pdev_x86);
+#endif
 	platform_driver_unregister(&glandagpu_driver);
 	pr_info("GlandaGPU: Module unloaded\n");
 }
-- 
2.43.0

