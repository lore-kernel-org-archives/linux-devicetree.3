Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520300;
	b=HgDPM0rBbgXQSlJ8pyieu9r8IU6fpdAbXgIQEXCAt0e2cvO3Bh1UjqkVJWC8hfK32feR
	 7CIjdWbONHF75suFm2kqUt1kSSfHMrYDMPzlOv1cc5kJP81AIkG5eTyfwnyVGdqGZdii4
	 SuuWYPuYUBUHDPLwFbcgJEKsH0J3cx21C/qQ+gnGyo/KcLKzoG75NXVK9zlDx1qS/SR1u
	 tNGyWZycrtovCTjXbipcU6QqSR0CHlGVaou6NuOkjr6LmK9HC4Eq6k3ira2sFGaQZHJL+
	 i9q3r3UcsOnhKn8dzwh5VlSGWVkJGnk0jbSVY9zmUK/yZbewUh0umW1S0JuCggTwTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgI5V5B7x+Clu/Ykzpaj9msk33LUceyITfgNYKfdmF0=;
	b=KcRBHz3xT9UWJhAhgzVAWc+1iSBXQDW3ja12Na+FJBzh0RozHccYazjhjCrMR6CWybkH
	 ZibsdRvTsCZA1AeCIQtb/prZAzWouOprAi91GmzQvM4Ccxu/4m9xv+Jz8rQAjA3cnoNF4
	 P/oS3BPs1qN5I36rLcXqKFKtghcif/4EUiQYTSMw+VNmRErkIzzT7r7k9ys3ZJvdB1kdO
	 Bgz7jpBmnjkyejBuJQb2zUrOM+v5PIKK7okXmazsYNDoPy9mj0vorO0WSQ/ZraXEsunq2
	 llYz/+MK6y3TKdb9m86lOUp5E9Z61Rd43EoItwg9vIolsPwIrMgQeq4NlUcwlh4XUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qwh0Y9e9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ur5N8Jtv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76411606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76411606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qwh0Y9e9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ur5N8Jtv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KVVP3830114
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 08:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qgI5V5B7x+C
	lu/Ykzpaj9msk33LUceyITfgNYKfdmF0=; b=Qwh0Y9e9u1+TKHmSKVvDzPf54RZ
	eCgV3SMwwwDM9BNeFp0xdr1q/VIkvSX+GvgAXq2WthQqgm8X/Opnag+SmAkSBPxm
	n//kVRZcjnBSwxeslWuNjnaEJb3V6x1TiRl/EfEWxlkjozs35y8wUsgP/GyxgIMz
	niBDO2ntD0JUrB65BfI6zEV2bfSH5QxIGX11NKqlPNTQQjCfna2m+zx/OTCmxA1Q
	zNs97Fh054A9ugscYvnNxk2WuydDlPVSPk/dfb3i/f/71qCpN3A4FzxNmktMndbr
	Uk2tXJuxJwX+hlYtG079vmpQJNVNjgFYcNel0EjHJM3+z948GKayF/5lXqA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfu2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 08:04:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso10286672eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520297; x=1794125097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgI5V5B7x+Clu/Ykzpaj9msk33LUceyITfgNYKfdmF0=;
        b=Ur5N8JtvpRePQJawRbhIEDfxpxmTdPdjeYRs1KfFBh+9KUsNVE3C9CEVWAcvE3ma79
         OkjQy4HTKMpLcd7MOMyL5eatcB28TqCfcH/BswymH9Y7X6c/Nb+SyStzyGyZwDNVuYUi
         S5Sjx6D7KpWZD7qAaEQmN48FMFV4Rz28HC0iIa5Xt7nK3BCBFK/Rzthqd+M4q7btcRpT
         BU3wxKP1FRYdX2HUjSyeK/m6b9V5ga0SMIbqi3VH8XPXDRLAt1V2Odfubca4SCrT8vMO
         AkXt+QpqD6cDgM2DPdO2zfeDjLHTZJZ12LiAB+VTCHPEJh/TtTuiiT7fdNYdvO8Zadsx
         O5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520297; x=1794125097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgI5V5B7x+Clu/Ykzpaj9msk33LUceyITfgNYKfdmF0=;
        b=2pnFI4ajRJSGND4F+oPfldSCbGH3U09Kbce1+Q23s6R6pxsxd/Jlp2Q2YZzGT7p3Ve
         ECNoPbBoXHxSfUH1iOsfYyNT90hIjNGSioYsYxLz4cTqKJYG3csSr5sirxDz50w3PYni
         luD2kKLh/j2O78PgMUKj8ZSp7bi1UvByLZqyX87c9XTEXuElA1dKqpMW07+jBjiKMLIf
         yrruB8W6fZ1l4liefAcKpKzNF22OwZa1L5W++pbX7MOsXFnHYvlpW4Q3DdN3q0Ht7bfm
         QkMIHuhAF5+f0uToYbrcxGncZPKjXRwbbLAe8HJMnD3L8ajOhI+NS5PQ1kdggZIorI7q
         X/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwFMH3RKEKEsN2FL4RpVJNWfgRXnIWtSPPJY/FffiFkHUF+Xo4HeJt919F76fRjAVZijrWD3uCSkdwU@vger.kernel.org
