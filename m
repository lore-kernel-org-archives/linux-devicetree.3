Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46B3B0AF8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698378; cv=none; b=saLKyc6MRrpnCfGOY5WvDpNNDso+1BA3EGQS/jgjRMv9wXc3PelT4mNYFrzM2ArytYY96ZDrz+woFpWJVdyZz0PflCNPML3dWUqDISZCrcqYVkaJOfw4BiC9jjxiE67hxLNsbMSlcC3QqDOjLIDF6gMNhXiYpCNZP+RYBnFoec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698378; c=relaxed/simple;
	bh=LTHMLdWF8HFpPeJgdf3vWYwEXH7E4tFvMQpFvdkayZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwsMu473Kb4IM4awgvxtELMP5cAxNU68Zer+D6HNMpqoG2AybObCgchx9zspGKN9ut96V+4WzR8Vu+eEM/gQQK//lJxMeIgg7jTXCYx9Rh8q9Xi5lswkkcTvttYMwyAcjQ+r2jPIOs7bfrCixKhz7au2nrn1BY87s2JMsblQoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDt9Gewu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2OW+mMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDt9Gewu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2OW+mMd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAxPS2524414
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=; b=gDt9GewuvcQXRWE0
	7RmGFVGkES74hmnZENQ0eB8DiDdsIiTlPFEH49fV3hF8vB1lT3OGNldHSbIz3aUa
	qem5IOwY3QshRbiAXLoqWJGlsViq8d56GMZcZyyTlWBulVzE83F2zOXMWlmA4m/j
	N3+tE+WXYlhiwZ/aRymbcHcfW3NlAZl863mHcUDhUNk7KWfoMRIM8Xvu6BHbKh1c
	HjmwupE7VUwUrCINPxG9JyPhSWp9SOHwoGZVvhyUDvxiJvP/QBdPt4G4KK2B7oI3
	aB8N57/nlk4hR1KzgoH7VgJkiFRQuJjreSA+LidP9sD9A8s+/JDH6bgXgBzySMNM
	tl1Nuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgput-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so4387344a91.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698375; x=1779303175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=e2OW+mMduS2c9XYAdRcTWc5N1ufu2Y3y1GV6WF9YS6WtBKvgENcpMIK8sTlM0zbvJp
         MJhviUZb4Jvdl8jVZopAgJTOhyWzXrazY7+wwubxQLvWQTmkLgcoLXavvxeIRUcPV7np
         Ea7ZKWU5BO0hgmPr8TIuBJBNqTI5qnEcFS6AGfTZx3VgR3BNiHZGjO4aoXi5WMj1DMUh
         UED5GrhHNLnmeeccyW12ZcmBqEoFNp72wMm2DLDLaCQh0jcdt6CVUvwKEHq3UOfoVl5B
         nCLuSBxJm+n7WTVt0gdKKe/KLOAkbJTz7FRXx83BvZoDZTbQ/92zKGXuAeWuumKGYsVn
         Rlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698375; x=1779303175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=ZW/50t0ne5ws8qFEL9fe5DcpTCG4WViGRkidFEywhpRr1TXLJJehRx6ywYYNQRsy0O
         U85W+iub9XHwz0tDfjmpClU4zfIyyHPsAiaYyimIy8TwLSy93Sq9h2hMQ/VcpHcDTulR
         S8nryo4ZFr7y5lAxjU7o8JmaeAWjnBQeDy+jgU+YewZPiUFHJboN5JEVOaeEz+yhRWQt
         IWJX12zJ6ld9G6DWqEx1O7EspqjizHYnKDvoVNw8Ku91lBBAXgVxkX5+5tD8rM03a/g1
         k91JXMb1Ym9z4mboD34ndV6fulq9ahz/SKTPYOuxsiEREGe/4EaXlZWxxkk/lBMw8Auc
         WQcA==
X-Forwarded-Encrypted: i=1; AFNElJ8ggOSuOLK60OeOMDuaPZwcZRQxDpkBziYHsrEwyo72TMVZSeWqzARy9BLGbcdJSPA9nlTLKfMJs2os@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6ec+XQJn1FSB8S6n7kKtgH8ySTv1EmpB3sMGEhz8+qtZF8+f
	NzLl/LWqFbHJDOiCTQ3MyXV69eHxwqU94KjvGeRqugSslHBTFky2oHPj+zW8yYFwcAqqsgXgzUC
	zw2yNhyqfojWud9AEpOBeLOrgRna0L6blLZrnogKnatcwnwWtAp2JXc3DLAWIy7d3
X-Gm-Gg: Acq92OHw4jrfap3KMsK7rlPRLzTlYAWl05XHrkaak5NGX55JRT0v73JhjHnQ/eOAvIx
	hBAi+Lhv/Jnrgc0vuBzsBbktFH6icTzla11diaImd7ruisVOAtUaFft4vm9r40fKSpfagX85PkU
	ii/mbbGqRGJ+m7/f8QUjkNEYr/qI3x8nutVDKYAgurM37s9jTuKOLmTK6TQqijHPuq0aA4BWUgm
	zn4vh/oV6hbYtSkRo4tL7BswyZyuyRQccs769/uzlDY0DT+tqUGYclneIdV9Lhpuz2f4JBjOXDJ
	SycikRgXaQu8Vf+AuXpQJ6b/xIgdcxjo4cyyp6Ux9f/WHk3rt9fTQFDYx+GjzwLgUG3ZJ3+Z9zs
	zb+sZQfymB1QlKV+OdkSSkB3sSAABjinCZzZIaEO5MaF0AuLKO/tPBlo=
X-Received: by 2002:a17:90b:380a:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-368f3e5ae6fmr5091635a91.22.1778698374978;
        Wed, 13 May 2026 11:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-368f3e5ae6fmr5091595a91.22.1778698374380;
        Wed, 13 May 2026 11:52:54 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:53 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:22:22 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v2-3-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: vi3w9ssgGzQ8g71AvnkUCwR7jSYl7Q3L
X-Proofpoint-ORIG-GUID: vi3w9ssgGzQ8g71AvnkUCwR7jSYl7Q3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXy7OUxMOp9OEw
 epFEqL3u1kHcV8BbDcaSWbD8Eymj11fztlJKGr44A3T28N8NAfY83cIKj7Op2Sej6HxNgNIjWK2
 WAvbvoGiIRVtp2QiGbY2EtxPqVn/jPIJYwEKhRBMEwT40Ybr3baNjDLfQD7XU0SxnQophAuf4N0
 WSvjq6J1ayRYXanRkOkmQ3bMeAuMMeJkZtZYJNt9i0Zc2KCsh8puI7sq5hpBmN7FfXeWsobMU1T
 h1Dsszgf9KKZXFLWXjqX9KQiQ51TmI0+wxD2FyaVnpuk48HSrapsNoi0xW2DxFskpJrHN+v57D9
 kgU9oiJTqfhCbKvHBtOLXMUU6vKBRn8AEGGxlifWTWzEcQVX5qbXiooS4/5vAoYKjTlgSyNzbbd
 QtiSBrxgWK5Bhvx8y6u+5MpnQQXXnmHCm7KIk9DU4Xp0zw90BG6593HzqCthDC4Np1W89BEMnCD
 JkMl8WzxSP7xurQDlxA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c888 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lX4hch5PzS7iFd4KNucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186

Add qcrypto and cryptobam support for kaanapali target.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..941c9b131a4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2541,6 +2541,31 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v2.0.0";
+			reg = <0x0 0x01dc4000 0x0 0x22000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,kaanapali-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1

