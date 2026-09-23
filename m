Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8B471CE4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161490; cv=none; b=XveQE/hcDR8lDP78QUku/fderVA0OyYa4JmHhlmV1An/FP14fHAac7U1yIKAuuz74PoATs1jhRgajeB0KpiRKAZeudViITLBDqn4N2wG4Va4GjgugKESm3MuOebePG6If4JBt25ehjeg4139qGYfFjt2uHVD6WWnxbnRooGhWpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161490; c=relaxed/simple;
	bh=4ydu2ccoL7r4dmhIwMdua1R5h3XcqKfINUhETugo8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spbwYKbqJvop+rtEtHTA40dVjkR2DplWPH0P2Wbr+FwiqkiTClxWQGdvVQmLmItL1QAethmZNIrTA393nut4ZX7uRA5SstdfEe9bSdYhb3p3RzusVCw0I/8bkD5KJ2yCcN9n3OwodxPs5cBVRLmzn8BHGcSPKR2WF1GIYnJqb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC+hjRuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eORN7qMT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC+hjRuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eORN7qMT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Bxs2262077
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=; b=iC+hjRucKRqaHWoX
	cvJTMHAEiu4LoU5IGldYmRXjTt9wEoL1CjXPk0r9ziRLbHhmWiPKBk8WEFZmaRQ+
	0isthONNDsOLbriT5sfBp8614zDVsdUFSIjlJQfatr6ZQQwwkq3o+1gW2aC1I0ge
	lSoUrcD0OC9RL0VJF6Jbfk+WxZhwziIaaDOxgIvVjya41n4L7BJQGjf3crP422uA
	2lWgwA2CI2s19UJSpac50MNR+oulI8UQCGIhIxE0+9mDR5DwOIwGVaB3kAsNPDMW
	4VFXlU9tDsfkSsvagMiTHyzUmStR/JyeLknurP26GoNNDjI2Ei1j5tTbHM/CWb7I
	e2rxlQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3p25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso1153959c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161481; x=1790766281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=eORN7qMTzWYlrxe2k81Zk7QS3gtokSxvycWYgck8Nmo7vmoyScKU/+XBuQNb2aU//O
         O5STQ+MqKgfi8qy9CmRGsvMMa+MXOSjyeNMoVuj6PvA8dvpfF8jJwcrCNvPFiA+Kf48z
         O4ThqwIZDiCY/I3cjOxPkP/+qKEdvF8g1wabI0fJ3EuKNZ5X8bSUSrE13wIGJwawywnj
         NSUDZ77wrdHDPmtCZtcdJ921T4RbwFmlzmSqIYxEZgkTbjQaEpxWc0/wuC1f8togWCVn
         uenYFc+rz35X9p4hUL2IdxjDGRlrLB4ybx+8an556/yKrCzaur4eIciuYRXJhq7GQ6bZ
         uZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161481; x=1790766281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=U6nLn3BziNSr2NCm35xIKQ4MbLY/8dSukvmiW1XxscOW64LabC1LtdIf42XiZNl7v4
         snfPsbX4WE92UuWTbJ0xrW1KXBc8t6Gn66NHrhcTvBUWUnrYPeomFCRUkPSUJhIkuJbW
         2rrogCqIhFHzK1a+SQbStWjnnyod6RW+LKAY1poQrdEvqwPFdmHN2TiKWIWejN9aZ8H0
         d/mnLkHfKSFP6dpTwI6FoGpIBcy8FP7JQWdSzY2j/iwhFXk92ZCh+EZvSa1Tm+V35nqH
         tqEKKjMRYo5VSf+039nzzG2EhXyZfKVBqFfhTj0gdRZllbLw8yZAa1q5FFUTamix2d+6
         OvAw==
X-Forwarded-Encrypted: i=1; AKwUvByomRLTxfLmfksrkA1OUD0nlN9LZnZL8ZRmeG7UIrSFQibZmNYyHLlt3lBLgDvqyK9iX26G/SFF2G5D@vger.kernel.org
X-Gm-Message-State: AFuF++mvYMvyQhKNXP4MaBsb2JtSAyrize6HCY48hK9armpmb/fPAt+x
	mnofpR5GEhzpyV90zmlLJTXO2sOx+ZQIxRAe+fgeHx3ulGJxm2dK2vtQgo+m4yvTNxJ9S53x0K/
	fvYVKYoGgBEV3uBRZTMSo5KcdYjPYZPXp2HZsAUKEy5ydTfp7eayiAAh49lNKuKOj
