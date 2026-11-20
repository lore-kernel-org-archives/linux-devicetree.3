Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166653;
	b=cbJX7Z3kvrj6ve2w8yiGOQjRKanOz6tb/LCUeDQQ9Y3pc6FDJUy0GmXklBUfZaGpgD0V
	 A5DMTMyGvR9frHxznrF7LreRnqnMvXP5JkHbzRS0Vy269WjrwX6q6l7dUoLItE1Al0JPH
	 HObuIAqmE01ywidOzTpsEZJOBwGxVT+GZz3V9R1D2NTf3zmk1Ey3XsrMiOZpDgewdLXQA
	 oc3PI0+IXkVwbldyCeLRGHXl/7ECRQw+x+p71Uuky+NKecK8Tt5ftD1BVHXtfSCcgOr1P
	 ztfEkUBDJOwBRWAMCUBrD4AgBtwWkA702UYryhXnh7AGtywZO+fECDKB88ACmRD8CmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166653;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3DxZX7LHp+eAIgwhnyJoW9tDhuqcgyRIyYJ5BT0tq0s=;
	b=W7PyHYSb4JI2m3bESYov4TzoW+c2J3xdskSqTwYrThM7bTH7fACuBK9lS2bGbbVFBPZU
	 fUncSIvK2b5We/30S23KUWbi2SdnfN02Dett9GpYv1LPqLADgkm/PZP+WNeiqewS+Xr5H
	 lRmEmtLPvAt2sO5iwzPo9TdUeOyq+UJ1xhRKYxhmoOID7m8BvHoKeKPf0uJquwqNGYJNQ
	 7VezVSKhMicz2+MlLgLpA3IH8Beo9/utWungtvxWkyFpRjzRbdKCKGcaSnG5IX2hb+JSc
	 K7P9dQhB/HHQuOpUEzdK7NxiQTD67zdioYcoOAdxqgtd7Nbc9oE/XxhDFLGrb22cRUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwX+E4Wp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CD606A325;
	Fri, 20 Nov 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwX+E4Wp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795166653;
	b=kjt4HCeBTrzkYqFd3VvGGDSJnRDKkUx2qNAdBIl0GSqWeOq3J6RHQ5li6NhrscBeJse+
	 AU16avVJzT2HGFBWOIFWQAabUK80qyj35U4yvUoojokoQJIKThaTLsFmR46SGjg6IbGjm
	 Psh2BdDtuP/w0W0CjfkBKW8fuFQoiEB+IYvM7L3qctyD0HLXghJ06q+i8461M0lccWpJY
	 xyLJ4Zc8dRvYAaV8IAsjpT/dqE+vzxgx6oTNXjjadGk4j9JxPRAhKfwjfQXSuCWYk3uCg
	 ykn9CkDTmfYzLCZn824DxtDanVqrnptKTW3EuqpRMZ2XTrWSsRre71SbsqnYYrAQXDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795166653;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3DxZX7LHp+eAIgwhnyJoW9tDhuqcgyRIyYJ5BT0tq0s=;
	b=KfHcoffT28ALat/OqEfr63qWmA63BH8KPtwrNzrMifQUQUF/ymspW2aQp5HHYqiNX9qJ
	 DtFFmxKFNHBXRXzFXeHAFjECoO/tirRqFNZYL19XbcrkZDN307XKow/QD5aSvhLk2hn5b
	 cCl60g0wO496XYB5xwUqrAzA3dz5iNRc6dJJK3VkOdxj+GBFl626sMDf2kQzny8FYY0jr
	 t2N4Tulos/x1rl8u+mQWee9bMiHcgnnw6VR3v8/qEo+heJK+dcOGjzOaJYS1FlcuFcUqD
	 O+jjXxVpxzCRo4EMxXCl9sOZXhnc3TsCtj6i9Gd5m04t9X/crYRAmKW2lFry1N7B3SQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6448F1F000CF;
	Fri, 20 Nov 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166653;
	bh=3DxZX7LHp+eAIgwhnyJoW9tDhuqcgyRIyYJ5BT0tq0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EwX+E4WpEc+LIIulUaGkagq5vTtdO/HV5hbtSsjS+45IJpW4/D0MSEo/bBvVQLl1s
	 24kT2coUld+CaFCr3w4eD+CFi0VEb+zWakNU2BUU9uyOa37GYzevtQnhs6nPT+fw3Z
	 UTzl3FDpjFt9s6Yw1qvcyOgzyz6bNd/0Eijt4GH77x5gsmhansBMdnHNjZLH9xsFNh
	 XRV//EJDAtzOMiCpqi56j5KcBNkH4rv2SR7yumqkust68smMvJpDIzxxFbp3Rgf/iF
	 6ObLEh9+PRgeH5Q6OrYvJlz/a/VjpzRhC7uX5y7huVthk2W6i+xoEwE/VtaWQ1jOp1
	 8BNRYUkyV5+ZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E6C0B497BF;
	Fri, 20 Nov 2026 09:24:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Fri, 20 Nov 2026 09:24:03 +0000
Subject: [PATCH v3 1/2] dt-bindings: bus: Add Altera AXI Timeout Bridge
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
Message-Id: <20261120-feature-timeout-ip-v3-1-affcc644af5e@bruker.com>
References: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
In-Reply-To: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166651; l=3208;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=uhd2t8C5h5AY+wMQBzIl+6v3Z7b04RiF63mPUhbJcJo=;
 b=xJnzDNnk1VTeQ3OJnthe1Cb9wFW6cRPlon1ywnJ9V4kDLaF+7zIPKJmqPG+ufueblAvalFjWO
 T0iVXHvQPbJBs4LlokKnX1pY4U8o2K/ia+IC38ALwaLgF2njqHnJNVZ
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com
Content-Transfer-Encoding: 7bit

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

The Altera AXI Timeout Bridge is an FPGA IP core placed between an AXI
host, such as the HPS-to-FPGA bridge, and peripherals implemented in
the FPGA fabric. It forwards transactions unchanged and monitors each
one for completion. If a peripheral does not respond in time, the
bridge terminates the transaction with an error response so that the
host does not hang, raises an interrupt, and reports the address of
the timed-out transaction in its control and status registers.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../bindings/bus/altr,axi-timeout-bridge-1.0.yaml  | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
new file mode 100644
index 000000000000..2cf1ab537595
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/altr,axi-timeout-bridge-1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera AXI Timeout Bridge
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+description: |
+  The Altera AXI Timeout Bridge is an FPGA soft IP placed between an AXI
+  host, such as the HPS-to-FPGA bridge, and the downstream peripherals
+  implemented in the FPGA fabric. It forwards transactions unchanged and
+  monitors each one for completion.
+
+  If a downstream peripheral does not respond within a configured number
+  of clock cycles, the bridge terminates the outstanding transaction with
+  an error response so that the host does not hang,
+  and raises an interrupt.
+
+properties:
+  compatible:
+    const: altr,axi-timeout-bridge-1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ranges:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^[a-zA-Z][a-zA-Z0-9,+._-]*@[0-9a-f]+$":
+    type: object
+    description: |
+      Device connected to the timeout bridge.
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus@10000 {
+        compatible = "altr,axi-timeout-bridge-1.0";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x10000 0x10>;
+        interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>;
+        ranges = <0x0 0x10010 0x1000>;
+
+        gpio@100 {
+            compatible = "altr,pio-1.0";
+            reg = <0x100 0x10>;
+            interrupts = <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };

-- 
2.34.1


