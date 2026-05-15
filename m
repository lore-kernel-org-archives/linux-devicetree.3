Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9C4E3774
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859395; cv=none; b=l4AJAg7fpewxwDH6R/Wa8o4/6Da7kqEiAULKQ1eOprBmEjUop9K5ySln1uzGMTSRiOlSrKYJa8rZhgM8dJ225TFHp9s9xKXSpUNouSy2kSN9AOsazWH1ZvUPpHyklsiHozN8dpRYSpOxRy+NKiPFbg7P6R+gQI3Qq2xHpRQ4tQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859395; c=relaxed/simple;
	bh=899m7Zy7xurIUVRNpX/tx4JxhXfB8AQU+XOgGIIb6Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huh7oswDF/v6jw3coff7Gtrava/dz0/ItfbmzjKv1WdALtcMxUyw3QX8rWzYgvD0fOZqCUnQYdjaKH2hOeZtpDP6ywP7DrEZheurnZtn0gkWIwNCCtRxk1OPQ80tq3+XXiTm9LzKJ9jEidkRRnvtW9pIXbzl1b6G7V34Wv/kk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMDpMuQw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMDpMuQw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso16471127a12.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778859387; x=1779464187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uK18dh7POxzr+9hxadaHOszS8KbryfPOypweUkfevYs=;
        b=SMDpMuQwt+FD6j7k3E/pOWKglRXXwrNUzqqHO77UUF3c4oS7vfvWsYDrLk7iPaknOQ
         9G/XT/YpA85DVdON1ibkYl5zFxVTrmDyoPXjPC2UYjIQgycFgGtRhMkHghK2xQOClxvV
         HTnlJrB0rjc9+6ppOhRMi09p97OY4/tk9/+OuiXfZbhSn8jj/zaqhKt0qKbjqdDZrswA
         sNGlwiD/rDx8dfgA/yxE9afxTDLCDL2XHyR9e+NKVLL0jK2OyXofNjJqHI4bsFR1Nt1W
         zFjQmFeHya21zPnGVXusrSco09yD1anv+Wr59YU/osRC8TxtmgculKsT1a4YjIXyvlwZ
         06ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859387; x=1779464187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uK18dh7POxzr+9hxadaHOszS8KbryfPOypweUkfevYs=;
        b=H/4SLyymIhi8GXiDtmTb5k7WER5D+xgDD8d8LjKEr6i056zQKztcp8nySJ3U5gWjmu
         SGFOVZ1ELkZNR1tDYFYWhwAElQfgTvTPnb+Y7Z/xuDXXw2uXlLEbOKgEd0zjUbPp13kZ
         VxeyWUYOdC8Q3NeNOCP55O8VbWcLJxEBxDQMfFdfDBUllVtLAnRNJfADb/uJnnNY+OrE
         7lviFGfB19F9jHp32miP0ikf4Wsw4p88f45JgQxBBgS24kNXSCv7n+h3VkqjvogYI4et
         OkFNJochBp5fTpXi+e9n2swulpxfgn89WuKdDzuUfbnrI8A7FFcNBbqTOTPS0fRzgWVc
         IIew==
X-Forwarded-Encrypted: i=1; AFNElJ84mpUJxYHi9DSBk/2/rDXFjWJZkcxyFxibiddM7EZKa2uQgcHIshUWTrPKSunVbwmqQh0noVB1gtNM@vger.kernel.org
X-Gm-Message-State: AOJu0YybIQbPCyzD0InrmVaBuo8h8g7E5UmoKWpyWNL/DwYK4Ia5rMFp
	gAMmPGK51tKjkqS0nlKIJ6QHENB6jrsASkicj+SL9VfUzC4E4TxMX5fI
X-Gm-Gg: Acq92OGsNWqkDle5qXyHNiGg2duSqCCAMG3E3RVr3TVAeud63Ftd80WgYt4rOf4V44/
	oNaVzTI81QbzGmjd3ywkP8uuB9mjj9ixMyWPqRXWHHrcbiDzkLqeaZ0pJEISwN+6mMR/tHMfd//
	a3lxM6pOnAmlBpeQsNSbb7O65IRhf/WEfQO1ezfA61PO8nROwPJxQIhP263/kpswf+rIQARy0rO
	PyZMnmobTvpCBjomIqhiQu2TaZd6bv9bDwJf0m8kbrY6RfOxbSXOnVjGgHKUHuyRQUy/q3v4RVE
	LCsTWUyLZExHzaKeRXXbAPUjG5WxTNmRN5UrhpANSztjjLZzUnvW7lNk+PIDIYv1Mys1J3RuSqq
	McDEN2lD4lcil/k0GRxg2q4LxueSSRz8iO6igd68bB1vi2iNcWGCfxfupVL0sAVMlD+Yh5iroQA
	==
X-Received: by 2002:a05:6402:1f86:b0:684:9d8:e3f1 with SMTP id 4fb4d7f45d1cf-68409e838afmr1509946a12.9.1778859387345;
        Fri, 15 May 2026 08:36:27 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::6182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm2205089a12.11.2026.05.15.08.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:36:26 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: counter: add gpio-quadrature-encoder binding
Date: Fri, 15 May 2026 17:36:14 +0200
Message-ID: <20260515153616.157605-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515153616.157605-1-wafgo01@gmail.com>
References: <20260501200749.20029-1-wafgo01@gmail.com>
 <20260515153616.157605-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for the GPIO-based quadrature
encoder counter driver. The driver reads A/B quadrature signals and
an optional index pulse via edge-triggered GPIO interrupts, supporting
X1, X2, X4 quadrature decoding and pulse-direction mode.

This is useful on SoCs that lack a dedicated hardware quadrature
decoder or where the encoder is wired to generic GPIO pins.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../counter/gpio-quadrature-encoder.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml

diff --git a/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
new file mode 100644
index 000000000..741396b29
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/gpio-quadrature-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based Quadrature Encoder
+
+maintainers:
+  - Wadim Mueller <wadim.mueller@cmblu.de>
+
+description: |
+  A generic GPIO-based quadrature encoder counter.  Reads A/B quadrature
+  signals and an optional index pulse via edge-triggered GPIO interrupts.
+  Supports X1, X2, X4 quadrature decoding and pulse-direction mode.
+
+  This is useful on SoCs that lack a dedicated hardware quadrature
+  decoder (eQEP, QEI, etc.) or where the encoder is wired to generic
+  GPIO pins rather than to a dedicated peripheral.
+
+properties:
+  compatible:
+    const: gpio-quadrature-encoder
+
+  encoder-a-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's A (phase A) output.
+
+  encoder-b-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's B (phase B) output.
+
+  encoder-index-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO connected to the encoder's index (Z) output.
+      The index signal pulses once per revolution and can be used
+      as a reference point for absolute position tracking.
+
+required:
+  - compatible
+  - encoder-a-gpios
+  - encoder-b-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    quadrature-encoder {
+        compatible = "gpio-quadrature-encoder";
+        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+        encoder-index-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.52.0

