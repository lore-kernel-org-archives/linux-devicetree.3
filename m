Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190097;
	b=U5EDRQG6X1QssrDw9mPXr7bVlGyDuwRB7QtNxi9VkmRR40lSXfV3bw0MxdWxhU6+sA9v
	 VuU9cU9rAkTOeJZG+E2gZQGecbZYDFKafNTyQiaXpWgbTpoGcV8D7XTEcUSPKoyCVVgwr
	 tPxf/H+xEXdokQ8NOmcVD36fpQwECQYJ9qGpjt5R2iug27AmqaOzQpztjURYdwsboaL5O
	 7KLUEzRftLdO17cvkSQAB52WLSbH6vZGYt78DkpofLdyr7F7FuIwDS6DSkFqX+mK1HmxY
	 UHSE3Ou8YCTZh3GSiHQmaAcad5kSQ5qEXlWSQxj4da8PKViCg9D5Vth2q26XDbPzneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=RkFyzqSJMkhFZhPaKv9A2BVNYytAnR04z7bT0H40t4tAdlSzOs0J/E22cj9uAR3hDYH2
	 fp/bBq2NnZld6alxvek40ajjP9aMqFrpqyeALM/Cn4xutmhDUv4QmQnML6NaH0jQ7zNPU
	 ClKT4oiJ+s/MXI41GpheTE2+ScDcpcKflZpOJwGDXtNmFeqVbEIqmsQWEDWwdR4DfYzNK
	 mCTeUs+mcbwsZ2Pykz03rHclY5VZ0G0Ar3czV3VTWh51MRZP7FoPdaWEIRSKwOGdQU9a0
	 eRzTo92GV1YQXUWxOusAvI1FxvlILh4SuwdR2rSq+nta7NwOoyezlA6JhSYyce82onQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21FC60A2624
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21FC60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8360765e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190095; x=1795794895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dpaivp5ck36xhT0mSf3cEhG83JMNpndV/TDWJHrvmuFpnac9HUTpZp3vuYPaad/kOo
         RGhn4lKUpnnVcpFC/yaxfCyQXeRrK979BXupamV4LBS+vKLvlrb2gh8SWEdAy0rpHwKL
         HhorfYU3lt7r4/teZcJ6M9g0lzuHVgrF4jtW73dzFzeHF2tAerfB+OG1PlLOYWMKRgu0
         7Km1MLWMao/4k8glK8Puv0YOdJpzpv4mYxmhlkhmLPyJqN5QDMkPtPizb13BlzsnWgzO
         MPC/kwklGeqDxJnmDreueLfzrZwysMXydWVAwE18acn2eOJSoHSeh0N4i4U/aAwvZJ4O
         Hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190095; x=1795794895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=y0WpsLPKx6TKDGm1A4vwdBkonT/kIB0a/E3jfi/Zk1y7wOu7+WBjV3vu3ql5hUhtFn
         WvAiYmQr5/uUxmel98KE68kAve2THKFI9Pyrkp/2SUq8xHtPD4MhAdMg+hlYXY+aOpBm
         r6Malpr86hxJtel8yEnR+iuh3OHuYBNShcfvEsl9PmEvMQQtDvnEaMzyeO5/rKq8TqrU
         N4DlRs4/da4W4dlOhn/vGmKlcOBYKRVLxCmhgPuAPuebg8eAYlx85BQFJ1ps4hg6O0Xj
         ct9Bv7ta34wgN4h5C7NgRF12jEDxXNjj3/BBOS+9VReAzCfSBszM8lZZ2Drh6X0uAsEh
         ATlA==
X-Gm-Message-State: APuU4Z/DMStVnDyGQ733uhh333C4LnGanqIJtBnxUGuPn5XQQawgykhG
	hl/ti1rh6MQm97VbqY7D64ErTCoFYcu/4zGi3IBctPg1yK1CTD1NJh57
X-Gm-Gg: AYBFou0y5QlUpvzL9J+H5N4A44xbFeWkz9c2h6zwX2s9eXKFL7SlE54vxy78hRxH3Zn
	ZKIgBj0Ll0EamVUVgiuBTdrjLovwEuWXvL7YdM4sfyxXVuY4PxYTNigV4SqUC6/2aae4CcBi9c6
	nj3vncMuua/9UziCgSRA8FnWv7QjYZv1GkMYbq1A+9AmbdCk+iVtGWvFC1n2lEKIz+MhsU0mhBw
	l2BOwYIDqTqdLgTH8Wnko7EzZDqPvvVkRv13JskjfnUHt/QUHz68hr69sagxHQCvz817JCawiFj
	KhsCsNjkeRIxVVsBsn6TeZvZ4Dz/ljACaQX7uYh5JOfb2cNaI4Nik4Y/1BEBU8z/onIA/Y485B2
	ulO+OU03zHhwjt1x5vZGRd+CRBG31zAh472ebizhtbn69mGBlm6FU0U9syob35kzmnB9KOF86me
	bye1gi71rJlk8T6e2EPbtHMR8DRliU0/oeOdJ65YB7jwUTb+lTMIiknajhB04aH6B0XmVWmrIda
	FDL71PX6ULIJXKKSH2GpEPqS/d/BY9JPkI7/pWVfx/bQh9bbGqtt/l6E+mvhHkWKS/3ssP6lZ2G
	cMB0ZHS3jMeuIB8wob467u/3WfJQsV3FrOf0xit4uMp3xCHHTmep88+ZudQX/rxtOjFko5TW4F0
	=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr89360365e9.23.1795190095071;
        Fri, 20 Nov 2026 07:54:55 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:54 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 16:54:42 +0100
Message-Id: <20261120155450.7719-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

