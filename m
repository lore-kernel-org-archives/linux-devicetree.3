Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956904;
	b=kOObKDr/RbT72NJzoQcb0jd3wtiEpZhEn7A6ROYfAfozM3Vg+/6lxK24xXTExwZ2LQDI
	 bJRzetVypAq1YZdGX+s3QTYjHE72/xxAgWTQ8yrVSP6RVW1v41tVRCSi8D0H6rId9bvDi
	 19Um8TSICvZaHheRj2lW5pXQqtfqia1D8k0BC0WK25IWLb8zDU7uo+zmmrIOU/7ClLQIP
	 P2oI1sZaPmR7sQDyjlvWCmZvDgC/AhpvqApGnmyTIh3xJvtUMc3BZmewlXAItxxd1Lqzs
	 S2cGCUpXprQUy2IR26YHesw4dIt9IFN7YrD7lECRFIQnFcWDO2DsChWUmC/w5uyVsrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
	b=y6l27WOWWDj7SKZtuqevKy0c3S7GmXuOZKl0YPiQcQ81hWYVT/uPN0y/QgR87CDPHScy
	 3U1foJIMIzvJh47htBOdJpf1yQKiSNsk5o8JjHUnLCaIJyOBQc8kq/KznH+qBuhUIIYGN
	 W4gT0VklT+QCABntTr7y7ugLf3xUVMAya4R8IMs2MsXL0K3G4TyUKWLRa0lEIE2uQvD1u
	 tephnNcLHxkJyFMcdw1GX6jFpostWh9hRQKGk90SRSI+OH8H+bMeWXmXZ6bPN5Pqh2WHt
	 N4tZ+qCHIl3NH8ozFc6vbf0ivpmIwVRIePJ+dxN85XkfMunOrXv1MKP8kfXFytj/oYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dQrslJm/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72085606D80E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72085606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQrslJm/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RBFm045292
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=; b=KBUCcxMr5OIIdkyL
	/+gwZfiQPxczSmrKTVYd4jUbWYwCac5YWycGO4cvjD+PuLQ19Atkn1xOi6pOuPG3
	6mgJKf3ZWejknQ6JOgiHqDurVEqE/WxzYORaEBS1B93o+ArbJkn0uxtumzJlXJEl
	8qLdHU6NCBWtdV4zs2B1z2qHbGBk9klVVbCkiP36J4TIT9wGV6uRNySYd0kvQYYb
	SnB7E9pFzSSno6osfRgg0ejhvTOrGKq2k9MFlB4xroB5kKYuEIRSM7EBmHGxEe5C
	WIhzLvOCHQ5jesi7BVEvlfWD3LwM0zfe4Aa2OZGKweSi93bqsxdd6KnFAVoX1IYI
	2kAaGQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t45w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so856687eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956903; x=1794561703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=dQrslJm/IfQRtFCCrngErIp+B+jB1LwBTFSS12mQMeoPPf1bHXEr3Z/eq1OtuCklAB
         O15Pq+ZjamokzU/H++IhxFZw9EcMZsxGrffBpDO5f3AdoQINSXmssYwxnR2pA7S7XWRT
         P1ZMx987OT3V8wGD0hOOt4rKWQTAiS8yBXzzs/gXNHV7ZQET+B85wiiIK/b0fvC8uBOc
         FhhtYURmnJcj/Y74wamUJ5YLADV+GDVbl26bUk4o7OZO/OvsrmNcFW0aGLiAh1tdi52E
         /6iVaN0Mqb5QirsqWHr89S+yhtW5OqnBxi+zrVS6ovGh6CohOE4Nw1sdeyEMWkSOuxcB
         zCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956903; x=1794561703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=TMn/e4NkuGxH1bhKNAD3t+G2CpbqrLv66zTxksg8H0R4JVFk2cduLS6xCaesWfHZ14
         gnwoJR+RqiItRN16WWR45bTDQwubUVnslWUb9eIALyLqXVXZgt7jiiUDQEV31gERRznj
         1w35j0cBsCIMp8eJJdQ/n9WqYUZpUcHw1z/gABwstnwXkQMDwVlwbsdko7ua6+lii1WT
         5xFoeUSVckMAWW5bw7lZJ3disV0QUSOW22KoioCFxtgj9GpEDx4S5qUv4qbvNQ65ZpUR
         e4c8AHu+kc8mHASihWiMbHvUgMcb22clcriuc8qN9ao4OkTOQIXZq4Gp+KeTNmYcWsoA
         /yJQ==