X-Gm-Message-State: APuU4Z9fGkXDO1y6dHw5Lv05LznXNqtO/8WCQvch75UtziYl8ZvQ/Mpv
	QLFyLciawf80uRIJ1uk+FHrPzBzBSP8ivdmVpAwIVyrDZY2cceUX5DN6KDOySIAsnLfxT2ZoLEU
	iIS5yo+RbySKIToV10UC76CW3/39E0h36ieGfucwh1LGo/hksvQelTs2ZVfza0Z3T
X-Gm-Gg: AYBFou11xhV5lq9ZZPqrHWnNVTSDu75XZrR8k4DkZ6S3UHwy5Kh3AzgAbwMrIU1RsmJ
	KqgPfnPi6lq+2aLEyJMXHR1fO5O7zzbDt3QKRC5zuH4MfG8n1AEjNSk7HPxrjx6frqSS+84945A
	9Nd38RBKgDb3lKJ33fUz7B60NJsu7qH7ModI2CVyqbMkHVnwrMH8a1z0JyPPhqPV522xwEiSnN7
	7F29YXoDG1JtmR6mNyZsDGu7VRUVDgrTIUBEjbPykeBx978ne9ZJgBE5/TWvEXF3ghNap2UbC+4
	gArlm0xLJfwR+IijZCCDww0lILS222jwtvpJW9Aj1jMu+BQPG040BA4cvocPbUaZ/zEysZ9ZtWc
	7ADnAGhBSqceU979jhcGhIxS25g1AB2Zr7460QE5kV+vxioOYjiyGWp0vzy7CvWhKI4CPZ6xP7O
	UkozLXNE00WTE9u3EYY0icEur2Pzes2RBm
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr9985120eec.13.1793520296959;
        Sun, 01 Nov 2026 01:04:56 -0700 (PDT)
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr9985085eec.13.1793520296277;
        Sun, 01 Nov 2026 01:04:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Date: Sun,  1 Nov 2026 16:04:11 +0800
Message-ID: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMSBTYWx0ZWRfX+ihUBGA7Lv4C
 qxkBgUHI7q8BnaiROECItzpumQizPqlAOWwzmz+nT2qkbE0FHurrJw2aRBx7nbJ7MHj0WebMkIc
 UmPnPrOrEDkdVVrKFYPvkL0GM2vR0oU=
X-Proofpoint-GUID: _ajtzox8BxAnd1WpetjVtCexwmURCzU3
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae6f2aa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IYcdIu6zbkOkbaNsF2sA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: _ajtzox8BxAnd1WpetjVtCexwmURCzU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMSBTYWx0ZWRfX5I/l2QXUFa+Y
 HjRpOXoaMDUpTQkcjvKt7t1+SaVLzqSVFyEp4MMs20HpuF+cLDadZM06dOyG7qI2Yg7s4H/4HGV
 lfBK8P+tAafm2dtOGtM331A41kGmHHXLa4st23nk1jxbcruC6ef+fXAYGzlmTlTQYXlwK3zg0f2
 giPoQ42O4fFaBpL7LSZn7omgs+w68kDtR99RVcHehkK+GCoeem5+zy3LKm8EVu4fZN8rLjbso5R
 5qlryN51gmC0nOjAC5bynDSAxUuhdCCc688+7ca6p5NMpKtEMnOW4YcK3oKNk9g9pVT6F+aOgjJ
 lbdwiDejy3YKGm0gB0k/5iohz2GltZwXAlgBe7io+llv4ifdfyOE2kHr6xSHrexBrAQODY0K3Cg
 tp4qQPTX1zZOoblrYqMYb5zNMHgOUoZZvc7h/nNH8Sa+mUrz+vB0eSgDB+1FN092F94tnaqII7b
 PTcopquFJadNSOWi0EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010031

