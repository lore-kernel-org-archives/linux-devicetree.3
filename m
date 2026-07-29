Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FA4949F1
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343196; cv=none; b=K6YizDODVoeK+cSY24Bkz2xkb64BJYW3vm1oLznw6oGSJ6x3XbCEf1PKJEBcRq+C+BIKX5yiELgfLnrAhrIYj0yC1zTSJyvgzFun+6hJaA18s+tPdOWRtDWn11QCbsWWQtXsIeaojt2xR34TD/N3YgDl14iYjuegpt7ofmdJ3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343196; c=relaxed/simple;
	bh=e8hdQKt3otUARt5qq5FbqhfFaJVc0leXSsWFb9e1fKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebSsJcAUL/L8yRFWtGtgb2uXLJhyzYrMVU2ZZT3pdmDGl6SQ63wsoBp3yyNrKESSIRCAezZ0wIH5CdCu9SYp5crH05wTDOQ6FGQkF4hYdh+cIJt/ORP4fhtQDbxsKl67WSekysvns4gQyVHGFRl/XR3HhTYFbyPHPIkSfLZHjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=nJ/NdCWn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nJ/NdCWn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954d383e64so7464725e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343184; x=1785947984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXo5Hfq+PdrRzrAqsKzhmflGrHnglgU4pxXRXkmrMyI=;
        b=nJ/NdCWnP3fZgdfaAY+lP7vqw97EfaGEZQVGmUt/U4OLYZm5xC9s1yrnJJZDakmPDs
         Lkwj/RQOD0GmF7XOb0XIyYNqTb1pD2vBc5SviyLvF+p2dlEMfGS2HgKqT8uzxsf/ke5e
         Qhp7UK8pPTy18hBFUwTC5Eox70oTpWC6CvS7WwIVraIOhlg1zajHiNmDyoE7iGJoVTim
         /Lg08mighFZvCQO7fpoxwpgeNkgAGhVoDwyxIVgapBgl4NhtLVwuofjLW8ptm9Ef6amQ
         yL8p8T9pzL9TtHQvm3M40OHtqP3bFkOhxQM9kMfhwV1jD4CaYWnR9m1j4Ae/0J+Zdswh
         p57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343184; x=1785947984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXo5Hfq+PdrRzrAqsKzhmflGrHnglgU4pxXRXkmrMyI=;
        b=qKuzOL8DrfC4M+MDLE85ap6jWYZybPrHqJuUHYnfWPuRCqgzCi8grY6zeD8JDMSt32
         J9bEkygPelaQEZvFvqxo6UFrwJ+Oh2y9O6VlyrdBlILA1y92GXg5T2KKYndlt3n381a+
         VE4LWXblNDwcfMNcnq3ARDmAtupjzoZOqcB2HSR+2PzyiZokqUlbmzxikB8eCEIXQmWx
         bAXIZSO2fnOh8lucaa3n91yoPLvt/ioeNOH+Deueg+5hpf0QwGQy1NXC38YC5r1cn97r
         y69ApHKlG78EiWuqxTVzyk1KUffGWVJRoYt12BBzNC7CWD8axCFZETDigYIO5+sPAP1E
         TL4A==
X-Gm-Message-State: AOJu0YwOHeGqNmUHHSmoS7VcuehD7ALjh9IfJCxupdpppK4y5DALpAsb
	62EuQXBRbcmI3OhGie7CBs/HCog27CGsxU16mFxpvvBGDJslfG0wdEKcmN+OIyfC2LVZg7u5MMx
	YYfm+CbJEyw8FTm/cUq9UjzmNNa9lhx/kKAmOrDrjiluKiHEAPSUkG2fhU2auQzsDwzmZBSh7Xu
	zm2q2hm0ETacvrMEQsPe1xLvyM9omrGFbrA0eOoXqTm3f0O+AQsecE
