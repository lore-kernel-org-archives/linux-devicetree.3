Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C34A3857
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549923; cv=none; b=Efzge/ohi+b6syLk9003HhhQRa/gTY+uLdPkdwZMYKtODSRoi/uBCQXI7P1pMz+3hWyQMsac7arBnMnCb63RkEBqxqSy6Fk0RE+0rESHTCs5FXS45m8+fByemvWWU1MqpY4GXYK4mRFnCuXvQ8s8y0WoAMEJPhIHtp78ppf9evY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549923; c=relaxed/simple;
	bh=xMYMnPMU5Yw+jEdo/0Y00w8qs10Os7yQTKA1yZKoEZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHs3NGSnedoDL4vIJ5qV5WYoapzsyy5I9xjN1I3WKMLS3U6elE+JBedzAbUVeb+3mntJQ12+hU8C75igl9Kdpk7KbWDdxzeBGZAt5sxtmnSTaH8isMAnaz4jATwJdmay+QfQzxLjsod7XF0KY5yFjZnt8WN+AQBYS5ggf1Zv7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lG0vRO/N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TW2OnS8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lG0vRO/N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TW2OnS8q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92h6x2348153
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=; b=lG0vRO/NSZbs/qI6
	ZEgMMmwzg1uibheKtGdXFTdCuIlhwO7GimRGGjwjou6OZFuTnGHKoU4U5sV9vp9W
	279PI25Tt5S+0ghQGm3Qs/4yZgFIDM3Jtv2vln9YMQAfGUHJTRHKQaku2TDNJhFg
	LF0hILaBQx6XlnTDbO4RGnTgTv/h2C0KKSQQ8oTdLJ/WhLtG/nWqTRDGK82YlxMS
	MjxL0x4MduES9Wq8EqA1LFvcGBEN71hiRpKR5PtC096SY9YCQGy6wy8AxHTxsH+y
	C8Q1S3BeIq3FMsHGPqKy6YQSUtPMBk+tjT7zoQ4l5XRg1++setLGDl8k1OxO/oZa
	v7Jh6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywaejn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so10267100a91.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549899; x=1790154699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=;
        b=TW2OnS8qivtgVDbYWhP242EHv9tBSGjfgiPhIKgt3BCmRVNikRh0AFHEsn3IsRqpmn
         ++Kyl/H0RkWi/8sspYIKvmCHMPcrYURO7eJb/TMao1nIzL6xvq4Nrdom1+QyT1NMlv7U
         IOt/7EalhNU5311zo09L4DaE6gaxsO2WpaDEyJQ9r199fKzFJBerU26oKV1cvAiJMgtS
         tTH4sfCq8fEAmWOFFHAUqdc8D5D+lWd0aztiX7RN6GjbILl54pe3yD7iPoDtevpJIwT8
         +wcaxD5M80lZ+Yvp3M+U0JcyRuQoq+tWQD1fhQV72OZ7P1KldLx7FxgjYC7zwWjvCh7m
         EpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549899; x=1790154699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=;
        b=ckVfbmSn0g9Oauamok0iH8oRCJYxKaKvptm/p4vt04p/e2nb5A441IVysM1g3lq7ET
         UpT1uiORFdD436+vUPn3tqcLh9QbGu2rjO3QcZQl7hM/1k3Y142ShOktYvb1P6pRItcj
         XeO5502bjTtT12+CKwG8UF139MSTJjFQYxaojI81TTH9J2Pe+czDj12M8Hj9bfgybzC6
         hZxpeJ0fVSPxoNqHw4RIAgaQ7NklXQu9O2ZAl3DMeDr/s8nIN9iTsLrnfS3mpxA0zMh8
         v5A9UjtgB4bO+d1Fg1R8RA+9A0LfKKVDxr518boCub0BFwX9z+0IiSHb2ZT060dWGep+
         t1jQ==
