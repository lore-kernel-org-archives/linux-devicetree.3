Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D03D565F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536640; cv=none; b=UtFVZBaaEpNyJIsghoIa5WAZV6er7d2FFY1NbCnuVsNfUX18LgUijmLeprBbERZSUuix5aoEZXs818q4/alAqHMTZrZcJQpbJaXuMqJYy760kU/2mh/GIenj/4nwpBQjeuh9dx4lTYQkN/N6B5ooVsk86uvEm2/FqlJYqhkUOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536640; c=relaxed/simple;
	bh=+gXx26kToc5Qsn+X5xpx5KaXlfJuV83OpMJgOHZcMo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJQkLXO+wHyP80/SaIRzttTCtsXAHAqDqUsViYvbW6vn4P95OYj8iMMEIX0GdlUFfKBZEE8VjGTcjPmLMDR6xwZMPYFFCiCWzk7U+e7s+0xRSNtydFoIyFhxaJsb7AVSIuKWCJSBVWUtTGH+AfKiEanrCCbke4u5cdhYp6xCk1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zscll8cq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zscll8cq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfce3a195so320382f8f.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777536637; x=1778141437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=Zscll8cqj2R4VbtGZixrvFrLLhq0FQdgD+IqQkfWD/omnoEpRRDNcGOvWxGUgF1a/L
         LjJrGldVShBgNVfkeU3MU+Suq11HqyN+HVCWJG0g0HtuMFctQs0myOSWh9Rb37GCwLPx
         ymhgJBtlTXcYKIubGB1+o0ILbzIDMf4QVcqY4mGVj4Mwr8EE4Eq/gJpx6YIZOH+VHUf9
         wHKRHqjttAAOdaoU9a5B7reh9FlG+9Si2wMDsp7qQ7i8LtgHpgkV9dEzd49tysQielM3
         u7acRmyo3ia+kxxemSdo+X2QSa9VKeXWTb4ryhCZ5kYGLffl+ZX2iDhm8fgz7Lb2GVYS
         Niyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536637; x=1778141437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=dRF/kF6JrplI+csS8yfXNjCBBzoZ2AZZqjGs3MxBHCJodGtlFPzWe+K2LcOsjrnlhW
         kZxSQykWDUErxiIUa+GmNp+MT103Y/4tpgCpoZrv14zTa0vHebjEHs1S6qyhmSjDUSlC
         +TudYP/6n9clDaN5G8ynfDBG6uRcbwpYLZDKOrFTT52w3EP5OyUaEt7uJT2A6rIwD/4G
         +f/Od/qHi1z1dDLAOMTV6pVNazg1se3uFTsUickNZYXFqU7F5BApsYjXslkoj1o/Ma4L
         BsmateOEB7YDubojSTx8BMX0Gc2ZmZrKp+8owZ+TUCJFX3b/FQxLlppnDTJoGK7HmLhE
         2vvA==
X-Gm-Message-State: AOJu0Yyc8DnjCdnyZRfyKH+9Lxd68yKheJ+1uR0LDZb44Wc+S/UFb4ml
	7ebOcxzEcD91O+sJAsinyc+jpo0PhZ0kY04EeLs4yTA8nmQFcg2XApIt
X-Gm-Gg: AeBDievvqeohBpupv44AhAk8/1JED/7DFeVuehdi9D81LhpTbIPS6rK5X8/38rdx0od
	4BBYa6te7b+gOtTi8YLyOFHgebfYvVHvFhzg1l5l+AIOADh+YxOUCk0xIRCU8Al7/3YOc2wK+03
	f1DhEjqy1835TeM7C0ueMF1wvq1UaDtHktwSBFwHDx+kvwAR4C8tYWXsaEh4YKIVdjEfwl94OOP
	32N6b3+gFy+9Gs/5y6uI7heLSVv7r+bChXODvNx9qIqGp2i9n9uVJ7xPyzrYmMP8KaNt0hOWcrP
	7ucsD3cjAs9AIyF1Oh8zf01jlRRRdkzE/sz2ycKsW3pc0kSK/BiiQVTY1fT6xmMFxqRjoioj+vc
	afblHWhimIBzvYHDslGxzyevBnj5454NrllfNsb5ttG5DMiiA6zXRLjz7pKyNEvxKVr32X3rPTg
	g76v9Bigf9vIV+o5yS+oMwdBk=
X-Received: by 2002:a5d:5f85:0:b0:43e:a69b:d804 with SMTP id ffacd0b85a97d-4493fde12d5mr2993201f8f.29.1777536637211;
        Thu, 30 Apr 2026 01:10:37 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b120bdefsm11809517f8f.0.2026.04.30.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:10:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: embedded-controller: Document Surface RT EC
Date: Thu, 30 Apr 2026 11:10:14 +0300
Message-ID: <20260430081017.59345-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260430081017.59345-1-clamor95@gmail.com>
References: <20260430081017.59345-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document Embedded Controller used in Microsoft Surface RT tablets for
monitoring battery properties and charger status.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../microsoft,surface-rt-ec.yaml              | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
new file mode 100644
index 000000000000..0fee574a3015
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/microsoft,surface-rt-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microsoft Surface RT fuel gauge and charger EC
+
+maintainers:
+  - Jonas Schwöbel <jonasschwoebel@yahoo.de>
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  An Embedded Controller used in Microsoft Surface RT for monitoring
+  battery properties and charger status.
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+
+properties:
+  compatible:
+    const: microsoft,surface-rt-ec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  monitored-battery: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@a {
+            compatible = "microsoft,surface-rt-ec";
+            reg = <0x0a>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <74 IRQ_TYPE_EDGE_RISING>;
+
+            enable-gpios = <&gpio 88 GPIO_ACTIVE_HIGH>;
+            monitored-battery = <&battery>;
+        };
+    };
+...
-- 
2.51.0

