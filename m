Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62A4CDA1C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545123; cv=none; b=r4MIUxXqzBtTVxRaMQEfrVOCZ3Lh0HM01Q9PAr3mDZ4OXem7LKEwwJheUgVgcfvw4kW2FBRGH0hV3S5Oe7iWa87kQrvF28zFx+VuxC/+6sZoYPz2LzQ/lXkTvry54hmNRy/HsKU1HhVgS3NMfo8AlIovdSoC7xxRwSWCcBlDWxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545123; c=relaxed/simple;
	bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QH7/AKrNkT40bdWnMFkBMaLq9qr+r15GcLGtRry/R2WhChhejSfkyNjKAiDWWYIuGiGJQs37JnHT8DRvTPF5u/Sbi6JJ1uGuACIHFbqM/2B+cAl6Z9ThgLFMcGBRnPwkXAW4Mhc/DGsvMK7VjVPeRvlh9FE3hbN8AQ7pBX7T7bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EHdwTzMi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EHdwTzMi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso4908202a12.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545110; x=1792149910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=EHdwTzMiTjdZbLMA/h1lqRsfXHXfVAfO4QghI2VWYjNb/tf0toHzR495NlzuxRbG2k
         4AdtS9MML6liWkfK5pJzr5XAyX9ZKw5llpvd9i1Tj46GRIbpZUOHNPmzt6tMtNEO3w2b
         GpE4ai882MtPjH9zPmpq/SGX37SamqUPcP4SR1j1TL6yaTgx1NRCzYqdXHmvruE+pbYE
         U7/WXTC4z/4EWSZ2IssKuOnqOG0WjQSbiESwpzT7f4EcJ3NH2u8db5YJ7jWbyJaTRAPz
         VGgcAIimbCY/o/ZqAElE2e5nGSztD6BCRRF0P/PAc5IFYdEMY1Kdv1jATchy52W25eQP
         HrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545110; x=1792149910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=il/utMrfiWS9qhP4S/Thkk6qnEoE0oz6Hg4JndgJv1OZiIBptGy8Ff7aLIGx/kqaOz
         3u0NXtKtLZL53q8SMTybICxoSBw8ZrUdn/xNwRUpI8/7DqfCPaIamoF4yDSfS1aJF413
         gd4ilMVLikqPHI+fxDGct+zTdcMbQWEe33uO5jN4L80FGtzCLj8XUH6OkrhdXNHaNbp2
         UiyuicEzlpY6PQtPFH/YKlE3e/fjSw462m7rhnZUlq7RadEHHb8R9vpld+fbBk7euXn0
         hShBVF6emkVl7K+yoiVYynNb+Yd1JBVXj1Q+SSLdnG1UaMoBJpDjXhIkCDJpa37LAQbF
         bpXw==
X-Forwarded-Encrypted: i=1; AKwUvByzLAgk/uNbBnW1eakOx/QyrKWTrkPIeXoVJCL/4tyRqQs3APr4WewblcTZERnf6W5b1OobBTUS2rMC@vger.kernel.org
X-Gm-Message-State: AFq9FYKPe2HzftMbbbIDCXUv5MSkEfB8CDi4P7QvP7OPZ497ArFPUF6R
	kceAG/zm77IutAx72xNlIAPI6jh3q1GyJDI5LQKAC/vaqmiK4h9EYmk9NysMYQFL2V0=
X-Gm-Gg: AYBFou05/1khgWRtjKaNpbeBOvhvetmuZIlKHUTcOckb9k4Mm1tHVmGZv0778+RAeMa
	JoToXftwByHOMc16OxLzyTL9LV+PXgNyQ0nXm60d8F4YQVPLAcMbl056hEiQWJ8Gjx88yTNUxeh
	6lQqcf4OTSIxIMjPuwgaRdtUq2cbxzBInFODNDdNj/GocrHVK5A3LLV6bXTIp4fUXcKDKk0PB+Y
	b/gvggX5TaSR+VvwbyIkXqnBbp9RQXeH5mkBJqFxuT23XBJdqKTKvsk+iVbRHJ4o0TqqtyKaYjy
	THQiERGbrHLFKwciAiaMTvaBXcsHVgtdA+cCrWAV5BV3hLA2oTH0mc3j2gDiz12qq2+jXUl0Zao
	EkztjZodXn099hEvaaNwoVHYWiNbffJd7Qr037eBT8qWp0yYCXznnfeCrMSOUfcimJCj7wT6WZA
	j8a2gh2mROK61HraSyhp97E3NOn20ik3IQ+2wB00f0Sg2OHAmzIvOiAX4Qbs+0/3rKnAeyAW8IM
	M9xXPJPsi+UR9PHlCh5mQYS4Z1CZlHgkmQqfXBEMCNudl0yz+oF
X-Received: by 2002:a05:6402:190f:b0:6ab:6e:a8e4 with SMTP id 4fb4d7f45d1cf-6b17c2919a2mr1279444a12.44.1791545109895;
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-4-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
 b=+RENV5BTwuJZenkB/tqi4Ledclqeb7XKWAMWUX+RVt0JGWYi6hJZJFY91iUXFwZmz89TsCRE7
 /oHOtl9hGpoA3+AJesVeUI7yU+ifKJovTWzz+fN4xrzyAidTMUrrqNm
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
2.56.0

