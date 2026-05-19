Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77B403EB0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207013; cv=none; b=hjnDaH4xA0iaowctt/MtXgShqLq8bJqtBks33+rX+zeK0O/lqwOhg4oCkciiAFXIEPU2PwogSKBwJvpJzXaokq8SnKbY8hDXYQqWxddibCtAOVoFTJXOizv2X4+tH1RdgWq8jIQHOTALEwl7SqNQZ8MI8VvznCvtl6ACuspiWm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207013; c=relaxed/simple;
	bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7ce8YSqQBzq5tuHGkHy5DbXLCgH9DLqZC4uVT19MByuH47Fa6rRzzqEWky9YUgOiCO/8RTEdu+VSBRjGA3/dKZpc1WI7n7iJbqLMO5G/l0vTdL8WGgAB90u4kGSDMHkxunM3D48YNlW1hF4c1Y1hE5HZcXYgnrBhBsnySMs7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWhbOqPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNWVOZ6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWhbOqPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNWVOZ6T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx4nQ2867942
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=; b=aWhbOqPE8biRiRNR
	I+j2+cc1/i6/z1tFQX0Uj4wRfHvjEu2Ir+F3Xz6erl8YEzXhcPh58qHVlh7VHsqI
	Fr/A1KPjQ3k+wEDBe0tr7jEY0dynjvKAwUc5YCrGqiWqMb9dSs/1y9K0nGp3wd1J
	XlQbpqp4EE3f3Yz7kIV9ETWzHj3oC1nXb4cgYxXhU8L93JI8HcZaQ/+LgzX82oJM
	cgYSkJ7Q7e1mGg2Cb6ADeWTmMdsW5c7QGIoCG6vgj50CSsBUMTozj6xZlqMSsdr6
	qgxrJBTFMzgPUbKhzR1MliV0OMVV5vT9YDQjeIex8VDI9IzwU8BsYw0+5kLdivga
	tCYM6g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w8b74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:10:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f73835016so2842915e0c.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207010; x=1779811810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=kNWVOZ6TRrLU5CyuWPuJH428sOenXYfcDAJqmp+IURsIURdjea6lzd213Dv5346E5o
         uhUPjbXSLT4YAzXMzLkHy4Y9HFIJnZ4x62S3Gc/cflcdTQPrnREX4e5CsMTAmh6/im1q
         oMRCmIZF4DYO0v0keDli2KghwpWuo2c0VcvV+p6WoliVUx9DQCp2xmOxU92YtTa9UWF6
         BkzrCsYCDiB+U7yOa4EmBfLWwnznuZtBj6LYQW6wfJPaNBK9KeqM70al0KpTUKASN6/H
         TPlyeBCaWNHtZkbDghMb9g5zg2V/NYY9eyO7qKeQJbcx6vMIBY92jp4nrUjgp8gWLZjb
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207010; x=1779811810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=QV+4MTv18MBQw2KysgSTuXLU3Ej3fI7M+lYGGZK0MPPXM2pfQVwI3P5xFB1B/DWh4m
         umIuG857NGAs9Xg6e52osySetsBa/sd+qe5KjCFYVZGF+WsmWWygBV5iawsaRv8OLRm+
         +QTb9GLQGJTV+ic6JaMrhQA2sdZMZdWbtHadZvr+YZUUE1235zr/gxh7gWfsymYmEQaP
         2lPhtqaiL1fAMDI1ZLye3980oezE/NI9jaVUxe4cSP5YS8YvQtTItAhpDaU2/j6Ec5CK
         2nIO6zwAiQsTvqUvSs1qqWMXfJJ+g7WTSFjM93ZSJH52xuYqhSRvyGi5SkbmnFU0d8n4
         HioQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9TKtiBNcynEQURtu2YpsBF+JJhbNYSuv5/IcnAmMxUlIl8Mbl7d/CXmbGvBHGWMi2BSBJrV06MQ5O@vger.kernel.org
X-Gm-Message-State: AOJu0YzMESmZ80h3SUJhBnIjd+wCIGozLq13SWv2oeSUz92Ab9RwcNDG
	Tt5igUJpOeT+rYGn0KjVh+3UuGWWsTJMmL3pFpTfGoLpfv9fWNjInqesu5PPv7s/eWzoUbJ9AlK
	WDnzmuKwRUIXj3lAiydQpaw/BPmJNy3//BELFN/R8rc06h7AhRL/3O9vEZlYtc+l8
