Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53504DAF90
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646104; cv=none; b=kB6LsccBRSMOuKMU9/DRLRfuBolcjXMhX/lavIrMv6Y4KILzp1umA5CQazWRq5y5tTnk+RGNIBxBfEh4F2mt82F2DfNyaV1ignr8tOALD9Ep2XsN3DOUzIVQdYXOR/XKvkcIL8Xp1yyObzMkjckLejVVkSbJ8WIKNN4Mt5zILEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646104; c=relaxed/simple;
	bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGUr2trd+5/zA1Tq0kMEJR699eP5/xrAtYk4R7hsDqILuhuygkYyLOlyIR2K+1vuDDXz2aOQjvwPpyCCwVEdu6uCdPc4gls9duwxeWWLE6zCOiqATEZQ4xAoE39K2rEQa32WiWYzJ24M4UEgBhm4JFKEZzhbzNowa3RgbkO3ET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOyza4Wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWsqYqY1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOyza4Wu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWsqYqY1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrkM1863441
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=; b=gOyza4WufWIjVpw9
	wnosMDDlpqxrFEAIL/AI4NtoOUOxGfyTRd1f/HVsEt6phkgQfS43xjURITZ16zNS
	akrqYJjtPr0RauTuVeY1PKrwFdtAvVfBn8d3Z58zZV97rujDwAFRbPFRZibr8FyI
	4wdGcTif8jC9epSkdYB4swOXOt+Cj20/FXVvbhyiIZ/kQpMnI/8vDJ31IWrZOKrL
	7RoBgtRbH3RhSHtxIOXD4wDskggJ0+nnktw3G+eWpnOWHsFaSlwZLHPSb2whcnCO
	k3uzHqZ4gokrhll4EfkyoBsWGwsKLHIUXKoVUZe9eOFN76pMiMmFloH75czblan4
	sUxC3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1370547a91.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646089; x=1790250889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=OWsqYqY1nsoxYeIeXEQKJZRe1SXh0wFcVvz1kNvhUajclpT338QDgL3cqHBSsjT4bn
         6lPdGpgH0oA7GClBEhOpOi0vFw18gvCkOkoZS/LYUZax21aW/EJn5gAAghkFc9Ks8wiA
         3RcNhIRpq7nkcsgn1juMnyUvOGv87nWjW7cs7D/mL55+myWr/RJEz+aZi/+uFR2iSups
         7A8qLTM0jcDxPlLXwIj9GEjH4jaI8NaiLog5iy1sZn/ai+W6F6H+NXr5qaOiFDruUdsM
         bpkyaEVyaqRmu69M/YhKusLnCQkVVo6p/AZqGYg2GeIj6zcmf6mrdMIUjI9W3d6AhtSB
         NoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646089; x=1790250889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=1p2VFPqtzWqbvL5fR0Tr5q1dsQN9E98PxaHCHtKE+sslf9+rglOY5Zt1gi1iAljd3j
         HzyVwIx3z9sJ21nd5/uCcMcSXnNtQP/YaObUws19cUi7Wg5DPJVGD3665AzYytBenp0C
         mNYsM6BRsNgeU0nIyKJQp3vC+L0TYADBQ6xhbK87ahf1LwlPNyEeeQj0pH4rUZXt9/Rd
         spVq8Ik+VCDndZk7LE0GFmyE8yrE+HOxwuH9vKreTEruM95uyifAVqwsMfuHXJsMbpD2
         eDb73uAEEwjHnSjg4uwMNQe76cbDG0kLmHIPuazWWD+FhDqTnVMs1YvVNU2pxeOGEZD1
         ty2A==
X-Forwarded-Encrypted: i=1; AKwUvBzyVQfmI0oys417GfZF1GfPMEL1+zbOkEmh760Lo3m0MnjkRWzidbwC2XIVGC6n3xWpBPtTZXtY6KPT@vger.kernel.org
X-Gm-Message-State: AFuF++ntnsbnb+9Ts5tbu2uKUV2AN7P35poLhBxeVjC+D1G7qPQW+dbl
	UsR6q6ntmc6iIdXwvlKmEWsQ6JrR8YO/275pa1PPV4ZRkvwbcTf1z+T9Z4cb3sZYdWXLl1woSqG
	TZGyA+9xjQer1LbYSFUJUfuzg7mPfEz8KN2zgnG9uRQgr+3CSyk3ccPMuPRdVhg2iXjHLR8vd
X-Gm-Gg: AYBFou0QrNrN5oXEmy1VeOZvdWi8KTdcg4wL5t3spQjcyTtw8NjnfUedOLMcbTCqrNc
	jXq1R93nJXs8wCBD+yl61l7Mpz3meKtvnWo/wXFXHu+d/79puon7uEKBMS7qP+3EzuW8BXVwrvG
	rcmGv4CzcwCkkWbBMe9252z++AObTItwR8Sk61Q0XQLcxAcYKVm31HSSKRijQa+1IpCt1dIRBGT
	uCjGqBjGnJk4EdX7wrajOTz/8VcMup5zeNT6Zo+tGVOPQ28Sf8h5bzGcRweuCOCmu3s2maO3ikW
	mqGeCD63WPvmEIcO8JJZ3+hCLkc96DW6KKUtbP+IRwBMPAPf+PzieZOkuqU4hflYYBKxWp/ImLj
	l7tXd5nP+clb/jFZAzAWisCfFB/BkNOUp1Q==
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246399a91.16.1789646088698;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246361a91.16.1789646088282;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:11 +0530
Subject: [PATCH v2 03/18] arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-3-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
 b=d9oaK7UuoXWrqG3D8odo6LNc9cIGMxSw/aNGvWKzf8Jt4scyKMJ5ceFXvnhD0bnezYlYWTn7z
 1E/SkOVYraECQqsqSke3I/IAhJ/JOKG0scVSinHfiMbGDV5EsT/ydBZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: rvtd689N8y9nfKXPW8FcORXzC6GQURah
X-Proofpoint-ORIG-GUID: rvtd689N8y9nfKXPW8FcORXzC6GQURah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX4v/0QTZRXQNZ
 LxZsN3EH5T7NuX1BIuUTpII9d0kOni9toNCuXIPSDUmAUdxEuEhQXVulD0mthT++75bkolzuGWx
 nMtVY2XooM7ZhtGvoYquL8oDPLpzmnZ1N+768OkqXje+mbwDLwk4ZHdq4rKy/ZGDIGiVJqMtlXr
 hsGIwlQdojcNXkws16bn73o5oakdf1Cm6xlO0hZx1q/5X8IraO07t6a7kZlXdvLWj3qlf8MguU/
 VDDmPSoqrfpyBrnsF4wzGHakC73+VSyFBYTmiP+d2wu0nvNlZULstsmw3iOGVmx1DIojll72PV6
 zmY3xnXs7QBjpxoVFwBApuHIdSmt+F5Ws18eUuk4sqF2InHqwshhNOlo+XlBpPCxm5cGILws6uy
 msyrTVIaw/wu+oIhxGyERS9VasItaAuMZUPid9LqIT8DEZZ/l186BAHGJID4zkH4eUeozqd6yYp
 Ore8YxnCP2YuQkdhxwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX7+VTXEXPYSBI
 vKDZ2wAVwU3U7P3sFFYxxOW+BNUeZSctx8KsT+rOMOcm5zkYjv/TmMKCAqHvWbjqZuPN3cr6cAl
 4hts0o0/2Zd8vszGFZ0a5lYuo6h0kFE=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd509 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 846138149b2c..3e636926231d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

