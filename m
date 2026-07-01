Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CAB3749E9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923493; cv=none; b=Jdz5BuTo2v9JPoti5y0fJEliOjwM59yvtOjiUzxqS34uE7MXMBzNaqgrXb2DG4oUvJaAztRNtLjx0huoFPH4QAgx51Qa7ebIHFDLxfqNTtsQzw/ESvXcM5isnYDLM8FOUJAxzEPv4F4+n3HS/0KGQ2//ehfTbzWdFMi78GcfVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923493; c=relaxed/simple;
	bh=Ck15Ifwwt/sWwiGfL7xs5DDUGsPRNLTmRP0ACg6/EYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzAWOkB6D3FM/kvHBtlDka8U4vAf7NbA9r2RnFx4oczhKabR+51WieNIr6PNxTSh0aBaRrGBJbXu4wD4p1KOlEdk1OH9EHtLHtJC/q+mCvxL6r0rY6c01YzspTjpW/gGsWAXsQRxXMhUWpiuHRCZh6pFu5X7VCUhLWdR6/s8l7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acgMu2X5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0SkdxBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acgMu2X5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0SkdxBA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoEKM1570350
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UupkwVWxT4l
	1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=; b=acgMu2X5VUdGIHxn1mprhuPCSwf
	uAPtuHL1DMOn/BpmePJZ+F+2VKm0hkdl9cWr0qZMOD9kwWHY+yfX4oUK3eGeI8f8
	kbT/vODZVeBBjVczf3Ew78VARgFiVuY/VsgLOJ6b1lOjKcBCY419XaIO5n4uedJm
	T3tmh60sUzhf+Hv/2D3ljbz1II+hdP67zxpn/sH/uTS+dkEG+Efi3iJvpgV46rYw
	40IBOJIOg40ClwH3NmmCeLweJGO4h2QNxrFaSb6zc3BMgegJi8r1W2vGPKOarE0S
	wvo2Dz0d5wRr20SfuEJdEMGhymhUg+k2TP0FfdRBqQcvbZ0zoQ+zWJrVwHg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ahk50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:31:27 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-495f637105eso1376895b6e.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923487; x=1783528287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UupkwVWxT4l1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=;
        b=V0SkdxBA5Ek2izJnrRN1D095WuQeChlreWGcRCaXYbZMuVdPynxCL7ODvtCcRYADrH
         GtS02BviDk59vmqAANogWY9hldZEmTTkwHSte5mwsMgim226PlSAmFwKfmbk+ImubL96
         +66sjcynub1z+Ejs8WkUOGjj7/JyMrtJtDhcNU2FkiiG3Kt55Pg43yNlDuSVgeqlseTo
         OvS5dB5KE18ZJAo2xZrj4+a1H0F7bjdmnIjLc+ieLDTlMVov55EwyQjMTrZivZwVBTc4
         Ogrmvlz4iiusyescv4CR9ST6KPcv7yl4gnyMPV2gJP5TLsIW2lWUYGctz86pSpzYrr5+
         IPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923487; x=1783528287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UupkwVWxT4l1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=;
        b=LaTV6SWJW+a0jo3JuvvaTxdS87RrrwkLaZ2YCax7ogxrXp/MFDzY+MA14jzcYp+UkJ
         nkeiDM4imyqmvLK8od0lLKC9q4fb38CnitAbZD+yg/COQRL0Qw10B/EpSTyPK5fzukOc
         v/xO6QsI5VrAxYfs5SlYuIxDJBsXp9xjPsUKPukcrRQqc/PzUxbc9MLTUCKiGebAkagQ
         IKnZo+upIgai2ZFf9Tk8rqzX/BjptKdjf2oTV6ZthOumdUWs2bM7de6EM87R4r1cVBCD
         uZKyLKuGDeEfrodMcC+/YKGjLN0zcqbudbTtgjXf/mxnXZDItgiLrz1Cr2ZjEuCHMTBk
         I4Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+MSVuHH/0EQ/ZffJbBCL8acQg8y5DO6ru4j3o57fDU0YyP8pEVm2LyrCuXDM1dvSdGXI2/subeLgaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyV82ODQwTysSbnQ8/w2j3yZar5P1N4x8NasCQeGEPSHeKvylP3
	HyFCDWXc2rmK9tvVW6cTvTrhZ04YRlYPl+ztf2sxTPbsJLeNpJxPWWPyi/JzsTa0MPkPY/k4uyn
	IjxFcoDO9EMhHn0j6+hy+l2KwFfMuaNlXKxOeSbOZ9V6mpYBROPW3lG3TviSGrzev
