Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F836654F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582352; cv=none; b=VBUi7Cneg5Et5/XTWjoxQMjtOw9bVeFDcphcE8OJafEDHY4aVzy9+MjJcAKK59pTrJIrpXewdf0Rt1IwjA8aHu2nYN0yeAf+6fo1uG8ltcf/f6HLE7KV51zwCSEWynAmfAquorCP2B1VACxZePLlgvJWxit+HA3Qc3pjvvjFiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582352; c=relaxed/simple;
	bh=jWKNCexch0JMH5o69BNwck5/VG83+M+LSrUbl5FXSeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sY5fE0fj/HfdAjaoLd6BGpUdFMIusvd+5Czk4B2eCa9cPYcuzRvQsR0xSjkaUDzmy5ogEIqcMkwRjyGY+8gJszxpcFpx1cTKxrGWJtMW27pW1bAxO9B5R4E+Ad8swN1wXsoVU0LkpP75yl1+HvlXkyTPed78y3oXEb0ARPwFQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4R/Joa5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4R/Joa5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e812e2b31bso756655ad.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582349; x=1792187149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=timCtjlY4tD1ADYkJgRTpouWmQk1mlvlYkq4uJksmig=;
        b=p4R/Joa5adCR5LF1V5XKthc3aTfwxXKHGStxiMuzjqM7MNQfMymgyJPa4Hkd7hIhI3
         DKXhgquPQ2afZfL3o1lzav2qDedHvurqL9u4zr7390PFnVT1sr4uNVhtxVqqX8KB+WoG
         eJmb1lbpVBDEP4TZtVZevMwMz6+LJwcpd3IGcGTqVPGvjJWt2WV4XtkW3kg+oCOh+kHS
         oeAsipXo5qV1W9i3koWBP6uUH8csvQP0jKAr3pTA/90KHHF3lNJV0rqEhDsl3xFLFsum
         kxW/0oiEr4wfbvq5UONnjRLsmqeZOpSyEIvdRr7fMlpehUwtu/lnT1axhlFH8ByIWzrP
         PHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582349; x=1792187149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=timCtjlY4tD1ADYkJgRTpouWmQk1mlvlYkq4uJksmig=;
        b=S1KHLuLxnktKo8NmkEUQl3fTM4dd75MGds7jy71nv0jAePrkeIG1bDpL8FhXLTXiUk
         7/XWxAgLynVE7EGCIo2QfyOkxLfJ7FoBWFD4hB/3lE3BmJDwYfaW/QgsUFfev9Mm7ug/
         +nEoyY6rf2uxf/04f/avcBXx2TWaXj9/IcKgvNaRHTFrUMBpPqB0698v6sG61HZDzihn
         kpEgEDg7rllUnBu948Wyz+B5SLRdRekfJSWbt4hpsYQOh/FtuYFGyZc2uLd9r+j97HRe
         Atmt/H/7nLZKiPoikIceiVsXF97SAyuhHUwpEeYLL26eCMMTaZtSmy1iUWIoyP6V4YOQ
         KrxA==
X-Forwarded-Encrypted: i=1; AKwUvBzi4ErgTvfs6lJIkdcUq1eU/E0V5FbdPSvJTEZgTBvOhpep4OmBqZuFxrV9mnC1CM4cszkANu96SlBs@vger.kernel.org
X-Gm-Message-State: AFq9FYIjOr0d5uDaVe2V1hSI9xKEOP16tMD1fr8MQGoX/FxHQNetyxjq
	/+0CmuCvhp01nrrvjVK7WO3eYOwW3EpqGXtqK8vK5ZdQY/eIXao4djBf
X-Gm-Gg: AYBFou15dAGKMdd8NEtXhN77UlDZ66VwHSjSsKtu3nQkXDNuNyu7AqaP0PNDrvQN0qj
	MKzE9IsfQpOq6Sni0bmGs61fcT4vvy8YhG7Emo9+CiCj243L0z4ntLb0//w5h233uv+C/Jzqijr
	uqLJ7Z43MBkWRpfi50WJQjE+L8x51aC/IlimmCTCCngCb5rdwYi1527cpOCESSHWzXhncp16oPf
	Z9W+8J7nH9LL1BQa/j+Ok/xyiIu/E4xD9BI7X8W+0ciExQEycXO0MG/H+rtgQ3HwWFZSnmKAWZk
	LjukWlYwh61IqRoORkJx0JU2J3n+IpI9MjY1bBxxX8dsh+vMdLSVFeF39EdRllrjHY6cc3qTqcg
	XCfb7C+xPeCDm5LC2OVi5bKXEXZT+eJj/7dGEEjzUybts2ekvQ24qHyGgWD1sXlSsA6wRfULlUU
	2oczXViq/nJ1cRu7A6wjYdo9MrO/M1DFltgPZmav0kdWIKpabx0zTR7oeZ6BgHwEq2zGikj88oj
	K8ihROxeNNHWwLblhPHW5Yabz7vyJZRIu17TQ==
X-Received: by 2002:a17:903:298e:b0:2e8:3d48:4d92 with SMTP id d9443c01a7336-2e842bc6da6mr27038245ad.33.1791582349209;
        Fri, 09 Oct 2026 14:45:49 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.215.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e54asm16615975ad.13.2026.10.09.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:45:48 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
Date: Sat, 10 Oct 2026 05:43:39 +0800
Message-ID: <20261009214404.722628-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009214404.722628-1-mmyangfl@gmail.com>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMOC block of the HiSilicon STB SoCs (Hi3798cv200/mv100/mv200)
drives an external converter with a PWM signal. Add dt-binding doc.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../hisilicon,hi3798cv200-regulator.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
new file mode 100644
index 000000000000..812d94aca1f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/hisilicon,hi3798cv200-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB voltage regulator
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description: |
+  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs in the PMOC
+  block which drive an external converter.
+
+  The voltage range depends on the board design: reference designs specify
+  0.65 V to 1.15 V for the Hi3798cv200, and 0.7 V to 1.25 V for the Hi3798mv200;
+  a customized board has to figure out its own. The regulator itself has no
+  other source of calibration.
+
+properties:
+  compatible:
+    const: hisilicon,hi3798cv200-regulator
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - regulator-min-microvolt
+  - regulator-max-microvolt
+
+allOf:
+  - $ref: regulator.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    vddcpu: regulator@8a23018 {
+        compatible = "hisilicon,hi3798cv200-regulator";
+        reg = <0x8a23018 0x4>;
+        regulator-name = "vdd-cpu";
+        regulator-min-microvolt = <650000>;
+        regulator-max-microvolt = <1150000>;
+        regulator-always-on;
+    };
-- 
2.53.0

