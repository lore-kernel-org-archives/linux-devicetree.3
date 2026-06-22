Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54535E953
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110535; cv=none; b=KUzlUfw9/6yboza+HVBVNIB0mngGZjRwHmCky/kgrV5RqzLHqYpKYO40SpBO8d+qP3VPwUFGFO0wXu4QVm8yHKz6rOl2JAaqEcN2OdGtMF8GBm/+8VcYaYTTYDqKAcqmK/CJb+5V7t9O3uzU46ohkpZEH/s3nSkNUvFuhAzBCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110535; c=relaxed/simple;
	bh=0YnuF83wi/j6SmKNLxkI7YGwSEn7DzPTu9JcNVgnp3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXBl+Xbgj9QAlvLPyYu84gU9nZpbJkK2PuQ660k3wxvpGpwXT5r5TNtlqk3HZGfY/mSPIWKeFRsy1xwidh3afO3PWHUSePhTc12aW+VEDjosGOuMisd00ih4C/P8LxOC/dnSO6Sn12lm1JT8Bfr07DYAYVkJNWekq9a8/xLmYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYN52TAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9hyW5Xp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYN52TAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9hyW5Xp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5Bnxg172670
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=; b=HYN52TAhOqv4fUTn
	uEqo58lE9vptAfULG2gXJWLmDPsnC6dhB4Yf3Wh9r/GnlahaCEAnFwUpJjF/0wXh
	4t6nKLVa46olZgId/ZYZCYP6VSOA8fyEnCbiv2rZKilSwvdaFJrFF7Yz3WCCpWdX
	aGUway0BhLHGgpG9d8lx8Bgu0aM0/K3uq80IhtbT/dchyIXvtzwehUUbuoeXNQdJ
	r6YBy3+H/UlZtQz2XfHyW1QLY0+6DyvfLUAhq7B29XDNQhBKoPMRMHqTJWqW2gvD
	tS4CrWstERr2SoY2GsWVcF0akeWA166WZVhHl1q6eHflg2sLLY8qJ+zkinoeHpqQ
	KCsPtQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexw638-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bd87994e8so379259eec.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110530; x=1782715330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=;
        b=W9hyW5XpwmcYg9gJ8ehJ0+DZIpuHFVj1Msgi4jRzUjnwM6d9FkANQhw9mDHWb8Yjah
         ctON7bHOEZ6ECrZWoj2URyVedw5SeQXwzuWfMf62lKOS8nbivkEr8OHesiNl6PFBa6rU
         EEmin2F2bGaXGwkPzjcwA9PJ400AodSLJFVAqSEcLyWuysYnXeLU5lqVqIWKwTxV/Wuk
         /35v1cWBmwe5P/jaI+yN4TCMmRWMwP0flDIiX9ZutBrOJu0ECooasUSjjbXAmuMGVUxM
         KGAOedkz+xtZq+aUZSqHAPtI64NbGtz+sQ/XJdgzg8jc5OOeVICpA+wT4Ap5CeRZhoUu
         j5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110530; x=1782715330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=;
        b=VfitxBN+GairPLJ61YGHCl0gNCzEn80SkZGZT7sKHQ2DMnznqq1xyIiUymwuPJpCOO
         /E0tYlNmg4sbiho75cnrzEggvLzWCRoCxLXryq6U/anoJXNNAKTpTw1PVZBM7TZch4Ub
         JmpNPPk7kE3tBPBmsjvZATrLlNv6e5ZKZndlDRaij2cRX5qQavot2toXGyNVEfiXgLvw
         q1cY2sqM+HqS5s2Hw2qXjYYhjEz/2maElLwpTY7O1mRPJlxZWU0T6+xOoxJo0pkGFyIy
         nS3OO6RY8q+ebf9bubLwpEMNlGVwaCDn7rppkIMgFXAzV5RCILz8zNiuSrrZphuxTADA
         uaPg==
X-Forwarded-Encrypted: i=1; AHgh+RofIQkp7w3UtJKkMbJSNxPlMG1K3wIfFSon3ixKe7usXiSOkshPQN9QXNZ8W5Bp7EdeqX9yj7sTnk1g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1yOU0A0sqjrDPl0N9b+vNLJVyQvM3l7oJBmhrShRg8qPhKRN0
	fDMBAPi9zU+u3NIXE0iwaUcKUMycolOh8zZeSp5QRsZy4AOnoTHedqc+/FENtoUJFK/tYGbXMaw
	dxUhzEIW3kAGggp+rNAQGoZWqGayowKjJ4rtXmY+W4z1kQGWMTzZsgRX+MOdNFmQkIakHEnMF2A
	M=
