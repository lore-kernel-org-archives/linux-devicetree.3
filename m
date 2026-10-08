Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C583DD502
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450919; cv=none; b=NgOS+0dXCNyFa58nTvVMGaGMFMb0wy5sYoehw+m7E1Trph3jBkUJ0RHhneeQyEBmDDbdYE7NLjMXPAkQCYDsk+qWsM89Z9ffa++/N+wjRaxAtnY1LvCZiuxW5xLh6UYlMQXbO1NlSYti+F7bifQSUSGYIr2AONfpvdYsUAen8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450919; c=relaxed/simple;
	bh=FkxXvNYxJ98mZBbmVM3KPngHjCom1UwkID4dXjt154s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzf6VwLV5r7pzGkPPxuJR7xDkr3pRarKq5PBGZrC8YT/JPkJUbg6iYd1g2RSWGlvbi076VAbdrdSRKbo6OHyUL0WGFxDCrzzjTJl8PrPZPY3z0j4R5BI6NDS2ahg1AlT79Ep1SMyMEciXu+LUaqrZ+Aojx29A5LtnJ2BD53se0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBHDZ6u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/PCegGd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBHDZ6u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/PCegGd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KYPo730807
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=; b=SBHDZ6u4eqTPWi3c
	QUX5Ehc8uQ+B04Z4dfAyPxlYq+3MKwNriUDJM0ocXKmV77JYH1GUI6wPX0I/SWtw
	p7YBK2LZcbvxpPHUemxXxRgdLFmS+ivT9GpONLXDRMzNFLCmc+eHo3OGdoRQ148P
	EBqYS0yHoZI+ww2l48KPl6wEp+MYVhPIM9JlfoMHFNFhF++qHYzMmKWzKwKpA5tx
	venzWXEXmmHn9t5X0uMqM0QNMSjJiFVCmxM2cCRRPGyHmTwBDGnvQSFHwQK+V/uk
	G5K40Tockl4uCNIVA1ayfLjtrd3OiU6c8Zjm/oMblLKOWdQawvRXsceuJyJoqW73
	3ufzSg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe322km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:15:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510562ef98so6871592eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450909; x=1792055709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=X/PCegGdGKGA1qa0JWkAH+Qi3gytKiIidK9dzBdkqPCot2kjiM1DkF6GIwgznrcBDw
         t2LafwhWpQsHhsCqgUsaL/EWEeBO6ZKT9sLBf4n7rkb1nv2GBwlInbWKxClzrZQhFljy
         D0woJvkYABtr7fYCjRd1mP7Di97wzwLzblU83aN1n/mXk2w41f2EddkwMdFyMElr5UK5
         Y2cC69YxYTnWzho28AnVr+eRG6wuCOcozqODv6x/keDI1fPz5hxvP7A2Bh5wXtOnbqe7
         xJc7sLDnEvmVPsc0SFIH9CAfCfzY8LDmML8DogSC5gA50lPhiSulUv29fXAlBiFsK9wv
         xzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450909; x=1792055709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=ReLJP3gANOz2leulMDRQuGkKarPGt9XnFRl47MgSKDxR/kNVq2pyXmBEEaJLBeoG9B
         3nHJn9AZ7hfplYuMh/IyaEsXk5O5Dj4jtHw2U9igDkDO3jMC1dEgGJBxFu83OZHqR2yh
         7RfRWCxEY++yUnkCGCd2X8kyDHUtjso6GQIMN/36AhZeoeWHoJ0relVYFeQ2sBzYGYUn
         1hbMd7Obe4iZuLxrm5KXU72o1lQHL98LKWEBQwp0/YxRnHI/mz3lsDaOc/Dotr07Oqah
         NqjCaQOpBHtRhjKdrLLy1VDBDL7WmhpI1jUP7H9OSKSaroS7h/0YH5D6sBvFoyjvX5cD
         dbAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxegc0VwTNtdzaF2LSpgo9xw2kh4WslUXy0KJQK8iBP5ow+HdcJqcXs7b4zXo/k5asaKN8GXgiNBAh@vger.kernel.org
