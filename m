Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2083B14D4
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370412; cv=none; b=Nr1qX03M6OXodtWs9TpGmYXo/iJqLJrPL9sQDdYvLEPqciP6nzRf7IKDEigp3uZyRb8gkEGsCOLCsk28OMOr8nrSqCRXxO+WQLFybGtvbA889xHgAjCFRQTJpQN5MEvycZ8BKuLDhR4C5XQkbkmacF14QdhUMT6Px4aUVPsu9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370412; c=relaxed/simple;
	bh=Rl+J/TY3WCJjULXucouqjDwfG6dxMJVZqai54QMsEqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cws/bIAOXhSgJowEk/+H7wPQZ1tvREsvan5/rRowzOSddeMdfEo+UZG12jCleBK+AUDNd7x/5Ads7kHNsYmFeXYh5vnS1XdII0FOr19oGH5bBz9Iqhjhf0S2uMTj4JFYztZJJXSnPisaD8kzW+t78bvrlIBKyhK2pdDSeBuanZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0SOImbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkBHNk4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0SOImbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkBHNk4s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwCC3739615
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VXUIfslsErG
	c2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=; b=F0SOImbwpSYsZf9xadBROeB21p6
	Lqz9XWyDZocLfyHuPGTrc+XVijivBuqHD1uCvu8h++pX9csSdd8h4UhP0xUtyY3W
	t2AWItY2O89HHgLQqvk5v/y4GYzeuW+HgYWNUFO1hEjxYC82l8LvoPN3suedG7EA
	6wzbK4PZAd8GspWRSl5PpoxKUFUT/exfbzWybdl9uNtd35vL7T+UZ+MzjzZexTLE
	FQdjA1cg7V607KEGMREG77v0kK4ewqYRBiMaS1SMEh/YdmfD2tHpt2sSz8nr1POS
	35Ye7AWKQf0OztpJhjV5dnESO4CTeRgzi9aBnaorkFX9YKmxxAyH0Y4RB6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddfxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:20:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3041492a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370409; x=1789975209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXUIfslsErGc2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=;
        b=KkBHNk4sP3O8ZVT7zNuHYWeG526q7Njd81wdQmufP3YVMZ8JIsRxYNNImvdAmEdFRj
         O29gkf98HYj/VFrJtYxpOYToZpnObvV9MXdsYr0o70gaVpfpK/d50/DHQqJYRl4Jtbuk
         DUDuejhpOvsLGnyG6bNhLw0ob+789dhWeZ+PwMpdbZ9HL61mu0p9PNuAR5ITzmzl5Rnf
         UXifKCqZQ4HxY7ZiO5QsqbYwqaR83U5ZzySbDrmOv1C706GeW5TBI4LZetQCx+GmOYQ/
         s5VHc9L1rs6mHOrcds76/OT4P7v5BKmosKHzYV3b0oI2E9dxky8g5mSfTADDQWtpj/l2
         7SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370409; x=1789975209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXUIfslsErGc2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=;
        b=ai7DpNfgYed9wE0785oec4lLO+rvAFMEK4Qfq/YL9apleOefBoMbbs3zCUqqEqMXFb
         Ev6eH1GHqRyHrnb+yADrYP8OYH1gFGKFnx9imX1gea0dI6f1Hjn4S+v5Z2n3nQv2OxXk
         4vdr2uDJ215RJJ8ygts5fmCrA0J9BJicu3914oENIhSQxjV8ZXZ9BE7ODmWcUiXigF18
         kXSqGmHcB1nVWxMOlSJu+f4bc4aAVxncbDTPX/Icmh3ENV4D+mqQF1em8wmE2fl+ZH7G
         +F8BDLlDtrCNrQEobohbgNHOw3Lv8ksBtcaUSK0zfDXM586PSByi+Qd1L3fs6xIX9Wq6
         1b6g==
