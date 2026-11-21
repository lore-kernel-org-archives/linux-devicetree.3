Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252754;
	b=pBpjhn/Zc1EFyiN8pxlfzIhIgg4ZK0IE8vYIVePmyv2+q0hMkWQVf4rp5TgO/WT0ESjW
	 U0DQfr4Up2F8PFEIhbOIz4agQdnWkjImsQOMKZQu1X54wkMfKSiV7zPDOAEttPgYIigvG
	 etGVti7ITAoLskdNFm/yorf7wk3ECxvSbiAqZM65mG19lIHFXtiX+RlsdjXTPmXZm52VN
	 ZBNQKfEngHgIGv8Hzq3GIx+loRGpi428EIKqr/y//dZtxkdrXOpOgXz/ka31F4QS9fhUg
	 Va3LABz6kvpCTRRqSHzbtf1Nh+9o0v1Aa8y6S/MkCUAEzKeeROpIl5n8umz/OOGzq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
	b=YpZ0c2I/bj+72DvBLlcT9SpBiMffIpahngzjw7Ds5AE4SLAs7EKPcxTCcOgiGtlBiOk+
	 1+Wa3hPX37GZGC51cvGg8S4uAiixu4+qxvCp/AnmE3XxwOdCVuld1iUyEm3StU6WIs26U
	 mqfDJ3GkUQKy9ITRHfq/lXRTMARVj7oRk3HGTWa327WkJB7k4/q5g8EJn1TRwZPULBBhU
	 giZ+MOdAWym+r37RaPp6/5nKShjn7qa7XxJ6GeCHwDerqftYSs/gzj9Jzi7xFvxV8mQTu
	 Bud9MLcG/9cygBGQoqRy2mC5z8ZQRMRNyroSxjsC/PVd59Gmc1rNzYwYGF8NUeomcdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cX8Oyko+;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797A3606A325
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cX8Oyko+
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso659552a12.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795252753; x=1795857553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
        b=cX8Oyko+9BUJ/LRlYYfIwfgInAZ3izQZGGnx1hum+2acbpMVS4IYjbzQzd9pKpoV0f
         44Wpq79tf+r5VYD19ARiwSugHU8xOe6sQOtDChKtZi+KjerM87VVcXC6M0z1q05qGsV/
         WqMydRz4AkYBRGL2jnVs3EjOUKxIUUAh+C6e4iIn+0c5x9KKOfr0c4EYFtNIaSiY3R5K
         NW/pWs2guC4Q2psx/sEgNlnZnel9Dgy5sJW1VOr23GKKfk3Pt5HMr3iNVGeV9olKqqtU
         UAlE3dUMzqzEYhvHzAolx11xHKYJXre9woJXGXi2JXj0DgKTvYH9wqhqQ/ZQdq0AYdVx
         2FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252753; x=1795857553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
        b=CdGF3qEvvVul1aU2ulXNsvvR76PtaPFYefshyX1K8Bt/EHKhoaP2Z45pDOir4o+2wD
         bZJVTrOD6BNhytRpmTgB4KkenYWJEyb7DsQHazFfg3mUHmZ2hg+i2j7jRO76j6+K1VqQ
         Q4C23WpGYgMICHgFOhuOFBplx4NlZJTEBcSdXTkS/acaLAXnovvZNYfgEYgIM2O3XMpA
         9LUa9sksu2dHk8tS+cqFFPdD+VZ5D5+OaYVhp1kns7PZAIFZVNKqy9A4oLXEG3wyLlli
         DRqOg6ZB6WkQnhXaW5TUPJT/YxGsiH7ne7XVWGoY8IwwFNP7pkFK8ujZM0/y4zy+Qlnm
         m5Wg==
X-Forwarded-Encrypted: i=1; AL+hErGgqoVIceE7HSOiNNkloNyP7N23/MQyWE8Wv7+c5a6IU0xbUxvQbWPF8kdAMZ1MB2B7EaG2rv7CUFYC@vger.kernel.org
X-Gm-Message-State: APuU4Z/qdExkrpEIpuWC0y//D5fnvPiadyfF8ptAYZ9bm61NHcjZC8tx
	OjLew4CI4WuE4+7NVqLI1VAULFS45osXtNuL0bCzs9aBR9YdCX7gmxde
X-Gm-Gg: AZFdTZcM/9wVjV8NOgWtIfpbUnrMHEtbFhHQYogPVY/C28non+3n3aKB8scvMXJhN99
	3CJaD93is21AcW45s3bC6ExSA04aCpucu5xlvKrK7H2mKKk9bL/FNChs0HR8YziXKyMyIJ8VR6d
	As/2Xf02FpA9hBpXAO9BsWORU14LAFMdbQt4+oGFD2qgW6HmqevRXM3p1+7Oihj2l4UgYpjJwdP
	qC8VLZN4H4kpehmQpxfEDSCywDzDwZaMQzNSlvemeLPne9aS+JStomrSVMVUy3mdaQrTnvVkF4O
	RUkrS8oMwrXfXvD0KeSDtC58WZKe393nZvGE8M7OF38ueWbCWOcRU2nfX/YYNXdsxB2v57ZzPLy
	KZO7yY/Hq7YgaSzgbCoJHQhpSRCRC3YXWim2IGw06nZrraQuTI/npNQ9kfpBMjfTgq74XVZxWdh
	KfMrH5NL4Cmysmt+I0Xz3Rpr8iQm4gNmgFNvgDKSNzUMHwQEfWv1INawyvS+rQrlZdV97hv2M+k
	dXvIdPsZiBigQrFbm5uhH58ARhLka4iO4ak41ofyfA+vFHzBy36XtN44QBXaJIFSGWI9iPTtF3T
	X/8lQn0SR0fKttdAyi+3QKXiwYVeAo/JAeTvj0p/utvO050lF0mhzQGNC+5lRfF+g6YYR05xpWR
	9Qwwm9bGNw9NqTjPX1Hg=
X-Received: by 2002:a05:6a20:e68e:b0:3fb:1640:c504 with SMTP id adf61e73a8af0-4014db5856bmr4796813637.63.1795252752623;
        Sat, 21 Nov 2026 01:19:12 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05c0cfsm2379895a12.26.2026.11.21.01.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:19:12 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andrii Cherniavskyi <chernyav.a@gmail.com>,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Samsung S5K5E8YX image sensor
Date: Sat, 21 Nov 2026 16:19:06 +0700
Message-ID: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Andrii Cherniavskyi <chernyav.a@gmail.com>

Add Device Tree bindings for the Samsung S5K5E8YX 5MP RAW10 CMOS image
sensor, including optional standby-gpios and MIPI CSI-2 endpoint
properties.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8yx.yaml  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
new file mode 100644
index 000000000..a70becba5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8yx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8YX Image Sensor
+
+description:
+  Samsung S5K5E8YX image sensor is a 5MP CMOS image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 2608x1960 at 30 frames
+  per second, data output format is RAW10 transferred over 2-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Andrii Cherniavskyi <chernyav.a@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8yx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  standby-gpios:
+    description: Active low GPIO connected to STANDBY/XSHUTDN pad of the sensor.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.2 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 or 2.8 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@2d {
+              compatible = "samsung,s5k5e8yx";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p2>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <420000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.43.0

