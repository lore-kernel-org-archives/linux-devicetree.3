Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7DE2D0C79
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404070; cv=none; b=i7KmZpla8u3uAdRwXC1syHvtY9BntH0dG9gTx172xYdE9S4ZLO4qdMSTIDtr4UfER36jh6dzT8ztCYxs9YmIOWT+UCgmVt1/N7V77MveFJhdhw8dyr7asshznZiGasyFHgdSslOqi1bIJ7alHSYQDAq/O11i3U/RwuML1vqaag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404070; c=relaxed/simple;
	bh=JQA+v1EfIB+ku2V2nhFxmDsNU3E92/C24KpbpGghiOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAF14VX44gUqx+oqD1XnZCHAa1QDRgfD3mg/ewUErTxi8rFpJ9fPfq4CsXlgrx6HKEaFhKiZeyI7oO4OFirrO6eJv3GRsWChVIAToeBIyhyrFBcITSHTeYRGkpvRQg72Z+XWXLRY0mt6X4Ak+k2TsrojncUH35QGY2hAods38bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtRRBHq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsqDTELc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtRRBHq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsqDTELc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495GH2498869
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 06:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=; b=MtRRBHq2G1lt2pn5
	bPkRbjJSdjThiuQju2XYKSgUEI2hvGpx/offrXUfcHO2c2y8VPyyL8XVkAZgpmRr
	b5TapPga5E4Z/1ncJvbJPj6k8K51O+Nb5QmNtHZWZw1w6liLeUxh1nGsl6J7hNI3
	lMi7Yqg4SYLu+pWruOhAN1VY8p/Zl4F2qB+B9YCMGelkF9absdAq5S7atax/GgcJ
	xmKE0Podl3tfD96HSRPKBTh1gaUo3RcIamMOQHglp+nEEOBLbZaNoy/v/jPz5Q0i
	pcw6BXw04Q7aNgxH8M79mDtoHptUOoSZwI3D3bGTzWIagLgFeOnzXvItOw4316pn
	yQH2nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:01:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so3826286a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404066; x=1784008866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=YsqDTELckM8sbsz49ju+zkuJ/0VmzxcMn2NIKZwA2xqJ9WxKIgRPHuimt+2mmyjYvb
         E8hGlaOexFQlg3GCQUjjNG6bsEGCYkZszUwFHykSGwfO52ScY/c7DVLunPAlZugwMVUC
         BAnsmko8Qsb1mNxPYlLM2iWAfKVFpS4H0uXhmHJ4doniTCJt/hVuvOj9I90fQy58NKtt
         fu2yvcT4aareRhvRCK9wwJGlmkwAmlrhaqzhnBm4a5f7RGdLZSbUgR/7H1K0Oi0Tasm8
         6XfDZbhXorB3J8xlSAR9jK2cLpIDrx6BwVhYt5SPpXJcQLhXsImwQrZ0CGdFL/VLiFBS
         1kPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404066; x=1784008866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=aV/e8ONaGdRVcjCEL4LKZ/kqOw5ihUZL4+V/0rlQEfxh2mDfa5qxmov0uNIFekCiau
         Kv4pyejYxnKxM/hUMCql7bgscqNiKlQTT4Z5iKMpsrht8i9JPujqWw6S61/tpVl+d2co
         s4tNSkdKowBeP5TsXGPDd8Pv1ByQFJm7BD076ZCyronyA16IEQbzGp2KbzccqRKaB4Fy
         LIwloE8fqsqta5MQ7KmE7i/suJdOr82lXsUys+k1+mYJAolam+kv755nJMBNmN1Oz8Lz
         WcN2DZ7ocSjWIMLlpDx5/5wkIPhR7xuG7hLw0ue/eQUVybGzY6+OzxUbG8FfOy/Q9RcB
         Gj/g==
X-Forwarded-Encrypted: i=1; AHgh+RpbIrVXLrShznWL1fE1iwN6XWBiNLEUmNh5ksy4F28GoL6G30+MzT0SIydkcQ0WuXuA8d3YLYoIES0D@vger.kernel.org
X-Gm-Message-State: AOJu0YyZDYm8TcZQJaYSaEWc1nipvC6gEp6juHoskgJSHRUi3fM42pGu
	SK7Vsbtlfs84wB74WBYyFBZvwC75E+n+1Knd0dSbWgXkgC3a1l6Z2G2L0EqitYqNveoP3Sbb+Ai
	Fu8MKay/DiOieYBDDF6qHSZR5m++bjY99+1Qpsz+MK+4pVMslW2TsVys8ICwwIS4v
