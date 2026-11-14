Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662814;
	b=TixOOl9qX6h/CakNEkcMlkCdu271dsiBQ0DQDmt9VNJl6nLg3NhOOLvVV3nf3KkQrCHW
	 I3GrGeMw1pRO7MYUnyRO0B11uafGkYQXRYZx/sjqaoelpsQdJfuDoJaWs5bt0iK+FLPAW
	 SILIjBWjCuKlx8fkNeFp9FeBpS8T/qJm3uUOSA2yLLY0KTyofrSMt6k45RSqqsjVNaZ24
	 ZAMWld2C1eCRCUQP8tYIZi1p+ghMg6dib5kpaLNLi2jMnXhyJlYrNdpFpf/PqXRotx+4Q
	 st2bQoPQa8IBaLiV+g1uBiuJxkBCOAlToJCFtcvtcJHGutjcKLoVz8CY5LBgN2BYPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=SILC4vCFJYXh73BALvQaY7dm0PR2WYioB6UXkWn6xTT6ik616sDQQieSElMusdLnHI3r
	 GRX3qva3Xu+8P7ugEoWKzbQ1aN8SmXFqi0ZNkZ5GbiZ13+ePzUwlTBs2gjY0ElYyecUrX
	 AJ7ZeX4A3Tq5hT6fqsZCnv0M89y+l9UWQ9vPLfuPCArejOudy6rk6+umZW4MC9fAjsBl0
	 ACnNec5ip143KNxjMlGkc8Rxg9owRrmcVdB2MmbFECP7RnMsiSt4GkldqzNu+y9t990dW
	 6wkAItxSWpd+FW6pOCReEDU4qrRSYq063idY22agG4yhWelKL/H/ITC3zemgUEbys2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=HBgH1sjv;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B6606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341B6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=HBgH1sjv
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so2604419c88.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794662812; x=1795267612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=HBgH1sjvlslaIb6CvKtHf4HH6uELxQ8+z9yzXhw44KDCXs8z/Pm3CdGt2tXKYKRBde
         4OE79M6iyaW0kjR8tuOp+GtEIPyeX+hUI4GUmlW4vEBKhDHTPB9ERIe5R3E24huRNs6D
         WKgqwMvjRsxgQ1pIdu4H5h/KQ6gxalQCq1B1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662812; x=1795267612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=rZnx+gSf08x662HlV3prrjgWMw9wp46HzJWP4bffsjxudp+VQog9yaXWQgA6iQgdBo
         Y41jRS7mMwKNECdKa7rO0gXt1buAgOZgr+lgwIbSK3JzkofnCqlx0vGN+cGtKyerg8d8
         JmMEGErkrheRsoKJkKPa0OKcxpNb7ntd6NRD9+slZFWlu5lto+OIVLv5jLSKfMfoC+js
         zzMowSlgkFi+7NakQcORPKPWI/PUuO+5fOe98WNT5efPoif+yfonwHdSWdcRp6TBBjnS
         tt4Lwkvl/LBwsbJUnfVI702sKDbTU8Gu01Aw0FuzqKwCbiq8bH2R+r4MbY2rBkVZehrh
         LyNw==
X-Forwarded-Encrypted: i=1; AL+hErFwAwZ04qIZl0bnV6QjSWyh6R5NEvwuSboq5eZNASZ5t7Ehu7LbuGcdJUoEOHWsetvi2xUA7Kmqgxfk@vger.kernel.org
X-Gm-Message-State: APuU4Z/n9ApJaMeNjrF+rwEMvIdDa7IENOCLDXPHdqLincTJJ2hx4Cln
	azFRZJl6TRfdUklus8lJv2si124C5pz1rL9QGfBcRURRIyYLC0Vfkyo5+Kx63HOfwR4=
X-Gm-Gg: AYBFou00XCo+EjM7gBMiXN6mQFvUa8Cug/1VjdU3bg2h4C45ld8xOGyARyzRbiUrpnP
	UaU4JbeC/jTwamKCicNhsb2u3aEOU29Asx06WliUakR7np8grs2TZUnF0cZCLxYyFXc548CCTQ0
	M9bkaQVKL78TA8bhdHotIaQwbL5Z/QK0dcVQtPs3zXrBziUk1PRKPsbDLe/sLmZhUT8eEVj1JJy
	KZ/C2fWr1cPfxbBXwCMU5q3Hq1+TFOdD2l5mkeaAIRjFr4q+nLXSiTFvdriLamEh4hHL49d/bAO
	osEKEFwdBt8+kyVYKl02tL2c8SmwqacZQZDdXyhEIZ2/3ZQuqO5uJqPcHCdARdGgRPtKks3sxpS
	nPGk6hWwzGMJyqMT/qzjmCuAaRtwBexM3sUH/Dq+DRJicSIBG8045QWRTzEQ6LsbRV+Me6IapEf
	UzIlMvcp5EI78Lp+kKiiof3w3R/y4U5FDGtxlBDcVW8DLcnqynoZNYTsTb3vSL0OyHio8qxEyZz
	VSzGcMsfprytPtvAVtN3oflTmt28gAGFhA6ysqXhQkiuAUcyCzRcDGGZGWs3Zs9y5nGwi2gs9p7
	8eDQcf8Ec+DVMzpimxfY0JULrX+82EFpg4GGx4misd+kyfR3J14ughFsr2By0/Zsnhud+09aBm7
	uRWt/DyoFBJJFJgbPb0QKopt5L9Ma8DPc6clnMfu8DXhTYsaqy8TqEzBiHBcjKfGiwnKziIaEFj
	7s14x8Bfmwt+9VAA==
X-Received: by 2002:a05:701b:2096:20b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5031007c1mr5430086c88.40.1794662812150;
        Sat, 14 Nov 2026 05:26:52 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15712003c88.12.2026.11.14.05.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:26:51 -0800 (PST)
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
Subject: [PATCH v28 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Sat, 14 Nov 2026 18:56:19 +0530
Message-Id: <20261114132622.690129-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
References: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
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

