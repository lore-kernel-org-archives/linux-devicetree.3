Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894049;
	b=pAtbexKGQ5w/toMSrRUprBIq+roHti3XqhbFCS8gD8k7j2MsC0yGplfYIbJHX7CF8DVu
	 VHUmMiejTarPWuoFgdpHL9xg2y5/0e2e22FXxM1ZR0NxoG5T+Pirzwz3jiiNCrlDpDZ0Q
	 W+TA+h+R6g6jPuB9aRVRsvKx/3aiMU9+dTYQ73eayV+r7IOQvUHcGGSGjtR99M0QSQroC
	 OfGpJpRb4Udk7ah8DzQtu62GRo3R3W8Af+uwJMxayBvKTyFcNtwyUKGLfKAxjfwWB4wly
	 F7O3hTR+6V8JiuWKTfBfSgXLEUN2WmNY0nGiMsqAmsjlXmVAAAwbisV6RbLxXknPHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
	b=S23PcwwZVbILJwjNRzwu4HY+GjANiDVQv1nXUKRImEpJJ6Uzk1cYCh5BaNQQA7CuR5PH
	 w5kBoa5IsTdyGIPsOVPts3fUiaxWsHrU3tphIRSOGAzAK6Qm2roresUJ5rzev6MhYyseU
	 vWgiWZtqWMkWOgg3+0U3c0Kr4zAUwT1a8hTD0Lv6xgAXG93dfQ5KAuQAonx0crIb6rLHo
	 M+b7y7Wy09whd0hDK+9IxwmeqT/fDZ6AuXbITyqWgp2lTLGzA7ao1AKl79UU0zBOarXjm
	 3RZ1J882IUCw/7QdNVhgeJyO2t4hHgluHtNEdJKO7cqLXiMRLod6asYbaD6R8t2fFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugt04DdM;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C991606A621
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C991606A621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugt04DdM
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso949266a12.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894043; x=1794498843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
        b=Ugt04DdMvXNIQi3CXkpq6YOCaNigKtVrwiH+cApbnptfKsc3875hQ8SLzdVvHnp1BT
         dDJKJlt57BhJ/VRTJXF34zczoA/aVp5goduL7Ghdh5Us3RrGs3LoOL/AsaVHnWTxn1Yt
         yWCn/Vb3vePRNkG3+cBgdBmV0XE4n0miN8b5mHWpzbyQRZ2XIoBZaiF0Iq54jw5ycBTL
         atYFmOBbhhDiuO4wc3GLBxcxNsj/EgNPc8K2pi9jYNhuIshsfZQ5kGY9JrzJy83XlDZ9
         Tbp26ETT/OdIgT2qr2LwwoiTDpKy9aEYZyrTmyiBc9jmm/JdJlTVst3dMSpSWDKet7UW
         vIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894043; x=1794498843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
        b=iH/SXR3vSUwZ6vd9OZecJ446BFz/qgvba63l8p4L5HJQ5fWZziCjm1WVC7O2d8/1iP
         xB9VsnHjsdUAg4EfcIhOnOPazzYXf6ARsDcOvlXmArMuZzK9uTGRg9vm2U8BN/v2bjhh
         OZG8LsAR65jmBml5nk7uajxk9Mr8zMyAzaRd4upKcbgJ2LiKm+PU3+wjPqnQBK56qwDo
         r6opNse7TI6mO9L0iHAWy5qOtficweilAopnBhJKUkhCgZAuPuuvsegJXuGz5s5ERnck
         UoSxVDancJDo94VJo5ztbkzty+9imKDazfbWpaPbV4kSa/44ZnA0Py6fc/K0qtSFOyXK
         Cu+g==
X-Forwarded-Encrypted: i=1; AKwUvBy9oIgh5+Zg2Z8j+u/eAJiJlsTMQIu7k47ZRoQJSgAEbWWLKq5qeC0DcBhHkuqyyrsE55v93xEXKOAK@vger.kernel.org
X-Gm-Message-State: APuU4Z+CTnODt23tJ46+6DWnrzpweTzQyH2eUL++OqJ7xJ6kyAs9IWf+
	fvpU2T2p6/ylp+DOuLSBZt03ikBzeH8vekxuhuQsD/Ym4pv+ZEEYjH12
