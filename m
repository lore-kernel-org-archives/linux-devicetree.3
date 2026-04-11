Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F262E5B1B
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775932626; cv=none; b=WKKzvXfaZf5p5LF42M9M3zLjqbd5rD5QjmvemODZBN6QGSroYEj4ZdB1Cv3frm6YcXhWlyDn31QSF1X1hfZtgnXig3eSqoUDN1CgE0j8V7nVaNif7dGVv9cSUN+hWHjZ5W5T7ZtcGJZ/fRIB8TZpk9qI6eQr0mTgKIkBUipWc88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775932626; c=relaxed/simple;
	bh=iV9tJ+vi8bYCDpW+9uQlTp604xvZSZseQVgrphqeQrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9gWE4zD3uExbCck1r4p06DSHwKR6xP67TYyOsGOGe41xX5mwLR7Yki8h+W8VPB3QjM1fAoNuZdUp3TF+m0Q3rmdp2ZoRYL/KExpyNxP1DG6u5DYBJXQeBmeFmSCvLqAs31UAdaHMBKdd00UF4PDGJDtB76T+Tgd/xqgHDX5p5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0tFAnnJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0tFAnnJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f1f6103afso322158b3a.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775932623; x=1776537423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1ScsqIgcchK6ddkznfoLoUzc44ntc6r+7NNgsSVREk=;
        b=p0tFAnnJC5bOPF+2LefvaP5ptDKMHq8RSBenI+lESFxrgXbSOVI9CLl/S59hgbw6vU
         gtyVgbrVj7EkOF55yJQ+pu1+HMCdWDQx5bVacQvdS3y6H8K+OXl8IgJQZtpAFVJmVrcQ
         AF/LLzh93Cz4WyqdvV+Mu9PyxuG3LjTXhKEvD7e8tvMesCbLz3+sz4WUOHmlX0dOamgg
         ilj1A3nitpJucm43G3F5AJ2pIi8XC5ufAmAygPE3wIgVeOuue36PvYq17bdtt8VvF2Sh
         h21sLh8rB58gcsIkqzU46rTKYNSHYynwlqODugIG4CzrqR4vlHaqZzj8+HrBhjN3ycTC
         78Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775932623; x=1776537423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1ScsqIgcchK6ddkznfoLoUzc44ntc6r+7NNgsSVREk=;
        b=Y45oqLBo9okhZ4Ten84tr9M02taqGa8Al8ptyqao7+9eY/Jogx2h8Et3u8xp1cx7gx
         YJGtoEYSjplVcwQBdryKLlg3qitrdVrH8kWc2N6RyzFnWMZ0c370TAvyioTTjQhCzIuL
         RSUSRvM5IKS0ZMPqTZaJqPtX3kwOD1ZHZF26N7tmlshZ3JFG1KNV6a7xIvSY7J5dVJpU
         P4Np/GTiE3neGLTn+NdMyKRkdz1wXNI8eyIqDWihKG6vCSvPDmuTTRsnqjyV0qOujeSz
         8mhtYT/TrsTcf31e08mn3pjnW0AqYEBLE9wbpUZMW3SkR1dGRJ5FTrDmmX6+V1xnazBn
         FzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVj7zqMVTOMStNAPbII6hH1akWChdDiSZiXlckv0m/+vfWRA8Rv9mZ+57qoX+m3r62s39e16irbfiW5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9p0anpGdOmAbh/8H/mPtNsJU4dqGA0isaAXRnuBLjMI2CDvV
	LtExYEUm5zR1EL1gq/qYj1d2dyq56Exxq/SC7PPe0xuYuGfCSZwtB3RGIC1swQ==
