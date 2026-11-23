Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465582;
	b=RBbtiXrIqIGpyIXDuNOVILyen2zEHZhcAHjOIs+NgfnLK0KxIkyaJ7UlzR6Nz6E+jrNb
	 xEFwSny1c9sBFYfqQUZoRLTPQ/LngWKf8QNbxCmFy72QGu5JNX1Ejd0Z4hxTc0STWw3vK
	 xLBZOONZNbX2Hik6+7fLCHSDJkq64MGmCfeD+hauVnn8oJudJpzC8wH4jPDBLGewBAdtf
	 aK4s2aizL276KyIq8EGvq1js8KyBoYTcCC8QG+5tpEjd6sXXOn15Cq4GBOWUpCC79UIed
	 zpyKncoo8CJA0Od7LGUWcCQiS1SzCkGpwBRTsCWR8bAp7OA4E8mr4WWIga8Hqj7Ji5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=nOQB+3GN79pMDKjMOIKpArmtsywVobp1hgESd4Q5VVf4+Huu995xkT6LBs2tRsye2w9F
	 bvzzQcuS0RajAP1BtKThyyHWyTD8zYvej1hYKWP8CcjclRnlmLXQbKQl3j+7WNwH01ZBD
	 opQRgG7rdIPqkvsdD2T+BV6j+3iuihhzhSMABTeGy/RJ63IRzB2DPey7Xclze8qrHXR6y
	 J/drgm2jGxClYAhmuFgFvJUIZt/Sl/Wk3b3C8clWzoLjgLks5Li6QRNCRXzD2/jEtZTNY
	 mRgk2xaQE7Zf1qFQJTD1k7Mb4aSZd8SPVzVJYHfLti/2oB2974BknxNzH4EvU7lmb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FysIJprS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8E606A332
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B8E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FysIJprS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso42622395e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465580; x=1796070380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=FysIJprSQoRhm65u/m4uJ97MQ37OW0ApCwYwDghZ70EpscxF+jbQw+BXTVpUXGRSsT
         KQuDWTxeUz8Gy4ES7fNVLKaCGCfqSGP5AFG8t1u1VxSEHlcR2EizPwR3i/Q795lpe/no
         gEoouCw2q+jXoIrf64kAcU09XXCwoSJY3snC2BB4eDNjcCUwUrHUOkkgR2geEBAHNGP+
         Gkd7a4Dr6EUN/nKedhRKsPS7+MlkudrNeAsU9WzJNJeHvFy09E8VL+v5ZEjxGFeBupjo
         kCcJVJWRl2d91lndlhRnXWvOKDEDWIEJq60dqe6W2Xqf1IhENq0qJ6aQKutA8760dwpr
         Vtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465580; x=1796070380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=v0999se7JawMnR0WzPznFAbMGXmAZXgkxx0HHn8OiSJRJaIVKiKrCZ8RM2fhnBF2wn
         zFiXDpqujM90b80Xb6CM8V8xouP0EPcS7mUfkkNxRWnAktNXHmYLJ0sCCLQhLLW4fYFo
         0znIR7duQrxml7LHWX3OkmX3Xc35yF7vQfsy0GSD1QIlIp8rfOf2aTzRKPnffK4O1fAG
         tzZyj7fPOvUpKWEWXoi0J4KBHr6FblLw2Egu+AsWfKsF7rsvjJy0QiwFMAy8dn+QAf5z
         OvG2K9TdyowmEGrTZ1TH5Ap+qEVO6IJnWIxKKRXtYyOANVWEVPNXFFyrRu7pLUp2qQ5q
         5nxQ==
X-Forwarded-Encrypted: i=1; AL+hErFGW2AJwrOt2K6hNOsULBoidAQ70HLySuveuddXIh7bIgIiq4F9MCDNRgs0Nihpm0g8TOVZBze9to/k@vger.kernel.org
X-Gm-Message-State: APuU4Z8/5iV9WNrdMuBiCOCZg0yUEFTrKB86qdbatWdRniG4BFo2p11h
	xbeZqMrbr5zB2Wm5a+UmtUOpkZIhD7ngnmB0nntlMXj+5C0ckKgeheZkUBvrFgiwgCw=