X-Gm-Gg: AYBFou2umo3w18x4NnlNlyLtwQiVKgel2H2y8eSWqLh1VXoCoexJUsOPSgKw8FxROPU
	nKyuQ2V9vj7KlplC5ZjkMCKdsn/t3mU4+nkG72lwlSgYY66n3Nk7lag6ZoXuD+a/L/zCk6e8hui
	SA8Wi5lOVyfj6oJClNzS83BjgBDfq1O/RZSo5KHNwrqdO1URJEimATrhZn6EHP5Ru29Dnd0bX5V
	e6duBNBdP+2V7aGGz45Sq0ndX2POi3Ao+9KdWJIZQv9Ybp/86XSsR+u/q/8QusU/qPq23WsYdIw
	FJjS0qQ7DOgtq0Ffu53unfb9M/9+3EVIEx4Nxaqq4MbxfOR3zynJwQfQpnyp91CAZPxqDS7pXb9
	nvF2TcVmNSJBAJyhXjg5bDyvD1Pfptlyge99vZnAiw4Z6tnnwcXtymBmRJ/YYQEVHOpkOCLiLD4
	hwI+hhMEF71zaJrMhKZbRkNdzIyonstaTey9FI7PDPZEJ0rM2nXTij9yt5bMXCnCB1h4uLyTpFU
	QY8OMZ+c+wKXwWLTfX9HFs=
X-Received: by 2002:a17:90b:4b90:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ae89851099mr16476018a91.52.1793894042835;
        Thu, 05 Nov 2026 07:54:02 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:816f:e3c3:bcdb:ef3c:2956])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm4518780a91.0.2026.11.05.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:54:02 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Date: Thu, 05 Nov 2026 21:23:47 +0530
Subject: [PATCH 1/2] dt-bindings: iio: magnetometer: add Infineon
 TLE493D-W2B6
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-tle493d-v1-1-3246e91e6394@gmail.com>
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
In-Reply-To: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793894033; l=2848;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=FR1ySw/9hgFNGeOtC9yaVRejdNXl5U2rc2d5645AYE8=;
 b=ntwaFkEjnDHWypKRs0NxTxwu1QSP1xhgCTyTbCwd1OAgwx3t9TnJha+6oOgDTsPg4rA7tdYPf
 Y+fa81qBonxC/rkt5+A+zUBzE3QQJpP6QqS/vOgkxJHdZzHUwjSuw/P
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

Add a binding for the Infineon TLE493D-W2B6, a 3D Hall effect magnetic
sensor with 12-bit resolution per axis and an integrated temperature
sensor, accessed over I2C. The A0 to A3 variants of the part only differ
in their default I2C address, so a single compatible covers all of them.

The sensor's /INT output shares a pin with SCL and cannot be wired to an
interrupt controller as a separate line, so there is no interrupts
property.

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
 .../iio/magnetometer/infineon,tle493d-w2b6.yaml    | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
new file mode 100644
index 000000000000..46f9c0e77e24
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/infineon,tle493d-w2b6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TLE493D-W2B6 3D Magnetic Sensor
+
+maintainers:
+  - Viral Patel <viral8854@gmail.com>
+
+description: |
+  Infineon TLE493D-W2B6 3D Hall effect magnetic sensor with an I2C interface
+  and an integrated temperature sensor. The A0, A1, A2 and A3 variants only
+  differ in their default I2C address (0x35, 0x22, 0x78 and 0x44).
+
+  The sensor's /INT output shares a pin with SCL, so it cannot be routed to
+  an interrupt controller as a separate line. The binding therefore has no
+  interrupts property.
+
+properties:
+  compatible:
+    const: infineon,tle493d-w2b6
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@35 {
+            compatible = "infineon,tle493d-w2b6";
+            reg = <0x35>;
+            vdd-supply = <&vdd_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..c8916e1286d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13110,6 +13110,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
 F:	sound/soc/codecs/peb2466.c
 
+INFINEON TLE493D-W2B6 DRIVER
+M:	Viral Patel <viral8854@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
+
 INFINEON TLV493D Driver
 M:	Dixit Parmar <dixitparmar19@gmail.com>
 L:	linux-iio@vger.kernel.org

-- 
2.43.0

