Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309275;
	b=I1cn1LiVDBqewNucdhp9HWsmup0IyLGd4IbnABNBppktFWm7BqIAC19EV02l/Pzc5Iw5
	 5n486kMaT12kr5qcrBe3L94iuWRJVq+OBVrBn/7cG7VjOoLjkDjXScbsEcOT6P1ItD2/k
	 bosuHICQ7oFZgOOPhnCkkF4U5UU/r1VK0lwJ/Y60b1Q4qPhTUhY6dToOjmbICFVvA3uVu
	 5rTX5hz6NshaqakdR3k05059VbPHltDdG5h1DR8wIfIApNDe2iaJBcdXjkHGDnEzK9PE3
	 VKSH6hUS2zBuKkTEYLhg9ye62PXHe1wPMbKaOWBPxZxHXfXNjfZOg0CvhI4T6okt8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
	b=Z0hEXgqMExevam9xDEZHIP+i9bNc0mGjXepJgPtK8zi8zxmFxB2j485AnMdrwLPRKRkM
	 GY3vbQxYjt4ScGGGR0advLr268KdPrqVxMaO32+0diag9ZDLZYYNJNYJRhIjF8TWSrYm8
	 LD8pY3qK2+TXBlQqmBMYs1EtLm/QuevRvVxWg9U8CvA/tVdeMcLmJ31QSQwySbHaorscV
	 DEHz8deCKltwMUma74f4LG26AVC5JNQMxDYeBPN7YPneJqHTuBlvEGNy2BQmU/rCaWL5o
	 9CJI5pLcDSP4cagNSEEPzsYgtyIHCOii8nGq40fndROyDzw3lZXJNYvASGz0SYbZpHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0A4NBtI0;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC341606A331
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC341606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0A4NBtI0
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so939600a12.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309274; x=1794914074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=0A4NBtI0eyXzfDdgbJFJ0O+X5G9I6rwPW7cDcK3TBsChbEgP3ATozn1s+AimSSjxqm
         eRcFDjUgqeGUyIa1o7Yi0YEHLGcr1EWbADhlYgoFlkAxVmKhewf8cghrZc+4CQrZlfRz
         U82qtl5cQHGi/el/C3+TstzdjXim7pE8wXX5j5Hue+TvObXOQ8dRuSjoDUrdhYi6x7LZ
         rEdNhPcZmY9t9wRc+pwsBOHq0hgtzUxSvIAE7szblCSWxTOwEZ1oHQuCqvZdh0X4aEhj
         k/x7KzleGiiYPI3F7IFpbIlzCyxyI0S7/fcZhCQ0JveNxGBFOy8NnIVMiN/kzJzdw9uX
         GmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309274; x=1794914074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=bS/0LU5ofv1luRM+4tC5qqeyaKgPQEbjNChHRq3XffBbHdewPNRynQ/yNDThfu1ehy
         dBcJV9++ZsqJNhip6NeGvo2cqv8lRgJeB2vny+8tMTx8pE5DHjQftSKlfB2Sowr3TKu4
         d+OVZsYTr1CaK3SPeijcPCpVO2RaoMBMjBPGoHHsLX8qxl45YHP2mUbEEpArTnaJuuVu
         UvuVs7ZiIaalI5sBKlHF1Oj3c2sWcrPjRZTkSKxlJM2JvhJBQ1Vzao6X7FUsezC0ajs4
         sBUwL4gxt3aStvJ/6XRnpyrNdSXp/+LAjLuDktVGsff6Mpcsmzxy4lWe4y16NDdrD8rT
         aBKw==
X-Forwarded-Encrypted: i=1; AL+hErHYQj7hs+M83Te5JIaR696Ed2K4JzCRcY+eQ0WPZzTlJtkEZ2G0/Wl1QKMVALDa8nMbk0ERtcSNa+60@vger.kernel.org
X-Gm-Message-State: APuU4Z8rSkMqI/9aLBdkdCdLE6AqvY16JfkNX2PbBajaFB4GAgZ4cwdI
	RM7nEWhIDjE37mTOweGJ/2U82V5O262SJDpC7WJOO2fmD6IpHGGexmAG
X-Gm-Gg: AYBFou2hvk62FyDl9zTBwTcvv/ZZkJMHO28UrcPDlEytpWYtlywPGyQOWiDHXZ4lgOc
	jG5Ju5akWBy0KlAt4bPDt/yXP4siOd+PkELDYeVCDUEkGHMSAhx1m3sNzbepK2A/oJtnwo3xE7V
	jWc6Sjwze/kIWZkdHQUfvRE7fdXKuZOx9k7Ky5K+Wbqo3M2IUkFfmGKyB4RrvZcDdLYzlFoT4CI
	iY+2wfsyH+wlLGoXTt+UA4QIxYjV5AHnolDnvyJLYYvaBRERwEhZ2zLXUPTZ8eTpKr5u55cDFh2
	SDhR07ZGKV8T1PWjs2NH1TI4NWEDluX+9fzGJxQH7dVhExVrEFu1q9f2XZvzxt8I/eu41WPAGNL
	eLKqwKWFTIgUMWy6oVPSb8wC6pRbtbWe5Ozsu+4PNejw7eUnE1bUEzeb0ig2g388y3gz5Bznsuc
	1zvBafrpU4Q8KU2KLXvRAd/KTBLiP+EW0r83IZLLGlpowad5sitHjdVjKEeT6P/peOTTCpLvyEb
	rlDaDOoLTyDsp+QSvauKNtBJ8Z7IDL2l91R4oTYhX+kC1qATbEUlLlHWBYzk1s3T0m+ZKvBj36d
	58u5qtaZXFQ6mdyIV40zyE4SY3/MViFsPKOnXBEmubkdRCLywQJmD3+S82G4yQhYtsetU3nasa0
	q6+Kb
X-Received: by 2002:a17:90b:2e87:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3b166d05111mr2527465a91.46.1794309274191;
        Tue, 10 Nov 2026 03:14:34 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:33 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Tue, 10 Nov 2026 19:14:18 +0800
Message-ID: <20261110111419.89535-2-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
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

Document the Nuvoton MA35D1 hardware matrix keypad controller.

The controller supports up to eight rows and eight columns
and generates interrupts for key press and release events.

Signed-off-by: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..be678d0b38b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Matrix Keypad Controller
+
+maintainers:
+  - Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
+
+description: |
+  The Nuvoton MA35D1 keypad controller scans a matrix of up to eight rows
+  and eight columns and reports key press and release interrupts.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-keypad
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
+  keypad,num-rows:
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    minimum: 1
+    maximum: 8
+
+  autorepeat:
+    type: boolean
+    description: Enable key autorepeat events.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <79>;
+        clocks = <&clk>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <
+            MATRIX_KEY(0, 0, KEY_1)
+            MATRIX_KEY(1, 0, KEY_2)
+            MATRIX_KEY(2, 0, KEY_3)
+            MATRIX_KEY(3, 0, KEY_4)
+        >;
+    };
-- 
2.43.0

