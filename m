Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F666421237
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059269; cv=none; b=hwAEDt+5anNYscFMdBCL3ZNhyFzOhqEwYwQ3GDrS4YMexi6sMFm71XVZSBdjjy9kGocW24Oknlgy+vqMIRhySQe67iBFCqauQHbAuKiOCzVt1Tn+pAvOis12nIrsKcwRTjKO/M3i6vywJtELs7q23CKnM1UQlspYD1oM/5h7FwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059269; c=relaxed/simple;
	bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bwp7zmJC1WOuNtoXlBGCwhdl7EkLzSCmwv6XM4pRUAdO8laeV4YxD7mlU19ayd709GTDAVGdb8AY9cdlZtificE9rEKDGWA9Ky+ok3gXbOWVbio6Fq+kYm5uezYeazXp2hLW1vFqkskhb9aa8JPVdAzNV3325x3YSGI2cW67PZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnutPU0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzLaH20X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnutPU0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzLaH20X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00J4h2165608
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bF1FC0baVWF2IIEF+LlbyK
	xiCAXSPEf/MQwu2ywUz0I=; b=FnutPU0dG7kgoOC0Rw/CZ1wKe2BviFJf9wmG2S
	ScnSjNrNcRc2E/A9QPH5ROPRPNN74kyxXZcDsetrgr/QiSJAerqOgiF7xXIAHOU0
	QVOZhHPaSruf7h4kE1/ZZSnWGxt/4qYkxH1Lv3nzP4U8YgWnj4zsweYXCAEPAFUX
	nvMQzxBedwzwwcJCbcBaMpIukcJUgS7bXcXC2hSNb+sFvhFi3JRVqkk34ZUeQ2Xg
	fe4POaJ2H/ADK9yj/X7VoEahNKsZsqYqbA1JU6Xvk40PYl+WU+lpQS+qZPIbIBL6
	akUupz3bTKWDM7fg6wScRckM+BfYWfWkValeCc1mq9WgQi9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetm0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1254241a12.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790059266; x=1790664066; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=LzLaH20XNgfgHRKjhJeTmAqjeFCAiUXnHM/tgZOsfMEiCN67He7Qv48J7UjppspkgY
         RdOJbLJsZk+9wbtXzNlIeI9n77qeGis/S/tltlxEPdfp/1IevRP7R7NYhmC6VNyEZOaj
         qYst92QRzVWczRZMgHRtkg5aeqWzvaouiRaJd7Px5Cn/ObatodLHqcWgZhgCcro3aFmm
         fQnLtoCuPZzrq17wbbUXXn52ZC1sQTbaEblKRSUWgHDkwqhYXFeL2yYChYjHtMRJJF8W
         Muv2kUFIY7pYMLKHMQu4IJwnD+zRHdd/7vhbhT8SobkX0tDiaLhtaAYc1zM1FMCOs5FC
         Qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059266; x=1790664066;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=hDjHOrV/Zj4wVpav9c4M1QSEXiNd///fAxovLcEBW9h9KZh5Ud3gCMwdRCkEi5du29
         q5lqj8nMRKvYOWiI3MtvmXymWqb9z/MLtm9mNFA6uon9X88Sy9mTkSd9cEPNJOXL8iR1
         GbIrhiRvOwh4B1jxdJSB0vcIupMxXRNC80QtJQwLRcpTfVoaXKZuJyCtvjxfu2L/yThd
         YtolurlzMsw3S6DrcXE0AlfqwlZET6X1bdW5QwU8+KxnZ2wNOWifuZVknAwzrlrDfkrn
         0KgXrL9d8bBEUWTa6tkuyD78bM6QUsRtUuEEdgj0qFICkdMjhnnYo71SOleaKOvelMTs
         0KjA==
