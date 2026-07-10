Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7603F20E8
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674310; cv=none; b=WIK+KZNNMc/tB1HHbjzieYiZ3SLaIGQbBsFnKWlaZo+VxyowfxujHoLoJljLegxLrOLfYwiLSMGjRgwhs1lWEQxPgQpjK7bsNzBWcGH9pgKibCUEH0jNvDqB4c1RZabkkaatOrUH2T0+mvC3nZoMr3IeoRDi0zx29S+LbI+XAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674310; c=relaxed/simple;
	bh=SzvTslI/0rJw+ojS6p2oVMofrR8mq52q6PRHLns1hqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSX74d8XYGb4oYrO8jglDJgQddDnkB3AySt+hU/8N/QZLnbvbJH2u7EH4ZBYht3lMQPXLSbnV6QbAo6HXCrXk1/KWJjxMmHopwfrq8MTWKkByOL+CFol8uRvhoReAActA2upBTZpVq+KhORjvRwT2pGOku5LGKMBpd1rdyu+jiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6g0Ju2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW+em/Ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6g0Ju2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kW+em/Ni"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dS4p4156484
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=; b=b6g0Ju2wuJ4rnKTx
	F7t9LsGn0cpBhoJgBYJQTCK+gDqmIjHboPgtuR0/Uqx3DP2rxw1Jd6qLXxIiVZ+r
	EO7v7SouPiOtBXF7B4kuqcLScjY7o9pz+pUhwe6zyuwImHg7LEVeKc9jtcI/IBW9
	aF3FvuKg38GE/eb1NCT4nefkHM8YuWPOxbsuHl0UBBekQOGpXMoOiEQvJyATnFGd
	iVk3eVTWDZAZFu6bpNbdbhHzA/0BBFn0O3/9VO16YZ4Ty5Sau8TqA0SmAoURGdo8
	mj5NqNH3huYpzuZ899ngpQIO7dKkQCAB5p+f5IIO69V2Jj2wL+kGfxIHO1v7HCUy
	1KTgVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jhhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso11323011cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674307; x=1784279107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=;
        b=kW+em/Nia1uxmyJ6BhN4NkF5Ha4vQum7wwruzfH+yKkiYnVbW5Nm1Ipc8QsPEwzQjb
         hDVUaYUCujF3DlHlsePCoIPr3ueToNdcDh8ZGR4pNL8e/EqnfFence7u5UW8KigCqld9
         NFwuEWONfy/heb2RYPf6j6QyMZp/PZPK0WgnfjL7qoiiSRVZZshJVfUAipdA94Mt3Ful
         5K62BeKf1rDVWVo6cexYU2E1GrfZ9n6U2s2UC5uQFAaqBLrtFJnqmERGZA6ToV9hZf4k
         NgmYyRwptybW+KX8/d+0TouIi8x+s+FNM01o92VdyYr2PCTnD5Ral4d1gx48kE9LNh5W
         yyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674307; x=1784279107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4yczvZPnvjUavtM9iyfNq5RJVHkn2SJJHAhN5SbVGM=;
        b=bAuCSw5oCdaMqD8FRFGEtY5xnZfiL/YjyQP0rvgYooCAnwHL0YN5kJjcTyGYSMYGpv
         TN5iBTSlSO0QCu1rcMWPk0tBO1aLmI/ymJTjj1yLW5oW5DSiJNV8RsXY2U/536yAtTqn
         05CAXoyHyqIHTyUiidgRjrsrnJOiWy33jDTqEWdVKKBM7xXYH6/mcmULteB2S/+PbUn8
         EapnC7KnnGVXLyUJVE43rCcso671ya5MPC9xlsTfLhIYW5VLfg4Kh3GgM1jBKHe++jfx
         iRYyf53qbmAqnDj2WEaZEM5sNoOjo0tXLwK61B9/cIA8Y2jDIX4L8oBnVpCc78+U747Z
         0fBw==