X-Gm-Gg: AfdE7ck5YK3xE/ssi/Kr3+BVRnfn5D9wW/+gh2hfWV2xUNrcFNy6+5HnhT6sxc0RcHk
	4m259kll1bDFzlkdOYWtA+RURO67oAZzc99qjDvmpmUtGWIzYjet4mNVUrvtA4M79cMBXWGlA3e
	Jrq9EeXshFXnJaNbILrdBOuXOR93y6PfIffSc/vgSEiDqG/g1v5mg/gKJ50VDq/tV23dqsmMCiv
	CalO+vHcij3BhyV0e03F1SQQTvD4GmBGZtOBdFAJTFipgnHlVHaM/XMacwOuaP0TLnW9etS2tmD
	8KbOazrQxbJzSUPn4AxkRyUtTs91sAStY8mx9KgakCXM7Fd5R0C/Sp5syHJzfC73WC3ktaie2V4
	v6VDQ61TxV2UTHf7J5MQPSpb8
X-Received: by 2002:a05:6808:5188:b0:489:352c:5153 with SMTP id 5614622812f47-4960ef22fdamr1436016b6e.21.1782923486787;
        Wed, 01 Jul 2026 09:31:26 -0700 (PDT)
X-Received: by 2002:a05:6808:5188:b0:489:352c:5153 with SMTP id 5614622812f47-4960ef22fdamr1435965b6e.21.1782923486208;
        Wed, 01 Jul 2026 09:31:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v10 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed,  1 Jul 2026 17:31:15 +0100
Message-ID: <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oOSsh7wk7oqCVOVDkHkKKwdLc4RWY69q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX+ZnNiQYctHW7
 ax9yDpfbOkzaWhLdqf//i7idJhH4PIBhqUT81wDQIW91skclcfP6x92GdmEOLhYZgcRaYIEllDy
 gwlnZI5JcTZoWuSZui6o/c5d6eGcMIwNM8FycNLtN99O2Fdn4MGkm+VJRkMLCub6cESVYlx/4V6
 fddaHUZteGuVbH9rwIGbHZllL0LMEOeOgtyZ3E8FdxQ6EhOyWOVl91BXLLcu0SJN8wyHAYaQNmK
 z/xghjp6WaVAlz6CX+NeC6xXU9DZi785nUBBcOTayDYW31dLspjUl56995Lj+3APV3mmp0gDGRJ
 /k8y/OI4qSZv8hqSpet1ZEfkG/pxB6b2Av7q5IAuppX/UP1gVzk8c/Fs3YE/mcJytj8qjPXNAHD
 aCRfFFpNUFWLNKzaPJjjFDF5BJNg5/WP+qLIjtWYc107yKw6r9cZCjM/lJxOumaQXSv50E46BoT
 nChSpp8r7yoKHiBRBOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfXyKT7HpZlGitA
 pL852EmaQdRXFezlga3Q6Yp48DOojzt0fy4YNbE5bbtfXevLr1G1ytO97M/DPi62zlv+jh6ELRo
 B3J2M4NXYsZwp3c5Xu80FSklNUA2/t0=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a4540df cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: oOSsh7wk7oqCVOVDkHkKKwdLc4RWY69q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..97bdc45fa1c4 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
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
 
@@ -444,6 +492,13 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -571,6 +626,62 @@ &pon_resin {
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
2.53.0

