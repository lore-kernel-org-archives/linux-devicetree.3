Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B23126DA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406016; cv=none; b=QNUw+/ewBwHp570L/cO7nJT2W5i03T23sJwFuyTj5kXcHp3p0RhjCaZIjqkKWqoKCjolAJbm5O+UD5pc0kkB9zHzWLogKMvFX2Yg25h3j9KQGwYTc9jyojYhhJ27lASmi5T151LCygY6FoEWk9nZAFeFgyyB7fq282tau1fDwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406016; c=relaxed/simple;
	bh=eWPy+VzuovJm+ElD2gK6/fOIlHy+EasXmbIJDRlJmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9H+R7vwO1Q16dJxBdp8oZx7JouzNELqtU1zFoY8yyp+tdNkKwoFRUgxoNMHDhQMPqLgehXOL/fh6sXgk4KVBwMcZIueKhfJ/ywZ5N/2mzqoW6y0WZ34t+TsQ7qg48TRSt7ay9ANKR+eFL/H8ykR3uuYxz98puxQ2j85RcUw4oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvWJ3mfB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvWJ3mfB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso10544995e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780406014; x=1781010814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTfcCRizo1BCoCuZvjrGsrottsZL+2Hdq3AL0290nzE=;
        b=MvWJ3mfB+zivYWrpj9uxYW0OOM8dcNtNZIbJqE46l8Ej89uSmkKCHKqrFcNbjO53ri
         zNI1NJhM4SGQPAIdiD5mKoBOcOfFgj0Ivb2r0a1kSpyQ4BXntEavxrEpZ9KOi0p31+RJ
         prdc7tSXRlZ6nDT590WBeSPWyKf9U5XKqiaoMyQ4GXVTgADfjrHL39LDqcmnB2ZaLLOU
         lRzTn2F1LOCVk+aU4fxz/VL01gGu7tcWXsjUjuHHsOzxDa57R/I9kUNBuIzUE6XuU2FP
         ipGNk82+tgTbJxePfGRPqv0EJ/H6zjE2jhly8zOuWaOAKWHIQbWMqYpa31eZMb16BfFM
         6COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780406014; x=1781010814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTfcCRizo1BCoCuZvjrGsrottsZL+2Hdq3AL0290nzE=;
        b=m3yG12zURxwEr8HleIOboz6NngWT2O7FYTbMNEfAfjpmyS8/O1Bzn6rK6pi6chofdj
         AUxUrQ63wqmj6tVI7JDoj+Mz1Zy+7rI60jhwlxBT/yWgR9Z6HYQN7sToYmJw2j3vPQg5
         cDbmCbsjme/tkNsTu/rxuWssJnWWmNiT7XQpyRDFNga81/hwbBD0eJgatTLCph2HfR7b
         tsnN8k6oajiP9880t8fuaJjuZLBSYmYN3T/3pEoQzLRUtGt9Orkh1SPXAslS665cMRLQ
         DwtcdsNeM18dahq+Nkbnuwy7wA8fXI5Pl9Q1ZBmviXqrlNRhLtsIrQUJSvmlvxJd9z4I
         sKeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DA26uN1QvKbmZPwpQRM85oarq8wPEi47Wl2jAanV4u3+aNVrHTiMjv0n+TdHrKuat2jKGTk9w+1yg@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBOn4K185Na2u0Bk5mBkoUXk5DSEh8WKKIvxS03CUfsz8wFW3
	39rKKe47X3EK7jweNyrhLS7TrYmrF0zrwgLJGsxA0FkXK8sPhBXWUnW1
X-Gm-Gg: Acq92OHc8KyCc4y3MFNKwNHlrtUou5bOR2ONcKg8WXQR3tWEumBbBn+ZZmYFJAp1bdl
	e6a86vfSjdWrct7Fy9fUkF269ABQkFalM6omV/BZ1y8/NzZCOxShS8gG7QJw4ZDcCHhqg5gNRVF
	70lJBunj2sV+dYWTJujKxDzWlAKRim7tiyTfsOfLRJZUvj0016QsmR6aMfX2kSx9k+8dLynrsFZ
	oXmRfCtSwMGHLLCsXKPJKqI4/h7RuG15+GGFnLg1oi2q1hHgQ0UgsxufpHsETQN0OYMgc0hd5yZ
	f9a1sZbQQBuAS7DIeLl4g6oXgzpcau1u3KNzFV8D1UTZeoLjOUWqIWEkg/dj69PyrdPp2IU0Oou
	ilBm4fcJNpBQMpoyr8dxpi64oBFhpC8VHN3aUSkzKPdtwSeDqd+z+X+ESjn2opJNRh25p9ERfYN
	U40X0TdmOKlCCqctmLH+gcdJrdaKYUVHUl8xCfLrujMA==
X-Received: by 2002:a05:600d:6405:10b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490b0ea300dmr44802245e9.15.1780406013876;
        Tue, 02 Jun 2026 06:13:33 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:dd72:88d8:481a:904e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13f91sm86589155e9.3.2026.06.02.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:13:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: mfd: syscon: Make ranges required for renesas,r9a08g046-lvds-cmn
Date: Tue,  2 Jun 2026 14:13:29 +0100
Message-ID: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a conditional schema rule to the syscon bindings that requires the
ranges property when the compatible string contains
renesas,r9a08g046-lvds-cmn. This ensures the LVDS common control block
on the RZ/G3L SoC correctly declares its address translation, as the
device has child nodes that need a valid ranges mapping to be described
in the device tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..cbf83a06ae25 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -269,6 +269,8 @@ properties:
   resets:
     maxItems: 1
 
+  ranges: true
+
 required:
   - compatible
   - reg
@@ -276,6 +278,18 @@ required:
 allOf:
   - $ref: syscon-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-lvds-cmn
+    then:
+      properties:
+        ranges: true
+
+      required:
+        - ranges
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0

