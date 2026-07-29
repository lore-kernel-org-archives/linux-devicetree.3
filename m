Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC04DB54A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336554; cv=none; b=EH303hfBy982z5byF/Of9YawtnGHvRdTQxpgn7wvFnepiloJzA0zlgiJ6qwtKYYbBujOnNvlC9e3TQnN2cYgJzSK06LktIXBVItal8H0/pgBMzksTtfnvclv9vq1YJUnczFlKfV91YF248O++kR51V4sH9xB4MI02sWjaTGrkOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336554; c=relaxed/simple;
	bh=NSuSGrCqq1LU56by9Gr7NQIQY6WQp38yPhx2rsBxjcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciVB3UP8VVOlETmKtLVRzddtcICX8bQC3qBUKi71gS7ch6Ua+fgHZHkHjQqExBE9d4Yws/D33gfGFujs7Vj4vzE15DkU5C5/mIlMogcADO4w5NMsYawE27G6ckCmlCmOps4hi+lj8VYhW7iT1stovAwPceN1R7IlsZaMDS6i8Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjpgVeN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc89InSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjpgVeN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc89InSE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TENNik2317301
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4noXsM1Xd5+zXB1BO2QYilNssK3Po4+sJoDspSgBvQ=; b=QjpgVeN+5QUp8ASn
	BWwf01CjpB2eckFGay/8u6U8HHZfUYBNcRHYGxj6WUqIuxrc1CgxwrfVxLAifcAX
	gmA3ABMUSWd49qWwTYKrToR6f1t1Hbai5a1tSG9s0BjQa3VRoSya7sRHyYILKIBk
	Jmb1wUkSU+p3mRgzsYVEMBHOkh1HEwMgu5C8UlMENJqK0YEpwBZI+24SmXCTHOpa
	ZZyIzYFqI2/mrOm6ibstxDZPU2QPe/FQP/ariSUsU3LOTRjTlcD44wtB3w0cbBhm
	lIa6zxbTfAvBWfoUCGVSeJvaxLgKiHPFf+iIbEDR5Ah2oztHnyqxl8G3HVZf9iaq
	EY6ncw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ggs60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:49:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso15883025ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785336550; x=1785941350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4noXsM1Xd5+zXB1BO2QYilNssK3Po4+sJoDspSgBvQ=;
        b=Rc89InSEHdlqwEb6qJP6XfCAx0mI+cxy7z2FLUS4+RIzBu0VsUZJVgs39GoDoA1tuj
         u97x79Xs5iZL2CSTs7cWtxY1Pg3mGQYN2TjJXLaOkW63UYzCUxGARibrn3wRmXkjK095
         evETWuufpbzMH3A9/6aqOsQD0VWVfqEDeYXZ+3TZQ6LXaqhnwu5fq0nLNzK8Cdvlb+zk
         kcpPLn3+G7fJSa9DeCZ6GxJTfjIl5qusy+kFXKkhoGTtbljYs4DzX6cw/vB/t+84rccj
         2rb08LusWet8YwXJEgEVzLKdHS+eWb4w0YvxJIkmp79ut6u1AdyRt5IJgQkluMKnQhbs
         caDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336550; x=1785941350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4noXsM1Xd5+zXB1BO2QYilNssK3Po4+sJoDspSgBvQ=;
        b=XJlfaYMZW27W6Msq4e4EvWL/tlU9ymDR/jlV66nNpM8JFcqp5BpCxfNFRTpD3t73Y9
         nUwvCqlT0Nvnz0vbr8FIzrXuSv4brrQtC7M1gLXiDjmVJxL3Q8bGnqi4wEO/WJQNGD0j
         n5ybsCDQtjJQryVsqe2gXOpze9nXi1EexTPUpUvIHDLZ9ktPsBVRtlvCzo5g+TUkNCMv
         nsoFXO0l8llGBKINuwOzuTRsjmbO8+Fk1LMl6lLmmclwPWotI8o97UDvZZU27SRMShqz
         7kSrQN1I5A6uVBueHTfAi5zuDD0lEpZ6yLpaLJgBqKirXzkPQZzDJbYU4+EFIClq0acZ
         9p4g==
X-Forwarded-Encrypted: i=1; AHgh+RoZRBMzr1OU6NYvZpye4SvTNnfbDcdbu6QxRMxVAWtkp43Gp8lts/vjAzHqikOmzUjyqh2Tjtw7/Wcj@vger.kernel.org
X-Gm-Message-State: AOJu0YydUXoGorQ46Rk0K9T/Gnt3frd+9TUjatdAlfwRbAQ02KImh9Py
	oUafozMTZZfQ/HMmNY8atWzbkKZfd03JsGwN3dcdKlvYepDc9hNAJq8zw0TYI6/THnibrGhLHNM
	PFrsv9P2HHZtVfPKA5EzVNvmea63JkSXKH9ZfQXg/amy3I2noBv2KItACkF2hbIqx