X-Gm-Gg: AZFdTZdsxsLIVBOnmNfZeuBvszAbIWuyUHrfslVRZukjTuQ11p6I0m3PjsNftxcNAxT
	s3Cu1B91Btp4928V0S+6Wxmo0FGD+PSrh3oyAAQHnLx4fLQM94/Nxn9JekX3VxxmtHiq3vKywym
	xYgQD+zR9emaCnXLfTN+1aIhjNZzKTVtbDdJ+ywCpFd38AwRyFfJt4gip4PRHOed12CQp6exR/8
	eaYY4fNgS6zydbS+i6F6XfDteJiYsK2Hf16k+JadqA/qAhhMzuxaU4F09gyeZPM4SVGcRgXI+Rm
	XjJRQYCipaFAsL2kHpta0zzAyv+GYD9l0V36wPbsddsIywQP0icTwQZm1/ooKDa4FCGVTVPX+E1
	st31X7zv677vcyde1zg6Jlnl1we8KwgQ7soO3MewumUQyjp3QweG3sUJabqkR++rSeVzhN3ZEM3
	tLCKmiyOdCtQ6JZQjiLzBjCOsPVLU4Bsl3QD9R4Xe+sJL9rFNknf5Q5qSr5ni6tzOEje79qBdSJ
	DZ2rTkYTephOv1KNif8s3xIXVm6a9hQw4E9pvKvmPZux/DfDwnFOCMvDGb9KeA79i5ZtZ5OhDjj
	VzDo5v7Nqz52+MPS+k5otvFn69pJAbcHpaf7yn8thZlYXfi13ASe6t+iEErW7xi27PfdSNPJX39
	XWMkS8aIK2O8=
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr249466655e9.4.1795465580088;
        Mon, 23 Nov 2026 12:26:20 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:19 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Mon, 23 Nov 2026 21:26:12 +0100
Message-ID: <20261123202616.17334-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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

The MMC5603NJ and MMC5633NJL are listed in trivial-devices.yaml, which
allows no properties besides the register address and interrupts.
Boards need to describe how the sensor is oriented, and the supply it
runs from, which is often switched on wearables.

Give them a binding of their own, covering both the I2C and I3C
connections of the MMC5633NJL.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 2 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
new file mode 100644
index 000000000000..423b8ecbb9e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5633.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5603 and MMC5633 3-axis magnetic sensors
+
+maintainers:
+  - Gerard Marull-Paretas <gerard@teslabs.com>
+
+description:
+  The MMC5603NJ is connected over I2C, the MMC5633NJL over I2C or I3C.
+
+properties:
+  compatible:
+    enum:
+      - memsic,mmc5603
+      - memsic,mmc5633
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  mount-matrix:
+    description: An optional 3x3 mounting rotation matrix.
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
+        magnetometer@30 {
+            compatible = "memsic,mmc5603";
+            reg = <0x30>;
+            vdd-supply = <&vdd_1v8>;
+            mount-matrix = "-1", "0", "0",
+                           "0", "1", "0",
+                           "0", "0", "-1";
+        };
+    };
+
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        magnetometer@30,4a20000f000 {
+            compatible = "memsic,mmc5633";
+            reg = <0x30 0x4a2 0xf000>;
+            vdd-supply = <&vdd_1v8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..523c205c0880 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,10 +261,6 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
-            # MEMSIC 3-axis magnetometer
-          - memsic,mmc5603
-            # MEMSIC 3-axis magnetometer (Support I3C HDR)
-          - memsic,mmc5633
             # MEMSIC 3-axis accelerometer
           - memsic,mxc4005
             # MEMSIC 2-axis 8-bit digital accelerometer
-- 
2.45.2

