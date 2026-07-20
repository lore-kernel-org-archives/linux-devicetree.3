Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D83C81B9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541838; cv=none; b=P4vsSB4ipNLb5RKj5QaH7yadDWyqvpvjVC7SwV8HRfY0Pc83eHwRVGB7KDLT4tEyvNrfhK/wpqSnq3hMcmmZQWFhnaZztxLdMbq70x11yU+nez6DQhrqXLUTG5HkZBXfo+zxCsPPGRHskrZZqoOnY65nc3NUyr2jqqR9QKAIXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541838; c=relaxed/simple;
	bh=6BL2P+iNQ23RPpiCVNX36ZRSdT98wwCUY9kK8aNSzr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPjkZnpxBPE4L+JalZO9aR28EPeLK6EqJRwCPjr7benkqqKBxE0ng+dYO3DMnkDSwViIK8RX2WmQi39LV2ZFRqcfk0hIkrs5V8j3M1a6wxPNzowPSphPsphykSFUv6N0IlPtvtMVuMgD+5ZmGyuJ40eV0J6uFvKHo8hgX3/YEEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=k761YA+4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="k761YA+4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso14093125e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784541833; x=1785146633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgMkr2bBHWeRS9JpS8yonGGyR7fbVUJNcFRTgEKtNpE=;
        b=k761YA+4igd0QhQ/kqJf6CVHesGDrpiwdSCUJO+VAHXtjiET5D3rwxZ3bGf8NNsQr8
         niEf70y/JhF7mmxqrHs0rxYrkDjKRfEgC936avF0imkFlASYMW7fI4pQ/BJ6qMu4WiIk
         zced+OV36C6Kjqqvw8HoI7pBK93U3PoyXulB/djhaEe/oEDIwa5yu5PB54DlA17MQTwb
         S/b6vqwnvpw7K1WvttbSLonN/4Aa4Z2MCLtY/XbbRYJpi7e/nwZMskfJAD52+UyT6zLb
         MV99IQ/jJDFoHR66AvR3wK78t1M1qyrhQwO77ThH8Wb5p29DkrLfys3DOCV4JNDP+w+7
         zTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541833; x=1785146633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgMkr2bBHWeRS9JpS8yonGGyR7fbVUJNcFRTgEKtNpE=;
        b=cEjBws6xjPytLbxDITlM9UAaabwxX/Dcy5PdIR7yY5nbYMCB1OAok8wwuV3hIMVCDk
         /6eiVCy3vgh9ffRiXGDGHJu68wv2FkC6dKdgsjuiVuvAWR7KiwJ26TCFqPHWKyo+NUuk
         +0VKoz0o4vPnJCxO8hJRyiWEn7S8qeXvZOtSyYohfKTqJLre8JekW/c2cWEnjmOdFcgj
         RCT/VHB7bmI02Ccfx9L7xh9f5txFlsiznv3N6g5i5ch5f+ckKPZC7nOH2S7MXNuj7O0l
         51VSJRyvrLgA2lrPHyaSwxlQtdpxh4/bqY2gfUvpPhJWzP37GzPTvhP3Ujyp9ghjFwPg
         t93g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5r5j14lU/r5723JMwFtg2FFdxbrwHL6o6sScEE1jPlOdRfdmmXRrrwhQhIePYygEy+oyA3jPgVCd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzcH8vayChK/hCPORHjwZ2LFs77gktLMQhzePqY9leosY+X21pZ
	jKATNHB2XYuhbvw7uryaI82BJxEpL5eDe4ICwqFdWENNW+4RQLS8/2a03bUBbdxrgC4=
X-Gm-Gg: AfdE7cnv3jGLuWYt8p4E3e7P8ElDoKQkYYRpgieYy0eNGI3Tokk78Yf+2S8dd8EenLu
	mF3LnitYwPqmZ43+DnI/6yqgs2whC4NSshtwpN4QnOjQR3lR8aAW301uAdcxuryuq/x6AvxA9T3
	7SZ0fKoQsSpqrunYX4FsiUkxGzF5iTUVQKiYqVwrcbFznOXihsS7cIKCS0ic7dIwINhfQjHGA1/
	tDEfJqZwhqfzcPb1kiGIKHo5EHTWOJ/rmClYxNv4YljijvqHrtSuweOEpQAAKoyM4csRnvKEXT2
	VYW8U0OQbmeCZJvK8bm+u2WzYB9bsm7y1Xh2Fl21U02vMu8e3z03+jowzpyCTqCYOpjZBzH83OX
	K7fOYJhwcW10x/FR6hfnrHIgTrc9nr3jI4hcXfkFcdhLdJLBJCR4UaE3RsIK8qEZuZL/uMlV7PA
	jk4oliGmelN/EAsgJaVmjAJvKuMFrrYL559JXWiTdixTL0ClJSiN3A+ZEssB/Pll4LQ8eWpvEN
X-Received: by 2002:a05:600d:8486:20b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-49560319fe9mr17194235e9.33.1784541833095;
        Mon, 20 Jul 2026 03:03:53 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495516c68fasm191854485e9.1.2026.07.20.03.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:03:52 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2 1/4] regulator: dt-bindings: Add fan53555 allowed modes
Date: Mon, 20 Jul 2026 12:03:33 +0200
Message-ID: <20260720100336.62004-2-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720100336.62004-1-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
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

Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml #	new file:
include/dt-bindings/regulator/fcs,fan53555-regulator.h #
arch/arm64/boot/dts/rockchip/rk3399-drumfreak.dts #
arch/arm64/boot/simple-boot.img #	arch/arm64/boot/simple-kernel.img #
arch/arm64/configs/drumfreak_defconfig #
scripts/arturia_simple_boot_image.sh #

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
-- 
2.43.0

