Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181137;
	b=1ijJmfEVk9snl2YrE2AJtFd/TF8urnjVEUCCulo+b9Jucuykzy9v1VuOV056R9DKVJhT
	 FRTFvK6K7BX2NtzrBunStkPH1BAvZDsngB5kZKEoHaExUz6I35kN3gF6hpH2jCozGAAWd
	 202JYzPfmzRGk5e9imPsX1uHZgjj83nJph5oCI0rd5gB5iamEZXbyWHBQ8CDR/1CVNjAS
	 TyL3RegahcrrZFwdedDywucQUmoMBNnO1PEEcqsuu3d0FoxqurPjbKjjl7AL9Y76pWThO
	 SLJJbZWNN5wwqfBkVIhRi5SA6Ga2Ax/Iz/7lPjqsCxxpQxBaerbQbj9DkU3eQZNpNjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181137;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IFX2JtlTbr+jLq9ZrOSyQEw1TGAYJjhnYQnxGuQNP6A=;
	b=dUckM38gvmlfzJMbqLfWz+qY/OSgb2/JzTUp6oQgdGldD2ijS1PP8Ab1WtMKw0/AX8jZ
	 rH2BtAtmT4DlFoaDASh4VQDt+ayvUilm8igmJeiLx5YQOwin3Jd6k1t5ciWmg4FMaWT/7
	 QOnenmVUBM3RIoAreQ1Wp2bAczrqzo99bWhYMh7wmRNWIQTuoOHfLyYjuoxqIrGwfbxIo
	 369pCP69LOPuih5zaVikE/RjJKF+KRXH/6TQJyDUGTSNwLFTl3K5y/gKU/yv6+ym477gD
	 Yxn/79ZLdGVy2CqsujXTsF9R7HiyF5+P/zefhs8kbnhdS2gHO5qHjVtc37265+REl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8+cI6Z9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD15606A331;
	Wed, 28 Oct 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8+cI6Z9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B581F031E1;
	Wed, 28 Oct 2026 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181136;
	bh=IFX2JtlTbr+jLq9ZrOSyQEw1TGAYJjhnYQnxGuQNP6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I8+cI6Z9tvUCK+VC9D/wPLlgU/dA/XjAIQGbntm02RKhQxJJwK/2E3DhdKqIKlKiz
	 gk5pII3D6mwzsdoNk2JWFPDR5lWrDNZAC0B8pCVuV6TEl5pdQYNSotIslNJ3Aq2A5e
	 3pXYysmDTT3yqnfp45UWqmEbiO0f9g+BXgooKKNsfDqiyKLsWWtcjTxI2RBgmY8Puk
	 SO1fm+Ad6O+Dxz+2htVryuxykye6eZ8ix7He+UUYvLa8ytIiD5SqdpfDjBtdDRa6W0
	 hydg3enDVyVP+G6Ybn1Eb13VbdX+hy8FGvbH2QU9bEv18yCF5oTTMMwRwFTW7x9vOg
	 Jh+GVs0wGbb6g==
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: display: panel: novatek,nt36672e: Add bias enable GPIO
Date: Wed, 28 Oct 2026 11:51:45 +0200
Message-ID: <20261028095151.1682096-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028095151.1682096-1-vz@kernel.org>
References: <20261028095151.1682096-1-vz@kernel.org>
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

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../display/panel/novatek,nt36672e.yaml       | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index 45743376995b..daf2f96b8ed4 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -11,6 +11,13 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - if:
+      required:
+        - enable-gpios
+    then:
+      properties:
+        avdd-supply: false
+        avee-supply: false
 
 properties:
   compatible:
@@ -21,8 +28,20 @@ properties:
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
   reset-gpios:
     maxItems: 1
@@ -38,11 +57,13 @@ required:
   - compatible
   - reg
   - vddi-supply
-  - avdd-supply
-  - avee-supply
   - reset-gpios
   - port
 
+dependentRequired:
+  avdd-supply: [avee-supply]
+  avee-supply: [avdd-supply]
+
 additionalProperties: false
 
 examples:
@@ -55,11 +76,10 @@ examples:
             compatible = "novatek,nt36672e";
             reg = <0>;
 
+            enable-gpios = <&pmic_gpios 8 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
 
             vddi-supply = <&vreg_l8c_1p8>;
-            avdd-supply = <&disp_avdd>;
-            avee-supply = <&disp_avee>;
 
             backlight = <&pwm_backlight>;
 
-- 
2.51.0

