Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25637EFFF
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588835; cv=none; b=YO+50KjGWOhFMNloKm8WSJQkKhACp+mz6qhLshBadXvwxDGgW7Wr9zoUJ1e/i35XmRrtu/o0n+SaRaNEYJJV8p6paFePqC3Q4u9jLSqFNnXlpiqnSJoMAy83l3G8eFTzIHUM46shp1I+d3nAUuZXdnsKzZlnPcVR81gJZZsEuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588835; c=relaxed/simple;
	bh=SYawB/oHyzHo0cUYfJOla16FUwI8AATcR1vypiFsAR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qX6URcRrZWOHQdZn4OlCmELnx/LxCdpiiBnAOinZepicd2vi5RSQJXj+qGLiGFncQ+T2emBCef3i6vs1urI/nvpyKbFHIMfSIuA/Eg9QquGto4B0XBELyk6n4NLdlQ9H7uPEXmHdFFAVFlljd22YkKp+Ku3LExnhEskLpPuJnPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjsQ9jzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpYXHTcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjsQ9jzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpYXHTcA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCLA7b545394
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=; b=GjsQ9jzkhZTzN/nB
	9R5Oci0a/qLJZgX8QVCPapVlvS8uRAycQo9Wi/JdkVsG6N1/gPEKpvHTD+5ixVci
	Kenm2csDnxd2mWgJG2fHjCQ/Axv4/NE/RzAvYp4aISCu+TXeQJJH3yzQNA4+X74m
	/Ztx23vdBul4OyDJdAyfPNO9NntPEf4DmW58wz/W9wRuET9DQmo4W0tBRy4h7MQe
	Je0h/kbbM7gTqUPM2PENtKbgGa0gOQ1IobpQY24yq8Q1PaHpK0AAFJBhntetmm8w
	yFaN+PDnzEECo/BBK7uaGMxr61Z37jKcec0Ck/aMUWr1g5/nK4bMmOczVPKP8Tup
	b2XF5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr0m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90ccab62c33so99067985a.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588825; x=1779193625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=;
        b=dpYXHTcAG//8XUiFOB6f55VhcIPPrWTgqD5PpjbSlOIplZGpN7RSvAEknSjXA9/U6N
         GONCWh8ESheis5PUctYF1thHJd6sCQCR/a/XLd9X1NYFbV7D7leZ3JL2wCdZtwdAlhYM
         fNq9Ey8okqkcLaSU2ISAH3eJeh2YZAsY6NePT6CvemqVLBjvjt/weFht8oWcuW9xiJrI
         /N8cfuJlc2cGdrfqw58iFwMPyYZ6MUr+Yufx9aJXKrcP0pHp4KO6eVqK8leZ+wMuXnOF
         CoTw+wFHGLqMrW/yF1cWN+wuXT0ClCurFs2Exey4menFTeF6uXtVQiUNnUMQgdNIhunB
         izOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588825; x=1779193625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=;
        b=WhHdg+pWgxsDQrbwdYu+qrWG53QgZlq8vnio7W9FPHp43wd6PGjwVcdt2BKfVHRYV7
         M/yI/7scsr+8rv6CmKVA85HoquR+DJGt0LvoEJajrqH1rC0KIvigw1TKQe5TYsteqR5e
         WeFKyNz9+xejc3qDWdbp4YhaJRX1DwEBhSQjJZJSzyFk7/Y3AdFSMHNvPt9u+T2dTQDr
         UsK0i2iGJRIjhPgNLbbfIUd9mJt45zxl2JXj//tKjw44u5y3B7cPLqTtWbtqVunJ3oQr
         xe6U2THI7w171sPz9XvHcDWi5IWypRxcQuP7Yh1js+0/NGE+97KMcHudijRA5EzN0hx7
         hiJA==
X-Forwarded-Encrypted: i=1; AFNElJ8YLGh74xRQI/RbLckEyMgRFafp+l46uqdAQY5CWfhjcxgprSPDrRET0Ip5EexV3uir+pKtbRpWmqwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl9InmVOoYiVIJ5k6/gE5Mg/FNlUaLaV4F/LNk8czR/gP2HCX
	EUT388h04e4az6ojQmNXjBXcSqLEgRB8tuPirIOQxk8YH/QfNsv83L44VHdGiJm6jxSbYOCUjA2
	I/70vsuM0QPVboT2u8WVpubijs4osvBQTEOWieJzyKNLDn+ZB0lg+oSQ+hb27rP1D