X-Gm-Gg: AR+sD11efxntRSiex7pF/vraxfiHFyfXn9zS7bGgHbPaWP7L9YXCVAr9ortlK+FSAsh
	unsrRnFnEiAlepMQDP3a9jifrTFbaG3AXktNbl24tfPHLTzCmwIrLlAzDHY1VNRJBGYBOmQO9r2
	J2himu4CEGtGsLMHEzHN/EyJdgSU6yx+VXWumTnImRbmYBD3eCTPyuI/gQuQ8aL90YCSK8avlE5
	RGLrt1UpKEaXrjqO2UAdu2ne3XceTsIM1iW0dpEHsIfKWPHIkrji00idfnIFOuUAblUqdBhWGwf
	YR5dmFMRg5oBYKWbZADI1M9+VSubmHlVKZbCNSld6W7SLWuQxpP2wlp9vGHwCxpC5kx2FG+heoD
	jEu8ulZxW02Ymf/VsmTnWGCGi+ch933ybxDl8lzu0XsJbcnivUBIZcT9a+7zY1HELYnT1jmxTeU
	dFe4deAC3pbeZHBpc3PjOIFYDJfQUT1TiXbBAVuHWbHzni/ImJ5JnXxdpPuuinkuQ6hNs/2jyK4
	6m7+hzShAF9jXJBwD9U2KU=
X-Received: by 2002:a05:600c:c48f:b0:495:4487:61af with SMTP id 5b1f17b1804b1-496c65cbceemr88122545e9.36.1785343183886;
        Wed, 29 Jul 2026 09:39:43 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:42 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Thu, 30 Jul 2026 00:39:07 +0800
Message-ID: <20260729163908.249838-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add per-hart DT properties for the RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Also add schema validation rules to enforce valid property
combinations based on the ISA extensions present.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 61 +++++++++++++++
 .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..5922a0307cfe 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,7 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - $ref: worlds.yaml
   - if:
       not:
         properties:
@@ -39,6 +40,44 @@ allOf:
       properties:
         thead,vlenb: false
 
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smwid
+    then:
+      properties:
+        riscv,pmwidlist: false
+
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smlwid
+    then:
+      properties:
+        riscv,pmlwidlist: false
+
+  - if:
+      allOf:
+        - properties:
+            riscv,isa-extensions:
+              not:
+                contains:
+                  const: smwid
+        - properties:
+            riscv,isa-extensions:
+              contains:
+                enum:
+                  - smlwid
+                  - smwiddeleg
+                  - sswid
+    then:
+      required:
+        - riscv,pmwid
+
 properties:
   compatible:
     oneOf:
@@ -120,6 +159,28 @@ properties:
       thead systems where the vector register length is not identical on all harts, or
       the vlenb CSR is not available.
 
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      M-mode World ID (WID) for this hart, M-mode firmware may read this property
+      to identify the WID for M-mode. For a Worlds-aware platform without any Worlds
+      ISA implemented, this is the WID for all privilege modes.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for M-mode use on this hart; each set bit N
+      indicates WID N is available. Firmware may read this to select a platform
+      authorized WID.
+
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
+      set bit N indicates WID N is available. Firmware may read this to select platform
+      authorized WIDs for lower-privilege modes.
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
new file mode 100644
index 000000000000..cc8b3747591e
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/worlds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Worlds Extension
+
+maintainers:
+  - Yu-Chien Peter Lin <peter.lin@sifive.com>
+
+description: |
+  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
+  Specification, adds World ID tagging for context isolation.
+
+  This binding describes the system-wide Worlds configuration for the /cpus node
+  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
+  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
+  riscv,isa-extensions.
+
+select:
+  properties:
+    $nodename:
+      pattern: "^cpus$"
+
+properties:
+  riscv,nworlds:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Number of World IDs (WIDs) supported by the platform. This is a system-wide
+      property that describes the total number of isolation contexts available.
+      Hardware components such as the WorldGuard Checker use this to determine
+      the valid range of WID values.
+    minimum: 2
+    maximum: 64
+
+additionalProperties: true
+
+examples:
+  - |
+    // Example: System with 4 World IDs
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <0>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            reg = <1>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <1>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
-- 
2.43.7

