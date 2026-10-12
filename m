Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E736D9FE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789815; cv=none; b=HAjmcpW9REb8+XPRuJqpKmm+FEXtKjwFBDeiLa9TCHDxKGZt37jc2ZkkJ/43arHiW4+1jhiKePFVHySMUYXFDNNswEsDWvAZmZxJFYYB52tubz90mUaDPyjIX7phLDpS7+6WM13Y4djVTVUyeWPiuGNbXQv3yOJtGxVO7ekNeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789815; c=relaxed/simple;
	bh=5JUdAanaiMiwR1iB1aPEj2+csMyh+P5epWoBxXQKgLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw23uYRJSOUQvMwOhijZBFaQfhaDOaY7kCevH47YraEEFMC7934/wweoUzn5nCBLnOTZkekAZnZTMZ/Psi9cL+piQ2VOuz0PMf7c8+MjNN8p/zG/QkdtdSMEnDlngn3qpDLbWELF8KIHGJdwNOzJXqWuTHVGpe4zrAoPEmRst+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gehmW/iD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffdLt1+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gehmW/iD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffdLt1+a"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55ouP1339373
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=; b=gehmW/iDAXmKff3d
	AlCrobZ8W2weGH5uHt/K2opcHmOyVwUJ/dSBRGkPCPKBLN2WtewARYYkPSYIBa83
	24NLFgAOJwjtyiLILmJ+24Nkpky4wK5BJrMjt8qw/BqJqDnxADvNZ7KaLdlYICzp
	j9V8n3J7euovc9FbK75dwaZVAdkuHr9LMU6rUeG/11QTgFywmasc42D7WMZkS9hA
	BexVH1eiauXg+9Sq3sDuND6AvqhbRN90E+YtlVQZlPejMbpo0O0k2/PUfNRDvDC2
	vXYFI7f+vhNPDOXZNB+07/hn/YQgEa6JPOoyIp4DgkrZZN9ng9V0mLZqpIzmVUFi
	L3Gcog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25btn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35b68bc1985so242316eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789813; x=1792394613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=;
        b=ffdLt1+avL3DeYHRsWK9b2aNpqE2wRr+ZeMk96An4I84GMAsi7gjkbyqS/YcFtwq7e
         +od/mFXgLC4mFRnvCVOiWRDySsvgPqavegzDgU4wrQk552SG9PAtRUr/bLdqjv/Y4nDH
         0JJl6y8S6dJdHkmPUZ9B5NdNGpESYxCjBPfn6aqVybTxotbo7IEqL7PYwfk72DwHZCTw
         pZzd7KBuyiOYf1NNLyyYU9jSJmuig/sdM4qTZrB1/uA/Sa/d5kkAkTzo2OxjYuT1J9Af
         in/qvvX0T+59yL28RGCqyC5sTE6MX1wSAJoIVs+GUxnqIFGOdZuG8NdYnKM2yPQ9rPTo
         mhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789813; x=1792394613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeVsU2om/0Ysp3Ac5o6eachP5fErzwvxEMxXU7LspME=;
        b=n69tAi79tLb1bJ0LlYnMfjPJ7sWmaF/+T5yf9yAk+9YTJim8yo02lkZNw1BbXzbjna
         IlbJg+zAID9PSQu8VBJUcBd7GQKl/3Y7d+bG2K7f2Ok+qxFMwAVYv3AzEFa7SCfsdScc
         81JZ1aB4LRgpsDhiPwrd8UkY4f9tZCT14pl4Fo0R5jUqm6O9eSVvzuXiPwyI+lzc3LL7
         2HgUu9BSRQMyWD+UHWnAfR9778wmlESzlCYp+3w02Z6BYDxdFUAkkPNPo4CkgsOmCMPt
         i7NqK/Mu4dYjgZcHCsK2TVBD/uDkTPr0Z0R7r5u30bGqHrewFDd1MY1/h/hiLjHoQFh3
         yyRw==
X-Forwarded-Encrypted: i=1; AKwUvBxrA0FjN5ix4sbqIpVTuWUVT2yBe09rlhVjl6fqEElapn0RoVdoEVWXmBWuUYwRYsNlpaqpqbbxxK10@vger.kernel.org
X-Gm-Message-State: AFq9FYJqnWskRSSvlO5SDKLFhmtDf9MKNnPuTpp5sU3EHAw2h2N4M+up
	jTefcG2kgP+YxoI/7ukHs2lN8B4Qg6/jrVIq9pmExwx4L/esunZnDzj6eBvaN+wQ0Oyr8bJSfxy
	O8E9p81ERqNV/Os2/NzcPm2/bzSfQX4cWgZkUjO/ZiTTeB3id/fkDT1eRBnHHWB/3
