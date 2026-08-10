Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3023115B8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786388121; cv=none; b=r0BusjgLeLurdu8CWIWTKsnUxOVsptvyR7kqu9ojdbHEtOWZx7ag0SHcalmpvsx4du8w+g3SEr+S/6ZwTTFQfFXpbybBXttSmpw00a05ngbMHfdOCUOSnKNvQe4R9NPn0MNNRS5pJuGf+pHpm+tQ9PsQhI2KI/hSd0g6gCFTg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786388121; c=relaxed/simple;
	bh=syIuRtPhY3tn7wtaIDeJfEtBlmwR0eFM9qA1M64mqKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oYkmn57LyK8dI77CXONnzZxz6RCHgZrZw9OL5kGhXsOEoLe1ioUitmUMeyKmEjRwpDwLV7Z2NfYlw6YPKwri2h31WUBU2+Au5UGEiNopsVK9U/Q5b2iivc7akKos6wJ+5semx4s1+MYUnnYeyqTYfgqp00PzbJ84MI3pgg0r60w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaqLhl41; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaqLhl41"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3880465ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786388117; x=1786992917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9AaWD5cPd4MaJMhCY13hRTM4owhIedKinlDcTDnUg6g=;
        b=qaqLhl41sOSGQpTSb0669vahVYs5B5aC5HO4sfsCkj7Vs4xQ+lNKLEHT6AEppJitSX
         JaPsYIXiLEYLBWqye01wndGKoHFk7O+yptNpCc7Fwu3Ur/Om1EkLcFXk3BkkmSZODJPM
         3ddGCnB7e3i7Zh2yVkOfjWHPUHARlLZTn3b3M4JQORjL0r+i3RhQwtFhWHgCAdYYSwOM
         P2jt0+I5NEFdfonOYEdmKvAsvrY3HIAq7m9O9QuiBRq1fLH15p0n/E5cZNjcyAXA5N3f
         MyrR2Cp8FnXGU80t+1rSqMadN6udK+dx7Gf0+77frsb/HpSOUNB69+3h7Z92d1ihDmBV
         JFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786388117; x=1786992917;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9AaWD5cPd4MaJMhCY13hRTM4owhIedKinlDcTDnUg6g=;
        b=DY1HOEcuCaNtVURe2BdV4y5W9bnmePrP5oldnq/iDx+4SxuvRqUZX34JvmvEtwdbm4
         dMHmB+JWiYOyvDfYm6bVeWasmqTRx8Ftb7cGiqHGfVrmqpUy1A+aRPnvRvIhk3dfqVuY
         AtEIPvdvnfWRZkR1nYLGvQnbxrYfEmL3yV+Ie/XfIQ1UVFiGb11p+3hTvCr/5r10EtDM
         AsBiyY5Yst0YnKvj1ROIHpETUhHEDF3iU8nseGH1f3QdMj+GpPf6l4dF8OIEkOmoTWow
         Na4lsegCsZP8i/WAfKeuJ/2MU3iYx7JOB9c2oRslCTk2TdIUmswW+PTeu3MgFXDx4+G8
         IuQA==
X-Forwarded-Encrypted: i=1; AHgh+RrqIYKqLB43SsSfY/hCLQX35tjNPyrnh4BZ6xI/Fpw/ndz2pVzaA2xb4wlSUF+35jt2YZh8NG1k4Dcv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKCdbdxlfLn6gmOU+/L8D07P5hFpw/b21kWacYSyY3zfH2PTKM
	k2M/j2QWIbNiz3Py5/7rAh7UghgSe4664fTdNhf1nYKC0n9rFfEtO/ex
X-Gm-Gg: AR+sD12xxcPyPU7IstGQ+Ouiu3qf+CvlOqRHYh0ohDBUlEVjuS8cMSt44UuH++ztqG8
	UKtUYmzZ2U/6WC1Q16xcTcHU07w7evTy3Cp8PNXGli8fAvzzAEKSB+nMc39kR8aOPTtXuxVj/i1
	/Kiq9uBMYbQqF4OzmdvAEEgoiqj7rNFiyUsMdtJpmyZG3B4oe3+nHD9YTvqhXH5wLpWFxK42caH
	jpxVeKcHlhf9GO7HkqxOKgcznSywZ3gauyN4VgJcIMaiTgv+tkWT6lvKvkxlHI719oE+XVfE7n0
	Zky8c5vls9xhHuqjT5wmOYAXO5GGFL8Ih5/LTo5fQIoh9jrFotZDMrdEh1vqWP+K8p2+jrYF6bn
	antm/uIIuLH2ZMDkd7h8s3PhKjSRLEDkd7heLpP6WSvgDZ8vWQc+yamHnID37+XvlOq1vmQJeIM
	0lSCAps8wxpTzYGBkUABLWRT/TMdnXtK43e1MixzyCFJ+o6AblvKJbX0XdyFlOqdVbFSw=
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2d0ca73a210mr342752425ad.1.1786388117361;
        Mon, 10 Aug 2026 11:55:17 -0700 (PDT)
Received: from [172.17.0.1] ([2409:40c2:5004:a08:95b5:64f6:95fc:7bec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm79067062eec.18.2026.08.10.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:55:16 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 11 Aug 2026 00:24:59 +0530
Subject: [PATCH v4] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ti-clockdomain-v4-1-3ae0c0be94a8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMSwrCMBSF4a1IxkaSm77iyH2Ig9vkxga1kbQUp
 XTvpkWw1OE58P0j6yh66thxN7JIg+98aNPI9jtmGmyvxL1Nm4GAQhRS8N5zcw/mZsMDfcsRSmu
 FQ4k2Zwk9Izn/WoLnS9qN7/oQ30t/kPP7TYHcpgbJJSetMS/Q6YrwdE3//WDCg82pAdYc/jgkn
 qnM1iTKShNsufrxUpZ/XCWuDBQKXUba1Ws+TdMHoq5IeCoBAAA=
X-Change-ID: 20260610-ti-clockdomain-a27dd0fa1ad5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786388111; l=4769;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=syIuRtPhY3tn7wtaIDeJfEtBlmwR0eFM9qA1M64mqKk=;
 b=nLCEMgGHJJiYDAdNacVRVgLnAxb0nzpd+/0mSubvAlhrDd3oaWm3BPyDPal0u6ve13bAOCoTm
 ERfw0lqJefyDGDln2z9+wAU1X2jnWizk7neg7YqQIj7vqDeKIcPPiPX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
required list as this binding doesn't define a new clock binding type,
it is used to group existing clock nodes under hardware hierarchy. Most
existing dts omit '#clock-cells'.

Update the reference to the old legacy text binding in the description
of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Rebased to Latest mainline 
- Link to v3: https://lore.kernel.org/r/20260717-ti-clockdomain-v3-1-3c263af4e9fb@gmail.com

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
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260610-ti-clockdomain-a27dd0fa1ad5

Best regards,
-- 
Bhargav

