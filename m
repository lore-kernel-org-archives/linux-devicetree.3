Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D75318ED2
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232995; cv=none; b=ssU+3RAO/QeaAsm2hBDbIim9gjyVDRnLOsCxymuarWvnswHKdhSK3W6sHO+af1xgI2g92ivBJv4qJEuHtdEICWlNFEypyhS9XLFMeMl58UXSehzm2NMfkUXQL3u1YINqvd4AqRkK2OKjrQQkBjGDlNgp5w9RbtAAdsH+6i5D6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232995; c=relaxed/simple;
	bh=bDrgqU2B+UkBBmPBzeWE0+W7wImAlYaHQusokmx8XJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJZ4eMjRFZBHnc4YPVhXOOajBOicWW13cfFJzYzp4ipKRdAk9ynVmF0HafJkIRDJgOnfXHR/7j32zPo1EjQ/CSUWyuipdBmxSQDnm61zqPy/IwUQjjToc/QM+gebDkImK+wr0EsigNc7dkihGZxsajIUj2H2oACIvb9ix8L8lfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzZPzwkL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzZPzwkL"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so37200e87.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782232992; x=1782837792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD39JBAAp2uVwZ98fWzVa8hs4x0Q++h2beL6bLFgwHE=;
        b=HzZPzwkLEzdxXb8FvXIrWYtr5+36KeJNWO2sGYwX6bvjicHFPKz6J6hs73ut4UG7P3
         P1aDvU3RqEBUfYAqfZ0V5GWRs/s/njb7ZUoQ8u4xc/0kEj3Fnu2LvkXBY1Bq7cKyqXzN
         Mf5J24q7Gm3K310a+7OxHQTlrvmxgHSPgwls3EatRMKjsg1+fxJDfN0WsQmRIlCv+zqt
         UiiBygc4kxzR/eyXdlfBwbp2XIrCPZFYPzD3evNPYfZBjAgs85L1WyMuGQAhmor/oll+
         tamjUIxBLIErOSMzqwtxjmX5Vp2fH1M2COHFu140ZFhKyit8lXy7hzm5eHUqRm+tIDS5
         BG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232992; x=1782837792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pD39JBAAp2uVwZ98fWzVa8hs4x0Q++h2beL6bLFgwHE=;
        b=Z8ugslQeGnLSqd7wMDXf4B23igXU6n36C43s/adTt1hsDsrvkkvctRilrJ+nMdDl0d
         lIKRbBnJymJSvrjXNh1xInY86fg0zDFmOzoaSwDTrIjJac7i7y6S9tSnG2+7B6sMJ+ym
         ml8AWuFa1MDQIzXALHJkF4pPxzzjl5oXRe0i61/1RBWWaX+R8d5vjyc68VOd+NuFVctZ
         75yLAXlJXGi6k5uwmJ5y5OBrirKD5YDz5H3sMCW+3NL3lBi1mwSrqa1ePtfMnxr0I+Zu
         j4gDGOcR9zNtJf3vGQTdRZ+S4DmaZRAVkpj1cIxBS6ts1XSPH98c+v1Y7drdpuBfzrdD
         YL8g==
X-Forwarded-Encrypted: i=1; AFNElJ/mjj196GHbl/5iwTFwuTvx5lKnaqgkkXFR0S374Nr5FP0NK3ibRPdTPpPf4K7/u62gfkg1IphsOuZs@vger.kernel.org
X-Gm-Message-State: AOJu0YygvmD4TSpeqkTUTeb+oqMB713qbLzWQgoHiMB/fEBE2mHeADHf
	yXNxhuEieWXwv/omXiLNWPfqMS4eIoxstFXj1E/Gyc0b4nuIf3QvMxk4
X-Gm-Gg: AfdE7ckaDMTu9L/GljRmj06w76Nh+2hz2Mhs/MrETUNXERkdiXwEwluQ68rfdDyPOq7
	iYbYUeVoZc3GFT6efqJEwx+aEbv5KGLw4f9Tfrv3jir/1+O2Gmo4ccCML8MUGlcztusw8FAYi40
	K5Cm/rAF680jPGLiJeEO713g4LfysHs9XdKvTmEFEilN51S5GyKc1Q5Erm48aQy8rAE1DnoM+9h
	9fIR5bSOYmZRmlnE1jtMOSrK1obFETfmnWIulG1tC6zgsjMeYgG1bq6piB8MjE37HYgLvf7Mk8Y
	t3uYz5rLCIsjjnk3xgt62NNJpSzXVyD+a4uJnbHilKNkEhLwpR29a/nnnwX46sCcPq/Q6xkwuX1
	pltoPSutcosavggGxq+L/Xbn+ahCtzDzMvg3tfjZZ/r8xARxsvobI5RNlvpCuCaAddaK1K6i6Yf
	51Lp9V91WHMRihnQP5199YgHEeZyHQrEGgmUZOJDok8JqecA==
X-Received: by 2002:a05:6512:689:b0:5a8:6cbc:60f3 with SMTP id 2adb3069b0e04-5ae3510c75cmr1040397e87.34.1782232991949;
        Tue, 23 Jun 2026 09:43:11 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555c45sm948253e87.36.2026.06.23.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:43:11 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: iio: health: add maxim,max86150
Date: Tue, 23 Jun 2026 19:43:07 +0300
Message-ID: <20260623164309.16452-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623164309.16452-1-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623164309.16452-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML binding schema for the Maxim MAX86150 combined ECG and PPG
biosensor.  The device exposes two PPG optical channels (Red and IR LED)
for heart rate and SpO2 measurement, and one ECG biopotential channel, all
accessible over I2C at up to 400 kHz.

An optional active-low interrupt line connects to the 32-entry hardware
FIFO almost-full output.  Two optional regulator supplies (vdd for the
digital core and leds for the LED anodes) cover boards that require
explicit power sequencing.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 .../bindings/iio/health/maxim,max86150.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml

diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
new file mode 100644
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

