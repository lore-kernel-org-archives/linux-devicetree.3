Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DE3750C4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238386; cv=none; b=qyD4Z+HydARTtY8T0rQbGOEQnRW6rq3xw6g7t9UWJ2g3fwr8XMoYhAyZh6zMgVmgmww+LdnFxr0SubyIpDM1KaAVHmq7T2b+j7NXel+lKASHTgU3HfhXkibosYWNvxIeg5BwiwB8atDhHeX1zoDXUD049RF6A55CO/aVGRh5Vy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238386; c=relaxed/simple;
	bh=Xip7XKi61C0yH+sanSoYPvmiyme7cY+t6S6dmaDc+fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bf6aYMBVrwaN9n5p8/el4Xsdss6t8cPBj0Kp5trzCLg3r1INa+2+ZEo5PGFUruKUFaBnCAsqhAjnxzslE5ar8CwUUCptjzMN2cHk+2AqVgA6YXztAHkmXHHZs0je3gIpzcfJi+SdHT0LqE4yyLEKrkidCvpX01bAS7qBtNy+YDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFBwVVHC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFBwVVHC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf110997efso4730705ad.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784238385; x=1784843185; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPcoLLAW5Uw+e40dTUDHiSrmSGK+jhTystM4taDsNcw=;
        b=ZFBwVVHCZBxjT0EDPdgEJ4SGcvhKUscG9okuI/j/jK+q5wMzVllE65LULr0tpzavrh
         YindGe60Th/+Jtz8WisrWFCfeiFBUW8nXl2iXzYVyUUKjgMkzGkULqe/N+bw+ZCiFx+A
         KSAN0hNzekCa07HvsJ3nE+NskTC1ZaPp6YtUGQVcyR9qPKNwivrfS9zNa/r5BtkWkY98
         cku2t4pZpoF73hWzH2RsTC+5erjBWiCaMGlBamkPsBfFob32WzdVgRvvb7RndLjbTmbb
         RMB/RhBmK9E4INDNPSx1h2jCuisqO6fRbAMJw6oebiIlOA1HE/mrWeQzvVJlOncq8vNE
         1WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784238385; x=1784843185;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tPcoLLAW5Uw+e40dTUDHiSrmSGK+jhTystM4taDsNcw=;
        b=U5uCVMK9UeWJsfyDYmhCYICz3IjSS9vQNDLYMU6ZLAl9Ocbia0R1I/Hqbyd14ho5AK
         lud6Zn2BjmfpPLAb0DPNsK73oa0HTOSL/6YxW1eA/feQcIZz8FyHUK9918vreGkjVPAw
         Z0Rjm6V83TyBE7ewUWz/BERpGrRsmuogvf9e7lRuM9UeckyfUKB/XTqrqcF1y8jm1J/j
         Ahu8Xrs/0fOFFFjv2pWElYbC74qPNrte0/6ClN8U7nrjBxtEB5CX2QV1Dsd3rqF1E2zj
         jno9MVctdzWGW/V04RRGNyr9wGawEcOkXMHjWmmEEpIcskSc0ZcIxCMfBsomCfTc98xu
         UCrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjxRXN21CyDPS8sMtTUu/DB+T/44/3uBVmLHM8P8UdMalmgCd3+detUZvjJvaOHuvAHR22qZD8OnpR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Ged/RURXSmQ5OC618bDKK/W5DXUpeoHeivUe1abSS+gfmzOx
	RTJN682EVH4ktKIIFsbv1FMEcK+4GkHJYJc0x3/hrp8vP/bo2lc5GqLx
