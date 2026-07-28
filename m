Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B041D4FC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230303; cv=none; b=T7ZAkjE3QMTuWUgMBluv3SziW43n+zhJHcKcwYkF5rqK3nOsjTufYlKY5p59uE6qO2XEJerU0MFZIgNLnRIIROIMfg/winxOIgWXODjr6BIB7BM/3cQuC4EoEBtFoyQFDyJirl1+dyozC2sj2MUU68G16LolMIFtCSv0R3w9IlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230303; c=relaxed/simple;
	bh=oWT0z3sYbdBIxj39xHfrckXBnQbxT1C0dn7AE/zBdBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Md/R4Skf6tGm3kDnbhB+B3HFXn1kzXwtzg82T5Cm7MECflW9pHD0ybJ/2uoLairOqerxaQgcjnjlIEyCkeN76+8XCrv38+p0fu1kCleGs26lrA4CfPZinMOkzZZJOMqNkAMZZGkbmL81t+it0/hBCRTyuLoS/AUihSKyOa1+Nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A+M4A/+d; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A+M4A/+d"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cab973140bso48553065ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230301; x=1785835101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=A+M4A/+daG/izkUbu3m/UXYOPiz6PxVrLZ5jKcdoLN2/ixgDVIJcKrAFksznPWetvg
         qLLKk004p0TH/t1yIZr/CaHX3Hlx7kqDJ1YXWf3ARgMzITS0DRdIl5SBjy9dkrwYGKc9
         ka041sFlfnnP3OZJGq0Nav97KMKuKtiFubWfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230301; x=1785835101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=nKX2rEHTr9wxKXQPgIqgY3ECoW6Bul87aI8MILnIqOnjgkGVW577rxfr3DJ1FJYBj+
         VYFTQnQj8qo57kQgom7Z9oKBLK8vaVm1PUtxVVcJiT15avRigaG9mIApiX1HnTEoAugj
         82H2TOnsVylbnAmp7/5fdxVUfk4obE0jHZH/hJ/8foQdw1O9yQYDnwQa4DgXEHzrJvTb
         gdey8FleMaoNkvtCnmUBgHQDLGI8CExIGpR06X1i9W9Z4xUH35WFnq6Qsj0Bk49GvWcj
         VCBzuqysHAVNPE7drwZP/c9RNEH1itaW4MiWGEuPXJAmCy6lNZgCaLBH7Ygf3JptyQvE
         3Clw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4rwqqnNEgqApPOLYGiDRbDr+j/EvGo0epqdOiGRpNWwKCcj1gtyY6elfnS6VlyFcilf7JtxL9dq+0@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUio9ls4eRWq6QKaELZWJyJ0mMreScY2jxdycKyH8UmHXMLJ0
	PrZmk4NTtzcEj0qm6E+h46N9+1yDQx4HHutsK7GwUi2WNynZqAdG9EVUBjlqntOvTg==
X-Gm-Gg: AR+sD10M098L3bwz6ZHa/srWBhKjTNJtqaL9jWN6z/qcvpaGA6tbhr2Yf/Kw1GSL7I2
	6yOXER9Q+9yX+dfGLvZaz9uQx3/s2rMoyWZ3sQzlzyj66DZcIzyIsrcTmlub1ygd444mEhuuUGy
	MeIplvgCYBdUeC0MvbIvnZbJu6MnhytFakFGHVvz0YcY1A4RIp8J8baRv+85iTwslobweIX2gTU
	FpM/pCBJdfVjFb8Kl5owySIxUYtIXGNOvU1slGMvvY9PGeF9d53G7E/cnVimfIcWEE2RsHPeMFv
	tbLdladgcX0uX57dYSD7BQ6CbQj0oaunyekxhvK8eP4q1BeEx8NX6O2QStVK7eRFXK5FSu+LYy1
	A40KJwzMqmEtEXDzGUfXqqRxsieJimCOd8TFeKHiH3uG34MTN2kZCvn5PIfZG2U9fLJv+J7ECut
	+9F7azcBx9uNtdO+1g9dfjN7tpHyQf8lajhZRacQZ6SBfXsSpkm+mspefAwSmBdIuVN5RXyA==
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr18424095ad.10.1785230301466;
        Tue, 28 Jul 2026 02:18:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Tue, 28 Jul 2026 17:17:59 +0800
Message-ID: <20260728091804.382753-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 70 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03db1ee9e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.55.0.229.g6434b31f56-goog