X-Gm-Gg: AeBDievkbi2yjTGYhUIhqW58G1e03uxV4rKqzUunslt3Iuq6RWK34lbtjpDRgLhjc/S
	xmc2RRG6hbUb9pfHrwNNtYiFJ+K7SLZloPOgHmjGq0kCzLcngIynPod6w6yQ9yY0aSZ/HB9XEZi
	G38Fvj1J22JnTa5hzBgx3JV8BlC0B2XniHOxnoRslLo5JnvnLdHpWUMMBSRr93UVLjBdwnaIpBX
	takTKj7Sjoab+tbIiBDKIZqJ+mPH48EPk9KJNnn9fIcnsIGKKgZdtagg6iNmtWq/jYeKdIqP4qW
	S/2UJvuYcIv9XS1kGOySnjDnz/7jiXuxe64TDLVP0t1LfFNbvIW92USG+PhYViycqSB8XYO7e3F
	7YdA3csX6TLp62HtoS0Gqe9rP2wtL0B+st2zBexuTf1mA3kzKlBpQSt+YYWHLWENHTtn/6DqJav
	2HZjEsp+Xs3CTRXqSu9j96jnCL2Q==
X-Received: by 2002:a05:6a00:450d:b0:82c:ec3d:28b1 with SMTP id d2e1a72fcca58-82f0c402644mr8116511b3a.51.1775932622965;
        Sat, 11 Apr 2026 11:37:02 -0700 (PDT)
Received: from snowman ([2400:7be0:12:e4dd:27b5:1cbd:36ed:c390])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c337b1dsm7350091b3a.18.2026.04.11.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:37:02 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org
Cc: pawel.moll@arm.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT schema
Date: Sun, 12 Apr 2026 00:03:55 +0530
Message-ID: <20260411183355.8847-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ARM Versatile Express Serial Configuration Controller
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Modified compatible string to use an enum instead of a generic pattern.
- Updated maintainers list.

 .../bindings/arm/arm,vexpress-scc.yaml        | 53 +++++++++++++++++++
 .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
 2 files changed, 53 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
new file mode 100644
index 000000000000..9b8f7e0c4ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express Serial Configuration Controller
+
+maintainers:
+  - Liviu Dudau <liviu.dudau@arm.com>
+  - Sudeep Holla <sudeep.holla@arm.com>
+
+description: |
+  Test chips for ARM Versatile Express platform implement SCC (Serial
+  Configuration Controller) interface, used to set initial conditions
+  for the test chip.
+
+  In some cases its registers are also mapped in normal address space
+  and can be used to obtain runtime information about the chip internals
+  (like silicon temperature sensors) and as interface to other subsystems
+  like platform configuration control and power management.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - arm,vexpress-scc,v2p-ca15_a7
+      - const: arm,vexpress-scc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        scc@7fff0000 {
+            compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
+            reg = <0 0x7fff0000 0 0x1000>;
+            interrupts = <0 95 4>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/vexpress-scc.txt b/Documentation/devicetree/bindings/arm/vexpress-scc.txt
deleted file mode 100644
index ae5043e42e5d..000000000000
--- a/Documentation/devicetree/bindings/arm/vexpress-scc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-ARM Versatile Express Serial Configuration Controller
------------------------------------------------------
-
-Test chips for ARM Versatile Express platform implement SCC (Serial
-Configuration Controller) interface, used to set initial conditions
-for the test chip.
-
-In some cases its registers are also mapped in normal address space
-and can be used to obtain runtime information about the chip internals
-(like silicon temperature sensors) and as interface to other subsystems
-like platform configuration control and power management.
-
-Required properties:
-
-- compatible value: "arm,vexpress-scc,<model>", "arm,vexpress-scc";
-		    where <model> is the full tile model name (as used
-		    in the tile's Technical Reference Manual),
-		    eg. for Coretile Express A15x2 A7x3 (V2P-CA15_A7):
-	compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-
-Optional properties:
-
-- reg: when the SCC is memory mapped, physical address and size of the
-       registers window
-- interrupts: when the SCC can generate a system-level interrupt
-
-Example:
-
-	scc@7fff0000 {
-		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-		reg = <0 0x7fff0000 0 0x1000>;
-		interrupts = <0 95 4>;
-	};
-- 
2.53.0