X-Gm-Gg: AfdE7ckLF/W5MX3cTyC2S5mtLpRWRvgsYyU22Wni5yVqhoZtXE0+J26pG67mEY5kQRs
	RMYPoxfNARdBDgbJ55z9K2f+9wgeqxIpJJXiAWbf09zMVtEhaFuyfgEIzmVMpKsgmJ7gy5/pRA0
	olAip6Db5flydAii40PG0q4+0jOBr4gvND1VLXM0+xp8MmEqRnRxmNOowXAJOYPJo5zn6XU7r9o
	g7tW3vwGa54fhqSwcuSKBhQcTeGz7buuBCNVIFym8XZY7cr6v0hOisX+5QfOjuhQxWgOh8f3W/N
	LfZkLHixVKh7LIp3EaHhaiwa3Axpqcg2FZpBfMvXBJh7wyJUqtCkkIyw3B8LpvBqjKw0WMxQdwV
	9ZBtgxqcMU0M8PwjPO8Medv4c+L9k02vvJut3aptnPgQjLh5VcAF3z2+qmaWE4TVA2fWWwqm7B9
	lPF0qnxNF9HsGM1sI=
X-Received: by 2002:a17:902:fc45:b0:2cc:e7f3:d39e with SMTP id d9443c01a7336-2ce9e29f5b2mr191380815ad.2.1784238384875;
        Thu, 16 Jul 2026 14:46:24 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:7379:8e6c:7b85:e813:4f3b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm15267641c88.9.2026.07.16.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:46:24 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 03:15:42 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-clockdomain-v3-1-3c263af4e9fb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMSwrCMBQAryJZG0lev3HlPcTFM3ltg20jSQlK6
 d1Ni4uiyxmYmVkgbymw82FmnqIN1o0JsuOB6Q7Hlrg1iRkIKEUpBZ8s173TD+MGtCNHqIwRDUo
 0BUvR01NjX9vwekvc2TA5/97+Ua72uwL5u4qSS05KYVFio2rCS5t8f9JuYOsqwj6HvxxSnme5u
 ZOoakWwz5dl+QCfUjY/6wAAAA==
X-Change-ID: 20260610-ti-clockdomain-a27dd0fa1ad5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784238373; l=4577;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Xip7XKi61C0yH+sanSoYPvmiyme7cY+t6S6dmaDc+fM=;
 b=9WeyKYh4k2MMl91IN95Ut0YJ9T2rvopYX+OlmHN6LITkfE52omWXB74yR+jGlYrWGB2jT+lRn
 FyfE7r1VH07Bcb9E5+0Ev8cnrBhjqNRfL+k7gksZGtsRSaF9QD/tHe1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
required list as this binding doesn't define a new clock binding type,
it is used to group existing clock nodes under hardware hierarchy. Most
existing dts omit '#clock-cells'.

Update the reference to the old legacy text binding in the description
of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- set limits for clock-output-names and clocks properties
- Link to v2: https://lore.kernel.org/r/20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com

Changes in v2:
- updating the stale reference to the legacy .txt file inside
  bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
- Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com
---
 .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 ------------
 .../bindings/clock/ti/ti,clockdomain.yaml          | 44 ++++++++++++++++++++++
 .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
deleted file mode 100644
index edf0b5d42768..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Binding for Texas Instruments clockdomain.
-
-This binding uses the common clock binding[1] in consumer role.
-Every clock on TI SoC belongs to one clockdomain, but software
-only needs this information for specific clocks which require
-their parent clockdomain to be controlled when the clock is
-enabled/disabled. This binding doesn't define a new clock
-binding type, it is used to group existing clock nodes under
-hardware hierarchy.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,clockdomain"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of clocks within this domain
-
-Optional properties:
-- clock-output-names : from common clock binding.
-
-Examples:
-	dss_clkdm: dss_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
new file mode 100644
index 000000000000..95746bfdced4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments clockdomain
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  This binding uses the common clock binding in consumer role. Every clock on TI
+  SoC belongs to one clockdomain, but software only needs this information for
+  specific clocks which require their parent clockdomain to be controlled when
+  the clock is enabled/disabled. This binding doesn't define a new clock binding
+  type, it is used to group existing clock nodes under hardware hierarchy.
+
+properties:
+  compatible:
+    const: ti,clockdomain
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 64
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dss_clkdm {
+        compatible = "ti,clockdomain";
+        clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
index eaa727ab0d7f..438e190d1067 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
@@ -19,7 +19,7 @@ description: |
   that is used.
 
   [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+  [2] Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
 
 properties:
   compatible:

---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-ti-clockdomain-a27dd0fa1ad5

Best regards,
-- 
Bhargav

