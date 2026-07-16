Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8B3F483D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191723; cv=none; b=DJCRDbnTHNYn4JLj1Zqx7Kszcnnxq7iMQSkDRHaK1Ou/rB/YrYkxTBFZ2BEWkn+2EhLxkbM8o565E+M96z8M7C/1rnuxhizN9DyDrkNweWXiCY93c18o7OVXjU81VupwC8jZQwn2PT4WZ5BdZijk+2lAxHRimycjP/2n69QTlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191723; c=relaxed/simple;
	bh=axHqb1mN2GhgTYXeefA9dpqaSA3EzsSJmCI3ycQRWeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NPt3Ba+NXUdla3Q39uiPrjcgEmc5NIIMaqUHJtg5/OSn3gOJfJJU3iz3DX99aqpTe7FtDArc6bCuxaU3gogExY7OeWVcaqSu9031+I1i6CZarCiYUl0po/hJqxSaYSy0ePJsH8hFM85sfzzWSVxzcKFYkQPnbnrXcIeWhcyjm90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPt+akIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WT+lNX7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPt+akIb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WT+lNX7P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dm8S1848258
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5yev/2pWNLUj4eHfGzFolI
	Dle6s+OQ2A1WFsv3+50nQ=; b=BPt+akIbd6r73OcXb9oUAH+cRkttAySs9nClxv
	3cDYrcMImhwFZnWc5VsJnCHaKBIJC+sIMpiT05HSoN2WX+3kvHcd7eReZ7Ir6RTP
	T2XkFdHIRHOF6GjkD8ItK4aYcmycl+xAV5lwOPC1aiefixqB/G4g9Gpk/7voevCF
	7hpWhqwsMy5DtC0BPuZzbphSZ1tLbElrA5/0LkkTl5eHkpYPjeft+nb3eoGAaA+p
	lF79cfJK0RL8e3geOKoLTkFaa0ZgQR6PwlpPnK3FG1T8fA54+2p9FFk1BkP6fDBm
	8CklnXo9/z5k29tslEvktnuJaquZ32w6JAqfE+E85dnUqoQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rej0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:48:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso3525661cf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784191708; x=1784796508; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5yev/2pWNLUj4eHfGzFolIDle6s+OQ2A1WFsv3+50nQ=;
        b=WT+lNX7PGGFvwCFML0fMrSQAi6Ij5pOo9cyDtIjOWM1G0l0ZCn0vH9WoCdbWq1W3Ue
         iCouJCd7rnE2LozMsdjB7G4BeiluGLXpqa1VOByci9Ch69jMT7kBRTvCycr/DUmxC1GH
         3Xfv94vpOMDF9cRqSWxFbbKG3y7TpnTBbaGJCE/IxfNKVC9SeXPbkJWSgcyw2kvo7Wfn
         /fxWu2REosYlXbmeygFecbPbjVRxkKlvQMo+i00ycJRQlfOydeleAKflPzmYe+8yDUPy
         vBp/Wib9jSdswxgk991vf7PLSYF61QPTKKsGcHXG1f3qa6k4DLx7TMGQ2h+y9NJeDSSY
         bEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191708; x=1784796508;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5yev/2pWNLUj4eHfGzFolIDle6s+OQ2A1WFsv3+50nQ=;
        b=OuwI7sycKRLtGDFFsV40gEOwfVuPhEkOTvFUEhnvmUmx6LYXSYM1tYi8LxMoh2cKfp
         zG/AiO0m4COq6E68Ie2pGtSa0KTLQKkUccH8dM1Xp02c1vlR2XCgpGGB9rQyAyzYPD+e
         ysOPFeEcXClezV7rzYgRYiGs8sZYb1ynaEEpv1/BRDDCDKwAdgS8038K/p851rlAZwxm
         02C6Z9UrqGejL+edTNqwBaF+uNA5on6jxhmnHO9LxVMxewVkqzGFo3BIWW8c83PuLPwu
         Dys6bxox6Wk0jP9HtLWf0oNvvCSmEWw9Ryre0q5+N/70SQn8DvlGAw1P97lm1KUTNrUt
         fBCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Ck48TaOvixn1yzLT0LXnxnLpLp3XZx6sTSslzW9Cm+VnOV24oX5Ox14MF2sM2HaJIZGLW7n74W40@vger.kernel.org
X-Gm-Message-State: AOJu0YzcghoRz2/a4Ku4MLKxrd6pS1CvwXRrMoFoLFL8RSAeDx6BK90+
	jd0bnWJPmy0g9UeoOM4gMeQrwNHA+GWGG3/QXpGjaXmXbyC6gsre8sb2qepAJjIfC6Kzm0a0y8K
	TBRfTT7Q8fKD6BdPnFV9XMYsScdm90Y+fqaoiisvMzOJdsuYveSFAzItutlDI8SWs
X-Gm-Gg: AfdE7cm69aaiuJKQ/GGMsyk+yL1o8D3g1Ur6fYEr7ztfttxw0XN0VpNuXN/7+O4lYv8
	DRzStiTaV0vDlrcNarS5FB91VajiouOExHBKQE0WCnfaTnCytgu2UVkYK1plGRYUP39qvB1dtYf
	xCi34v15FZ1QE+0Xv5o77f5LiWB84havhqX/kGxDZMUv4BgQMrXiwaNekyMadIu4lE/MwBW4WSB
	TrOHP3/y9SIezTZ6EVhopoGMA24SiTTfKcPMFmJKKYjZolZr7ViI6p9wkuq+ScrD0azx4Lin7S5
	GMSwJhx2pH7n09Cufr6tPprruGQNtcVkejoes/2iqZXlX9Of2AVQ4vW9RWSt2PYU1aasCEh0EPY
	txBav
