Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679981;
	b=b02nZusVytzkfA0CUoFdOF7dXZicbzlVWEqSt3ourd6wSc8PJBZxvL7TgyT/qciKVZj4
	 p4QT97jD8UozEcrOp8oISfO92HwK6bjmlsGkzYd2YIxPYSTuVWav5ltxEqG06yk7q/4M5
	 AaX+rVUzF5UyEyiUslNsrkfgiEafl9SpnJxjoHBuJ9Y6QlldhgTu+8gEcEw29iwypUzoE
	 gPkLXM7Bro21jm4jQ+TUaMxC4k5i0OdJvq330YC4PujENwhegWF661IZp51e1Znz2xU0a
	 Sz7kP+yMIgFWxbvBCQr2NV6QoWA8a+RrXrjypKBC2QTLmsGugKr1YCBcQJO/OudClHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
	b=Fhvv55wwtvfmpmc9K3oCnZNZnRb+A2DVK/9qPnGEKK6Qr3iw34flu2jK3hbPI4RaT6GT
	 CEDKwbsLawKqD05piPGwGSppa2ht1hMpRSVJMxYGg251M6LgZCb+z8e2oJOXZVxqOpK+7
	 yjHRpQM/5cLY+Exs9Uc24rTUDft4DLsQAoueaWxRgVQPGwq+rTorG+7JNKCd8o4Dg404T
	 TqeE58eSMI4LkXtVq96fDi5ZSJV505rAi7PO6SEJzTiVZdLI1RpTqgGEdZa/VCqIE2RHA
	 d+0+PAzRM1Xcq2o8kJU0IWXfebPQKx3ZQ6lVW6Nwm/ZA/QU/AroRTJ9EDjAisaeWOEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JIv+ngqf;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB16D606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB16D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JIv+ngqf
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso4915004b3a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679980; x=1794284780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=JIv+ngqfWT2SOadLAtIqQVqiPR+GCJMvVkujmyHqPJexcSPUUuOeSsk6eRkm+jhxkl
         MmU587GzBGtJhX3tcXRnt5ieOm9X9jFIjJwIapATWaDAupGhsb1WMnCUayuUR88AOct5
         bw8ujQo8Vcu+0D/mN3kr5ZhNACcPRR6qxD4+IYsJqAG0DA1SlqbKULZAeJwEJls9xh/c
         uOnoiIu8W8OZbeCVc/QZYjBNXj+H/Pf+c2iI3kTZBe0P/GTpy4n5TUGQr+tketQC9A6F
         b7S8sdyydDYrmjvPCZq5o1pJAu6dr53DOMDo3u7JGKsc+80Jy8PB7LGGcdt4bQbY1IbJ
         zVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679980; x=1794284780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=jMR2RKjwwXdYS38D6IT3D53THPF/WXvBKGY3wrBzJVNeUYTlvwqivT7mHkl4QB+jRK
         VZqCj6g0zhzja08fDnoFPz/6hMgtS17R59MB8WWmdzRFzb70wCFjmckPbeQ51nMsvHZi
         u6p8WUhbeQQ5OV9uS5oRRV2hlBje5D/DCMR7FwpY92dETVGpRw6xi9V49n+Ye3e/kmcX
         9e2bourj6Wi9YU9hU4m2qJyI6qZUu+rd0acG4zmm6KZP46cwcpFWX+V4rfxzLmqlkRzW
         Z5LmUXkqJSrQkhee2GuunmNugLwfozFwtlO/Gbgy4fwoT2SclGlQst0igD9KStB2F0l+
         jhbw==
X-Forwarded-Encrypted: i=1; AKwUvBzo/mLYAuznnUEmSNkfRUKuDDxUtxorPx2tUwWVudjSTl4lHzOiV7HMru98LySHvUKWF2KBJyiDf6cJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/lkRdAX1uTUJP9ubx1jk+Ox7GAOt1I0fIJUBOYwwrVsxBiJzQf
	g1M/4a8EA0wbchOkBw7XmE8UOUerQWjLIyYeNkXphBvWVcTj4A0bxL/SBJUJ/gZlKXu8qTkMCYn
	0DOtUu06aQFRkOWaUK16JhC71Juv7yoo22Q==
X-Received: from pfbli8.prod.google.com ([2002:a05:6a00:7188:b0:8a2:7343:1d03])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:118:b0:3e2:83bb:a61a with SMTP id adf61e73a8af0-3e928a7d42amr11416861637.5.1793679979791;
 Mon, 02 Nov 2026 20:26:19 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:06 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-3-vamshigajjela@google.com>
Subject: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV IP Solutions MIPI SPMI
master controller ("smartdv,spmi").

This controller IP is integrated in Google Tensor SoCs starting with the
G5 generation (codename: laguna, canonically written as "lga"), so add
"google,lga-spmi" with a fallback to "smartdv,spmi".

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
new file mode 100644
index 000000000000..e0512e60d932
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SmartDV IP Solutions SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
+  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: google,lga-spmi
+          - const: smartdv,spmi
+      - const: smartdv,spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      Core clock to the controller from which SPMI SCL is derived. Optional if
+      the controller uses a free-running clock and clock-frequency is specified.
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Input core clock frequency in Hz when the controller uses a free-running
+      clock not described in clocks.
+
+  smartdv,master-arb-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Enable master bus arbitration phase (0 = disable, 1 = enable).
+
+  smartdv,master-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Master ID for the controller on the SPMI bus.
+
+  smartdv,spmi-version:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      MIPI SPMI specification version used for transfers (0 for MIPI SPMI v1.0,
+      1 for MIPI SPMI v2.0).
+
+  smartdv,arb-retry-limit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Maximum number of times the master retries a command when losing bus
+      arbitration.
+
+  smartdv,prescaler:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 0
+    description:
+      Clock divider value to generate SPMI SCL from the input core clock. Writing
+      1 divides the system clock by 2; more generally, a non-zero value n
+      divides the system clock by 2 * n.
+
+  smartdv,read-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Number of SPMI SCL clock cycles to pause during bus turnaround on read
+      commands to allow the target device to fetch data.
+
+  smartdv,arb-scl-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Delay between arbitration and Sequence Start Condition (SSC) when the
+      controller is the Bus Owner Master (BOM).
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi", "smartdv,spmi";
+        reg = <0x14853000 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        clock-frequency = <19200000>;
+        smartdv,master-arb-enable = <1>;
+        smartdv,spmi-version = <1>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..f44c597c2075 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.317.g454f8302e1-goog

