Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E2498937
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046999; cv=none; b=MtEn5RP45hm3EkjWCzqPKTm1fKM/gBsSG//SCs0b9mOYjpwn3YN/jvSBzJA2MwSjcGNKSDl8msmnckGUzsOOlOTz4+8KtZKBiMnsQA3P/6N8AjeigusTVv5+sS3QknieDvMTRc+4aLU4LpLk1/rgfYHoTQWiFOOe/M8+UWus3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046999; c=relaxed/simple;
	bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryhnofPoHumMHcwvVnlen9JUrW70FuZRY6KJZzkAko2G3lqUFQSp8fl4sStT4U0OlULoHEh0Qe/lJ8LRdDxEt/DWZPrTLIVrQuSG6Su6MerkXZzJbjfJXq9uV9pUKT4mAzNeqwCychzzQV5iWaM5J6YjW8Z/eOYmqSnSvd13+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avMNOv3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZADWHvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avMNOv3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZADWHvS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC81oZ1732971
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=; b=avMNOv3QorUxRU9p
	4TKrSXwHqiVd7Ww3oVCTfxGSCj1AKrw417ImlW+RukcQmXcuM2Cchj0aTNtPVMIy
	nlYUv3eEiQB6uT0HbB8+xtQQ17UcDBRK5KgCPCO0CxBo8MZveN0Ru9PFBQLfN6/Y
	0LPqxxchG5Y/WbSkfReBYGC4uL6NAfkrR3MnZ2gI6kA7Mg3fFhs2sRSKSM7UOsPD
	pXloE++ZabH7DUQ9ISHDixJQlOSkBNRBlJjQEfVS1hLKRIxJZjOjdmsEZgyGOqYJ
	TpVWwRvJutNwj0msoE+LgaX6ppggjd5+1lshVtnAggxJfmdFYfLL7XrEEHGir0Ni
	f9GEYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm0u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2003844a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046996; x=1789651796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=gZADWHvSct3EUsSI+rcW2+5mF8JY4PHpXwhIgafA6OKepLDJ/76yEIGKFb+V3GSZcU
         KiDwxNa6LTdM9H44bmuX1XxZUjHmurcZRI6iFTdMJXm6VlZlXg6XNyAysjU9QFRXAOr5
         wHqg+W+SFP0WhhwXCGyWJl9FXr5xF8+9AOx5c41BadaoldzucYQ0kXcCKhPiEdJG3GRn
         WFV/8atccViIeMWLWC8Eml0bHE7RyqG7pzXEn0VCcD96/KDsgrtqreoTGykqfLmuiSwL
         zBODJNjFv/lk6ZT5MuTkKChZp7h5PAMAyTdVliQM0nyQU0uzYF1EdVQPyq7EEfB6ZGR7
         QqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046996; x=1789651796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=rlKAWuXaujQu3FHy6TJ6dhOgzgoIdFG043kZv3ibVfK9W7Y1GbGJGsxKhav+OC9jmf
         A7DVHDp9IfX8GbIOApof22A0shQERyKlHdheTb2QbBVOG1vrnr6AH1EqVCBOYpg0IFE3
         Jhxljqjnrhs9lxO4p5vbKp3cwm2xkcd4ZOGWcrtmj49HfMv7lV+1mjIVwkifj6EAhqc0
         Flk8T4u8jl4mC1NGiBYV3GLZU7cU9nTeXWaQJ0Byu4ie/1F5LOWt7jpGVFiN7B7lxGGF
         sChrx4mv5U0t32MBbizKm8rbAc1Qssk4AuKpqyudm8PXncueR5bVjdDb6A6oP7zZyUDY
         wRwA==
