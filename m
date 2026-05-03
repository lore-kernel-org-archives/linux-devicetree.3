Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748837649B
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827411; cv=none; b=FhZ8A0qZU1SEndtwc+gK3CKbH5g7kNrlk8yH+CevgYQWgQ0qM5/p+pyLY8gYAVO/VuCPvw9g9ngqbQjx5z7sJzBFvhiIPqcPE6ESA2V+10hXrAKq0/Y0B22ctoEoVBlgceYuvzqKoPPmVDR/J/GTL7YAnkqjOLeUrd7XwHNdpCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827411; c=relaxed/simple;
	bh=+gXx26kToc5Qsn+X5xpx5KaXlfJuV83OpMJgOHZcMo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADcorli+A7nGWXFAu745G22zlM5f83jgn2WtAEa6cvuQ0hAgn1JpKZmTbTA9TXbNT+Ne+Ns0+XOMbPiQ6aMm2f2Ryz5lQxNebs//8/6/kOjmxi9JYK6oiLsxlu/YttUwg+qtj2Xbc+a3b7PBmUh57SgM23UD6N1+xdC+xVjEmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9DgrVZm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9DgrVZm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so2617118a12.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777827407; x=1778432207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=q9DgrVZmybj2oRjUyU/JHYTQQmlcwp5G5MAk5cXWeS3DGHHhA1jOu5+BLMf2SVf9r0
         zNNYY+Yy3nuAN9PxQQ5UF9evxs/mXO9XXInw/51MZ/JpbNsn3XIVvCQXfe172mbs1bca
         I1mLrhZiWMg0w0rN/n5fHa1bvuuYIxST+Z34WJy/NPZ/KovTC9mv9c92uHBQBChDcXnO
         chAMG1hkDobbRuyGkePHt6w2R1Y1nqY9RfAPsaIqte5z/qFZwWnrEGBrArfsh5+ExWcK
         CrgA8ZCX4YjhKTYirHgFbYCmOBvi8i3e1uskp8CeErvcWcIQlWIkvkoLUqd2B7W0t33I
         5ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777827407; x=1778432207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=l5hoyFGNwQLEbjEX+Yv4pM9kFL7Dw1Nce7Zwt0S1nTw0OJWjdXskh2ASxo+rSo0RYE
         CFg+qSEk+nZpx7Ny5/3nnzfkTamib6mBDDMyh9uLVzYwPKCs65dR3yL7r0ikNyLxCh92
         tZVhzTuXRBeGMsPuvWUEtdRAb0S0MpFEQwiT4L6rNbSEM39bwrkMFqCXlhA9dtUPtmlP
         HUaBuPejzy3vdtbBPotU8Wg9ZxQICHEAIxTxoLbPYKzOaeHUyVwxLO+9fCsS1nHiFKpv
         +APQHQ1/pziKUjyQMTpH1PysKyAdcffGJF9VCuWRHjr/raNcLebCRClqluCpBBchER22
         pGvw==
X-Gm-Message-State: AOJu0YznRCC9NRuKmbueXEKNq+3ncyobdEIcYYndeWslpUIf14znUXGU
	1PUuy6GJc7V+bqq99UwB3urxQu8lQRxkEPX8t0aS8wxZaqvkW4kISZrM
X-Gm-Gg: AeBDiesiYi+rVtdPnOzwNFMyWLjFtQY3cP+yS4X4H+MvoUP8LxF5vK2Kb9kUMXo3lHC
	/XsCjjsVn5vT7Z4Dvu+gX85eSjkHEgrQinPDLvLcwMZJmxedTFIWwmPw8mNbWWNJszrMg18u+0+
	GG3gcb3GZluQz3dcoR+i7biGZsh46AtOZFyZPotvG0eH5Hs2snqLFndN+NlTwvfGR8JNjPQHWfK
	O7BIbzg28Rxn+cT5e5PE5FrfzELpdIr8iVS/YXTl+VjjBuHYMCxi4epvWw9rSySicbja9Pio/o6
	VGSbjGeS8iDIfvJEn6OpveCFy6G3lgG1a+VJpNF6QpVBPzR+zB4dNHpBxbXY6SlM2et0iWlMF31
	yvSC4KUJ3TjITq9yQxMwhwwYAnAqktqB2eC7pTd7VgFGNnxPKr0p3OwJJtR5Mf5MK3kQ31SVJ77
	fZ1ZhxyIckFZbilF9bxJOhj/4=
X-Received: by 2002:a05:6402:2b98:b0:676:d8df:f8c1 with SMTP id 4fb4d7f45d1cf-67c1b2a2c9emr2670164a12.22.1777827406947;
        Sun, 03 May 2026 09:56:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b8579891fsm2713649a12.0.2026.05.03.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:56:46 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: embedded-controller: Document Surface RT EC
Date: Sun,  3 May 2026 19:56:33 +0300
Message-ID: <20260503165636.216257-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503165636.216257-1-clamor95@gmail.com>
References: <20260503165636.216257-1-clamor95@gmail.com>
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

