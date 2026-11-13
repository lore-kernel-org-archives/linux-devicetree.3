Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560412;
	b=AgSMDEjHH3Lrh3EJAVTfaVvTI/bB7d8LHV0vLshQz+k/oPMVFWkh4oqs1jMGsj/bdUjV
	 QhFFoAsNWBIZXPjK7a7vn522ONQZVNakDZGXNdbXHVSDmDJFraF+dqErvaYlGSFekrGQq
	 qVi8FjSAifxU/v9L7dygTsJz7ntiFUvSeAqJ3vcbNBl/iqnr7XXVUf/ZN/V5EG4+zZqwr
	 +mEF/xMRPjeCtan4iZMNTVlf3JoxlsqlRiRaz+VmBb9JuEhyAYnPOjz9hFOQx/DDn/SjX
	 ywuOx9iJITteO0xli47GIc4kXu37mnZfRhnWjZi/O5Kg06KjGYKs+c9EN2bEbn40gzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
	b=XIzU/pf0+7O3Dl5Ong+fRG6yu09fB3K3Cx/NJnHHG8d4l2Jq6TcZkZBZ0vVzcu9+dq32
	 wi4pKjE7rSDjmGHkWaMZ1TACd2d7PvDwf1z8IksbOpl3rlYxtOdaqqs2mC6IgHYc9z/Gr
	 cP61ZHeIeHUtSTC3rwI/AsAKIWwzzFt7Nmx9Ah7Ok436ydGxY/40duGlO5xM/9NsuG0b0
	 2qtcLgQPNg4JIrG8DU7UFYglHZBcCwEGnUca+bEbetAjbPo73TjunQnmgPkOuOMS7i++H
	 g11zySHgmNs4lv5hV0FgKTaiE6oJxyvjaIOaCEmDFNLEiAWQZrG63SGSf/oWQ6eqo8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wo4k2G9C;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00357606A893
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00357606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wo4k2G9C
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb18f4da15so4085755ad.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560411; x=1795165211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=wo4k2G9Ch+TdfLfKs3LSzSmoXQG/4x9YfDkSpb7CG24WR2mcPTjIJuoR6KK0Tvq81H
         9hks5LOa5Eowl5fFrARTQyvR3ttBVXQHLLqyRTJWvPgJ8Qo2Wh2JU7Ydef/nrAET9D4t
         qintq2fx9FyCfJzlqBNAWXfJtgd0kjo8hl3+yInmg4qfq1J/u0HVDFEs3UFnxR1ndR3i
         erkae8PQHbdcTmEBhagTbda6IExPwxCULbsjQYNYWy/b2NHAQpAAgYYTsE2T9ps3T2Ql
         whhWtevMFy8kw/Z8r2KlTkH+7cBJ2/TxRSYRhWTZRj+o/oeXAxEPPXSbHM5F6pUCyWac
         EelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560411; x=1795165211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=Pokled4bjRqH/xdlNFI1ao3ezUnJH6nm8aJPQVxg4w8pZaXT4tWN+Dv2g4HXnNy6UP
         Oqr5P+Zmika5MhwAi4aKWCacAs3Si3KRY88uH86bCw4vGF/YyCuoK/ksjNb2VxzSIQcE
         V3b1G0OvcK5FAZ0JmxZmI4JOK1h8bGUiGYHKRFwy57257RtqbEE0Zop7Vki4bx0F17Lf
         mf9ckxbGcUtaqcNHgnQwKYuaAJ2r4Fn+F9kSmWHh8IBpSvckOBB4arJAi3EW2T+e86m6
         hqeWd/Eu7QSa8BMbfMwtHQYVi23pv705a/HEP96zBn8peDnv7qOuZy2YB7OhBw3LVLQn
         xsrA==
X-Forwarded-Encrypted: i=1; AL+hErFk9EDDYQTZNaIMwqrqj9U+ant3X+y41LUcwCWnlScKR096fEVIamALheHsfVdNvM8SJZTJFVAOyj99@vger.kernel.org
X-Gm-Message-State: APuU4Z90ED2Ub1PmhNwJ+Wip2IGzBPa7plf7CRnlg5aH+3BS48gN+yzA
	Z9angMozA57dL28PAGvzAPd6Emu9KGdZMdcydDrkBr5q2yEA6PXayCfd
X-Gm-Gg: AYBFou39wv3IqEZ3blykc0yaKea97mOTvjKhHxhgolOAGnQyt1CHf7Nt1NHdcTBZ9+3
	M83SUFm8VzagboVRw1m2cxdRIheXNEZOlFCSG1zzq5ciluuSvLa1xbrdX14sk+fdhWbAvS8pY2Y
	9qudyqRoUg7E9sK0Esvmu+zBG6Nfq5+eCeiUJzI1reo+ounpSnaSS4lbBernHfFaAxamPrIMAK6
	XN6dAvMrvGaIm40I5OyBtBvTQZWfw/tjjOx3436yV/2xdl5I8prLuF8vqlAFiyF1VfRMpB7c3mw
	ETWkyJf6kfPilvGnFPKJaCqUdwofwLRtIQIQdMsb8IIbrwCKTy4dfSVKNogjuoNnQ4thVC2cWmk
	rpPbX54bLKk0vVgS9wY7MgOaEAzPSecybl+YNKuBKUUtoAjqhC2hIMUVkbqOnh0eubfKU4UIhA3
	81hLOQjXABw7V+oBYbfssW+XIAg5UJJwlUCqCy273W1hMenwJy1qnBlLSZoppcXREiMfbKSGX2a
	NBvFCjpji1IsjFJSRkm915Kp5Ysk2UmOwmH/rGTKnOsejTbWuy+YI/mObnlIrBJHih0NcIVmvdH
	pSvzVujpzHECh6OPRDew72vi2eyMtcI3MrpWZGiiBxSpY0ZZ9zT5BeYXCS/bAoN0cVpQBEh4Uh5
	gp406
X-Received: by 2002:a17:903:18e:b0:2e9:4bf3:37a1 with SMTP id d9443c01a7336-2ee0dd9fb88mr18714675ad.63.1794560411369;
        Fri, 13 Nov 2026 01:00:11 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc859sm6953055ad.59.2026.11.13.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:00:10 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fyhsueh4linux@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Fri, 13 Nov 2026 16:59:59 +0800
Message-ID: <20261113085959.32798-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
References: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
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
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..ff4f94166f0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,75 @@
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
+  - $ref: /schemas/input/input.yaml#
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
+  resets:
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
+  autorepeat: true
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
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk KPI_GATE>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <MATRIX_KEY(0, 0, KEY_1)
+                        MATRIX_KEY(1, 0, KEY_2)
+                        MATRIX_KEY(2, 0, KEY_3)
+                        MATRIX_KEY(3, 0, KEY_4)>;
+    };
-- 
2.43.0

