Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8217C203
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928663; cv=none; b=hzCthohg82J73tckHWuw6WW+21Uj19CvPjxVIb4/zRTmtBnNoUcDUcmsCugvbQG31B1UQ3cS/eH00KcPr9+E4yQX2y1MP51HubDFN5E903t41HG/7Bep3aLvDJeFu+QVSeQONvZg8Y61CB6yENGDc7Vm4sOoosLGxDLBePNAYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928663; c=relaxed/simple;
	bh=m4JnlKp71dmBmVmXd0wN7hnWPeqvxXn+YH64ucbXVAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIJT4/mSdUlB8yiBiTkfBJgB+lJxwsVjkMabUX1f+BbG9zed4jWcb57IjPtX39F7Gj6Vav56zu3sH7/9Ph5R4V6jQxYAlqRCd8ztvhotZZ8kX6fDXKPBL64jQkWRDuKvZ2AhhBCZo8tXMXNnIQ8W9gSwqCpMwc+0UYuQYiVYOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7Qd3hYC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7Qd3hYC"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aaa90a791so403713a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928660; x=1783533460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL4o1uarTpj9xDmNVkt39wRpQkwyzo96/1lQVKIfDYU=;
        b=Y7Qd3hYCNYOsveLwGL8Xs6iwHf57IaAexqqFkP3QNdOy/L8e5X8/fWx0dvZaNEM4co
         QLNw0DROjy/zAuEJniCp+rALDB2HzmMQXHtiIMeQfMXtwHUhlF+YVx3A46GvQMMhq6Mf
         GzD+5jXt1jAnFb1IkegbK1D58KKDM8Ek7bWzxQsAOCGeucMwDQkf5tLwFQWANveS8wKv
         ui3f0Q0pKkM2ghnyYVr0yE6T9l1ltn9ABpL7pOSvfQNQMFxHW/I62vkuveFhCymbZHqR
         XL7x9QC+xvIvxIei9/fO6ZhU5gzqq1Pgrq5H8qJd77bGlkrARSifYvZLvwjGbTYbKnUU
         Vl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928660; x=1783533460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL4o1uarTpj9xDmNVkt39wRpQkwyzo96/1lQVKIfDYU=;
        b=k/qouk/kMSEPMJl2Jte5dTxcpSiXT39d4CZHTOJ4Imk1p/XvXdsWEMcJfA9StHjuUq
         rK4uLvZWJHK8Tnd7dSO0qcahX9kueYqETEDdXOekILhyUD+T9pbku/E171x2fddERn77
         w3JOD76OGzI7IW9Wu2g0fyshIbjeyX47l13lwl2Oi5gVVrTLreT5kfEZxQYL5tonHCat
         U0+Y8Z8vEPFP/cYoLkZ7ps6hdufmQJ/XoEPJT+wnFsGtl1E4uZu+6s6t4qXVV4wZcYro
         68QsKF5SPIlPwLqSuiFZhYdryHtWlkrWY5Hsh7WDQrMfdYcB0tFuIfyVW86cJCxUnI9S
         8gfA==
X-Gm-Message-State: AOJu0YxUSzItR6D4JY7gf71aPVWKhj6xGGE9FcXfI0oO3DE0ZGuHlYN4
	F0r/diVX0jWRx6TyasChdZFIKGzYtc8Xqi8qsmC9pkL7DbCRrItld31Bb7AcetQ6LH8=
X-Gm-Gg: AfdE7cnBsfhdgYxGFfWz5KDMxtsx58+m8m3UsNuwAAlP/+B/vLDD5s6+wfb3dSRKDdD
	qn62JUT4WZGr+KIPxDqfLp0FrFSIzMGbjg9Y781ubIb011Im9FCF497IWjxM5MoFkmmp+vXkuHq
	AGJBA/lmtCVti+fet3eH63nWAunXOZIbslgyopb+GrRB1InM9Di7elxVYfRnBJM/am5W55iV96I
	EFB8sls0Yage4YwJpkUSWD2H4GoL2fnjSfeP6XtnVn3vMJYi/vWfQabNwxL/gcNrOlhLHS0os/Z
	R/q0CCUhL+RUhkyQ/2mVkeZoGPDVLJCY3MBFyPUmst5wtyS+XZ/Uq7IgCqr53VXlHCgrakNgx4W
	Ko68lmjbteaPBMAvyXP5T2EJxJGlAlOTCJisCPCVrnCdh8RoXA+kHOufytqvZmnZOMU4sPLxECo
	sQ/FzCh78mlpYrDWEecrM=
X-Received: by 2002:a05:6a21:50c:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3bfed238ebdmr2953675637.14.1782928660440;
        Wed, 01 Jul 2026 10:57:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:103:9e2a:b51:b011:2af9:a710])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc544sm79130eec.25.2026.07.01.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:57:40 -0700 (PDT)
From: Wagner Popov dos Santos <wpopov@gmail.com>
To: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Wagner Popov dos Santos <wpopov@gmail.com>
Subject: [PATCH] ARM: dts: am33xx: avoid invalid OCP device-link for timer1 and timer2
Date: Wed,  1 Jul 2026 14:56:47 -0300
Message-ID: <20260701175647.8694-1-wpopov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes boot-time fw_devlink errors on AM335x/UCC3 caused
by invalid device-link creation attempts involving timer1/timer2
and supplier ocp.

Observed kernel log messages:

  ti-sysc 44e31000.target-module: Failed to create device link (0x180)
  with supplier ocp for
  /ocp/interconnect@44c00000/segment@200000/target-module@31000/timer@0

  ti-sysc 48040000.target-module: Failed to create device link (0x180)
  with supplier ocp for
  /ocp/interconnect@48000000/segment@0/target-module@40000/timer@0

The change updates dependency handling for timer1 and timer2 so the
kernel no longer attempts this invalid link-creation path during
initialization of supplier ocp.

Impact:

- Removes the two ti-sysc/fw_devlink error messages at boot
- Preserves current timer and clock assignment behavior
- No functional regression observed in boot and timer operation tests

Signed-off-by: Wagner Popov dos Santos <wpopov@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index ca3e7f5d7d0dc..760598d5ae1c9 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -708,6 +708,7 @@ &timer1_target {
 	timer@0 {
 		assigned-clocks = <&timer1_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
+		post-init-providers = <&ocp>;
 	};
 };
 
@@ -721,5 +722,6 @@ &timer2_target {
 	timer@0 {
 		assigned-clocks = <&timer2_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
+		post-init-providers = <&ocp>;
 	};
 };
-- 
2.43.0

