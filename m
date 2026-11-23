Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432136;
	b=u01i7KUrnTBuJqlRNjTqhW1WmnHvMUHRttg0oCq7hnKZCOxknh8jXTZB8y2vs79KbEAS
	 Kti6BC5vxLqvpTSDzA1kyzgwQ0ZYcQ32CCN8zhBqacTkvjvOHTYScrHgrZweR7/dnV8Xy
	 95ID3WwyK/ZlZQ/vLh9NztXTomdJ/ApGMEM8TWoFqZWbnQvdNta1XjMsr8PcOrVc2e55P
	 68TzZSpny4kKmuOZ1mnnueaVKX0loWw+D5SEvlUPSMABZqvDHO7l0W9ieTxy1t6BGdxuk
	 VVEKHEDlc/JUFa9FFea6HUuHkAvfg57X3OUcQvsV6V0vmz9WD+REC0moDuIW+V+XdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
	b=BjHHwAv4qLU9w0Kz8/o0IE+HJoYieyYFvPOpXU+9uGO/4M50/uNPT/aw3wr/FNDwMx8Y
	 alkqC31j1S+AFPgMCk3Q9lUaV2LhUw2eKu+bKZwlRtn7Lshf4pKhESslfN1F47RQbLSci
	 FPf4QfMBvHpXzW8IH9STcvbu17PGeR10KgDPYx7cxl4dWIAyjx6DEpZI8qmPz/Q+hXtIb
	 WZEzZeutTy+/GxKSFMrqSWSeW6GxELu7PVJ9meH4PfNTN9v0ifUf67oNNEqGEPH2iLE+H
	 ncD+vmVsNu8KZp7LZ/b0laTIE/w8zjIB9x1L1ZzvRhCCoXqk8mL7bmIa3Uw7jC8Mi1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GV3Ox3m/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B74606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV3Ox3m/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b546061d58so7053074c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432136; x=1796036936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=GV3Ox3m/nwlScDSi01EojkTUY3OAbqwZCcsZyEc3A2ODjDkx63iQHWMPBypXLaUTdt
         vYXuXfgTZWM4Wt45ElJVAx4k6HmH+ATHBmBKr04VQE0xixKP2pFKqCpHKvNTCjBNSEyI
         cd6fpPdiLLgaHK2kNST1nJi0tKTbw37CW9QXC8soarFdkCGcU3UicgTNAW0QCFHTFzHD
         p7XT7/rZOK09ZHvbQsm0WIlxgtwIyQ+Wzlcmo/ErjYanKDDJB5TujuSnj0gOfUhEvUsu
         L+236Z2ijkpTolk5xRoNNPEXp4ru1FCx1VqOnmwz/zaD688iFhL7Xqt/HWC4bNA+T0Mf
         zKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432136; x=1796036936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=Q2jXWNu9IHd8Swe9Sl5bL09EgP9KCzot3nl4neRs72GVWnn6JPN79eNBCNpHTb2WBB
         BhGnZ0dqYPLeGc+5CR/RGXzDEIcBI3y4IrfZFLixotOGbnaw1mVe2Q59jz74lRcqimTr
         gZfY1R0d3rirjRnL2XezcBQbJqb8lm/X+5itNnFkF/bXQEzTk5Y/0TmKLRwpTHPoXVfq
         Gda14rxgHBr8pwtnZnLQq25BFKdMThYr5cjgC66Sq/QowzN8Zc3yehswaqLObkzfCt2E
         2lNcNWPpBpEopQJmngPDxvD5kQQkvIMWtstWDwvxY3L8DXyXSTRXU5m1E1QijZGzCXLS
         FBzA==
X-Forwarded-Encrypted: i=1; AL+hErFJMMdB0031IRAITjJwMi/qz5wQFzzURt77T5tHql4qaZ2nCcghFq9CAm9d69LYiF6YGY/QPuY3AriC@vger.kernel.org
X-Gm-Message-State: APuU4Z8So9kceepMxwl+ZTEFtTj9Sngwc9oNOlUftrkaw+Tnzap/k8fo
	nG6ZmXU5yLzGNMO6v4gftMKpak3rfm0LMjX7bzynOCP1VUZaQCMqed6g
X-Gm-Gg: AZFdTZeVBhuxXAp/qvMEFAeKShDdns5KXBVmAFt6gdOdE02Qb5Onc/gSX7LSxkjDOrE
	BxInXZVRgcsUJH5FNET4YleMljyR2jlH6AeVD1lAOG1zFr6uiZTbSmCSpBCJIAq3vh4QT+/zWwq
	B31KdjSJ5Ds0NiT3nSYIuvoSAeAPw3eQN1mo6R8432DUrQyfNoN0a00DDJUUZYqdDxdTrmx7ANM
	cc9z3TifhuzEv73mhAJE6qCaDRuLr2NvZMUpm/W9xO/Cz2sWYTvCUVKjzBvymd7EZjytJQ6NWa6
	zqID6vqErn1ERQi4UresA5/eJ/EWPWWsgkBBB5r4Hu5ZjoO3t6Z/eKGASLvCYGvu5rw+fgcdFiv
	UZX4vLcx9hWpAhPQchHnRVEEfcgHBP2yLA00dg7ZSIupJuyvqKhaE96Vsn/j+dNaB8O11CBr3OQ
	Skqkl+rUvrMXDZjVNqVz5ZnnxLv2IOUMP8FXQNX4hUoeG+P8ggJmK5OwPnWlPA8VYel5wZSjDGl
	4vWKn+dgAqsH4AsbcYV83wsgHscq/w5jQbRfYeeECVQe4KZojDbTk03h1cbxUqZHJKIN5mUKBro
	7RCEHREKGFNZPeiY8vBHLJ/9D/t0MWSXTuK1YU+yFwx0Cg==
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11025822c88.26.1795432135606;
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:08:05 +0700
Message-ID: <20261123110805.119610-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index 8ba7982fcd81..40a14301ee3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -271,6 +271,20 @@ headphones_amp_default: headphones-switch-default-state {
 		bias-disable;
 		output-low;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -288,3 +302,103 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <91 259 488 488 488>;
 	qcom,mbhc-vthreshold-low = <91 259 488 488 488>;
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