X-Gm-Message-State: AFuF++k0+0+GqA3mHDE3aVXBlLHZQsUY8Ni4JrRe20xrcPOQTpD6PPQJ
	VMPy2VgomZ4oGdo/bKjeSRC9qR86M4dtdZYX60WugmvJUFEUbV4T5fhl9iY6yHkr346m18dTzKu
	08Zr1vyM5tdn9V4TB+V/1q0m9hUF7aIhlIwjYqdrGxEhnUpgGX/KjHWdZYKheuQbQ
X-Gm-Gg: AYBFou2Tc4BmtVXsn2udnIV7pZJr6Iq8xcuRrmsCA9DLZ8hHD+8bnEmwtNQVZBFGIhy
	9J+tdZ6vyhEbfnWiGMFGOrE+XSKxUVO6GwmyOivXY8ZI2wSvbRnZBc4bcX/erkJfvpbXBH5584R
	TjFV9XYf1F0xZPb0CbKxFmB3y22doMb7o16cudm3k2H6N93kJV2d825Os+dqVX0CidtG8k2MdnH
	YvX4xBwzxVFHe1y/xgKVAJCQ911csTM0Ijeh/ySJQJi6bip9yZ5A04MHTqwZgSHQd62PSVXE9ut
	S11lcRHL4KFGn6LSKE7gZ8UTaFRAMZ8SNNEQZTCvA+6eroPDYQrGwcqj+e9Z9vs+3GbcH6tAVl7
	mkqHA3vLvzsgm/Q8MjCzGFiN/kgQ5UjQpPepOW6+R2weLY0DaCShJUS9kbTbjF0jQX6VYN9KmF1
	8WOrns309NCnLGs7MVx1pNV5bNpVB4
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423223c88.41.1791450908880;
        Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423181c88.41.1791450908234;
        Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:29 +0530
Subject: [PATCH v6 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-9-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXy0ZTS3vqgmKn
 r3+wbdBq6CbrndnpVQHM6vN1OvF+b6k9aJEXQcuD4DG3sBV/Lnb9ASrsIEMRLDolBlhfqVf1q1o
 BSywWR/VLkQ2WbjQESfWFhA37I6Rzz9o8JMEntGBqLzp/Ygctoj9Lcr6fpcAQQAExAlrodnwGq5
 e1+0cZpblepm3DAgbanhU0CNJVm8Ko4uQ86EWxbNoz/5OSodTeOU7VEhJalJE68gIoXkTKobbaT
 kKh4otbL4goix/tLgWNHQN984qIJVExdHNWkbjZtd6VTqTbQiPejkTth6W4B37y2kizSJ1RYW86
 q853Jn4f5lOXSNORz2XvEtOBGX4gqEEtPaNt1a83znuFRuY7FivlR9i4rJ/iM6k0WpXCkwJd7QQ
 De6EF3xoO2hf4CNKMhRWJ96+x2MrHYOdBBrk6dP/UM+ALaN81Z9yLm1cpHIDQ0klWkSx876wgrA
 FYOK1AFIqsrAqps/ejA==
X-Proofpoint-ORIG-GUID: 4F0rqbUnZ7UksF8-IIoxOJAB9lsgTUWH
X-Proofpoint-GUID: 4F0rqbUnZ7UksF8-IIoxOJAB9lsgTUWH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX9JlI7m7mlx2Q
 Ewv2i9y6Yqi01U5Y8/QHrywQ0Cje6nq3F9tAJXVD0XEx+Ot4ExolrqVuTrpdLdx/+ZbYEDiddoU
 FKeFeHHZ08RjMlTV2pAQCEG0vQS9AwA=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac75f1d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GftUwNuSPIKaBOPN2qUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 23 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 42 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index eceb6e0ca6fe..40926d1598e0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -195,6 +202,22 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-scl-pins {
+			pins = "gpio20";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		qup-i2c0-sda-pins {
+			pins = "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6440853da8c3..50ce79219fe2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -427,6 +427,48 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

