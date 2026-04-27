Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7CC3EB813
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314390; cv=none; b=ukHlui5nhaz03sNNfPg4x44BdmU3Gx+cjZGcJNaStVvLRBznPd7+1LwvOXETLXhusRogI3wxEkrmz8HO+T4XPCycWtAQHFoXJcd7xpQIKAqCDXwv9FIeBh8+sX1Y06IOwStxg12Bb2YGEd8mb3Z0NesLfcIt457wuntBudVzcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314390; c=relaxed/simple;
	bh=U8lIKbZx9rXbsiG1JAId7FXtYIm1NV+WqS353EQ039w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SS3zKuDZte3UXXmGdQtYa/SxrGwUAMTHTNjro/tzaP9kn9wB+iirEZLweiZuhVII91EEp9cOmtRftEU6IQwYTjPzgt8x3FQaV0p/3JpxKr8afS93sCLutd9e0KzLxZdLiglBiWlnilbraPnETiregeVmK+UW5DG41F2X7gFi4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvkQSO6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk08k0QQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvkQSO6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk08k0QQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLKJN440853
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsen
	khXkycPk=; b=PvkQSO6ppcDBRoA8LW1GXHhbMwV/GjPjshFBwnVeHhkPceUdUsG
	HLgvHFkygcvVAPOxjObhlDGxuOGZXDT7V23+1eo3jqFxyUo3d5j7MJsBOmt6wH89
	/K/ZbuM8j7Ctk8JehTy9/8yVLC2oDXX7rr4Wu3eQFjuYRPFSdw0oaEIB7U5TkQYa
	kc42n0SV7G0KTl1FE+rc0JiYR4hTuAp11j6GoJqh0hUpMI+kZfGNJsOG1P+uvWaw
	NMDqDq+AERJafbxB/FOFEO3rYV9EofgaiOh27yBZH+B21Z0i1YXK5jL/9phZaQL7
	f5HKhYUIG7pi5GAtg2Yw4n1hgGFEK4rGzYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac40q5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso25048603a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314388; x=1777919188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsenkhXkycPk=;
        b=dk08k0QQd8LEWNbBHgx+cYpPhEOYha4GwL22J3zHsXhv90T3DuAqQpNn5afS6PlikG
         Y08c752MuKXRrFj5K2xEcJ9egQsHDwTtgegwtgNfsMS6GcqKBkAzehdd65MPBETo4SK2
         lzskn3gYjhu4HCARrCyfDjk4HEPy0qfRnVQuMJHt3GyZgSP71ekqI7waemGT12EUAWxa
         Bevuy5/nFZjsKjwXzplXMxGY5VNHnMWVU0aD8pnvBHHj3ZXUbCVXWsnMJx6OcegQ79TI
         qUBJwX6FRpD8zInC0L7gFyupCqg7+eZ4CZ/ZRzQUotYc7ecsGHCjAgcYKdDX+swbPIgu
         aEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314388; x=1777919188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsenkhXkycPk=;
        b=fXJXNsTxm4QiPUBsD90dvOxEdhYgNY8T8wjRMTEY54JcYjUhiy2LditKisCPXzBMvC
         /ytoHEnOXmKrI87W1CLr4QVdEodElLfCmDp5DeW9oAK5MsAM9at8tWmVk/cs0E3349bv
         FvO9F5NNkMXjfKKRV9uA04WSWNqTlSg1DHyP6uVczl/8SzsSpPqY0z26DZ8bysDDz7hS
         xB7FjCQvuj+PNed0cJeIfvOLSk/fPJsBD3dclmuq6/31Pu2+LUQ9ejQYA2TBnnhFYQoF
         R5RQ0gSpwhs+3BrkQRYfwMpsXlwz8P+okeRNg8ScbmGuOZFf8lyt9OLyrSAdxU42GNda
         MwFw==
X-Forwarded-Encrypted: i=1; AFNElJ8qM9OeTeaEc+A5D7hF/kTB33nNlcF1vH6SoMrpUFGKQDk/wdASFEwuQCmS41oTlIR0t1+sfKkjapXG@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyM/UDAsdpXmfoIDC16ZlnXj3n/jQ4fld1x3hLcSYNN0VEhvi
	0fTtB3qcIe+ObNS7HQypKPftQKAcG7uI7Ri4VU0+PcWZ2yoU6ZPjV+CFvn7dMwwqNhPNMiO3X3I
	qRMi/0KE7BDRPzCimmThXUPoLft2NCUMjQViXiLXgyh92bipSOOhUaoYjBIVohwWr
X-Gm-Gg: AeBDietDUmPu73YlAfwYx0O8z7Ba5kQ/A0nMiSmchDUjEVAKVli3WhwR+OTIZi/CFOk
	CbHfVZGwdNOKCPk5VAsxp4n8zL9jovIf/hLWPoS/t7/certCQXQb1tCUHfOHD91uqPTfJ4AbIxO
	vCXlf0fo13VXJQYjwfYJvuEZeKBi4Il/qwUyYpR4fje7yKHdDGWLaeX4NyHYUtaBZTuz+EuWtfz
	AfVV6cCyYxLKebk+535WsDc7uKVoSymAHJI8BaX45bwLgooLk4l+/+cAR0H8/p3IWuIN/xPHKGi
	X7KquODokuCGCjfaKgqnFbcx5sTxiws/R42x4L+CX+ni0fE7voRE4nggZkQbVFXREnPYrb4rfaU
	MJ2Vvp9Gio3LoiUXiJGjVmSTyRTwEvqBH8u6SMgdmR1jlvXotgIa+FlRKMTM=
X-Received: by 2002:a17:90b:4e88:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-36490c431e2mr231697a91.11.1777314387695;
        Mon, 27 Apr 2026 11:26:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-36490c431e2mr231656a91.11.1777314387119;
        Mon, 27 Apr 2026 11:26:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm286231a91.15.2026.04.27.11.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:26:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Date: Mon, 27 Apr 2026 23:56:18 +0530
Message-ID: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dD1GqTkjlF8iFR4SQJ3os6T2rO4YupgH
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69efaa54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nVr9L0G5amw80CinYOgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dD1GqTkjlF8iFR4SQJ3os6T2rO4YupgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NyBTYWx0ZWRfX+YEGKxfOolkD
 AIS50xCwGRlYzku9JFNAJXaZ9Yw9k0imz5SGoH+qh21MkBEENSH0986s174K/nus4wkoeMZ/1sP
 5MKGw6feHOwJI5/LJbH+dK1IwThBNfUPf6dx1uelBYmev+y81XbFXLeaEHkWWtKTkE1ehircXzo
 BibI4yqk+dJNhoxbyPaJM0/RtY3wn37MmBsUiz0XPw2BCUviqr8o/5x5ziixw4LcDjkB5VtpfM2
 YEanJs8PBbr5ThNdaa0+nqx/W65N1knFiOtUldHBzRfrGmRpPnT14qOsCenf7F5Nx3mqud+Bbi2
 5LJAALy/Y4xFYnoX+B2wuIHSX4WA0K3+/OquXxHIXJXAOzYb6jksrS8QElTcKtxAgD0jOT3E7aR
 61vdFklUyAkDiIlAOQfwHvILklu7I3pc6Ddmi1TNBbSQvAEN8ANrUf64Lf5AOT68lrUU4X5yNyi
 vOyKcMsJ655ut59QBxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270197

Document compatible string for the QFPROM on Hawi platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..6117dd1d24d3 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,hawi-qfprom
           - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
-- 
2.53.0

