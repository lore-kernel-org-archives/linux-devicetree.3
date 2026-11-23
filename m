Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463388;
	b=Pmv30KeOuJUmucZPtKJvhW73MHMDVlPKiDU8rAVujML7IwLLu88rkoun+3a7PYINZxhB
	 UOJ1DskrCdGJ7N5rAMMObpfezelE4LuCu/5g+3qTZ4l6lQuZjsXQAKIHLlJeHKH7ztUzU
	 QbfZv0XoNIeu+i/p99HCJq+NRmg7cbochTGfTu+PcaLjhBoyPP3+QugRzheEu5NF4BAPv
	 kx2/QLD4YkWBz0IlZBgjx0B19VzstLrR+sjOsiqkr5VTLJpuqLfGw/vOlUiXyQD97BhJJ
	 UQviwmAo6etMt+XsP/9zJdY/0DqUj7oYUwHhXxR2PDpzCuyR3zcNM1TvQUs5RXhQCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=n6lpxXydl+R7aOSB/bU7hU09sBWpLGvSyI/wzy441JMXAX7MRtza4nctgeuttP5ZL1Gr
	 hKCmFwsJKmEX+306cy1uP++uoWmjzPvGtGfOFMnLaivCRH2pohipIx3p6tDeKQ3EGzSPJ
	 f4YmfeDJbXP+/9EEAc9v6hEpqmgL4BXU6xUcLpUHiQOCBIb3hLGKhRQZqVwYqS9OVDhy2
	 l6eo8vbCBY4vy9dfy9/ehHIwbz6b9toNjCLA1q0lomnNsW7SaoZpdwt9QYzXtOdYvaM5X
	 iumCjj5SsC0RX8AP/4dAjgehdAxcT6vKn3Ex1xelcpT7ChhGveYoHe8A0dnpeBtBs6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qaq3PXtD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC262606A686
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC262606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qaq3PXtD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso35854155e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463386; x=1796068186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=Qaq3PXtDYHyqoyMov8LwW7piMp5iLht+BnmiGSoPfj3M5yjv1DrYnD12Kze2+dkBzH
         Y+dWv9wBLUCpbFJhBRd7k5Yb72AhZrbaZSiO/KKhp/apSosa3cmFAyzfw+Ud4tqfUAUt
         UiXCexOyoidQjRJga3S2YLrhh5//y8Dze1gfcgPObp2+MhW62zzniloiHqvHDbN8qEbV
         rrx4A8QGYD0vlO2vq1n2HhW7mSDHPRpCBIKY/7dD0NU8MO+GriTygNcY7jf54h1tQIow
         ti7xvN067tpOOrSIcA3Iga+1oTPEb1zRHjLZXmujqMyoUeeP6+VJnOaDRdNqNUaB2KY4
         20vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463386; x=1796068186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=XBJpo/aX2BmI7qBDv4mw3aKDAdB8HmV4I5U2DsE2VnpJ8uRJBtuCqVY0JMXQzMEUcN
         VHwWdcpzcYBV73+MXwj6MlZWVyCCe5+REg7Eps+u3izxRYspop87xEmVeosSrnnTTPUl
         V/9B//P1cxSpHddJY73wnZtFMZIJj6W+3ynzGOvM7w1PaqGKfqVxGAmZgY/Y3hGBvurL
         tCOB0niuPlCpWc+1pLTy9tOsuVAe0xyZBN+shro1B4JsqCvsMJGx0HclYYCwR4SBb9m0
         bYk3iEjGpHXvGgh3ZEaScakOEs+7i8kYnz8xKRcpWgW7Nim3aM8DxSQPkCi4nZeOrlr+
         rrhA==
X-Forwarded-Encrypted: i=1; AL+hErFyZ2/oizX+yOrNQ6wixICCPEZ7Ej9xJoWzekR+SfB2j5tOoQAHhz/Pz6XSsdKzHDbs52DA/dFruXHo@vger.kernel.org
X-Gm-Message-State: APuU4Z8sqkXVS3qhZf3rNqWl+k2rMG5oN7pSpJS0tIP1kyVq8R6JvECs
	5Zv9vlRkYA7d1ZcrQIdSA7wC36P+LRO/2ImaFBjv2wwUdF+No0yNnsieFwK/opqq2+pkBFrBetr
	jbvIpNc64jw==
X-Gm-Gg: AZFdTZevkzmB33va9Z4ftVeo+QXHUvCnqVrkb72vUQvIWQdG4kXIXc275GLioAaIvbd
	q+CjhnYe6CRzXS0uAVZyOLtSZCWzX4Up8vn5S8LQnR2X5dfvtUbLjImAyxJrZ3MTkqYVoDBU5KU
	gNo941onB8P+vGJ7HVn434iFVQNTocR4fYnBCS1ah3nDwA4T7saqMyHYdobcnw34exJmgPxGne2
	mbYeYQzPVZ2ndDZ4U+6LVuOOOhhyR253xBV9K/bm6FDn4B1fiAcgpKKvOr9D3xHBQVanv9LzLNP
	uERdqhBtHt5TKGd0RHHRYB4ACZhEl+jmLwrM1V+ZD2ao/YjJJS7SxJ4tlA3ZB23CC3NHYyaFuMB
	qPd62rgKc1yygJ8SadAAjjOKvsyp+wQuQ+sE4NwxmzVQZGxp5TBcbpJ4p8No52+TXlgsnadEpQs
	NfNYe5cX1C/GGxnkgBNXTONP5BXBtDLXpWQnpYl3b6LrBH5tHRB6fCfHmTjBzBPTkTiV1yCEflM
	Tt0NPgSKy3lWelJqYZlrUlFqMMTglEr5rhaV6vnrGdm6iiR5vt383ulAdFA27jP7RTi5Jrql41C
	hq8QRJM1G7aItpQ7VVeiS6PFEuBAkBEinuzsRA/8KlwIB/O4aacj0faw+53XHx3ZXc9c7KozJjr
	eLdWcJjckmRo=
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr263324385e9.2.1795463386327;
        Mon, 23 Nov 2026 11:49:46 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:46 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Mon, 23 Nov 2026 20:49:40 +0100
Message-ID: <20261123194943.57601-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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

