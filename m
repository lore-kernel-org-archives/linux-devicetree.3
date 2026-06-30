Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5845BD7B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846252; cv=none; b=JVmGd4pv1yF6/ZtmZyGIrwpnDShKGEPrQQTsExeh+rZBSHd8CyUEoz6+TaVCx3Ur6JoJHSVHkKf3jFaoMENoOQ8+DpGe3q9/fA/ZIK/HRMiYM34XzXhl0sOzR4415DVxsGeZ59hDgxn+7NgCFFyXVmz0PSn+CvAufq1PbodqPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846252; c=relaxed/simple;
	bh=rfLV9qzeyVEE+pk1IMc0Mp1Nf/yReQZxa7tuJDB2tSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1xbOu4MaDXnJsHoutAAJLGVBVpuycRhDlgRMqqLWr0cUubWUivPujbC5gNQ+OPIVYF5+WuSdRuHdkhmnK176H0+zttbz8Fwu15q0/c7yTkCOM5Hix1Z5QD3V5EDwLimgezxU3PjImFUiERokuW22Eo8COcMTIzHI84vc8FrCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAPeCEuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0lnVqHv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAPeCEuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0lnVqHv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkjt92730512
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=; b=VAPeCEuZ0DgCgCB1
	oN1lwiiTSxCbDKQFWRJ/WKu1qPmhwogCN2gcXw2jfsmgIe4oybqlMNp/zhz+IUn3
	O3niKUhme/m9MDLOpOqDy1DJKgxYkP3juNG0gzHSL4z1RYrtPUG98pxgQlUjK+Qt
	3l9X2xDMWwSdlauu46MB7uBuLaMeSkc4XdpRznbZ1wL9VslpmcUkfe6RCefJsNIy
	iP2yp4ClV2HeXPlKb1VtGmoGBHbLKJA8m+13EtDajVi+n7T+NSZXA2eDIaSZcbEA
	HaA80zubri5+8ip3m6FGcvt+n7v+J6njS0WWGrNkJt1akawRsltppFVxcT5QZWV+
	gXNC7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99gf5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:04:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so283168eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846249; x=1783451049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=;
        b=H0lnVqHvj/KLcDrzxwyMiyXMl8Fe4DIqMz9OzQHJlnC7qlEHWfRkiIT2rkIRPVBFRz
         komJmx/15PZ0X1XWRlA262NAEUNpdw+eux6e0d/V5kGvQV6EF2JYB0S3pHBrjFKyETls
         +HDCjflA/xIq+uS9G5D/8hp26q9NT5f2Pdp9Q9VEOzlCfWxr+0ybzdCL6ehX/hvm+RI0
         91oh2z6rusCwv5dFz42yI9aDBWAscB8EMibseqrr2rW9Deruj2cbb7C97vqYbEWEYkci
         gDyDMW/PoZ1cfmKuBzUAiS1lVyKXkMlJBRz7oCsW+pTFFWD2/abh9mKXnauN/I1RmVbQ
         nHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846249; x=1783451049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=;
        b=qh8Bzo5KDPr+xi0K86B07/jyg+OERNO6L8d2YzgR+TD4ObdUsAe+RiR2Zz4qC5X7kY
         k69F8qFxwPhKr/DM6sApwQCfA2rsX+HXNF983AxRL3kDcc8kQZFxINJ7e452UwBO2Lng
         sg9vB6/aIVUhJFSNwZSb4Ie6DmVxE56mh8BszE7CdCtIjlQsdQI/X0WYxpIFQaYJIIlw
         mZrCDgJ8+S7TcycSZY4AT0pTXTvYRhtM1irno5nkF/dWqmgZkW6cygWNh3hjIZtHz+Xp
         hDMoG/FhNp8+7EAsxcY2XfGr4/Eyx97MoXSHyNALyxyxmKCH3LyoyXJODRWzupHcZJTa
         CdIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqgesoOr5DEVAUi07rz4ZpKH1MBXCMdB9ifXfGsJmJMxrK8ufGfcDysHjAFYtPeZoyOJIcrNCukX9q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpf6E7DnxDT+8uMGQMQLQ6sNDhHsn5XPK5/Mnuq2Rnsr86PJLY
	dcBLqs9I6yhlRiRKpAY3rFR4EDFlustk2yK+hmLaugR3fL7e+EuwLV6bChN06VTIZ92jhk9d1+F
	6U8BPLDfNnR+QM0snnvSMBDcoYLCaPoRLOiNkJdsyKcP2E3N0M1ibf9dVlv3Dgu5F
