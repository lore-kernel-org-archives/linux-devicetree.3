Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4E3D75C4
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779163; cv=none; b=kqTisazIT1i2HEhlk2bt8YJtS6W51WvAejPumxrJwleZWSapjkJRGW5qzl+g1qy41Ufl2ws0UCy0evgw0W6gb/FLDFFFmFmmHGNYUajBmNtrrXfKd0y4QZnH1pQUTbdGr+mZu83adh88AZvvUb8Ge7DDqs15hCLhuLaKosXIMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779163; c=relaxed/simple;
	bh=mtVJ0HzKUDhK+8r1fEuCK2cHsepYwC1s8XJGYUhNDLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuUVKfltFCvzPHAIdo5qEZ1qDpxF43nb5GpTBx8sSVV3g7z7bWAXck1Qef360Cu+m7OMF4FiqXZDSjXtoHvjqH7ltu9my78/ko4AuA3xQOIfFPgoBHZNkKx0DcSohU5XEmItwHVTH+iwlIOnk83F/eqqfNaldgakb6BFpcm7Tok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9OVaH5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkwicpxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9OVaH5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkwicpxJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9no7u046130
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=; b=C9OVaH5NzGpR57nL
	6eSVPPuwYoJaKj88ZBkMzIk6nXIbPalrZKTxdW/OrygN/ArtuukB8a3c6YzuEB3K
	BbNHn0yjSbsAH8kwcQvWvZf+Yqw9efH1M0nZllMPwDZLxaBNJ8Y7Oqe6ehpCCISG
	DQsc8xK6tkUsjS9rd9PeQAwHUFscvD0fjrwW5aypCEioDwov6hSaXG8vrUHtxozj
	RwBuH0DEdzPTycy7fwZ68Qu2JE7jYgIMl1tRg4g5eDyQG5eXMly7+YfrRBlfgvwg
	4Xs9P5RNtR/hNETcOu1tEtECCRh/2IUHmGf5ESNZ6D4cg5sakQBZlCNQ2CYqmLFL
	dFZyaw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1t751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:45:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9568707f486so1582349241.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776779154; x=1777383954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=;
        b=IkwicpxJRkYt2sAPldq5UPjNtgkOTOP3xJ8CnJwraPXT0bkmgmB7KV4grsMhjZSRl5
         MoearMlSjqUPb2CB0/SwoGXC0E26nkUw022/xR+VFqsL+oqtIdlwXsw6IJYXfSKJ17rv
         wQuR3osRWTPbuX7swiwQWFXLQRlnkdC0FchuViHjs5h4Y7jlnOGXVLEfXxJA0sYRjJjU
         CWUsZDopcTdHrOv5iEy9qutekOhYYm2pxsxzQN2T0Nj2i2dgvEd96OCyq0JymZ975zZt
         OYH75xFYzK/yXz+VCpWg2a+8+mb/Objxs5FxxPx9QVMxoSKepmGuQkmEtsVFVJEd9E0s
         YD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779154; x=1777383954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=;
        b=jcs0oFy8Zl0+NZj51S1v3khOJ/ce3GpLBuUZ4nE/1aIdeOWKt2y7rlBvRtIE39/rx+
         bXDrtt7m6mjrQBqBv+qUUWoYVL9lZM6gtU07xdFwRx1fpbuIyd29im8+eB9VSlB/6BPF
         lMJ7AUkyX1AkbtkgeQjhotAmmVAKcuO1r8bUzKJXdc70y/6nPSxD5XHsJmv/i9cFFNuh
         PNnGgTcA4G6xa4FQoel/3W6JZ3miZYLcYihZXCOAyo1ISF68lNAGkq0wMrBDoAiAwvD4
         DnNZCEm4b0BYvszKiPZYvIKb3oDjm0DQViPmu6YUjjV8Jr+pBvLCbkYhefKSe4unKQQl
         zGHg==
X-Forwarded-Encrypted: i=1; AFNElJ8KiJKBEO8EBw90hT5ckOyL/zH1FkFefH3vfN4jlfWNmnkm0AYnaznYgwx1dzjWv986cbUCYIJAHyxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZmzpAXbdfdvacgizpcrbbjdGg8aqEpf+aG/1ZYmEgxfDNXAi
	bOP8GZi/Mc5lBt4JQWMzzmTjhjilNDajuFZNDD2OyVDDwuHEW5/rLqTR97DDsyPuj2b9aXz2KY8
	zFAjFM4mTu9n2tcsQz3x/2s8se0lTMWXddoxh53CkjMpBRcJxNdqpPf8/Lkp6y0/W
