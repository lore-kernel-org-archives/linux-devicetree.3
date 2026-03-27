Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F13382C5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608240; cv=none; b=oThxRWlJBHsHAyLlQOpCed31j3b/6Y98DAs4AnrepjQsEAuCThP7tUe0osP8DtmQQFJJ7vk1yIxNNF4T9qPkBcLcF7u5sBfR081zaXNdDQpz69Wkpx6hEUT8eg1Ci5wj7R9Z8jEpHmO20QhcoFde0Jv9gUUXFR4RYR5E+12gcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608240; c=relaxed/simple;
	bh=8nDSaQ9yh5sX/LNbeWU3JPTcKvJG5g3U7V8KOz6vZlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFGedcH3kujnFZUqPpI1kXWl4W1rqk+aT+n96e3mZFErUzssU+mpbSNyHXNErfLbV9wV0g4fCi4jfi+qm8Xn2FGkejG3Hz0y/cQAHABYvR3GB+6r5Y2sAVBqoYB7zj9UUk3zPAfGPGiYMF6UWEIBD2VXbjFZ2dv8c8YCdaEjjs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsq8qK4O; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsq8qK4O"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1322512a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774608239; x=1775213039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T//emRgjlf+DHICLtYqhu9ByJoYsw0eSIEd3mLPHOo0=;
        b=Gsq8qK4OxkqPs1Q1M5fmBMg0SehzIy1bVy46ADHVl9XcUmQMygEefOjtyhnxtH44yx
         OYiZDEtif4SY2B6w8BvCx83Vmpu0EE+Xu+Esg8/MoZZx3gmoS4xk5GBG2QaIjoGYXUUo
         2rpSSd/hQeU6AGHks2gU+tZMi4tpX4z7l8laLG2I6Fx8JxWxB0qDEa9Dp7nqYEIr6Nfr
         VQqrQtYtZzagYbHRgWS+3fTI/HHJNOYuAef6hFQYa4Baur7xb9cKQB1GGyOWcBoECWWm
         KwVu76T8rOtOtN+s2QWuzjhjYJjZpTtSNZYUuMeJQTPYmLmFvmgZITxHFk6Q8LfNXgO2
         QM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608239; x=1775213039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T//emRgjlf+DHICLtYqhu9ByJoYsw0eSIEd3mLPHOo0=;
        b=oLDcX0aPmdMbZjzbGQYBBEmL4M4WxBuIg8DK/xa0sur+S2d66HeMDoFYXDCzZCct+A
         kUrrAliMpR6LZwYhsh2nYLOj7Rg827Z24RC4OGjM86tuRjq1DD+4COJbcGxZQ9/0RcLb
         QVuNGI/mSBL1ZCATlsb2g36+Q4xvXZ865OEx3aTnnezgDnmGV9fzwZg1zGEComZbE+5M
         CtB/sispRFelRKwWuAU5i5UyKnmu3B/Iu4o+pnLLTUGjEVoqGW1nWHHjulZn34xADsuP
         VokXIBccmpwnxCfifEjIvd+mrCCvZtuz8W7eLrsvR89BhV+axXbi/XFHQV9KFOaqykKi
         3NMw==
X-Forwarded-Encrypted: i=1; AJvYcCWqJC8Swu0HF8DFscNCWHqfSZ2RL5RS+Ft1wjH4qTyTgGuxWX4r2iCOWv2jcFTK2d5PKi3vED8WP8EP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLEdO7IU2wro0+qcKkxCbvHay/O9l3M4kqIyNE2+UP4C3CeIc
	yOErOvoeD1bCNIhEIE6+d7UYKFk5SrcMMLaDxDp2Ms6mg4y/BZ4K+TN+
X-Gm-Gg: ATEYQzzT84RFM5JWGm+MUmxurQtGmrqiQEjhZF8/jEby76jY1wvrQnF6vzO8QHDoCh1
	zjvOZZv6rTl4PGqXY3fJyZvW04lN8AP3PsPUP3p6MEeGNb3bjfwhJTJEjWDI2y5sueIknFxlkuQ
	AamUQel/yrSxyaYh7QD+wSPNLbGG7H578P5xAFIRmZq9+fdF4kOLu6ER+HlRdFD0pi8An96YhZ4
	JC8h9O80iNXzFGPt17CTJqW4wHVJRDK4PYy0/jPmUI4LdJBRSQiomlmA4Kh/gSsi0XaBF5Sf7Wq
	ncNn4UT8b0gnAvezYs50ZS5kk5UxRP7vnyUjOym2JW2kvtcWIe+4wkh3JcsLgjuOu4BoSt4jhOf
	q1bKBx1jl0CKG92K+HWgFw8WuUQ6b5Um+MFPm5peRkHR+rZrKC4rjHJZV/TFF2xMZzOFpjjzSc8
	rh53Yc0wgMu+NsisVBSczGNhX4EmoRfTQ3EpDk
X-Received: by 2002:a17:902:ef4c:b0:2b0:6b98:59ec with SMTP id d9443c01a7336-2b0cdd3ed8emr23434745ad.34.1774608238550;
        Fri, 27 Mar 2026 03:43:58 -0700 (PDT)
Received: from padmashree.. ([2401:4900:62f2:6b89:b220:bfce:656:5671])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm69459255ad.26.2026.03.27.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:43:58 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl to DT Schema
Date: Fri, 27 Mar 2026 16:13:44 +0530
Message-ID: <20260327104344.578113-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
 .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
deleted file mode 100644
index 8781073029e9..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Marvell Armada 38x CA9 MPcore SoC Controller
-============================================
-
-Required properties:
-
-- compatible: Should be "marvell,armada-380-mpcore-soc-ctrl".
-
-- reg: should be the register base and length as documented in the
-  datasheet for the CA9 MPcore SoC Control registers
-
-mpcore-soc-ctrl@20d20 {
-	compatible = "marvell,armada-380-mpcore-soc-ctrl";
-	reg = <0x20d20 0x6c>;
-};
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
new file mode 100644
index 000000000000..a897d4ba4e32
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/armada-380-mpcore-soc-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 38x CA9 MPcore SoC Controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    const: marvell,armada-380-mpcore-soc-ctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    mpcore-soc-ctrl@20d20 {
+        compatible = "marvell,armada-380-mpcore-soc-ctrl";
+        reg = <0x20d20 0x6c>;
+    };
-- 
2.43.0

