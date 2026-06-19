Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030A1F30BB
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880410; cv=none; b=AD84MUtPva0e1rm373OZeBtwpkx9xxdtU5/V9Pa6VBSFmD081ayitACZUpATagBn1oIK+MNxde5xh6hWDhdq4KSCmd+W4Bc30DVOZddJqC5ZLeAnItw6J5nV1JOq7q3RsjV1MgRtjC8z4IRRirP+WaNulZTHPpMigC3l4TN7Arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880410; c=relaxed/simple;
	bh=VwwQJeqWDmVBmZQDyOVHyUnv7kj2BXGTz/LVwYl1y0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMi7xmA17NXGuaoJPLyP17y1/1W+TZUwTivp1UfFJ0v+CHe7NGAEY+pNNcGW+PxOXjCoPWQk1ha03HR2wps8GP8whp82c3OXFbWK2fIadZVXPVIBnrbGPlLeFv3fepypWpEyGMZ2B1QEKHzOZHLz1Ni8H6wxSYy66R1FlKeDjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=k7V4cZRI; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="k7V4cZRI"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c890110acdaso981368a12.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1781880407; x=1782485207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kemVDG0Oly3DI8A7HWUfa06UTS4au9Nb4+LLiP8cDDQ=;
        b=k7V4cZRIRphCYKTkY0Y0q+ILbPJMLvEec98xqo3c4Bj7NXnEMjeR8d1E9FBOdyXQyz
         XR0wrUDr37FoR32pf+ccaQElyQKFnwygEn80q3JyUzfQBLJwf43YlCFvt6n2YE7iHDed
         rBqQ9VffxPohzeq1JkajDFeeuioyXGOlnXe2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880407; x=1782485207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kemVDG0Oly3DI8A7HWUfa06UTS4au9Nb4+LLiP8cDDQ=;
        b=Epp0RiprfgmsKkIAlRroG4vxifcTdWh4Zg5oaBQq2TJ8JpDGHxMnY+S8vNnCLmLRio
         yu/byrIFAYw7b27cQ6EFbvTy9v54k/MCdbfkrMuAWu9aycskYGmFmCqayrUrQfcoz7c2
         VFjvXlSB+g2ggzwVOrOKQNNTNdPiYQkMttSsKZtRy/hq+a+9QUBt9QzPuaWQhCNg3oOz
         kUNC8ZC1mAISvB3xM9yEJEu/INi7NSP6y+xA8mwz9qbi0ctu0XuwpmDYMgCPo5xkezZW
         u745Xu4RkP7s6zbMQQo/mHB8wipxOPy2hrlmBQn2VF6Ecg5Th6pMWPVabzp3Yk2Y7lpo
         IPCw==
X-Forwarded-Encrypted: i=1; AFNElJ+AABbRq80KM5KIOhsZX1hHqrEhdypv0gkIV2isRNaXcp90Ibbs2qNkOQUpoXFQ3pisRCVfWtg67Bhh@vger.kernel.org
X-Gm-Message-State: AOJu0YzlsxjF4lkG06t4H9XWXn22DHhESL7OlxcoBz12g3TXqw+FLFiA
	4hUvYBYFcmUVPD+o4PHYp2ss7YSB/7nBJxQOIVh81rnOOL6s5eUE2a0zhTzAxDaCST4=
X-Gm-Gg: AfdE7cmekhtyXqp87mgwWxTH+M12/K24KqgxjizTJkEheF4gi//PU3UHFBykN1n02h+
	/SYPIZXyxKKrzH9cUh1t66KOq2KlY/oR78GDJUQj6CUCvwttvxwz46nOWX7kLEZGVYEBsGBp2b7
	BHYjtztI7UEB26lju/EwUgZTGwpsgtBQZ2W0EvdIcWCbxlemes3lESBtle61MYeNWI5qrHfSZbZ
	9Hgzc87dpSlKMLDH1hRePXdurrg74JowY9CMBCAMbqlOO7wzfQVqcwmcPoPyvg5UszWB/JQ9uX6
	nKeV8lzNFX9j60QsK/ei+IL+RxjWgtSbd+SrnozMrOBqjaxpML77y0aPKkp5Nl68pqLK7XD53dW
	jnwIUrI10lzVFcqUkAaM+fKYyYqDmKn+tjZKY6shZusz6yWWKMt9P/5qkMoG1tNjjFLAgY7lWyj
	5+jdpDwnefN/k2jXHtww6uMEorP6F2aB55DtL9qyLQ6kvHoAkQMnjLEl7rMD6YHrqnCcCKAFldw
	ePjKN8a+/iMKw5rE7YfAGdaBdVc3yZ7HQ2INIVmQsBUJNOIG4Eeq8KpdaVXwb1MkAc=
X-Received: by 2002:a17:903:1246:b0:2bf:1e37:a2ff with SMTP id d9443c01a7336-2c71895901dmr44555855ad.0.1781880407608;
        Fri, 19 Jun 2026 07:46:47 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720899fe5sm27163595ad.16.2026.06.19.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:46:47 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v14 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Fri, 19 Jun 2026 20:15:55 +0530
Message-Id: <20260619144558.1868995-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
References: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..857e5c6d97fc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator(SPAcc) Crypto Engine
+
+maintainers:
+  - Ruud Derwig <Ruud.Derwig@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc), which is a
+  semiconductor IP designed to accelerate cryptographic operations,
+  such as encryption, decryption, and hashing.
+
+  In this configuration, the SPAcc IP is instantiated within the Synopsys
+  NSIMOSCI virtual SoC platform, a SystemC simulation environment used for
+  software development and testing. The device is accessed as a memory-mapped
+  peripheral and generates interrupts to the ARC interrupt controller.
+
+properties:
+  compatible:
+    items:
+      - const: snps,nsimosci-hs-spacc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
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
+    crypto@40000000 {
+        compatible = "snps,nsimosci-hs-spacc";
+        reg = <0x40000000 0x3ffff>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