X-Gm-Gg: Acq92OH7rl0rhsjqskiAHpEIB97S/LTx1d/EUW9wkNEaRioI4vFQtnzhkWSL5PfT8NX
	dktnUCywBTzr9rrgce4s9/9N73GQNpFXImcyjSpl1mDA++bQTlEyZEnphxJCxEAwH6pKnVMWCuB
	8lYtwXkJNOMQaInQKZSZb3s+XzTNeRb1PIkNffpku/A401wryUObs7dWZvx9aWkMjIUaWreIeOs
	721fpZKd2vYAtyPkAjBu2bmXQnHiAEXoo4uKmxFZ+1MlLekh5FBfIUf12gKdc+7x0y2FbzLRqbr
	Rp6WTpfPa3ePgu7loPF62WMPz1Cx/kyJZqLRewgpxOTojao40lUSz5/ZZKPPl1QizTrMy7gzkho
	ZeNSCZl7P0oreL8yeIuk2vj8EOGKHxg==
X-Received: by 2002:a05:622a:1196:b0:50f:c2d5:3154 with SMTP id d75a77b69052e-51461fc41c3mr357566391cf.42.1778588825129;
        Tue, 12 May 2026 05:27:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:50f:c2d5:3154 with SMTP id d75a77b69052e-51461fc41c3mr357565981cf.42.1778588824503;
        Tue, 12 May 2026 05:27:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:27:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:26:49 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SYawB/oHyzHo0cUYfJOla16FUwI8AATcR1vypiFsAR8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyPPO+uZGWc95tyV15VZTT37p3z26p6g9XJ8
 3m/7PVGlkSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMcjwAKCRAbX0TJAJUV
 VlVtD/oCXYS/2kbD4Z+sctVs9RxzydrLUDtKQvX9HBOATUjp8cFzcQIG7jT/0QwrtkrT3lTrwpQ
 cG2Xn272KlEnf0q+dAPOA6RDbz1Lr2D+OJ7K4KEOp0hB6W08khkDmw7G19cPD6JCI7F/QDZe5KI
 cb2QB4CVA7dZ4j9V6cGLtch3wrkuFNxlLQ7GRf47TDrARvmnktk5k45nHXM/rX5nJ/XMP9bNUOM
 M36FAq+UstAd7ZBBdLbGeaBMvK9B/RJa1GyCwP5e6hIQA00Wr6gW+bSoFd1zWhT4zXFMMX9dAxP
 NdPl3ncnUGF6jghdfJPaQvCVshfy/FeW/o9y7ETpELcFbwG6MWneM8N12VYW/ZxOV09r29uk2MR
 PsA8VSUmBRsjfM5Tjkq/Xg6AOcSqMyDjOZxVWN2uQOx8k0Uc0Z0jy9nFx2XUNQQIuTkMl3cFLEz
 mHMOtiY+JDWLtBid3/CGXNTCPBhbY5mv+lkVvm7hyy8UV/ZNU3ERx+KR4MP88lOzAtKj8vlQAxe
 AOWQkXWjDDdTkVUh8luJbwJkOztLZzqAIcUTbBv5ESNuUr5RZvxRRMRYC2cyFfYwSoRTs110Mm1
 tm8OCkkhSglsbtm4qBzoJmcxol5PCKhHEUfYtE1wcQ7kVG+iGsrBa18Q0/Po5HVLEkIozMAJQPI
 oqQAiF3AeDfUxcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Vf4t1H5A9gG6wbu9_sTRGQnAg82BwkLv
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a031c9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Vf4t1H5A9gG6wbu9_sTRGQnAg82BwkLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfXxlu+UlJCxbF3
 0/lWyaTB1um1rAXsmvlGVSvksnmmgJPpBwdXYlk9YZDCRYoy1K/YsQQLsIYHu4eNMgUuxCRP8pn
 63HFmryn1VVHFU1yogjUmD5op4ZdEKIRGos9vP+cDM+Zae8VDKJUYXxnVDEa9FtPrNZZD7xK4kt
 pv2e3HfUxGyTMZAhlP9Lio6Fo5jFdBPneHsLYdSgVZQjx9vHbg1qrHVa0Xb0apd+J+TXF1GSFqL
 /6ybxvhmw0vire2b855LbpKUGqMWrU5R4x+nuXB6Q1kC22ZqHx7c6W7VvX4S1e4hI8fXbbl0yt6
 M8VlqhDxErJ2Apx17qfOIA+dnqxuTjaBstbKODSyoLnqzLY96hDcJLe9lLI6GYvIBpfHueeWqb6
 sBA3QpRJpR6bG9AhZaL6IJ7E/apl49IiSw/CYiS4gNFFfxjIAuNofRgC3KaDjkL9sfTUWGS4Ptq
 ICbBw+H0pFw5uHXWnOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120129

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..3e41c95edb28 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
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
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,31 @@ &ufs_mem_phy {
 
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

-- 
2.54.0

