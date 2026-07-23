Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB1435EC1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799616; cv=none; b=Dizht2bZbRd1BCgZJdERxoeNbolZfQ1YubiopMeKolJgwGlfEMcCCPJF/OONptvDyeviQLFdV8IAossNsG/iRGbg5svlJEX2SEWvypXKe1Zth+t3F5I5mafcaK9iuGsqomWNUqIZ5jgibzwvYgXmp4LeCf0v40AsqLOLj0M4VgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799616; c=relaxed/simple;
	bh=GOBymmbdwommTeZwp/3gAy8i9YKZ/D5rwVXMRabh/Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/z79f6n5dlZdTIMVxCLltiDWOMr/yrgmZvjG0Ps5VyeSgGv5ayE74+OJqG5nE36CDm8JkR5I9jYbHoyflFHKcYx0FGFtSHtRcsikU4QD0oHKsnvK64XuF/llwi5kdHJ6fLU6ywzyNq/b+vd/qov1urmHal5V3PHLLU9bDoLEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=mykGCfiH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="mykGCfiH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso3048705e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784799611; x=1785404411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZCIb0M/YGxErNMaZ1+Or3nnTnaKMjx4d2oCxsTYqLs=;
        b=mykGCfiHp3e+TIlArhWosUjW7YsPEy86JJE8RzWoHTpe1VP556juihLuwOQ+Ktvgta
         7iIPkg9vCgiMXUN73nCYl+EEr8GVtAvUX9EElNWW8vFQ8nuV7wzbvVpl4bKtCqd8QoPd
         jDPcX8i0yvVnwMKS7Re8fPR/wS3J7Jr1PbndeWEYsG/r19uETDEMrprVa1rUyA91S1+n
         hyyPJVMdyOMqvpbCcpGmgHcnb2Sk6i58l03JymnWZxlgTpsACeisnavjdJtN9RZGKq/A
         +YlngmXQb7uDGM2Z7uD+NPUBoypXpI9WfsipINdK4lmYnQF4Xu1SWwQmAeIVQEXv9YA2
         G/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799611; x=1785404411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZCIb0M/YGxErNMaZ1+Or3nnTnaKMjx4d2oCxsTYqLs=;
        b=sryJo7n/MJigKk8RX0Ey6rNQWcVIYWlEXOumXdCwiWWttSODpJwxv0a9ukpanvzkDZ
         PouoH+Txi45Y/Z5m5cKE/iyrQxmmvtdzwhn5QZz5pgfLrfPPZuiRSNULMBAvrzig+YRN
         vCjndomxGbq9ZgPSWW9nXLOnnHA6BQAZji1+/2BBi0wZiuew8G79/YGX/U4rFRLZS1k6
         vEo+9sv78nTmAeQoFWc6hRHIf8vpYCZ14Sd3nIgLa7SJteXjkcRJ9uDFWXM2GV5b61I6
         99Dwbr0e8OPyi0hlFRwIIjulJIxlXKks9x/2tEBP3Hm5b9P/4Z+8Cr81SO7TzX0Ggftk
         oLag==
X-Forwarded-Encrypted: i=1; AHgh+RrgH3fbaWpsEA3Lb0cukg42cQVJ7txPkPbTCDXf6MEVIxMKJJiGn/SZGxO+TA/LzInXBYn2Z8t5sF1d@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYvxlEE16XdtmZXxNpxnLGhzCUVy8velYvczP6mFN6fNsED4J
	TM0VVR/w2L+q/9YnGCseqi2eUAnjoKnllf65D3LbGcAagj7jujgIUBvAVRACRUT2Wq2RUyY8oZX
	wSMld
