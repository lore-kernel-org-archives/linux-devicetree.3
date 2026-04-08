Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED4372EF0
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640929; cv=none; b=hLm3aIlzaaC6fIbqtgE8aBkg2Dbhm4za4GOsGIjj/1KnSL6jp/BLyrTv3KZGwjotJYz59lM0qWJEQ7+1Qsd/swStOHd7HARPObRXRRbfkIWB17xy2enZH9A82wmLnOXFo8+x/szcknbVLpMGK8ue9Xr1NugSzHnM6Isnb58TuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640929; c=relaxed/simple;
	bh=HXqM/oIl0J1GIsq6xnHEI1gZ9fmP8FbeFSx73s/rCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1vsK0AH4CM5JmIyz3L60uJ06guPH1TOwJAeWxfnndT5Rf3dh2yhUYUou5QsPv4RwoQJ1plPBDSrJrjHmOUP4JdNzU80Yvo6fJjLuJofsf1moDQkFtuuZtK0fArVoxxbUWg5D51iitYFQsEdsZ9449BV58pp0iadfsQjbR2lZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1aU+i0N; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1aU+i0N"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cd6614a90so2668188b3a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640927; x=1776245727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9ob+5DjZJfjGxOOJg7va6LhdtI3Tpf0ax2Xb93FxM4=;
        b=e1aU+i0NogDpHwfL8YWfVQxdJuUJr1PmbQsSonYDCAJ+zAzj8wgLjJ95sxm11fCYbq
         1c6TFEGt+H24I+uyobLM+VC0khzaV9JhjNa0G4MITWeIyR7DRKeK0kjIstd/gI6BUQ9M
         kRV6g7g/kEPJFG9dfZ0S2WlzYOl1ZxXmr3JmddLutGMZIuqyclVxk7Tax30ynVbSLRuF
         uvTBH5z7miPI+MT2qMy0Hc/rFcyWipuFPIbGdMTWROT1vgmAlg4Thi90M21YS42UBmPP
         pCDF+x6NJPaTBpvKptVg8j1Ldmt05GYoUmn9Mx9gqtjIWr0i7GEEuD7iUa1J1e4Vplyr
         fQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640927; x=1776245727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9ob+5DjZJfjGxOOJg7va6LhdtI3Tpf0ax2Xb93FxM4=;
        b=OB+5OqwgDf1yAI1yOawBxYitREiuO28TNg64K764UtfjeuJeBbvOofs0sgEq8qLvzc
         +tFRtzFxF78T3OUC1QU5URPwqiW0dedOMbrNwAXpRh9yt+ocLEzIWFGNI59KdY2CTLAc
         EntpuAstxNLg4sSE0oS2q2OHcKKX3suo6WAUenrBHKYq64k4dFWZ9wmmGnFOHzxRnzbw
         bcQR3oUlmDKuYuwr+K4dXdIcHvrlzT5ZR8ZnQ5xRVwHo2R7OMtW+GXa69gLzRjwz7Rro
         TRyVi4CFt9C1E4DgclD9kalkUgoiRVVDRc3J0lzFSINsqo5oC7ZIYjLbR+Tn9/U3Af6x
         EY8w==
X-Forwarded-Encrypted: i=1; AJvYcCWOl/uzsZPLA7/ZY5v3ypok3I59lagXTBziegLITiBd2pyuGJdODspY3T5DMlOzFz6x/p+tE8a3aHOB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4DZBy0VXuN8oVwys/6A/WOzNlTjJt9DJ9vUjSEgDBpp1uf0cU
	vlPBEkACDH+seyNB8nS/T0Im+WoxbXyXvVumGQAhttLbcwhjDaxxnOyv
X-Gm-Gg: AeBDiesWze2dCDSxDcM/phkJmM0pSBsbsvI9pT5p3cbUx6nxEqNpI4DRBVWOwFbptDE
	sBSfhbYR6wwz6l8yIzD6QoQs/UpwsF4oZ6EOfNlGTmRc/M33Doo28uVmRjdTsbeZ9gbjMLzH8QO
	mTGUZ4neNJcnhduF0Yo0WqM7lcifSwKGk1W8KyfV2WHxTLzkpWG+lgdyu9F0TObt6LcE5bIx7JD
	HORJAWsK0VGevLW18MJln1dhiD57PPtGRB7oIYxEgNK86+DjSX1HWFXAQXVFfAFO1cSSMvgrEyZ
	AHiba3v4iMq6GyXGIhXs52PhMFzgePOjwYDFWVxZrHyEQggMzoMSqAkAzONc88h73oNrg6DAlVC
	gbFGeNybqDF01ZOsVtN/bc+5UajOzQkdIq2vMCkP0h2FV+rd7c6XJ+9mNjGmbwf/04tnF1AkyyC
	fxSfETc/TRh5GBX+rBeUI3
X-Received: by 2002:a05:6a00:10c6:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82d0da44954mr21259507b3a.1.1775640927193;
        Wed, 08 Apr 2026 02:35:27 -0700 (PDT)
Received: from fedora ([122.173.24.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm20544993b3a.59.2026.04.08.02.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:35:26 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: robh@kernel.org
Cc: brgl@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rric@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
Date: Wed,  8 Apr 2026 15:03:13 +0530
Message-ID: <20260408093313.17025-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the cavium,thunder-8890 GPIO binding as there are no active
use cases. A previous attempt was made to convert the binding to DT
schema, but since the binding is unused, remove it instead.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
v3:
- Remove unused legacy text-based binding
- Drop previous DT schema conversion attempt

v2: https://lore.kernel.org/linux-devicetree/CAL_Jsq+0q8Wb==Xy_bi-j2D29BzZEN81tZr7VPGikL4AM5rbbQ@mail.gmail.com/T/#t
 - Rename schema file based on compatible string
 - Wrap commit message body as per kernel patch guidelines
 - Use appropriate maintainer name and email address in DT schema.
 - Change commit subject as per guidelines
 - Fix $id path

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../bindings/gpio/gpio-thunderx.txt           | 27 -------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
deleted file mode 100644
index 3f883ae29d11..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Cavium ThunderX/OCTEON-TX GPIO controller bindings
-
-Required Properties:
-- reg: The controller bus address.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Must be 2.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is a standard generic flag bitfield as described in gpio.txt.
-
-Optional Properties:
-- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Must be present and have value of 2 if
-                    "interrupt-controller" is present.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is triggering flags as defined in interrupts.txt.
-
-Example:
-
-gpio_6_0: gpio@6,0 {
-	compatible = "cavium,thunder-8890-gpio";
-	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-- 
2.53.0

