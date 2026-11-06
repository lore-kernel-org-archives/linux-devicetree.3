Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957462;
	b=PmYLoRjRLRljxTo6NAg7e+57xReSlIA+33u2gVFPhJlj2iupgshfCftYMOURf/wtCSB9
	 EoJy020YUvNUeL3EkQRYBlQWt/6TX16d5eWV/chkWK2Xi3Rkdhw6eP4NwQaG+NYXnjRoR
	 Abg5ntwegHZ1lM0P1evHJrgMFkRIp5K0iUYjq2p1ttbjn+zIhuwfQv/iLmTh7mh/qTzpk
	 ragOOSj6ANnOo6D/d+QSeqGHox/dVFpeJ4ok8pj1xeR+tIz9W3x7UJZ5Shr2S2C0w0s4p
	 lywfYpypsCWo0xEJu7i8Jksp79pSik0O3xHf03NEpnlfAEnuIZ+3hQL1bwcEaFIYwug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957462;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=9vU5fdChaB/2EW4T7XT51RLH1JOXsXIxQ5nWQ34YmVs=;
	b=qGdZO777DhBiutc79/5RWv/Qw/WuEGWVUFYioOMRyU7QnEIo9VpNndqQsPf+w3m+9KEt
	 h7I8kmgHVX9LRNSWYIBfwzOwJ6SDJ+FsgaOh/zwBZJrtsxSK80BcjwnkLkM3PvkNw9S/2
	 4ddZHonraelypanMWesLnvzBQ8WW6qbAHEmesA84ixDj46DWY490WVj8P4oqE6L/QUQc4
	 wDURlbBYN+z8jw8F8I+Cobk4/Fbqof+focr3sbvuq0NhmdSmUNxWTG/FIIhNam9e5Xdrx
	 xCr7uLpRoziJCbqTFCwIlXvwKoRV92QdYq7Q6Bf5dtlkza08m+4ioEUp6Vd1VnvtdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ga3m9oBj;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C8606D81F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63C8606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ga3m9oBj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83EA21A0C32;
	Fri,  6 Nov 2026 09:31:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 546585FFBC;
	Fri,  6 Nov 2026 09:31:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C59103292CA;
	Fri,  6 Nov 2026 10:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9vU5fdChaB/2EW4T7XT51RLH1JOXsXIxQ5nWQ34YmVs=;
	b=Ga3m9oBjGIO5fOzDiTypkUtk2v53a1A13ExnNdsT9EXmnOO21NBoRNKKePIfbHQwTtdGgr
	S7uKPnMVyH4p/gCvWEqoXwYs3JXYleFYdbyM6nHgOYHLzEAfrqA9dV0mpYmhpeoNphSV6h
	3nW8cOEtrGXiKx3pdmXe9n0hPySYuw69viw0BG8XgRwzLek9hMvKkjrlDeN8NG/Lah/0Ff
	XxkrfuURApKzFnbFv2/8/qeGzMTN4wJ4Uxuu4OWvqYqJDZKRJurBPLni/vNHoej574NZc4
	XQOyLK4nILUARntumPj6sA/UySMzdhu/99ANFFqrRggQcmnuGYiZXy4BKFms7w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:00 +0100
Subject: [PATCH 03/25] dt-bindings: reset: add Metanoia MT2824
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261106-mt2824-v1-3-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Document the Metanoia MT2824 reset controller, which provides warm reset
and system reset controls through memory-mapped registers.

Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../devicetree/bindings/reset/metanoia,reset.yaml  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/metanoia,reset.yaml b/Documentation/devicetree/bindings/reset/metanoia,reset.yaml
new file mode 100644
index 000000000000..f169d1fa919c
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/metanoia,reset.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/metanoia,reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Metanoia Reset Controller
+
+maintainers:
+  - Jun Chang <jun.chang@metanoia-comm.com>
+
+description:
+  Metanoia reset controllers provide warm-reset and system reset controls
+  via memory-mapped registers.
+
+properties:
+  compatible:
+    enum:
+      - metanoia,mt2824-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rst: rst-controller@1000000c {
+        compatible = "metanoia,mt2824-reset";
+        reg = <0x1000000c 0x4>;
+        #reset-cells = <1>;
+    };

-- 
2.56.0