X-Gm-Gg: AR+sD12mcO8xB6n+15kXjRv8sP2NFVQl6T4SXGYgYi9BwDTpmfL9QTxiME62o+HdX5F
	wLfYVfFpaS+9Ob0E0MlxLyn8u6I6ZsSvOz1oee5P6nY71t5nf+vKsVomCGvqy0tr8h19urQc+eJ
	HWz2vGfFiACKmUPgm5SbwAbnFIDPDOB7JSzc1z78uB/jrTQ/4l+7aVHL8kyICEDJGqesAWJcx9U
	2TddhD//xZq3eol59oNWhZDiBcKEdOaedCUT4pOmctO/NkMm4hHJseWZoUkL/8t4YMdEfBCbRCH
	5tXrNePOU1z5QXKlEpDaV0v+4hTOqaG88+TFKvJjFmqEFl1wumDGPzcmC6+trbRVX0J85DPifK0
	MXu7MnJdz+g1vz6iuY7Yt1coPFn1ULKGjX0iqCnvkqLMY7cdnqSNba5SJNy7bQdsYMadNvZt8y8
	U4dv+IsmSC7MuOqaorffNPSCnSPuzXzh/Mdl+C5zH6QJalYCS9ULJy296FHdv69w==
X-Received: by 2002:a05:600c:5942:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49573cf0ec2mr16196835e9.34.1784799611464;
        Thu, 23 Jul 2026 02:40:11 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b030a64sm100986245e9.3.2026.07.23.02.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:11 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v3 1/4] regulator: dt-bindings: Add fan53555 allowed modes
Date: Thu, 23 Jul 2026 11:39:58 +0200
Message-ID: <20260723094001.120264-2-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723094001.120264-1-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fairchild FAN53555 and its clone from Rockchip, Silergy and TCS support
two modes of operation:
- Auto-PFM: Allow automatic PFM during light load (default mode)
- Forced PWM

Some boards require forced PWM mode to keep the supply ripple within
acceptable limits under light load conditions.

Regulator mode indexes are starting from 1 to keep backward compatibility
with existing device trees

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 .../bindings/regulator/fcs,fan53555.yaml      |  8 ++++++++
 .../regulator/fcs,fan53555-regulator.h        | 20 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/regulator/fcs,fan53555-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
index 69bae90fc4b2..9a18891f721e 100644
--- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
+++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
@@ -48,6 +48,12 @@ properties:
       VSEL0 register. When this pin is HIGH, VOUT is set by the VSEL1 register.
     maxItems: 1
 
+  regulator-initial-mode:
+    enum:
+      [ 1, 2 ]
+    description:
+      Defined in include/dt-bindings/regulator/fcs,fan53555-regulator.h
+
 required:
   - compatible
   - reg
@@ -56,6 +62,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/regulator/fcs,fan53555-regulator.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -68,6 +75,7 @@ examples:
             regulator-max-microvolt = <1800000>;
             vin-supply = <&parent_reg>;
             fcs,suspend-voltage-selector = <1>;
+            regulator-initial-mode = <FAN53555_REGULATOR_MODE_FORCE_PWM>;
         };
     };
 ...
diff --git a/include/dt-bindings/regulator/fcs,fan53555-regulator.h b/include/dt-bindings/regulator/fcs,fan53555-regulator.h
new file mode 100644
index 000000000000..ce3d6c63a0f1
--- /dev/null
+++ b/include/dt-bindings/regulator/fcs,fan53555-regulator.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Arturia - All rights reserved.
+ *
+ * Device Tree binding constants for the FAN53555 PMIC regulator
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_FAN53555_H
+#define _DT_BINDINGS_REGULATOR_FAN53555_H
+
+/*
+ * Constants to specify regulator modes in device tree for SYR82X regulators
+ * FAN53555_REGULATOR_MODE_FORCE_PWM:	Force fixed PWM mode
+ * FAN53555_REGULATOR_MODE_AUTO:	Allow auto-PFM mode during light load
+ */
+
+#define FAN53555_REGULATOR_MODE_FORCE_PWM	1
+#define FAN53555_REGULATOR_MODE_AUTO		2
+
+#endif

base-commit: 62b9452f5fc4d007f1ea31cfdbb53a96d91e3c66
-- 
2.43.0