X-Forwarded-Encrypted: i=1; AKwUvBzZIWGYkGIfXrA71vWqePymVW/2U/72lJQbQTvcEvBFxteynRrrhKoWsjGBVC9Gy5JbPe993GDql9+W@vger.kernel.org
X-Gm-Message-State: AFuF++nYU+klmElbz1dQgyfV/zMls6CRGyKiRWwAl5WYTs3RSFle4NNO
	onT5Nss9QsJ3CyaNg+QOrQA1iTUo8qa6RtZaIrnKTBliu22zUgSQ+vgOR7QWLcy9X/MOEYuT66T
	HH8YoCRfqD1BGivRQwqdYVIzShvEmZ7cupdJZ7lYdNmoZPexhJFBLIKoc5JCaU65z
X-Gm-Gg: AYBFou33ADSScjhCBiqBwVcmaf7v+VvoUMrUwqSOIEteW7SPQTh0uJlYHm2FoiuRTe1
	7STpJOQdqkZrrEfe0kFrSOSXwQJYmurRHjqZcZdXfIAVOEnBbT/7gqDBGEuhDIbjmpiNlnF0MeM
	oQBf7tAghaXekD15O1FyA5yKu3zdh95qzQ4HLFUVWO37/Q3Lj0DhSumI9cyE/z0T/BAgCEkSBd1
	CAsGZC5PRkRSgUeWe6zO/i1op1LrPiY12RRln6Ie0qhwpBps636zXi6yneedFhZO5JqgzYkhCUL
	+vc33408ZWBpNLQUgBkXn87V2bF6Hn6pwR9Tbtz9tYU8/Kj01uGZblStIOZOUUdv/5obSIv8jwo
	n7vqM6kN4LuqWhElpCtSoy9SUBh/RnsLxk7kxx95Jbd2wqYQt/OZgeXoPR7Ni
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39debdd2283mr3055260a91.0.1789370409275;
        Mon, 14 Sep 2026 00:20:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39debdd2283mr3055179a91.0.1789370408719;
        Mon, 14 Sep 2026 00:20:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:08 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Mon, 14 Sep 2026 15:19:43 +0800
Message-ID: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX3QRBul+jquZw
 JKhnr9De3NpAnMhiaMKjiQWHr9ljBDpWqmEJGeukBxTEgOadwGKAJrd+K7Zofv0ikaC8F77Gq/a
 JR0A93vtCB1LR5coDFA5FmYXshEEvYrpvOcVcHuVZzdavlKYK+S1BnEEiPV5136x2y1tPI4tdGj
 PWf5L8n+xxvnZ41z0fhlvW1KlNFnzf7neSZfcEox1MYQBM/BA0daAp16n52xitM5yLJMmii8tHZ
 s8h5npqVqBhDRCTqFV268IBpfJuqgyoNo1Ns1+mywCJdBVE5teOgYh6xLDKwyoSIJbn5oUMMrvS
 riTc7vliMlOeBS7i4/MOA2P5iPp1j8TBbVzFbFEoh8TbZq39KKCrC3p26oP5IuGU/Wu3gmo2lZ7
 ++ihEUW6/1bExQAz46o3g8QE6vqiKB2BwK/bEs48EGNOZFCd/hR3ZN4402Lr4EwNHFxbHm0Fuj3
 2VRfPLWnYBguStlfMQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX/D2fMypXtcth
 SBGsd9UcMaMoBtchtu+S3Hy3PaslycVL5nZrSoUBljYSkvTPF90voSkkApdv6KdpJLCPiljS6WP
 SNyLqmNWtUESr6m2QIQXmLYN4VRXjSo=
X-Proofpoint-GUID: JbLFunsCWYRwDcUCR_9gTCajd95GMH1m
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a02a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=btXJogeg36QJwmQpmpwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: JbLFunsCWYRwDcUCR_9gTCajd95GMH1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140103

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 0b230551a49f..38d50f040c4d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,93 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+		vddio-supply = <&vreg_s3a_1p8>;
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
@@ -404,6 +491,21 @@ &pcie2 {
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

