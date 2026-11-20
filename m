Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180488;
	b=n02VnJxyD45nQDWX61i2BzsN0RrWf+QgYhKb6STPPADW99SjaWUA3UkKQt2Osud9jAhI
	 AzUcOaiHJ2C9fHK2e55jdgz+FqXSizONiTEBBSjgMSTZOhGA7LXQcpGEBg4opZAS0DMsM
	 pi4J43rgPBPp5quF6Pzz74SFsllc/lkIoaFQaMSRfViFmfcdnzQn0SqKx7RkzwdwyGJbJ
	 gxn0pUU04lLPK9CrKC347znxRCz6Lm569VhBOz/03+FDb5hh/1u31o8fC0TDYxjYWKLXZ
	 YRtyIwOhIvIJ/UYzeizgf6dZQSOKqL1vS3ibTRwffaLdrEw4uE5wCGxDOGhW9WfwI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=YSkDqzm/Wb4tm8oCLkoVGL+BKNNbEG4Vdf3bvixo3fTA66vWh437zgzL/JUAs3y+fF66
	 qyorNt9OJEW4uZZ5LH7C27uMYCw1WcNmWnfWLV/+aQZvIcnEWyR/QeaKTsImoOgTYhrzI
	 +l1qqNbcfOZWCL60ZQSSGLYiU1yxQ89++MhjSYUoeT9c4z9tfZxyXG3rPKSlMJ6MmGc+1
	 eJIvZoVRvZoenOMxFA7zSw+s0veySrW2wXW7oz4PGEoCTJC5XuWVlKwECEQgRwL5/4ThX
	 yv4va6ESDpOtAjW2D990aSfmwnvw+QNUUi2It8MWSjsJZnYP9qVG5YPxKdwSSphHE+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=QQ6FNR7K;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91A606A336
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D91A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=QQ6FNR7K
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382c3c9671fso1200016eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180486; x=1795785286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=QQ6FNR7KDX2plbGuPnWqev3VN8S8pMCEsElxebt2M0UElMBOrvh9bkeG19vovWcPQW
         kSY0d7Ry41DaizxZkLHqLB5CaplCz441PRuFw51ZEb+UcD3wfnCa35IqaRO0zgaq1EGS
         Ql8BgdZIMHvUAph9x9MeiXOpYVTccURJTzzyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180486; x=1795785286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=n1dcWZcEwiM/6qrfHeFmCJb3GECEhhdix2zfMzme339jHkUTyTKeqHPJOz0nXe2a+F
         0wlBPVUGeSJRE1vr6q9VB4EyBiSjQx/JFLxlo6izGzOMlOrbqycjpLiT9J29IkfCViVU
         xW3xbVkGlkvj1M6pwqW62tEsy87s1WScFFWhjsrONzwdwe5uAc26m5tH2e+6L1ay4aDS
         zv7iDnvY4rBmVe9YT8/WaDxBccd+IUZTNR5WgeTAD5JEODHf1iau4XeDEmcRCbFmAaGL
         yWrZZkfJ4iXC2PAuC6Hwpij62ISBssvFXTKWwghzgZt01atwEB4fyG/DjpxYz4ykItJA
         +LTw==
X-Forwarded-Encrypted: i=1; AL+hErFGmEX+pC6NWPyXL/0HQ4Ud17L64YCTOMSooGf4VpWJKlBXo0kOTLwU5s2kArS3KY1ZV6S9/nR9DcxU@vger.kernel.org
X-Gm-Message-State: APuU4Z/eKXdhp705QNrOn3OmtvdLE5vhAT31hjFUsyz2MmO/g0onkmPO
	oeKJ2oE66eyTwi2Pvm/V6VceYXLeqYRP+lCsW0W3B6v8l8vHR1d2uF/318ACf9MtKoc=
X-Gm-Gg: AZFdTZdxZ0GjKqZGVurOZfjGQ2yB7f7n+H/JVrKzoyrC/q7Furxo+5QRNANJ1GXPp1V
	CE8Zk31RE7ZqjB80bIgbj10XCgAves5m2zWdsqoxVWmqIAHZjc5gViPhhi1Wj2pB+NotqM1fu6K
	YW6PegxwgR2RikAxF7S269DZzpvPuWcoxKabnKPMqQDrw5uX5AB0e1fl+b+U9D2qggQBrqzHdg/
	Kf3L89N5yE8/RAwWZgOmAPHdWK6ZDVjfplhNG5imZTBdrtLf4RmEDrpLrkWv+QEI41WnTCEetjW
	ntQ+O790wgNyLAdj8HOWETEtf6tb8Ct75NwTD2p9WWIbyJdIGRg2d6C6MsRQT8vQd/rYyucfJve
	LEZvlIPjHw3nPscb6hPwMwbdefX5A3GrouxI2TC8VAOyc5HrZYMdUSegmnsUQwWmuGLPDh2GO2s
	MlyCL4c17WqcumwH/8C3nKVZyCImCo0GCiaU8RnwdtnhxdMlqRWo341DAWSWIPQQvkhz45fd30u
	c2sJSPVXmTEWJt40CDeBS0GIbB6+L5Ht2VshLQswBbF0GAO4YV5Rr5ToYW6uaOHp0k1YthE71o9
	qj/2feeVPaCxIch1h9FCT7QfWMwHcTBrEhvm8JTPES/CoQw1LJq42EIFU151pXGgwUkIU+Gxmeq
	wga1EFk27Cv4gh0mwD0gdfE6K6pgR97UdGqQdQA4xRG7PCl3RJuVHeLxSzE1YuaFJ0UuI
X-Received: by 2002:a05:693c:88ce:20b0:375:f17a:d691 with SMTP id 5a478bee46e88-38570f2b261mr2924838eec.38.1795180486175;
        Fri, 20 Nov 2026 05:14:46 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:14:45 -0800 (PST)
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
Subject: [PATCH v31 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Fri, 20 Nov 2026 18:44:01 +0530
Message-Id: <20261120131404.976959-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
References: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
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