X-Gm-Gg: AfdE7cm4ugD54KHieMp3277GXst5SzODWF1WZC0SZbxyl3b490WlhC+kH/AkxalW5Xo
	S5EfP44jUEOBIwwDuOFWfUfKBAC8FO8HF4MbAzVUYIITopGuFNpx6eMI42IdBKhuG8JRtXzmXdY
	9YN4e2UMZd1jNDWoKOkv4R3WxhEIkorRK7+nyhHCcpXiNvKFSDblxIqeRidG1/YtC1tu3TR1G37
	9Cqw9q3c6KXV4UvTeCb1cwaFCYNuKYC6BBXMXm4naqoSfxnyIYKL3uThrb7GyV9Pa3VcHiAqvu5
	g33Bw4VbvasimPZSLHVhBYEJsvB4//5/Q5803rq2mA5ZTbv4Vp/H157Up2LAKwkHIHzoqnMKPFx
	Di22rvu8m3WVpXC8vyh+BDmJm7/uoxzyZDfS2jW7JHs0UMmerQsIMhZTy+Wzc4yhy8Gmw//hSDp
	5V82ym+3uEYYSRMnS4MpauzIIxLATaCnx94anTZNMB
X-Received: by 2002:a05:6a21:487:b0:3c0:9c1a:8947 with SMTP id adf61e73a8af0-3c09c1a9c54mr1947396637.63.1783404066107;
        Mon, 06 Jul 2026 23:01:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:487:b0:3c0:9c1a:8947 with SMTP id adf61e73a8af0-3c09c1a9c54mr1947337637.63.1783404065629;
        Mon, 06 Jul 2026 23:01:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm4105919eec.15.2026.07.06.23.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:01:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:30:44 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-08-dts-v1-2-fce82e14cd1d@oss.qualcomm.com>
References: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
In-Reply-To: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: THxwGxQrGM2WnZ-F-4CCnOdjb5JWlejN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfX3b4Cs/CNVYsU
 Rh1qFVQ0mlaAmDdpRnBhxZE+s3eHYVFxaALMsSJzA7voHr+UuBHoeiaaoa3ewld/Vn3oWjRKqyQ
 ++b8Jb4PYHt6F32NprfjX2LTucg1bCIQoX7ZeYivtOeQ8D+FMMcucYBBKg7/CWvYnFIPeedj6So
 WrCVRTFm9rzWXa7NlPX+Nuo+Q9MG8gsDbyXIsX0Qm50RnjFt0JM9Ch2BOVW/EthYhIS5W5Oml7f
 yUts6mbblNBxgJDuXhmyyBR0Y+S+rHjIszevUBa8lu2ozmK3BXFUY9WgiQArfP/Pdz2d7kicl+C
 QaN3gBSIF7I79p3cIcgYQPIfBDm8cp+jjGWUrllg4YbSmimvxrB5+F9q7rJl99W7AVof3iz0xHd
 HkOfHJ5DsYOFK2Wvww6RwdWrgxhnaWXau1NiDPK+UknFQvAbzgyYMPqzypyoKSkDUeWe57LppmY
 R6dAW7lzlE1OTmTvvCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfX4vXKZskueiKp
 I75WP9NzOwDYGAAaj+jl5l6n4ROTON0wI91jXAFeu5QrdOsYfgtNpptxdx8PT4TK4wxbMlyXGRo
 h2NQhrBzwe1dx0+K2L2iEUnAxEFoNLc=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c9623 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WPSE4gBbNDprgx3kWUIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: THxwGxQrGM2WnZ-F-4CCnOdjb5JWlejN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070054

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Hence add the NAND node but do not enable it.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..c47e18eabc98 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -18,6 +19,88 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
 };
 
 &sdhc {
@@ -35,7 +118,51 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
 &tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
@@ -74,6 +201,10 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };

-- 
2.34.1

