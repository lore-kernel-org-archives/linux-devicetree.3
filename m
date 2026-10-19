Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427132;
	b=TVPH6qJRDrZRATkXGXap7lrAXXaWjeOme8wYf1Y9jnatiYGueO04nXCWKAx7uC15wxPz
	 0xX2ud2rrCDNdOYiHpnGSGOoy/wozhL7z/p9/bdiH8pn5ZoPEMJ1FJde59pba2Ls0jZEn
	 ak5iUN2L7hyCgn0IbmYsLVPZTv513fdI9UOkw5p6JE/62B+JLuusbnsCY2qUM/5oPkmzE
	 RztpAsnTofzuqfpxJqu8NDA1gbSo2egACSsfzRpcQpzEktCUa1CaiicpbxzfHf7gOn4Rp
	 qaQXsSdjnSNxf9IxpeNnuLw5eZfRfVmal7haq8PiFaeJaZI0FA1PF2NmFcZTVyNmChw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=hmTrljMTQbqxcWRPDGBwtd1KC+ccGgGk1uVCMQaRWhh7hLvv0/ZC0WAcRW9UuZVleHsv
	 r7R3wpiaDKYyqbI/p+6rpEKEkZTvGJGtH+L90IXCKPG8NwE31mlN+FCJ5R0gA7tNtDwc0
	 GVE95ev+uFcqbkVxEwyiv8E6P97CoquAxxpn27DB4+In0e1FDCqyobQBFOfIgvrhxcYxS
	 W06GJG8wCBIKLnXdr9eMtzKjn83frO5QdLnMSJ97k3u6gBfWi6pNkDTrmMEZqGi7mAPaf
	 eGUWEagxIsZDjVoJxC+CCy0eGX/Ubtz3hFPzLPtEPhhDxhW0YLmpl+sWhN982Tbg1MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=dGv9qhFk;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B772B606A335
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B772B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=dGv9qhFk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so2747135eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1792427131; x=1793031931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=dGv9qhFkilxL93XAvfjT6XnAjwozvu2TkGSBtYbO8asDblaqAKYJyZvPZgRNfHusoc
         uXdg/5cpOIn3JtK/S9z5jhqYBvYBkQHf8N36WWqkTu+dcXTwyCkZbNH7kh8ehv+N7hxk
         YkHq8uxVL426exJfkSGhWZJJPFNwuCc0n0HVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427131; x=1793031931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=ZFDcnmFyYm+2ITEJ8sWjgKVTOVaun9GnZ25IKIKaCJAyV0ie9IjhDwLka65mI91aG1
         Z/zyQCmEevy6/fjDfNO/rxCnZZSt3quWW3Iiriyam19raNdyJ/EkaozJokUjPhcVUepr
         BWWOBFyx0pJf4tRhEwAj82k1GcZ7PT6PwwqwxTIhDDnAGcnMN5rXMxvtQWs87ro9xxeH
         WmANkEHPlfOLtfs8FWt+7pY1an1+IfqCFtjOXI1BHJitgTZl/uoelhBgShO4n7s8HxYV
         a3Gv3LoBwUzwBdJ5rLHVBBvffpSDTipSj5po6ZCe8pWNqzVVGAInD3g4WmCm6wlJRBWq
         9X8g==
X-Forwarded-Encrypted: i=1; AKwUvByTaepaC4uUMF1wLTerA8Hw1YwdGLhNUBxAJWgSr4fp+5/IGoN7voW3edQXOhAN4c0htwrr2REdGkUJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKM91mA72S0yurBAUX6thY7YUDYDwKOqG48CGSFQXaJIIC+br7G
	7nxAjpnHN20cuAeds7JMQ2UWXYhIr8XMLKsa6YI7/3IZY2TxFNN54b5dQOWdKQpL1u0=
X-Gm-Gg: AYBFou3A2E6VQrmDnLwtKbBDDDSpmaDYTHrbeCIpgG5TpRMtkipryyVbNXdcFf19yjJ
	LU0b3xVKt7DCpHTTWFKPKnO8DwzmYOM/uf/TpawX2GWS5Te1WJU6Yw5+J7bDZMHwe/7VOvSVqDv
	mU3KV4WXYwu2OvorXevXHtYMmPlHQ3jDHwvsWrBZ5MpX2N2TyMwSEOdejAzQWnbQ0Lyk8oGCmdJ
	Kr+vfCkyps2wWUOjz6rC3z3ZtBKi4uPcdJ82DUPeIkDWylB02paxbqFFnD3icVM+jfCAhfB/7Ar
	7iDYy5Vwnbwfnc/sqjmvgDAmbdHGgpgDpgJ9VBqMtlp/7t1tBj/2zdnds7hsA/hhQGD76YMg/9g
	ryCOc2S8Gu5LVVsytjMhi6Qxb54Nh1lQ+g2fVAETBkzqBeRDxg/lbWBzNEDPADU5KMkmGJ38Tme
	hEQaETHB3+lgjUTdM/WFpJwabpr6dy0a6cyaTstM3i9y8zbl0szLHH7BOTfsTQ/b+hfBu9kz0P6
	HqH/gmprGqagjmIXjN8dFbOVLlbCjreChEW/P88wGsYRY4PJFW8Y3ioqZAZx7pgYRxEpkoQFf7N
	n9CNxabjT+L9k3SWlmoqsXLezCjSVU7rfI8EQw==
X-Received: by 2002:a05:693c:20d2:10b0:35e:1807:cedf with SMTP id 5a478bee46e88-3619ed0fbc7mr12378533eec.1.1792427130572;
        Mon, 19 Oct 2026 09:25:30 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm32218885eec.11.2026.10.19.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:25:30 -0700 (PDT)
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
Subject: [PATCH v26 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Mon, 19 Oct 2026 21:54:54 +0530
Message-Id: <20261019162457.1000115-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
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