X-Gm-Gg: AfdE7clt3LkijDCM6uxVCrOErezmH9cuS9vjqO+B2/h39Z7trSlhjNNEQKdI6+8VyYz
	dKRb4wv6ZDx3DdRmg/rodsXH8olxOpwMJIzGnPnbfXtEdz5/C4Zz2k7+qTi6c8BSjmQQuWTqe/i
	ZsVaOWBwzODwYgcOqgE9zV5LdVzJmHxgI3XhzOFIWt0x+iBSwWrvhAB8b1Lzlxp8TomY6ZXiIXA
	C9J2sNaYSPtjcA5gi/LiEq7cLBMX0fVxHAumkUH2FnaxLbO6JO6v8+Z7zHGLOyiSPxHhAvEGcuH
	TYzNENbntrH8zF8CMq51knfOEiEsbL3vFSYFckGy+MyuZQHylQ7T6FreqO/9Lwif6vjaaFLCstv
	8389LtLYxHQLvDdBcwXOvFWtbHD8Oe8RN5nv8bgNlpezaGe4=
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4071305eec.16.1782846248964;
        Tue, 30 Jun 2026 12:04:08 -0700 (PDT)
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4071262eec.16.1782846248249;
        Tue, 30 Jun 2026 12:04:08 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:04:07 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:50 +0530
Subject: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=4426;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=rfLV9qzeyVEE+pk1IMc0Mp1Nf/yReQZxa7tuJDB2tSY=;
 b=oUob7v7F28cUABDjOIOLA72w6G9oYBt8/wFYAIKsm4HoxHeUpYSDtkdHE8WaX7HJnWbUSkZYJ
 BDLhUPg4TBMCh7vNBRyUe8nK6MzscrovApSt9l4cyqO68PE/k3GKCzj
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXyH0dij+Q10+b
 /HN7hQkdWUTBkb7r7jGE3zPYCuHtXxrMH1tYfM3ciPBG7ZerjvS8aLp7oMBNiG2z6VcoGyzhigY
 S8Pk7gGg695jMygl/rFLFHU0G0RH220=
X-Proofpoint-ORIG-GUID: pFBcSOjhMVITN6ojEXELH1cEqx4oYeRN
X-Proofpoint-GUID: pFBcSOjhMVITN6ojEXELH1cEqx4oYeRN
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a441329 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RBLAtJqH_bkH6XPhXP4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX8hA3G1Uz0wPk
 9PgzEusvKFLH4QW0QaZJnlzThULvXdNZYXFzbKoPHQZzLRBwE1X5s2xXUVoJDw8JCGlbmyrP295
 f71eW61qgvFYEgE43L/O4M66i0TXOnGkK0I0UT4GKMeDhiFRqVKWyEtT9Mxr/znqaL/wVOy7JDz
 Lqo4lwQ+iN6yUnjJDXy5wAbPb0UGpeJpnhow+k3figNKnO/fBHKqxp+KVZX+ER9JuvxfneRPG87
 RycWFtwvLwrEZpKKRjswkCpPYJXfsZyiYAJSrjn2MORUgMZVJHQPSK3tFZwDlS8j7F7SohMPsKx
 vbmmcQMD7Y6GWHljBLgr2EIoXWbt46UpFcIFcDuopvgpaxLF7l7BxuqkDbHxTJP8OIeUITfUK7Y
 0AjuAgzpcYSh6TruqRLgZlPw+0bivLG/Nd53aMa5kOiaKrxH9Ls6v+lLzIcpGUoLG9YOlTgTgYi
 OwTZLRwc4or7tCj1vlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Add a node for the TC9563 PCIe switch connected to PCIe. The switch
has three downstream ports.Two embedded Ethernet devices are present
on one of the downstream ports. All the ports present in the
node represent the downstream ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, which
are on by default and are added as fixed regulators. TC9563 can be
configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 152 +++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 5411f22426b7..b6d24fe5fb61 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,136 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+/ {
+	aliases {
+		i2c3 = &i2c3;
+	};
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&pcie {
+	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+
+	iommu-map = <0x0 &apps_smmu 0x0800 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x1>,
+		    <0x208 &apps_smmu 0x0802 0x1>,
+		    <0x210 &apps_smmu 0x0803 0x1>,
+		    <0x218 &apps_smmu 0x0804 0x1>,
+		    <0x300 &apps_smmu 0x0805 0x1>,
+		    <0x400 &apps_smmu 0x0806 0x1>,
+		    <0x500 &apps_smmu 0x0807 0x1>,
+		    <0x501 &apps_smmu 0x0808 0x1>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_port0 {
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c3 0x77>;
+
+		resx-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+
+			ep-pwr-en-gpios = <&tc9563 2 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&tc9563 5 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+
+			ep-pwr-en-gpios = <&tc9563 4 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 
@@ -10,11 +140,33 @@ &qupv3_0 {
 };
 
 &tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio117";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio119";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
 		function = "gpio";
 		bias-pull-down;
 	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio118";
+		function = "gpio";
+		bias-disable;
+	};
 };
 
 &uart0 {

-- 
2.43.0

