Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E563FA5F0
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965791; cv=none; b=rZ1gECbfclYeN3DAAkwH+SPLYlDvyN85n/tQnv03F+gykpXEJhQlNvHvsTTgXXS185KWu7gaOFVKjzFmwPQBxkwu2Fz3R8hMClrTABjXQ8FaaxB1meVG8voYhfdYtaGgarjXr0cL7mvlX4TbUGCo3jb5HeGYX8nQHA+6QNdG44s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965791; c=relaxed/simple;
	bh=fdkzbqqWSqAqRWw7zg2qcBzkgVtLUE144t0b3+wpNxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uD4V3CcS4LbPQ3QqpMkcv+P+9COOPeaPoRYpujmyofRitlgxBs/JzZfPFotwUevC3KNbtVKXjTBKvgE/EhCCH4X6mcLh6wxNVmzjUcCNTFmjgSUf2Q644wdWkW6omzQfywrSi6EG6C8P9w06YEjMFc+jUQC87IkvRGIu0kgouT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrPbTj3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGr4Op52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrPbTj3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGr4Op52"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvMib1305669
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=; b=XrPbTj3ZCmOFmoCZ
	NKvPhqZ4LHy2ck8qOF/JFf4I6nzw63VPYiF8+d3cy9Iglgw+uccLebNr3zjDGCCh
	gHA/0P3AnTPnE21WE817j6Q3lqYSFijW+n8DpioKQyCfimxoBPvO31l57hJBxUsc
	bZRNKey5aEBg4r1bUc8NMC/BmLmfhQhJdjPBtWBZ7ouYG8+gJiOsin0tHocRZOEU
	k3ytO5+B6PKopQgszbZwbIGIo1v+pjDemBZtJ7igjQkDTfXR+cp+gpQN6PaMPM5V
	0nFy2HnxXAwtPNYa6XTsPFVg+jw06KbH5f4aBZb6a0wSdmCrKXPVsnH8rEjTtGOP
	GVemhw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8d2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:03:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953b15c76fdso776262241.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965782; x=1775570582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=;
        b=kGr4Op52wCsxfexn2bhjUmVrmPdR51hKZHm7JN2Bbc/MvlrpUN1f3YtG0GQPlHznfk
         TgNewNwsDLXC+peluLGXw4KQRM7y7CyZ6eYSsuMYkBMnpztUV+n3b5DjSXB+tXTgoKwg
         QQVLq1QrNvhMfOM3kndrenCzvJioG+0Wj7zVCdRfjo0HSbYn8K0FcBtNwoWLggJvwqbX
         0D6Pa4yESCqpvB0bZK69Dac1seh372jqfnToBN8zStJBhDt8g+WguRJSvRh5YeuT2A8+
         hmH1E0U1F8H55P7qvGV90zedcJq6Grwpp8lTE3KAmZ6J6HHdv+QhhanqTi3Id7yUqNl6
         ojfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965782; x=1775570582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/EPQc5af+39QtFkyXAVfTMa4eGUdvB3ATryq/oyXf2c=;
        b=Z9PZ78xUAMdKLd7GYeceEQyym/kxuIRTrHQgt/RMvz1GrEX6UHQ7NDg5rS4g25CP5u
         wJWFNNIxEw12NSput4IKrWHYp08bxRGIIGKvuvjDy9WzSuOyi9bXkqC6zHGQwVIgYXbQ
         xIPkVG3HpSm9ovojvDKajVPc0Q8zYfiEWLyyJlrh/DqcW7rc3p6YsGNtpPSdo4kPoMxh
         E9oQT0GyxG4N+b+lvYuUdSSijezAMOy3Z9p87Z1vM8TTz53QxoEGbryvjw4v3ZK1j0/i
         KU1SDUBSWpn0gWEWVp+o2rgmYwn02PelWZ4dHeMehUMLR+YGmPpkgXawevCbW617KIH5
         k5/g==
X-Forwarded-Encrypted: i=1; AJvYcCWIDe3gwELgI6KrmRHlWZTgR8cH9dVedOHRg/M7UZkaNNU7bX9y3a8XyL7r8FPNa0Nf/eiN5A8/ZYnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2j5XGAu0Mc2MZVNfpngFOBj6U36Yw6oEeZn39n5nTOeTH3Zno
	H+QvYNt1/J7Q/XoPRfHF3bB0Irk/bjz76mBYqNg1FArO2eVVSzX8oQH22ds6NkI09GGcizuf2bm
	Av/N5gqtu5H6XNn/jw/PlgbSpgHfAjJzaS7PpVMhMSNPurYFevmfuDJPOZtrqNaoF
