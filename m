Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A73A838A
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157685; cv=none; b=iLADwO+CMcCeh3seeXNHgkPS6JXZMaopThk/Gc9iKymuPAO7/0jmvI5subDtJ76gh5/vmRLL1sYZdQ6uEnjbDYNZCatuCgRAPsdbHyMeOtJUT9iTDNuF97qdjHMB7a9gVwKtdiow0Cd3vWjp0LN+A4bp4tBgj0eG+fMF47LxMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157685; c=relaxed/simple;
	bh=snKhglGWIckZcflOiwrDrE+S7TikdgqkutBxhxmoNH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmJp8aqH2DW+WH/m836l0YTsBd9FRi07s43f6BlODAcyXjemD48wIYrv3f21QhFi0dXiYtPeRiaFUzjRvvPo8X54Bt1HVo2LLePPR49VSqhtiE4G7QB5I9gSsKEx7QNQXjxbCanxqBmtTXXpDKS0KWHdy6vRqEBkEHk0JJbWC0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb2QMAeh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb2QMAeh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so9161645e9.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157681; x=1783762481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/dzwCtwRsf4jvkojppL8L2pC35nv095p5pFGvFxaFc=;
        b=Vb2QMAehqIddMN40T50YmQiH0bqm+fxDRfBDO+af5x0M2tO5dj5+/+hSR2jMs9xnUn
         jhzT6x/LfBPQ9dJgf6GQY65x931F/WWHdAMtKarzJ7OvWQjVbUML4FgYY75/epkttUQt
         9uxuvKr149Bpgu9v4HNct9+dhVO+0hpbXkPK3lZcit/OofC4v8Z56+ZMrZ99MyjsO5p9
         lmk5pAX76t3gwCXwuPw1mFYdJaZ13C0qzGh+nEXmk5ipCJHYZdIIjsIzerBWOvS4/Eg2
         wOEN1PiMuyZnGpAVo//Z/X0EbmDeg5RNGUziYze5k0GKDBPR/1Qbi0HlK5dqLAtD657q
         Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157681; x=1783762481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/dzwCtwRsf4jvkojppL8L2pC35nv095p5pFGvFxaFc=;
        b=OT27gQhqEmNeIJT+3+Ndb1aCLBMlUQpcBDxR8SVggecLFnUyg3wrzaeYOGBi3bv35C
         qkLFG/mtOaxkxIhSVecxtetcwpLhV3wIBrlBa5xZnLBAy9M1qFJwXIfTcNSGIov/ZKzy
         ZY2umJnXzPuPdUwafvgSTkZ1eNbSOZIVVhcUHVMphnPAe0LhW17NlqovC/8WcanJAlEX
         VnQcwSPkWtjE/WjnYL698BmaSGEuI+VYxwo879i5CCyyOHT4kiv61+Y/DvFhNgAO6K81
         EuolUIeb+7L0ApT3ETlbwGdooyfCqU3ijD/xXS+b1SNpuXJTcAdu2HAK97AJxrFvdaRi
         PnYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TXTTg4BMDxOMdz/GCPnNkeZRchmZMS/RAr0Xy5CSKeaWdripytkDucsYJ8rPCbaV/HsA6Gk8srp1v@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfrLJNrYE/43Ip7+Z5uYY5gAUt4yC/gFa6BX40ZbWDkjHSq4l
	P11oIsR0iKzJA6nNLCHFK8Ervu6eAg/rmIY9qLMRMs8xru/bGC22MmVx
X-Gm-Gg: AfdE7clD66yqnrwBHTEYjmx0RQOm0tr6m86b1JwyLfSBawEVC7uGesLkRL6Bg88j0NS
	GB1UpEDsNZOjyHxUkR11tZMN+m8vHrcFdBAlyPrrK5DuSiwKEp2uSdedTQQ8FeeG+/3xRmbzCF2
	68dt/CzlWTPxEGvzup+TJQC6Mw8ONNiZlLsgv/M/LBfaCYC6HyoBLn62vi/VKIioKOjl6DM3fJn
	1uf7PeugQE/9w1p6d0OiZHJR3d1D1Vs3eIPsvSxbEFy6JA2TpatoLKSTLiPWIm3SYEwFz1vLZUt
	Ir5TZMmNXH+NgJddT8V//EM73eanHiUksQH/GkciVNyAk+f7MOToeidXNmbsZsrxlnXfq03pKl9
	k3FS7GvshzryWP+yyCCl3NeUsPZaCeeCg7Dv9q73oaq2FULdCNDlGutcE6/vmJQaaX+kUxWNIEy
	96QlWtEFSmqFk83jWq+Q9l
X-Received: by 2002:a05:600c:64c7:b0:492:7019:caca with SMTP id 5b1f17b1804b1-493d11f52f9mr26388245e9.26.1783157681044;
        Sat, 04 Jul 2026 02:34:41 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 09/16] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Sat,  4 Jul 2026 10:34:19 +0100
Message-ID: <20260704093433.273672-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5[1]->v1:
 * No change.
v5 [1] https://lore.kernel.org/all/20260625172359.292631-2-biju.das.jz@bp.renesas.com/#t
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped the tags as it is a rework dropping parent node that contains
   simple-mfd and syscon.
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..4cd7b688fbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3L LVDS Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+description: |
+  This binding describes the LVDS encoder embedded in the Renesas RZ/G3L
+  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
+  (Data) + 1 lane (Clock).
+
+properties:
+  compatible:
+    const: renesas,r9a08g046-lvds
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: Dot clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phyclk
+      - const: dotclk
+
+  resets:
+    items:
+      - description: LVDS_RESET_N
+      - description: MIPI_DSI_PRESET_N
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+
+  reset-names:
+    items:
+      - const: lvdrst
+      - const: prst
+      - const: rst
+      - const: arst
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input channel, directly connected to the Display Unit.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output channel, directly connected to the LVDS panel or bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+
+    lvds@108a0000 {
+        compatible = "renesas,r9a08g046-lvds";
+        reg = <0x108a0000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+        clock-names = "pclk", "phyclk", "dotclk";
+        resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+        reset-names = "lvdrst", "prst", "rst", "arst";
+        power-domains = <&cpg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds0_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

