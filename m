Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E0D443AA7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789825; cv=none; b=kzJs+7kwDYVH4CfitiZt8dRNPKygvxx1eCqZ+u51EaR9ZVy2rEww23twIWfvCa07kNnN8UafxdFYPA3jebBSjxbhCzaT5R41TCNR+YAtLZUYVML1W87UY0Q88+dPUJN0DHsFKiVyu5oeod8dgt5il2qCGv8TcxSEN6XW9q00420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789825; c=relaxed/simple;
	bh=Fq6zNQXup7fVL9hxWN3AiqpOkiSjGOTDUA8QYPdXEZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vk6/YsjJfhHGlXMxXGgwYolsYfiQ0dS0hi+c2GJYVzUVSIciBxU/Y3AxDfqNed+beK+pS82liUpV38HWGX/99bEYhs8mbUQpKvbiJJs9j5NrhIatepHH/7GNQolchAct75u4D+8o3tZIbfS10JadQZtYLJw621SjMsPYjf7zkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvPuFMqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ann/ZaCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvPuFMqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ann/ZaCm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55xgI1857639
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=; b=jvPuFMqMEiSjo4gN
	77u7mxFb0NS3qYdLErE6QSXHtG3WZrl2u4nd/6VaKN2a7BCV1NTwMeuG2uJNpjSY
	0TUhnO1mFtodirtGxpFWEiJ0DizbWcAVIFncvAcEq6Smy8eazxIVI3cH7H2Ej2Zk
	2LGnUj5hw6Njw/87I7j43DXHAUGQFeuVLegzmKwdME3hBxbs/FF27BbNKb01rPU4
	5Jq3qS3Lqn3M4i8Hi1qOT0apQcEaMe1oClRuP1h7P8ESV77XOkv0K0BLlnqouCAW
	tw3jCWQgav4EQaJoDM9NuXc10Z1zDOPv2C87ucw1fA3b3sYKXmCHROzQ3lsQf1Mz
	qGxlRA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnf9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so2264077c88.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789821; x=1792394621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=Ann/ZaCmUTjIjP8WTK8qdFbN35doWdYK/l31cWFwfpuGsDabCv7wmmB/rRDM0EXgos
         jmEjalXnYG5QiBO+2wbEljPkLAO2KC3KJZcflYA9ByPNXbeTfIm/fweHOML40pQRPE/C
         ESHBuzUqOkkT7DWFPd5NIzVl0ZjI0sIcpZtIlUNy3ei06t5NMy9ZOtLq8WeROBlTBbJW
         KWNjLcSqaIKvw/HRSuegcz73qrEjfJfZkXT2uflu5AuUpKuakMFod7tVolFCV07KY7+7
         BXju6O8wxjS4D/93iwZMeFEw2j4Z64SFxakyUONbMd3FEBCG6dmMH+MlUBKQn7I6YoCN
         OIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789821; x=1792394621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=f6hnWc8fpMy/ZmXGB8MOYvJRuTaQD0NBftCHR39EXMgmVBozZa877QhgoCF5OpQt5U
         v4gf4h92RyJCsUhKG+uszIOfbhVgt9acE/Qus6JJk5KRKU0KufNXxXUTMnVSSEeHHrVF
         2/ISh4PIjOtKoaB8Sf5t95wvkjmEa2y/dIwUjntuYmrCC+d2iCKu6sW7uSlc6Im7OmSL
         rV4kcOIzLzrxK/LfHhzsdmi95g6b7gL1Dwacban6cUQFkOJar8Vj3HR7FbdhAd/m/Wg4
         cZu71o0fpFajp0k+3bfMZCzU/3/gyki+sAM2/d6USftWUSnutLwswtFvhbTi3Muy7jXi
         BEJA==
X-Forwarded-Encrypted: i=1; AKwUvBzDH/Lr7RBkLyNsyWEGCvzO8a8h/vPp0k/n4vfov8Iq+tgM/JYpvtQAWyEzgpXLYd73PN6whovlLGbD@vger.kernel.org
X-Gm-Message-State: AFq9FYLprR0y2wJEgIwJAQ3FCFd4WlZ46xelkw9rgUFR7OgrYNVzXXeo
	m8Clkd6xvOP25K71Z3VvHli4XekAicen4BjNLwNObA8sLL2I70l4dFBomSN5tXNv43qYPypS6me
	Db+ilQuYb2K7S0zHfC0fGzfONZh1rMJA9gSzVbtw56EosW7ZNVeZ/3nqJy63EAyb0
X-Gm-Gg: AYBFou1DMusYLAcVkV9yDO+ETrVyVhC+k2iowrk3iNs82XMGt+VAG7EquoPDLeWd8sj
	xhByYAGLjF8K7NJA8goKi0bzqdp4UXgrsCEWxDFl9xsKH50tfpO1d35j6rSrhvtJyNP67ny+zJp
	qeWHLjJV55Iw6wuT88P3lM2pgqSd6sM9piBikZUs6P15dzBgqNotlo/9ye5etH1UGBxbmPoJHUN
	2yfy1DWV7mPAQx/HDo+29hH4GOsGKf79YYFNaPNXU+a0h7f/IPeFHKUfp0bfJ9y5eOpzY5wHXX+
	upMbmoFMVGwmiak8uTnhMdwvOgU9woJP8CCM+qLBD1BLaVcvp/BQJ2YFscmJVpE1a6V7+Mwa4tT
	zx2IwiheZ5pHs/heRg+KzDBwJIh5eOMsJBrJxse8za8KiV8xOTaykH1HFgUAm8oPJ37LxoZZ1TU
	ScXNvHsSFGstwlj2S2AKywtawfM2gY
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939888c88.28.1791789820849;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939867c88.28.1791789820348;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:08 +0530
Subject: [PATCH v7 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 2TosWYisAIWSobynXlBvXefvi4kNPp6L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX6+Cq+IGf4lnh
 bNy9K98PBPIERQ1/cau2pikc34bVM0Xks9AnhPNd067kdd/RJrItPoMB9SflD52/lkxXvodS+lY
 cqhrngOPDhio2mmIPdpUfd7CXFZtkfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3DUOzZMc1XUA
 RlhEUmzVeKVd5Nb7/XT97OdiTIrmH8mWP887VaY8DjS605/6g0T1tMAWA39vn6ywYAYc9ZAEajs
 JRtBP2Ox8eqd32ZBuTBENV2FGaaAHPhjqGdAiiT2tKKQZJx0BNOy78rNEJjLJKtNkHlg/K0RoNO
 W+j2kL1y+wShu7T7kezItyL8J4Y/dcKidHgP6Y+NEHgfAONx6I5CHErqyXb0nY+0fGTPFAFlq6C
 XdnyIOGJKu7wuPrO3MfMsvW4KNPoryxQ91QCk9Z4vIvJE3F3y2iu2vLh0lXNdUErELg+xyIG0Tb
 ceLtXbwalK5wIR3YpM54192eGU+O9K0jkJnsCoBR/k4GWIHicJdxRJS/qu6kPGtJlYj1RpA497D
 PVgwN/iW6XaKPkD3xsVJJ+9pU0+WvhyJvYHZhmL1ImYgSl3/fz5YsTWkpeQUgjptS+DxWPxZ+WP
 Z724GjS/Mz5B8vifg1w==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc8afd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 2TosWYisAIWSobynXlBvXefvi4kNPp6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 7f90a2632b07..0f7a8f2d886b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,13 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "okay";
 };
@@ -160,6 +167,13 @@ pcie0_default_state: pcie0-default-state {
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
index 910196a23ca7..22ab99ca0903 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