From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
and DMA queues.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 124 +++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 282 ++++++++++++++++++++
 2 files changed, 406 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..72094c84e346 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -42,6 +42,60 @@ &crypto {
 	status = "okay";
 };
 
+&ethernet0 {
+	clocks = <&segcc SE_GCC_EMAC0_AXI_CLK>,
+		 <&segcc SE_GCC_EMAC0_CNOC_APB_CLK>,
+		 <&segcc SE_GCC_EMAC0_PTP_CLK>,
+		 <&segcc SE_GCC_EMAC0_PHY_AUX_CLK>,
+		 <&segcc SE_GCC_EEE_EMAC0_CLK>;
+	clock-names = "stmmaceth",
+		      "pclk",
+		      "ptp_ref",
+		      "phyaux",
+		      "eee";
+
+	resets = <&segcc SE_GCC_EMAC0_BCR>;
+
+	power-domains = <&segcc SE_GCC_EMAC0_GDSC>;
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PS_ETH_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_EMAC_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-mac",
+			     "mac-mem";
+
+	phys = <&serdes0>;
+	phy-names = "serdes";
+};
+
+&ethernet1 {
+	clocks = <&segcc SE_GCC_EMAC1_AXI_CLK>,
+		 <&segcc SE_GCC_EMAC1_CNOC_APB_CLK>,
+		 <&segcc SE_GCC_EMAC1_PTP_CLK>,
+		 <&segcc SE_GCC_EMAC1_PHY_AUX_CLK>,
+		 <&segcc SE_GCC_EEE_EMAC1_CLK>;
+	clock-names = "stmmaceth",
+		      "pclk",
+		      "ptp_ref",
+		      "phyaux",
+		      "eee";
+
+	resets = <&segcc SE_GCC_EMAC1_BCR>;
+
+	power-domains = <&segcc SE_GCC_EMAC1_GDSC>;
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PS_ETH_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-mac",
+			     "mac-mem";
+
+	phys = <&serdes1>;
+	phy-names = "serdes";
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
@@ -857,6 +911,30 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	serdes0: phy@88f8000 {
+		compatible = "qcom,nord-dwmac-sgmii-phy";
+		reg = <0x0 0x088f8000 0x0 0x4000>;
+
+		clocks = <&tcsrcc TCSR_UX_SGMII_0_CLKREF_EN>;
+		clock-names = "sgmi_ref";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	serdes1: phy@88fc000 {
+		compatible = "qcom,nord-dwmac-sgmii-phy";
+		reg = <0x0 0x088fc000 0x0 0x4000>;
+
+		clocks = <&tcsrcc TCSR_UX_SGMII_1_CLKREF_EN>;
+		clock-names = "sgmi_ref";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -1106,6 +1184,38 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		mdc-pins {
+			pins = "gpio47";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio48";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet1_default: ethernet1-default-state {
+		mdc-pins {
+			pins = "gpio49";
+			function = "emac1_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio50";
+			function = "emac1_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
@@ -1989,3 +2099,17 @@ opp-403000000 {
 		};
 	};
 };
+
+&xpcs0 {
+	clocks = <&segcc SE_GCC_EMAC0_CNOC_APB_CLK>;
+	clock-names = "csr";
+
+	power-domains = <&segcc SE_GCC_EMAC0_GDSC>;
+};
+
+&xpcs1 {
+	clocks = <&segcc SE_GCC_EMAC1_CNOC_APB_CLK>;
+	clock-names = "csr";
+
+	power-domains = <&segcc SE_GCC_EMAC1_GDSC>;
+};
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..586fedd2580d 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1593,6 +1593,288 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		ethernet0: ethernet@1a00000 {
+			compatible = "qcom,nord-ethqos";
+
+			reg = <0x0 0x01a00000 0x0 0x14000>,
+			      <0x0 0x01a7f000 0x0 0x1000>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			interrupts = <GIC_SPI 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			iommus = <&apps_smmu_2 0x1201 0x2>,
+				 <&apps_smmu_2 0x1202 0x0>,
+				 <&apps_smmu_2 0x1203 0x2>,
+				 <&apps_smmu_2 0x1204 0x0>,
+				 <&apps_smmu_2 0x1205 0x2>,
+				 <&apps_smmu_2 0x1206 0x0>,
+				 <&apps_smmu_2 0x1207 0x2>,
+				 <&apps_smmu_2 0x1208 0x0>,
+				 <&apps_smmu_2 0x1209 0x0>,
+				 <&apps_smmu_2 0x120a 0x0>;
+
+			pcs-handle = <&xpcs0>;
+
+			dma-coherent;
+
+			rx-fifo-depth = <98304>;
+			tx-fifo-depth = <98304>;
+
+			snps,tso;
+			snps,pbl = <16>;
+			snps,axi-config = <&emac0_axi_setup>;
+			snps,mtl-rx-config = <&emac0_mtl_rx>;
+			snps,mtl-tx-config = <&emac0_mtl_tx>;
+
+			status = "disabled";
+
+			emac0_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <16>;
+				snps,rd_osr_lmt = <16>;
+				snps,blen = <0 0 0 0 16 0 0>;
+			};
+
+			emac0_mtl_rx: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+					snps,route-up;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x1>;
+					snps,route-ptp;
+				};
+
+				queue2 {
+					snps,avb-algorithm;
+					snps,map-to-dma-channel = <0x2>;
+					snps,route-avcp;
+				};
+
+				queue3 {
+					snps,avb-algorithm;
+					snps,map-to-dma-channel = <0x3>;
+					snps,priority = <0xc>;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x4>;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x5>;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x6>;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x7>;
+				};
+			};
+
+			emac0_mtl_tx: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		xpcs0: xpcs@1a14000 {
+			compatible = "qcom,nord-dw-xpcs";
+
+			reg = <0x0 0x01a14000 0x0 0x5100>;
+			reg-names = "direct";
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@1a80000 {
+			compatible = "qcom,nord-ethqos";
+
+			reg = <0x0 0x01a80000 0x0 0x14000>,
+			      <0x0 0x01aff000 0x0 0x1000>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			interrupts = <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			iommus = <&apps_smmu_2 0x11c1 0x8>,
+				 <&apps_smmu_2 0x11c2 0x1>,
+				 <&apps_smmu_2 0x11c3 0x1>,
+				 <&apps_smmu_2 0x11c4 0x3>,
+				 <&apps_smmu_2 0x11c5 0x3>,
+				 <&apps_smmu_2 0x11c6 0x3>,
+				 <&apps_smmu_2 0x11c7 0x3>,
+				 <&apps_smmu_2 0x11c8 0x2>,
+				 <&apps_smmu_2 0x11c9 0x8>,
+				 <&apps_smmu_2 0x11ca 0x2>;
+
+			pcs-handle = <&xpcs1>;
+
+			dma-coherent;
+
+			rx-fifo-depth = <98304>;
+			tx-fifo-depth = <98304>;
+
+			snps,tso;
+			snps,pbl = <16>;
+			snps,axi-config = <&emac1_axi_setup>;
+			snps,mtl-rx-config = <&emac1_mtl_rx>;
+			snps,mtl-tx-config = <&emac1_mtl_tx>;
+
+			status = "disabled";
+
+			emac1_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <16>;
+				snps,rd_osr_lmt = <16>;
+				snps,blen = <0 0 0 0 16 0 0>;
+			};
+
+			emac1_mtl_rx: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+					snps,route-up;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x1>;
+					snps,route-ptp;
+				};
+
+				queue2 {
+					snps,avb-algorithm;
+					snps,map-to-dma-channel = <0x2>;
+					snps,route-avcp;
+				};
+
+				queue3 {
+					snps,avb-algorithm;
+					snps,map-to-dma-channel = <0x3>;
+					snps,priority = <0xc>;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x4>;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x5>;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x6>;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x7>;
+				};
+			};
+
+			emac1_mtl_tx: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		xpcs1: xpcs@1a94000 {
+			compatible = "qcom,nord-dw-xpcs";
+
+			reg = <0x0 0x01a94000 0x0 0x5100>;
+			reg-names = "direct";
+			reg-io-width = <4>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_hc: ufshc@1d44000 {
 			compatible = "qcom,nord-ufshc",
 				     "qcom,ufshc",
-- 
2.43.0

