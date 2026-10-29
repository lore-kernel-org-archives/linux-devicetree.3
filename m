Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287793;
	b=kGoJvFunOpFLMIuwhd0gj6SLNmW1C6dMADblLKG2b0EPs8VVPZaEa2JRzLWJblkdTJjm
	 tdO6/w9tAjr7jQMIcF1QLqMUfB6Z2rTb55TRsT57fJSzOklUWyNX2BmZmrjSxJqBbJy1B
	 NpcVoOf/ZJvdRXXH1Fkvm5oN8qRAXxnMK22U3bfyOlwqYiK4hfbAliZhoNk2Aol8Z/doN
	 IIK3bvwFkKoqPGjwAJqjs7MjHxEC9zNvVY6Wy6X6PPB41SCp0SKv7FzkyOMTBs5r5uJG2
	 nK8V6+C9UbAIEhkv+84G3x4bCb/ep9Q1+goY20e5w9SU9RZHdx4QJQhP3M7SljGMKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
	b=FAH6IE4V5NhYFHInvRJio8ADYY+5xP5+kJywmDtjDwspnH2t1HqKNjyadJDTg0luyjjx
	 kQcBkF79VQs15vJqqnCQAZCgo3MWf9VCUpRMuTATfRk5xi4xvJg8HYcMIImz6Hvy2z6Id
	 YDqB099LFbCFUnILH1ZIEGR4HMw3M4GVHcSaSjRkoz2i4MuVam/IO6pHok5l2bItApOAB
	 g7W6DJ1ObEc//D4fSe5lM92WSpwnaBZSZvlSZk+UgoGoFvC9d1ThBhgfhpjanI5i7fLgN
	 cNWwpPcv7srJSY2x0VrCk2OCGTeButckmg+b6UDlze0WohKHu32wayPdjm4778iBRlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhCygOQo;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AED606A327
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhCygOQo
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3395647a12.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287788; x=1793892588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=mhCygOQo8ONwwE/XCjbgqK5IYpd0WEW1GFUOz5phqWZjC/gDC/8oNVWH+oHiBKPft8
         CTxuJXsZwC5aNl2PRtJSslkrJE/mpuRGRs8dxMhPREMNrAON68+RC4J0I/fXcj4Cr3xS
         iHR0CwVcmvU4tcYIbLqFeqQSKmqNXrywkfUB3HV643Pj/TAUSh1nHNPGzLkDB4zUMhpN
         rhFcgOZnB6bcLl0PY9wPgkh1kA8djpO5CYR1fEwAxYT0vYQ7MQ7VWB2+SkFNxTNyNMZI
         DIClPrizv0RijoP8vBFYI7AMGhQnbcyNRncq+d90OLzPKxBuREiJuv63WmQp0zGL8+Z4
         XLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287788; x=1793892588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=lwwgWzLOUN0cpOoPxhjraDp1kJAgRmIySFYrFYkyFKc29G+MgOrmGn70vK5Hk7NjH+
         pjXDbVs6gjZ8vKXcTL6ByQEh6NUEAKp8PCK/oGiGH1lRXWZDu2B7TAPVtpzIyXnyvlLL
         ZOnMSghDyHCH/D+nnjQCm8UxowOwQFumsNfdvj14mGRZd++9vVmgx+nxpY2qxJSNvaGF
         fYLAI/ursNq0Ro2ryfFJpM1awsKa1eCdUueV/hL3TuF4Sa56KlktvlnuZTlYz5GxCsEU
         kKhv6lyHAb7lKNv7zowFS6BulfND59Ow3EcOPxbNbRPlfeTrr276sbVpH+NERCo1NqMA
         y3FA==
X-Forwarded-Encrypted: i=1; AKwUvBzFB6kkee7XCPizbxoaKngcvEv6txbl3pWc0BGbCVJ4qiemgWyH7Xo2PAZS3VyyQw2gGD1iYY61NKQu@vger.kernel.org
X-Gm-Message-State: AFq9FYKyQDrcZKf2Lu28/xicjr5VJoFT90PFEYd3nQS9WPmI/TFL+f31
	Ed8dEVAo8LNM3tDo6Hl5N06xlIPsqyGbTDy72/h2pd5NMMYmlLtS4lRj
X-Gm-Gg: AYBFou266vCG1ss5q6qiCyDw9YXvkAZnnH2c07RVbWmamvlVNjBCKERz6ldv/u2Ej/a
	r0cSsS1Msxgk4N+5KCzWBySJh5GW74qS3PWCf+PTc5FwiKV0+GtEl4/K+1sNbBgtUDnWjbHsRzO
	orHNYpmVzltrlbNbig2rfxOthaM8qhQigi7tOrsOmEyv1337DGQyxgg9qCdSmCRyUX8ivnbeSLu
	jeWXgPVID/IxSq1Www3eEsNnT2swShFUljXGLodgpMGL5WVS9EATqKAvUka1hSKccyrJdAxXVBX
	O1yQC/By5MvQ9qvjCsRbeVbhXVYbcwZXddfN0ohUhIWOqiq09aqh46Pv6kb7jcpMtVgixVJeVSU
	XqA/49m7RVZO69c/5JDNtVbRAa9oea2A08ivUYZ9OvetFkSe1wqopV4uj72tMGSgZ2AAn6wZKvI
	EDdO0FBwjPerlXfAB6jePxMT8TVGbe3t4nv7+fXP02XJ8ClCBcHeY70xmDKJ2bFHd6qeSbdMpF6
	CEKgc2Vve416tHdKP2lKrROMGNJaheZiQWjNp+EE1OJJN2/P5n2/I8W1iN+tuarx9APy4mGae9p
	wRJIqAhoSt6Xie7SUZobhKDqKcrbt3fWyZmvbZZ6xNVZlBva6Q==
X-Received: by 2002:a17:906:97c5:b0:c49:cfcd:69e5 with SMTP id a640c23a62f3a-c49cfcd6a52mr239044866b.32.1793287788116;
        Thu, 29 Oct 2026 08:29:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 10/11] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu, 29 Oct 2026 17:29:08 +0200
Message-ID: <20261029152909.234584-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..cd568d19c363a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra Display Controller based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  reg:
+    maximum: 1
+    description: DBI interface used 0 - primary, 1 - secondary.
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - reg
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dbi@0 {
+            reg = <0>;
+
+            panel {
+                compatible = "hit,tx10d07vm0baa";
+
+                reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+                avci-supply = <&vcc_2v8_lcd>;
+                iovcc-supply = <&iovcc_1v8_lcd>;
+
+                backlight = <&backlight>;
+
+                port {
+                    panel_input: endpoint {
+                        remote-endpoint = <&bridge_output>;
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..ffeb124905dbf 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -79,6 +79,16 @@ properties:
   rgb:
     type: object
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dbi@[0-1]$":
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
 allOf:
   - if:
       properties:
@@ -155,6 +165,18 @@ allOf:
             - const: wind
             - const: wint
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-dc
+              - nvidia,tegra124-dc
+              - nvidia,tegra210-dc
+    then:
+      patternProperties:
+        "^dbi@[0-1]$": false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

