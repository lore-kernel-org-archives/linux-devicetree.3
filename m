Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340056;
	b=0X6mMQjp7DQyVWDjv3A/nTVf11fiZ+xE+jHlWiafr1DawJ5SvCTpz+8ZCC0dZ/BQabsO
	 k/H62l8f0gwha+P97D5QdIMEsY3gIGTLEmn7KgJG2E/JDROaS2XIjyTwMZKHJo/pDnrkG
	 dAhi231ClNgkl3/vWCmEGsKZ/fPjBKth3ZhqcztqQmY9ZbNseqo+3lr/+BP5raa5uXRvX
	 gtl6KuVdU5KXv8oSDpk76/Rb6e2y+nWs+ee/7Xw4wCTVWreI4YNTG8DRCmH9lH3A/Vjk1
	 GR/aG5yc01xefAQONViTs5o/XMAuPRVCBbG7OYKwm2lg/p7t1/gQkRWN0b6iYaozH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
	b=OYONn1NadBh1Y4i9QGLmTSosBy0ZHmZk8wnVePWvJXvfTV49m+ysaUeD6VjfL+qaMZmA
	 d0PsJpDo4CJanCL9szdTKLaKSpGTrnKEuLI0x3c3P7wSR0WcCKvr9f2cqXC62A5O9BzHQ
	 FAeism9q/mIP3bS7iHChU/QLSps6gKN5swmhVtM5vszWN4clQUig4GPitafzEi765ys+/
	 ClIYeqCxIIN2UL/Ozajl030A5Lface79xWDNf7ea9mF73u+Dh2uCf+b5+D1sWvtcBsbIO
	 /hEu4iZjpJyVCOJvI/ugc74kd365dbUOAMoI3f1CDqFJG8RuhTUrq/IiKI9AmKKaLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmjpe7XS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D7606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5D7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmjpe7XS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15248615e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340054; x=1795944854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
        b=bmjpe7XSigsNo/RmiY/EbMiiQNhopFLdUm/1jAJvD+kMQAWiRIwUHz+tmo3w/+zYHr
         fMQDJYRSqoj1mI8kaASKDRaoyWIZboEO/enrNzaavHO4BbahVNAYjcWCsi0W3WCSDfcX
         XYFmLk9tITHWlRWyb8N9hQ7IklRjgIn9NdQLI6Oykom4Z4uPKXNpvk1PQCDIheMkbO6k
         3u8YwMJyYsZxnoR1h5HB+DeGrSW2cHlLfueuH+kWJ1VlbF59wMtBehHTL3tS8SUL9rPo
         gylPAHC/ETCivXluHRfK6894vm6BwUy+sfxydJT6fGfoLnye3Ze42R6+UfXwtRJZ5zNf
         beVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340054; x=1795944854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2xrspYuu+FL47jccjzdtxpgEf6qiE/xXRLpMfETdrM=;
        b=Jg+0tKJU1vPSd6QzwF1PL9G9Dqywdc/jerzrj2L+o0aCa5F0TqFXt51zscPhqT6+Mm
         UUqHoJvT9i9Fn56N7v9gsdiokRy347wjmkuPFuqDCt2/vPP0j+11JOh/ej9Je7RkyMnI
         3nG4CQNYZBJu9Qq+l0Ywvc921idoiOYFuol1c+ZfVygiJSlcahMzmpQlhrsOGIiEy/6I
         L5HHOsOe3PnsH914vPZonRtCB951AXLwsPaGMXjAV9cj8MxNujqTlhOFPxKmxb65TWON
         aCkGXCkoCsItQlAxs3eA5NcvPewYfV6csvD2EX08nCtto5/MWuNPFHRqREqZTHKvY+YO
         gXJw==
X-Forwarded-Encrypted: i=1; AL+hErFZqgJlTIe1404KIJdw+4fzRmg4s+LVZtzLH23ZDJMO5lomxog3pQvlnmTmgZJP66zfv04f4+MPFDqN@vger.kernel.org
X-Gm-Message-State: APuU4Z+iK3Bi5Xl8n97MNV10WYihXJlxr7+xaMv9R9onul+kbJb1ec++
	OT2SJgfDHObaqGx09apep86io4MfhUD7v/jbvjV93teRKwecs6KPASPfo3Gsg7IeFqk=
X-Gm-Gg: AZFdTZelBTSWq3kzpK+0620YZ2F49SdJe1he84X4RdT7UyKnhFLGwPaYhmyIpErIA3Q
	g3u7MCnl5VhsxoWefk2IUeRCMoop/kElWOQ2kuU6oqWPKubeDRDiZK+r5LS5S9ljgBcwCiIMdG2
	5TbXJkjHI4jAJBZjQFxANWNhGrLMkao+ADKSgq2fgGnBfk75M8Q3gq3ck7bt3qUgdbu9szVXoM4
	3F0ygLqsOFjJAF93F23NvbLWQzPACJIMtZBW2DKbidylLxU9XfBNa7NcP8ly2l0g3uYwCjvmMtQ
	9pECkhoVTrnsy1y5Rwl+L/83a4OwlLxFta63U2kXrzlihz1Fw+QmKiibRHeU01CjMLaProIcLx3
	W6SQCdQJVSMiMawJG0sIbER54kWxKXWSAIRUTDprQyXjcy4P/aST+WvohOinCoqzfuwiwwvn0fv
	8q6GXyq9gTqvoO22GW605xHX3gFWpqTHkYCE0vtNdfvGlRJeCGA2mER5JpGZZbo/PY1sb+a37Uk
	KqjAHqyDGFSJHRlfbT6vtVgnCcWHuxObYrBlmA76jd6ElD3p3J4kEL6iqqFzNqkiGlZVG+gvS3c
	lqVvMXB1OUsqIsr2RUQ5P0531KWuVx78VaUYtBsEASMsF6/C38Gc3TFyPUfggZQ2SEI42KBF1pj
	NNp0GwgIu1W4=
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr173144325e9.17.1795340054581;
        Sun, 22 Nov 2026 01:34:14 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm291475195e9.6.2026.11.22.01.34.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:14 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603
Date: Sun, 22 Nov 2026 10:34:12 +0100
Message-ID: <20261122093412.71604-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603NJ is listed in trivial-devices.yaml, which allows no
properties besides the register address and interrupts. Boards need to
describe how the sensor is oriented, and the supply it runs from, which
is often switched on wearables.

Give it a binding of its own with a mount-matrix and its single VDD
supply, the package having no separate I/O supply pin.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../iio/magnetometer/memsic,mmc5603.yaml      | 45 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml
new file mode 100644
index 000000000000..039f53a5f912
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5603.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5603.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5603NJ 3-axis magnetic sensor
+
+maintainers:
+  - Gerard Marull-Paretas <gerard@teslabs.com>
+
+properties:
+  compatible:
+    const: memsic,mmc5603
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+  mount-matrix:
+    description: an optional 3x3 mounting rotation matrix.
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
+            vdd-supply = <&vdd_1v8_reg>;
+            mount-matrix = "-1", "0", "0",
+                           "0", "1", "0",
+                           "0", "0", "-1";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..17a32dd8772e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,8 +261,6 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
-            # MEMSIC 3-axis magnetometer
-          - memsic,mmc5603
             # MEMSIC 3-axis magnetometer (Support I3C HDR)
           - memsic,mmc5633
             # MEMSIC 3-axis accelerometer

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

