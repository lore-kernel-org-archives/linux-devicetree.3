Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8396750EC14
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796791; cv=none; b=RYmXFRdM/bUp3QzYgVZEse2FFA1dAQ6cmscvd8zWsfUL5VLoOrHBFi5kAx1dU9jG4eGhcejjmKl+tKpT+8HtJhE6Yp73v1r5h3xWn1mLSYmBtP/AQponljahDezl4bhO+px7vPBLqhIljkmyiqKQkJx4ufsdIYrsDwc9XpM5Rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796791; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YotFtWbCfeHGHJ7izGv2Z3uHiE5b+cS0Fj+nbFbL5S3H/XKt/50hvfz/YCPv0WBOa9hxmwJf8hSaB9ie4wuzzoYFG0psUys6RnQGxULOFbabHi+UtxpJF2thm1PKrHnVMaitqRqNKnd9C+mgHwa/cvCcUb76yhecWY4V2DmvXGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=fUxyUEc0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="fUxyUEc0"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2625519a12.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1788796787; x=1789401587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=fUxyUEc01BXFtmTy/ckGKDEEOi/5XZp+l3Qn0T9V/f4bMOEwuVHk1y2izjuNlTmwHi
         nmXq8sjtFYVugcJrQrDzjysRVuJdjUlp/BZ3faf9/C5M2vQKw11YM82enROjCiGABOhN
         9q3SW7KTKz2E+uFCm0XMCA53euMAuKJ+RzDxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796787; x=1789401587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=gZg5Otu34GzNVQ/+NCo7w4nOkX21JzezNsqsW9WGmFJN6t50yT34T37XfuIWZiYy0/
         p0dJOVSzBnSSuPBYjiG3s3qTzkyWnDu6YDw0kVDQdD/kDdLqdzVjcOSo00x0bguBQ4ed
         ZwtPPJwvP3P0o5Unh+PfDxn6uftldTPmRnSfKdCpDvoVpF+v4FOIIpJuQ5bSD6yaoBoV
         WLLys2a4nRQZLNn5H076P9CyzG1Yu9YhqSprEC4W3OqQnctY+c0lVH1uGQZmPl8viB8W
         1iyr1uvQH5qM2v44nD14y57KM0u44rPx24s/la78+DOnZ5zYhXP5ZkZDKnLHPvQ6ZRXj
         6HGg==
X-Forwarded-Encrypted: i=1; AKwUvBzg8YA8qSoHZhrcCtaqAcK6yjyQktoHcfOKEY/Fv+pSvBqHL3O8+I40RaF5h52llXVRacHEq+i2NGYF@vger.kernel.org
X-Gm-Message-State: AFuF++nonmZ1+No7oM5h1dCFTjHkR30U0VQg/p+xM56uYC2Rqji17DeU
	pzscpddsr05sQE6W/Cl1ajbyxXlCik9NmwZKx/2ULOVBjOqGPbvoPTWJRisFBkUFYeg=
X-Gm-Gg: AYBFou3RBSi0GBucCyYyeN8pe/BTySsurkJpgMSZ9LF+uXlCTpfL4ZHV9joN2T/9Pgg
	ElqU/1b6b7NKYoS1YLEXdZYrbK8XTXSRpk3dAcMzs0VdQGjRPmsZu1yRMVw/H8R8VQrsQapxeHS
	MraBVsYCKnJZoy+to1dXpm1prOhIn8x8Lb83Q/rFWIr6GAHWtSrF1VsOHaBrsp3k2PM7Wnl4tkX
	izuzMya0uXAxAftSQvPrkE5RXt6HssNbULON7j7iqnU5TKJIyKlvb/WEBRXAcC9WHEwtF/OBmZk
	tU001KAYfD4J88Znx2a3iGnsMty17MxiroXWBXbMhjv00xE1WPMLjqtUuZcAvvs1GkjQxS0Bibd
	J4tBuq03Nwr1s1E1osIcTGAXixjLvWNzX2bIM1fjsWiV4k1KPlSchvso1j/5/NXhm/t/t1ORjC2
	qDfn7fInjsoWlEcyzeG8artylagHWJjc3Xjc35r94nKq/D+tcBGcXlgVMSJtEHkwR8ILZwVJYbG
	zg5bzffyUFa+Oyb8makeeLcGx8Q233m2lvd2TleNyaRySj95eSbBuYwxDRaRS0L4YEpUTxXP7JD
	p39gxF+Kevlm968eDmac0oUjTxPS
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr38980585a91.12.1788796786651;
        Mon, 07 Sep 2026 08:59:46 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm46065613eec.16.2026.09.07.08.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:59:46 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v25 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Mon,  7 Sep 2026 21:29:13 +0530
Message-Id: <20260907155916.999153-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
References: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
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
index 0000000000000..a337f7b473cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator (SPAcc) Crypto Engine
+
+maintainers:
+  - Ross Bannerman <rbannerm@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc) is a
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
+        reg = <0x40000000 0x40000>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

