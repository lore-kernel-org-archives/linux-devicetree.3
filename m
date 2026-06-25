Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D23909A8
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380723; cv=none; b=gUvx6u6BxUGRgZWOmiNoQppRnXXmzhcLEXVIMQ+Wk2LGF1eelsEueFJLuTxCWN8CjBpMIHFJ45E4g/jT2rDVeBcUx/rhOBa62NzqVcAniwjpQJN/34an8Rv3ZBg10e4lNTrQUDZK7pXBk+dlwrRlz6M81XXmW/6R01XZNX437xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380723; c=relaxed/simple;
	bh=ydDdUCm7QCGwGoCCLZJ8KIgrvcDgIujnhhPSUHN8+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwqb4x5Wfqakae/alcERzNE2Qs5NIYws87032Ly8xSfcKBelI0NNY7eZnsjfrId9fBcwiIAjDtnEtZG1rYfAoBAAIBnHs/z8HXP2t9hVrImZt4Ymx1vOr009KP9fQ3OeUdeXDGORZJXi9e5CtVFKJlKt7oRvrFLcHh5DsNUhyCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHfxQLPB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHfxQLPB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37d4ab2e7c5so1801510a91.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380722; x=1782985522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58+0tcE1xtERmBsdwhzofL6yvn0GjZ9wff4i+1M3Fr4=;
        b=sHfxQLPBo/FsrPIzqA+yyIXOxKJ4SVylhbirOklEYnXzFDw1YJyjTGuqLtX/bMXuJF
         Sv2gOfpbsnOKlkzXta6iRDgqvDrwcN7e5Hzm8C8bZ1S+2ZqYZHi/7E3FsfdXYh5hAsv5
         ExN65jlGHM5+ej0bVKIeRogRSeWft+7wHYRo6DkGupJ144zfy4lRcQh5JMmKO3KNSIUA
         CgWpx1jrwzfI+TRL4T4PDuMlSXw9tPxwmOYuCfJ5LyQWYJ4e/xspj3/W0zPs15HWdKL9
         seR30IS7OIIfVdJE9oHuNXgdOUTynZgjOYqIcK7qBmReLmG9P1DA3aeIfCjZFi8gp/pV
         Vnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380722; x=1782985522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=58+0tcE1xtERmBsdwhzofL6yvn0GjZ9wff4i+1M3Fr4=;
        b=D7BwseiE800yxUoVVuhlIH9VmYWh72a8UKOTigj1tEMVDX1molDWAoQc9hhOizPxHg
         z3eo39LHWSaEy7edl7FbbyhPUyGuJs+MnnnyPB440quD4ylUrVZXawtfioJeqPPXJxwb
         9UAWs6pMfgL2NGbBMhE4BL+o/N1qQBlvb1TJGXv5sbbNqM5A9UrRLginkYnlSI5eEYRR
         xs6g5y5eKbZ7dAv/AHA4vnWjt2ihaWIBqkHKQmp4kXuoHFGrNYT4iKAYXuNiItkHPG7Y
         9H3un1fmEVkPVzgMJP+8sqZR5xvsRZWw05XN2uvGo/Ynmg4N82Y5t1fuwR5p5Ver5mgP
         PHDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqyec+Mjlhw0eTyfZZ0Mg8qJGMgF+WfiIXSL/KrzgIOzhQWGvNf0cWo7DLuaJi8LRKZkmyjReEm9yz4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKf+kVMBSz3FoDz/69sQqPe9wmK+iWBZvGDeacaEq3n1uQsH4
	OlN+8Q7qUz+wOqDo4YFVL2hMuxGGTTfrexjX74tcvssA5GWZ7x9oIWW3
X-Gm-Gg: AfdE7cnMQWP3Y0I8SuAA0agUPXCmYhDTBpLtM9jdFDfZueipHG6JY0pxxJ1bqrC184e
	6QqiSm6ZaBEN/nqXWuP6pxTKoB1fz/I0GpKnfZ8xYJsw4SalxjZQzK61fXunu982Tb0o4tqWJGB
	1EKR9mM9vP9+1Ei3lRFskj0mEcWS4OAyLTt/UJCgOQkmYH3+FdTRcOj/AHSKOpuIiFN4BUeclk9
	9qFSK3zXdq8petMvBSrGgnJSLZIWt0DTXHGcRiv4A80q4J+WW1f/qYatyJVyFK3PGevQERYQHri
	XsNdePRCySNqtKY8EmAKkmF0+UtEEODHA3pdKZz2rYejI1r+/jYd4fm2eXtTX4svhlYbfckC1PQ
	s+P95/tZ+JQsW5cbmKRUnMJsaKX8mUW2zkeb575MqK9Cnfoivx3fI3LuI6txQ+glF0UW+OdAjCt
	XK/ui40ffnrCpWokQyeBOg2ZYlFvayYEBvNfE72vrJRYZPlfDeDOFT6Hqaz7A/c/9qMCmXbC00E
	Q==
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr20484605ad.4.1782380722046;
        Thu, 25 Jun 2026 02:45:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:21 -0700 (PDT)
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
Subject: [PATCH v5 7/7] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Thu, 25 Jun 2026 17:44:49 +0800
Message-ID: <20260625094449.708386-8-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..295d246eb4b4 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0

