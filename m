Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768938;
	b=oP/IxvO4chJPYA9rKUDk0omCmtQIVcwvoNPJom/DbzShaVdNGR2nFvIgGandnAFNucdK
	 ad0xOreZbmKKJ50J8PhaGn4gSItsiL8Y5vC1vmhFKwLCyRYxDWLFJaDcuIFfYxAXNAeDL
	 iyelpqo1YVKQmNnl7EImh4LYxlD2BFbzgAw0z+q0e27GfB7+Xn8uMO04lP4wg1U2r4ZB+
	 Zv70y0ekk1mstkqttSLDEpOPm3rXI3NtAcpZmp8eVpjh0X8jnqvdiWALKqD7zwpft3Q8v
	 vr6r8cgJSu4KovjcE3zoqpKn6s2l6evOTzU1KJ2AhTCUYqRxMu/wOwcXEuq2inwMOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
	b=WWcu8RmImqtfiOmtoijr3EcJ4cDoc2/j79HJZNGKxIZmuoMySF+4E0Y1bwGUetXhO7yt
	 Zt5Ujr68se/X3Cr6CMP0RAPJ3t6HFMSJD0KxTV4S9u3lvxbHqWFK57BWqK1ueyPQGtzks
	 bAucgYSOYjweex4DzmvrfA8GP9kmzbwac1pld9qSocdIMdNtVlf0XusxDlGEaSVEn9R+U
	 e/q8vFYU2TVhNoijLyFkWL7VJDN9HEGcB9WvHL+pZJwLh1vJMMW/dL9+03Tl2f2IqVZxe
	 p4bs4bABuPDHBFRbfZsz5lH8j0FLbXUmo1ySuq25JgoAYIpe9O4fxQs0b6dkTuvUdfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B35606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 05:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B35606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RLEA194023
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 05:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=; b=RefKnmzNWvv4FqdS
	xjwAg+ah2JqQ5tnLdTw9NQ7kuRiVB6RqadPB6wdN2VBHIvYNaxALHBqHxC8t+jlc
	lzUldt5o8P2J+iDReMwSzR+ewNfMCxHZI6JBjChtJc27vswdp/PzTbL/ooQuFXwb
	wepIsbT1oyiC9rlkWbaC9qYbGcFArUYT/uIX0HetS44e9SOOn7ESosi2V/3nw3U/
	A5U1R24Onl4JKlEhn+PXLZCMK70GTS1agkpIQAV6xnM6W1mVfh5Z+FhMl2aIrWuw
	eF5pGsUhI3/2liur/kdUWs0XGAXOMQ4VTCJhe0j/KIszPqdNODpsPOIPTtB8ri0O
	yByH1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj1yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:08:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so696467a91.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768937; x=1794373737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=EjbueMa+mQIxqpLaSDEecuN5Ny1MGeM+1+TZUaWFTXbsXvAmDII7cfDAij96Bfzr76
         PmPapXJlP0wKbY99PL4NLTLO2z6zOxWWN4RS0WWDSpAC3JU9v1HXwRYm7t9/O37AqC2R
         xMyvuFF4/p9fG7MLJ8mCTlSgpOuJhD6UjtXR0IlIZ4b+hyBrCiE1OxUMqb3fl7YQw1zF
         YwuFNELgOJlqr7zoP6WOLjoY8RjUwq3KEzuiUgAFuGkOGxPyi1HxhUJfEqf7v8vWjzNu
         jef5FY3JgNE1NJ9kSb6cbN/1r9aAGtRtJyyzpJT7PfVHpph4jdLuZQpk0cz5G1/IMhIj
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768937; x=1794373737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=P7iGt0LDEoFalivplKzFCEw2+pSRwucPnqxQStrEy5UGVvDlkymm6RreQa+gGJywES
         XcmcE9o72EmB0Y3S7dZ/m8O8WbrqHEwz9oyQCTRr85wE21edsqFBlx3/ZtfUcvlAeLxA
         5EKkoSJydmqn5sE7/KymGSQCU3AAXGfNoYItpWXOlVMUD9pVULFLolF7CLnG5GJiCj9J
         hYvQK9CICPXK4ktQQ6n9/HnoHLYgJFXpx9icEOZTiOrA/H5xgIPsjpPjEXtKvu2suAjK
         jgp53KQkB89p2lBxqxvhMYvF4oAgslJtS+o6DmFu9BaPClkwDOb0SfkU9K/N59gp8KDX
         rb8w==
