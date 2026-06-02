Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25C36EAA4
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418060; cv=none; b=KV+N3Jy3k8k4dr4gh8dgfsGZ20BK8vf8GJ/NQSV6KEfwthyBOJJH3Be+llKJ0J8LWrkOYZtWmqhXTwEAkxiSfpgGUWbvfV4H/CvEg9bUbbLCvRkaQl7AxCgCghEUoYR1VpcQ8EjaR3JoVQEmMCujgqYEBp01MmtFSaxg1KjgIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418060; c=relaxed/simple;
	bh=vPRuCmZhkBUOBh0DpMYjVuvAm1ugsgfsEoyTKkJ4wh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mis9VCjZ/ArMuHC4tU3bzzyB9JLc4hxJhT6yM4qvlHqH2hV/XSvOjAMmn8elN1LAj29Q6S+bb0jHRU9m4KQImBzUxLWh9U613izWBga6NwwpmOd9wFW7/aOCU+80uQB4qN29005a0sMPsVTiwMtNpuTu3/+5xKmfdlCAPfq5ALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oozikyH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwrmrCuT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oozikyH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwrmrCuT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CGSxq2767712
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 16:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=; b=oozikyH+x/N680dA
	P0tdpxSE/hgCFS55VorVJJT/7fyS4iu57ifr+oQOGM0i5jeyes5BmGQIk9woUfxB
	2KltE9yeQfX8JphzmsxuFe7PsaliWKEOZ0haof/QD0ntRKyJhCWX2tJ10y+NhDEm
	A08QqZLg7VJ/7m2fhnlQu8x25RoLfFn6Ba2USFaV8CiX7KJCUBFjit5rt/T2dAVE
	4iykF3gF/MZ7+XQAtj5co5o98Ue8yGNsqfRpSDL26qF7C51hd5j8UNsW/wpRQTLb
	mtdjHZccp+Z+zeWb1N3vl2WLnAPOduevj5VJn85iPn03EDnXS32oqrcbsq43Bnfv
	QN7pYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus2hkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:34:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8424aac207eso2382636b3a.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418058; x=1781022858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=;
        b=OwrmrCuT+z0f1Q6j/enjKz00Teujbnen9dWN3H8Midt/zl5WkD+q12q7xJZmBWdc16
         7JDriyhKNmYUw4VVX6ePWQulXYzArSvguq0ilC/XNHn0BriduwZFcWaq8/hsdP9Rfyth
         tmJUr5Zz+bdGNdrWR/2/OXVhXNl8neQJXg0W5LSog42QErfTUjUQNkr26/XnEb/AoxHU
         0P+NR73vid0GRXjdvVG5uGx+o/tbFa6puHxlgIMlXgjuUuZGNEzFd8GyCdt0hHMZG3yk
         Fap9GsB/RqrJ0h3O6iq1qU+nnJRqMfaXWrPOsgKbjc79ymOVPJomt4TEsGQq6Vy4t9qT
         BpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418058; x=1781022858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=;
        b=VgJEb//Qsb9CYpBVTbItLn7R2NNf3Z1h4P75qEziC0YuBPNeuhAk4n4DiAP8/3W7Ug
         LfwoZajxvS2XhQWmsLBuit3oR3S6ckCwhxrhw4MwM7vTiL+G9kQ7EaS6mLa0f/hdGtnr
         EF546if9y+2/OlTk/SVk29noRTViReh0teYHYqvReO3jboy9QSweTXQVjnqCG5EitJq/
         9PqpQW1Pf5UQDtoUOw77AIL3t3qU1udHZ3bS3iHmRPSUsqzQHzMrBvhhxLrB9ka6p69G
         /m6OU1rpZ6D81oskzjx5iQxYO/B0v1U+yvm95UNeZrS1uHszqkt1kAKMzjxX0oh0ll8P
         oTwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PCpjINssHy1HlY0iUhePp2IZPVKXLRRQUOVrWxq5ggE6+z5vgy7HbE6GT4m5GPyFowT4QB2JIIuru@vger.kernel.org
X-Gm-Message-State: AOJu0YxICCchactBKXr6A8USig9qReqJ/oUFzDanGaM5vHCGvdOzZW4K
	RheUYyK3TZW1/jRzdVhP6SWuSfhPYwgaaX3OBMCG+Pp5bOXGI+10qD9JCNIj1OeZpJ2B7X9XVpl
	Z7kbUwrrsNUmI5geaOFYZx4q6ejVlb1DBT0O0glPX2CRrBTghrjuOJd4c9nhFEPGl
