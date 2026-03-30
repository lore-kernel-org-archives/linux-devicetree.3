Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC43C457B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868525; cv=none; b=EnZc9VYVqVNVOUz1UoeO+Mr4jJ6839itlAF9RD1311Q2XuYfz8k+tp89W8qNmrx+tV+EcsOKpkEB0Eb6p1v4d/pXa3Tl/ONZishg77bylTkGEiwzU3MV/YY2CPRhyzimDCr+jLwsozhtCYGpe5UGIrxmNZX9AKQJQv8jUWeLMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868525; c=relaxed/simple;
	bh=FCuBQdI8M9CLyGRgDYVU09LmhDLGnBteFJRbknT3duo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEyhb2oAvBI1M+iAb4WuCA350g5ISdrrR/ZOXTtNCCWqccqJVTzqI76I1Xh/akotV5ixl5d/jaF5C21/FUWOOeg2r1HNP0KyWuETlouzxXJyHY8RpWJksRVmw2+VXiMC3YZR1XBDhniX/ijTGNIQbt3LrqlYd6zLDi5ysZpDzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3hLuPQe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3hLuPQe"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad21f437eeso28760545ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868521; x=1775473321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzIYPQw/5COzLY48k1UwENwJKiLAR2jrBv0FayowuYM=;
        b=B3hLuPQeVTRmvuquP943JrPtYUlQIEvpXrH4Eiu8PdDkHhxATacXOZG3t/k+tkCjM7
         BVUNxLqP+OiaPWi4qZMSq9lvHFrZAoqawRCFSKchs+S0pFl+XadJpeL2OiuudEYgSEcB
         cSlIE1SAy5eWLVZoPpXmglXJnqW7KRq8BWeZGHPMOC4UdDiXW2AxBwnrlnZlu+Jt5kfw
         6Fl02zZQQWedf+pVZotrNOQpakL3uZ5UMD16Jbx0uxP7SAV0Bhbn30VqXDWsrvcgzWt3
         IuCJYKhmJ66Np2lIhEXPIe+jrIrGMcsAVj/H/qpWjFqqRs3opBMBMNCiOCUEp2VJdA+9
         zwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868521; x=1775473321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzIYPQw/5COzLY48k1UwENwJKiLAR2jrBv0FayowuYM=;
        b=DrilB92O4zC6LQ287xth4iXosx9J+BEkXTcpmEQnHyDbDTN9Ypqt5GEJAkj7eNfnxU
         jttLcb1/em8bWiT2wICxCmqOLNkfsjkPe0kPrdtbouYMB2/8ljUd3s2mFidBqCroI9fP
         4cVawtT5DidpMD32XXpYfG8SUtk2WjQ4/ogmfCWnQvkytZMsq7W9RAyhBWVfcCEri3NQ
         DuukqWA4OMezCh2wQWp6NCaT0IlrAZQ+SnY8hsmT5wWlfs+9muQbNYETy2CiGXC2yqaJ
         XwAg/m4xq8B81gCEzryFTVJQlVYRPk2ubdgsPRkfn/fo2+ZDJHOp6+9b7NVtl1WmpDdM
         SW3g==
X-Forwarded-Encrypted: i=1; AJvYcCWpE6ekAvPABhshM8BTRHhAp51hmPNUxH5Qp08BbfLqha3iOuLsNb8veRa3GkHJ4rZXR8pANra/i7K0@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWa4P5NlFU19hpmt9qMX8XEsbftfxh82jfnI1rr8wjwDvkOO2
	qvzh1LVoXEsaV02RRrWkhSha9DirWn68hWoQCtMfSCMaG69JDcWkmLrs
X-Gm-Gg: ATEYQzxLGW1Hynu5ERBRUNOXQopctpgSAnrD/L8kiH2MRVS69pBRVXNE/waAjFIkIIj
	QnQNMUkiMO0r6fdo18ZnQ3dfEffx4NKoTZhSMst8xZSmSTsglvKOQN+atTARszXRZ69bWmm5QBD
	0jlpIZYTmMs957lxXA43PR1qEIQl9/WZ8Cs8FEmwDp3O3vU8kKPNz6x0OMUPHKlCqH5pJdgMXwP
	WSXsIv+GtjAz8y49Hp7mRe4culQ8rh3loBvTOQhKwsKsolD4PoAXCD/IqGFhrxXrxkXOY1LTWSj
	HhHTBR84OCLh1iQLKk7+Vpx3xvkbxSgBrwu4MiUAMXSKNkVAF6vYza28LSNNfVv9uai01Gf4JB5
	tQLMceheh8F1lCqDHC5Y7JjkEwaL88PN2bnmQygASNEEbgU02EAQHEH4Hw8+sU6a5hQj3bHxnXJ
	F4+ld0rFdAQnwOCqLYGfXbXNFbNs/s4XPNNwJ+TQU=
X-Received: by 2002:a17:903:b83:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0c485870amr154320775ad.10.1774868518033;
        Mon, 30 Mar 2026 04:01:58 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:57 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: power: reset: cortina,gemini-power-controller: convert to DT schema
Date: Mon, 30 Mar 2026 16:31:34 +0530
Message-ID: <20260330110135.10316-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330110135.10316-1-khushalchitturi@gmail.com>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v2 -> v3:
- Used generic node name "poweroff" instead of "gemini-poweroff".
v1 -> v2:
- Renamed the node from "power-controller" to "gemini-poweroff" to resolve dtschema warnings.

Note:
* This patch series is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 2 files changed, 42 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
new file mode 100644
index 000000000000..ef5e04f86be1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/cortina,gemini-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems Gemini Poweroff Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Gemini power controller is a dedicated IP block in the Cortina Gemini SoC that
+  controls system power-down operations.
+
+properties:
+  compatible:
+    const: cortina,gemini-power-controller
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
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    poweroff@4b000000 {
+      compatible = "cortina,gemini-power-controller";
+      reg = <0x4b000000 0x100>;
+      interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
deleted file mode 100644
index 7fec3e100214..000000000000
--- a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device-Tree bindings for Cortina Systems Gemini Poweroff
-
-This is a special IP block in the Cortina Gemini SoC that only
-deals with different ways to power the system down.
-
-Required properties:
-- compatible: should be "cortina,gemini-power-controller"
-- reg: should contain the physical memory base and size
-- interrupts: should contain the power management interrupt
-
-Example:
-
-power-controller@4b000000 {
-	compatible = "cortina,gemini-power-controller";
-	reg = <0x4b000000 0x100>;
-	interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
-};
-- 
2.53.0