X-Forwarded-Encrypted: i=1; AHgh+RqQDe/I74ubVullImQGdXB7sD0XIxqjMJe/JZw2j388Q6/IAKKrOjkQzI5cpKZQZIQEifGNq+hAwuQY@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVrAjhetgvfRqBPZYmSlP9izMdxg/Yc4z8BNlrHkqST5a3mas
	ciXIHpCrbpSyLVpRgG9HQ95nnMtdh6DmaJdJglHmMyux82oAt0Ur99ry2nAp8rRBd0RdFd6FwFP
	5jL3JuibDcmtK8L4Yv31NUYRupsgl4DBaPjTKHgeF5HN5smPP8e54WBzWVsjczTv1E4SNM+fAxQ
	g=
X-Gm-Gg: AfdE7clmxj3lV/3a2zSSLeg+O/K3lDdBVEHSMkx0UbTxQK9ti3kTD1mfWnaOLslcM9t
	4JZzzz4tLHfx0d1zNl4bzIXVhpDms2OlIHcYHW14pqIWuXNo5eRIGdY3AW/f/pck/qQaLFKEcQx
	7RANGDN7dCqXQN4iLAvEDly66SpD3I24liHAJAjrMzX+xpzs0PwieKoDDHyVML484vM4Dt5aF4e
	YdyobwbY3IosfiNKgcbm1CtSuSf3M+Lx9AL7RcSmNUod5AatoUhyC2Y2IgThQ1xos9Ev4H768Z3
	HkjTAVEOQkBz9mc99dovjREpUCT2NDA528ctkiQlSjsg+f6JDnh+U1yAzYcmWr4QZ/AO7NcN1KW
	lLxvy8j+PTb5OOJ3v5zYRJs8MJfS0y1M3ehVI8yGP1ekAOWmLESqK03xeXBpaRoi8YSuNO++YMc
	wpJ5F0Vd6/irW6JsefOpfMvKcjgCLae8WUS1tN2x/009wiVrN0KHw47lYxQDB45Q==
X-Received: by 2002:a05:622a:11:b0:516:dc75:1aca with SMTP id d75a77b69052e-51caa1286d1mr26301371cf.26.1783674307019;
        Fri, 10 Jul 2026 02:05:07 -0700 (PDT)
X-Received: by 2002:a05:622a:11:b0:516:dc75:1aca with SMTP id d75a77b69052e-51caa1286d1mr26300891cf.26.1783674306432;
        Fri, 10 Jul 2026 02:05:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:53 +0200
Subject: [PATCH v4 7/7] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-7-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: okXb3M6nHr9geLR1b26mKx5l4sXxPD8y
X-Proofpoint-ORIG-GUID: okXb3M6nHr9geLR1b26mKx5l4sXxPD8y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX0BF80AEPLSXY
 Vx/j9D7CZJ8xDnooY1W23EWqUXpQkNgSrD553IAB8BMq34T0jZzoyBrtfCfiFMHxdivRXILCYZQ
 HqPTUbn561msutJ+xTGSMsftUKEno34=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50b5c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=iG3BWBHXWT8vAauT:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX0AN6Cqae9L68
 t6G3AY0FbI5GUdtzKAs5OBRDmtYUCDYB/3DxZF+65FDkjXC3hJ3vp3ehawErqEodaoEvUDUumD4
 gh0LGbSVugjLB1LMqBmi4Egzg/hPbe/kB5MoYr21Ozj1qqrKZNJUEvfoHdVTggD5VHQZ10ArfAj
 NGFcWwNbAHsDNZBXgo2HX9XL2U4mU9OpUV1ED44LIAEQimQY2x7WPk9GhUXBG83j8KIAxSAktDf
 yhRpAr1SKhPcePhlfhBu1gfPbiVgpUIvUxVPRMlgEjcA0bpGBm9eHsvuDa90hA/rsDJwvx4hIOm
 er/68b5Ob6QyCEwzsqmElsUiat2eSfM+6HWAoB8Uyi/rDORwblB4zVM6Ay+yLTv2JBeic387ODP
 KHzZ4YfN2goIsA8B01/+Z1/72KLsKkQCrPYMvnLCgLCG8tLg8Gbea/xJEDGoaQiYQmT09FghDwA
 p0HcTxZJb9cgQFzdtLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..87bdf9df4b16f7f1b9a5129cf8cd81da1ca9da97 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,80 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42400 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					      "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

