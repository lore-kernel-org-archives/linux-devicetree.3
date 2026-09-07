Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EA47CA87
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781963; cv=none; b=U9Ysya/NcjGBhmw6SiIgK5y9KMXMxCbR+YXFLX9IKFxkdW9/wT5ZtJ6HktIEAgiI0c+zeOmTL1x7V+87OMiyX10Heab9SMgKHQ2+bKncZwHd9JAUWYSN5huZnr8Zo6euXBUASaU2uq4Q3UVNYx+R4mutSy5Xmw44Fa+i/+Hqgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781963; c=relaxed/simple;
	bh=qTroyC/eouHh6FV6jHO0fBzSC5cZJgKW04iNQGXGDys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMLuJePQIFsO42eyfeyTZtPXEbbFFjk3s78hECu0pNr2SZ0Zaj69xT7KiBllaojauDuTKGzMiUxGXssm/J/fh9WZVE3BPAz6BpsXfOsjK+wSvnegl1PoT8GdlIodUwavf1PEt0Yzl30s3SHROxas8xYRVJv0n34gm5t97AtOtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOZ3+MrF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOZ3+MrF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e4998d28so2724108f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781960; x=1789386760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKFJorjn7zfsDROh07dztN5ti3ZHf/iVGFIzCs+Axs0=;
        b=AOZ3+MrFOBjYEEJpmKmf3AUpZSDuM2NKTjJRIElU3Z5EF9GeBIl4m7o8AOj14fw2Uq
         8N1cWOYgEvIvt4X3B2DDqmJUn/qjzLUleiSUqe2vFarPzrdefg36AgYFtDnqonQQxMjT
         yRZlf33qwp5gNYg9VUVi/FpXs5E/2EHXJ7ZICjBVn4daBH81du1TkWw5J1wjNf9bOXlP
         QWdIYc8u5gs2J5hYvCJUFN7LUZF/L07NR01Mbvdd1qYqoJ028AcZfE1g43YVnTCGk+YH
         Vwwjar/OyjxNcDXv16S9gszRWRZ7iVEdl9xkCsCHMpHYl14cl63WZiLSC4y9oxVURViR
         a58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781960; x=1789386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKFJorjn7zfsDROh07dztN5ti3ZHf/iVGFIzCs+Axs0=;
        b=WzP+ZUif10fpborE4hazSvtFBQ+d7ZTjW1LBoA2QVH55r6JKnSDtw1pija1btWnuVA
         ZUcxhXGm/mGjQ6PZMkRXnrOQMizNXavWwqJH747drQS5r4adNxxYP9TknNo4OGuW+0o4
         fYlCPzSFnnvFd5E3gJuiMc0cld9LjXkcFVhNFydvo0qGrzLctQEg0kBT72CcPG3FKRJL
         ySspM0WbWVOQgeOOWHLd39vnxBPI47qxfEyp70G9tykGoQSnkX8oYEoI2gEU5MNAwknO
         DKZTHxkw0ZyHE/9/xb3RjYoUOc1F5CPT6YF1rNbCeNE7jdUy8P7h6ChhKdMIS0yR2bjV
         E6Xw==
X-Forwarded-Encrypted: i=1; AKwUvByMe+22WEUeJLOvlUq6xjiYKlbT/EOR31Y/5w7tsPeNL/KWjx/xXMuKvYrkAvxKHEaw1ZLsX//vt9vO@vger.kernel.org
X-Gm-Message-State: AFuF++ngnBdJMReNf/+t3+0b8U0ALpb5jI0N32QEwfPV3TE6Sa2J2qcy
	TvCQGXCC13dOENvoLZ8mUOcG6sfyNFbvoykwXnZhHNkg6FdtIqEBqiTi
X-Gm-Gg: AYBFou3QcO3ZVdQ5H2gBFW5AI9EUdlOlFQR3ehAbvImfbzG91LvStaEVmbi35uvvLhV
	SCpPNAAQboecrkZx8EnwieL0BhSBawYfiO9zfttpc+o/dS3O57Rm+VE751aYg8iHGHq7UrX2z2+
	BXKTSHeBolL6Eatba1qRINxyWk3c6aJMO/YjQj1YOK/ihIPISuVDCXT561Re5Wq5EWov/kH8uOm
	FxFkvIcAalhijgK5GrXw2VdoCq6i3b+TxAaCcBxAM/qu8gLT+c1yXo9DFKs45UyJgEyZ+X4ojyc
	YUKgC5G37YKNoGhOSZ1yhNcxiQ5k4E7vAhzsGjWKnPY4BkcgNDounqsaUFZPjUvdqBGexxzCCmy
	QAMN3e9OIdSPymZ+ai6xESIgJLuqduQjJDi07KbjnQ2docyJSuHFGENJ8/FwH0ZxLc/lKB/Hqcu
	n8DbFe4mzVhGLbpsOlp/wpFsPu/5T5eeM+ggd6zpzk8+Y5ZBR1PfZb+j87hcKVJAKN
X-Received: by 2002:a05:6000:220f:b0:485:8c16:a350 with SMTP id ffacd0b85a97d-4858c16a62emr20292762f8f.40.1788781960074;
        Mon, 07 Sep 2026 04:52:40 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26830718f8f.3.2026.09.07.04.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:52:39 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jesszhan0024@gmail.com,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS662ZS01
Date: Mon,  7 Sep 2026 18:51:29 +0700
Message-ID: <20260907115130.95394-2-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907115130.95394-1-sevanevorotov29@gmail.com>
References: <20260907115130.95394-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for the Samsung AMS662ZS01
FHD+ AMOLED DSI panel found in the OnePlus 9RT smartphone.

Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 .../display/panel/samsung,ams662zs01.yaml     | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
new file mode 100644
index 00000000000..b2697d140ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams662zs01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS662ZS01 DSI Display Panel
+
+maintainers:
+  - Vsevolod Nevorotov <sevanevorotov29@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams662zs01
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vout-gpios:
+    maxItems: 1
+    description: Panel VOUT enable GPIO line
+
+  vddio-supply:
+    description: 1.8V I/O power supply
+
+  vdd-supply:
+    description: 3.0V core power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - vdd-supply
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
+            compatible = "samsung,ams662zs01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+            vout-gpios = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+
+            vddio-supply = <&vreg_l12c_1p8>;
+            vdd-supply = <&vreg_l13c_3p0>;
+
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&mdp_vsync_active>;
+            pinctrl-1 = <&mdp_vsync_active>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
-- 
2.55.0

