Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662639;
	b=ywavzUbj9WBIfGt2bRHeetNF+JWmL+tEflgyT26qSmTmBzljAXmcdt4LCw9nkSKCH/GQ
	 RVIiW8p953sZoQ/6TNw5/z7nMnh36YbFI4PKZn8vPsiI3PN1OfUUOQmgelFOmhbSlMWk9
	 zMkydvU2Th9Xu2oJmQ/EnhcCgfW4S7FT5790nF9wo96I2AR1B0iMFkOJ7wJq3XoW9o1nb
	 6/w9ffV2SjJP/jHvc1eVUvm7UBHf4dbh8XCEoeOcNXz4M3DENduJGmSmYfKWF0IYCCzai
	 K4XX5T+NXdSw2xHjkWRXp4aPx2GDi7EEOzSA8pk6cN3+lTptyY8zVzbyXEm3O61dKpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
	b=Md35ChOSxpDrjosjVnFrLH9NA9/MyPsSVG5OX7npI2m04YMqNVoYLfVsAglz11FuEOhy
	 ysO4lODz5lAVdWDvmlYeUwdwDtpGSDQdbTU2cvSGRg/pWtMLUjol5fdB1xspm54gQRMjS
	 PEj1DRy1i1zaaPvw/QUAifG6gIJH1EGHe5ckutedlPJSyqjSRFgtjNUE1MYoTuUzyvTCR
	 jM/7d9uO1IMIbH2e3+DKa+1NJGlyRi/rf9+H0SeqCu+cfKg+3O4S1zx8Zf4m7y5nGFFmB
	 RT9H1jXUoAU0ldb8zT76vM1qrXf/MrjjE75p3Td05hd7Im1WiNklL9hIMFD5QntYT2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS2jglrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJ8UtQW7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCCC606A32E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCCC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS2jglrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJ8UtQW7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706RI4136656
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=; b=iS2jglrxAjtO05tv
	LmqC75CUX8Mp+UTUCzscD6XK2go64y+oCCPNxI8aigstHn8Z4t9oODQj2HsmZ16r
	oaNQGg4pjn+dg2lncrYbtJhZekEBpFkrh8wzSLcVIOacqD2Cn2KI0bWP+IXdS5w/
	/MDwlpZzV3q/ikvkYfdquKt7fzRH507TGdLfS2NlDhwRxJUoA4dOlkvdS7/VFQ6s
	qDYRe+Z3NfAYPypNK7GFJ52FalBjyXdSFX9PjNeLyWBxYDBLeW7M3zisNUoGgX0i
	UVg3LN63UzwLSTgrCA2CIpkQHMH4q53oIf6WSytBWWeyPI5mKgpELO1FnrHQDNfY
	4L37GQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9sf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so4259462eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662638; x=1793267438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=PJ8UtQW7qSZPwnsab7+hhlA3NQaUZLkq9ciGFiKWcflgKg1lwejDqyDPv6uzD8YNA8
         TSUWub5FX39hcgFvAVmhw0/ZjOBzlZWA7GoxH+DM/CwjmOGg1N3eRCds20X7PuOcopAP
         CbPH1i37P0DLfpfvD6lcU2rlPHnKtaqFVPf0MRIdS5CdceHo1V3DepdJgaN3tR8cQIBC
         BMmqMYCXqKTJssb3v15xri5aex8cMbwsAi9DX2s5js6ppuyZ2IMLUJVHFc7M0dH4jqiF
         KpzyiClzcwcCgjVP6Poq2VJAk5sPeIWpTHD8L5AJYWAFVQVut9n4h+2ydFOkzW0BHmeL
         tNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662638; x=1793267438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=rfrOO6bYdVFyVQhmsfrLdRPGTiyhMl6BazSHVF/TTEWPqr9HTIN8AlqpOSNXaaRqDg
         dny1xvYDZYnvfoSle0osjk9KHqw7vXsSSC1fbh77LI106JQ36GXlz/1UvN/4BLAngDpK
         aBbElF3xomtx4tWS7MRzqkizd6eqJPl5Jcmz+o2pzlrUF/sYKsBwAw0ECQG1QEn3iIyV
         v4flEUFLMn8tygXocfyNMtFy6SC/ty7WDrQOEdKGp/Mk/Qq3EVIZgrAR+XpcUaVVSg42
         7lnxBbbB6DFU3WA0mXHVmkYl0l4wggpbrkWMu8CUhENPmDURxegh6EBbuve5VbiXB4Gw
         V6fg==
