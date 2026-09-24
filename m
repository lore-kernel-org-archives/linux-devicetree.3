Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAE49EC6C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262154; cv=none; b=c17xR1jclYh213PyPMpvv+pWDHsuMRbNP6OEISKnv59e0k0jIFYR8CmctKRk/n2I7o0kGEh2PJHs3STXcnk/CoMCpcri9m4GMEYwTAhnuZSzz1PuxdRranc5bgA9hNxP9eUkRJdblZZjwCrSJVL0nAKBAegdeoFYBC5QCm7Epzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262154; c=relaxed/simple;
	bh=DIq6nTK8Z21Q2/ZIKptExaqVF0kK/MKFX+uQOTHBBhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZnMDkJcacT6i7S7BHqIKKTgk/JR2IoeBdPJUiC9VFQnPk7ZuIRQk2X/dcgk/C7sHrQ1H98p1zKCjh/TiCnU94iPJmByzJB3cr+ll6Tfjouj2IyUzEEC0yZ/C5fPjYpiRjrkl0x35yhcP67H0KftN+bvSOpGWI747uC57ucaV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=UHUzav33; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="UHUzav33"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so2363674d50.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262148; x=1790866948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN0LJ3BGMSnR0ykGO4CGo4WAreVGKZ321n3p4N5ko7w=;
        b=UHUzav33fWRrDjyDsjaZN+FI0NFW1Uln4jOpHslNg962/jxg85bt1FKbKKLBompjab
         Mqq8Ln5E0A//uflXMkNohG935mLJo5xXTjI1z1jYuKwoGI0xIRWM6n20JCPWn00HdVMz
         pAmdhLZhWXcmd1K+pVj9v2aiQTn//95dAiUTg5b/b8Ge1d0D7lTs5dNOFZLMsLDjjlXU
         w9Tyal7JB4yJxuib9BwV2De74NSCDIriAnojTRVkSIxiNhNsqbZuF9JX9H+gfQBjW9nc
         rb9dYlNj2Im/u3n3xTAyEE0jJ6MVariQiiOV9D/2wSi/pLjszX5UoJKm6c0AetSXYD5M
         uSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262148; x=1790866948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qN0LJ3BGMSnR0ykGO4CGo4WAreVGKZ321n3p4N5ko7w=;
        b=XAD5aUtLk721qlu22K0peyvz/O3ooyT2FRyIVjakqqyrdmIbB5EMlXrQ7eyynpalu8
         OCkG6BdL1TysvRaj2mvsSMoYZAs8DaqQwHQIp1Im4mULHh0FHrPnIyc7uzQetqlbDdZv
         p0KbEVycDPfYqx9YA3d4ES3Q8eWnHWF+1UEF578U0+abXEcz2njpBmDqg1kJCbZSqTTP
         o071uaPtMmlVIZeFhECmhbNoIdd+Hm433KZfY6XpMhmUjDPhJB04rjrzEuCXhaGd0tkU
         l61aTHlyhhLzFip4S50DWOAivtqhQBTn/Uqes9J9REWj0+KgtefO6HvHDchKTXDlam23
         ft/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIQtRQYhQPSoJCHI8A430+Loof8YmRUdtPoJMrAB8SukjeEL7FfubhlI/RFfHBXGk8xJ7fqYA++gFM@vger.kernel.org
X-Gm-Message-State: AFuF++llR2Jtr7tSe9Z+lE9b3XtY+3Gmd0maFb3E8YCizbS9shqpALqg
	0X/Z1oXAdY+gktLWaI2HDbL7VeFmFByFPSlDMgF47Irom83sjCsYZS7KpoMXGYuQVpI=
X-Gm-Gg: AYBFou238MlzKveIaosz6e7qnYY4vGRk0QhjTZYo1y8olvQvL0kToVXxfZgk2WugFHo
	kh0E0DJUbENzO3r1YTh+jN+FQ2qKR0B1+Om9FuC/mUw0Fv61M8ro55xBv/WoPlOaAlhrdSz+s/S
	JEb9t77hgL7YbvLifnGCUTPrKyaLZI8uwlJ9q79We0xu37j1r980N0HcqJup+zr9icudsHcvepR
	7kxFEGERopJWFuuyEqSFW/LOX5Yc+xo6Ey+nYLnn+NGWaIt9DSKE94+pjuB0zMoiVJWdeBxKs0z
	d+S31Slqd27X8/xx6z3fd+tukrNcfQkXADSsRzL93FHeFIq1NJ9Aa0442k9ee7xjOW6wnw/ZHM8
	YIBWth3upZfJgN3Yv7P5CNeN+2P2ppgojUEc66048+adY0C6+0UnCvDnOGLSPN3ObAIHFB8lsK1
	/4aK38CP575pVRTzO3RAxwL/dCvs2/oE9Qe2uc7epT98b8a1KJAkxVG2z6zYWip40nLJMa53dfT
	4A=
X-Received: by 2002:a05:690e:4383:b0:671:2ab1:899c with SMTP id 956f58d0204a3-672ed50c6c5mr1315067d50.89.1790262148054;
        Thu, 24 Sep 2026 08:02:28 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e24e458sm18438236d6.21.2026.09.24.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:02:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 1/4] PCI: of: avoid allocations in of_pci_prop_compatible()
Date: Thu, 24 Sep 2026 10:02:18 -0500
Message-ID: <20260924150222.1179235-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924150222.1179235-1-elder@riscstar.com>
References: <20260924150222.1179235-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three compatible strings are formatted in of_pci_prop_compatible().
Their sizes are known in advance, and the largest is 16 bytes.

Rather than dynamically allocating the space for those strings, just
set aside a buffer on the stack large enough to hold all three.

This avoids a problem that Sashiko pointed out, where an allocation
failure would cause subsequent crash because strlen() is called
unconditionally in of_changeset_add_prop_string_array().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 75a358f73e694..d66c702218081 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -324,27 +324,36 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 	return ret;
 }
 
+/* The three compatible property strings have max sizes 12+1, 15+1, and 13+1 */
+#define PROP_SIZE	16	/* Max size of each compatible string */
 static int of_pci_prop_compatible(struct pci_dev *pdev,
 				  struct of_changeset *ocs,
 				  struct device_node *np)
 {
 	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
-	int i, ret;
+	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { };
+	char *bufp = buf;
+	int ret;
 
-	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
-		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
-		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
-	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
-		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
+	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
+	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] = bufp;
+	bufp += ret + 1;
 
-	ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
-						 compat_strs, PROP_COMPAT_NUM);
-	for (i = 0; i < PROP_COMPAT_NUM; i++)
-		kfree(compat_strs[i]);
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%06x", pdev->class);
+	if (ret >= PROP_SIZE)
+		return -EINVAL;
+	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] = bufp;
+	bufp += ret + 1;
 
-	return ret;
+	ret = snprintf(bufp, PROP_SIZE, "pciclass,%04x", pdev->class >> 8);
+	compat_strs[PROP_COMPAT_PCICLASS_CCSS] = bufp;
+
+	return of_changeset_add_prop_string_array(ocs, np, "compatible",
+						  compat_strs, PROP_COMPAT_NUM);
 }
+#undef PROP_SIZE
 
 int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
 			  struct device_node *np)
-- 
2.53.0