X-Gm-Gg: AYBFou0rEyWWbypE8Ei6GwFm+kWLXKoj/DCLuk84cRgP+zQVZzY7MECC4K7TLQ6AJSR
	cUlLS89WBvb7OCNYSy3DHGOSv167VYY8JlVWhwFt8EZ+t8VuLBNxW5FCgTO9t4M17IRi6Rx0QkL
	o33zgREOsJs2ULYkdIM8yvIOrfXRr1TneBr65dKILN6VomhxNHkIIOLDexaQViFculcRO63b08w
	sEnCsLbL+LqT68z0VCp3rh1fzw9NAsG2lFmDZI1P2m5pjTdDCIoDcrmzB/G1J82Z1rrZ2qogNmR
	z3umz3Ton12kCAROsX3Y9IF7WiPUvmtvkggVIneR0dwrB1GB4CgTRAzHNYN6ozvqiucTsh5CvBw
	8z5cmwGLHg9nh8Voebxci1Zvu18QQig==
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2109002c88.30.1790161480438;
        Wed, 23 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2108980c88.30.1790161479765;
        Wed, 23 Sep 2026 04:04:39 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:41 +0530
Subject: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2682;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=V6exmN7k6wtdOoCYYQmAPRf23Vw79t137APmgsQGhOg=;
 b=L94jv+35gQv7GLk5poLrS5WPX8QqX7ygy1v5q0nUlk0ekJaN+3ASE1+kmvFyU3ggoIRuwGlbK
 b0RwcPbBxKCACpGfZWv5tQ+fJ3jmPzpTQ+3DxXHgEPqWG60au7zLOfz
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: AAHSF9tTpYzOYLfolF86kBvN2jlq9nU6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+70iSl6hK6nu
 QNUePxuH9GbhTkBJjaKeFDRwdIObLudQqC3nBPTtmt0zZsEeR1BMQ2S+aSymRPauT4/c/sLTett
 Y873gBd7Avp2DxWAR2KBEMUvwMKBkDg=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b249 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: AAHSF9tTpYzOYLfolF86kBvN2jlq9nU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX6lK+6aLyakmO
 f8H6FuwVyIXrjw/9qkqjocg8FZS44qucVzforQ9wA1oOQw1N+BEXXOXZY3N8THkMgQoTBTnR6sj
 23JmHABXc8umVDMDWfd4/KRsUFLi1OvohMVpglULMgSC3NBUiZQVeXxTqHnKEZ27p2iLGkl18/T
 HH0QH9gdE8aVVzsdS02e2XdSJwVOx+vx4QkAE4iyNfmWLXmDV2URP2HCvnPHws3dfMHPZQx7BEN
 SCYBciwYL45nJT7ubIK3g62vpJVLqqvjkE+PsbMm6PQREfBWFv9nvXcZRNGplfCF8c7snewnS5E
 BvuLNQWCQoKHMgBea5g52GA0BAnro8i+86Apmv7XGVrtRZrfOLMA/6KTda10/BvlfrPy3wkkuej
 2vVABTGRcgDgT2BtEEvL0dyRGDOrRzVFveRcxhmK7aA766d+iVNYPhhB6R0XN2GC/XEoZaxcwup
 HrYpCDH/i7BMhA4osyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
sensor reset pin states on the TLMM GPIOs.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9d426886a6afced6d3706b629e620..183c0c7a7595703113cb709b0e9f39ea5dc339b1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -781,6 +782,60 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default &cam2_reset>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		afvdd-supply = <&vreg_l5m_2p8>;
+		vdda-supply = <&vreg_l7m_2p2>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+
+		port {
+			s5kjn5_ep: endpoint {
+				link-frequencies = /bits/ 64 <1248000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l1i_0p8>;
+	vdda-1p2-supply = <&vreg_l3d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&s5kjn5_ep>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -937,6 +992,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 2>; /* CXM UART */
 
+	cam2_reset: cam2-reset-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.34.1

