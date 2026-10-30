Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381168;
	b=QXSEp3vlMRqkTdKmvk8zImdqoudZIUvjbwKOmfdb9J4cizk9a7/P9aXyMTO2UPzfzzWy
	 1WWhZTHg3C2Wn0KdnHZL8EgvXpH8F5nQGIu5EtVi78la+OtqgX64oaiOl7wNrVyd1Xadc
	 SPuo+xC3j1+u0AUrEJuQ1pR/ZGzTPSJSwcyOBpfgGz0IXFYXOzFj83p3x04o/3+rlqSGz
	 mm8SdHoiAIhnvZ+UNzeN+FEtrJV3ox3jWOOO0exSIMFVX8qXytXyZ7lek6w5U6MvvUbHo
	 yLbb1WOdsHBL1GSn9QfMJta1sIAWmQjbg80Oo0WUQqAFm/4fDvy3I8Ow5i6SaiMxCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=aPvahNXk4FOK2c8Ng8Qj3MNpS9SwQKyd2HW5OL3Pt5LtlSf//KKzEOJNfY9geCNqrnub
	 VXmZxO683sPZdmW5W4TmwFtAQNyHTH1LbQPfWvziXL5X5IxOHt/4gZuKCkBRTcn4k/Nm+
	 m932XLlp/zqDYcwSqWgV38lZfXci+W9PsxxXRl4bI8lxhKj2ncpPAircWS/ifZPEHUTK5
	 p/B/Et8+govkK4p0f34BVmKuXYOBwB2fNeZZfNNkhRSGjQKXsD0gXq4tL2lgGVkHFK6jd
	 ZeBno7VGKPucC3NbJd6VUpEPAmkbi2MZePJAnjyK+/wY+7NObnOScX8gQxO4tw2yGlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=RDrve0kD;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E322606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E322606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=RDrve0kD
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso1530452eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1793381167; x=1793985967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=RDrve0kDSFOB88oNjlZWHltoE1NtVglhxEUK1bTd05cIdtrx0kOExT68SonxAm1dHd
         /Zywur+Zp1oyY6nNdKGag2Ddui4xQroPQ16FOYSDb+0szg502CCa2vyaC/Je0dgYBZs4
         NYRuCEKftml3xiOArK1TNpYHfWSOJVb8HAlm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381167; x=1793985967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=wxlxM008tl34Jl1A0TWifmDywIO7VWBS+okWmqzEtL+4S5I4zFHO1ysj3tp9qn8m50
         43O/fCkkGsvie/ySZHmMnKkjIaWZuitvugthrIjqOIewWQ+t4Res9epFMckUCz5E/lMQ
         MKKJDISP+DhaqJSdjvVVgkILvki3/8UpdqmUqcWfcFFZ+ceUAnRhSgfYzQNaJeI98i5q
         hYfXlxZq6jiZLtbv6rNHirBAPEdj0B3hkxxtSEtB23lKrELBxwDTv9ea3hqjFXelVq2w
         c8Sra1jUHuZPFAfM1IIJ26M1fSe25R+qoSOiM+K9sAuxjnkBpi5RW+5BSrhZCZZ9/lPP
         WD/g==
X-Forwarded-Encrypted: i=1; AKwUvBzpqBqtXQwzdO72YPfpMHhVvwPbQsenuv/qtzFhAc6rbpC8SKK8DGM4dOgfhNUcxsqMN4bwRNEWNuU2@vger.kernel.org
X-Gm-Message-State: AFq9FYIOW9ftD3OzbOBp7VU/mJF9qS7Qqn3ITtmTx0DMEKlGV9hQSyT0
	Y3ysrOQdD66gc7WisIq9hPkOONrBSuF7Ru3pht8EYalJME+jmpuQzjOJDaSCY42qPhDKrkAkvMg
	97FaV
X-Gm-Gg: AYBFou0izXPDVRsqy2ImhYViuhvcqR326du5XnSjZoMvav2hX8qUoCFkbI0iRs1uv9R
	YbJm5/q0UxkafwUxKbzGAyYdjiNCL4exGD6/ysLXLBLwaB7isSMi4ePKTGrl9ph9/xVcvHCDz3A
	3k3F9B20YNZYSooeY9/RCtICnzQ8NVeO6V0yF6H3KbMcNOCYSRVGZRB2yt7DsoiLQLqL3S29Ng6
	oI7mPJ3IG5DozTWE/jeRYIJTsw75oWbCtzz0NTNNoXbjVVHIQvOQJV2uGj8wd+wyw6Yt0ElFsuJ
	qNOcCdynaT9wdlWyix6Oxx5YJrQel1WGIsyjfaJdIfiXrdcRlAzFmEiR0cBx8tOpJt4ta5Q52pl
	fGRD8EaZrK7iLHM7OQj92Xr5UL7/+0i5BN27utkMDa9gZxxAuA4glLkZPDfTfSroZvzWpOvpsDk
	cUHlGZ4yP5Lv4zU0YVvfMKFDFk5fFHzWf2LoWgiJeIrHXpUssObiGNeNP4eZbiCTziIA65WmSC6
	fN64Ld2xuGvDW9lqSAlH8el3yxX+Y+yoDFuSTYVdBovuCKEhlbszvHCW8QHmV1q8Mtk8ymxNRE/
	wPOldz2Jt1hDjzfCPKykb/ayVUdcqaAUDt2GZwZYPjEciAjanRFWoDOUbTId/wh5VBAPVl2/jVd
	Afar05uWDdMalmJcQ7dsLabBswR36T6jL8+WrqvjcF8haVle5W+JnqYsRN8ayNHidgsgM
X-Received: by 2002:a05:7300:3aaa:b0:369:21a:dce0 with SMTP id 5a478bee46e88-36a42345883mr4194608eec.6.1793381167415;
        Fri, 30 Oct 2026 10:26:07 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm7641152eec.10.2026.10.30.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:26:06 -0700 (PDT)
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
Subject: [PATCH v27 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Fri, 30 Oct 2026 22:54:53 +0530
Message-Id: <20261030172456.274744-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
References: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
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

