Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983735;
	b=Ezc+RKv83Y3aElw+wDLTQ6W1Y8aJ7u+QB7WoFuxczX1JD3ziWnO86PQgus91OUkFWVTL
	 nr6HOxUN1KSknlhF7Sbl9pbQ/aMNtj78GDYtnXb+y7i5lQOZJ3IcPSiwY3+11XS1SH4KT
	 lp9WLhVGby2NMoSAwvUSOQSQXlKpLHNSrmixqLQv7nBlKZotj2Mx8IpW8xwH/Vm40J6o/
	 /h+7c0TDwg71TbCt+zaHIYAPBmwN8Wh/aSeU2B07JCOIjdhANuaISAopG7sFdcnHhEmbW
	 x7NG8fbMZIgjAfVE5FkJFZETbh7VKh0X4g/XoW4N5kymruAgPAfkBR7ccaYGh/Th8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=q0yMzqd6xDPKCKITYd0G3rolwhUI+x4BiQKekCyEzvex5i9Go3gH7K8c9hGiHpyh9KU8
	 QdKggaw5B2+D6+wNFBfR6Zq8I1fvNru8c7tcQNMz7+Fjo6MxczP4eDk6AApgRvGRKzUMB
	 yvaL+6DMjFqKe0dgssmDt0utlz9PGEjWZC1fCUTVtJ/g1do8/6HsjTjHVENGcTLr+D7hq
	 6dHcG4uvXorvNI2qptCjb5WlnXLER4dHwS+3pBLbn2z5QF5X5nJbvtnyuDcprGeQW1HDc
	 2IDFopMDK6eQtiYX2f5eyKXlzyV1NhSuRIP/2EhV9ACOdm5aSW7wEEqVB6Bi+hSjFKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=cbVxVLK8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BEE606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BEE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=cbVxVLK8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so475838eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794983733; x=1795588533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=cbVxVLK80ofnnYEOxZ8RmtFCY4qt4CXvWAOGAaSEpjuOsiyOyTnx8kv+BIgRavweLd
         cactbbmutvrZIFMvov9jraLIR4+oTSOQf3hOznKDaE0DjqXVY8Y/7sOSMTtdMRgoSY+n
         9QckQ9IexFYvPhNuCdk8W8csBzH1KPr2hrU6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983733; x=1795588533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=b9YGeEMhCagiYDp7IUi53LHKzI6hlC4zCV1ybWCrAm2PrhQ1ybJxyfLJrYMlolw9B4
         KpZ/n8bORnCokGL8K3NxlbjTPuFAjpqvvey0X1sexqydS2DNMgiUxz1gewzeRLZsJGmE
         8Ha1d07KWJcwL/TcCyeW0KFr7e52hCfTIhfi5mlVmb5nmbUBb/qbcphyZprJVRzNG1qz
         O0fksMOBVxJH12x7dXwIkkQR7eK9WnXX6PCfBbEpg0xmD1kQTGiypDtkomIaiMnnfAHz
         GseA2shbHAp9VwI8Fb84jCDIG761DfZqjNOMAh+5PiCdrqX6ypuE2gKUY6ZdOiYCQSA5
         AKzQ==
X-Forwarded-Encrypted: i=1; AL+hErHF+m7vPv1h0q46Qq59d2WyQ8eLzXg5xvtD2Wgod7JYcKSYpN4PvpEGtDw1QkhvhJ06moRMRGPcl4yr@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkcbV2qw67Sz0glyCRzHRHPdovUtb0EzWsnp/5imrafKaqYK5
	aMJyAYokI7EprGSg57V/wy8AToGuVRTeTDmRNbe2VOhfWqIS5LaoyPXkLy/gl8+b8XY=
X-Gm-Gg: AZFdTZeQO8GA4WoxndJFL0AUiWABs2uJl234BqWewHAbgKTW0hqqYiYN20ixeu2Udr8
	tBtEBeiBw2sVfK57NbEJmm5UPdussQBvKaCMkjs4ZD/JxCgGnP1JBTgAfXWOJUjZCYwIL0pkOAF
	T1sxd4Ji1IgfqiGXo0z/pnZWijduwOFPDPJ6TfxzIfVW97cfV2J3iDUJMOsUNxnF4HD225wUTg+
	0Ti81lpdyNJIfb8p1G6xSIVf0remsOM2CyJOnmxSHonnuF9rNZcX08LKh79fykVa5pvQhaRzfuf
	ZxwtH7O76+G4bE8P1kBDnJx9yVpgxR2dbfzwZA5QqsahmKqIsOKuNGaEJKtyEjQHb4KShkE+6Bn
	I1mWuXkkkSR3NbZeuImdUdsX705J4j9fXdkIysV1bWyLsA5q0lpgHVrCLNA2+aN1VW++tOJK8tc
	72QjIO7BGbnu3NYug0BgEG5s68mFZO/zmVuSgTalYcwD3YRP09RlIlWeqGrh/w97Db+NlLApRXI
	WJenbqp2g2uzot2IGl8jVI+Xc2e4MvN4JbvUcvqMuIJDAFujAQ3dNAE6nvepKwd4bOELE74AC4n
	7c1fvme6ukmO7hZQy1R5DnwatAiFR5Kk1FpXr2JbrvkHPuqyECcuRwYkbgJDRljb0SyvzZZrQw1
	kGPWwduKApFSRpmk8vmWwhN4zxP9I8uqdKl8zxYh07jg6IgBeCxF+INUCbYvWXnFPXTwC
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr6808685eec.7.1794983733360;
        Tue, 17 Nov 2026 22:35:33 -0800 (PST)
Received: from localhost.localdomain ([103.219.60.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm5002338eec.18.2026.11.17.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:33 -0800 (PST)
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
Subject: [PATCH v30 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed, 18 Nov 2026 12:05:01 +0530
Message-Id: <20261118063504.835259-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
References: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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

