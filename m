Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25745FFAD
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775697; cv=none; b=oq8G6265yVJj3x4tfA1yrhTSyDXyQwCze/38tbdzeiJ6aXapVUG1NtIBJY7AL/nn/g3qDDYlL5MIvmKVKxDflM/HGu3kxfoGaJsTSXGVADonZuxhDGtsPkBDnfkfWqN+x3FSf3Q5jqiYwbvHdLVWhdHz4DMTrpeQfVofKqzmSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775697; c=relaxed/simple;
	bh=ONk8ORpuDxsy7eZ/zdhchscAUgGd53Hb+8JZrESknE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs2m5HWnlBKFnhJ3/Tdva6/p5wzBkMGAj1IHjMaKIG16yBGkP3LtxgCKkpxgPm13tOGKaZnPefBoNywGBaSv0/Kb5uBi97GXhkwLOLWV02tXZKtiCQl8L5cmp100b3IuECHMfSGEyP05NKubW3BDM201FhqXbOyFxjbXpxhiU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrOskTnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA7b9kLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrOskTnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA7b9kLl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bTJw648852
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=; b=PrOskTnzRFwjzB1x
	wItIU2ywHy7Imk+c6p0vLlWD1oAC8LLdvxsa1wSigSb6n0YVeE2IPvl9Zl0RGvKm
	F1NjwXKipYlgRarqpDdzFokzGMLnJ1huwu/rfJyBeWtYn0EBi6qmLFrScn8YK3KN
	ILYjWD6dxn+56dA++ggZvNBIJszmHo1IOyNX8xJG9hCE85vhThcWnPIKXqQnQJF4
	zLIQw7g94AHT+Q1eF4ht5VRoRb60GMwj1o1S27jvEJAaZCeg+2xzJIFdLWuG9ttY
	Qh6w3ZYeZTtOtThzmh83fISxk6Y+3dxK6NWhtRWb42EzeyPGD/3SZ/31nhcsANmL
	D2H9Nw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8ut3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db3d832827so18608685ad.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775694; x=1789380494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=PA7b9kLldKfdFNst96gOAOtlCNhfwrx/+j+gbFjYUINtk+Ye+LJBWC49Xwynhgg39x
         DCNXyasoGZT12vWk+8UA8FrWrgwRgrL5CjQg7s5XbavurfbPoo1Xt6AtnkWXkpNvWt3Y
         5R9fW0KrXCU0R8fwf40HZx+nfSOkmcenZcesH91MWXdXyk5uclsDkdxXFoNXCw3boQ9G
         9DTOToGT9vG5sYCscpmZF3RXymCVMElB7dzYM5fH2NdXTutMf9eXYOxCfRMZHCf8bTvu
         0z8ZrLO4tvebqtH+dajwjyEhHQxy9GbHvQKQZhVadCsTf1dkbzuZ5Fpw8Px6CdBERiYx
         uMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775694; x=1789380494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=NrE26gJWwgU2hRfrwbUjGEs0zIaQg7af041MCNSJghT23u8ubZRfD1cYdbt9e4Xapa
         yogqTKAG0AMYDIjmmli0NwQcQX32lryCsOnWOhZkR8b7XFurOTzP4NBjKwvlUHKe8GWJ
         U9yPwwBFrCLKkPM8c6tigKbyZzzGd/MW+1o6xcAj4Zen0Wkj/Ug1G/QEYAkDXfoRDhjX
         3iQOD/wIJLjAnqEqHkbtkimTRubVsHFqjv0kUX+2j3T0l921ISGVlWrdnvEiU89O+Li/
         VU0x7bItyKg74tojua3T4M8qpFfSTslTvYhNCfeIuImA7pQTKtiquXwOpDEcJxxXwM9A
         beQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5sa0qGEVxg9Vu7ySckuQhiqqEmjq9b9S4qr5THROVl3l48RCgl6Ets88PKNDEqmTbafjbJ9iX573F@vger.kernel.org
X-Gm-Message-State: AFuF++mhSHeB1PgPmIGoUAcT7QqwdpZI1ge55cc7UEUdPzkT/47RoVmj
	DkmQMy3ZDc/D7+v1pTYOdvPinhAYHIare49vl0+6XPOdOHSc1ezUi12V6CaqAfwsssfXPjKF33Z
	OkCHoS1AZwRzkmxahTbPo3sB5FGDBDFbgbGGtFVYp2N0iaGU0dIZixEgq7RqrrIg2