X-Gm-Gg: AeBDievxe5mSW/3aqk9QQnUbX3DtNsj8sdR3pZjESygPNPCdd+tyGO29M9hYGWE7fxT
	jdgU/F4ESXFyN+h1dvzrrR4B4OqOs6E4KtSjm6LzjZ7DYOoa3HSQJa2R9kUkbzaImSFG0+bl3A6
	O7RyaV9IPDj+iu68IMl3QVDLPsyjUlBDABtjH52jBtYtmVeQpzhUZRzSb5Rmm09YtiZ4JdDTd/7
	0kuspXpDk6Q8gS5Sa3ogpn9L0w2eYVuzPlYDyn8r3QHx1E+bz7sYWgGTOZ5eFHBwfLq10jxLq77
	sJLKP9YO9agTdPio5a6aMfWJ3RTr57Mx9lZgbuTxq0VreO1xMO+iUh4sESDFGnF8wFYyd1hvW5A
	CTsSHSRiq9eMAKusmTxT9XJCKkIvG3cFuFPla868hK1RPNr5K0O4s4Dw=
X-Received: by 2002:a05:6102:160d:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-616f4538251mr9162231137.5.1776779153863;
        Tue, 21 Apr 2026 06:45:53 -0700 (PDT)
X-Received: by 2002:a05:6102:160d:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-616f4538251mr9162192137.5.1776779153294;
        Tue, 21 Apr 2026 06:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm34508647f8f.5.2026.04.21.06.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:45:29 +0200
Subject: [PATCH RFC v2 2/3] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2096;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtVJ0HzKUDhK+8r1fEuCK2cHsepYwC1s8XJGYUhNDLY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp53+J8Dm3G7QPAu9quIwoOzKQdreh8YYs4QHAS
 QMUebakB3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaed/iQAKCRDBN2bmhouD
 19O/D/9Ts/JJY4RI5YIRqc2+cfsFwkj2tfD3/WzOxy9f0qLvjl/WAJTWfxQ3iuJGozkF7dWRrk7
 72ON8WWCB73/DaqolIBN0GdgaPYSG5DF4EM9fxGRtQ7i7l6w81h6GctlMLpZsv9dbKJQSyDG0LK
 D0utW3cHgMxn065jvpTC3L3kiMAdfQmspZVvUzvXVBQoIvsoSppiHB+tr4z9kJIYB9lYVMZa4fq
 tnrD2/AKe01cbTL+QY6HEAGIxHmDbdaCTcjBF6+N1Y0us9DJ7yiwx079HyOoktR4YoPlTBIkacy
 kT2GwyDYu2/8Wx1ypB3w/aKxLYL9qtuAOGXBI3WLStG+AC5cC5dSWQZ2prFrtUO3f+VxaTGqJTe
 Sk1ikbBwurYVkle7ZIx36B2NF6JMIB9yU1lDoZlypaYf3U4+/eRMVNmnsYL1ZobCqjjP9EDVQmR
 kWsm89t292u0AJoeMvGmPORmDZs1T9ry6YqcfVqoBS3i/9h2zrwRsFNmak5I+hAlSdiUcMm0CeV
 5tfRBUWFq31+ByGFcDJspa6pIfGe4UiCE8C7ocOsTrcd66p6859Z9FJb8IQQ0oubWlgOWLld93x
 zG9T4GEfz9JPjDvN2PQi2KTzu3hLKetW3Uqr60WUUKquCcG3yXaD3wxc+CisrRdYY5yl0gg2Ljn
 kc4O7UvkNZMlXvg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e77f92 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AXhrDi9n0sKHlwrsKv4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNyBTYWx0ZWRfX5ygQ7i+bhIXG
 +/8B4w/vM1vhFdmEJVY0rmzTnnprB2DrT8KkcDwJEZ7FKhe5VcU+9SuiYMleiVgdRJS2E/EqvGC
 TPgC0LxyClmT1+YuuP41PV+cPa9dAyILohvMdbtNINFFCs6yAj06qo2WIqCuqzrBYJbxqZ1Wu0w
 MOnst7GXnM1/5VG9istr5EKCzTwMV6+wiP+dtgFGHtZns4rDpThdSac36hSmaPlBnMn2JW1aT/b
 qaACa2vrWBSeoWC6vqKJj+npyQ2IPEvHfc4F0CWrHqLE/HE1QgyN/ZLodDown1t4zROooftNr7I
 mypY2qkTrK0jnIxCJNSu1XuUnW8kXtRQ15MMQsIqtB4WikmdIkAfqSnxHxvppnjzwJ/Mfzd06YE
 DkrIT4D0wesAas2jAS6vqlnBv3JnvxQjaYoU7DAFHM4chks+99y5t3gtcfjx/U3blXlFzp8RPGP
 6PNyx5oq1EEljcl5VuA==
X-Proofpoint-ORIG-GUID: UhKp3Ux1uwlMjWBrSiyeMS5_toKNxsPX
X-Proofpoint-GUID: UhKp3Ux1uwlMjWBrSiyeMS5_toKNxsPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210137

Enable display on Eliza MTP board with Visionox VTDR6130 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

