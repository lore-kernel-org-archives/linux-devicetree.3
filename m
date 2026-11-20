Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160045;
	b=2CyAncIsKLJoxBYffKQv4ltReO6oAGe/5/lVitRb5Lbszw0J4WCZDc+C3C/rhWhvLngL
	 +rC/LVvxGhXcl76lQKxTeb8dfk8BWxgFP0q7Uri+xzxxiw4C7JfZ6yRXYGZLtg3RSpAO3
	 Fbpk2QTp2EK/R1UUdzCK2KXpxhjFPCNHqKDRc7r0JhdaMwOYZW0if6CKe1Z+YAIg9mJ4m
	 vSIPJQd2c60aDG4jyOBmYICcCdoiJl8YdxCV+/Le21gBXW/Bj0LOcszNOy1ll6/DPlI9W
	 v+Sclv22wSrxA6flYrjAF9mOs1275yhomz44lmizTgyUwUUzjhd538hRNLtPS8G6H6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=q/Lw4AgonBG8LsukZlojfPfSLAm+6/SgtPINJ0UdUSGRbtwpV7MCTotUU3VHPnCxB0/r
	 a5Mlke4QMGDe8IObxLeqwF84GLCvRqVV2wmT0OFoW1XL/RGe+tYk/lGMHRQ6/NgqBLiSm
	 +A5NXR6HDq0btH7qaOOeq1xrJU7+jkY509JFQF5yhhV6nsd8aUs5AKJ05F9k6XBT3LQ+3
	 uNoySHVinqCVvTrICfm1utNflRov24pO/ZgwRwJXRcOCtyWDoDstaWAjUmg9lvkWlOwAa
	 IP+o73NoshGYftheM7MwdUXijUvtBI5PYwhZtHRoReITx5Q4XE+PrjHwlImLLuBsUxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF060A2626
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FF060A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso5877655e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160043; x=1795764843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=UGKPN5sgnx/JqyrT4bunkDQklLznRnCu7ogj28UGxAtEc6KwzYIx1NZItncO3oCsy2
         WQwOTT4lqZnhEGkFTU2b0VsycWz3M8JsTUfgictNO4H7nhfo8Xa8SB5nE/4hoihOR+HV
         Iz93718IqHJWyQt97zdXQoV9pzVcMYIhwQCzOi/Q6u4n0TpTFiyCGzRrt53wHObDgLxF
         Xi3kUPiCfr4xbBx74tg/LQCT3qU9C9Tw0Ab5AOU4Xtu69qLTbTC3wJPvAMxWuXfC8r4o
         pAz8JNmmJFL1alSsFqn0U8j113YfwK3WZqXD7BRmX4YDkKQTGUWqTicnH/hJfPsct1Jw
         DWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160043; x=1795764843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=TMFgyFPfygD3duXYl8nxSs9A+6y8rOfIrkVYHlrlnmdNIKNALnladCp1+ahW2MGm8a
         LzMGteu95nx0FjMKQRSc9RoAc2YI6JIt0f/zcZRpbeIYAVsuae8GLowHdyoh0dRjm89h
         5TIhgL7fI3vl+GBkcmsAf+yiKq4zp9lpJhxXvO6PasvhtboviyTL3dF3xGppKjxYEnbx
         f3r1Si2WdnIF7wRWiKYGTaExGhMuMtRNy/wZEt1yKFYoKrVbD3Q/TLZDw850teqGs1Wk
         vBS7vaYHOpu6+x3zUWbNqJwuBgvvO9gjmXE71eCgeMz5B7RnzVMdBqNcLvk/D6ElLvyK
         r4PA==
X-Gm-Message-State: APuU4Z+UDke1UqP6JRWxjIagTdjwAP827xVW8YNtnBprzOGY7y8mAFQo
	rS8Kxs6jLpDvWkGNMz6L6IXYa0ndcskcITG7id8uABfMeuiIXU8GkpWj
X-Gm-Gg: AYBFou2B3c7IgnUulUJKHmlPys5wthfCE3ReD2/Ny44NMMD44GYqIni3munClw6ZnUp
	sllrFQ+LQlHmGy+Ar8uN8qANMvSrX30MXzK4r6D8CH69di+VQ24T/HJovlSqvpOKJ8msefck0KD
	EjUA694fGqlGvw8xqW81YYIwZ92nEzz5i6P3YsKvsGCvUtzCSPRoJwNuehQdtRN9hZnZoF5tnKM
	fRHH8lHugubMYmVU7WRHUYNmluu9FdXozstxyQCGbKGJ1yaZFsLdz8uq7bAiVJ9MJtn6Q0OP5gB
	9r2VYLFp79ZU+kxzMdAqjv8pKLXYPo9ozVynhzJHBjuTeKINZ8cM6ECHY4+vRIIsqqo1CBQV22y
	oKfBFZsRgqGpIoAXo7jct7Kv/OhnquDW/CKGcWNrRvfAOqxdFLp3aE5f9mSXnW8bpIC1Tb0+0Zk
	nJWWMLoyklRp5u0Ru04ku3Of/ihACjiyCFk6MQwq8zYFdg2oJexKVQbywCLJ3kjOMnGiPy9yteP
	yQTFzhzTy96lMUITS0TtlTOcd/OsRZJtlhJc6PAv1CJHQ0zQM0eXnSJtOi1Ewt/LNNEFLUhcGrw
	agzf67geEoFo7ESKy44kr+LJRzjNGq0Li2ggEYCOL6E1xmAuwKXHcheehsm+w/Jli8qFvBy6+2w
	=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr44144925e9.26.1795160043279;
        Thu, 19 Nov 2026 23:34:03 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:02 -0800 (PST)
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
Subject: [PATCH v4 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 08:33:51 +0100
Message-Id: <20261120073358.10267-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