X-Forwarded-Encrypted: i=1; AKwUvBx30+o7+swPpm8Vjdjs4Z26Jhvm7qS1Wv0jFdtG1CJ9fYUvqu1+DsrAcPgtum9xYJIxf8EEzW4kfaYi@vger.kernel.org
X-Gm-Message-State: AFuF++nUob7EundF/N4jU47A9F0dtbaVSf/Li57KDTDvHdsQT3ckM2mH
	Y4K1D6UQ3fz8o0yvW8IhM+C2sNmO+fxOQBDgHyY5cmuzH/bK0FUDOug87LOKPStfde3nxgXW+9E
	wXIU52bT+gGhovEM+gYM0WTJdbBiakDoCaCtC2nyXJWdhKiOk9VtnSCPVGT1N8Inl
X-Gm-Gg: AYBFou1+QysgUzF5OPcAaYtFR5bUjbrTZhl9CxZEgyOZQ1JIkOBOBt7qPzQ1yttU6C+
	7iLBIZZ+DgypL3CwVcrKKNDXKugVlmQ1iDlmUNtqcTQVBrZ5dMa7YNNGaK5am7i1cRVm4u5CEOC
	8uoC7Qbpv43BjWUR5Nh+atA8wu8l9LUuoFexx1kdNi7Uso+BsDrst2BaxuPHdKAuwYdnF/Aiy2u
	5pyVpUiwFGlk378INpBcrTbVwoX97iKayn9qu5AUvQTimiBBO5X4Pfo5p8xUAN4djJkguLIHJ93
	pItgVAxYI6VqCekJuYT8p5m6Q0WT3R6d0JYpE+ayY0Fv4b3Dpgz4+XjNAsfvqaIL7HjURR7fHLe
	wrcGXkkik5755DLN2uOe+G/HZeow=
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr4826772a91.18.1789549899062;
        Wed, 16 Sep 2026 02:11:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr4826726a91.18.1789549898671;
        Wed, 16 Sep 2026 02:11:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:20 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3432;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=EAfEl51H9cFjDfmWgu5NdylSTE4vo+KiMbjbQIkrv9k=;
 b=FmJeSSCMVNN+GTwSdFNJXmIvj9cX3whfmQKXIN4uedtPZUtYzfPUdN2XIDDtnLhdZR+/jQsx1
 WN3unjMr9oDAgoe7mxZYwoZvFCNHfceUdSVZPSq68igQNJrnX6OV3An
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 7cXqriurISPO9Sbk_yAby8fDETn1dXtc
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa5d4b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXyF9VzrkEWoqC
 5osKRBLIcJquLi5xhR58TuPN5h7+KMTZtClDXOY580dB4d/H5EKUIAJWVHdwmsAyx5TpoTN4n7e
 9H9KGfq/+9irNMwArvx7MDb4mskqTfnl/3HBT3AOYNsL9gJ7++XShFp7ZL9CWi/c0TaU5pNnikh
 OscHzULnuaPXFFiqxsMnEGRa8UDc9+r7OUauIRqGhqa+kgA5SwZHP6KoB5m+LNpnQRqh1rFrwqY
 M+v2yFmVYaUA9rpoN+aNZOcuLm0ddY/5QrfS1Ak2ubynM0e4Uknotqvfqiai0HSdUpVKCJw4Bgh
 Ff4t3VY4/8dCvflH4z2AbQqo5eP8p2l7UDrdTrAXUJGy2gN1z+0fWzZSPrr3iCIIpPB+pf/aeRY
 jCwFYkgmF+RW9YwtYaAQ7iSdCXLY2brOGnWeXXvUTJcrDRvu8XPxLjuslhm4XwQy3WDi3595DhD
 3/84MKMC7kAuxL1alhQ==
X-Proofpoint-ORIG-GUID: 7cXqriurISPO9Sbk_yAby8fDETn1dXtc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX3P6NYNVF/58f
 cd7Vam0ufy+be+h3CJUz31gjwklg40gV2vEXOZ22WquZQy8ta7xwuvX9jF0T93/YqR9uVwa/tsr
 zUGqD7ns+Q2SeMz3oEO2UQwpUsyggqo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm
Shikra CQM EVK board and add the DLC0697 MIPI DSI display
panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..d9a0f32ce8d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -21,6 +21,78 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -57,3 +129,49 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

