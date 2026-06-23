Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13FE3090C6
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230164; cv=none; b=NAcmv0WSsJs0ViYORU+Vh1xHP+jldS3qnOz4A2to7eKJODvtSc/4xV84tyzkBqria0OeSGbYPgyy7WXU2NSIyh+HVSOU0DmEZU3nr7Yx2D5RlVyiKvGPScHQQGvuZQCFspWDAClizfbL2hD1R85O4KV8syOxHRmlZH0RSUCGNgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230164; c=relaxed/simple;
	bh=CbuV97VjT/KMon1hV6OEo+IcDzROYPl4T+hyY6k0nlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AV7acHQ5mmNYZ10qhUA3uAWhkOGpoPYc09QYBOlZPIPsFG+db30Fv8Ru/NLo+o0d7/zj2JUrZqcs9dITiQ81MZJGvCbLg7HuPvLZ/ZiqEhv8tgFQqOWRp9Lwg+3KQJEl+vfVnrDMws6j4l4CdCtbE+LNo+ZQSB10kExEgLictus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCqM29e4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCqM29e4"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad58f31846so5249218e87.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782230161; x=1782834961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMN+DlPVMO7XwEUIB8KB3Q5KPG4C/k7irSNWdefCI4g=;
        b=fCqM29e4FdND0ZlG+m4rRbr5bbJiDvJI3meB9zXDSwJQfi0Gue5R5IJ3hM+TY2mSJJ
         ywYaOpRpR41IYnANzEV0pWHZCQXfFY6nqUqJlp0iVBOiIP3BD7XT/3/glMI2TkUJ/cRj
         sdweupoYS9vbqqua+roM9YUshkRzsI8/WRulJAmWdK7rAn8sO1SMmxBdvWgLnlosSQkc
         v3clBTX3ogAh3Njz6zPiezZXhgKnfTiELDe1h+TRzGBJZ8RGi9lxJvf86/w6MU3RBIy4
         YMgGiniprXTo3rqO2fbeG07QkUEMPiVf8ocvw/plA6xm3XLe5B5J7pABVp05URJUQWN/
         sbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230161; x=1782834961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QMN+DlPVMO7XwEUIB8KB3Q5KPG4C/k7irSNWdefCI4g=;
        b=nOf0AErJB3Rvliu3fn5LoA+INKoELsAe81v4coXbzuwrYc4Apy/foFpdvJNwHKzzYS
         z8gPRyiR3m+VpomyDVIBCispluDBTqTcQ3zQpkJF+3YUEPzYXh5Q9Csu84YKk7oV4yEo
         fws7OVtjUiPaTOFCVb+Ksvq2SHeK7+cm1tEeiacnyoCh1MX1YRNJM5G5XuLkXxycmTHW
         xGFQ8S042ymm7lFt3L1+T314S/tei3D7O+vqPiHzAkOi8DcTMkQWKxHsoM+1QkjO1ba+
         sPcCMi/j/ppa6dBdXCNMDiyP1/gOj+2bWaEhOJNK+9X3Q/9DulBj6a3luetgKPNOh/e3
         W86Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HH5CIBSHgiy/GtLsk3ZZEsrc97oyS8sruTG5th0A4k9/CIKpXE797GwHu11CIZBukLRyo09fq0B5c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BMy4TwgSnpDW2yxXR/IyWe510AJ0ZXzNeB/BH1qtzTKG3bji
	9rEBpIu//StDy03nQ/Sl/mdbTvhSR7/m6ZdPhZGlJkD2JCBxon5aTLbU5aS7pncuQm4GmQ==
X-Gm-Gg: AfdE7cmBhOU1yPWxdOREEP7Di0+ZlwbNTBFJ4Ubic5LWkN5VCmtuM59holJY9IRTl6U
	biSj/j2nIHx3JChW5gNu96b9YqJtB9izbChAexpPvo7VM+Z+iv5PXaQ7V3TdgsjYyJSDmM4JJxm
	V9kZp6xYHtYqV+r7OACH0tvt1TpgJS8nkn3L4Q2qY1u++J7LXpHhX34wNBe6awqXf9Hl297Sm8v
	51ZEveyQz0NvXORMNyUnizouBWYwIfQ6fXFCxzM+HKN53YGMb22yxo8n7ibi0/0E2QPWRLb56+c
	i1dmGFpn2VEw8tPhoDlGCnRbJ8dLmAYVgWpYGY0YQSrt1ODTDgdb6gQKNyee+7s8/+xYITxIUSM
	IZd23cRxJrJPEHI/33uLf1CBa9zfoxc6+8fperuuSP7/JqT2mVXgqvtnNeAQuRioOo41GFaCA18
	/rA1IStzu0j/0pR47P8sbnl24URFHXks07dnYxilj/zb/YDw==
X-Received: by 2002:a05:6512:2446:b0:5aa:100a:8315 with SMTP id 2adb3069b0e04-5ad5be78be9mr4935223e87.45.1782230160859;
        Tue, 23 Jun 2026 08:56:00 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a6a2sm908946e87.46.2026.06.23.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:55:59 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: iio: health: add maxim,max86150
Date: Tue, 23 Jun 2026 18:55:54 +0300
Message-ID: <20260623155556.13701-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623155556.13701-1-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623155556.13701-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema binding for the Maxim MAX86150 combined ECG and PPG
biosensor.  The device communicates over I2C at up to 400 kHz and
exposes an active-low interrupt when the 32-entry hardware FIFO
reaches its configurable almost-full threshold.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 .../bindings/iio/health/maxim,max86150.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml

diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
new file mode 100755
index 000000000000..1bf10fd1a3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/health/maxim,max86150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX86150 ECG and PPG Biosensor
+
+maintainers:
+  - Md Shofiqul Islam <shofiqtest@gmail.com>
+
+description: |
+  The MAX86150 is an integrated biosensor SoC that combines:
+    - Two PPG (photoplethysmography) channels: Red LED and IR LED,
+      for heart rate and blood-oxygen saturation (SpO2) measurement.
+    - One ECG (electrocardiogram) channel for biopotential recording.
+
+  The device communicates over I2C at up to 400 kHz and raises an
+  active-low interrupt when the 32-entry hardware FIFO reaches its
+  configurable almost-full threshold.
+
+  Datasheet:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
+
+properties:
+  compatible:
+    const: maxim,max86150
+
+  reg:
+    maxItems: 1
+    description: I2C device address, always 0x5E.
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Active-low interrupt line.  Asserted when the FIFO almost-full
+      threshold is reached or when a new PPG sample is ready.
+
+  vdd-supply:
+    description: Digital core supply, 1.71 V to 1.89 V.
+
+  leds-supply:
+    description: LED anode supply, 3.0 V to 5.5 V.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        biosensor@5e {
+            compatible = "maxim,max86150";
+            reg = <0x5e>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&vdd_1v8>;
+            leds-supply = <&vdd_3v3>;
+        };
+    };
-- 
2.51.1