X-Forwarded-Encrypted: i=1; AKwUvBxnKYxoWM8yADpN2oz+l0YT5nh14+V70sfvpAWA+x+vic/W1+NF+2qwdO3Atyp4zZP0/OUKl+qpGbQy@vger.kernel.org
X-Gm-Message-State: AFuF++lBbcFZNMX0yLHO8JeahUhC1d8WNcMwMd9LY5tlHAZQj5Uu3pHp
	tzwwYEqaROK6gU4pTmHc05rrsEh3Ynom1ItoOV9rP1JQ8cF/pYkqZDrBnf/vlfgEOv2m2n9ZAt2
	ekkDeaV41wqsOWXKehBqDrf6Yx4tDZp99ZVj/uSPynSAt4J5FgFjHrBuZmBeirTs5
X-Gm-Gg: AYBFou1UBMhlIVkOXRDVfeIa7y0aiQ2MsWlZEtGlLhYNNRh+cZDISRne83FUe2Pumxk
	im1kDAe81hS/jFT3Ay/PoMavDdoRxXE6sD+R3eAfYqrBFBXU/yO6sJdvW1OKjJCOWTkH8FRTH2o
	ssKXFBvDFEJNc+vdFmYqo4ZA2pcX3h+onQT+tkPU5hf7spKCgWeG22znYdoRlx5RmuH7lf4BUqi
	nB0AmSgjQ4VSa4zx9eM0nVbI9I4FQ9NV4JpUzJLywZE4fKMW3MGWmHC+Z2Y/V5aHBxwetM9v2HV
	xcM+w91lneYacUcorZibmUg9O4XtoupjXxD+88x4aX7sphPv9okxjIjQ1zv7tbh6FoC2itlPWcM
	Cz2tFEAqUB9rCZGd5AkDQYyLx/J2xv5zvHKw=
X-Received: by 2002:a17:90b:5291:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39d77b1d014mr5553090a91.21.1789046996176;
        Thu, 10 Sep 2026 06:29:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5291:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39d77b1d014mr5553049a91.21.1789046995636;
        Thu, 10 Sep 2026 06:29:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:00 +0530
Subject: [PATCH 11/34] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-11-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=3279;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
 b=6Zbhstb/nz9yptPgXtRkhmTk1axG8u7IW2EKy5ruLReDuJUfhyLKniHYB9MXUejFJXmK+rm6i
 u3sb2ApEDQ7DrCXXWFEB1IjzbLBtKgc3Y/MHj82DTpfsiD2h74a4ph8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXw8lkAb79qBlE
 YlTAyIC6aKUhWoP/ck1kBlEXqeUSZM2MenijE+pkYoPd6GTi1Etxl61Vv6+65L8DpdVh1bJbko6
 FGrKSxp6NXDcfluNp+4IoNDriUy6rHY=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b0d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VMIctaI8CeTdThEz5-zjFUWjRkUQdY7i
X-Proofpoint-ORIG-GUID: VMIctaI8CeTdThEz5-zjFUWjRkUQdY7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxa8q7+wiO7lN
 cO+ZwHoyzlL2ONMAwrtEc9bvBID+R1PJmPEcEopxoQQ3dRpb9h1Dy7XaEXNl3ffifMrM4ArwK7r
 OcvRxTihyPJPywLF/MPjtfv2tnGn2+He4z24t5q8HTRZFteEN5/9Vc6prtyrcEIEg+lRSEQgY+m
 +4se2fLCfXV82jbXqg2BywYP5rLwJVnqOB0spgO+hvjwb/UGDm1oJ38/7kuNvwrT1x5utpUBB0a
 +pdap9IfcQzIMPKZFfqf26nrJQ3RRkbM4ClnU8SdioIV/rUg7tc+QFTTqZ1rLfaF+tcxiUfBijW
 E1QxN3/ze3/d44scHqdPGd6FZgHXwn6itRhkgsahERhcmqAmXzc+1+ESlhca/QqYdXhlOyWoOQC
 iqOUzQ5AFBk8cD47UFvun1vaCH9CcSuO+6BOuOokwQG22wIMqSBAXa5Gbgmt0YZEQjep77C4OSa
 bQ9GhLa1vQJ6PBzhR2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..668c183bc177 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..b73ad7861eb4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,7 +1027,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1061,7 +1061,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 26045430d34a..1332c864801f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..2e874f046a0e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,7 +1021,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

