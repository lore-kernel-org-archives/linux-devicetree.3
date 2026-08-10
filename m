Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EB4302E8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389708; cv=none; b=dqDGrxKreMjAhBi27Op4gzwEG8LKCL48PSN3MmYCW/90ZiQwKmCvZiOuKkFOKm20w9qK8qrydVPh3CDyLXY5ovHlMZcz5ZL7sb5vPUm1Pu0BcXTd0CZCaFP9lqy9e5nnowhl2crC5UiDgNwFaIfzs8D24QSAaaRx6MyC8pM6tHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389708; c=relaxed/simple;
	bh=uD1oO4cs8uZhXoXFc8b/g7W+blWteUgwWte21V3SUJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lds6obApyCQz/1wsXcHCJsfzLKfE5Tp9Hfnf8oBqjl45qhPkgCBG8FVAvi2MtvA4aCiH7OtP6m6GNRpBIqdwq+oKx67Lv8J1DVrAbvMaI0Zaa/YiKl0P0wBiE2DdSkF6SWiXclbaKsgc/Bw+sNpbuUT+4eVp89Brx65Q2ugUv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr54znNp; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr54znNp"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6682259cae6so2294761d50.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389705; x=1786994505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuRXCZdD9fwaj8LGoLIYzfFtr1/F5wEoiyIlug7kGCM=;
        b=Dr54znNpnJ9lSnX/BPN0mrLom8wrblMKURKpffQ6kpe7zumzu6wzfeaUVfmRlHiaaB
         1Htf2+Iji5VHNiZR75CLbioHeoJSev21d1oGxo7tCJ9iz2pFzKq1/pWh1q9qWsAXGh/2
         yC689Wg3CtYL/SRlTYe89kyTNN/OY9TaCXNGyulm34nDApXGjrsejDgMfcXvvHLjajhO
         hcsBFdNGppqPEXL8sF3ty5Gn479xqznxj3gvb4hHHc3eQNUq6OK0yCH3cnP4EarTTf3y
         CL5Caq+PU6WUbhg1t/gfilAnUegeN59XrDbvhSa5l61Ijmh7LwjQjVaIjUg/nxMXLgul
         7WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389705; x=1786994505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuRXCZdD9fwaj8LGoLIYzfFtr1/F5wEoiyIlug7kGCM=;
        b=mq8F96urq3i/0jFrdWYcFc0siHThVt5gLOEXE+E9chII8UO0Q81oM5D3Nq46QIW+7d
         GFo21j0n/8gdv6WUR9Ra/Rbh6XFEk04dZrKSdOtUuSDw1rNc2mNiQDx27S+lr/9DDieZ
         Sd5y4SeiL3KQDEwdP86cm75XLoDpvY/oDpW6DQPg0jOdI+dpHmH4zgSM7wR9HHPTe3Z0
         9hTx+SKxASxqLyeQAqFT0HuGQyT4yrL9+NvKKx9/gbag/Xw4dlZ8gxXKcHS6okK9mLDt
         MEqeH45isDzc/N3CYExy/uI3lYWhRcm1V5NCFQ7KniPhjeVJXq1dgl5zNoYFIvGC33Td
         OY0g==
X-Forwarded-Encrypted: i=1; AHgh+RpUafLEqRQAepBsZ1Sv0Inif6inJz9NiZ5tjtHb64BJ8aARQalwUzUFgiuUnmbbAhetRIl1aP1V2OxG@vger.kernel.org
X-Gm-Message-State: AOJu0YztCKyOxO4+xhxd1pqEOIJZgrYDHEbLDdjNTsUZVN8pS+fPngbB
	yBx3OYM6cpta6RPw8FtV23bbe3rsfURnzHHKqZuhhG2KFktbIpjq2C5O
X-Gm-Gg: AR+sD133MuFFNWD/H0s+CEIWI9sXmJMP/4vmzPWVsJJHHYl2HFRF99UezSWjaLb4OdB
	JcAkDmVp6My7dZa9v4iuVQ4A7+6nRSjw2nxvjnYHbG2Y2+nPW0bKlbyi4/yKH2sd+C1r+LBiQif
	4EnAZ4vOeuJomHqV8sB2PsIl6zGU3sxPCHVVZIPjrTkCn6Y1yUHYzPyOIlgIZx0mX2pfVybdhYH
	s7jZ+XQ+3aeKdqrp0e9bwXjEh2mxjDDlqP03X8pKnCzWnlZqURyXYqzDVVykrzcblkOLu2RVgTU
	c0TC46M1NAFRLspBaf6j8oa6/Q3hkGjbj5jwPFh84+aAZZyqLG+hYk7b0H6gz5NtNPQPUrC7jv9
	/UcfaD4NqJpZxEzqUy5o9Ncq6+wcFwHu7HyldzMuvlmoQlnuRDoeRjrQVJp2L8lV6T9hA5lnn2l
	QPsqOa6sRA/TgZTzvZBE+Sxa+GOuHpp1jtFWbZpHVln7b82wq3VHnJaZe5sf2y4dYpkpv56NgPx
	A9Qoh8lkhC7JOnBGiFflfDMtgmRMzb5bue1ewNKBqXRT3sTiOS7LwA=
X-Received: by 2002:a05:690e:4850:b0:667:b57b:8689 with SMTP id 956f58d0204a3-66b122c09cbmr2012592d50.15.1786389705290;
        Mon, 10 Aug 2026 12:21:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:5c54:b9f5:beef:8bf4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafa90basm6928863d50.16.2026.08.10.12.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:21:44 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
Date: Mon, 10 Aug 2026 16:18:40 -0300
Message-ID: <20260810192131.153495-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
but it is not one: besides the I2C interface it exposes a power-enable
pin and a mode-control pin.

The mode-control pin can trigger acquisitions and report the measured
distance through a PWM signal, entirely bypassing I2C. That usage is
bidirectional and non-cyclic, so it doesn't map onto any existing
binding for describing pin behaviour, and is intentionally left
undocumented here. The same pin can, however, also be used as a plain
status output while I2C remains the active interface, which is
described through the new interrupts property.

Move the device to a dedicated binding file and document the
power-enable, power-supply and interrupt properties that
trivial-devices.yaml has no way to express.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 64 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..e19c8d166b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,64 @@
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
+  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
+  laser rangefinder.
+
+  Besides I2C, the mode control pin can also trigger acquisitions and
+  report the measured distance through a PWM signal, without using I2C
+  at all. That usage is bidirectional and non-cyclic, and is not
+  described by this binding. The same pin can also be used, while I2C
+  remains the active interface, as a plain status output signalling
+  when an acquisition has completed.
+
+  Datasheet:
+    https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
+
+properties:
+  compatible:
+    const: pulsedlight,lidar-lite-v2
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
+  interrupts:
+    description:
+      Mode control pin used as a status output, driven while the device is
+      busy performing an acquisition. Can be used to signal completion
+      instead of polling over I2C.
+    maxItems: 1
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
+            compatible = "pulsedlight,lidar-lite-v2";
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

