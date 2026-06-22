Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836D33F584;
	Mon, 22 Jun 2026 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154023; cv=none; b=U5s+f26zwmfUwvKZnLXtEXgNYnRMN5w3rIJO0EARqBI7WFP8JSPRkctjwLbzftaffpKvrbxdjjaMLRvgXkzZaIcpNNWhUMCHQgV+BNc6+IE/IH50PsYeDitwhP/QrTOT7zyin9OgKi1e/gxBiUf2J8HuQzZXQ3EWN94wEwMGJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154023; c=relaxed/simple;
	bh=An2+BAMtub3yMjQnm4NJSwdIwiSUv2D3Ph7Ew8GgDaQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=m+3z7t5AcbD/ffSJU9l9gfdezAyoCCj0+uc+L7oGTkmP9M2U4RBIHogyFAg52Y4IKCjXj+Haw/Owfla2GDMWS3mt85ZUccI9bJh+RKYqrYJFgXGUO6Msyl3zEgBJ7I0jJ0GP3Xy2jGLtTwyDA9dXbQoklcj7XIWl479c2nxO1Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cOtdib3R; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cOtdib3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782154015; bh=nEPSXfB+JjBafbHMX3olBM+i4VDB+I2MaZhDTL+Ymt0=;
	h=From:To:Cc:Subject:Date;
	b=cOtdib3RJ9rk6AS/PJZqMjsIle+wB+9l7UkxKtck/VL+BaIkFEU8n0aaXppW7njNS
	 d9o9tg0o5CSQxoBMRqo5FU4kw8eUNs+enEN1jT0cIEYhaXhOnEVFF6pTx/PMpD4a7K
	 k19WHWrmmXpWMzEa/TjALqa8q7IzbUfMqNk2icrQ=
Received: from 8qyomHQF3vPjMe ([163.125.200.111])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BB2AEC35; Tue, 23 Jun 2026 02:46:50 +0800
X-QQ-mid: xmsmtpt1782154010tap0won9v
Message-ID: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
X-QQ-XMAILINFO: OVNf2QX+HnES52RG68ns1XlfODRgrGD8GbMIjma7t1drujjFdnYCI7mYYMfYfg
	 NCwMG0NJ7M2vxMapQ4dB9KcVhw6TDAdUz44TpdCFpJ8hMJNOT4pXvsi5RUmH+19wO1xzgCrDMzZp
	 SYBamZ/HAhkWz75HJz1OGPWHLtlWngsoTkDDGO+A58xH9z77MstoTbGw9rOGGX085YWF2fFLSja6
	 BfqxF7euf/aXvZ+dl03LzWIMj5WnaSJrJZ9smt/umSVabowGGUlglyNV66o/ZWeOahDv4OM+Ry0E
	 wokHtHU1LFBMJ1GKjHWSiN/8KhB9eg3NYv+L9w9J8mlbRY3QiR6UDaOE6BfOh1cMTcSdcKZKmdNq
	 qOEI4y8Txdz6Yh2tauuyroD+aSFj28gai6+fVbd5ZNd9cpkqQBaGb7/0YbRNte6jgH/KUOe7Kk0f
	 vwp3/ecK2h2KyGI9Lsu57BT5nvG3J5lnAYn2o9Sl881PDlwOHfYqI0g8e3o3xijH7s8vbRRUDXUR
	 9SVPvtaoi4v0GkSBavoGVw82b/GMrwAzpt6LHBW6dzgh24eo4GxdQWAuJ0dwAFBIrJ3P6bx/jMwd
	 UvhxrvOyw5J2SCP+NMsnIJWBdviMPKke2nzstA7TsOxa72kVmLosnG8Hr60SEIA4AROkQe1JHnoL
	 0MOAcvl/j9XA9Vm3q0ZRbA9OIBDRzd6y23DIs/5mQCDbN+cYM+61CKWycC/Gm5a1e5oB+YRhaisP
	 jZ2mMf6TD4hbSvdxIK11Kkjwm2qtcVXkwWsdrm/hA0Ju5aJT3Y5FjjcMvJU5HVPCygx9scTgo7KH
	 FfoGXTjfDnVjSMgfQFKhL9gvJsu/h8KoiLq78neyjn7RMMHROikYukCgtG+nWJqxTyuryzyAJQk1
	 2nHNVtXv5GL9LDx4hrHxxMv0MUzxgKWZIDR5qJJGtkgsje8DYrXxFF1A99TW7lcp6+iY537twcdu
	 ZmoEDCjCNvpZ3sjaAgE3vme84d609mmj79FfNhTen376mMQaM3aT8z/t7q0xP/AG9MAAKCsiVjQK
	 PPbi6APWWaCKgL38wlziJjpfjJBB5bYiVBnR/co+a9Yzu22IKBglZZT0q74ase0Nm60Ld0dlVsOC
	 B9rbCN6OX3+UFPZf6lUDZPAJDMHpb41tbvYkoEP45N2wj4wpNGaNkkD7FrOX3Hy4LuuxCMTfVL53
	 k8YxY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Tue, 23 Jun 2026 02:46:25 +0800
X-OQ-MSGID: <20260622184625.41560-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pm8008 PMIC node on i2c15 with seven LDOs,
using GPIO84 as interrupt and GPIO76 as reset.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
Changes in v2:
  - Fix coding style (blank line, interrupts-extended, property order,
    drop output-high)
  - Correct voltage constraints for ldo1 and ldo2

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 51b57c697a75..c514478cba4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -571,6 +571,82 @@ fuel-gauge@55 {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-0 = <&pm8008_default>;
+		pinctrl-names = "default";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2900000>;
+			};
+		};
+	};
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -801,6 +877,23 @@ bt_en_state: bt-default-state {
 		bias-pull-up;
 	};
 
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio84";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			input-enable;
+		};
+
+		reset-pins {
+			pins = "gpio76";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
 	wlan_en_state: wlan-default-state {
 		pins = "gpio20";
 		function = "gpio";
-- 
2.53.0

