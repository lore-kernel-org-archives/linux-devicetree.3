Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795848;
	b=y3/blOyAHSDebBXVGxPZbCfqLEnkt/hOyP06LS0t9mPQUBWASYJ+sSx0r70XJB13WvaA
	 rigx5Ge3Pvzrlfvj/lah87bZIZe5MWGGBCANQbayavq/Y7p59s2mCPJWhvVtJhbp7FyKR
	 0LhN1g52+DQVUn5kxqFKL7sSj77pGIi7CejAqup64e8zvr2deOF4m9fajZsi8WdeVTOaZ
	 PcXxvxnqUlC+Iz2GqsZRBA6Gwe31tlldFg7ppQySWYFAetfTH+ComcDypUlRsGTHUgBW5
	 dgG/ZdweAf0e7q7w52yO1JaCgZk2oYv95LFc2YF9NnLYlfKJ6VfY8hKMCGYx2FtOuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=ni2m4BI6oqZOFqcqkTBZLfbBfWvunQp+FegkbvJ6eex4NLvADb2ii7ECRzmFMWcU0vIn
	 GhV5aQMpsCyiiAT39FVAMZjD04FHFmrRIfCLEJZvElLmxEnaNaB37YBDRMhFE3vIJzzfn
	 +EV6nOT4KtrbIDkrk0lTYFeaKEXiMdgQLQmHWyQTFSdpYFe8YS+L/v48d9tgnvAi5a0Vw
	 p4j2PQCuNCrgdfGmqLqkXCC26FHD1z/UDqNA3Im4Ke6cRwZt5+D9S8esg3BpTm+V/g2mp
	 VGlbdMJQnCOSIcpj+RYvNgivEPp6NQ50BbvWGlZ2WM8B1k0sdWPVNN/Ts0Hodb0GDQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F5606A33D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437F5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da3QX8PX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so494107f8f.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795846; x=1794400646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=Da3QX8PXTku83HXjS5JpLZQXqckDKYkJbgCs4095ujueL7xk3JwGOtm3FVsh+o1vph
         vraZ/41wnUMcyHqO9H4jACP/PpgWADBJTqjRB6CT5oQPHTlzBDpBaZjhGqdTfhnuBLkf
         JFlbbCp6zVwNMQ/P2fUZvixOxa46gCgjGCgzNuLm8aTCjKQuWMKXKVjrjA2aNA3++fTf
         1z3qC8xIRrsdBGrtz41eYsOZSuonwsNDlBtpw1VnajOwulH9F6+f/ek7Y6rN+d6YSOAS
         1h/trqfm4hgiERV0SrHliUsZk+9z4lTK3rqudjeGiN/a91DdC+9uXC3dhd0wfXO4ocrE
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795846; x=1794400646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=aDiqRgLQ7oj2DOn4LBHUI1EuMpoNxxfJ62ETk7gCq2gPQ7nnR5qGlVVsUPEi4ypArj
         ljI156t93kIDdbb213kNkILlWzfVh4bDTmqn6QxlDcfg3TYhKqmhub3+7YJvpN+oiBJ5
         1X8Ic2bWGmB653rj8kuTs3W0iQ+t75LTmm5LfSj4U41SWx/dWuE+NIcER6w3T3pfHIy1
         BXjsc8V4IA1Usz/jkZZrG7sL3HQ+TQiAVkk5v/JPsy5qG6i9BnGz5Zs4+a2vRXw85sgh
         COaacvVbSltaRohelFYpji4iNcJCq5KbH3UlhicvAahpd6AB8YVn/T9gjWvDTUXUuEqO
         NXJA==
X-Forwarded-Encrypted: i=1; AKwUvBzyrq5MuPVpMYw1lWE2uKfo8W9vK1uoUYNXJTTt9Fw//jaI+Y4eRdu1RJn2luU0WsfE6KLJjck1FP1r@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nht0OJHM5QR9xca1podxvmKc0pz/t6Kb0qzku0gaTO4T3NR+2
	D9MvQ//kJavaB6usFqaqYjtjMFzwwrYWL/jDtwpgCx0M3DM7AiVhFqZ+
X-Gm-Gg: AYBFou3VMerLJv6F3jObUohUYZjKRiBOTUSIP31qVxEIz3ICuHROLV0g6gT0BI1MKNJ
	9iTDzNfcquZMGCdWhDeFpnwAUuBugAkLQQ91E3h7bTKUJ+shdAuTwJxFKucrG9ClWx42g6KtgRt
	sEpnL+KrNtVtsgwmWg1rJRrc3lNm4OdqMpYjF/uguP0ZFY6PQvKuKyUWNJpYkhG0AjjXT2P4Rq/
	LYuDZzjG99LOE3XSF0YqvznPcecmbb2z/fVcX1FOJRxSUFzMal59BKW4/LmL3MRWfhe41vmOu/s
	TpHt8P7iI8a3lkcmSw2Gwqaz6IDdS9PVn3QewlL6xjbXe6eWuX2XAJuAhubHZUtLTRfuD/zP7Gg
	y5JeXczb5t2vighIvpkTf9RsxsKF5NdDNXYXeWKWabo3j/w3EivrkrHylQED+UcNoIgn1faTKo+
	YiGozoI1ZdVtnfSfFw1VmAqnoUHlamwBlRO6GtJuucMFgyr71zYnA7OSG60ku7WC/H1eTlc/Ewh
	pqk5HyPSKsPLR/vGvxF92tcO1TwLbhLgwPoYtK+s7c5bWOFXqMGYpY6ZNzZfVF8QlPUcTM8XPhz
	Pp/Sn+1yUGULetsZXbl2ky316bmwAUUu9RxFOk5EbTAGgtosjw==
X-Received: by 2002:a05:6000:22c4:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-48fbf3c185bmr4984588f8f.21.1793795846185;
        Wed, 04 Nov 2026 04:37:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:24 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Wed,  4 Nov 2026 14:37:11 +0200
Message-ID: <20261104123714.234634-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..3f3f3058af52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 27900
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

