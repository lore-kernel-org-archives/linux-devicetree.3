Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D838911F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436603; cv=none; b=Gtdk6oyY9SKgmG1czC44kKMo8RDDCJhemXCPDyqmC64nkwn2bNaFUfvdZsqRDyMKVS6GRywhdhSdKBIMN2bEcqRbrpfYe0yJZLoZuOzFnpnFgwnBs8c+3iAFJOfDseAfmNDetgNvzWDHgpHCzs+rmbX4AJqnD6ZI6J/fxBPf0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436603; c=relaxed/simple;
	bh=/3t3rqT8fqV1+HN4uB6fWJFPqT2keSdILxMvfOZM+Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlpbcRR/zSh3kLyamk1nP4/uBSCeMkmicXVsCT5zLCcxDtrLLcWXmBX82Ebsr/2Xt+NJTrzMWj2dybrDw+TUBNpPvvD1na1JrS3HWE9HlKx7Pl7prWbTcHWdqwstHiXaV5jyuZnxcPiHuu9x5LCm1Ua85agPi4akgx+8u35ykgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XK8RH6gC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwWVFUDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK8RH6gC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwWVFUDy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZBVE1015347
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=; b=XK8RH6gCHKt20o08
	+yay0hZPJoZ7bSirHLjGms20brp0Q1dOLwN0rGd1o6pfuaq7Lymi+rVT+pw8xnbN
	i50RG49SmjOfV/EPh2ZMz9iUEOm6mHPrsdXA08pGwm+SeqjDlmqAHJ/lhYQ2EE3n
	xEE8/i3Q1y+pyrYSMzzgQY2WqU5KSakbcnN0L7SgObsyhn4qJZSsevLqY0X2jxMy
	Ij5Ke61V3IA+YyqaTMEs7YQ7KYXWUPTpDylYpkjyt/N9TPeOKuddguUD6FecFtkT
	6cUI4irK1L50pAmkDt7Z2CWGXpysA9sQJECrFAfa72U2KINRo8yQSNLnTjT6tCSd
	pW215A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7304eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so14778182b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436601; x=1778041401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=;
        b=UwWVFUDyxGQJ2YVC6tTgubt7T0Oco9rkzuA8NOkPnkwI8YHpwFf6J1RM/uQTQBiD/F
         yq+0YdSx8/9XOiItHxp4MEpe/K2bUY1ffAPYPoxciATIchD/ShlAUbwOfJCGcDF8gF1E
         dUjUFneaWa8dxHcZn6yxxzOBezulvB7k5Anit0nrndcssb3xxh2rRXRLLlGeKwArk7e0
         DLaKEZhl14L7wVOAgspkyODYFNJVqA5G0Ii/4sYn6KEtlBBoiBSH8XklIqsGqou5Gk9B
         4jtChp5t3rCSNvMxbeBOWy9epIIb7p7yq06PUo65bE033feW3C4Z08pLg4o0Xo6JdyH7
         QuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436601; x=1778041401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=;
        b=Me+3YUeVAvRsyiCTqXKPu06Dj5f151TykH3AK4dHVzDLBCNzyP2i/SZxNmlq7GhXNo
         78v9U1iQ6IVKqjWvEgR1bRvOLn1lyAdUXL1Odx5eKDBHkCskwUWj7ckqNseyBD8XsyV7
         qVP1cRL9lzSCxBV5ooOCR+K9HPdBc1r0akbikrGS4hjbhBbwZrEBVuCPIFcZpbpm7kSQ
         0Y7I5dYaS7WVztjVfqvRt7mc7p0nhBkg8pfj/ktHoFFvfiy3axrGQUnpMeWbPLMIJZhI
         HUOleiDf0dBvoA4RltbHwbTHMv2XGMplPzbDDxmDA2gtt9IywoYU0OeNF7c05dlnrD7G
         vwJg==
