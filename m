Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912214;
	b=dLP58EvfBOp7xYqkZ+dihL2/uSicqDbSk8z8IsL2v1GqHmO/ec9CfCaR8Q+i27GluL5P
	 HBU8sny280xAz3m1S+ITyj78dq6szgt6Co1t3Csu7u1Z0/xIpxcUs8Es8EapdJWCcMVEX
	 bddy3/SmK3lz/N8E9uikf9sK8M9UiCzJqv8QQvq+K6VU8xM/yx/wmiwnamjoJWqVoa6TL
	 v+H4FRPCVbJM0MEHzwp5onZhIS5QJb+nMM6f7N15UhZnrHlk4FEBNt9XNgNYndaSdnVFn
	 Fh1t5EufMzxn34ru8/tq4gZIy66n8z62U+yzyhfgEy8aWpvkLgjyTRt6o89aywCoTsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
	b=ntxn6hFJtbyTdmoeQb5KwoBiiwQPtQDcuj97RJDfj8haQjmdPO0moytHlNiAiqkzgrmV
	 u/ulN3QXv+18mg59d9PRX+oGhkoaEaxi9P4Y6Mqo1ZicvUEl9yJXRXOuV7n9WweKk74qr
	 QOrotPO8g6ylguMBUwZ28lF7IPQilPNwyWiqr8TxSm3OzC0VmQKZD3MybUAOkbpdUPNYr
	 jIJlP3YoMut65XZ17vCk12F6P9pPa1fu7bA+ukIrhNUHf8ekAtWn61Z5TqvlVebPDM/KZ
	 hpTJQiybf+M2kvb3Yc7V6M/kOtTbUyAKzUqa87EQgW0ma5hFmbgpt5kk92pg0rP68pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzCvqTkC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F2F606A337
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F2F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzCvqTkC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso20134335e9.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912212; x=1795517012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
        b=rzCvqTkCjQZoIJfxDSOBeYlEmLznCaeche4h7hMQb4YCtCKdIu03Bt0VWG+rNggaST
         iZNGLrD6vErb4nYZpvJQIT7TzHvU532sLyOO/ZxfMAVhKW8LaR+EYkn6+lkfQZxzExy+
         IIKhjzQDMo+ifgIJWjNE9zLs0SHCEy0p0dC+TSGmaYhNis0S3c/v7zMLfns/w8t8BlIl
         vnAPb6GaBqx/Mg7OsKVRl2wxssgkw0nAPZAH6PRU11riEv4c0e3TaGFTMrZh8pxv+9+o
         NIQiL7GWfHT4QhnKtNhq/9O6GO37bDDaSZdfOXSiAFle5uTg97aiTpYZ1wpS/UMA5U+J
         bRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912212; x=1795517012;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
        b=DPEoDMcULT0Am9/Fa1PGT7nas1n/akiw2MU0EI2OrN75dluKTVSr1uBIrHkZqRtfpM
         2fq/AzQFgwNDZv0ubC0YVMmviyfKCJz4pkol/YUH25S8k/jLzL3ecyu3xAedivysJNDn
         aMyZR5Cwby30wURO+p8DpqqGL+zgA2fSOsavPu0rjRnfQaMx51ujOsnC/XbWY6tEEEAN
         NRoDLRumGFCu8IWxc8WnCzmUsY3sGBPG9M5CH5M9uKzCXLeuxZm5VYfcU+RGseUTwuV7
         ZXy+tp0Q/UZs0TKMRf2qhPFHupeCHfkJW25LokOaSL7Hag1mtyhVLnDh4rJIavOxA//r
         kvJg==
X-Forwarded-Encrypted: i=1; AL+hErHJ6NfF4pnaBOT9kBjNI/LV9MHjyqITzColj3ORVssEkm/tkxdvKVYU+92R58g/d7UHocFRtdOIQPNl@vger.kernel.org
X-Gm-Message-State: APuU4Z80jptVS9KK4i1Z4VH4KecGlYUYA+S2vz4hNF9W3FlBTtdOdueS
	Fz9QGrmunJAa6cJZGP2uWr+fuHAxR7+boyMhYJ0iho4LlOFdxvAuLDdzJHAvTA2TIatGtA==
