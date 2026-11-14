Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666187;
	b=Oq518AGS28UtdsHz0Z08IfIknIwt+pczhRQ+eb4hC5bdWhIjCEAQB1xa1QFdxn1mxKNH
	 YWvmDiRF7SZ6LGOQgCnPnhtH9R63aI0/hwdo/b35MBzOb6ssPK5ziXFxE/ma0f7S7P60j
	 /PlrPgfo69tjs8plICZx3FJ/R42eBmCzdj78t3xjHZd0r3jNl6Hk1NNaPDXDOIc4CR8XD
	 KX7wFEjG9/7tjgo8Wx1cCdupenqHbeziTn5FfN4zIzzkURS7ZGO2rXGN3P4QVdChUtII3
	 tRx0iKx8ZQ43oj/19DrrakriJ36vInJRR7ddjRocUuVFs5VBg5OyKUFsqaZF3SQndig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=zWD0hVzUNWO2+99V7uXNsPDKD+eBPZ+0CPc+gtsyiQ2xpCMSib91EkE7x8XN7DalOgLn
	 sxuoQTqAqMBmBJg52cK3t/tmw7J3zQxXvkzGezqBuKMYZUDxl9rIKLAljA/XT2zP/hnGG
	 jJZ+5kafoLcfuJ+8C7XzvS2Npbij2p36SWklL0W2gb7c+oj5lTacfRomUXG/igfcwZ+kx
	 AYI0LcAqvi05Pdpp7QbvlG5K0fUY7qUVY4fpr1RgmCLyoAWy+hKNcw8/HN0LDnsI7O+TG
	 AEJXBhcpYFCcEEIjfuCn8uTnF+MDZ438kYQquK4mLjObmI6Wejqr95epWZgDKANPhzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=h6CH2d5c;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9D606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF9D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=h6CH2d5c
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37986eb6fa2so1554673eec.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794666187; x=1795270987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=h6CH2d5cZulXWdcrO/5m7J1I2pa8dAU4NSQNCd1KiHK40tsF63ZW/S5CXt9oCBP67Q
         /teSmYtZEopIvfYIztsk026KkPB5YaG4LitPfHwZHkTrhL5sdOzmBSwPD+i+d0JmTN3e
         wUNcK1kQMuCFQ6dY9SXOEVJ8D7QMZJ9jPane0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666187; x=1795270987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=qsefJlWNwAkIqmc2fUhUDTXTiI99t8LwieN6vqeRLycXjWuBn9oNyhr1RpUQKC8+G5
         ngBHjpH+OrG2V4GiURw09JrnFcl6/IbPPxBKpFaqVFhZeoaqUHl1n2TQHL3/C08j4ab/
         WA2SBE+jPYSbwPfJtBfDH5C1AdIAvyZWW0O4TgXI6vwFGvDvbMf6SplATu1TPmgMupWr
         K64oRpKfqVmIfbCN34iYhi3qVhkhJofMUZ14ADSWnt6Il0saKGqxxVT01i3Hv96rMEfK
         f2c8rW8iFmzkPSeccpnHPw2O4z9652XSalQ1gfElD4BwNdUfoUSn6xqvpjt1QiwNpmhn
         Dh2g==
X-Forwarded-Encrypted: i=1; AL+hErGOjyHwTSwKgw7JSogTVhhhGmxK1i/1yy8XGvmuDPhvPniRWW+Sae8LN3hhGG13s+wgufQmn/KCEJzI@vger.kernel.org
X-Gm-Message-State: APuU4Z/BC2oj4MtW6J0faaDZl7JvYQxm6VCJNJeu75ywdLDP89eotzlX
	qrslsFt14NLR0reL2f+Vu+Owwn9Jpezcg84jugn6Jcpght4bVz8b1KmR5Yl3PIqsuRk=
X-Gm-Gg: AYBFou14uyBqJ5fhbI+2qtDgLJqmOgmn1fyRRONlPPDpkCL24pYSqDHizITFz2HA5n4
	oRuRmgF9uMIxBPvIjN7beOZk7vtZpEWfGomRaWf64ZP9dJiYfn5q18fG/UPCG6Q9TsAS4SzHJ8n
	lWkwt4sroCnbJ8pALhPCSdOdKgBqBGtxk5pb9PGeBZ73YDt56NaIfyIKtmvalkoc9B6ke5yadK3
	tVLEhAS52ZBTYbkWhcPm/D8cyjMDBGD2EzQVH49b9FFAKARPhJ4anjjTdG4JY9NNd8R8gMJN5dX
	cW1GFruktQ0orxg9+CI9SO+CUV3gxpJjGbUFTcXFTtnzJNUM0nOz/MSqNRHo+TIxM1PwPqgIL69
	retzzMW1WU/hkxzmXd+N9ArvkIhBYNpAHd0U9qI4IP/9CBNYbnj837Q/l96mgvWr0otWxTN+tf9
	UROLpKYwLvdUXBhfQzbi40bGpcSBahF5F3lnhrgzBZuHifR9IYinjbarQfkgk+mbe2c6jo/wz8/
	9yiTXC70bj7E4v/51bu9eDFnz/tQg84/FfRw+wscagtrfj7assfw7yKpaid5UmnTtl6tWgp6PgF
	vM8zNkhlZMtr19DTg9Xmkju7wTJ8oLqql2qYsy0d6A9qbu98G0loYuVKLZ/gLcZ9c9fM9+Wrw01
	F80UYEWz5nYu158eoOK7MQrujB0lINtD2Ux/nqBLRP7D3OUnKIeQQR0+ckHok246EH4yb
X-Received: by 2002:a05:7022:298:b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b5031b0afcmr4540930c88.42.1794666186364;
        Sat, 14 Nov 2026 06:23:06 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm19376962c88.8.2026.11.14.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:23:05 -0800 (PST)
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
Subject: [PATCH v29 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Sat, 14 Nov 2026 19:52:09 +0530
Message-Id: <20261114142212.716906-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
References: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
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

