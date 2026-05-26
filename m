Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E123D348E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786626; cv=none; b=N4hY/6DaW/smhYVHY/eRPGn9UbFy73Ro/v4asTYmRFArHN2QimRqeiaT1Kymf5AXoUMUbytiCIkfLohUst8mveYlJkwBsUvAgQd32Z0lKhoAPg6Q717Ojv6Edbf2jvvIvKGDX1kXDkC/JVZt18tKb5465WB2vx2+KXilnvH00qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786626; c=relaxed/simple;
	bh=pU8zTR/qVRAWQJbSPMb7T+BR9B6f8N0WanaJydtgIOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XNS62lVloT8kR6UlPGwhJEbT2Fg7FoY1aa54J4QpEfGk99tLWtTIVC7mm9jHQaGGJUJH/CLS+BSVGen+5D+PyHOsSsyhtzAc2UT//OwtGw6PV7KvD8MfcAr3GYDN/2uN6ePC1rUp41C15O8czdxnCJE4GQOC+tWfcGajV/dMzjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF6Nei2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyFxJiHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF6Nei2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyFxJiHx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5TNWR1802378
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9MpKqNNzUQn
	MR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=; b=UF6Nei2kcAR4RP7j8c8v7cCNTJ9
	DktAj2gBXt1Tpu3U+G6NQyzf2O3sQLftKBt1hS5d2O9VmccBAnwHpH9h+ouc6TFE
	ydCuk+1YJBD2rGQZPWW2kmGo3l7NQlH9MMQKH6L5ZI86sw4aPDfEc/D/Giueh2ee
	RpKllUKa7CHA+iHGierwa1OAm/4rABoYRTdbOqr9k8r77BELFcqyRxyDJcKT3ULd
	SRqmp04MxE+6muCQoimTI0H4Onb2UWon4VIwEEJjHLk5JLGqHNybY09F1UId95iy
	YrGAQ1DYJTCkd9InLI36IgYlbQJYxAJuQ+dqQCW/QNYKByI2rWamsZ6K0ug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqkymd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so75774055ad.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786620; x=1780391420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MpKqNNzUQnMR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=;
        b=NyFxJiHx5hBxpQOaLaZgM6AHQfjj2KG45BAdLbc2IIfjRNW+PAiSPxTlq95GFhSXT2
         D5QXcQGtL7ZQR/ASpmfWwxnKd8CjGFzhGGTnnCu3MkBZdQ2xHRXR0LFOABOa+weNqM6Q
         yIFM8zgoyE3fKosHSe2YT/9BcTlhYefWlYt3d+tcfhihvB5jz60mOSQ/vgibbOdSTaNE
         A7zPzXS4mnisfIZTv8uyOqiOVQJTZrwgCcJgwUC8oRsVARe9NJgZA0SsEpCYvBzyzoaJ
         +OOmN4KTkZNlWpTaZEjXRBBBgmXrvdja9lUxucaJp67Sn+2/DJUt99KZPHnKADAwajw+
         R6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786620; x=1780391420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MpKqNNzUQnMR+cmU3gyGCyl3tS5MB81vXFKtNUOtS8=;
        b=l0tIsYWajGniVdAKNdogy6VHH9wZGfzjS0MG8oKst8AVA59JTfjgpoefqmP9eZ4n9+
         DcIe7ta9D2Czpi528SRPmbNgvKbzfQyc2quh7ULGdk8V0ZdT6qyJELRciBOs1z7K+HVA
         AtA1UbGgjY+L5nkKc3JDnAlPKLXZW7Nph2vFKGx1PyvwYsgECKNBB63IA13v75kh4oGa
         iDiWFWakb2OOUHJiKSwPoLWlok0c9PmKt6yWeVIRAjvbrqtyc6qafe1Jyppjmc0HQtw7
         zqU47Frr4hwM1lBO+1rUj++v/hL/gpDh9m68VqA1FaGQaS+0t/B1VT9k4F8Zb+qjun0h
         shaw==
X-Forwarded-Encrypted: i=1; AFNElJ9WEGWK9jQt3BhpFt2qtYU/jSlA9J7TFlhAW/+Txy3f2rTSK9ItbewQwSVt8G6P63NYfa19K+xzwByi@vger.kernel.org
X-Gm-Message-State: AOJu0YywoGCtdAwH2F6BNzR/1IWvveM4Ma6rMnxlQZhIWY9jMkrgX4TP
	pNLw3/S5Of4n5pGSbC17PB3k5gNOEArpkXn2FHSvGD7tPg1NWSGPj+YOdUNMalbgMQMjJFbPwEw
	ERV2ffy7KQuHAtUnt5+owepAp55qg0+6tb1ycyYDTz2DMshCy9nQ9VLj8kC8y10+V
X-Gm-Gg: Acq92OEF3EwG8Dfq6wMnar9imXg+ShaYzVC46Z4n0avD2UmmvQtFnmVgAklH22YrGEG
	e+wNETPGvHeDExIDS5yfB6Ed8lPRsHf0m4G3mYEdUuviOIHjjSBhXozv0YK4NRSuky0vIYt2zdM
	4ti8gWl7bc/Madimh6rKwOasGj8mf+wAMIz+GBdqWSlgDmL4xFmMrBjjZza336PwflvzxRpQo36
	SZRtEPJtbgg2ktbXubwFtdmUclPG4x4v1HhlI6yhyi2X97c5sXibrQnU6dM++4814nZ3xmhs4WJ
	Egfis1G9iF9Fg569x3sO5bfRljeZ6R6llb4y8jkYSk+nyYfXCJUaSPj0W2lwwN5hbI7i4jSBYC3
	+Wule1kTsYOd3ZinciwUiuKxqIuYqN0zws5kb5UaFlb7PS1QbidzDJFWIOjzgHtz0
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr186884185ad.34.1779786620084;
        Tue, 26 May 2026 02:10:20 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2beb06a07cdmr186883735ad.34.1779786619631;
        Tue, 26 May 2026 02:10:19 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:19 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Tue, 26 May 2026 14:39:54 +0530
Message-Id: <20260526090956.2340262-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a15637d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: NcLAHBSA_Oz-MjtXZfRKYfw_qaFC0kN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfXzEaornnFV54D
 xoFKVVhND7/YUt0ggnMXFx3338/pGR6yqOOBUId8tw6Odgd1/2sTwL9ckdL9lxty7ogpOXST3Gh
 rIX4N8aphAeW96A4NcnUOHGGYwzTDhld8h238r6d83qS7K4Km2G0x5JM+gRX9ks1uj2Pw6D31E0
 iQmON9zDJwRD+lhepxaD0cxPIN3WVf6E1inqX0kl7yrRRcGbTZziYmC0/jcVfSSly7UEPg1m72W
 VvoAaVHzNhH5MNm8V5aBg+LR/lTqstTWAhp3/oiBsym3WRwxHRfUXcH7h8mwUnst/LYQ+HqTtaR
 nZD21n5lXApyWifWxlFUWPEK494JZQ3Bu4ca/C0aHQ4SisyhIMGryQJ4Tu83vqfjArGNWpGUYq+
 4YqRL+vTQXYDkC5Y+2IB929OaQN/FdfPmTd/RYOfTZZE1U4W0g6qqda7OuUf9V7BfCtKwJDqxg5
 FtVWtKBwSuvarin/F5w==
X-Proofpoint-GUID: NcLAHBSA_Oz-MjtXZfRKYfw_qaFC0kN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260079

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b75015f3ea70 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1

