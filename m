Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015107;
	b=YaF7oF0x3kdR2fQvTFUJvZ4m2Tud5VfKFrk1yyrDTYJqQcXXlL/BbzZeQEVsHghSyBmV
	 eBXN+7kXp8BXfzykxSdIgZHbagLsKsiLMipByDzWypJrgy7C+u2VJK//s6JB0hzZOFTXM
	 ItYbBuTHAG/oA9M90Jezk2Ac+9pAthKfo5+a2brkyWbFnwWOQ5fpWqmCRqJRpC6RGs8oo
	 SjjVSn819H42tx5Xd5qpgW3qi4PSwqZdS9vrdIsAWYSp5mmsv0IoOmLIrWkb8dblrOUuG
	 rPqZ+FUymPy199+G/l108THuBStj0utuPucRbLkLdMZPheT1vv4VfgwkYuo6CTmzekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
	b=r/MN7ZR2vNBAb/7F5lBzApYU0GKLuUHYATi1skAxMi/4t47P0WUUxxhOzENZQFCR9vUj
	 h8FWoWAln0UcC9C7HiXeSbYQ7lS+a7uS94nW8mqf6EGUrGZuPbZCg06tsgafvhozXYW4k
	 4k+M5p5RfJErn1vik3YYCjSo0kXqmELRmegiwbAs/ebtKPTu4LV7vTgb1c0z3dyCr07ZI
	 QJ7GtyvbEgmJP7br+M5P9CD78vuomF6zdpF7BfRmb4uXJDq+tH/FIV9ctbSL5dASmCvlP
	 /f5AKQHPVeXyyMhna+3xi0HSxypBWATN7RcFs6/SrlF9VLkbqCUORc3Gx6wGYdEBYeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ffu8xkRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9tX4orL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268CD606A333
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268CD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ffu8xkRC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9tX4orL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAso1h4131369
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=; b=ffu8xkRCR8fZmSmL
	UEMxknPi6s0SfOEuGEahypjDtCJbwRrSMD2dyNT62r9rBgqKDyIgAqRB/2tMwmM9
	Uq0jjudALcvRoKdxGJ3JqqTvFuBvy9gQlRrsONCBZKdLSv4gkTggnhGHcPOC7sEW
	PYGwz7Eq0xEK35m14leydi7GRDPtCKyusdRlJaCjugZBnMAxwptLpDwItmWk2ihO
	zSng8/5/dOFHNjPYke6tnqskc+taasd4vHdxKyDLYuO1I610j0AFQIvgOHq7tHhi
	r8YBzFx9HgYWlHt/zLYGa02lIeBalSfFx1eybOv7Gk+YI3ecOq6AYZ7rEVftZKly
	jhv1zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q08va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so2592613a91.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015106; x=1793619906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
        b=D9tX4orLQ6dUqxelGR8XajLopXvhwOvmhUyxSsyOIN3hwVGfhfM35/3H5iPW5FvOdx
         S3NoCADILQkP0kGj8wz6glLSB2uqmUC+4vT5JTHT3vaw/3C2GOUq5ZVP/QEa7jLS/H0l
         Ivy4zlf48uR/40LmkMPp1bM129nywkzf6x7k8+mmObt5anE5pkUYnrIOnf276gpt0l+o
         5CSMkTP/BmCgZHtckzy/2jpcNkFiaXkHFJqtwUdOplM4Xhcql9iF/E/YmhcX3UJMGqAm
         l/WmNSHeee75w5NTa+CsLKSapwf8LyL+bjCLifA+1DeZDF2wJOQImeQEPqtS2w2V3jMS
         3R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015106; x=1793619906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
        b=uZGS6soj/4B12Y2lw7RIlc8vY/nCBX6eQch/C8l4FexiNvwHOGSL0nzGx5gy5zlvyx
         Ezk7XSZ5Jv6DGNVh7lfcLhaZ3kIcE7QXnu9ABaDWu0SFyo+A58lIrOEm+iaefpTYSOC7
         3gUIDsHmb20J9ttJA15L1n/GU/8fQnCsEEIkTDB/ZL1EWQRwMws1BWvT1NRQYlaybLMC
         YbSTgxCLyQQSqLkrrSgMQzJKFE5XVcvu9F77ZZhItebIDqhAOzY6YOXvoEqO6RoXwFtR
         ew0b9bEjBEaAl+X0lVEgAK0Mu/7bNXev3SYUE+0vqNBU7iv04UJLw68Qc6eEzdEcVZs1
         9h/w==
X-Forwarded-Encrypted: i=1; AKwUvBzeWp3aNvsm0oGwPsL1sJUq6p7Mz1q/SrDawVJApUyMdyNxLL7Kl862FfW0DGzQ4ZHehiEZQUgFJ+ZB@vger.kernel.org
X-Gm-Message-State: AFq9FYI7jsLsoTdODp93bv4KcCAEZddOVFEI+0tkIV+Uyzq4n/aCi/gz
	02Gh55hGVfWsvy81fmxG0OUr4MRI2B2DCvWtny6fzBeMAV9tU8yffxN35bGzZ2OEU7WH+xcv8n/
	HetcPz7/e8BE4KQGa95g0gpEKbl3cBicYfrTZmbvWXO3EX5kayFakc7ou4SCC/51aFDG55EHs