X-Gm-Gg: AYBFou0wrRw8gEc2+TbvjFVewmoMqkbeiiWzDn+FvLD4IXKvHcqjc66/27RawGK3R0B
	mGUqvnMDALssYlpJycdtyibEj1VDB8nmUpfbr8rr0SeSpWlqHaB2isx24uIi4Uw7+CnPbsDc/Le
	VT1SfyzFwqzy/dqvXO0hS+iNMnXpEVlXzKMTjx3Oj6t8fC87R1icgzqPrz480sUZ7bHJhi3MXtJ
	dEpOwLnB6ZZFvgczMLpbGrRSkFdRqGM3g1AW/wROnWeeoZQvComDrJSX0/Dz64fWyfMUUABhTAd
	OnhZxTQAVgWgfTXT9SuH1jPhYcy6G3eCJIDwNCPErn37JCtt8CfoDF0fZIMr9Gcixt+8NYCunfp
	s7Emsd+RwaUcS0ktg3nUftOppR+gmhhoftkHZjAHNF6OtoYPQAIqYNnL24BeIT2XIQ4RAQcrIQG
	AXeh2YB4XxXuyykorY/tj7sTk1EJns
X-Received: by 2002:a05:7022:ed06:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16a5ac102d3mr11247430c88.4.1791789813136;
        Mon, 12 Oct 2026 00:23:33 -0700 (PDT)
X-Received: by 2002:a05:7022:ed06:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16a5ac102d3mr11247389c88.4.1791789812538;
        Mon, 12 Oct 2026 00:23:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:06 +0530
Subject: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7nPUv1yxZcjf80nGK2FP7bScX6ci_4hD
X-Proofpoint-GUID: 7nPUv1yxZcjf80nGK2FP7bScX6ci_4hD
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc8af5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX8G9L7ayGsZCl
 jxWCUfm/iQuq/cmoniYluRv70GSkK2xaS2rw25tO+wJRyeo82RlzWcCCSucuXWj+UsiqTq56Qy0
 4azvdLOmskwbeuLn5CfCt8FhYPZbhvf1szVbRCyWJqFiwPSkCN1vkcVVdaTfmvhHV6vXZhyz+gl
 ZRewxw+51CAR1daBllGX5TagsOKRpbCO/+gcGZ5iIFbX722uTqR0kJbpN+IBieqcJeivPeJMES5
 YykpZS4f/X3Y+ia4g8F9qYYDZOWl0l9DFTZb2qZeGlyMHCC9812fEuPqFjaMGhtbg9ZW0Z0f5a8
 5NiU5sz3zWFTTIoYMCqDh+D5bUg8PB2giHFNVpCo/o2g5P/zzs+hjtNabEBCzl69R1kkBeTM+cY
 v2+59eV2ir4FQy/+iJ3DWOcmMOh26eye2+kmNkyqQSysnU0BNRQsIkHaKaXjf8xrLhX1zsRynKP
 EHiokvIwbXmp4Bdl1aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX9NhqzLutjRgW
 T3mRwS5l2z/r5bNMF2zS5HqSyqPC6jJUIvaAngSncRi+8obYNsMK1vvLutOqmecKqTLMbFSTSIs
 zSV/piTLUp/+IT8m1JkfjfSvYQJ+mWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index d28d68a10958..c14b42c22616 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -416,9 +416,11 @@ uart1: serial@1a84000 {
 		sdhc: mmc@7804000 {
 			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x07804000 0x0 0x1000>,
-			      <0x0 0x07805000 0x0 0x1000>;
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
 			reg-names = "hc",
-				    "cqhci";
+				    "cqhci",
+				    "ice";
 
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -427,11 +429,16 @@ sdhc: mmc@7804000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
+				 <&xo_board>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface",
 				      "core",
-				      "xo";
+				      "xo",
+				      "ice";
 			non-removable;
+			assigned-clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			assigned-clock-rates = <300000000>;
+			supports-cqe;
 
 			status = "disabled";
 		};

-- 
2.34.1

