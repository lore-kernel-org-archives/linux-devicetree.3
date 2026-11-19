Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=o0+dccK4BdotKlhGPhEKHjQPD+JVNOf+7/UNPW+JQ+QHb5Qi612knPAU2VKk8cV+XbwR
	 z8SoZpnsn5vjVIkoq9Gv2ZdeerwfVPvjwHZCeQJXkEwr6EsKQxD3lcmxYmVxsErNeAvHX
	 pL602ydJoXlQFKIawQJZ6lymXPZDhYQ4imF+hvVss2dDleWfchSFwPBC7JFp0jOcBUfYq
	 oXX5wnXxQm6Fgbik+Qx/rRSQcwbbZKgJSBT35h9D5RleZQjqhXz1U6CNSJOQqixq0i8IL
	 cjabu3C9kaAAb3jybZxYP0d33/W/ZpLnydhTAYLoun5L3R7h4K95LYYYeX1vCi3Sg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
	b=4gxpgcawNndnzIC595mzsYk2nEGaqU/IgniBxqouHu0FpcOL+azRXD8rIS+Hqai5ccBm
	 aBJ3nmXKEvYbZuMb50zhWRtHNW2rp+KahCoVfm9Bt9CX62CccMJyZKOPpDfga0XkI/Jq+
	 2NoR2vWG/9MC6sAvzVgFMPUTs672W7F5db3opGreJKb2oyEwGVpdqODFtVKTtUe9hsR8f
	 ZiEhvl4jdx8jRWRMAvOxx4+gKEpoEk+kwIOdKgigWRpRGvayQs2LXldtMjD6qCfnnpo6s
	 gdx0SWmqoto8w/auzTaTPTlCQgxR9zn6rHea+askZCS34jvcKkOao2KDdBY/zMcfL9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAFF606A33A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAFF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4322d310e7so322108466b.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081885; x=1795686685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=UjzmLULUbPuX6Kv+v5NXSiVfqZ4enM39iH7s3fpgsoHsdvGqR6DqCDPTZ2Nk/BSSMs
         NrRUKiKOMKPN3Uo5TCQOpVmslWSouoldP79RLrlf8zrHLk3HTSzZxmYHYq5xyPIz0ARN
         rPlk+s5mhYW6hPr66VMoNsbqqi+5COb3G/Mk/qMS3xGutAMWrfMG84+yFWQZF1G2gBC6
         64NipMh6Uj2gRF/H5gOJNUdq+DIncBQFHb31m8XboR1BhOgxNAUD/ZG4O93VJI2ZD/5A
         YPOD3R59AsyJJckYJHzVb3YCnki9aQaMZ4px+K/iv6g1J29+L0CNgeNduum8NJitorBl
         IcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081885; x=1795686685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=UUKhHGoN0WwupXXzhpGFDoAo9PkoUhs+PjbKRfiQkx2CbmFUI9dFwX2paQnap7ZyEl
         PCOpn6ilJgwvCzBmHp4x+4xUNZfso8bBXaLk3Eg3Xib8rczt1uigbbtZ+35K+gUq9A1X
         ODCyz5QnFaPChSK6XagTq7YRDNv6oKRUWqeWuLzmlyKHAekx3/gJS2+voKB/Rf8BzmyT
         uDbe+rdman/CgY/uzCMEVayWRl4rsxNWfX0T2OSI7ijjJ2+I5zm25B1eELLDFttFwh8+
         pucAhjbvYlvEepjLcko3bYkzLkQCTb6WeXD4nrBIXDlaXjfFZ3ywCommMMuiuT1Y+btD
         UG/g==
X-Forwarded-Encrypted: i=1; AL+hErGfHeh+tkXuf+8mfJzxf0rRCU5mletWihHJMbTWV7DAJlsXbfdZxI2wxH6qfY4CXCeW5PemtQJIwe0T@vger.kernel.org
X-Gm-Message-State: APuU4Z+r2ZuWJs7kmfEOXE5wnuCx8sxEAAKwJdKrS8LmM4eB1MbLA48Z
	3raLOa9Tdfvcb9V2TYoadJ1mGymQfAa3VXV8Rx3Fdzc7pl/12rTrumNk0eHA+r92zRU9XWtdHRJ
	yh1sFTns=
X-Gm-Gg: AYBFou3k+MtpgY0EA02XxTe8WGSg5xERW0mnYh0aWx7iV6aH1fjMVLEtOu+WvZ+Jjjf
	NLdwv9xt68RC7zWwxBvsARU95Hw27uO/sz5z22kNqA60QNfXqqp519S42zFuJ7BK5Ug4jWLlDji
	HtLngQlaehKC6MiX3ZBGJeSRS27rRsbKKqmsYIviBKVeDkDg1T3DmdK3lopBWMGeOXU+wUkxDoo
	7o9mszhi92hbqTrZJwsM1GOr1a3tLVHEnY4WsgLxsiRS2JuFTYQJpPMzDG9e7nlA0p+GgMsl+pG
	9ldqyi6tXvWxcBxP4oy4FPIHDDoeH++qHg5bSA2mzlDeJJyup0rbla+BLDL4b/Go6hRUNb1VqSh
	4Paf5/kpNZgSh18jC+KgshBBOFEOiXlYoRqIzvBCoR1azVr4RNKaGjc2wAcBNOHWr9CebleWcg8
	QiVSyhOCHzS2B3lgeRfL3xMdUov7K2m7BnqUBDWTfkPt9bPU0M7qUpa6bdy7HJ7GXXEDZnQyxU/
	etHDpEsL7C71w77KA8Plr/KPOQPLsismEaj181Lm9sV8Gw7lPMHe7pfM3Mf7F/yfAvWJFnGz/t1
	zvVIGWuKr6N3E7Wn+35tIHuw/qd4kLx8Zt9CY14MAGhYLgxnPNckOy5r1KlYQ7xcqFH0rBbU4U8
	BfUSC2th6yryn
X-Received: by 2002:a17:907:d7c9:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c510e58731cmr485530666b.48.1795081885550;
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:23 +0100
Subject: [PATCH v4 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-dw9800k_cleanup-v4-1-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=4477;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=g/OiRwFsFfdmnWKD7IddFC6HC4DRBlfOM96+ymjJkqc=;
 b=+9IaxyEdEXtMhI8Q3RfHlupMQA+Qy0T5cjXDl1x0aooiVjh1QhbWPkDRwu49Vw30ieXUb25Nl
 SfvolKTIkzsCOUMlU/9CFGhBywusMmHFMFgObvIcA5prfDof5CtDFpS
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with its updated properties.

More specifically:

The DW9800K did not share the SAC1 and SAC6 modes
that the DW9719 used.

Description of vcm-prescale does not match the calculations labeled in
the DW9800K datasheet for how clock diving rate is computed.

New property timing-control introduced to offer more fine-tuned dividing
options available to the DW9800K.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d0c4f9af9e52262b23881abd37cec..38db0764c0f70ad49295dcddc182b7e100a68b29 100644
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
index 0000000000000000000000000000000000000000..99f3b506cf12c63ddef1e3d18fd59179a5e7800c
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
+  dongwoon,vcm-prescale:
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
+            dongwoon,vcm-prescale = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.43.0