X-Gm-Gg: AYBFou3AHOcMXsadTyKv4kLbPNirgeihmnoisZJK+aYdYpirmmOoHrdXD3liLfM21OL
	RKywYgqIKaA+qKd1/zxmg/qoSAtcULebVBQa6zKSzl4eXujmymg6KrSQoRT+7Y88sn05hj7s7A3
	DjHyaHq0tM4IhBVnMk+Oy//bMv3cGRzCfu3poN6ugDqwALLWhjbTk4Kv1e3hVacsYLjXy/ZXMxP
	4PAds/6xGDdIsrls+GAUj3p59Pn1OZQYZ+nOwldVv6dGVXZEMf+wSa6AbTlxEl3uXQU643wtSj4
	Remt5f7LwTmfwlFcdfb0l3KZXNe8XjBlaUyOT5I/40KqM6Lpru3Ngb8K72rwNtVwnwGHc1CqpRj
	EGSypHLNxokujZ+YbXj9/zDKRdwsovHg/c+M=
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr5235005a91.40.1793015105545;
        Mon, 26 Oct 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr5234983a91.40.1793015104988;
        Mon, 26 Oct 2026 04:45:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:32 +0530
Subject: [PATCH v4 v4 4/7] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-shikra_audio_dts-v4-v4-4-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=6005;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=pdIT7mbMET0kRvvCrvlYLy7MemTZyL15JS7gsT1Qy9E=;
 b=qJE3txgNTWsNx1kqBImlbuVWeBRt6alHN1GSUKNlAShRXl/nyeh2+Bb77X9x0SKHiRsEPLJks
 54V9/hqOTd+CVQiV7GWXHVZyW4frZwHtHQJV26+Cfrr0IByXdHQzq1g
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX4xkuYcUqwsIs
 /uoJVoXiHXBnkdJ3s5PUFO8P3+eOaU+SfTIzF6omZ9sc24SxqYmDqWV+kbgUDQ9N2xqKendVGaR
 dSG1QIJafJriZEqVxTy45vHmwEQ3ZTA=
X-Proofpoint-ORIG-GUID: R5Gv7LEBslEzAvREdtUllGR1OTv2MMXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX6MkjLbECexno
 LI9cSFdH1ZyvBPiVr5wR+ID9kE+yAT5qlRGgrKgiA1yjzHOsqcyWyjhDO0VjffONo4lRR/6aqUt
 EsQC8PEisvIQOPb0kJbpgnXBrC71KDC7lgW854A2eE/R6+OJrh15+2dE6nwn3+B/4ePrzgCJVkk
 GoUQupo7QUuvoDrE1h5dfO5eos9gXAhaEuOpTGapAu8PQy72clvHUC9lEkmG/pfWGiL0JQpGWW8
 yhAQpHBTymIK97qgQV/ggPU3HQpQbomZGzBEApHuUBGPO3O80amhCEQracDPf34opnIn6ZdeCx9
 Hrejt9LcIKtpahH68qZ7VfqyQzV2M16sJqmzTawEfRWUiUXVVQKkvpdg1avtD/JFJAJDiSf3ExC
 E8KhQQsOlqwG3Athl/+WkSKme8ASSrq/fgBmeNt1HyTMIEnOhlpF4raeMU8O5ZsTeGdMEDqsldG
 usqweMOGmYZTgHyWE2g==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3d42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fe-sOyn2LSJR1eIrEhIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: R5Gv7LEBslEzAvREdtUllGR1OTv2MMXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 196 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 201 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..aaac14f43649 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,12 +23,112 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"VA SWR_ADC0", "ADC1_OUTPUT",
+				"VA SWR_ADC1", "ADC2_OUTPUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_1>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu RX_CODEC_DMA_RX_1>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu AIF_TDM_RX_2>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+				dai-tdm-slot-tx-mask = <1 1>;
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
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_0>;
+			};
+		};
+	};
 };
 
 &audiocorecc {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	wsa8855: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		pinctrl-0 = <&wsa8855_spkr_sd_n>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -37,6 +137,20 @@ &pm4125_ss_in {
 	remote-endpoint = <&usb_qmpphy_out>;
 };
 
+&qaif_cpu {
+	status = "okay";
+
+	aif@b5 {
+		reg = <AIF_TDM_RX_2>;
+		dai-format = "dsp_a";
+		dai-tdm-slot-width = <32>;
+		dai-tdm-slot-num = <2>;
+		dai-tdm-slot-rx-mask = <1 1>;
+		dai-tdm-slot-tx-mask = <1 1>;
+		qcom,qaif-aif-lane-map = <1 0>;
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -56,6 +170,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -113,3 +231,81 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3>;
+	};
+};
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		output-high;
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..ad894249e2c6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -254,6 +254,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;

-- 
2.34.1

