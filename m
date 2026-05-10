Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4C2FF641
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778438686; cv=none; b=n99PMdywYaDFeBM1aSwrhJB1LJ/kmlqWXZjPDOiUIjxmK7nB72gU/rNVTWQ6OL+MCcLOp7hihYFsZf5IT1WM0S69jEctzMW4Kx8ai48J3RJ4LfhvPoG2k0lwTpUqsUDrUjbkLX3WV6RPJUfU98o8KB4HVlpUzTJUfkB6OUIHkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778438686; c=relaxed/simple;
	bh=JSVhh/bqzNNBIWrttTlrQaNe6uYitvQ2/n0bc/2ZXnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfMq1Dk6qkBD2o9FXLjfQZ5f9yCw4+Tx2loth242lLkVDFpSq5joUPuqctYN4SxZEyyVqoVFOiaL9Pb2KOzW+e5WjnnuGgmfjlUO5c43O4+bpWHcdZWeqdwGuvX9RyNKRa7ruewL5a/+CLYCv0ZeWCizjnUNwkGV5EIZ3pKuDfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r15rQlus; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r15rQlus"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2ba856db1c0so24466825ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778438683; x=1779043483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGLV+O4Lfhz3oNd3/w21HvuoYAPUTORX06flNHAIOMY=;
        b=r15rQlusVlJz0npKjjTKSBoKPjS9Bu0Wt+0NnFGwzDeok92ShXKIqyDreVnocY47C0
         JkAdbIVizwyiEGuOABCXlZQMTxcfBSW4hBawzMVqqXLcEn90l2MrtKRYaAgXg30LQp+K
         F2rVI2ziAsd2LIgzJd17+aoirgGEwqIe/iCPCmCH+BcOIXLnDTSqW6hmq07nFdhRcClJ
         pDcuWuohUJm3N5SD67LpbRHjPx8aQCi7/duHscfm9VrJuWNx9pRH2xWfXEXeRtHcsRSd
         djE/Wfb5aJ7JblZMIfTArQbpAzt51PFxLBKLlD5nWSz4DnzZPgCVQ+MqtjvDmJAXvsD9
         9fCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778438683; x=1779043483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGLV+O4Lfhz3oNd3/w21HvuoYAPUTORX06flNHAIOMY=;
        b=oskqx1XaLOSVxbCr2dsys+pb1sKMzHnBJoQh5W307+eWbuVUjQXulZtwsueB17VUGZ
         zTKp52vTF/JKj0g8kJ2E3s8etwwcYVNOX+XH/sFjNgebTuECHsFRExfL2sMPV2C4U084
         QuWPfk2xud4e5H61DiFgq8eiyHKyzKr/B33j78dqZh0Xh0ZslLeteEf+lKo8K6h1V9l2
         JSaOH5L9KiMMxlQ5KG2jGXRGqEjpUrN5CESk5GzZovYrDpVbvl494ylojHdPs4Hynjot
         G4Rf5zbQz+ocEjrft9COuo03sqd9kn7F9h3Keoh0z/4THzYmrLTycxR3uG5CTmIoiSG3
         Y2FA==
X-Forwarded-Encrypted: i=1; AFNElJ+HCyZ/OpBUNaB4rzqUBUwRdchhePfW0qDRueo+TiH+GnD/jd6IfEM+WEMxVN305pevP5BZwuY8zQXb@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2bzjgChIjy+cwNMQw003/jkcf2VZ7rqqIi/9UQZ/OYNLehBE
	zmgi/mu4btdXgACpz2DmZL0CL5BTL6SHGvj7QWfJ1WU80y2MplDh2Nyy
X-Gm-Gg: Acq92OFJCZalPwwFjNF4qGOquM88PXBfeszFah4ts1/OX73VaC2xEFPexIgyHFiat3b
	tMc18zTRkK79igK0ELttUskDai3+hzR5afni8KSNM3fvntmAQ3KY1fVa+6c6b7xKyA0WPnxEMpw
	IttD9+Y14MZdm9Dz4tD8IDs8Lhw+VlFcU37offX7xT8Qe0Lxg5OiG9XbA+RvTOdmHI1qnqV8jza
	evKEXDdl+JNKNoQ/SytbWlT+bpRzqabSt+F8agY0KL5eZFuNungOpEo8XgTLbk1OvDeQucUIww0
	d/exiT7IRBISaTLsO2ccjlI+6hRTqt3HYOt00+Y+Ja8qu+WT0OFLcdr2vbVS0QKWDw3adm4y3MA
	pt+7EiPxU01GBZ/ilkyP8YnXHImctZwG3r8/q2nlagt+wqBbMWJ2i74CkvXWjft6EXbIQFPA7jU
	L8zs8N+AcepcZtIWtYrHMHQ6eTQRfwhPlvcJC6WMfi3qPxOy54kKmBBBTQ
X-Received: by 2002:a17:903:32cf:b0:2ba:919:bbf3 with SMTP id d9443c01a7336-2bc7a9a45b7mr71857525ad.14.1778438683543;
        Sun, 10 May 2026 11:44:43 -0700 (PDT)
Received: from localhost.localdomain ([171.76.86.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e9723esm85389545ad.67.2026.05.10.11.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 10 May 2026 11:44:43 -0700 (PDT)
From: Kartik Nair <contact.kartikn@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: christian.gromm@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Nair <contact.kartikn@gmail.com>
Subject: [PATCH] dt-bindings: misc: add documentation for MediaLB DIM2 controller
Date: Mon, 11 May 2026 00:14:19 +0530
Message-ID: <20260510184419.98043-1-contact.kartikn@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the MediaLB DIM2 hardware
dependent module. This documents the compatible strings used in
drivers/staging/most/dim2/dim2.c which were previously flagged as
undocumented by checkpatch.

Documented compatible strings:
- fsl,imx6q-mlb150 (Freescale i.MX6Q)
- renesas,mlp (Renesas Gen2)
- renesas,rcar-gen3-mlp (Renesas Gen3)
- xlnx,axi4-os62420_3pin-1.00.a (Xilinx 3-pin)
- xlnx,axi4-os62420_6pin-1.00.a (Xilinx 6-pin)

Signed-off-by: Kartik Nair <contact.kartikn@gmail.com>
---
 .../bindings/misc/microchip,most-dim2.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml

diff --git a/Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml b/Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml
new file mode 100644
index 000000000..213078811
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/microchip,most-dim2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaLB DIM2 Hardware Dependent Module
+
+maintainers:
+  - Christian Gromm <christian.gromm@microchip.com>
+
+description:
+  The DIM2 is a MediaLB (Media Local Bus) interface controller that
+  provides high-speed communication between devices. It supports
+  synchronous, asynchronous, control, and isochronous data channels.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx6q-mlb150
+      - renesas,mlp
+      - renesas,rcar-gen3-mlp
+      - xlnx,axi4-os62420_3pin-1.00.a
+      - xlnx,axi4-os62420_6pin-1.00.a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mediaLB_int
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
+    mlb: most@2b600000 {
+        compatible = "fsl,imx6q-mlb150";
+        reg = <0x2b600000 0x4000>;
+        interrupts = <0 53 4>, <0 117 4>;
+        clocks = <&clks 218>;
+        clock-names = "mediaLB_int";
+    };
-- 
2.50.0