X-Gm-Gg: AR+sD13+92LwyhaVbG8kT1zeLPI0+yaunKGT9fC5AKXKpsAE81Lykqlb+VYZ0xFWavF
	wJrI5w7un0pmYGh+UVF5TByThy5AE+plaBK3OsALoZaVpQQob9WDvgWf9hGWLVzEZFAds+o8zuk
	sal2Sfe4NpmanupRA4dnH6bukLiYP3Onx3qUJkNJFNC/xDdWSoCrYpH18HOJSXUfjnEyhMTs0/W
	MhENa/D6sjFzMGeBEcLLvSJrUg/Tz7uieDf4l7bG15YC7NIz1a8GhDl1+gIOGMyDrX8f/0/fJOx
	7E0RitTiZFaEQMs85lE6OEpITHqIYXKIWgAU+eDCF/YO+C1tpmFV0YW5KGY//o/ViQgqmP1ayzt
	+igI4fKEY9qosy03ZkzwvJ7Rc9y0mMszmxNc=
X-Received: by 2002:a17:902:cf4c:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2d0267c18b5mr27587755ad.30.1785336550019;
        Wed, 29 Jul 2026 07:49:10 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2d0267c18b5mr27587395ad.30.1785336549457;
        Wed, 29 Jul 2026 07:49:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm19515456eec.22.2026.07.29.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:49:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 20:18:38 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-eliza_evk-v5-3-41790a5a24de@oss.qualcomm.com>
References: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
In-Reply-To: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785336526; l=4295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NSuSGrCqq1LU56by9Gr7NQIQY6WQp38yPhx2rsBxjcU=;
 b=AgBRrLbDnx+I6P1sEXGmM6GEMT0efSB/w8Lux4VUkMq3NWDJufuzmTrYrakZz/IIjeAqHQc/q
 nyr8uIrQXoGApRCQKxxCUuISSwq+/Yn2gUqAFPcTPTnlgllsKw9oLY0
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX/kkFG8iVYFCD
 Q4XR4BEQ2mZHRLWrFQ3EogfH3ZdYs1YjZsZoFflxcfn0pKf6PJRpMM2cy66x+nsUKx0UAMnyysk
 JBe58q27CBEtt6oxnbEA2TgvDW0f5MOlEgXrALlL9PtyM+UkHwYeAW6Eo35L13Mv4oTHdfeKOov
 9IAcbuttm6mHo/w1OL9lN9SUQcCnGRrbs6lfCX+EMMxGEyRCpysuFJ6KsRjG/wim4ho256yLVdx
 Q2AY1S2ZqwjA66rB1hXUH5ByO/TBEji6iBurLikwuTjrmBblbyz+eQTcxgJAq/0dCca+1HhSupU
 a6Bc+K31i1jHizN1VZpW6FMXmSjIA11OcV8lVNJJxAIg3VB5MQwwbwjvXbWak0h/VikYX46D0ZJ
 H0o/sLYSp6gEB4AyjWXgu1+B2s+86qJCe1KgtkHsVZmtZAAasVgBFmoAe0Ziv1rqKivjo2ixLnl
 fiqJMO7jwgTxCFP9Oiw==
X-Proofpoint-ORIG-GUID: 6NRW1Rju3r8zaQyqRJ_TT1RSWvWgyZsC
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a6a12e7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6NRW1Rju3r8zaQyqRJ_TT1RSWvWgyZsC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX8n3GJf7fyGS3
 VkAd0+PL1oQK5ZykdMoJ6jL4y1sXpalsXl27OeimqPreGIdgLnG8fS+pljEEl9j1D7fs1vC3XYB
 i3feCo699SPsnG3ClwjA2rQEcBnkBYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290120

The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
PCIe switch. Enable PCIe1 and its QMP PHY nodes.

TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

Override the base iommu-map with the expanded set covering all the
switch's downstream ports (0x1400-0x1408 SID range).

The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
from the PCIe controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 113 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index b35fffb50976..419e737c54e6 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_pcie_m_3p3: regulator-3p3 {
 		compatible = "regulator-fixed";
 
@@ -99,6 +119,99 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
+		    <0x100 &apps_smmu 0x1401 0x1>,
+		    <0x208 &apps_smmu 0x1402 0x1>,
+		    <0x210 &apps_smmu 0x1403 0x1>,
+		    <0x218 &apps_smmu 0x1404 0x1>,
+		    <0x300 &apps_smmu 0x1405 0x1>,
+		    <0x400 &apps_smmu 0x1406 0x1>,
+		    <0x500 &apps_smmu 0x1407 0x1>,
+		    <0x501 &apps_smmu 0x1408 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+	/* Same GPIO is used for both PERST# and resx-gpio */
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c4 0x77>;
+
+		resx-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pcie@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &uart13 {
 	compatible = "qcom,geni-debug-uart";
 
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c99bcccae00c..2ecfeddea496 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2104,6 +2104,7 @@ opp-16000000-3 {
 			};
 
 			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

