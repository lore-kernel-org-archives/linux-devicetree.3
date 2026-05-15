Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57823DD52D
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883739; cv=none; b=kC+vbhs1ScRcDPfoj+2maxbH9le/vgKuXwAOTCY5rd3BpOJYfOfFhUWzOvn+KQSssFJSlLaDM5nqmp8tAARFMc0abNvOkCbmyHmeY3Be3UFmQkiNvooDJhfFIsE7KqGWLzUILBV8lwSflM8M0UCE7bq/xL/HlRjLoKT9h4UZ54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883739; c=relaxed/simple;
	bh=5E5DH85LSJ3z7z6pGBh9PSNLOSGdlvDDsW4znE6uDUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vvf7+FI73huiAD8Kxa6po3niwDHCH0bDiN6yvwjibmzRjY0TvrhW/JJsR3MUx2or2RvyaS3V3Qcjya0rqIxW6Foxk7mY4woVQnUeQ2MEG5cviKp6Zg/KDUBZvFx9WhdFgQmLgDR33sk6JX0gDkrtThgQiOl/SwL+eKxZM26eViw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTVhf6nX; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTVhf6nX"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dbe437b072so177778a34.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778883737; x=1779488537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vksn7Gv7ZyAP1o/PWJvqV/RwhuiEZ2klCh9+NbtllHk=;
        b=HTVhf6nXcrZwvlMkJpx5ypkz0nMcLWig34YZ8Dpp7HE0fma+brJgZx8uaD855mpQmG
         8n795vC0cOM88+9Lrgb6o5y5Z4kOfOnYsx7/luIXR+b3bB/aewlYZnra2cV3fFvihFRe
         /R1oJULRWNFL2eiykIYh2p6FKopkg9r+ixYXAvDz5vCtHa4rO++qkV7q90JsqewI+BZZ
         Q54Hawwex6cXJSGg5lyfgzSjZsIH/1oSRAZjA9ig9Sfy7kzDDVFQ739TQoJ1mr7J1PrP
         y70OjFBPqRHMMsikeg6kAQbZ4jPVQSr3Xv3IqxNUazqG44/pL3RStBKtYEZ+SjoW8/BK
         O7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883737; x=1779488537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vksn7Gv7ZyAP1o/PWJvqV/RwhuiEZ2klCh9+NbtllHk=;
        b=kQeiEuqVt/SCHL1OsLseTKiS5x63llznIdKs835NU4mTBklYaFHIyuAwiH4UTcUwh/
         B2ahXE+6x7kqrh04hYhTANqkJ+q3kfCiS10DdYGtes3yBK8wunWA0LC71QWQAhHz8e5K
         BsSlNdXoJB5SDsVbahE6Nxg5B0ezeWTCKA/EFMGjEfH/QvcHTmqXrTpO7iPz7RymZJ3S
         IWtSIfWgJEMDtEAkUa9W6OyBYluG8tYNqJYgjU9e01vOoWihu6Mf5EPbOv/LXINF5H0y
         jug3VBbFEbIATUGryqJEDOtVol22IcSUS0q4EbjQpjUj5ABV8LZ8Web0E6JAdYXaBDry
         nemQ==
X-Gm-Message-State: AOJu0YwRajq4rPTKDU79XHf7lNhbjNvGTRLg2fwAWhI9smuzkcsfAUup
	lad8dLhLT7Z+TWoNeXMYfPpz9D5atlN6KlAb/A/+9HiJeXmiJqdNrVee
X-Gm-Gg: Acq92OHgR/KAu4O9f50cZVfayehvholtCvxdJjB+gH2nZpqh3HpmZv7I2EuHKhImJXR
	A5M45i0BamRD5dV9SMRq5wYV6DIRTgGyOfMdDTe4t4zYDxCl1wVscfpZWG/sgrJGiL2hH65HSrr
	hRAo53npnX9uLdDB5q3O+pV0/+80D2kGXmhM610uSvzrIHdRddnejhQ22l1ybyErl8jFNteuDYv
	jEFyLPEVCMmjJsAo9qRDUTd9WE1fzS7eW/SN25AkFNuRVhlXCgQnyVGm0F+HgVRfZeHyozGbFFJ
	A5hFxDz6Lqk/ICLeLfeovsOqBB62/oSJSf5gjMHnFPF1FsNuRCKHbwU4npsozp+6NnP0iNuRI1j
	2OysVaGgWj/QVYBlA82uPNdlmLSI7JsIYLvSPuLWaSX88UkThoUfo1OTWSx90GYoIpF1088umTy
	dNGtH+ZpoB3w/6i+lBgOBsI/moyL9Ugo7tUKBIzYoXyw==
X-Received: by 2002:a05:6830:4c04:b0:7de:60fa:6203 with SMTP id 46e09a7af769-7e4fa0a2e7dmr4121976a34.26.1778883736877;
        Fri, 15 May 2026 15:22:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e568c0d889sm980764a34.9.2026.05.15.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:22:16 -0700 (PDT)
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
Subject: [PATCH V2 3/6] dt-bindings: display: panel: document Anbernic TD4310 panel
Date: Fri, 15 May 2026 17:19:44 -0500
Message-ID: <20260515221947.299229-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515221947.299229-1-macroalpha82@gmail.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
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
 .../display/panel/anbernic,td4310.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..5068dd6b2d52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -0,0 +1,64 @@
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
+      - const: anbernic,panel-vita-pro
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
+            compatible = "anbernic,panel-vita-pro";
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

