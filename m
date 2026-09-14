Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C43B14BE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370416; cv=none; b=mntwwGBRHz/wK/65Lg+IW9Ayw9HyY61B5eJNsE0+LRWiJJ+kzl+AaqimpNFh+nsmzV8T/QFdC27yVtMqTxvwByfz3cQ1F37qCSlcvfNMkeBTlAyLbx6uNjKiV/ld2pRdA37OcIpaFKZ9HfPingwC7JzAdbojE2PmdYVQZXnxq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370416; c=relaxed/simple;
	bh=0Dlj55dN3ldy8GK2h2cIof9VUS9RrJVjegi6K0eLVDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqDnrzwQ7pR2eJHlXEVdkOpUrEew1AITIuDT1uJki1UUNWHpoyZxpW2QaQ3OM21psWlMZ9OnL7d01HOCwx6KTC4xWxDC7O76GjKUmk0o0sVo6rqXYiYuMX58F0Nr0NyfK4YGlZOf3gPkSSlETbBlbmhEEWYjcrVpMfd+DKQlqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgGTO1EM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBT9wS3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgGTO1EM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBT9wS3K"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5idxb793225
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1wyaSbPziNm
	UY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=; b=JgGTO1EMCNQeg78mFKCP+1IZomu
	WLP62YhVCgUUC9tEsDYUZS0zb0JheJ0enlWBVHsqhcMepkmdfGTxH7oRD4+cosZR
	i18KCSlJ5ScO703mdQhx8XWZh9umTxO4/tp0CCmHXI9pHYqEgcBmAHxSxfC0DAwJ
	LqBxnSotzAIiTY4WUDupDEpJVqlOQGb+vazmIOfAXH3HViJRlVqAl5AY7aLl/l6p
	scyfDDUC+5d3E7mAnvskuQYHot/W+cccLaHXb8a4R7aQZSfk7p6EV1X8rCt1TDgA
	WaxpEMaLB4+FtqVqum6EJkl0pkZhlN0N5TQ/bJTknzjhOhtFWM7ICpRK0SQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnf3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so43353145ad.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370413; x=1789975213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=QBT9wS3KqJJ8I6wewSv5OZ/OoU00B6P2Jw72RGil5HCYATSDD1T2ThFXztf3d+R5/5
         KoRxrE9eOytTMybM5gfDFEfr3HzTitCh4AdTGpQ3rILiN2/h3PBYW0I1V3brvCn7e50u
         d0qLwlvQXjGmnlYLY08hGUniWBGOe7EaN51H8EJ213NsYPiQMix1iGlwD0jov5xNbohp
         yFP4bQPE05qPznqAof+/QdTP/5bsXA3o1f4GMC5CtSNfb8tptBBM3pw1WnkEqmoXtaJx
         FXzOPjH5sjIW7Xg9cOfv7Nk7TZgz8RQZC17Mk2cPZ4oZeUshnj2Phf5nhOjQCW3Kt4/A
         2DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370413; x=1789975213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=azCc9EYiNaBrCSaPz/ImpsxOJJwbJFiznYjUZsTSgZQ/DrO0UHL7S3mf19jYqAM2ag
         yfCZAxWO/qlTWRoV7OoPXpeQW0sKD0iNpa6/FNGu8XGQ5g4uW5ZyWPQSDbXiTN/X6zWm
         8hmmNIqDVnGwLQj57tTRi2iiuV2GkhT84RbYdhzOF+YKbeay6ae3UiWze6XSYa7b9jZC
         OKbyhnLUfnx8LRlKEMOrL5Ex1uSApZq4LXbB6nAdoib3yVy56jtVn8+UZpZ+WXldXGhC
         upc0V0XAUNX3XsY3QVwDB/67yHH1b/Gvz/NJLluWR9aiIWgiVBsgXASnBLdHq1UQlwcU
         njZQ==
