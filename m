Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB11F3E866C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286731; cv=none; b=prHMwjSQriEPliIWmUquGwdaBWung4w3HEwTlH5o5Cd114V9KVoY4Zrv4IS8QMYXyNkDFO9q7IVkEXr0NzYZuYexWox+qKWMrh4MfwSa73Pg9JEt4JScXt9WjXalmqfoMIF/NsTYZjX3YYYC9u0Ld0f9jc8EsRV+F/ZanLbXrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286731; c=relaxed/simple;
	bh=yz7ySbkOciVrRIATjh3rTH7OWdCvTZnxmsz3vBzo1yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aPUhUS5eQTZ8hadAUG+1pSbQRE72cgatWp2ka2UbCyKrqJY7VLhJobNiecY28NkRuvOrTBN/tOaomMf7D/mRlYhO+FRwAXIn+sf+rcGWCWrQ8ePNOYYK3BPtRfeHg4uzqu/7lftcePObBgGl5ehPl/eZSrHhw8JJtpJ1tl8wgCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eve0ZU44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzKcQv1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eve0ZU44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzKcQv1/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oZ8E1178265
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RP3He2Qs3Es
	9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=; b=eve0ZU44oQ7MWwZxmt2Ox30bRzt
	jjUT1bJctZWEFtPtmseFEsPNMqCetnWihO/6Uuoroncn++wvGVxg8pITbVTShF8i
	0k3UTKBumyR4M0CjSWRfLfLLHGIv/d5LQg8nJIUr4+YRysjAlM+np7k093fDALUG
	tf3yVoshQciEtiogOQq7BjI46P09e+jbeXvA8c4w9aquOk5z0c5VdABO9HP4b/SV
	/5Ce8jj+psb4x7u1q5ONvTRJio1py2ebSw/3Ow/7v5v/FNSILHwScFWaAx8iZYu8
	jv5X7mT3p/u4U2uezwbtH2MuCoP0TSgSVMkGiaJlyD23vuQrIdillGdyZjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6rxs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-836d0184333so6597351b3a.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286724; x=1779891524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP3He2Qs3Es9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=;
        b=GzKcQv1/9aPuZEejZOQYU0kO2z+RsFO0TN1nJnqaOvHTfJbU3SvoD9pfX/dnrtN24u
         0rR1L9h+/1h3o7P+3kha0pzBbMcivJCAck6JtyD9AnFJrRl59bKXZU08aY+xORm4a4Nk
         3oLfDQP1ikocXdyJbQNckk6PKu9ReagjCXbZ/ETg6JA1S7RqLQsjAvzcPyuxv3kxkGZn
         8+7vp7bepyboCPH39CPgUdKMGRA3lU7xo41cx6KTfBxgF2Axd/V5y2dDbxbMU3rIDYZQ
         0Wb5x4trqoTy0pocVkCR6FuVo12h2j2tsH9GtB4Tyu/qqPEtQ0B2OcfSNxXo7upSvMCq
         lLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286724; x=1779891524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP3He2Qs3Es9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=;
        b=jOTZ70ht6BSoeTwYve5qJZgS9FEVLsUy935n7Qvduv/MQ2YroxZjQgJLOZSDRTXO8n
         xLUjCB2o6RsmjB+Xr9Cl6lUYtPgRZPZY/H0aUN2lBL6X5BpgDY2KUfLvLgKVukPvUgXq
         Yif8AQWssnjIkXnizpkB0DD2us++lzhxFdg7fhxSf7So+qiDN3KX1xSRxUOxF9yyh8iV
         WiCexBCcMVxRd17qGJkOS26EZ3bBtNwIuuemqHL5vcMIVRCR6rpJ2r/3pNgpTgk0r4ev
         CoiH0NiGqXgj2Gss6dSk1QkIt22qvlKSRmGfblniRwa2fkeYgvzLTjLF/soBi47CXmrv
         148Q==