X-Gm-Gg: AYBFou06kq6U/rinezRD+Dpn74nSauJkm3b8KvWrHYibgjd9HMUSnJV15+xXk/LUMz1
	pTYcDI6qrCaz+MSZ7YMbDMy1V1IYpRD6hj5/nt1XLvcBb2ONirWQTSvYmV2Hcv0Y46PUQN805tQ
	qi4PLQJhc4mzo/2gQ8urtep+FASpKD3QoxK7neTKceARp05kyxEaNI3LZf29FpU8SrbJnGIwZ5k
	UcvPuy5Ef1HURPP1gzylPFcL1I8CPAUmFq5xQDccarSutkK9TQh4i3clYgoXAGQN037VXUHPSIJ
	wJ/ykhhc6bVRDSWyfM8FkT4eP8dLx3lmfDRtNrbs/BBBN4iapZbARthGlmjda4lRgv9wZV1/G9S
	Fdl4Y9aPVh5Dwg/YXSU5QkkooAIrsIcM=
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747102a91.16.1788775694572;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747058a91.16.1788775694073;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:47 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-4-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=cI0ALWv/LigAcGVjK0elBRZg7Mq6Gatypt7/q7zaAkI=;
 b=/E2HLTAwFQBPdLx9kvz9gbsxKnsDFT2r1RQfu8/wJ/w4/mZQWxIuwMoqwwFEBe0JIFOz3fxb3
 77OEMduIi/+CEgl/1zdTksQFhWdNkQfQ8q09UjCZERLObqAf4N3/cKR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: kgjdAsyqXe_nbVXB1KzJ7c7Izi6Ru-e7
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e8d0f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=o7Fm7CHYE8stcAh43noA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: kgjdAsyqXe_nbVXB1KzJ7c7Izi6Ru-e7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX/y5/2/yj7mHn
 Y2LbNi4dRBgH7I6K06GL7cbVTssqXscaxCQPpC1hm5yyqkAiv7+ScZO/CSv3XTn8Z61MyYBOoW2
 3GR1SyNNSYO7FUKv7T6vE+vLWn+2cmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9a2V8joAQOsf
 YMag7ScViHXMGTNV74Bs9w3xvFKcQiTBawXVm5sj7ntRhBqbKVI5pLZYAiF//+65sO+9N0u0/uO
 xUiXj6pRzGLgAT6bsJoA/+oR0CdzJOF745qtntJbJgXUtqTF7UYWH+gIb/LvFHMx6co+ETGCY0U
 lU1S0ELCXYbHrEGa/IIWCcEx4DSJtXYr7fpBe0YpHzAPyU+XvhcWQWxTiB6HosMfHgrkKUhACGE
 wuj5Bs/2gPZa6uoy9xjb4Kjt8lrDUgZ1S4UxYYJ9/TOKZfgZfQKKy4VSy3skiWbKrvsjNOVFuG4
 xxLRRWVpIHH4tODO3xW5Mc4caj4gC5ToiNgD/mHXJpOSxD91qXs/3tWepXuKfM+PDYUq4JgLD5N
 TQ/y2QWcNXpkAMlNjc71NZf3TgzcCpHwsHx1H9lEb4yEFIRyrNx9Yi0VdchCnGVOWz7JTlGiqBz
 7TYqBnMZGwN115wv3ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070110

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl states.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106a49ef8ff018f22b5724db0b76813..68a191890b7d875564080d9fccf85ae9451cf0d0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,66 @@ ptn3222_1: redriver@47 {
 
 		#phy-cells = <0>;
 	};
+
+	pm8010: pmic@8 {
+		compatible = "qcom,pm8010-i2c";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_l6p>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
+		vdd-l5-supply = <&vreg_bob1_e0>;
+		vdd-l6-supply = <&vreg_bob1_e0>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8010_default>;
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
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
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
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -1090,6 +1150,15 @@ wake-n-pins {
 		};
 	};
 
+	pm8010_default: pm8010-default-state {
+		reset-n-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";

-- 
2.34.1