X-Gm-Gg: AfdE7cnp6RfNw2cxvODlPYYuR2Flgb21v4sxS4Lar4nT9UYF54HmkGhHqLmnfr68y82
	+I0XDjiYTWJ9O86BSr0WMvf7ex/meSMDFEpiRv3VSos6QbJlGGbrYC1rQJ3+EvYBrThk6PRhO3d
	CbPbey4rGrjOJviD9cqZwxWNzVOnYP6qFOT2YLsRkBrSoE6bfD/+fapnW249ZspgfxND9MPY1cE
	c1QGdb7xQxJMtgSlhmdzF4mAtaweWYBWh4lgQPV7sIV4hNi1C2ZQyxiMOTl7sjfWRVAV1ERJiMu
	ktJqYhcyRqhGmmHvutSMg9Bo2Ag7F0JRTsmgIcMSyGV4TqDdtmIv0vdnoxCljmy5ly7jGySsMl5
	ZEWcntNMAiiGRM4zFESw8qnt0OYuoQ3fmsufTkZVxwJ4Mp9rd9ap6iMT5k/BDpg==
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr372544eec.6.1782110530448;
        Sun, 21 Jun 2026 23:42:10 -0700 (PDT)
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr372531eec.6.1782110529889;
        Sun, 21 Jun 2026 23:42:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be95ebfsm9357803eec.31.2026.06.21.23.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:09 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:11:57 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX34mUZ8YR2qS8
 VuxWpkbBYRteTIVBUirxNZpsMYgiFqDJhw7F6UW2dE4uNXs+e4q9tVz2EWQvEJaTZN8+XIWRhse
 Zo7Ve1vfnGl39K7uh8xxrbCssco6TO69cA+1ho1uiKq0hsmHWQnA7yXUqTrYWJG+nz//4c9dYLa
 pdoGd+1hd9DlBC2J/7c2krRYos8rcj7bOciV+Y/I1Oayzb06XjSSpLi+e1GBUSNg4BXpxbh5Ztv
 nAW5IWeBrkxgcrSiSu2nhsSoJ6UQ39GuC5obVt8LDYGufKy/6DqC9waj3jRfYD1GZcC3zmcxW/2
 yK/x1hqjWFzqKx2DC3QoCb84xszGoKeMhpVkb99qPUFWCt7O5lkEgC6XrH/mSMdkjflk2AgXKXT
 jJS6lPIdbqFwB03lUTdtWmYL6D0U2bU3Rzn+XOybFxCsmkaOX3kV/9MXVmVD5CoMskbW5Mo36BH
 i8DgUcSFW1QWL81sZFA==
X-Proofpoint-ORIG-GUID: HcEEoOVyalj01qmR2AZAU4j00ohpbf3p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfXzbVGUMXJQumu
 rBpyOco4u52Pi/3B67v516iiOGQ+HuEf0EWt0jxlm5hqb96BQCVJvpNuoXQOFt7dkyoa30wSv5P
 Epyu3exKQX1aaN91QZc3ZB/2At7grbY=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a38d943 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H_VFOEHctDopGwz7gSgA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HcEEoOVyalj01qmR2AZAU4j00ohpbf3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063

The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART17 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart17 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART17 interface.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 34dfc8d22b6a..b2967cb53760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial1 = &uart17;
 		serial2 = &uart0;
 	};
 
@@ -88,6 +89,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart17_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -178,6 +211,17 @@ vmmc_sdc: regulator-vmmc-sdc {
 		regulator-max-microvolt = <2950000>;
 	};
 
+	vreg_dcin_12v: regulator-dcin-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DCIN_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_sdc: regulator-vreg-sdc {
 		compatible = "regulator-gpio";
 
@@ -191,6 +235,19 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_dcin_12v>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -742,6 +799,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
 &pmm8654au_0_pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -970,6 +1035,16 @@ &uart10 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	port {
+		uart17_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l8a>;

-- 
2.34.1