X-Gm-Gg: Acq92OENkaOj7dTWNEgOHp/jw1gqhsG9ZUG3L1NUuScfdeQwV702Tr1fRcRf9dV/Duw
	+93R6T4xBWNxdLhqniZBe5sETsU+fH2oeXDNW386fVD6gZB/Shcf5wpo1jNreO7aUaXxkm1jg11
	lnjiNRZEMufXFcIDp3bHu6QBxKgdsTGqfMklDcB6vIFd91SdmtbvSX1hYe+DROCCuwHndn3ZDzx
	9RJyx9x90R8qHoV+EOI2hg1H3HWjT321mg6YKUvFXgg/Ery1UUIA8kZXVnXg/whp63LMhawgoBA
	CwrBCOR6FiTGuX1FFfdb3H6GSSmig/A4VlqZERve+Q/DJKwx4WQ3TGEwNv/c2SXBT0ww8a325FS
	ppDbAGjLtnN67aBeJzRcv9JSWPOKn+JbXOYClRWSy/2bEn76sbVoIbS+X9bQ5U2a/4RkfRcfURW
	lI6joyFPRaqJHs4qmCozFSTiG+E+DOxTM2q2dpFkO0rGGc5NkiRlo1WHDsY290a/IZcuo=
X-Received: by 2002:a05:6a00:1d8a:b0:842:50fd:4c0c with SMTP id d2e1a72fcca58-84282ec21demr325675b3a.16.1780418057985;
        Tue, 02 Jun 2026 09:34:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8a:b0:842:50fd:4c0c with SMTP id d2e1a72fcca58-84282ec21demr325648b3a.16.1780418057342;
        Tue, 02 Jun 2026 09:34:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 22:04:05 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
In-Reply-To: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: M15XgpISNwS0a16PvXABQdCvi9M9NpX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX+Jr7p4e4MOrd
 TyUji7+BoGYNVVTBhgHjYXOSXiGIKXSMtea/yqN7SHFhK69IjWnDsmzIXhbXXWCfmZtjIrdX9jV
 8uXR1qryNgEdTEp5IxQCqRaQy3ccWiDfNGZ6T/4kxSZw82XanCLbQOvASqjGPk5c1pVSIHTk9ss
 0RgQ5cDxI9WYGv0S4rAN6CKNuB6/qFd8n/f/MXQTM6rjylBaQrXKoOlud4hrdMODQs7emMdG3Bf
 43lQiKHhYRUETq+gYdTu2//fb7uQfx4dV7EYz8ltRxRVZYv+elbNGwxxFquZ6by/0UqXq3mgKwV
 VuZoT5VN/IUdP+wEk47sd+bww6wjxhDs0kVnXmvzsfL5vcu0EKeZYvCpbSZaR2yS3oUVbE9yLQd
 FDN7/kJbriZOt/BMI++mY95Q8qD+M6r7VdgUlc1Gug9a9D4lKTTaI+8u+dSMujaqFZH2iFa5zrv
 Yas3X4YOk3ju6p5XDtg==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1f060a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Idibcdv6X5oFpS-TOoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: M15XgpISNwS0a16PvXABQdCvi9M9NpX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020160

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index de71b72ae6dc..be8657239c46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -86,8 +86,6 @@ &pcie2 {
 	pinctrl-0 = <&pcie2_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -95,12 +93,14 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -108,6 +108,10 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
+};
+
 &qusb_phy_0 {
 	vdd-supply = <&vreg_misc_0p925>;
 	vdda-pll-supply = <&vreg_misc_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 876bf6a8b8ff..6635f9259bbb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -968,15 +968,13 @@ pcie3: pcie@40000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
 					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -984,6 +982,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie3_phy>;
 			};
 		};
 
@@ -1071,15 +1070,13 @@ pcie2: pcie@50000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
 					<&gcc MASTER_CNOC_PCIE2 &gcc SLAVE_CNOC_PCIE2>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1087,6 +1084,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie2_phy>;
 			};
 		};
 
@@ -1174,15 +1172,13 @@ pcie1: pcie@60000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE1	&gcc SLAVE_ANOC_PCIE1>,
 					<&gcc MASTER_CNOC_PCIE1	&gcc SLAVE_CNOC_PCIE1>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1190,6 +1186,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -1277,15 +1274,13 @@ pcie0: pcie@70000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
 					<&gcc MASTER_CNOC_PCIE0	&gcc SLAVE_CNOC_PCIE0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1293,6 +1288,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 	};

-- 
2.34.1

