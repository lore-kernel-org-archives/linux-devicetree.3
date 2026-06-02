Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B573A7852
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435670; cv=none; b=XKQgDVztIrVsG/a360tShFpRd7ZajYSO3uVegPf7KvkjWmAPtyV8nhTQvrLTsmNcbbLZlb7HDuIVTdn9xCU68f0PeqMGPtA6fTuS8RLzJY+GObf+oEzOyz3hAx7rexLX8dHU4HbdkmG18Abj4Hq5s97QF9Og3svotamVetuUu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435670; c=relaxed/simple;
	bh=0NME0sM49RF5DaMChUXyALkrZCsgLNDsxmIMYYiB3/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pynykzwVUQwnkyzQB8tEvyPcnUCzrhFCpdl/6i5AYMnpnUCq1Yd4Nz17CHkP0d8QhEd2SYHKvqzqwAXVpFS7cmKD9DVIiJPi4TwsgDEGgeDqUD208Ohe9rV+C7s16GYLmrTy4vhOFAay+IxzOjNRbADa/PnB/m7TKVNMzf5Xkb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+Rvo3bu; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+Rvo3bu"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-48657fc84a3so300820b6e.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435668; x=1781040468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=m+Rvo3bugEhw8qHx3paIS0n2s+kDR+yUUpbJ+VM9ntQPy0KWx0GILnBdFm7uoS6vdN
         1Xy/mEo4J9HwbnWnBuf/FF9/4eo8ediJ+XltHOunMo62Y3Sc75MJ6Ta4VOyvRqsdVtV6
         5JUGMo9e+W43nTV8LOmXXtLqlnvkT/AOqbMb8g/M1NNl3RbbQpfZYhpvpe8xX0Yao/4I
         zksphukqD0ZkMZQ+L2DM4xQnqEKczYm7wF/QozW0bAf/FmX/cu37iJxrFUxBZF4C5Ylv
         aKrCfrnyN/Xjw5nv/cQbyIX554vXDBqVDG0i8NvIbt3q8t2c7zHvHEesSgvOtq4g2h2X
         YNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435668; x=1781040468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=Sl+n2FI2vShsfuir4n8b7tdri5YiEQ+Wdd+XTvQv4bNtypAMvIWPG20qq8IMe35qvf
         3t6IKCOjl+v8EJtRuETss7h+M+iKTNc4BK2PWWNpObJy1B9IpPMt+fFkO1rNvQoNmro5
         Mgif/DeChNNlvtjespoY/iVLziNPPCcY8xUmyhduyziIPWcEE/1ZC+NPfZxFXLGdY9Ba
         6J0j2Frno62X9YocQLu20SFMl9VdSXVfgpC59mg3HFjROC52xqEH06KfnKVTP1q/XlAV
         HjFTyQ85129b1xtz4GL7mc30wGkSK3tM5K6ll2aYHRzeNmDupCpxiZ8Ookqfgxr+M41Z
         //ag==
X-Gm-Message-State: AOJu0YzhffX7vpjDmwfQFMMF+r/S50ohWPwzQifNeMwV26yJS5cidhMK
	Ng+P/eRD9nknnrcMtf0COFyxhTernWZNnCLLxodORPRka3Vy2KYLC2fd
X-Gm-Gg: Acq92OHa1bRUJ6zExrpISJRK9bRfvu8y2c56sDIcCziQJeD/X670cwGJQwiuO4Mui2u
	dXCgPfdi/3r18L+GrSAC9QC6pSMoKEDdzf/PxAe57f2nPrhupyP+7seveoKV9cqrnwLAZJZYKyw
	XQB86bPJczCwrRP/bmXYta4hD0kbRyOWr3JM7IInBITouGGq/bprKVFFb1Ih7WzQprZ5Yf0SRu1
	njWeyuHiAzJLmnRyt1Qe3OPZN425H3fUyAmWc4Ttpfi4TlUZKfGzOWksaXmbnlv/0Cn13hHmo4N
	MoABKQOeOxJSrlpMBtVRqjvPR5TDlv5ii41MmOsjGi1oFEoZDf+8NsIEQ4kq0V8kU7FGgzLS3Ua
	+qXHUD2ssrz+Lu8e/cMcTGZOodMiY8mTj/aPVrbYkDDoF4VqwDEGJ94z/LkwkdXKUPwYmV7DjAu
	NeiLE2FkmaBopqFSDo7aG9LaXMMES+s4U=
X-Received: by 2002:a05:6808:1512:b0:467:fab6:c7ee with SMTP id 5614622812f47-4865abb3306mr386445b6e.38.1780435668533;
        Tue, 02 Jun 2026 14:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a53bcsm216722b6e.3.2026.06.02.14.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 14:27:48 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 3/6] dt-bindings: display: panel: document Anbernic TD4310 panel
Date: Tue,  2 Jun 2026 16:25:09 -0500
Message-ID: <20260602212512.418166-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602212512.418166-1-macroalpha82@gmail.com>
References: <20260602212512.418166-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
on the TD4310 controller IC. It measures approximately 5.5 inches
diagonally and is 1080x1920 in resolution.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/anbernic,td4310.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..6f7f92b9c860
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,td4310.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic TD4310 Based Panels
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+description:
+  Anbernic TD4310 Based Panels, such as the RG-Vita-Pro panel
+  (a 1080x1920 5.5 inch panel).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - anbernic,panel-vita-pro
+      - const: anbernic,td4310
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vdd-supply
+
+unevaluatedProperties: false
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
+            compatible = "anbernic,panel-vita-pro", "anbernic,td4310";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            rotation = <270>;
+            vdd-supply = <&vdd_lcd>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.43.0

