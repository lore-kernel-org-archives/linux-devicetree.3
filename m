Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6173FB054
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360227; cv=none; b=HGCereZyNIzddUJcNrMGIP2PccxIY1FCkSkzmi7i1Nt2YGXMqJu/lfzb8zMc5dzStU3babXNTDF1/wajuh70ExB694uomGfOjSJ0xDkpqH2tYyI18CD0ov4c33ZowauVPLAtU/sg1Sm8uVakU1PFCWOJQJ7exAyFuNyqgKDyXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360227; c=relaxed/simple;
	bh=ZFB19VUeR99A5y68es2jsd4tSaX8a4ZSbxHmtlwKA54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bb0nIzgTUzpDVcbFPov/p2KvYGGhVRTIwjhVVHapX2dh1ZHU0Nx5bwXZhtctwvVZbnBuVXZJEUFDJQhzU5aKbu8UUcVYNw0GQW5kYpiE5oi+qCZvHM4NfWyJuPwPcAWMbRjOTE9BE8yeOf3EgaMSX1VMEw8UoL3pziWVWz0n7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENBwxu/2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENBwxu/2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c741bd1ad11so595499a12.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360225; x=1774965025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG09CQ6i9jLIM83EphpMOCR5GqtN/33XucYU6e5iqHM=;
        b=ENBwxu/2cYviaNH67Gl3pMTMthedNf2x2/n8rThJGB++zrlVdPd9BoXxpqxxT5tphQ
         BQ9x8BMG02dLhttKToD6qMh6O0VJfyPW0fQBAj3D2NHQ+9pqrNu6sRzbohWl21X2qwPX
         GN+w0lqr74C3kGzsO0r4tzTY/S/P0gKK4o9VnAPwSK9A5CpeRutZaUAJZ2s7wPtNM/LB
         NVnDe/WoNNS3vtN1CYYjOVzx0wYxX5+u+fadx8oh+DWEEvsnWZauqoF79TsqemYj0Qd3
         cGT6oc7684agDMImj62yA1RwbAuAb3siS2/0E8ft45VFJ22v3sNaXIxfF83OPbLK5k9c
         028g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360225; x=1774965025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG09CQ6i9jLIM83EphpMOCR5GqtN/33XucYU6e5iqHM=;
        b=RwVd6MMmO1cVLyO8HxS41Vz1Ij7x0Wl1dHpeyUCdnT9GOFpkhLbroSO/ck0q/aXAiw
         1ShYm+3O79iDBCWIy7H+m+YXyeWQEZEq1scstVNmEJLaoi9W9vkFIT68+vjUafinaaiv
         eNq1h8Q5DUbNCyt3EzpOXnJ2Q4TCszfxdvwmgQX/EDhOzYSYpXU919U0lRs24kwJ4DLv
         HEa5dVwRg+A1z8W2UjG42ygFPxUfx5zlm6U336dEJoJ2Mi0fjNybntBhjI7C5WIyl+uw
         hyWniIfdkLiZadlp2m21gblf3J/DQOyzc5zkz9HBL3tJhWIVpNTud0dFeIa/XDJKEZ+V
         4JrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhsdvRjr5gQTFTu0u4XEYaXd/okafGmB6wVPj/iZAMPcPmgWfw1k6hb1K1gcm7Mq++Re0HJw8iS3yt@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaQuBcw/3SAs8NNixkzOijl0r9nLj84fpJds3JR2dM0z0+Kdt
	FCTAKpr7oST4FCDMqXZ/k6WnyquxXLqh4fzFH3rsYliYZMMyUZTMmeq+
X-Gm-Gg: ATEYQzxzuxDG1nqQDRjjO2yvzHEOXo8VlOFN8pJeTRXWcapawy/0YWnqaswsu7unN9P
	rNFW2SoKCGkOZcj+K8THLn0ncCEboMnhQa3wSO8eY516Vpvd9m73fiiZXnMLlUIWlluCh58I3LT
	2oMRYOILqNFFv1ibFwKsw5ob1b83cB7ABqSVTRifbYBcbUQeCyTFGJ0m1c9UNj7cI+zo/Y8XuHG
	tMKWYZ2ZnAU2s8BmTuzEnO2WgaQKFTGQQeh4g+EgjgzNqSCnCeHKVSKeeEnHOVjQ7iAQIZLyGk9
	NSMLp1LD4Y7+vNIG5Hm+E/EqaIsXTEZAfGxJVggv/I/pfHGgAzReriDC2dvG3G/hwSwDDqChkVt
	DcVbtF189tL6jsXkWFYbpO5liiCxezx5EeVsWzFQxzl8ZFJcKusMPY6nORldYBxxLErU7LNMD6z
	An2IMyD9ZPp6Nt4qmuVFWfvz8=
X-Received: by 2002:a17:90a:d446:b0:35b:982a:28c4 with SMTP id 98e67ed59e1d1-35bd2bd5848mr12549745a91.3.1774360224631;
        Tue, 24 Mar 2026 06:50:24 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:22d3:4161:93a:b87c:36eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c030577f7sm2900902a91.0.2026.03.24.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:50:24 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: andi.shyti@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	i.shihao.999@gmail.com
Subject: [PATCH] dt-bindings: i2c: intel,ixp4xx-i2c: Convert to Dt schema
Date: Tue, 24 Mar 2026 19:20:10 +0530
Message-ID: <20260324135010.17730-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert IOP3xx and IXP4xx XScale bindings to DT schema.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../devicetree/bindings/i2c/i2c-iop3xx.txt    | 20 ---------
 .../bindings/i2c/intel,ixp4xx-i2c.yaml        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt b/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
deleted file mode 100644
index dcc8390e0d24..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-i2c Controller on XScale platforms such as IOP3xx and IXP4xx
-
-Required properties:
-- compatible : Must be one of
-  "intel,iop3xx-i2c"
-  "intel,ixp4xx-i2c";
-- reg
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
-
-Example:
-
-i2c@c8011000 {
-	compatible = "intel,ixp4xx-i2c";
-	reg = <0xc8011000 0x18>;
-	interrupts = <33 IRQ_TYPE_LEVEL_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml
new file mode 100644
index 000000000000..13ba2a0e336e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml
@@ -0,0 +1,41 @@
+# SPDX License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/intel,ixp4xx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2c Controller on XScale platforms such as IOP3xx and IXP4xx
+
+maintainers:
+  - Andi Shyti <andi.shyti@kernel.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - intel,ixp4xx-i2c
+      - intel,iop3xx-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@c8011000 {
+        compatible = "intel,ixp4xx-i2c";
+        reg = <0xc8011000 0x18>;
+        interrupts = <33 IRQ_TYPE_LEVEL_LOW>;
+    };
--
2.53.0