X-Received: by 2002:a05:622a:14d2:b0:51c:86b:3487 with SMTP id d75a77b69052e-51fc19747c8mr15502311cf.33.1784191707503;
        Thu, 16 Jul 2026 01:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:14d2:b0:51c:86b:3487 with SMTP id d75a77b69052e-51fc19747c8mr15501961cf.33.1784191706942;
        Thu, 16 Jul 2026 01:48:26 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d21fsm45063715e9.2.2026.07.16.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:48:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:48:16 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v2-1-e53b1fef5705@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM+aWGoC/52O0Q6CMAxFf4Xs2RKYMKNP/ofhYWxVpsBk3YhK+
 HcHmvhumja5ze3tmRihM0jskEzM4WjI2D4KvkmYamR/QTA6asYzLjKxzUB7gkHZDrA1LwlqIMD
 xBtjLukUIVANpJZ0G3O0KnXOsy1ywGHd3eDaP9dWp+mgK9RWVX/K/DodDiAz+Z2sMeeueK+CYL
 9s/WMYcYhWCi9hlti+PligdgmzjdZfGwap5nt9Gg1B+DgEAAA==
X-Change-ID: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=axHqb1mN2GhgTYXeefA9dpqaSA3EzsSJmCI3ycQRWeU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqWJrUWmuG08l5FtqV+oL/3ypCP1T2ieZTx3ysP
 iraP1uKnHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalia1AAKCRAbX0TJAJUV
 VgaOEAC/2hWPPtlDjkmeK8+fEFGq1z6CCgxzaH3gx1Gh/OvV1H86eZtWQAWRaWwkuJvmh4qEbuw
 f9KmqpJJW3eLR7DRUE3XF+c3QMscMvChO4Vv7VaaxOxKvKXYVB2WQBZFBa5y0khyGhp3BzF4EqB
 mrjAHObbSbSlvLHWyb/Cv3yvBBMc30UcmabGA5rx5zHYUSKmJSrGdjt9mp3i8uTf4MeNarf2USq
 LYP0IHfFi86pNMtWkntCdjagVHmwzaLIQE4W1APSQe7MozZ2mx0HNn3J8br+pOkyGZEn/riVcvq
 mwaqYyOS6M2Wfo1UryD4IthUKDtgIJV5YscBFkdsQebgTnNJXMatWlphbrsbzJa7dVTZXQPbR4b
 JDeVfxQ9/6hpZNFMvFwhmHe/Ng5Qvlwb0nSH8JOyLYlhaLNJZjms0mfzaNKNiweyChBRwAE2EXp
 1lCQFTy3o8mw90ZEzwSiqhQsN7R4CVXZRpkVrBUhk22RTv2aONdtvAFdeGgg3shyPxDfIGkvMVw
 56eX9UryVZACpC9KggWGDvPCsvVH2D1tdxD3VP+7TaBjLM+jq3EWGAyH9Aa+Vrqb42KsCJ2AaHj
 FUMwzsp8yx6mi1+cM7qjtSj4OvTkaRmX64PlRQTEPYR9RnlJsKmT9Q9z9oDlQpdJ//ed1tUDq06
 8DTI4xS+bLFNtjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX3iKc2bHvA9ue
 EtjWCuSNoT4NJBBTD4lj7NjNXwiF08RzL9bgat8m2D9cCnICN/KA9tVpgupEb9RTwzSoZBYkh+M
 fkYlqpUYGXPJv+KVuP4o5btPS2ozejg=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a589adc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BsmgAWSu4p_AeSiVXQUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX/opAQKVm7llj
 VeRz/mjM3yCJob8MYUjR/OPacnfhRfEpuF1unzxRQubBMyFJewQvCmCWx1ixPQaHrMOXoGVSlDI
 Ha7xQbf3HzkThmMFIEL9wZthNgWDPCgBWaE6iAsLqcfI+8PmgYvIlJf13n4z6FiN9MAuU3aK7CF
 e6y0ojWnUshAOtCaxIMjUqo6LNdC7/w22RKmfXD6FkQSPejlP9NJZchoogJyNDTYThVbmXdTdDz
 xhwRRIStagjR5MIxTBLJjo/x3yXK23PB30N5U/rMj+Pm7Oxfir5i7UnAXVq5t/Zvk4mR67iqDvR
 hJ4pRX/xL7YRhsDDMoEiJNPE01zvu7100QPanYfmhKS2ZNuMpkVlAmLkluY0O71R/VscGTerjo9
 BOv97ym29d/beg0MX6cUkWzgakPTziC7lA5OICOuYbUkblJyzhMFj2bzQl+qzbFhTuOiH/Pphta
 fpryyq1XTeHb+jweRag==
X-Proofpoint-ORIG-GUID: _gAesg1o4Qlu604-xfPCMM9yqN-7L8si
X-Proofpoint-GUID: _gAesg1o4Qlu604-xfPCMM9yqN-7L8si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160090

Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
one USB controller and a single set of PHYs, which are connected to
the port marked as JUSB.

Also, the EVK comes with an SD card slot.

So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
supplies and enable the USB controller.

Also enable the second SD host controller, describe the card detect GPIO
and the board specific supplies.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260715.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..2fc945658300 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,70 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart13 {
@@ -18,3 +82,31 @@ &uart13 {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

