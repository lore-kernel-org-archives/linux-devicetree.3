Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437407;
	b=xk0wmRqr4EZLzlM0a1xWMcIH19GqI1JqUL7+rev/+HlViNCertytAyfz95DzyPumq8gp
	 LjgMYjAtlnZ80Cl1I5PoCMI5CiNlstNGa8CgLtFBWs+Vl0lOyr7J6OxsMintO6zK2QDd0
	 J0slwk0PQNcq7bgHwAKxUgPR0lAN3OkEO6YpXMB4j9PbMe1H6hoMkyWDi1wP5LuxG+bwR
	 G6aMmZrHVbCt5RsUeAxkTUpeZqZ0N8ZMWKukjX74dr85/rKZIqQTo/RqWdxDlqwhAuz2Z
	 G/X6qwaxd/Xapc2bwpskX9DIUup7OGMQ0W4XX3I8rjep21n8/MBE6ceGgbKdvZoYxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
	b=mUbr4q8gLETiIbxhGKWJndqG4AEK/j2nyiVS6OypCNyguiJQcWmXYC1ZlHxUG0dcrNVZ
	 PQ0Ujih8NPaZ5EXsnF/FAY/1258dvbql8umlB7NlTyhvRze3/5JPK7M9H7hGaZAVBpC2s
	 CnI3HggRtwTTRegP4l9nalbiedoLZr+wOSYLshQHtfpCtFGvqJuSd5VJOq3awvtNlj6B3
	 +4mHVj62d2utwZlEKg0KSKuv3R9+AzTmYtnSBsJggGcFF5+ELzuw9NrNjEuHZevJybTPX
	 UlaCMKnhPuqCVzk0Niwk2Xjx57HoNYFWPI4aafc6Q5QftCfVkK12KcyXfq6D9piipeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7661606A33F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7661606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869b68caecso4153998eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437406; x=1796042206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=atlI4xhWUQnHPQ9nkYx3mQO8Swph4K/bleOIqj2B5EWCD+vbxo7zUlwusUjhC8SBMI
         74SAW8d+AsGsQPS49KlhZ3wmObfzg3i8k6bjnLML1v3xvmi93htAIrRa3G5Mt47kUkbg
         8WPcf+BlbVDglyiG/AoRiiYZEv/QbipWZYqJLn/H5MvLp3vLv/WGzFZS8cZZUREwIitt
         q0EFaL7AhpJcMNbXN/xAKAu5BF0Ucd6YxQBsWhUGBV0e0YZUYNlHBOa0Xb/jU4GhT689
         kH9CLaUi8j8aRI+IOBYW7nODAPcyglZclBG0+lvwv1k4+VVdcc2GJXQFBiHF+2emdk/p
         nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437406; x=1796042206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=XOekGYKO0Y2yrcSMOfPuV40eECCxxccJcueDc5ylEztHvKlWbMRqQoyZbN9k41gF2j
         UP3QYO6CSlj9trxGipH13lilhjvICsskJm2e4ORF7tbrg70KZiRonGbKD9eeqayhrZhu
         GNooT0zmGM71JaEKY4EPL7Pe4x/nRjEaWuuF9hKYcX5O6I/Z5VlA2SunhHB6C0YAlviM
         f/pJl1bjVC2A0tc3AbS26RIJKiTVZ+n74OvrlTZD3UmXW9iGxW0iPW5BEnBhuz4ttx1J
         jePU8BLX+vAu3UPxmyuXu3yWvZ55pV0I2+nwaJxschV9hmcSpJ1//KqRy6Omv7apgwo0
         NPtw==
X-Forwarded-Encrypted: i=1; AL+hErHfrNPJdp6lXG3Vm9aJBfM9Kv0rwVQTYSaQkO04gpj+UvU9nnKrh4vSAuN/kBzqx0Xu7QU+LpkGdF3P@vger.kernel.org
X-Gm-Message-State: APuU4Z9FM88+Fsw2YeqY9eTDFBnEi3jbsc4Ikr8vXSwOVasPCzirnv5n
	CBOI7NuQ0KqKpls3VhPs8Zqf8CWsNJMzpJIvHvmN8ksG6XxMhHztrZ6l
X-Gm-Gg: AZFdTZfTWLeowYUDzU39d0PMyDCKeEE6rtMBph5SeVemkC218Q68OqFCR3RB9NZKPDv
	7IqDilLbuDdNPBL975iasvPrIJWITrC8N5jHMt5vIPKYx1g8XiSKJ8LRuYqdcSWFJWYBAKUMzWs
	5G83EuG5G8cOkJeEz4zAVIh1gdX1RiBN8gPytdgLl4R3/w5UaStM3H4aLrsZhgEnWpiduIlzDXh
	qdMBVBzARPGWQrG6cuSda+m9+Fnd/Cvn/cBsgkW3X0+mEihxQ49266K/A0llTj+QYa934BxQS9P
	KA7TydS8ShO41SDF6ab76ujjiapJDzwKk3/KtYdwc1aLXW/ym17N5f3A8d5X4RlCxIssuyvDdkl
	8WIoJkx56/Lfvxo1DALMAHfLWx2fPWcRhXAhqZ6kYjyEWNGrcHWxDQ5jO5W/oPUGtipN9oPzswP
	c1Zokwuz18U+/kkIxofihFgogLrrZofDbG1gI/MvQGl73/yxcr3D0X+aGFsnB44q7eecwQkIHgr
	rePyF9eYchEEErTPubSpCKJEf5tJLjUDccZQsNzGz30VQ3rVYyMBytti32pC3a8+I2odizG3m2n
	I6lDY6v3uva830kBWaQf2VUme3sUdYh27Jok1PLRArccPWLMAhCmRvdpZIEqigZ3hbU=
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr12986753eec.8.1795437405845;
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:46 +0700
Message-ID: <20261123123546.152162-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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
index fccb9c4360ca..5d4fd7f42042 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
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
@@ -325,3 +339,103 @@ &usb3_dwc3 {
 	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
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

