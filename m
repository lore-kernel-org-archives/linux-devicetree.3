Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374521;
	b=3TzfwP3rwPmxQE+9dSVYkyE549UiZ18htQc4TwEIpllVL0U1sNfDQW1SjlEnkXksjxZA
	 USJUuCh4YMRR6VgMXO4QPCy/zja2V4giEewmrVr69j39Ehhj858tN1PE2JBabk00VNw+A
	 g1EekE1JrisQu4TLNnhBr5FivWMGqFigTmaAIIuHZAbGh3NeGqOBbuDI4rLgN+6o4eVKz
	 bThXDNwCWnC4VItlqIUgkRiWdWZidPas9NshpzFpqC1zCIlHMUpSKmRPdZYf5O6w+t+pP
	 u6YsDJe25eSqxER+s8qOAEC46s8QkD45khFxVI+v5rYTYQZq/9PC2T13q86UvwJQF+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=J82mtoWTZAVv282uBXDclHo64Mn1VcScZt3mDFaAqMW6Tie4e4nt6msvClcGn2WY6vyb
	 f9bCcojxtyzUPHV9a6clUzKqScYYv1itqnhBg+6RxdVPoZD7LdBrNZ7vDbsd1sDegr0ub
	 M+Bb7Nv9kHnUrQ3TXBNFFUHgj9Rk+E1zEkToKd1uShK3Wwxox5uI0X6EJEI2bUvqufYGE
	 Os4tpwydyebUPb7c0F6Dr23m7iago5zHmzsc8VZhkbovpD4H9sWO54INmuI+tonfXCTMi
	 1AAl0JSOc9GXcgyEixNbzDf99mr5ICgHSMWV9/Y1WHcmXrwsvzXg2tRSS6yxmo43OKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MY60QOdv;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F4606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MY60QOdv
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so20794205e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374520; x=1795979320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=MY60QOdvETfWFmzwHjAuZarP728XBww5sgW3Xpgzkc70uYm1GMEHAQ+OOFQyGz2K4I
         3UC73tciUBKM+zkMIQzkP7p2N5lWE6wMCMvL5KAbRLniLc5l2r+QuKs8OVwjZ0L2MXEz
         5HGucgog25eHDSnCv4SeLN5AgVDWYrJVcq3XHgEI5vx9a+0gJ4lis9sOU18uHwdcB2Ve
         xcuhSVCUFiyOnhouVZEEvcYwxCHzdPPPr65h4w72ShWmB8NJwpWvBv4G/cqikENHyup+
         nSSJUYV2wt4l7+XxQnezrF/ms1W06KZai0bFFGSdID8MbVX6w01z5aJWgstMFNsJulBe
         AuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374520; x=1795979320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=iamjDbEQmSNxzU6UnDB6gnZFWYTcXvPPuT5nVFSf711kCfkfMnnpYvcK6cAzhAlKkE
         mdBasJV5zVhKhvLzv7hvJfmSI5SNf8+7W8Pe67+zeKxWsAjPJEokia/f6CGrxxyv8XqW
         CXlM1qLbvs/9Q8gyonv7oLwnhdkr5X1AGQoXNh3korFzkfZ8UpTkxEXqmkR04QccNgi6
         fWFR1H4GB7cU1eAgAtPGYoCca/M7bZ+B2buIeveSqOj1bBOBp+YjEkoZrsKPnu6AOzlw
         nqyaiBqPqCK7xDVrSYV7DhyHGxmRvAG++oPGulg+7bj6WPnBpmb6AdmdiqsxaDyyQSBo
         ufbA==
X-Forwarded-Encrypted: i=1; AL+hErHduUsSsHOkUCqCH5BAA9aqVt3GWvt7Yojd4S3RMHMz9vN2tgj0K4PD9tiEVn0AJOxAgrp9VYAwE9hh@vger.kernel.org
X-Gm-Message-State: APuU4Z+nCErarqqenETx+yhSG7gQgKIWtqp5hwy7CYH+uUcaNeIURVLi
	XN1uFLkUWZVrrC+L44LyAOtxsQf1tDG1aW0xSmN9M09FGwKFjAPgb2MmLivwvSFBEuQ=
X-Gm-Gg: AZFdTZfDe7AznBufWHiQ2BxkLQOG94xNXZAIet+sVK2zDpBbIXrA73rc+96XS2rVpe5
	NBj5qk/W0tWuatu6y3ZbJod/3UNeAfFOBLkXiMEc1/HHgo/CVpDyNIFX+to0FkYAYTdbgaZ5kyY
	KtHO+I4kjU3IGPkU/1LBZdhnSYN+i1lJnbCbROXRlIY1myQE/JmhJOONQWquwdi0ruyeMaKf9XU
	/nxtXo4/a+KiP2oq/g1JvkbeEFESjY6XhN7cUgmg5C8QSno1atRaeYhafdxGm9bg4Q1MnhIyQwF
	tVpjLTixGlNvpCsWKRakfLYmSKxTUE1qAjiWnF7sRlLCJVKUqPVnaVerjXgBHlUMY1oKOjgK1uE
	oJPywqJxoAl8McA+oscFUlc3UF4G/ws+wSFvWMs06qZeCAsKbiGvsln5VN6lEk3P1kjNA6skWUj
	2DlR9r3WBeuvJXWGpvMtcwaexOOKo3CQjVw/yssYvpUcgQ95a5M1/wbFNBkoLbWGlobh2xnexuX
	g1bFr1b4QRFwqEUUagIDro5exp4kS22uBghKN3EruSEniw+bHBy95zNfcqcURQuvwnA5OKe/Dh2
	McDpq8KY4LGBhLzvUn86McQ8p1k270yP4BUWOAfk1ZIxTNOF3CcqJIF//nslwyXlT1t+RenrcoR
	jBDypOngl43M=
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr200592785e9.29.1795374519093;
        Sun, 22 Nov 2026 11:08:39 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:38 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Sun, 22 Nov 2026 20:08:34 +0100
Message-ID: <20261122190836.66111-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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

