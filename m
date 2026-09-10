Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA64AA1D5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052063; cv=none; b=Mg35DCKD6STjeyKpqPiGLpNtyxgYXc6siY0wUrJIIG6SNnxN9nv4fq4ap5rTSjBGtRQwPOeqtLiSGYAO5djSVSdPf7IyujrTdG2xiRpJ/rNaSL2yalt9N51umqTmiG42sqBSKia+OkQu4c2qiR685r0BAa3iGzzUPjxEHLo8B1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052063; c=relaxed/simple;
	bh=hoSswXVWLVu8GkcK34DAUODiccHHAek8ONdPjlGXrBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inLpVR6ru8MuEDmqI9tdK8YPo4DuiAVjSw1LhEb+el3eqHQUYm6f4mevMlPdYyDcCVYUULaVOESZ9JzbH4FoGh9QR0VEDQfQw659hv+aplxVqNx9gcsBigf/uTnLFpC1vzbHvt34oNiyAPKkQW+16HowA4cMGF6CJ+I/DVhtfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RudZyh1/; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RudZyh1/"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so2576130a12.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052059; x=1789656859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/FP+/J1r8J6TVzr3mtFdJoEGOGhci033fWlcw7cdVw=;
        b=RudZyh1/SLELwYJ+6T564VvH8SFUI2Z9UWODpIAX2XHqSan62MaE8tBClRsyN1FmL6
         UUqfDYwpiMYYJz6I9qE/xP7gMPTbmJSXkGzH9x6zbohbu4ZtuAYajC97c5DaLmE0TM5o
         NbROv2NaHlGhrPF4iA6rrLJUUobaWM0xN5rVZgCbWhUAdw0ZTi29ucLNaSakia/m7zpf
         mfoAjivQp37hYod6OrFyA3OGWQ1z7SBGKnp/7vZBFaCJo5rUd87TahJuywKCk+v0SRp7
         DTgvaPBd30NLZtqdqN9eyn0iLk9RqagNgPoJT2VPJfeXBuNP8iAJG8boVtW7y9vKWuJv
         8wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052059; x=1789656859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/FP+/J1r8J6TVzr3mtFdJoEGOGhci033fWlcw7cdVw=;
        b=PJRoMoqTF9PNu2BuclEikQ81zJfzet0S5hB4u2Rz0md802IweVwl9ifrHK3qwnD0x/
         iBSYjyXpu8o8XDolgsS31F0181f3KcliLeklBENBIvQe66ifejqUMdCIgx7hPWNQSupP
         S8qR/Nd4g7oGkKaRzHs8H66apSaOXEXfYts35otY3Up/Xr+Imj77wFyeHjx/Mku4jXIt
         Eeyx6gNPEu8P/F7BerEB2I91qW2C6d4kFR2hVnREwI2IlCaWjciuhPJQHjfJ8BIIkZ8f
         X0MZ4xBcmZ32n5cNWh2dUHNp+NgxCX1Hwv2VaeMuq6wbW2XlletPABPcnU1iZE+5NQUW
         kLiw==
X-Forwarded-Encrypted: i=1; AKwUvByngc4t+ytoxoJ9OCIlZRE0dPmHNe3mCSa57tmL+vU267YSB9I/G9jdLswGRFrJr8R4Xuhgl+0Y5kRI@vger.kernel.org
X-Gm-Message-State: AFuF++kFdNteydu9Ymf37lFM/kI6i3yVWQO28N/7O9Iz5kx8ww5a6kZT
	2acEvAsGpxMJzBSAewI1F39myGnIi4A30TiCKhz0/EkNmEsQ4M8zxKu3V9Jgdc4zpOY=
X-Gm-Gg: AYBFou3aB6HquCsUjXdFNcO41cBUGJx69aTh6rU+6sGebQeLJmt4RlzOKx55yhmVFmf
	jhUzmi3koVNSUwH7eh1f9tFTy1h9TyvAno5MqyVRZWJAjusFAefyms4gR0QWOU47utsLqwJCmTg
	ySaUaAcMJBZPmoGcX/Rdu5M2vFhTHKHprujc6+RfqqMY6tJBslOk93aFjsr9UVwbR6WPy7vegqO
	rj0xo83NexCySUHeW4UKoS3n3A+AJGNe3s2laeYJYajzNFurs9hOhp9qe58Amr8XE7AOBkbyl70
	20G5QKteWXKjiqP+ClyK6VFV+veqbb1DHOWSlk4T/pqjjcpPkEpl7XuDPLZegzJEluqwE+DQFuT
	Q2RR7LUN8InBLnIpfDVHRaqiEMsnwB12sOdPN7McEvv/poFFj+k+SxM/y3FmYlHZggLNZU9h2ls
	Wdu2fFRE3oNycLNG1zqxBqMphdeTZjwwXFz52eyo2eycHk4xT9bpgWq5PtkfVi6Z090+QWjT3LZ
	TEu9ZM4crw2mf5o72yd3T5nM1REPhKQHjvsFwCqTE+n8AL7a6y28wWwDA==
X-Received: by 2002:a05:6402:4496:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6a99caa4ab3mr3245892a12.9.1789052059555;
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 10 Sep 2026 16:54:16 +0200
Subject: [PATCH 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-dw9800k_cleanup-v1-1-608255ea61ab@fairphone.com>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=4019;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=hoSswXVWLVu8GkcK34DAUODiccHHAek8ONdPjlGXrBw=;
 b=mK9NBTDF9vNQff5ArJEJnZs0qmDIcE1+GHUJCkp4/mfoWcQARvlLym2h7RHwXkoU/KN+/hI0Q
 E+U5wCvToxDBDd8BKydh9zjhrjYkWkbWhsx77cn7VwX68fvfo8vz1PZ
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with it's updated properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d..38db0764c0f7 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 000000000000..046c0a88bcef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,clock-presc:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
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
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,clock-presc = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.55.0

