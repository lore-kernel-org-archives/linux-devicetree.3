Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BFA34252B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 17:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150734; cv=none; b=RXmX8mnhY1N8TFukjuruhkB0NOmG8dFGlh6NuKzvZ+YH4yfDq0ocpa0srkCwNLohm4YRRJ/NHCbBzS6a8OrcvpFcefSLPhoqSPc3xkBURZBXckH3uJ+Vz4lFeQeFGZ8F8WWU6oKUgQ19HBR0ZUQljU+1HGNFjoswNPKxlfo09Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150734; c=relaxed/simple;
	bh=phde+2c+y1PP9o+vu6bFzca28DkhbqXg0K330uAMoyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PsAJuyyIEVek4mHRxnrd+StVXRWhMcft5N7yLnYlyhX/iqsN0+JK0eMPdXCmagRp2q4+UmT5aaKXTwg4b2mlUjSvC4oyhUnXsgrTxS+JGOKgzDYNIAJ7Fkygd2wGszBez6R78gcZQP9ETkPnAS/LAarkmRWFRHB2Nn7LVZ9QVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgddHNaa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgddHNaa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso1196375ad.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782150732; x=1782755532; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSigCuJhChrryg/5t7v6p4ZT2/27JuKuCTrTzEE2KgY=;
        b=QgddHNaa67xI6PxrrVT8mraS+LSYMbo0hOll07XeQHMTFrqnw/sASeGrqLKaaZuO9y
         rQkDoyILcif/nW65CtrlGCxg6tgLgxr69Nn/FhRPYHFLGJhIKtYgKIIPgXnFqx0saSG2
         YidXGUV04crfkMac6+r1uBOtA8OWWjDbDBnCV51jXqKumF1jz+WrMuUhjpoSWZ9rbX7b
         1fbzCtjQtsUIqhQYwuDS63vyXYqe30qW4sBRcgVpCqIX8Livhl261BgnJI/3zWQWAtVR
         0JNoy2jHvSGg6s9BdAMmnlyZK5H20w09iQw9mlB3SH4kNKluq61Q3z3NidOUPXrwzhh9
         zfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150732; x=1782755532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSigCuJhChrryg/5t7v6p4ZT2/27JuKuCTrTzEE2KgY=;
        b=GXlplQW0U878ywmGAtGVFeGDFVN9oHTclWCSUClf0MNzhkqmuEdPVr88oHLiHcLX6+
         JCG1ESFzwOQCPjQv4p6eF80AETBtr683jHCHl2a8XglBrQh+yUUkPe8YBGIUOPlGoeqx
         hrKy7O+6SAmDvkFi/gRhnhwBuBdHJDkd7OmUuVcU7HlKKhyrhpAZz8oU/RMLQwZ0yU66
         FPZXeM+qxSHTFbY8GzR0CpkJuERpwBV7eMLETaXVtalMLea0I7yhlSLx1qiKHkhh4qJZ
         hbHUo6R/7NClVdx0rGc4n7nsuJHfKJ5H0qpHeSdIhc3zCluILK9yApIRYw7em/YINAVo
         AY3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrf/NBCxWfugkBJT6bgANJiPAM/jxbNYcl3tzCk1ft9gSe1OGvEuq3R0KYnrV4th3fiQidrUywn97lq@vger.kernel.org
X-Gm-Message-State: AOJu0YysXX7ItCfkeWJoM9dWQt5IeoCPTRBn0shD6hY32Y1C1czTDf34
	KxdNib2l3vUOenjEvfgtek4r84e2qeGdGjTyU+iyGXwKaY4JyWkUgB8a
X-Gm-Gg: AfdE7clMr6R4uKk+z+ZxkIW5zeeJQB0SVPpgmbZ7cpowpDwrDjNulbV599k2lyWhO/L
	vTdObZdQoI/JqASDKQppKvHGTHzhCpauuNBpVE7QawD24FAoEBzgmSGqLjdbYSdOKILd+Dwir58
	JM62PzZb63vWJCledC+JVujlUpUs3m+t1hGFbdyniiJonj0TlCQAAIZsyUBoi3f0qGLh6vwlkGo
	yxZeoIvUflbjKvIzq49/0Y9wBCZP7pVtGYDqUKMNrf8LP1XDZKpkIY2alX5wzbJsnM81eyK3W13
	uqYWrz5Y1aGsDxAj9+kJeaNKturpGZJBHj18kYHTdluojne3xWgGWxulU2tKzk+F33MZkeHzaTs
	XL1ycJaNijmYbfhHZnJx/5IOsnYpgOHwUrnH7sAn65sKxmvMaZanJYdO5Wx9Ku5jdOxIYr7x8Vq
	vQoPD4uBGLHT9/lyYakomuFMOw
X-Received: by 2002:a17:903:19ec:b0:2bd:5b20:a5dd with SMTP id d9443c01a7336-2c7bf10bd08mr7272175ad.1.1782150732201;
        Mon, 22 Jun 2026 10:52:12 -0700 (PDT)
Received: from [10.30.232.252] ([2409:40c2:7415:f49b:1d79:b65e:e5e5:aa4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7c4a482a5sm1661075ad.25.2026.06.22.10.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:52:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 22 Jun 2026 23:21:33 +0530
Subject: [PATCH v2] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJuSCWhrV72HuBiSUYeqKYmEF
 sndm0pXXf4P3rdD5CAc4VbtEDhJFL+WMKcK7ETryEpcaTDaNLpBrTZRdvb24fxCsioyF+f0QEi
 uhnJ6Bh7kdYBdX3qSuPnwPvyE3/VHGfynEipU3LZUNzS0V6b7WPb5bP0Cfc75A0Tai0ysAAAA
X-Change-ID: 20260610-ti-clockdomain-a27dd0fa1ad5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782150724; l=4363;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=phde+2c+y1PP9o+vu6bFzca28DkhbqXg0K330uAMoyM=;
 b=MOi6XTlhYsHiLRYt3SRrvqgVyslJ9itphnNCoCdKo24Y5Pk+w6Ex1dzoNYof5VuJwUQbjIrXL
 phAuxaWB/EdBAm7n8gPvI8LsGXk6X5zqZ0/Nx0+xtY6X+EERawkK3yg
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
Changes in v2:
- updating the stale reference to the legacy .txt file inside
  bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
- Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com
---
 .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 -------------
 .../bindings/clock/ti/ti,clockdomain.yaml          | 41 ++++++++++++++++++++++
 .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
 3 files changed, 42 insertions(+), 26 deletions(-)

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
index 000000000000..9494cbb1a942
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
@@ -0,0 +1,41 @@
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
+  clocks: true
+
+  clock-output-names: true
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