X-Forwarded-Encrypted: i=1; AFNElJ+C8LIaoPsnyUgW/DV3dVi7EnI+ZYZuSbXitSe22Jb4hL96G/uSWS993RE7HYlzbnK3PNdI9vbPw1qi@vger.kernel.org
X-Gm-Message-State: AOJu0YywJa3p/oQysdUZHObOoLWF7ZpH0jurAurq3GSu9pTGlGyzq6Xf
	huchFEA6Jg/ZKl77EIajRq+OCd81lgqJLJrOkyLeADsFQH3O92Jj1/jbo8KQSTid/loxGtYZ0vn
	suHsEFYsED1h2DQrkSarCvtEmRzfuRmw2Hf8aJJazxGRttcCOuNJo+RlSiopbov5C
X-Gm-Gg: Acq92OFTgpannJHarrwYwXruf8I7ix1I0HH/xk+wTFW4keU7t1rhMr7bI986FF8q1nr
	fTJ6QjYziVMnvoCop+mW02ofUza7MIOSX75KG+S1BKlG2cT/LZgrRrkAg+7j+LJPGdc5kXC+vA1
	WQkqBhSLwdu28xRX+W/C/Bm60Zwq5wDDteuHVm0IKsCabnvHqk3HnzbfZm1IM7RGrH1eso0Dw6U
	bc+O3UsTa5N3c6xx+FvlRg1PNQYeQPLgrvzAM2+A/JGNWyewaOhqg1i42CfIJ0R5cwd/DtBLHTX
	ec60k1DO1cRUbokxkTyKLr5L+oBlGxAfSkTdl9U0vck6M4WTkMgKnXKbvL6e2FkSAPGExHIluND
	g+NDdeIwTrSrThycRjMf0hGUsYYb95k7m8BLiybB0B2WXtSV29p40QAyzuRiy0rPuRRhz4OLtjw
	rXrF22s4ERXJBOhUAseS26AZf5vuuPbGxS8fKo
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr25120040b3a.36.1779286723900;
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr25119999b3a.36.1779286723462;
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm21990803b3a.15.2026.05.20.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V8 2/2] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 20 May 2026 19:48:28 +0530
Message-Id: <20260520141828.2724689-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
References: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qZuDZ6sJAeKaVQmPHbUWGrgKuEYM48vH
X-Proofpoint-ORIG-GUID: qZuDZ6sJAeKaVQmPHbUWGrgKuEYM48vH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfX7VV0HPbcQh4j
 SlFM8rDBU2TEFHEHWB1oiNMaxPVRE3YtE/ZjMwQyrUTfPD9FX3Cc+eiF9DIHV5INzk2p7DFDCdk
 yJ4SCu8l/tdHM9JT8zNImWH5G9zvqA19VX542wgjML8SVWQ/7rv4CfTzk5M3uGz75R+22iweF7I
 KMK1gB7g3oBvT6tfsSLwK3qvemZLgrRn0fQjs03EHw+HEKftT+ofbO5S2tnKICnI6GyQioMGtdH
 efn0VgmxX4lWtm5whMC2QGHaZl1GFXRAw8s7c7N6Vp1/ZWjPw8vINAMQ2RD0CsesOTEch3jTw1h
 BtfgVxBzlkeUm22WOjVHWRXQaV+WMdtg9nN5ZNTcfJyQdSau/8IeRRBcI1uMWa1AQDmvmRz0YpF
 Cxhag9X0/fu7qlJzZfL8rkOsr9wssOSNYQ4mk5Pnr4pQDgm/CMPckEBTxssNvpQNjVRHMrDOSFp
 X489+hFsQm05In/S20g==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dc2c4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200139

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..4c00d09f766c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "wooferleft in", "wsa wsa_spk1 out",
+				"tweeterleft in", "wsa wsa_spk2 out",
+				"wooferright in", "wsa2 wsa_spk2 out",
+				"tweeterright in", "wsa2 wsa_spk2 out",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +492,12 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -571,6 +625,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.34.1

