Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33214492182
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909122; cv=none; b=gXaDh44/CzRJkQOvyZS0TqiSw2gEA4NSTUk/uPYIL+x3gQRcMfaAr30FvydxW4CVlnzCGQj13ihvZdhGekRRypg0WUKh91QzWaKGo/o0PiQ9qjhXZROff2xmc6rONZ6etthh2psasLuq5n8YXzdgvphuBTQvDIQhUylHqMGpaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909122; c=relaxed/simple;
	bh=CuUxgflABv2d2hkWxKx7KtJacYxGlz4PuMBKL3Eva7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZK+VXUPbd2GwsNQkpIssuFNSIxbhIRhpvjwUKFBXNI0GyddjTc6G6imINycAUprvIfQhtR9lVQnIjJwvQvv2f6H8T6odJX/QbscvLjcOj9ZxmKPUL+D14pdnjUX666p6ey1BJL2Trql30q5KgG7S9G9bgTtGrutvTjCUj9KJA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=II6qKByX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="II6qKByX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30e9eefa268so1133082eec.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1782909120; x=1783513920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wAwwi5LpmrlOVfv+9UYg3mDAono2kNVvtVhtpInmY0=;
        b=II6qKByXyGa6AcUnYLmaFhSHhxpvcdpJK0F5c4EtdN9gIN2i6m1j90WgTdy9k3njtM
         QfPT4PVZ6d0dfvGz8WxL5VHbINYBuD3Z8Tsy3eQBbh4A4PpQHOA1FvfLtEtutk4B/XSC
         OJB+A2RlAATJNVlIVxZlOBE2K3RZsG77T3Nik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909120; x=1783513920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wAwwi5LpmrlOVfv+9UYg3mDAono2kNVvtVhtpInmY0=;
        b=OQ3SxSPtvabGtM8qzVCEQTo+rU0WGwT8WFv+cxd+iry76PGRDaL64mKuGwQiSTF2ZU
         YitVf9me8FIGI99cEB/O6PanAMFtZecbIv07K422ACMlrASaewdo0lcGScpK4nuLfkEb
         GgI++nYDRRw8OIA+Sa2+9mn+FgRhEQeeYUIR9bD3DJgnOFL7Z1nh0nT+CQbU7XYqONMK
         3AVEcpcM+rFt7PPh4GIbefrME9359LaK62AxZjwedLa1ueh2nb+IH6Xn4tLaqF5D/Ruf
         4gngBT7NMIWiWxLxri4X9u4MKy2EXaGRPxuJTu0z5Ch4a1xkt7pSPV/SrWEOdPGPDEHH
         Uxyw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Ic+cGBg1V4923e5cSSy/8Yvg/hn8z+R/FR8O0oMyPR6YBg+4dGt/H2aSRtzpRAu0jRHOQ9YDutG2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBH90+/987UdtvzSS7C7t6akOTao3zcfbMj9KenUlcuXMyJV2K
	MROJMpVzpip6rPHvw5uaJUL6bMTMnJ2in81Afj/CVB46MoMOj1N2uJ4Qrw8NXgPArK0=
X-Gm-Gg: AfdE7ckRUkmBZjN0VD/VnV5WgixFLJ7Dd9U9lv/gWGBf60pnQALFUC9FYLSMvKgVH15
	vRT13J16hxvi8POfwOBom663q8aqIvwxt1ARJCVjZqOTJYFYSsw+VkbX4snsdwsPY3vt9oAAWKz
	Lm2J2MGPo7InOBQ8qMrelARZ48z1Hpx6erGdFOj/kKwhLtmT382g+HRKLylr9zO6RWddf64KQzd
	mzn3tu5pHahJ86vVkut7VKHvkr31zI8l2judZsjWDQL9RQ453qy2NOzyDlsXJYsGEOTIVLzzHji
	VZ25FYSm0+p0MKPIXZoZ2yOLJ1LQiGDX0h3GbF0JIurBwo4rg5L5ofhfWtAKvkhCiWZioRk/rNV
	5EOfYOurOXjwhkqtOGDT5sigzqmsMntOhl50Kqhb2ieQGNwvOk1s0Fy7b1FWkjfXgijRwjA6giY
	8WbqI1Hm3Q+52oBo2gotK+DG8wEECkTqUh9o7EiJ585W12TSvctCrnyzMiTmOmpet1CZuhrdW47
	KzZaJ2LMCJa9PoFOMT/zyYfW/fIO9FqOZ1f0D8LNzUp/nEbyJ83tBNY1zOlxyQcg+8=
X-Received: by 2002:a05:7300:a506:b0:30c:ab4d:da36 with SMTP id 5a478bee46e88-30eff335a13mr1728964eec.40.1782909120326;
        Wed, 01 Jul 2026 05:32:00 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm40776402eec.0.2026.07.01.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:31:59 -0700 (PDT)
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
Subject: [PATCH v15 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed,  1 Jul 2026 17:59:38 +0530
Message-Id: <20260701122941.2149121-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701122941.2149121-1-pavitrakumarm@vayavyalabs.com>
References: <20260701122941.2149121-1-pavitrakumarm@vayavyalabs.com>
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
+  - Ross Bannerman <rbannerm@synopsys.com>
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