X-Forwarded-Encrypted: i=1; AKwUvBx/IOYJtBRhpM3UV+ExpOZvWKcZARcg7nkextFhwAsNbh5mQn9Nf1xlfdDiZ7LbMZWv9/lQTWE/BNVw@vger.kernel.org
X-Gm-Message-State: AFq9FYJyA3ewetIf9w4m1s8qSx1eJCXY1ZplMkSRICd8Gvu/PM8h1tyA
	vURGH2kjyj6o1hGXsE120kge/Wm2/nIqdM+j4T23lLkVugjoAkPIbYoB7StL1QVqs8Xyfr2AAVq
	JTyHdBEjJklCHPFjlLnUr0/KSMaFwN43JOb0QHr46FslWBILLVarwOOJupRAgJCE8
X-Gm-Gg: AYBFou3J/UzRWe0Qp317ft0cZOdh9sTeA4xUAT8tUA1VZ9df+xex9EzopLwH21Z6pf0
	ZhSwdHpheI2Mo1xRwiXSDkfxOgWQoB6DHadjIcZO1D2WseiksSJfv7pRzdQZPLIN6MyXJe6CR9L
	zzRiTnY6g2Bp8LHfwyOmvum51yyiWBVZzi9RuDngiuS4Ww1G1JApzZVUjk5Yg/uNpNcI3LCtVau
	yKB3CcH2mSyA5ZCabzY18nDwjf6JMUXdZZSJ2lOfKwRa/lJzKUR7VpGXEkalE4I5FBmwEzHeJXq
	YXABNue0DCTFusZ0F5HyEWjjDW/6d9pIacbJ+VdB718OgcWuYrs0UBTfJc3dqBijGno19pR+v1Z
	v3m0uUILDzxFiOUqBOP9pB3HWtcdgK7KMXpA=
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3365614eec.16.1792662637515;
        Thu, 22 Oct 2026 02:50:37 -0700 (PDT)
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3365580eec.16.1792662636961;
        Thu, 22 Oct 2026 02:50:36 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:36 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:45 +0530
Subject: [PATCH v3 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
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
Message-Id: <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=2296;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=WzodycgshZu1zmZaPE3luzfQaJD3tQB9g+hnXzzcEI8=;
 b=4Qb6ct+RTMlJN9XUHeGuiQs/wD4nFaiMZ/8tSqJyLThvnYyeMy2+ICYTPsWXXn4so5/rFjRgJ
 8TB7PomdJ5lBZLYojSQiET/wj8IqXjiJpPE6/vuWXyDgdzKggcI7bk7
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX1Bgz7rDv0m2D
 56SD0dFd0jq7OOjmOCUz0al6iYIMYf9XymWsPJ7r0GXE/p+PYVkuKhwz1OKhPvHYzgVnC+kAZGC
 sCBK9Zbd8P4FUkDG2Ss+pGwkIZH3w6M=
X-Proofpoint-ORIG-GUID: klsgnBcLtn2bQ_Z-FTLIG8JKUwjicn0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX6DPJ9GlFLEWe
 ocIw31fjFZj9At2BM9lnGxOTFx9DaEQS435Po7YmmBiE5FMdhGS578IAQWGWBd1qvAodZbXu8Ef
 LSFZSen9y8cPQxw2vfIwlo1pMZo9kTU3QaZ/n4yZgeix4vjPvULmLTmEK5PJY8NjpnmSSeTKPpm
 JySP98RYrF0maiMheQJ3D2Rn9qpnNeWssmozxzst/U6l+A/GyWaOcuoTl4dgFbtzhbZTQv+b4fW
 TTMJF+ZG/porO/KmIRUuwW5+4sJGJy799gZxPjH+34BnLuEGS+vw51usZcsr+MixUhcldnrhVTj
 5IVJTCNQNyHzdF+VnrbG3+Iq7cTP5rU0HRXb0F4ohifjXe1RtwGN9PCaQJXi9p/vwdyRZ3xoC+V
 9qItPM3QNtGWzTljet4R+8oUTixg7vO6/iSqv5mfLAq0+FscMIB6FtJAyo+6fJilolB1WfhJf6s
 sKaVhUs2NNL3Yt/BOTw==
X-Proofpoint-GUID: klsgnBcLtn2bQ_Z-FTLIG8JKUwjicn0x
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9dc6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XqinFhvkQ7oosSToCroA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

MTP does not have audio jack connected and relies on USB mux (WCD9395).
Add necessary nodes for proper audio headset support along with USB
Type-C accessory mode and orientation.

Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..22eeacd7aecd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -200,6 +200,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -232,6 +233,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l1g_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	wcn7850-pmu {
@@ -916,6 +926,44 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -1113,6 +1161,11 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/kaanapali/adsp.mbn",
 			"qcom/kaanapali/adsp_dtb.mbn";

-- 
2.34.1

