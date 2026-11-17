Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919202;
	b=Ys3Kli52kFaaqlXmauO7tu1vWK7XFFm+HMkSBJ/44fKLqUCYnnfm+7MBI41Ti9mhVrcs
	 jYmQSJFoTLBk0gigZcn5OwNrjjp5sOwgXXrETyGLWjh1Pi8ZpxaE4b8C6QrVxiPgKuDf7
	 Toro89SkBqJxgHitHr4wI1puHLb05kKz2DzMWRKTT1qBetY5Jcolv7u1aLL3soPywjGCc
	 ewdPp5zZl5Uu2i3wVPQt+3/fYe9yMk8JKMfviwcxD2zQskqRW0jjU8+OWnqRJA20U0Iki
	 6Op8zl0OHzRMlQ/fXR2NJSWLySsvXjJXE0GG7MjjJ2qPSj/hnu6dvcN1yvTTCiucNyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
	b=WkTBlWrV/qoPGAIyrY2ufub31/5T6DVwsKQDUs+N0C3dQSFkPhUV0TUjrgwnexxCvMKs
	 ry0aJU4yeYefzgVoanpscfn1iGLlOoDJAfwVQlyfRGou7kki8x/u8EsZlJ36I88yojTg8
	 bYOe8E+Tl9x41t0tU/qGgTFK0Jrk4VffAf/YJ1D4iXCHFCkc2V3MolNNufJakATa1rcJH
	 R21vhlPH3sHcCNc2MqP2ZB0+D+pOMsxb35c0fD8QAZRWHxaNaOZ1gHmwMiL0XOxU/TrMu
	 EQMXC3y3PuzTa2FBdxeY8/lr/ffjVHCCAgOkNusreDauS8SgwS4p2HLB+1/W9gMo9Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287ED60A6F5E
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287ED60A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso29231245e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919201; x=1795524001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=Ce62sMFolZ8wDThxrrbo+CnTzEs6w7mi342mwpd9ugs27RJgJ5cnId07PBaxEu1f2t
         8GevcTB5H8HH0tU7USgs/C7oMgv9C0E/2ENimKZuqJYO6fUEJsnb+FA/18VNYiFDdJOV
         5Pob9+GtoRAtyzzeYV842RMcHt1a5qQwiptHgRxHqkDQEYD24TcKNisrkw9Umr0kQC2s
         b+gU0YRgX+3RcsiL5lLTQVNbAqgu6Lz1m9w9D0860q9fHHpe8W4Fb/a+9PLqJC1UR4Ao
         f5P9EdlzBCylkrLMsuxiJLc0SwS+WTSiku/JffJ/yUhwQwnzrhcmbogzStGBZmR0Uf3K
         75Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919201; x=1795524001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=GGMtuH9TqEVMxGqe/LBznStt4S9dyC/WUU1SkmCQJ/C5k3ggH/D8ODhPCglfho6Lne
         J53DAn9QMJZFHFirEjyYP9Yplzg1mqJw1dsOEmA3gWMRAYVxV6xBQXbtmle6I98yO8st
         XfIbkaLR+ZhkdMttymmUg+NKOP9LRJhr8I5+3QcIrW9OCz9ZHEdFk7Qkc4Fy4jpLwpr3
         jX6omW3DfVOO0EXHd791ogTKE1Kew7rt9dv9kcohHQRlimkwLlywftpCUR9qztdm/Nfq
         Oq7vvGpc7br6azgfUHlWOySbS8XDPHZwH2/Yoy2WQ3otTkVe77sp1WoZGKRsNYGnfVkc
         nO4w==
X-Gm-Message-State: APuU4Z95FAMg8xvAboJAKXE5yn5pTjiH0SClMTm5fKmCOiCJb8QNlcPq
	/ooJ8+/LQDR8VqmaIYjJVFQn32UpE/8rpAW+DTv4oKT++OiSwHxUF6MH
X-Gm-Gg: AYBFou1URNuJy45pRJ3BC34aOJpWCpS4qk9Z4Zbpu9yLxh9jTu8yaFyIUaGjOCoiiYk
	R1uaHquJ6S1CTRnkwUpAw39S82K0ZC0xbtvecB1BKf46NptYm7tYbh2YKZTk+AN3R0TrGyRjsBs
	oHx14mf3JG0toVV9G0KyB575iqNx8sDBebvN8bfApjkuyIc49GwMBXW2AbHHRkAQhV6c+rBs+1j
	7xXHCzlR6Ld4GyYUHv9XeL9FnAMK6rWdfa0Mbu97YXpOIp6VgOho+ZNUJJhkMOrzLNbluoAO5DY
	X/EyP4MJ3nx6piVFN23liIHIg9tPZUm33KjxLKPWjWLV6ZkNYKy+C563iOsHJnGb5QCCG+t9JDq
	adP3E7nPnusR3KCKXgB0p8n5Mo49sIcwLBeOwjY8HkPkgWv02mweV03TyYFstDHTVV1/f0AZQZ+
	jHGzxp1rYdfRoxlgZd7HF/6yKawyaH0Jwi/0uBKqncPCY7wl1JuW3X67EPrSfHidueB9b6ux/HX
	gY3NyOTN5MwJ5Ni5USoMd2qQH+U0UzgC+Hd2bLOxiWOkjZQLdBq4d5Kc5/Iry2R1p01zdpVLUSF
	zqlfCzB4lbAsHg0YYtYyhz4QNZH41hpcAV15MpTg3l3+4VfYXAG+ia3KV9DfakgJ/1s7VA==
X-Received: by 2002:a05:600c:8189:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb559f72b1mr298144455e9.4.1794919200559;
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 11/11] arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth
Date: Tue, 17 Nov 2026 13:39:46 +0100
Message-Id: <20261117123946.668557-12-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer and its PMU regulators. Enable the
Bluetooth HCI controller on GENI UART6 with the supplies provided by the
PMU.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 6b57c658cf918..38816268fcf53 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -95,6 +95,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p6>;
+		vddpmu-supply = <&vreg_s6a_0p6>;
+		vddrfa0p95-supply = <&vreg_s6a_0p6>;
+		vddrfa1p3-supply = <&vreg_s8c_1p2>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p2>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
@@ -506,6 +567,21 @@ &uart12 {
 	status = "okay";
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -636,6 +712,22 @@ touchscreen@28 {
 };
 
 &tlmm {
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+
 	touch_reset_default: touch-reset-default-state {
 		pins = "gpio38";
 		function = "gpio";
-- 
2.39.5

