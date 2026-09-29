Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91683D6CB7
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647886; cv=none; b=nOmoStqKkIiWnWN4jKBl/uN922tmVj7pLF80N178MMhn7anP08l9BsyuyIdFC5zuVJr6y3rCZqN0W9YAf3ZFDohm1/6mEM93APGkB0Vv+/45OIn5fHsWM1mvyZEgRTtKBvwtKdo6gkL4/t6X4SftYk+8uDGzvaqgElKTfVffmGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647886; c=relaxed/simple;
	bh=Wm8hL13n6Fq3R7PbRhjO0X0HGPS8cWmATmdQMe47vmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diwaFDVdeLg09IKJ7JCa+nR6O2ZHq+lQVMjJTphMkfjI3tvagwkXBuoEFAECofAxC+XcXIGyFo+lMykrUEW/RcVpXDSSEZZbM0/5RbiYHcK1XblYUtmePtD7hVN7DpfUn2k8JaMBireaRoB5Q9wYVwS7+OsZSbObAqur7vMALQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XFPkHobn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XFPkHobn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so28387475e9.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647883; x=1791252683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=XFPkHobnNRzBBWv9owWcLsgGT6Rx4VWDwWzPf1JtYoEc/4Vdw0eKi+Y5NRTABr1xHA
         k1L/Ll+ocdbkMBIhQxuk41Tk9TC61mt2eKUC12ujl31doVO1tHOvi/f8rVm1+6yCp32d
         2vYv4sFwQxCMzkJuzi6gat4UxbgWnhieH/cqqiHnE2P8ftfiHWN91HAJlR/00UPPql7H
         k6D88dEZfP/HVJnp7rUuJiazfM/M4fvidqeaxnnoyPcpYs2Xp0avJEqZ5AMo6ecgQNsq
         ACrz8PU6hhGwrEFxcEhVGGHCrQHHCDcaYLXgR3nLDj15aY/Nm6tCK8BIoOsXYXbDcZe9
         rqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647883; x=1791252683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=toVx6izqJvAFiiTy/9eJiClD/Lh1XwguYLRbI1Q11gID13RfvtM7HMqoxz//Jb78ow
         01qHhcGl8dg+NLqo2jhKq7PDn9bQl1b6dKWvEOSy5FrVgNnp0hcMPZNEgxOxTP4lOs2g
         DgiFNqxF7M7JbEUgnk98RHtLtPNQwD5qFULWTPqccTaFk/V/M2w1G8XaQOLGdGiN7z9k
         qmwDaGCkA2lwk+OLrZ9HjrPtO4hM2nTyegfWUdbCPlhDdU8w7KDN4UUGJrYg4dJugA1C
         HdjYlgTHqA29TSGYzRsV0jk/9dHmQyfLEK4afavpO1EzTwZRKWXBrMM692FyLsKujqCB
         nu6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgtJGApFY+99c1J2cYrNR6Q6oDn3MXe9IxrwaiAB7K016DZXafy7Lv3YmmzDorENGf2FCSBIup6jDd@vger.kernel.org
X-Gm-Message-State: AFuF++n2DZBcRHKTFeo2NdXA2cVOjexxbSBQHF8k1TF94q21Hym7/b/h
	eCTiWNGJrQdjQgyQZNLprdQeIHXEMhlQlHlx+X/NoEVypr3/pMxBPf+5NSyLAT13SPE=
X-Gm-Gg: AYBFou1K8GA+bZhphE7oEPM0EcvO1368R+K6MzmPx/aaOo//SJe4SgKGdSHa2iEvpkU
	c/1qfL9qpKnX4QbPswBNTEeCeyXqoxNsjuDd8Fdso4qK9gwBE8hpnpvcRp/5nDcpj5Tbhf55d6A
	FAcOZA3STKs8c7gjZtkJhM229X2Pk4p3vtyCe8lVAfBTSyFtsRTTWQAl/yByNgWavty0ga3Xs9J
	VfHYA3VK6U57MIo5fzvRJSXraWD88uUpjcYW9S5TucO2T4UkCdkXZU/uytiVYN4uvxEqJreZ6Jd
	r8p8fH7Lc9qvH1ihRFwmiQyWOJNBYLwc63Lml1PDLo7f3ohHq/xgL43Utd6y1fclsAETxY3ZlzL
	IgM0xCOkGer6NNFUZ4Tz7sIVlviZw8AyKOgTG5/sqvTfvLK/mKtZn1uSk7vdQprdJ0j1XKuuWNY
	SCMbF5DzGutFhZWbBwE2ek1JmcoK5yTKTCLmG/FEOVKj5ZDuV17FPlq2mpzbm6jB+kq1YKKHG6M
	N5zzM7qCVUicauSGjFH+uE8zr0cjNk00xj0X5BHQeerQVFbJ6husN+oscGA/A==
X-Received: by 2002:a05:600c:540e:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fe66ca828mr272930495e9.10.1790647882919;
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:16 +0100
Subject: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..0eaa9c881f6f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      List of the underlying clocks associated with each ACPM clock domain.
+      This property relates to ACPM firmware variants where not all clock
+      operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,44 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            enum:
+              - mif
+              - int
+              - cpucl0
+              - cpucl1
+              - g3d
+              - aud
+              - cam
+              - disp
+              - cp
+          uniqueItems: true
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0