X-Forwarded-Encrypted: i=1; AKwUvBz6n7N3HwU9nBrrNIaFeX+BQeD4Wgr02EiFcUJ1rxmjjBaRT4l2YLfedFqio2xH3jnmONWTxXJ2DR22@vger.kernel.org
X-Gm-Message-State: APuU4Z9N+IA+jlqh7eYoD+1x7ZyrJWy9P1mVFDioDzhEc1cV6CsbfnuT
	8rz4x85agu8zBUbbHr5rL/Zt29kFxWHfy8mQT700/5ei/I8NHWnMRcIcjcebX+DNlzIVU4e5eeO
	RvBTRTxjcCMCM/h+aYiOQtSuOnHWaFR0a93GZwKAT4Hz9FDuypiGEvLzMIyvSJ2rN
X-Gm-Gg: AYBFou3zCjkonjpNMFGWOpIcmICBr5Rc0A4aSdi6mKc7trC71SqUGEkPGNzlSvv2r1y
	WkvoAoDWoThvvaUZBKdo7wZzLqywq/8pBsJAJdb8btgSCrAzRQSDHdeRjc5E7e5fCZjF9xfUWYO
	DAlmfeLfVHe1C9wfQaJc84IBHyax8R6eiOuOnA5fmO5v+J/kYgY4DB9CojlZG5APQ9HMmkqxNon
	K6U9jfPJzjOzYj2KPM50QAFeMc1qqG0n64CuSW9GcmApAhQp+fnuiR90v/DZp9cbQeZspVY1KUs
	ULQeSdFrMhLEcxdhInYso6SKPIRmkpb1aRmZ0TpfMfXgoIEdYb69bCaIHvdNs1bAXHyy/nieU+x
	XSWo9AlJMQl1ubCfx/HTOER+kRLHPzek2Slhm1hi7iCT5Cz5RrKp1pvdOoA2k0DxJeFuFqETMz9
	3nfrE=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545617a91.45.1793768937104;
        Tue, 03 Nov 2026 21:08:57 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545593a91.45.1793768936590;
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:36 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add support for AV1E
 clock controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-glymur-av1ecc-v2-4-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX2UE6w/Y/ADVP
 Dh/SpsS8Sh1jP/aH80sFZjFso4QfHEX4lIDiTqOMMrMxzwvVYTJz0cr2BDvGHN+HJibbhe9cKFA
 nnV2bPBAuNZjCpAOwprDsreWv4uJlXAymh8yjgFww2Cftk6NZJ0hcAPB+bjJFdKsUXMM3r7Sy+G
 UXah5ndXEWgIsH++zU1b2rQpTRF5unQHnLkqaZzaezoA6E5xdlFzpMxuMwZz3GhmXg1l6yLzP8J
 MyVMTizChpZ+yWSSIi+KMLQbOX4QxYFd3/JPtee7Ig3IYg74SnqjvEZtrUgQOSX5jF8/DOolZMe
 AlfLmE0YYgcRmRKp6bp/YcDd31pnBm58j16AK/zTRvywhUjf40A+S7nFOs7z32LANhOxJCllSB3
 LUMbIiH6IiT+UvcjfOP8HZE05ZNo0UuLYKEtZR6ltoBgFJmf8q45csVwudrBTgvMpmtpzsby4F/
 AF4avEPY2avECSjqoWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX1Y4Row/WddsK
 GMsCwBiOUoQ+oPCLK2HF27lqPEDL5TFPrkzlbv2WAlw+mqMRdh7UBDVU9LzE3lj3Ou0jnr8KG68
 16VaGdxpFXDhjVZSi21xQLlHLgn7+Ss=
X-Proofpoint-GUID: 8r_cckXGv9Fl7uMJUXxD7gsV5UCVyN1l
X-Proofpoint-ORIG-GUID: 8r_cckXGv9Fl7uMJUXxD7gsV5UCVyN1l
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeabde9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.56.0

