Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B73B583E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866257; cv=none; b=TKCW82ItxoPS5jziN1YrejNsfDFq5O4RW9IWf1EKvOwZf5z0yxiYA8UrLCkWJz2ltqCtBewA0VukvE6JHwicOr5eANWH8cM8zjzh0iDy+/yu44y0viIygM+eMXAq+KIqUJ1z3xvFcnXjr6e5mwu2Ap8CiI+DiX5FA+YTXaCug94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866257; c=relaxed/simple;
	bh=WIm6RubI/tLAJHS5ewOY+I8EBIbSNInquvgffjL+6y0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j67bhMsn0LMdkniiEXLIv+9+I2aO1JHvAeL2Ut1YFYeSuFSJn0nmwJro2C9tgY1mIiIwljwgyhWUoxdu3GfWfByagN7w2n1+Zm1s9nklTHlwTPNcnWH4IZpCqbcxgdO19YXZF1egyg4OOYIii3OvluDKmfQWhAablELNIiU8xIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7yMvNwI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7yMvNwI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d9827661bso765039a91.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866256; x=1775471056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMUKD+43+H0oR5S99IJHORhT0x6zEEBwVqT64sGew7c=;
        b=Z7yMvNwIj9ZZR6Q1eCXleC13Ad5Dn+ncnOAM68ke5c5pvUXMyAz8f3Rjo5jJ+INtKt
         7MSyMYhOs8WZ2mNgncSOw1TkpOs2Ie76kchs9MYCc5CDkTTGBx89S9eZFc38aoflGGOQ
         K7PEJy1Bi/CEDKCh46Sea3g64/ZLBiTZhkixghbn4vmneKuGKLgu1IH0pY3tHgRQK6a9
         JAV4VI/yKlAMVtN49Aw/IOncktTy31saoUyDQ1ZFK6zrTQB/VnQgVkqlp9jQH28kOKaI
         G4NrvOOn5zmSpkOowWAezj+FwuWVnxrzDSvgBGzTRVpzmGm4hqPWD5McZ4X5marYKLrk
         iFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866256; x=1775471056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMUKD+43+H0oR5S99IJHORhT0x6zEEBwVqT64sGew7c=;
        b=ED7OR98VQi86i5m6602q8tykb4Ug+jffXk/aXJxU+ztbj2BDObOvtCxaANHOU9sgym
         ZUsMCBdQ3hlJUu3urN8Pbj1XatXfDGPW8fPYPcR6sGb0JDaVnBysVd36c4rIfaZKwG9v
         yTkLpkH1w2Zl2BRmVx2BZHUdRoBmOpfurVVc8sD24Pva+EUyYEFXQ0MeltRXYjgQaBWb
         0AGUY+6OlxDF/bapdVMPbBBKbtv5A8sNPjFO19enA61Bb0P53lp2ul9Z9PDkOFdUUX0Q
         CIBnm4dGXeUuLPXxnfk8/DuCcHkvSQ35LdSfdYXxhQIVm5o92Sj4BYAeLpzmivDWMaIX
         fucg==
X-Forwarded-Encrypted: i=1; AJvYcCXWRFUaWQR2DfYqYpBtxgeoCWH30jeb1gdJF6JmU6RfmQUNj9RjSjKoIYsiVig2wWQTOWi8T2V2VbI9@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAhVyKJj2Z64l3Xao1XzKpsMGDUw4YbcPQZeZJ7PXHJd76cCX
	aGrt/aHdL788zjS90uNdhvO4hpuUoTcma/clJJBq9PFbJ8DqAy2ulK3d
X-Gm-Gg: ATEYQzz6ZBkx2vmUSbB6QynbgZdUGcy/h1541A5VewACBDvcEZr4NXkdNWwN2WXgvFI
	sXMhZNCVHBvWGViUrGhppRbSm5oDZull/ecgns1rFtC+DXaJqX7NOMJ1+iqzUFmywIzFyDndwOR
	70ldN3263cjGN+OA3apj7I5/ZF3w1gyNAcxq9jxCRLhWgMmOBPBfgzVwg0EOaEMIIiPaQFYa0Ov
	fVnXovqptomAuJ7Lx4j+jJ/Ev1FBzPyzWN/PLClkdVn0zKhoTmj6pWZXcitLTwYZTSLAKDj88zs
	IOYFhfR9BiEIzFGnNxZxY0yY4fVSHg2XMKpTjvTJQ9BMIPzMp4Y+wUjRklO0fbwDnJIuC+kntUy
	8qkumrS8dms/3xMaCkDhS7qZJMIsCeY9caZ0WtMWbtUgX+1s8LH7icyhLd7KgjwbAjK/3CMn71G
	KjeHlnyqHh1Qab03hGgLYvF4gqidGX0S/bSZ163MpaBf7EfA==
X-Received: by 2002:a17:90b:39cc:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-35c2ffd0ec7mr11801460a91.8.1774866255957;
        Mon, 30 Mar 2026 03:24:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93c7:f319:97ce:1434:43e8:eab7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da9ef1b70sm2487452a91.16.2026.03.30.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:24:15 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Mon, 30 Mar 2026 15:53:44 +0530
Message-Id: <20260330102345.37065-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---

This patch introduces a YAML schema describing the required and optional
properties for the XDP720 eFuse device node. It includes details on the
compatible string, register mapping, and rimon-micro-ohms(RIMON).

The RIMON resistance is installed between the Imon pin and the ground
reference.
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..09249a326eee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 is an eFuse with integrated  current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+   Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
+
+  reg:
+    maxItems: 1
+
+  infineon,rimon-micro-ohms:
+    description: |
+      The value of the RIMON resistor, in micro‑ohms, required to enable
+      the system’s over‑current protection.
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+        hwmon@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

