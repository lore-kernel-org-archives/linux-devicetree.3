Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F13BED78
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643584; cv=none; b=umHQb3V88QywoEZSDn3rIdjKA5msvQjlhMterUlPEQzIVTkBDc4akVj202QapBa1gWvoDsW6dEZNfP6VPcZEhMw7XjyiJSoLxkNLG2xwKwkGi/BwJbx17HXsedmPNLhNI7gHAFHv+AGF+wJAvKHbimmZ+0XwTRd63tEY5xvNZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643584; c=relaxed/simple;
	bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6Vq25aNZwH6XOWOSRxsbSljN/LTqtiGTVHwdIo43xZ66uiH1cgBMA56TzUzRsqeo+sQNYev/JyGePykf0G4Y9J9F4PRf7N9uCsOLDMqiBVVTeAfsMg04o8kM2PX+kfdOv9HkOdx4Fovyncexr2+VoCTBx5AfjkFHCkIM9QbbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WFqjLdgq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WFqjLdgq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so21337075e9.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643578; x=1778248378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=WFqjLdgqikb2NMmt4R0e8pbx4vsG03mmeG9DJn9HCaGT2C/j/P0yZKs4TI/Y+7tE+0
         BD/bQPoHd5iSu+10uuqChkc+24vrL5sGcBcYM+40V00Rm4mqY2y7i4bB3RGkphUi8wXD
         9+i/kaJhyVGf9Ai5Lrch/2LPCoaskWgHnVbyqy6HZAUDbkjgjnpcfgXGg5dAh9RzYD/P
         OWtxEn/Vl3lyJTvn5a7Gnsyr+fUeWRhKSxhExra255dJncv24S9OnrxTcJUgcHIrU9tX
         4SaxMIkw82t0/C1bURo1HwFxcDSG6iSDb7wLHpJLa3DhVhROiWKfUSupQi4HgTbu55R3
         mYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643578; x=1778248378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=MxJBIX5KHoGTQMA+sm4Fti9HaVy/5XbO0L3h9LNmywbnQ2f+lQeX9o3jP8Ho4WlAmT
         71EQIoDLBcWhJ12MZ5fJzB5WQt6+Zt2Xyh3t/nCy7ON4teMwEQz6JKlnTLmNJsORHQs7
         v3/gsHNoKHBCarBDLB2A62Uw54T8iMLv19v59oNeAm57PpeQBFYau0eNyy87CqSIVJ9n
         4mAPCsQNqY7zOujAXedo3T3FwP6RYT2bDjmuzbcJagWtL9YmFTyyPoBdGJPvmIEGdce2
         VKRHw+z0TYTI19tRsq057pXH8q79ZMoVS2e1gDvVPGZogWmKgIy7zzmkfqRjsrw1Vavf
         hGaw==
X-Forwarded-Encrypted: i=1; AFNElJ9pnlkq/3BWHp3vb9n+bF7jHvj2NC7HjcLmV1Krb7W05jsHfYjIbwOlH8GO0zBCiewo1MYhAGlwDJHH@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1taZXzDer9bON8ZWI9zovgzhuQasZLJ7Nxe90Jj7d+ZE4kyK
	JZrXJYKL395XXSPVLUG3TFiD4ssKlWN22hkbJedpNQf70Btz0+FIEWNVm6XX/FI67BI=
X-Gm-Gg: AeBDievjujnPsNCQhM6Bx+3+lJSq6kRunZGU+WZ1TYC03TZdhYIdieX/JdFe7C9Esp+
	NwoZ4Z+MRVtDHjuwl3P+sXXWUHTq9/NuQe5x9JxiafCNSZEaU1bkROifVg+HXVGEcWcgkts1Hkh
	6V46S1G31l8RnwEJppdT9OUg8n3tUeg2HnrVw6svUEMtGWs8T6xvyBR5C04xGOm5dxVWzjCeYBv
	ieBZK0JTIdhSeYTE+kGGzUlx01khbQXYIxxucI5asuVw2OY1HsKpEo7anMY7gvdKkumVFu3Woxx
	iuV209p/eqj2YVDmr7s98+4nLWc5wBRIRjsdisUR+wN5rLaL6UZL9JuErjN+a0IOkd94WHDein7
	SkRymhVKvPfM6K9o5vn2WfJMT8WIAHUERcZSLgDnpgIntZf/lt4JD0EtImn/cXuSJ8/yfwbxTvg
	Qn54aNz4EpuS6u/MYmnRhn5DjcfU4jM2VB01l6DHNUp1g7EtiRNilcTYAZPkEfO3Y/juDdVbXuA
	zFC3EKb
X-Received: by 2002:a05:600c:154d:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48a8452db0fmr123395355e9.25.1777643578635;
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:48 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2182;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
 b=xUdq3R4ju7VrrbMlrUU/wRM4VE4j/Gq3F++FNx2yt2ZNSkOtxB3Z6xk+BWK459qJKnyJVug62
 HKSGQscN3s/DYYGuA6wGOJHtguzdzmbEjMcO1sdhcPpAPHGR5hKvG/z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 48e87bd8ec2f..a6c467a27d09 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,49 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -848,6 +891,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -868,6 +925,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.54.0

