Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700749;
	b=2NIPx7r+6JhNPRt+UEdSKC5JNZ8uYFvpG+JHkIrF6YpJIoaB5/SV7QWUJTNkGLnbQJLS
	 CKyRwX+F6oECOFuQz47W55IIBfjI6614LFWHAFwGTOFab7/751UcSJi/X11KgAVZ7i5Hf
	 iH3SFZQ742pq38eum164ENZfTR1SbICzbl408oPkfF08ZSBWHfhFLidFE/Hd3s2CKnbya
	 NMCKfo1WJuxS4L7O8TkeDU3cAqRk2CFLRIoINkM5lbs5GIBpvOM6C3gzPwDvsOUW3hbKA
	 FwAGuu16t8s8RNvlF6P3HApp/aYEpUZFBvW99PrIrDAPxvcXCvWXlnmNd4H6etuWZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700749;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OmdsYsPFM6ffXZsc8MJ2vr1mOgPKajCl2Rdgv1f2VDI=;
	b=SLnkO2nhZwQaMI93DABhUwZhssAoyI/NIHywwF7GHD3J1vQwv/ZqFjKa4Dgly/PPHbcE
	 TqmRpgaHwwjrc8kvqGivYIiKgkjqksTr2guuc+vxzByQc8j/p8OSdGydr9PUjiD6UDe/L
	 /FM1yKFTsOhjoWEUpzqWqcf8YyVl9yb/RI/t5BppPLmo8iM8pSpGA6N0cpF7QXUYJon30
	 01BAxRDBIvGHfWuwYPdob2rGQLHl3vgxWn6cABuXdFB5ETbO26ck5Siylo1I+H7SvGl8X
	 pmoWRTjezlWdroxwxGkf4ECxavM7mjpCb5vX80NLKKgXF3WaqsWSH4xhEDHzAThagKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igIfrBDx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F7606A321;
	Thu, 26 Nov 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igIfrBDx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDEE1F000D0;
	Thu, 26 Nov 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700748;
	bh=OmdsYsPFM6ffXZsc8MJ2vr1mOgPKajCl2Rdgv1f2VDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=igIfrBDxicSyMfFKWAQapEBL/i5nq9kBKJEy70Iz1bizHvJBgH9fzPivOyUE/xABS
	 fMHM2yyJiqHzs6J/SuDixJmTffZSAHz/higaExYzWfq7lmHM/Da1jrWjk00z5rmiqq
	 MXdiqJujJ5vUyi+DXwgMcCle854Rsp4AkTy0zjFf70qGlnuzM20xzVc5hF7sNBrOsL
	 TwBNBnw24pz37ckEWIx/gIG9fmCixziW4YAQdobG4CTcIvg4EzwVdjb64AMDAhZmhi
	 ofteAw31kBGKV00uD1/h0z6dclE3p0V4Wv5xlxt6C/cfrZ/N14BX8nsz7GCJQT1xcV
	 nWe/B0Gb6tuLA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 02/10] dt-bindings: display: panel: novatek,nt36672e: Add bias enable GPIO
Date: Thu, 26 Nov 2026 15:45:00 +0200
Message-ID: <20261126134508.320700-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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

The pair of positive and negative bias supplies of an NT36672E panel,
AVDD and AVEE, also known as VSP and VSN, are either provided by the host,
or generated on the panel module itself. In the latter case the module
exposes only a bias enable signal with no need to describe the supplies.

Make the AVDD and AVEE supplies optional, but require them to be
described together as the indivisible pair, and add an optional enable
GPIO for the bias enable signal of the panel module, which excludes
the bias supplies, if present in the actual device tree node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../display/panel/novatek,nt36672e.yaml       | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index dabee16bee22..c4ebc7df3344 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -9,9 +9,6 @@ title: Novatek NT36672E LCD DSI Panel
 maintainers:
   - Ritesh Kumar <quic_riteshk@quicinc.com>
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
   compatible:
     const: novatek,nt36672e
@@ -21,8 +18,20 @@ properties:
     description: DSI virtual channel
 
   vddi-supply: true
-  avdd-supply: true
-  avee-supply: true
+
+  avdd-supply:
+    description: Positive bias supply of the panel
+
+  avee-supply:
+    description: Negative bias supply of the panel
+
+  enable-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the bias enable signal of the panel module, which
+      switches on the positive and negative bias supplies generated on the
+      module. The signal is active high.
+
   port: true
   reset-gpios: true
   backlight: true
@@ -31,10 +40,22 @@ required:
   - compatible
   - reg
   - vddi-supply
-  - avdd-supply
-  - avee-supply
   - reset-gpios
 
+dependentRequired:
+  avdd-supply: [avee-supply]
+  avee-supply: [avdd-supply]
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      required:
+        - enable-gpios
+    then:
+      properties:
+        avdd-supply: false
+        avee-supply: false
+
 additionalProperties: false
 
 examples:
@@ -47,11 +68,10 @@ examples:
             compatible = "novatek,nt36672e";
             reg = <0>;
 
+            enable-gpios = <&pmic_gpios 8 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
 
             vddi-supply = <&vreg_l8c_1p8>;
-            avdd-supply = <&disp_avdd>;
-            avee-supply = <&disp_avee>;
 
             backlight = <&pwm_backlight>;
 
-- 
2.51.0

