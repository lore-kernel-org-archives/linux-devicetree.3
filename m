Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867E3FE367
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468990; cv=none; b=MLwXXtO6WbxF4C9zrVg9+vCPwJd8U5Vf7tR5nbZQtjrTf7ivW9Rbp89F1gCyuDTaxpkEKKb+tmK8/171DcfoAtOKxZRa++bI1yxH5HDLJ6pst90lQeyo2fp96hhD6W0uLMuKBKXP1ux6nL6/VcA9xR1vc5WQY5lMV2qKUMtmqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468990; c=relaxed/simple;
	bh=XI6T6E8eQ16tquB9SZpNeOdIKNi56M+uqkEzHvHoV1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glqFZtS9ADOTlaXhS06XZvjjSqwl3JaZEGMW1U/B/rszfriSRTanJNca5trM6tTt7T0+G2LheO7mmZDO/wyiWC/wJK+miBjHBxKGNzXoXJs3PpY7NSFcI/67jgyLJZoq7GfwdyDDdukMBWvcTkHpHljogv3PspM79eF27WlhTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVfmOJ9+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVfmOJ9+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f1f6103afso5887946b3a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468989; x=1778073789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60u99mHhTFmXU2vBmbXZTzoik2emfTfjOC7hf/f4LX0=;
        b=BVfmOJ9+YlHkKbVu54sKEb30VDVeFfA5aPiAIhdlajZ4Kn6Ai77RBaYpIHqyOofusP
         6y0FJvlXBqyZK2h0Q6dIG9pBLriHUgEa0/Io8XmF4pPUJlYJYrwxwblyItbEzs6MQ3Tj
         oHHHaRDEUUOihl76sfQJx5V32mAXCChfrBbQd7t41KH5kcijZe8fqg/krAHiMrLxD/p7
         OVw5n5mVtnndQxh7uPXkFO8fNDBfeHxttUD2sCQju7Hr92NEGpFTevo0gcn6l/GyWZ8W
         qQvhbLU/cK5GX5+wDLO+y/sWrK5QGto42oSUTbEs3TDXrr6ot5xLmAMCL/p7mjNEV3yI
         DnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468989; x=1778073789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60u99mHhTFmXU2vBmbXZTzoik2emfTfjOC7hf/f4LX0=;
        b=XgvhTiUU08WIMsKMRR9cLxMJjc5Jd3xR3AtaFZcSpADMzthDu8LRtNoX3QgSkLz3fn
         lRuEd6tBuQ5BSPwbiwIirjvQAtHc38jqngjBEv9cOasiT/jUj6oqJHzUZ5kGiBFv//G/
         ao+m0R971ZON7YUhGBk+PVy6xnsfQ+Cnys6vO4KtALJeXFp1ypExLnvRTOqYP/5faHKr
         yNCTpzzQ/LB/ddXEyRf0JIxdLo1825STCKgT9pyxsb3qbhuapGAx0QvhHshT7LrDbxCS
         sJKBlOQ6vpp3Mwmnfd8YOMJxNYZgyNCtpcTUS7d2C8iCHCYGazqkoqnJSjyFKhYTuAoa
         rJwg==
X-Forwarded-Encrypted: i=1; AFNElJ8zlgphKh2V1dmKsl6YBAAXmEdRE64MX1nF69FHzNYG29Vqq2suAGjbvnlUh9y1KNA04DHitNFSGqno@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpuxbS9O9V9byIMoacN3ocIWO9C2VW+lSx8BUI7tjl/tS9Ln0
	aJerdwMhBUrHFT+TV3lNucu2zzz8AnTeL+qXwwrH50uQNz2dfT6uD7dG
X-Gm-Gg: AeBDievDF1YJRN8A9d5B2nggcbScLv0n96OAA3XejW+DEtKEWmOAcUPtlpD8n6z7jSb
	Y6g30ODOHAbFRq4043+umUa72cLWRdRZnn3kDYZSeBdENZI/qqeP4H0YXRcH9SBSsWT4rXFUEwK
	7CAiu9WGB1HHOY5tHo8pTMOAxOY24oEvPZeSDmtPib5Gxn0jz47UjIua3BL/tTqIfD6U1Njo6dp
	9DTnZ2sSlrzRGSWCu0QphsPMWTtZM2thzvdBVl1m8vkYxWI46pNP1AknzAFXgzKOmsQIlMq9dMO
	TgJHbkDA/68DeRraRmDlnm8TM2F7AHg7muz41HAiY9qqF2ueyzllklVDXBFXz0Kh/PNANLrUTl0
	m4ohLqaFNc63+8tJ4wBcUHLL46nCKDhehqSRXg5KkxUvqx/xt2ilER2S3Tr1Vf/Uz8wCD2kUQQa
	iaiZI9GyW4t4KxybH0bGwEEWHK9H3clYGuh9523oMyD4TSFSaiYcWqreawVwAh6YRXN83i+SY8x
	JYZKwIdaXs9m9M=
X-Received: by 2002:a05:6a00:1911:b0:82a:6b97:34ae with SMTP id d2e1a72fcca58-834ddbefef5mr7957990b3a.32.1777468988794;
        Wed, 29 Apr 2026 06:23:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:4381:3859:fd0d:505e:362c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd407sm2091372b3a.13.2026.04.29.06.23.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Apr 2026 06:23:08 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: branstj@gmail.com,
	lars@metafoo.de,
	ojeda@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	igor.korotin.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH v2 3/4] dt-bindings: iio: position: add ams,as5600
Date: Wed, 29 Apr 2026 20:22:29 +0700
Message-ID: <20260429132234.30514-4-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 .../bindings/iio/position/ams,as5600.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/position/ams,as5600.yaml

diff --git a/Documentation/devicetree/bindings/iio/position/ams,as5600.yaml b/Documentation/devicetree/bindings/iio/position/ams,as5600.yaml
new file mode 100644
index 000000000000..d29543d85d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/position/ams,as5600.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/position/ams,as5600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ams AS5600 Magnetic Rotary Position Sensor
+
+maintainers:
+  - Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
+
+description: |
+  The ams AS5600 is a 12-bit programmable contactless
+  magnetic rotary position sensor communicating over I2C.
+  The device address is fixed at 0x36.
+
+properties:
+  compatible:
+    const: ams,as5600
+
+  reg:
+    const: 0x36
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        position-sensor@36 {
+            compatible = "ams,as5600";
+            reg = <0x36>;
+        };
+    };
-- 
2.50.0

