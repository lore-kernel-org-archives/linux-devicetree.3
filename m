Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61EF427FB5
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066084; cv=none; b=iyc+5qnbw6b4TyeY0L25Ug04+BLHo4a15V9SudLWTV+c8nXwUl2LtkieH0rMFVBycT4z5NbQ4txhtVdepx83ZK4U44Iodz0PFDk9B83dy8HsX+ufZtjW1KAPjibLkY64HYIBrCYDppnT/NU9ADHJ4opqyg1LOdZ1CN1GBuUt/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066084; c=relaxed/simple;
	bh=2fRnUTnOxq4qo8Xgzr8H3mWLUn8au9hOu6H8KuFMv34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VR1ouyYCsBMWO8uOmUMPhmtSTjfYVEsi47rvvHfX7w1s/qNsMxrzuDf7QLAkSsEgN4mrV/C1SJPosmSWGTFqgZZMlMl8GtC/UGZQq+duu93Da1s72gTvA7I0hUe7pplB2pPEHD5iTMS79Z1VnwzS4ECJ1/5vywfr/A7xrfWjOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjiY2bEY; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjiY2bEY"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6626b5ace23so68853d50.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784066082; x=1784670882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD1fSzo5RQ5ZA0kbdHkEYjYhopbXbN0iGXXs945C6dg=;
        b=IjiY2bEYiPRPztNpzhpOBkpDsH3Bq0sBllQjP/wh7tMy1IVWaFPbPgVAvJSO50EqnX
         V9FWq0DPlDyMJSOe8BW/aCIkcobnpyFpYXgNZ9cqezz7WEL+MHK08ecunySjZsAT6wP2
         GazSFTlf33c/Q1K1dFWDCGQUV9OjSCqQck+0Y6Zt2rvypprOdPTDVEOjAlYIDrssrlad
         phAhbJHPnpFzKXZTryoXsVcPxmxXYU7NPBjS6+p0/FHy+spdSZIO//VFO5IAMINvFU/i
         M5PqSZFecACUN3yY5brSOzJywX3Siyvx6bwXL2HDMoG8lLEwYqWcujBHLntEaxI4lpqm
         WK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784066082; x=1784670882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD1fSzo5RQ5ZA0kbdHkEYjYhopbXbN0iGXXs945C6dg=;
        b=Zd2DOWdCLbEOf2kTy07pxLoiiPqmlpsqZYo0nyHur3AnRvF6AhHvhZWhwW4EVT+mY3
         bPliNLibUwmd1R1e6GdE6beSn1PQoqOSpy6G7RVN66z7s7I5aZ9Mm4pzoNEZEtX3d/TG
         nZRDSQlvQAEz+EAzXQtnYjfPviZrCs+Vf0+QI5V+HyyY0OlbKZ6yCKsaTOb8wVfsNcWG
         b9Sy8EY8a04u4yuNjPAyKt/7U1d747a5MxGT+35PpTcVCVfv0sdQg7vMZufEW3wLwjnI
         3lC9J22fcsM3ZjQDINYBDqALvTOnkL5tpOUWPFdDVUkaZELh9OtEq2vBXz77fxHS+XXK
         NdHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxaD+nzg+MmACyrjC0Oycb+agfoB9PoxkgrSWsK39gsqw01StaVVNlB9aDbbhPFZdmZmet1cZUCNgu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrc2K6px2Dzz5eyh5VFbp3tPzF0Q8C0eSTXD5KuzJGzzds/504
	11hP0SaImn5R4bU699mObrQzTfvVOOxsePwhSVG9foq2uZHU3IpcHUdVa2EzAtqI
X-Gm-Gg: AfdE7ckXG/2aq3lTYrPPGtvuO/IAPRjX8p2w8VwXtkgju9G76ZK9T+hleeIDaLOH/O+
	JL9wZpc06MuMStdkh3yFErWdbLWenz5PDq3oRjB0lzRHZXL3SOiFGJOhQ2ZJnCFc2UpbRgYS9ye
	sndhL7A9MQPbunOlGsZY3hOLLrIdmnmK16367o7A0wQ5gPGXMFPOISdK8do95cUOQxnZOdZkLtu
	CpFZhPrr1lRX5TW+cQbfx5vZu535llJtJsjfctnXSvLUKqFlqw7fBnAjKq8EzKHtDGNGAKTkQsY
	WcwJvtF4cPRjoqCiJjrkDAlo2MmC4VQMDBsp0VH1j7jGp9qhoU4jL6MHHNoW81gD0S2u30ztwr4
	P+F+gzdWzaQ7afS0lG4ZxgyM1KEUd/qT0NQNCprnCyuBbcDoK3Dbe0zltDVCMzuhfA2jGe3G54Z
	P1N5Wwdv9U3fO/a063u9edo7LRh8lmkq6lmtEFhmz4YDzitfYH3DY3uhNEv04hjIuzFA==
X-Received: by 2002:a05:690e:1581:20b0:665:2045:fe47 with SMTP id 956f58d0204a3-667c5a65848mr10794815d50.7.1784066081644;
        Tue, 14 Jul 2026 14:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678775d505sm17359640d50.1.2026.07.14.14.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:54:41 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of trivial-devices
Date: Tue, 14 Jul 2026 18:30:20 -0300
Message-ID: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
but it is not one: besides the I2C interface it exposes a power-enable pin
and a mode-control pin (the latter also used for the PWM distance output).

Move it to a dedicated binding file. While at it, document the LIDAR-Lite
v3: it is sold by Garmin, which acquired PulsedLight, and is
pin-compatible with the v2, so add it with "pulsedlight,lidar-lite-v2"
as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,
This was on my plate and I didn't have a chance to send this before.

The vendor change is not a typo: see the discussion at [1].
Tks and regards.

[1] https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmail.com/

Changelog:
v4: unify patches rather than using a series to keep the tree bisectable;
    rewrite the commit msg, naming the devices explicitly;
v3: https://lore.kernel.org/all/20251102221643.9966-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/all/20250801224112.135918-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20250701223341.36835-1-rodrigo.gobbi.7@gmail.com/
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 54 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..60e60b7769ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+
+maintainers:
+  - Matt Ranostay <mranostay@gmail.com>
+
+description: |
+  Support for LIDAR-Lite v2 and v3 laser rangefinders. These devices
+  can use a simple I2C communication bus or can operate in a PWM mode using a
+  mode control pin to trigger acquisitions and return the measured distance.
+  They also have a power enable pin, which can be used to shut off the device.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - grmn,lidar-lite-v3
+          - const: pulsedlight,lidar-lite-v2
+      - const: pulsedlight,lidar-lite-v2
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO that can be driven low to shut off power to the device.
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
+        lidar@62 {
+            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
+            reg = <0x62>;
+            vdd-supply = <&vdd_5v0>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..74b640c48598 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -396,8 +396,6 @@ properties:
           - onnn,adt7462
             # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
           - plx,pex8648
-            # Pulsedlight LIDAR range-finding sensor
-          - pulsedlight,lidar-lite-v2
             # Renesas HS3001 Temperature and Relative Humidity Sensors
           - renesas,hs3001
             # Renesas ISL29501 time-of-flight sensor
-- 
2.48.1

