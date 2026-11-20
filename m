Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160050;
	b=mpUQv2Jw0w+EPyvl6i9Kzb0JeyGlPTKlfnvW7mVGft7JOcRQNhySkqvoLJ3rCqwyc+wU
	 sR47kqpnWQ8NqcPgNhWsBkwaYQYozdXvpZSGfRftudyxcPSyfe1HCEMxRcdQiwm1phKbA
	 +l6Jjjs33NshZQmr1R5RgQJtTloREYErr5F3/OVUomdp9n5czOxd8K3H9syj+swNgf5h4
	 wnyKrkPCJQulaZLABHEYSu5x+LwMJLbRp0ith3EU5bYkDIfHWsR8erzTPi0vlVGuKq9V1
	 NxmYQBF/NP6gor8VIZ+J0PHYYUjfnHkmKvMQM+uTuaM5JBoHaNDqGd3uvnVqX06lIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=RzhZE7aY6uKH9JSSYLLMSXZXbr2eK/rD4WPfN2kojPCk+xIaFigM2hYr9VJx74grUO0J
	 2eTJn0KDK+3D5ZlEM/2falYD1FMYyzLresq2TiBJX+nwUblA6qHkd6KIrtVmX5uK0MfEs
	 KvW3jGkcSGctV6KiFZ908jpvcO/798VCsX75ZOKxgIftqBHatPpaJ7J0RFdc2W7RM/ChX
	 LFN6IQmQlsXoMBPqcAfiHh9VjHQUs6O3Q2WQO3dn/HiChQRUgMwRZ74WxEiL5+6Yfc2fO
	 97ECkFvps9rxuDLwlBYok+Pznxo3VuHCiaiU1THCQv4lrQV7xfOBhM07n3lbj03O8lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257960A5BCB
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B257960A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso5890625e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160048; x=1795764848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=Sk3PdhS6u6GXkbXWDqXN4JbGbmCkBpKSZInRKLGFgBkhxX9mXxArpFf+rNaPZCwxU3
         3CGUvU9V68SAPRRct0FFpaEiOvp0VW5tPkqFGZ43AG+z/prjGacZajMS1sC4yXfIceeE
         hrWO2FrbS/V76SVw4FPSbKRpvuim+GphReaxGH/r8zDBT5Oonid7RGlEX4MWZ5+t0ZgK
         oZ5bq4BfqdAMXHwVrJfBOEzKNDUUUHf3rvuyMejdrknr1/79kCKrIWrW/GqOwQ2ZMz0W
         eSlgH3ZQGqwuba/uOXHZZemAE2ZhC/awGcVUrPBI7kiXZtNMa328GJ7IYVu8rq1KSraM
         loJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160048; x=1795764848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=uvTzigfctK0DfdpINzUWTFDicqt2Wv7la3+9WUBZCeGxPaI3Y4APv/RJhlCUh2uKxM
         tcpIFqXKx4lWSnGPB9rIrg46sbRhouFGHSuA21c5KViy9zTRF9n/cdB5umr0+YiG+izE
         K/d6t5vjs0hdIUHW5kSIOao9xBNksmdv0SfwkTsRBNhvsuj3k4/DVZj3xSPMefeTPzL2
         sCqE0y4yQeO7Dbwq2158yss+w6ZF2FVguM7GKYjfxzlf3WPTMhAodxSS303w3jOrnJKn
         own/biPW3rJT4Rmm/SlNWuEFB1rHaF8UQ6jYJC4Vw4AyBU4r6CkOHdUGsbPKgOE9P7t1
         S0LQ==
X-Gm-Message-State: APuU4Z8oJSD84CYV2HVVLXSRtsB0GjzNZ/rO9XzORFnmHhhrStRh7Zdn
	Udy5ilDa/KgwRJ72c3/JJlPSV8wDwAT1jHkThYC2QW2/UJVKlw8Kse0j
X-Gm-Gg: AYBFou2pJTUmZ9s2i0f/pao/X3heFP8s0CxtvascVYAI+mWQ+7pRNNOJJ/x+ZeTvb+j
	RMpqjXvshHVuCpU5sFgrzbWPdldPs0Mi3y/+tgA5JJ1D+P7KwlnuNh5e77T39MHc80xoNc8S3sk
	lQdH4PAfZq39oDu6boEQZQ/K/SPkHt/5EgTUMUGUZb6MWMlc1uOEDuRlSbLNzrZ43pnvam4jRkh
	UYhe/S7ETDMVySaSlcXurc9hqqjzBwahob6FfZxYL+pIX3A4gt1LAp1xNrZc/fgg4lpT7KlrObq
	h6UOaaMTJyTw9lj01bpb1b3expop7Ya12sqcLs3FUUMnu9H5gHwhqKbG+2GdEQ/EvY5a2TOBM/l
	uNhVnFZKNwVrhgCg1i2n4J0YELhtu/Wn+3Ev5DwgpO54Vq0XFGYYCeRJsAE+ZG/7U3PFJsbsTr6
	HNZkDI1Fi7srIDWREqFt030l8b9YhQyxHYx8ak1uzNPC7PuF839SZJV3IZXlEU4CV8/0krUEfTs
	lGp9Kw0Q81N6tq7VOJcfcIum4uTAPqAIrndj9MEx6B316CEVTrB9cHmSoxxwytYEaGepfP7387/
	1EpQ1B3bZFynilC9m0yibzSg24veCughKQo+qTOCIkigj18th3QeVZ/P0GJ/WjIpq9URhuItcTY
	=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr52971675e9.14.1795160048060;
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:07 -0800 (PST)
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
Subject: [PATCH v4 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 08:33:55 +0100
Message-Id: <20261120073358.10267-8-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 20aaf70355158..709cf9674e2d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

