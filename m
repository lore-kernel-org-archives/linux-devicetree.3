Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520333;
	b=fKMf3Nw9+AwKWdrRZAfILdw7U98vM0u5zDc258snI0WxI7T0YJuoi95pS6NNLnBXxluX
	 jVBLS+nG6OWge9PQohu2TQ9MxuzOx8ly/teCDByJl6juBTNatJBG4aQBw4LtWgCRzuekB
	 uLQY68y4PZarzrnq/63eUXv8qnV71pWGlTkfbxebdES4aFHlvntEoX8PBcx0ku3Yyj1UP
	 npq44Lqabv20ceHgHRUo7EGCJuRcbwmCq4B5subWUx199jaHoP+xruSuN/z3F6zu/NkGv
	 5+EbZZtLyx3sy9aXqbvZ8zTRW7uaZjySQTQVPhS5QP5J+iz2aGtK1H6XMga0rQK0dEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
	b=5CT3zsNv6faYMjpsNoaSQHw4awHbn+ZWGLmOksu8hCIkvLfuU6TSOwnci43wsYSv0rLY
	 CXX4ZeUbYDMaEFfY4WuB0xIw2SvgvS6x3FEtDu/bN1HkXII7BGIxnaq+rdMJHbBJLCI8l
	 YNMUv+u/mcqBF+WtByi9mf+P0VV1SW11RUaO+1maHZh54uGmgFuSguM9rkm5je+vsXIrW
	 gKFi9Ad8AMRu28PfvRd20LfJ8eqP7gtx7+7MQs4rlovRKuDBw42yl6Fc2G69dozgCNYtp
	 8lOKq3VRNj9wnNG+Gd0SJ0mtnHX6T7OThr/8MMrwaAcizJI35+hM1HZFOOj92g2hS+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biiSaxva;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nmslwy3Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75EA606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biiSaxva;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nmslwy3Y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15LTBL3832515
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 08:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XQNFNmZ+Sm0
	PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=; b=biiSaxvavAKV1ag4usm5GMUohAY
	orXaHCxF9gRT2SZLYdTv7zqlq17fLMGcBLQc6NtHSr0oSaVRwDKhcalMBwA0jewA
	/FhYIrsynJJBtoMqpBRhtguoIk0cFIoBhz71dbOKfpc9K+uDcDsloaP0biY+rFSI
	LgOeVVK13BerxldNcdTcyg74jMrSx5m7R1CQSXgskyOuSxeyJRSPRJF0CYPD25dE
	Pqs9BX/SpkIUr/Y7jIQlyu6ipSayE1nlCCE/gJMRsWS7fc74stadQtTVzHJwlYo3
	ARY8r+IrREKLWYEPx+qbB9PBWjUmPtzl5iTabF5NONjX27Jp6yo5ZgKOZ+g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfu2qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 08:05:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so4983550eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520305; x=1794125105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
        b=Nmslwy3Y/FGjLN52EjOwZSWjlppXSHgFyZvO/oy3JVkzoELlvToqCiiWfyhGQm0TCA
         BgpTgeNGKN+ypVOs6KGZhPHEoG2DEnqz02LH3qrEcyDMhu0ZuqbrZVlXU9DN6eerhp4/
         Uy/whoolLGR3HS11CJl+BAQQrBZ9/oANFFZqKr4w27Q0qwMolo3FlKRw5gw3T5wPapZw
         PcuRb0RLqNUpQZ7Zy5TPtxKUb94bCzPojPiHWClW3l9/dhP9jgTghqLfHVTXXdzoOte+
         VzYUa8SRNz+FRSZj5iALtap7RZYje0tR4q7rMIs2iJfsMv+co9EuBAdY/VXUOLou+dQg
         Sf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520305; x=1794125105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
        b=UBrQozm1LJ9Tlz1RTcHqtq+2th/1qhpr2zh9b4MP3q950eLpcf/VlAW1AlSxdcHD8L
         qxqHtmiPtBT8oOy0Svcn1kkxNU5RroOuuV51rhrvZm0UL9aeqc0HV2f556gPt57HYOF6
         H0uvB1trf//t1cbOxc2FL1IrqQvGA/p6mzNiuPn96qu9ytXBvczcHPEtnlXAf5uF9mnp
         63nq1sovjb8kdpRNOE7MibOz8dR7I46TUmjbL1NKKQ0pUL4TmvuS2FXOEhJNuSybM0qe
         OTVVwksTK4NMJyMICQRdsCTkKack2NJH1DNGDfX7hGFlGIAcEPcHhBJNeyiX39ZPBiww
         Up5Q==
X-Forwarded-Encrypted: i=1; AKwUvByBCqRbppPSZQw45tuAicMKfb5FwdqBD5fQ5xJhgV5BlXZX8JwVYrHdZCgeLIOhTD8vr7pXW/jE1Quf@vger.kernel.org
X-Gm-Message-State: APuU4Z/5HtCw42oHbV5XU91FrD0PJxekCRER1Uidpt7jT00ho2DxcR32
	9uRdzQiUjnsXhWsmER9hYCNz4s7JBfQvvzLJHzaoz6E5t2BePPZD7N6U/8J7w9wbrpWLdxbceGZ
	FaFF67yWqHBTYiVh6yrk6p6cru42ZVBIBKv3PkDnrtXDJUkYkkH7d58Tjiv9XHxE0
