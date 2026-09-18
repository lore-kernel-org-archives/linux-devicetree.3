Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42274E2F31
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742418; cv=none; b=IFxnS0NB/sO2Lo6qhMuXxD7cslvZqSEF4qzP7Eqp+j6TkmAdOmdEBmxAyLd2Fio13Ptu3pI2dNmURIkW1qNYHQL+wHb6+/h8X41u999JCQ1s8ACRs51uOT5UA/B44aEg7Ck+DsKdzXl12u9hiMyBF227BmRvViOfos4OS9ElGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742418; c=relaxed/simple;
	bh=rOIM11VEoZADWcbRxJB4CDrlUSZEECHpM7XwHlAs5pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgFo7L+VYxmgUri7ebkgP0JXm9aHmACQmiOjpHKP9vUfjXuEDnIvnGkFJmQRPIK0DPcOU6c/3gkOzalVSp/V4hvj11Vgn54v9WPdQmDWuEIER9u5bu57Dff0GkCmFECGCfAVC7/sXfbdqjItz0fazF/CxTYz7AeY7HxxWJJcbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vzgj1t6x; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vzgj1t6x"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so118534866b.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742412; x=1790347212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBZrkz/d6rH1GgwzTo9HcGaBMgfKERMXTNzWP9DGQww=;
        b=Vzgj1t6x8FL4ln8WwHGb/Q/IiWoBBf+kmxcOymBK4REczICcZv+QjAdoA5QkiXY704
         W19GFz4e7hB7ENn4N+gw6nEUvxzEd6qNemw0SjADVT+mbEowFI2ohvdKs7geEN6vLWZq
         d6NgngTjPzRaoA67Ig1iLWFh6pCJTjxoY/GhKpaHp7kLliUQd/Eh9mq/w02+xHadFELn
         6lz6+77kwna4WDXbVzjMhIxHtoLf5EvJTl3sDFGzGA9GpUhPOGrbrbsxt+BR8J1EI7rP
         gvkkWGX8N0sre9Rw3YoOlyPh7tuiUyiQGXW2MwROsYevvjJLwYEJSnW2sElzIKropJzO
         Eq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742412; x=1790347212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBZrkz/d6rH1GgwzTo9HcGaBMgfKERMXTNzWP9DGQww=;
        b=tFDvudYgc6tOgXBuN/c+7r/IhfggALJqiCNpO3OfZa6EDZoNo4JbnzrhmL+3r+0lP4
         EM0SolzuBs0GXHREI7LBrAxaldM8EFdWozG91m7tR8uO6GuHi7Ku1Z1jeANog31juWRd
         4CwQcxl65JT9IzoF7wMi4b27P6/9LgDhKSY3QrOHPDvbrOs7d+4Y7tAifwQJhkJwvqEb
         G0k7UjZvTkH/gByDIZu6vNiwM9FR6RDaYZdsnQH+ZIxKFQ7wB+miHE7+ws/cvEKXdIQO
         kQDXb/LZgtSWQTWeUHinZXP/bPunE7qrd7z9qkn9KMnLfjrs7Z1Fs4yi+j/KRc/1vanA
         Bf9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWqYL0nhpPh1SWHRlwwD5sryOQuKM5GCVsJsOJoevcPJRRuqiQPecbPELRufthajA4p88+pmsIsV/U@vger.kernel.org
X-Gm-Message-State: AFuF++nPyYHHkh+RwXsuMOdc2nkdX9zn5H/Zq/dD5vXNGpCxnDL8ZVUZ
	tYTAarUXTQwmmkDZ51FZFHcGORcN0bqKJbilkb480VWa80dQCbper8+NwkYoq+tAo8o=
X-Gm-Gg: AYBFou2JsmRMtBbdiqQktLxYJ5AmsSLqF94tAilgRyH1I2HMfTyytnW99ydrYIIWRgW
	aJTVaOKdUcZErFLc/6ARrzOI8mbIFE8wHhgwDmYtYB+pEc90VYvs1/tLlyw4wAao+KdAkMWIRnn
	4IW6QnPjeg4QzRvDv1DY1NnYjJx9qJCd2+JsXQY9kDXTuZQ+NdoyxIUyqTXTys575DukwOjLCjA
	4BqRpoQKdlR2HJV/7+mNvFrddygdlGMqPkp0/3U2BvV8JeVLY2lrR8q1USQuViSXTc49XBP82EC
	4nnkhfBa+1lE7JZwMM+jBAJu7n2ppeMXTbyqQbeCiB3Vy9FXmadC0QTMsEca+z6qSJu9Uhzit0T
	pf+t0dPyP3eMGZ/sSwGZ4Q6Mldco0S2mMeN0dpmn8cCXiPbLLJGMk0xiNF4ZhEnNd0SFT6wpjGJ
	0SE7Ac35cVj+9q79qsXqgIVLCoOLrVe/bq/whmhDMsCStR43rD2s4HGvX/vDYv2WurqWbTNo2I8
	ocjuAXQt4TAz1VJulBnSsrtcjDy+ro/tnpPv/beB+Qoo0OzPrkJ
X-Received: by 2002:a17:906:9c95:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2a158269a8mr262337166b.35.1789742412068;
        Fri, 18 Sep 2026 07:40:12 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:07 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-4-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rOIM11VEoZADWcbRxJB4CDrlUSZEECHpM7XwHlAs5pk=;
 b=5nrVe28d0+ILTAO21B6rnbOXqb369AcBA5MBYd6C1/4tJwe3W4233FgK8LXQ5jFlzlGaDbLNM
 +zuTWxGcU6aCgO5/FWz5kICtxX7zmlmf7rBCkpqypmiwXLGPoDKBW/M
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4e8777162b53..11015c3fa331 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -709,6 +709,49 @@ &ipa {
 	status = "okay";
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
@@ -872,6 +915,20 @@ &tlmm {
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
@@ -906,6 +963,13 @@ pm8008_int_default: pm8008-int-default-state {
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
2.55.0