X-Forwarded-Encrypted: i=1; AKwUvBwGjkGjj/8j5mldSE5UpHOiVzpGYxzFPe0nYEFPvtlZt6xOBCrQnmWdSinQZEoY2Tai/Zu7wAMenjjy@vger.kernel.org
X-Gm-Message-State: AFuF++mTT1fiw/p/uYGfknf+r8JYedVd70guBBrzuAe+WZCUb6sp6aX2
	J/M7+6bmw9vjRVtX+s2zNG8Mx6cR7/l1cBGW3vkwiaNnqFpxBmW+qFVNqvVoONKLOYNbJIFHj9a
	fzJUG+y9xhDZYQ25PE44ESqHUsjzQvDDIVK6q2bMUCcDo1JBD8zgXgrop+vX7/jLS
X-Gm-Gg: AYBFou27So1Rqdid16YvXt/ZEzqzZ04FfYXV9cHOTvvLWbMx3pz87DAKiigirfe7OB8
	7081+2V+75ShZLCwdxcup9cfo5wRfHyroD53N2tlN/Ay9DDBXCOX2WQl9IO5A5pPBAfMKCvk6Op
	c9R9EmV8KsjwWIHxtBIdSAJPRohG6+xF4GvtPqNJCG7itnt+1SyOZJRteJlBZjLOoiYnHb7thkH
	CY9BElw23N6C32+w05ACtu8zjwmzv73w4eGauJWdGO7p2U8t8EjxCbFj5r1fAmfN5cxExl7NXNZ
	+RnBd+E18+LlhGqJBVOj2JyvcuEMImehjoY2TUsuNwJbe2WubASDGmMKBys/bNh8FUx9wREaIOu
	1775HgeIpLhagAdF2jc7/+MSuI8Wl0Gg=
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230952637.41.1790059266470;
        Mon, 21 Sep 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230931637.41.1790059265981;
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6131eb19sm2655870eec.27.2026.09.21.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:58 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPkismoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3fScytzSIt2UkrTMCl0zY0MTUyOzJJMkAyMloJaColSgMNi46Nj
 aWgC5+nnIXgAAAA==
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790059260; l=2058;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
 b=xz27AUKgWmsq4cpueoiNJUMwVqgqR7+PFLGu/Kha7alD9Gla1nUUTqijulaH493mGZ2COslfR
 Ll7xy0d7Zv9DZE4K2oY6n2ocbiuKWU0nfOOG5JECOs5/w3gi9opuvGy
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: Wh02CT0PqPQSdh7VSMDayNGQRQE0lzYH
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab22303 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lQw7s4k734Nnm4ZOuq4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Wh02CT0PqPQSdh7VSMDayNGQRQE0lzYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfXxuyVG9B66OaG
 AmiFgWd4Lpr9UNkXejAKUlfKiuLf9vPeNHaWYt5zgKl2DKrECsrfJ7wZ8u16AuRS5diRD9VWf3z
 6eUGYRa+S3B0DrwfbzommmkgPLWGkAuHGR70u9XxzwIzCV8zVm+uAFaWRBMoRV+zZVz/BK4u1Sw
 FkMo4nHUlX8Z2c+eUYSEMTPo7hJTP9yYjzTijTs3Jcbr6pFBBKqxMo0DgY14q6Sz5Gx4KuTSAvJ
 Cxo+MxCeejg6gLbiqVvCx/SGvt8KtqmwQBbDqyaMgmptnHTEFOLfXIAfKjMBc/AVgRpavRXqR34
 6XwdUt5tbrCaaM50QwSHX7tUJKH0/owwA/UorI4QFD2LKkhMovAVVDk9LcYwxrLjOV7rEWWTJJ3
 3Prf+dum0YnM+kaaZi6o0wuuIfg0L3ERUtX+EknrUYBJmrKt4VMucmPzcVkCPTMNUzlwvkmY5HT
 8EKE6mYX+bT6aKfhDcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfX4UXXS7yGLFfp
 KzpHbO+WktwWoANgXx28FdxTigIeLQpq9dbhDUGiT/SShBt+CUhNLeKz+ufBZYQSetz5uz2pVrN
 JvPALnIJf0nJ+ifemzuzJ+0ggvQx6Hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220094

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..51fea666efac 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