X-Gm-Gg: Acq92OG0dEnsN3Z1BbOFsBQBTFaV1Mr31ZF8wKTX8Obs2aRgKIuVJrEf6VYMnk6GA4p
	EN8+U8+bT3S83wP9BVaXhh9SiG8lBHce4/pwLUf1LPdnZJzeV+ff9MveJE5mOLXFljYSRLR2DOx
	pn0jJYcf3vUTUZXuvFnDU6mDgpx3lbmNVsCYl5788egAP8HiFMu9Y5Z4mrn+8po9THWwiTatNyW
	WczA8Q3rDxTQdqDdWlHO9Jqwr6vkdqm0zINmHzhUouG8KoSqd7jdvqgNpMnjnE5Q0U1pqXvDjBl
	dAoj2rhajEGDQH8y4u4icRVo9wrQG2R03WgL6UO0OSyWEvsgsqijYtfTqibltYBivEfuNaRB6j6
	htQIm3xBXjp/C1UeI8qNoKaX02Swe
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr11527533e0c.11.1779207009793;
        Tue, 19 May 2026 09:10:09 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr11527468e0c.11.1779207009098;
        Tue, 19 May 2026 09:10:09 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:09:53 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11344;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItZJxdM5WE6tbCsiYLDLgfDSDkbuBFmnhnpT
 GTiW29uVSGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLWQAKCRAbX0TJAJUV
 VrziD/0W2lT4NGpdwroDUu5gvJ1NU9+V5tVRO0U6kuILim+maMCvFmg+XrbvyfoLVI3T3D5dYX5
 7ZigKck80Zf3TjnivwYUJTfH/XjTjjyp1XGpUGoL6AYMJH96S8MMk9TfIuHbh1eCHb3w6sQ2Ot0
 KAuglhKR4rZZgrrcXwfulPxU4so9q268EJbic8J3wdbKB+Wzl++0SMh9sBCxrlyWxmL7hH8VOfI
 qxo68zzcsIrXt2sTjz8y3FB/3AxIo9ikeB+nPVENGpwQVB0UDIgIJSZoUYsxR9cgH5871bzXMPe
 k15/o8DFGauAEli4cxL3sCe3dJRzsA/Y/U5X+01pY7BZTrh71kVjYbIzaiEPrfdU+pnjFQ7pNXS
 MEmdonD15dLVFc+YNgsv3QUJlX9PcBokLrAXlaRO6kkJU+rEigMY6vJCHK/7KkHjOUhUr8CFQZB
 rwr7/dwbGjz2MFRmIhwKPm1phAxryuZOSYKozbr2ki/ho/f/hz1AQcoD7TUV5Zk2OOCaCEDrltq
 pnomNsw0FF7zCGkBrrHn4G/xWAhX99KBucNfjT9MwROz3h1dIK7IGEpUJnB5YykfU2s814oy5xM
 uJNfQq+DmRrI3NBuYmfhAlqfVnd3TsuD7kB0TtgunVWX350hi2qndCkoAbBUIW+JDPeIhf+StDA
 GDPREfM5YAuf/XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX0EDXKXmLH8X7
 enZn44OHcwq7wGNWQtOJ9OW2P5nufTYeZRHD9yScpyCt6tSC8KEy5zeQjMOgsQgXXRkcD8Gb+Gn
 qwGRoOGVl9WrsnQ1wu6IXgcE/d+wyaz+2AQXvaUPuXdN2n3ZojUfd3Qe9uYMlmSVO2vhUD0ZeLU
 HsCOcjRt9RQ3jwxdPtTCiNEt7wyM/ek6AyUmbxADoWfY+Uyv8JQCSivqsIU9vQF7YnnZQtNiGDD
 aDXSqQ8FrFhteTr6RXRdP01fA1j4C9zBKEohXEJzwc2IGSFld/GwfN3jM9gXMT0ELdyBLiUoAcZ
 IkAH9ZbtcDMRm+294wu2/sbGnlfEOtF6K3dF0/UxSx3Ak48CrXAusxHQcoeHUVmj7RH9c+nj+Cd
 V0Sra0e9A0jgoBNr93Tzy5qY4RYijZb51268xRvHIyyxLjE3fukS63n1QWvAetgzhmG0flAT80L
 0GVTUR5U6WbDJGaWmbg==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0c8b63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zEVepFEk_aNjd-2SQIwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 2uasT_p4-lOlffdUWUMc49x_f79I-74E
X-Proofpoint-ORIG-GUID: 2uasT_p4-lOlffdUWUMc49x_f79I-74E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190160

The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
while the EVK base board provides connectors for a multitude of
peripherals.

Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
Describe the regulators and board clocks, enable eMMC support through
SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
new file mode 100644
index 000000000000..5e0f9c1698f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};

-- 
2.54.0