X-Forwarded-Encrypted: i=1; AKwUvByDn1tkRwk/1PhEr+n86ukhKTkAVvrDWj8y+wh0Nyul3GV5bvU97BPow8+enKbWmM49Qz/pFImUOpIl@vger.kernel.org
X-Gm-Message-State: APuU4Z9b6ord3qV0dza/wBn/y75IZJulyI5F7dAGeSXUY31sk8qkbf83
	VlI6+WOXI3XhyI77notFGj1Yd6LHvjGSmqY3OAgaKMRiAK31UXJmsf37hrb+bPC56WdjjPYGO0y
	u06kKHJUPiVm/uKZr2Gt06gWIScQ7cWRwSIaeYFMSLkps4wQSdQ7059CH7RswhtQj
X-Gm-Gg: AYBFou1mGX6HrS1urS+4EAk8S7wWFKEqpc9SBiUWyy/Fh7H+dJJRutw/Yfokeu1sben
	Thbch11jOYGMCB0TBtQUeIrPecfzpprXcJeyyz9s0yuEpu19wbW5+7xLYrsHJgoJyfhGxpMex+j
	ZO63n86sgMelf6rs6K0WvCb/1k9Xm7LN+raX5dTT6VxeHPm31eyAThIRCnlxrOPIpt0v/NDeMj+
	BZgcOOMjFQYCBUpV5FvdpIeHgJIM9AO5IsPPFTftWgRwXotl8SlxgnxpjvO8mDB0qBB+P/HwpdF
	r/v+kGaAvHEsZsoBx2mnIOi6hej6h9Ie79wJzVo6B2oTB+kfhN8vzUtnefm050B/68fV8R8Vzmq
	AugGi77biKKtAg0k78zaTkqMhIlJ8t66AzELGyYVUH4glvww+MR+q17FQlNK/PBAbUy4DEwnhYW
	hB9e8Ro4AloN+RHt7dSLhtYg14WLTeeft+73FUR6J5jGUTzVcelWXS82xpY0Asn4zJx2LaO1Svp
	Jb49g==
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490545eec.20.1793956902819;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490514eec.20.1793956902256;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:41 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:57 +0530
Subject: [PATCH v8 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261106-08-dts-v8-8-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxexJRtNB6nhr
 s4VAWkWmFx3ybr1CRw5kKVNzSk9RNZhxc4DEtybj91k8b7sj4EFPYvU+pvG2eq9zjb99KIpUuNe
 gLE6/j6nslO7yeWARMC3MJqgAJAU7Lg=
X-Proofpoint-GUID: g75Tg2bY05f3zcy7nbU-uWRUWnacUIFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX4ECkznoNS6Pp
 6RiBXwp36IxvaNP6BMrEB9mBR1l8ivtqQ6uxKUEW4hWkXBIKZQV2NioeXZvqtC2fFx5Jd9Lbcuv
 +7pwKsqzIpyYqPd6bGgAV9kb5GhVLMiDo+l8zmUT5ycogiEJ4MW2w07jiO3BT1Fek6zXrYOHLXh
 eSTZA/Kzxy2llV/X9y0oJGxo2R/eVr051ALUz4kTPDgo8qC/8SzR7nz0gQARlAgsYUtr38VGcxI
 VAmGT+vkTTQJ5wmKmN1ADfPYTcGaW2DpI/NPcmjmwddQQ/F0AjrnxuAVn+36b/SJSwzhTWHz3nl
 pMG3zenTomp0zBnI7tx/VH6rf14vAvkoH9/VAHLlcMLPTGlLlkOYX6/jVpGA45QEdqNMwvSVkE4
 VeCwSkErOjgqGqFwotKdAAKQE2OXAgwfIOluFfHi7BiaBh/0Wckhg07QXZL0YvTUQYZYlN9Fe33
 cF9czhhzuEZEOC7UKuw==
X-Proofpoint-ORIG-GUID: g75Tg2bY05f3zcy7nbU-uWRUWnacUIFS
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed9c27 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 422e2766478a..b32daa7c1559 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,11 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+};
+
 &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
@@ -156,6 +161,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index de3504395c48..e4a696a65e55 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -406,6 +406,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "okay";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