X-Gm-Gg: AYBFou2P4u7TybATXUslJFKdigb4JAlJOiSbjSKWisbmP5tY6pew0Vhjv0qD2CU4zat
	IZu48n+QuCPnBTWSW3MCAWo+MIKGkVSHLWL9Unj60MrqcLVKUITJLttHedlRmgsAepUARuoWmLQ
	hUlKGMwcyU3KKjLUT7rbk1amb33TXCHfSH3QIIVo24zKihI8Zul5xSzFn81aMs0aegYuw5QMS03
	mj79W3yIku0kaWkgA6DGuXD90p5a9yyCgOco2PFw911aHUZZkVn7pubSqkJZ9g3geQav16G5zPz
	sAL3vS9D3itzNcmrkyBSEMSkDTLOVKW/vcDwAK/Jm2kpxSEoq0hPMZI9SaSma25e9RU5PPBjbGH
	qj1JTrpTWPNz8CJTbvPTVgdTjykGo5gB3KcNaVVGGONDM8dl9BVQuhnVVsgYCBGIH6jaPatDNZi
	7FNkdvhC02NtNmcbD8NtsTXhF8TPHqCjLt
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr10973089eec.3.1793520304874;
        Sun, 01 Nov 2026 01:05:04 -0700 (PDT)
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr10973056eec.3.1793520304288;
        Sun, 01 Nov 2026 01:05:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:05:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 3/3] arm64: dts: qcom: nord-rrd: Enable Ethernet
Date: Sun,  1 Nov 2026 16:04:13 +0800
Message-ID: <20261101080413.1428016-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX37lzmuuBIlcN
 tV8MHv14Mt2otOqW8isO4AkRebK5eevUIHgUiqeeqg1WNMRmfl49SUG3yIIbfHFFhFweMSUGTxR
 zL8wuAgI4aQZ4KLtTH9PqKE7DA2yCYg=
X-Proofpoint-GUID: g0fcZtvgDuucixyif0qUysBeeepoDwUV
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae6f2b1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gIG512RHl6OACX9OBTEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: g0fcZtvgDuucixyif0qUysBeeepoDwUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXwifHoFpOymhe
 9ogXDvaFvIGHjt4a2e7GhwSQHuxwc+2qb23r4FJJ6AJQ3ApzZbAiYPFEDsQ8YrBi9QEqOTeW6KJ
 2xuGeAM09KwaqEOYa34zX2j9q188+jy9O3Iaf1CZG5EKCyj1bJFJ70eWkidT4XD9XAJi8USbB4i
 PiGRAv/tzG6cBxwjhbAue1qz7WQYpkgCGZ3NNDA7RZsquTLkKbcd83dliUBzQeADtkz404u1QQm
 9iAmfbTkqb+es5fF7r9x4YZmaf/udMK2a4XQw5GBOPAFiyvWgQuvamPrLm8m12kuOf9Tb4WlsRZ
 FPSs/88AMU2byp8pEA4B9+Inqm9VDiW3iGhL2DfW2ktlKuojFiDx22+gRLtnE/O54crq1uVKxit
 Bg2FnIWlK1ypqMItzpTcR3VJyJ2Ev4/SOnmYdHOYTQEplYmAFmomyI3XaDn9udRBM/RvMOJnw0J
 YneZ4j2nCkuKMVrV68w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Enable both Ethernet ports on the Nord RRD board, each connected over
USXGMII to an Aquantia AQR113C PHY managed through the controller's MDIO
bus.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 88 +++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..0f6259d91c42 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,56 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&ethernet0 {
+	pinctrl-0 = <&ethernet0_default>, <&ethernet0_phy_int>;
+	pinctrl-names = "default";
+
+	phy-mode = "usxgmii";
+	phy-handle = <&sgmii_phy0>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id31c3.1c12";
+			reg = <0x0>;
+			interrupts-extended = <&tlmm 141 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmau0102_e_gpios 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+};
+
+&ethernet1 {
+	pinctrl-0 = <&ethernet1_default>, <&ethernet1_phy_int>;
+	pinctrl-names = "default";
+
+	phy-mode = "usxgmii";
+	phy-handle = <&sgmii_phy1>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy1: ethernet-phy@8 {
+			compatible = "ethernet-phy-id31c3.1c12";
+			reg = <0x8>;
+			interrupts-extended = <&tlmm 55 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmau0102_f_gpios 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -430,10 +480,40 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_phy_int: ethernet0-phy-int-state {
+		pins = "gpio141";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ethernet1_phy_int: ethernet1-phy-int-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart4 {
 	status = "okay";
 };
@@ -459,3 +539,11 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&xpcs0 {
+	status = "okay";
+};
+
+&xpcs1 {
+	status = "okay";
+};
-- 
2.43.0

