Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCFE3C1405
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 02:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896912; cv=none; b=Id3ZmgjhJf6nTPmRdyL9l9BgJujYjjGcE2/M5mVBg8pQNjbBsOrr9OvR0nMdreF9JdumT85jH38OJozTgn1qKaM/28BDRgQ06HtvicPDoGgh68Ir4sGaOy+iKzJG3av0156d7CscCUAV5+9laE6y8NfVsDCOsiE3CKSYr78m8mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896912; c=relaxed/simple;
	bh=88UypGhQr4MP1727IeMqM86/bOK2bO2zPytpS8FWMYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRJydhEv34aD76mzDZhN4povXBWQ8Ve7CoYbcukKGgOUOhhc0upX5cxs+WNkc5yLNBIKBC9n622Kkz9z8tabyz03IQyywmX5FRwQwaHfy2yd7IidNUIdMMaq0dXVVUa+Up+P+LLiFWbLE/OsbpVjSV208iAEN0AKdRXNp3COJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQYFeqyC; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQYFeqyC"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af81963f35so213773b6e.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896910; x=1786501710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=HQYFeqyC6g73v1blqhBI+lUkgIfdYbzUbkPFcY3kVNNkbEpdels376cKUzBqQ+3/Vc
         B8Pf6uG+dk3QAIkK/z3cbcXC2eooHpmn2KKaVC8N05VtpHKbC71f9vgZihnnDYOEwUw9
         d4wmeEeXKE4dtnmaWE2QSV6Al07fUqsl3CDHhjG5CqB/UPvIOdxPDLZ3XodjjyoUCcan
         OZD4Fk8m1Fnb5+lEGU6oSi3vOCAwuNFnKXnhK86dJWfddXtJB0+GPmQ7hsQw45YANib6
         kEV8iApfxGyQ/oATK+8/f95yhH/X7E3tLgzKQ5JJ3Z2nZ6MKQg+uq9HC0WaNsiVWbMLa
         sG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896910; x=1786501710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=nEfac+NGnlnKsowoFGOgC4DqXIuVVpJbOFcbFQ9GRCX8XcepROeKSPvV4sT3pp8fN+
         /W/QYEEGSknebKZL0tyYzRUvZsqcizDjhakbE1FgzysIK+h1BlEV3gFr2V4r9mKaA/mk
         LQRqQXpte/oeVOHkEtyAjn5jTjoMIGI51qKLD5yduv05i5euVBuXoQbdSlxYLbz1mfxZ
         Z35TbL8dolv8qZ7wkdn0EEi+CG78HhvKMtstzjheCDMpTdvfeFjVC8pWtSi/NhaORqZ4
         Jq5iZSgnMca2U132M9LWkHV+VZrOOHhXznjM6dFHVfGQGjU+UeAG88lFIZR1SykwaUcA
         6jIA==
X-Forwarded-Encrypted: i=1; AHgh+RqBttgArtqWbQkh84nJvbyD0qDgob7u93l/pgTUs1+cdShNDFAr+usPc3kqxcj2jAm1B210ruEK5gDd@vger.kernel.org
X-Gm-Message-State: AOJu0YwMHvD1iDeOhGvySyNQd3SvpWLTaTle8xJCoW2FtKawPwVid0rU
	PWFAHkTuOdjiHq2oMuTe3e9JfF7nOip6aCA4gC8Jud4m6Bm4AgxQc93d
X-Gm-Gg: AR+sD13+Wo3b1X3da+HmF7CdFWXS1QKDKEUQd04ilK/nNM7txOEUZMSi36eJSgCZQCN
	U3TSfCXC75az5Nt/IPqRKubbjNBo3Ane4Ld9Twzf+J+Zcy4ugeHJyIx+lKqX0ie48wDSQTl38L4
	wG1jOOAmlggqXN0AjUxdyJkVqX9QTph7rULUVoDUMaBrUyPMZBiR09+x9zpxsptpUinecmdtOJd
	4b/yLOv5ywJEul2ZCBZiZw1w3XwjotgcaZXqeV5cfHYiedEnTmXnqt3gg3ZeLytsfUXW+KYkRDq
	yI0jBmrNkzWXUtpAdYEAnpv4YOUHn9TS5EwEY+n+p08zw0ydCHmezohvauTPgykztRKkFXnyxda
	xMSY/dESBQ1Tw6txmhMgxnzBQU9to8eZxguHouFcs2ZISdY1AayaS1b6flULoErWSkNyC5FlXKi
	H81Kr4006oOal8CZVzXV8m3bKgL+9uuw0SKurGIsEKhghlXG1Gj0uNZPhk1ks0dk89i+FoZSark
	3jnvnATLkYJ02jv/CnuiG9tZhbB0cJIM/mpQLYY3cVuKztWG2wO2xfBuWJLdJhwXVWv7FDccOpS
	9yzLljaJNbTTL33DFPDZKks+ochvKLFVKkABxAbEuUJheTjySkDBtz5+My/1cHxtGbKhqTa3+8x
	gH1Q2AiMRWsxvRsnE
X-Received: by 2002:a4a:ee12:0:b0:6a0:a791:6885 with SMTP id 006d021491bc7-6ae96ed36f7mr2063730eaf.23.1785896910119;
        Tue, 04 Aug 2026 19:28:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:00 -0600
Subject: [PATCH net-next v2 2/8] dt-bindings: mfd: x-powers: add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-2-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, the four package supplies
and its optional Ethernet PHY control child. The input clock must run at
24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded by
the documented EPHY clock selector.

Interrupt-controller and TV-encoder calibration properties can be added
with the child functions which consume them; the initial binding covers
only the common core and Ethernet control child implemented here.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..4ea56e99c370
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+            };
+        };
+    };
+...

-- 
2.53.0