X-Gm-Gg: ATEYQzy5ZJXbEsZOClTIWAU7gmndX59CLli4hgloOa4TvbL7yW7k23YxXbruBTYDc1b
	e641O7b9xD6crYJEiLYuRulXy7o46hxV6PB2VALjGVXCiybEzu2zmQJKpdFQBe8KK9UcnFg/OP7
	V18dbxTj3cGwaSWOvSjjV2cZSQgMnIqF1JuKJKNqCDcWhTehe/1TMoMKA7pKVBik4NesdGbE+U0
	qI3lfPEpQvX9HrjfxRjsOsOKVdNXaVqf+DKkctACbPEKTngn1bJXSve2lKcUwSvYiqfegZ/ArQh
	cuPP7+y8vi/1t1Uyhego8JFH2wf/KwDcKCbgPm49wIrzoixzqwl3Ug/5CPe01h0duMdJE3Vefs5
	lrV2rKtrmycGlIEmK80qFYqWUCA98xM7Ezbnew+AC6y5w
X-Received: by 2002:a05:6102:3f03:b0:604:d2c4:98e5 with SMTP id ada2fe7eead31-604f927d729mr5475013137.21.1774965782006;
        Tue, 31 Mar 2026 07:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3f03:b0:604:d2c4:98e5 with SMTP id ada2fe7eead31-604f927d729mr5474956137.21.1774965781494;
        Tue, 31 Mar 2026 07:03:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm36610895e9.13.2026.03.31.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:02:50 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fdkzbqqWSqAqRWw7zg2qcBzkgVtLUE144t0b3+wpNxQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy9QOQlKgtHkQDP+Lv6P1H5as78dgMfFl6DVUi
 tLTeI7JmeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacvUDgAKCRDBN2bmhouD
 1+PjEACBlyEQwvNmUCOtTqZZwkps131Yi7PmSy/4XvwRYvLbezSNdnAftovvcsgvo6fks1/NRuR
 BDKOumGDYWxLs8h4Bt9DQlHs48LamLQBpnENi3jarDBy/UIfDay/fBk4BwO78n2B6G2gmn+OZ9b
 00JabOFCHF/mn7/GARqcqBqd08r/wYaat7e3Y5tyQnFVB2UqItYnaM0htzUMofEdzaUcZRVQ+mF
 yoYONYynPImHXaf5j5nMnaPaxKgccLHP40/8n+8evRZpW4uzB6z6is0EkOdpX2aDgaCRHeqjo58
 ecby7Ln7ehgdlxZc45+WZMnbVzojAAAP/5OaYz3ndGNKWa4NdGu3KY2k65IUlcRu+xX9BOZJ6Pf
 nMHom/64w8Xr68ZxhNdH65J9uC6jGNKYuJZo6I/pbGeYL5OXCOPltFgy6FIq5q/ze9dbbB4U9ll
 7czrx8NS/DLKqEEcVVPlWn6lqWFwZi+se6uGCM3xIaEKAcSpk2/POdVUp6fgW+vf76vK+HHr+Aw
 q6Ypmh4GZoXpJxAXOAYkFBGWNVIhir1cj2W08EGFPWnVQqeda00pOSgVUfgqYVm8njTALCxX7tX
 TIipyydVP/CZ1QQzMhLb0I4irIlSANiuXioztZw1U5Om2shIGg1XrjF9Dtumc7ULbzVbB45Eazq
 XvwrSGXLYzb3XEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbd417 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WClv4a58_bZJ7CJg0cMA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfX6S/O5nbwAnMl
 lRW+6SYaLd4lRRI4B3PQP+Jf1c2VvOyMXIOhhXs5FD8dZRFqjkHfqsjVJtt5X299SPFSZr7A3J1
 PDKA5d3MNVAdugZXUlIkb5XRBA2LCWBm3VbO8/rUf5r3bXT1jlo8XtwqK88zT78JI8POWaaPU5h
 t7ZRkDHj6OlnYZExbVFMxnlmesdjnPAA4gLVHY5R5De4xCsjmm9qN/KWHb/vxQRBaaKaB2CSOuW
 MG0Hgd0ekMkFI30PbWt81vid/iOO6oeuSEPpUSCpqv07P4qDuAfeW8to/vRjYP+IH49hdCyowHJ
 mpS4olMTJNa3VwomjYyeId4TBzqje0S1CMiZzl2GY2j1WJnD7go9H5j5JnUpU0dDkvO5E0xF3K4
 dKHlxjyVp7jb31Hvxf4+4Ttqhyllcg==
X-Proofpoint-GUID: ORkm-p3iNEr96k6CugEsAW1b6_Kvlc5j
X-Proofpoint-ORIG-GUID: ORkm-p3iNEr96k6CugEsAW1b6_Kvlc5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603310136

Enable display on Eliza MTP board with Visionox VTDR6130 panel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index c31f00e36eee..df0cfffcef61 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,48 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vdd-supply = <&vreg_l1g>;
+		vddio-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;
@@ -433,6 +475,27 @@ &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
 			       <118 1>;  /* NFC Secure I/O */
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {

-- 
2.51.0

