Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A39435A9F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418283; cv=none; b=LmOFtyRqMBQRxoHjL+bGD/m0o6nC6gq3HyMjLUhELIDD1kXiYrh3yJTJ3mrSWYdF3FyHOgSAZqnbDhHnO6VRxrtwV454absRtvHcysNdrSK7e5UM9/onsiaghWexX7UXK9Zloto8QrMtMDsHv9161cTuCYYsTUzHvNO2j+bPA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418283; c=relaxed/simple;
	bh=icF+OEw7L9PrAa01YQ7jfE3TPmwZ0NhswpUSw9RzKts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XulkoBLZqlQs6z4b/KEkr2WiQeLrqnNYgd4e1k/3lJGcb6waxSzurPEC3nyXxCyUTnWyrXZL6ZbJeUGDJoVCuRcwVBWeWRFiHLf64LFY/2bqeYVVWC40a40MBNJh0PU1RhezqMyATgeA6TVVwBK9rTZ9KAEpGMyagfr3hhrizcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX4LOeWv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX4LOeWv"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso877130a12.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785418281; x=1786023081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwXhSYKJcGy1lCzsCfGX27GjbZs8eEFVFEYjgqpuu5A=;
        b=PX4LOeWvN2YXvSlOMdNErEunmWYvMvlfdroI4F2TQioF39sW0xgQX3ngZOEvcJe8D8
         UVu3nwht/T2DOh/g2cqnQo1yh7syp3X1wqa4CfS0UkvBYoCDDp2AZFWYZCpdoRWKZLO2
         3x8eTPLQEcy/FR9Rr6eFqsVt4tvDx8d2bdDfcIi9X0E54viz0fij61pnykESoH2+W5zC
         c9ott9A1qW/mVMv5waRpnWRKb3BO2CFh7FgXGp9FFG4KLTHvodDvFnIV9S8W1QB6GrDn
         iLU5b5hsbcwMOSs5gZwsxMz/Qc/XRq8xR3MhGRG2QlxaGQLDODdk4q3fk89DHio2NNL4
         pFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418281; x=1786023081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwXhSYKJcGy1lCzsCfGX27GjbZs8eEFVFEYjgqpuu5A=;
        b=VlROw4GadOYBlriQ0sIZejls8/xmD7WvHUwLCX+CFC5t8uPZXEA0ZPx5tPwX09LCyB
         L4OxonrlHL1dbb/eMa5sybGoDihDUiVjsvTtvhGob5i+fm9ATonlyaEWI0pWDsjg1InS
         g7yVBtnGd9Qmmq7Uh/966BS71KN86wCBQLwHYSNShWlV3/seDuh19ZuwmwdmyAWvO2Al
         Pa4mo2kaPKQrhBtr6izNc6tgHqV4xRFGCS7Q+wohjTnkUFm7+On0eCdqILy2OvtqXTTr
         Yy0GmNpqp8z9njzCTUJp/tGeng+ggZLGuzEph7D/4F0IT/znSNK4jTuSwrNC95KA+3ws
         xRhg==
X-Gm-Message-State: AOJu0Yxsch67r9bKnG1QU4X2KSLunAFyth2wySvs7b4d/k/mfKeK2dcJ
	Nh4mq8oCBAIQ8hvWLQEprvSv82D0d/NaCpiedhJmVnuXJG0rhdtvzREsDrxII8cZ
X-Gm-Gg: AR+sD11g5zwNYtgT8LBfraKWJ/66oTx6nx2tzMt4xmL5y2aYYPBZBswvQ5sdD52VmKz
	ZYfDPgM/5a/9mwDljJJNQfBrWDiptfaVTlSrtjOqM7J1n0buTpYzTPDyQWr5c0yWTNQso9yAQLU
	aMvDv/NgmKdl812meJ3wwNUF/8TswENL5Iu2g7vnj9+1f4fVfIgV7JncrlaJgcLg2bBXjjFsYpo
	sr9eOV4QnOsJRwG8wdyUh72yEaajH5u4OGaAdhD8ZNDaAa2o0vj7uExUu00beZAaJUhiGlWqeTg
	vZAJb+D+ES4Tdaa2CatE0JhHli+osBlaaoGoIubWXoNGtvIzzzmcsHuHMCROiCr5MMgCVNPqdTx
	Pi9ms4NJN68PUwwFuZL8cFHoRAikf/qd1Cj2hL47IYn7M07I/NM4VAoRJoh12FG3+K1PltI2dyg
	Jak2aO4peP7IYoMDpstk+cTqgt2FxTV4ZABeapg2yJZX3Q+699Hx1goQLNXAflUGsfIl8fFaiGt
	mQpblmill7LA4gc23OQolg7Ml6DjK66hke6SSz9tQeD1w==
X-Received: by 2002:a05:6402:34cf:b0:698:8830:70c5 with SMTP id 4fb4d7f45d1cf-6a07b7c3cacmr1264732a12.14.1785418280330;
        Thu, 30 Jul 2026 06:31:20 -0700 (PDT)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d393c48sm565891a12.24.2026.07.30.06.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:31:19 -0700 (PDT)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: ti,tmp401: Add label property
Date: Thu, 30 Jul 2026 15:30:57 +0200
Message-ID: <20260730133058.14731-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional channel label property similar to other
hwmon devices.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
index 0e8ddf0ad789..345ab6203a54 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
@@ -30,6 +30,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   ti,extended-range-enable:
     description:
       When set, this sensor measures over extended temperature range.
@@ -50,6 +56,26 @@ properties:
     minimum: 0
     maximum: 15
 
+patternProperties:
+  "^channel@([0-2])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-2 are remote channels.
+        items:
+          minimum: 0
+          maximum: 2
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 allOf:
   - if:
       properties:
@@ -72,6 +98,16 @@ allOf:
       properties:
         ti,beta-compensation: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ti,tmp432
+    then:
+      properties:
+        channel@2: false
+
 required:
   - compatible
   - reg
@@ -102,3 +138,25 @@ examples:
         ti,beta-compensation = <0x7>;
       };
     };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4c {
+        compatible = "ti,tmp431";
+        reg = <0x4c>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0x0>;
+          label = "front";
+        };
+
+        channel@1 {
+          reg = <0x1>;
+          label = "back";
+        };
+      };
+    };

base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
-- 
2.55.0

