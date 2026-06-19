Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD992372ED5
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866279; cv=none; b=CkTBTnMulEDQi0bPxHiWH2ckE3NCR6LeAzMbkDKFkeGCv15JzWQ9axBq/dWMeiCdxEfZRvXsAfOfeg9YvV/ce2C0021xx77nADqpbc5wVRxqayJQGhtq5iu0s5zYcjOD3BDPOXWBsoG6+0Y8n1NCK7stcuU/aIIMKTfF6NBJcQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866279; c=relaxed/simple;
	bh=SykjnU10/9lTCPrugwtbPPkeJk5GxVyFK+ZnCMDSP28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMh9YoL0wf9vGwAIv/o1nPkXY5MF8sG4ow601vhiBkAQ92ncKL311ncm31lgMW5AAsqOSGAfMXL4oGlxDpIS5eZR/B6Sc91Tx86EzsVJpO2COeb/mV+r/+AwDOEgV4yiBosFUiMEg///Hg2lAIdbCB5OKe7PDz+5ADj5M/GjVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=MGq5vD0X; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MGq5vD0X"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8584e80d59so894830a12.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866277; x=1782471077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rHI57LOVR8733JBEs8vxZRTMzLV4k08aXTwDaS1V6g=;
        b=MGq5vD0XcdMgAb9nMxb6bSdu42uaWdeENjsPdX3kzvjrTso1a4QC59/Iq095+KT2fJ
         6HXNjbAwm3iQia6OLbEwxIhOi/Dwz1j+sSEGOOT3y1WqzycMMhcRyDGqq16MrLmN7UY5
         rmuE0/oFUJzQ/Vk3CIM1UlIPAAUuVPPDVxuE13e95fdVVXRqGUTppu7n7XR0lbpw2/zV
         Q7cm0xkpyjEwkbZr/I7bmUhZVhHkR+sc8Jg7SzJ6Jd7IYXSrhwrYsHGVmtvBWmo0JqQB
         l+1+/5cRECCzlaSUflRV/++b2ChjPjK8lT8k33Z3OhmJITcTshiZQhc1/9JgE9uEi2rl
         R6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866277; x=1782471077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rHI57LOVR8733JBEs8vxZRTMzLV4k08aXTwDaS1V6g=;
        b=oGHxeus/Zob2o+GsdCeId9O4TXobTpnIffKl2vY/Wptja/eb4+XNQMpAiO0sJXAL0T
         QXlBAak94x5dM5BiQEYnKIjJOZYpy3CrsDQUy973wPln+UtjZOi+GL+jTuI4A1HLVf/5
         XlFSrqE73JGE/6t8mWAmpuLsdhrhrY7BhSejUC4uSDH1zdeQlD4Qehq5pCBZEf9VxaiS
         sB5dCs5c2zMb2eswT/yBB05jeydepKCdvqgv/Kwd8VyGn8LHBmciIfvVbiKcuT7Zo5qS
         jwPlOymxNl13bi9bJ4vOvH8gadWdSa53Ig5t3/r4SCOSW8MRQiJ9nZaFzIiR1Q1I82sC
         m5SA==
X-Gm-Message-State: AOJu0YxeNCc6Ix1RmZbbaO/FKpn0kacFqt2Lxw+aILEqWaAIBE/Z8ut+
	R4LlNymaOWLij1LymMty/PZCdiOwxnKp1XoZo16RjSyfXx2l40tCF8ksyhobGulJPEtfRSSDvdX
	Bi1pD4TZIqw/GSV/iVjWtydWpcNmnPp9e+fK7Seh+EyrdJefU4FFPBpMInVA87fMH5YhxNtMFjt
	cUMLZMkRJHrtrs5px/HFwfQnAZoWwLGE34iwRGVF9uHMPbqyCxZj40
X-Gm-Gg: AfdE7clnd9Vxq/hBv/srWT3Kig5jZWLC21xYsSJNaDfFOETSc30966NfLnlwuu+q3jh
	eiIcJZ9nEZBtjSbtg1pzgE5oxT2oFzeYIQO9wG15rDIcG5BhXRJwp/ZoXN04X78hgjdq67LIJTY
	CqXRwoTKw1vKDh/LgWX4KgltJAaJCZsPX6bmmYdVKGUHiI7dsqHpfyDqcDfoWNH5CNMIBJqDtPT
	iwfnypDHQoXoDyUYVAwp354Nw1ZVVReDRewnzauVcSE1CmzsnAP89+N89ot/+LDOVUlBvn7+9QG
	uIq6dJAjSeQE+i5md4b6A3c0Z005eIUFJHW2ti5Otakd5uuymOhStgzq11i/WmfsOT8fGbbusst
	JfCgHPg2gHKiQ4aa/ikticp9kscqOYM0z9HeD0C+TjgBAAQaRtAE9/b8uOfZsIV9EydHxncSPnE
	o6jwoIqHAaa4xvU0LQ9Utgu9drsg0DxuAeo1mH
X-Received: by 2002:a05:6a20:6a21:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3bb6c4644e7mr2625478637.38.1781866276775;
        Fri, 19 Jun 2026 03:51:16 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:16 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Fri, 19 Jun 2026 18:58:33 +0800
Message-ID: <20260619105834.1277302-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260619105834.1277302-1-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add per-hart DT properties for RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
 .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..4b5778b6d3e7 100644
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
@@ -120,11 +121,31 @@ properties:
       thead systems where the vector register length is not identical on all harts, or
       the vlenb CSR is not available.
 
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Platform-defined M-mode World ID (WID) assigned to this hart.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
+
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Platform-defined bitmap of World IDs (WIDs) that S-mode and U-mode may use
+      on this hart.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
+  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
+  riscv,nworlds: false
 
   interrupt-controller:
     type: object
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