X-Gm-Gg: AYBFou00vTIHMXXifb/uV9jnvsHjriJeKt3oRMggt47f7jDOY0+8FhAnwCaaXv7py8q
	3Ze366Bpspng3tq1+Trl2qFK3TceKmSabnnxQoA87i2ssQPrbQYBue8vPQ1Dz1KD6K90BrZalFc
	ZXWBklipYMC7qlAg0tojXA4qydCMbH0/HP4cabZvDA82Nw4LjY7YfzSJEKjsb5fAdswtO51q202
	1d7wMvqK5hh6dZBuhVuHijrM3aGY5iBAyL3UUy7VAhHZZpqSjnNGWTuHQhF9OBgCNCHQNlO08T5
	Ska7pBwg9Z9pA35+cN69GilZ8txvSmVcjV9fYiNqx7Zz5qwxArsCrxVgo7DO/ARsFdXLjpqxBHM
	GVFKHto4+TQSdARSvvOYzMuTQvB1HHZ1s1puqLzXQuoiC90LOzMql2cdRDz2VkFkiS6zS8a6ny8
	GOPxAx8x4bgwDLkEIy24bgd2HlCOAGkV9uaLMxdf6C5/Ekkk2sSs5pvE7SZ9LsIc/Qa3eEoj/d0
	wwt/ensMTFVtl3BuMVBggN/VvuwT+BACBijhHOiQxIts/jg/fYbJ4RgRMUSnZrybE7dpXvP9eEu
	F7MJoAGEyl8=
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr281170935e9.6.1794912212117;
        Tue, 17 Nov 2026 02:43:32 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm61091805e9.15.2026.11.17.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:31 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH 1/2] dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
Date: Tue, 17 Nov 2026 13:43:27 +0300
Message-ID: <20261117104328.1176951-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117104328.1176951-1-tadilhusrev@gmail.com>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Samsung S2MU106 PMIC's fuel gauge, as a
standalone I2C device (own address, 0x3b) rather than a fallback
compatible on samsung,s2mu005-fuel-gauge.

A previous version of this series
(https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/)
extended the S2MU005 fuel-gauge binding and driver instead, with
samsung,s2mu106-fuel-gauge falling back to samsung,s2mu005-fuel-gauge.
Sashiko AI's review of that series pointed out that the fallback let a
board bind through the plain samsung,s2mu005-fuel-gauge compatible
with no guard at all, which runs s2mu005_fg_get_voltage_avg()/
get_current_avg() against MONOUT registers the S2MU106 doesn't have,
and can misreport charging status from the resulting garbage reads.

Rather than add a flag to close that specific hole, this binding
avoids the fallback-compatible construction entirely: the S2MU106
fuel gauge only shares the S2MU005's STATUS/RVBAT/RCURCC/RSOC register
layout and scaling, not its device-tree node shape, so it gets its own
compatible and its own driver
("power: supply: s2mu106-fuelgauge: add standalone driver").
samsung,s2mu005-fuel-gauge is left untouched.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../supply/samsung,s2mu106-fuelgauge.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml
new file mode 100644
index 000000000..3dd91412e
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/samsung,s2mu106-fuelgauge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MU106 Fuel Gauge
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Fuel-gauge sub-function of the Samsung S2MU106 PMIC, on its own I2C address
+  (separate from the 0x3d charger/MUIC/FLED block). As on the Galaxy XCover5.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: samsung,s2mu106-fuelgauge
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery: true
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        fuel-gauge@3b {
+            compatible = "samsung,s2mu106-fuelgauge";
+            reg = <0x3b>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+            monitored-battery = <&battery>;
+        };
+    };
+...
-- 
2.53.0

