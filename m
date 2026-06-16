Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED237F732
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640920; cv=none; b=l9s9VXkKcHYz/YA3aygn6a9YkgJVRwX496/5ksAThoC9VjYAwfcZXAZikD6jlNJ2Sh02p99SweUxXDmHEYyfV7Ch22iPZpW6QQfP0QURmkf6t1lm8nu9oAxYNKFdPy+w1/J42jwkuCLnUMvgtLFQfkgz6ggDwyk8Jh4seur6D0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640920; c=relaxed/simple;
	bh=90V0FlfPTJPkqqBkSjOmRA+aO6OFiJGhDlEU1re5SAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ax2VDCYkT+RWrFz3m4rbz2eECFLUPtGIsRjQnBS1unqe46PLX5HqEjSYjSCKwQHBnbEthsqxigklI7vcZSpcU8OTx3OajZkfkTqRxEU+YvjdNRR6oQ7k8yUaCu9Xkuf4zqFP6tPO8CPxZWLVgHw0XzIlibS/NHvvd6Rttx/9XI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+2LQfI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxo9X0Np; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+2LQfI7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxo9X0Np"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIP0oH3967010
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=53e3TnI4YtK
	3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=; b=i+2LQfI7Q8XrKUi57fX3l0QMgup
	YWj2phEhRPn1xbkqpRp+qf/HOHhZUvPLVHdHBZgFFTpXx0Xs3j8csD+lrlqEO77b
	AmOaF7F3jxlPoT6xeZVuyZ2ltinkmIgWYHgou+aq64q+PZWtYv8t8adcN5IP4Ypb
	O7YlZqPo7yLQgb12AJ3Yw+oR8aZARlCVB3euHpxmIa5nYkkZIx2uSrX+DXs9ftM2
	lJB+NDk1BUwDC6wINyrNR2NnjQag87mxvdUE2RFaVMZ681HagQ2R+Jv2CoirgPbr
	nZ/NRE90fnmTA/lKHVhLMYj3uXvr7vHl+/8Gm+8wrMk4uurc2OlyN9fm3Kw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kcmke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso47207455ad.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640917; x=1782245717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=kxo9X0Np20/qC+hU+XYJhN4h+yE2B2z82t5Gs++6kr2YmYtqY9krHbV5RqtH9eCnIB
         3e02fsfvXtA2HKaWfuzcoX3RS1xa6rasp9daJuDvB1MTY2Q0yzHW+WwQPqb5jzllkssQ
         ++MAquPnMQ8+tu+7XterMbffTzwVP0KQ7oZcFGFFPpVlzlmb0ci/ptw7/BobEForM6k6
         V6xa2RNki+UGYZ1FB5ETQyGf0XrIm4bYx7HPQyTXHOTEb0xM+s1onbSC1xriI8UIfktZ
         lrPmoySsjGa1/FDnA3H1ejOleR8F4n3c3ETedPGuf2IEa1hwrSZqzFvc08V/lrnDO2gJ
         fYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640917; x=1782245717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=m/bZJ0nI69S+RkwpLzH2CIiHtRjsClyiKfGhGEPI7X3INR0XGxXRakWbLOBNNxNYJ8
         NEBkEbPSrq4M2mvUEkW17IJ9/eerShQbvniBdKExxSB8mz6DmNSUUyMweyEPEfGYIupj
         ZN7TNLfRPZRcQL1yuNS4Dh5NqXX6lbvCQXfCzRTVIFYWhpzCl2fk6EfXg43y3E1RmPbJ
         7E6xPvjY5Sub7w1Yp+/H+QVq6HOIvp6bw4Xk1isIKePCIG2yhDUmX91nbfu5+TGq1ikU
         +7B2nrPV9IEQxG0EJmnTaYR5QIf3UnNKt4nvqlaPbQkT+0HUleGMd9GcdIubLp6A/+qc
         GXoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iFm6blPt1GebXw8HgYSiQbN0ELzPsa0t6OMUi0IzoJ4tagYw6x1UtMJWxS9Voxd1LaRK6llyaSeTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOX6A+5RIpu7zMa8Y7Zf/KjgcTnpAJWkwIaGPCwewt0+D9qQs3
	A8FlCbSmwKHpuC7Gv5N+EK7L3pT/TDYUdUqpTeruxk0OpZrFVOI6e/w/291nQ9q5qcbbAMEIwUa
	V+ZoqKglXzjqQYX/avBEz6QTLM5Ljj/iZivFsWNS0XsyYpY289HYsbEAFGpHljMLF
X-Gm-Gg: AfdE7cmO9SZB9xcBiYJhZEe0ZtKqCd4xfG57b2I0L8V46IU79hLrXo8vkB+koaoxEyZ
	IYO0QVnkzU0DI3UrOCsSE0xLrm+7fZBw948HMRCTbzCgOo8BJ62Yg2kyAUYRs4og5/ZUt5x0znm
	W1NKO241F7uO2n5GiQyu56vLSUlQWNSBHXY+LOtXqJ0WS93pG24CZ16SO0n5Z2xhOjB3Ryv1FwT
	lho33NE0dLQps9Wts3yXS7Fnh09QRq22ARs4T3OReTXKb/NRNOHCVERHSipbuGPX0Ktomsk6wFs
	xrho2ym8FgEfjnbH4YNw5gQdAoRLGZ0GpRmtBz+IKMVmB7sEEA0vZcpeg21CVqGjqnW/5/r/+gX
	8kzD03uhPN2n6culiux+Kxtf4FvA0/hvy4Z2Ehx3jQ83mm+gNCV90mQKDbw==
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286935ad.37.1781640917252;
        Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286595ad.37.1781640916758;
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v1 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:14 +0530
Message-Id: <20260616201315.2565115-8-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8PegRvzCPdZO
 xTdzYJh2hl1eMzzCzlF4ljyuFBk6melKrSwGA5ii60mxjXqMKZBOmGNe6izqw2GAdjLvXdqy6q/
 aplSdUsZh7fD1I9UZSBQOFxt6DKrOk91LZULWnLXgEcXXSkBMaX8KdZJqCGQPnJ7KAJzej+7+tH
 Rm8sb/c7i+Qj00Q0W8t3SBRlCfa+qvG/OWOT9YSx3fPDFVTzQb2yvIv1Cg4fup98m5hgXOVNwi5
 fAFdtFzeavA4Kke8u4EllecXPGUkM0jRMcDua9xOWAiIAJALvdHOjO0tE2OqdssatKOp477SNpK
 /bMHzFlnC3fdgso3a7yXiN39hMRQ+ETRRbZdGUXnjfGNvmfi93F5wQoQTNlJZngcPLU8iRM+8i/
 vVRZixpYlBndo19oga0VMzuFsscfgHsiSJ2hfuz5C1rPp4jCffLQ1BVMJRY9Yt6LGtzL88nvKRM
 ou9FmukPbm3GmMKvsVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX2rK92N8RQ/W5
 N8sU4zsrRONZ6QWtu2RBemnwBMERD315DoCL6wUQa4R8GUFTii9OUu//lXs/uL1N90OnTBqFa7m
 0DCPQjbSGfIsZ1LRSW5J5ttlIvxa8P8=
X-Proofpoint-ORIG-GUID: yKCUUA0IGexVwHFgvwVk71EsJ-BKc80Q
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31aed5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gAFAZ2oFMDLOpEcE9BkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yKCUUA0IGexVwHFgvwVk71EsJ-BKc80Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 143 ++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..62f405578172 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,75 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -68,6 +137,36 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +202,36 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -114,6 +243,20 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
-- 
2.34.1