X-Forwarded-Encrypted: i=1; AFNElJ+/jwxOAX7cAm7buZ4zIOxgDgO3RfgGQyEp5fHL6Pr7lANa0ItvQNW+a6FFe5e+OuASyBMajJr1EKLg@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNgU8UHMWhU4oXCQOAVjAaAoPUDEcwWSlOwhHKZXwlV2IIwad
	jxGevhgjMWoFJoWzltdomxilmAB1qU9NCzg8YkX1ds3tI3gSGEgYYbHUbk1iewccXVIoJlO+qBj
	YBshuxB6+Jes8gfjWrk6wcxp5X74qNrGWQ/jOjWqif4g34j8WM/5Lm4uv4On727i9
X-Gm-Gg: AeBDieszu6nNq/IN6+BroolVD285v4iZvCUmGqReZ0GSzrH4cj9TfjAx4uoddSgYJky
	XOvhCzpXz0K2LKBLYZNpqjqFuEiwocM9o2RVgFDyVjhEzytnNuXUUy+bQUMPZ5XhNwgA732MIh7
	taEUcHm7dW4aCeWaA0LNCsNA5R77skX4ehxakn5kGlLbXvw6ZXEC1cIBLBw85RxN0vboyAHseAj
	yX6smK3xAkVWfvpFsVtlXZtqu40JlzySUpZovaO38MowXol08n/AVUXmWGR4QxWuX6FRkyZbZ2z
	lIQArNWt6mwL2Qrcc0ScWJNwCUno/LMlqm4iJuIc1C/yhbZ9mOG84Ogmz2OsBS+Ozsq7r1umiIt
	jDW14OyWzk9tXMfPz8AkXYLTwAWDmgxTeEhSFWNnXEgRuoYE8U7fZsBPI5erjgUi3D884
X-Received: by 2002:a05:6a00:7611:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-834ddaca2a6mr4879482b3a.8.1777436600842;
        Tue, 28 Apr 2026 21:23:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:7611:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-834ddaca2a6mr4879469b3a.8.1777436600417;
        Tue, 28 Apr 2026 21:23:20 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:19 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:45 +0530
Subject: [PATCH v4 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-6-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1377;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/3t3rqT8fqV1+HN4uB6fWJFPqT2keSdILxMvfOZM+Pg=;
 b=oLEY1TE6amPJ+BGtiW68uwqYVzXTghJp1RhvGxaqaDWXn6wn4vH3GJYpnAM5OthnzgEnInx0q
 9wG1SDYzWcfD4dCSzcEhiM7SOxQDmtO4BMrN/a+TY7oPeFK7zNF/Neq
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f187b9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX/K0i6EgUImqi
 Ne9Mw7kAmnQ201cxD4wWjeFWI6yNQ4ulk6juaOClpkh9pSFeLwHwls5tSIXJsMQJnxr57nOZSvg
 NyfnNxfZLnHvdulMwpwKha3c50YOqzxgFCu2XaZx/o/OOrI7mvhBIi9P9Xn1aeVq0aaBtbMwHhd
 9Pw2kGXV1P15WMDe8IH8j9WE+L8ggPb/aFTVls+or9Ey01w3nPMQvY13qj91tYqhEr9MbRN1nZk
 SqxztZs4OimfG2n/i3fhz2HkvY7+iL7JmJRPhVt09PQ9DJ1b/xuiakKqySdNu2Qfd1UvA+oK+I1
 Kq0DMINWFFXyTLz00HFFdIqa+iz+K8C3uqSvikftHdJEE+yfSj0jHW00E6upz7rMsqN1zxJznR2
 THWfGz7vgpmP5svQeQiN/HNADC7Aoop7lF8UcD1FDkdIUOW80k5uSqEfOMf2MU1jiBVg4gl3RrH
 yGDhGt6qjN335eQyURg==
X-Proofpoint-GUID: wuiYkk8eex8Vv3Pua9xNLxe-hmUWMkA3
X-Proofpoint-ORIG-GUID: wuiYkk8eex8Vv3Pua9xNLxe-hmUWMkA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..01e35e34ef51 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