X-Forwarded-Encrypted: i=1; AKwUvBytfWQRt1PmQE7jzKGwCwMRyZfW8U2KEJxTbXOP6krOIKoZkVuQ0QeJ77aXk7vvMAYKTMfvJLWniVXn@vger.kernel.org
X-Gm-Message-State: AFuF++nUNuo9EW+IaNutwFXFh8mxPLAqjJhLY5a26BdIRubG03R+LAbP
	489u0L4kTEphm+QodmtMU0gUFIT3Dzi4+ihN4GdN4UhgbakDpMBi2yKFDqpD2TzQ8GdKR3EataV
	zTLiKPePUgtkzBGqa/J3RrPx844gsdS6P6BnGyjKnB9Q/oCqUOM0mjdomA6KGohQP
X-Gm-Gg: AYBFou3kdmjLio1u/nupuhAVjL0a3b9cIhEGvKygyPGBvmIJbYss+Q3A+hhu2QbIDdn
	FEKS9vsRn8rlBD8F9DKAhTQGoz1kwapkREqXkC3AmB5PDbY/X2dBa6vGHZPrKQW10LCQQiz55nC
	fYkRk1C6L2bB7VJRIgzYwaOkgCJOYwmuObZ4ezwato9L8j0ncaJzFBLQdZYrCODsXaRvSFqGyBv
	HObqaODOa/7cvnvvXSsImzaJrYqkoHZWZTQqoLQVDju3mC2YoGBimFRyA6Px3mRg13vGZHMZ/Fz
	JLY+juwLC9n5uvBcfS8fE1BM0/Yl0mhAzJZ9Ejgh3T5ecv5wBsO8WOOEx+aauhwcyc2feIBa+8G
	/kt/JXqKNOGHeQdwDpCKHn1B/GytKkNuOlJ2f4FEUhcV0U9xFgqI+jd7a308L
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62465705ad.17.1789370412966;
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62465175ad.17.1789370412517;
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Mon, 14 Sep 2026 15:19:44 +0800
Message-ID: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX3ehZ1kxNtK/+
 +RkE7G6TKqG3MKFUb7VGeo1upsI53hE7vksh+Q6s+HIYxPZMS8xFmOo2Qu6oNkGswIWXxvjA6aJ
 B3eqwJb79sQA24qTJuLoe4EVgmpLYgEaOaGXzWS6M1CkApCgNNxVRAC9jaX42qL/D1KhPep5ci+
 AuIqqGGL25rsjqUWrKo9kqQNoWgui0bkBqeMs8IY9hmhjnpchkLUOig2c3MQJCNU3Q7rg/Ig6f0
 uSWDxo9Ec8jtAr/I/79IU5Id5jdPUUbHmaT3d2AQdvfR9LU9qbOeItWp3U69IAWizubSRmk1Oic
 qHH5V/oIO/Rlvn9AVsM518TNdPZwGUoFqq6JiRqi9tmHCm132eqMgW5WmAlfG/H3lU5AMoahMV5
 1J3pgnkb0NfDwmrg4n0g64DeVkOKzt45UPPKA9ICKsneEJCkxIgpA006UccrO4OLvLwZVTWkuqr
 M9gm0E3aoGkgFHW9UlQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a02d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3uEAWm1Q5IaYrG0nJHIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX3xrWBwHvlK2x
 gT3mOsJXXpf45/7t04R0P/t1vns2SUHSPXUy2bZTpJ3/fJDBpuSj2bJxalcAu4q04qzZMVcs9h1
 q2e0HhInB8AkE4DfnelhFvDzG7rvgjk=
X-Proofpoint-GUID: jfR301ld6AwD2hOcTjrUzM4Y8yvTqhZr
X-Proofpoint-ORIG-GUID: jfR301ld6AwD2hOcTjrUzM4Y8yvTqhZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140103

The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
a board-to-board connector hanging off PCIe2, using two lanes.

Unlike the Ride Embedded board, the RRD generates the module supplies
itself rather than relying on the module DBUs: three discrete buck
converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
itself.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 109 ++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 4c4d54d7aa90..c8a6df21fa87 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,100 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_wcn_vddio_1p8: regulator-wcn-vddio-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_vddio_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_wcn_vddio_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_core_vl_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +509,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

