Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F63B19D5
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551894; cv=none; b=C+uKO138WX+WDpalZ4klDLRP2o2Jxvj5S4n6CcRSXgZQh0zG6+KUACm1Mvn00+KVzr+R16jkcBAFyDywSqyTT0uo8bq2GfxXSUo53tjY4DG6oOHYLfeepZlsvIiemVwHf3VV9Vm5MLyflM2yzwr+mVSnuJ7wIArJwlfK+K3a26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551894; c=relaxed/simple;
	bh=1sPp6qkgLL16bC9J8/CczkLx46Zc5+CObd4eTssOwD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i8v+PLIFNEmhJapIOAfxAfFoak7THivcaDWPNWVbOkyFYhZMy7XLOdJI/kARApeolqh9rwlrLMxA7daFVvOplSjzWwinpsvjLG80ZwS/arNBVX4oXcszkQmPK+id9TojLa8vrLHWMjMqAiKWi+aHweG8l0wHT9L40Q6KMgQSGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ2dFKLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvn8oYHK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ2dFKLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvn8oYHK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UANSNE811048
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jiRe8cM1xmTVogAyyDIKzj
	saynJQK1XUXAfnmLXh/uY=; b=AQ2dFKLy8GjJTg2Z/P/g1YUNN/LGcctCHOufbT
	8PnOyK6P9bqyC/e20sJSNIBk+/59H34vBtIZ1XjbwqVrsiYhnBbfQCEK1XRq1V1P
	WhhYxSx55/J2hKuH0PAf1t3tEbhcBvF/Q4lKUl4GpEeb6WgCF2x9Er4qPswkRk2N
	lzhhsl0XFrrRaYtGNOvhyZLiHtnqVPW6oXHjDceoUa9NZlGbLKA39YZwdC1Voxc4
	FBAfLlLx9HEJrdGr5FGapPToZrp7+YRoMSjgqog5uPBEq4QuprymK0Ukl6ltt1LA
	WFVtkHDf8zLnXTyb9waJDV0bzQLMBE0Ibp3KyOQYah6An6Tw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q2n37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:24:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso1587329a91.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777551891; x=1778156691; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiRe8cM1xmTVogAyyDIKzjsaynJQK1XUXAfnmLXh/uY=;
        b=Cvn8oYHKEgR42h+caq66dP88KEtJsHgyiUEtYBxAlPUgwve6wFSSmk8R7Pgng2WBLi
         IfrWWU2q5YBO4S6q7fWznYgKyXNeQo4sMVLqh1y/jjeFzHrpfht7AuNwISfj/Bq9FAIx
         NHVhI3Lr52EAigHTDq3HRPLOjUW/Zvn0CDiqJzX2eZthMClxk2V17+TrKAvInqY1R5HD
         KyBLDisJu66zBq3gPq+HVae47anklB6P4d0j0rmKMGe7iX6LzRA8McuHKbaii+a4Qqnb
         cHAXajbuNSOccfFCqUiHWdp8X9tTmAsTm76XJ00N3+zkeqOoNsbslAXbiAgAs5I3uZov
         Wi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551891; x=1778156691;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiRe8cM1xmTVogAyyDIKzjsaynJQK1XUXAfnmLXh/uY=;
        b=XrHM8iAKX622ma8CVn7HdGrV6HxESSgA/miqPrI3kU8UrQRan27hoaxI3yqg+cexyg
         8dHZW1Lk0nMJc9VMI/OqKmXghBK8qzji470a9gWkFgRN+6CPtdULA8Fk77Qt/KU/IadY
         Pb0N2hzqfbedJ1xzKHOPwP+1sQZXjcR+Zn/4U/b2B2xnh0FZJGXQNxR3NEygSqJwN+KZ
         YC+0iqc3z/wVF7XrT7P2ceqtpGSBAhtBM4pjQKUuISuPy659Dd+P1lwNinnVor738q1w
         rjrHO6Ctvr3d44TDU+tFTG2AXkNnGqRc5hFlXHpAjwWPmccIV18iOG13S8iPdmDgrB2A
         ZctQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zlbR26uTYGxhQRNekiT7WYUzjCKIWqFhhCNqFGn5FOVrXtjWEwxhWZ5NXGbH5X5whbeZbQzd9dlzy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzge5KPEnLjJd7KJ1exLQK8ZB2kC77OJSacqb7vlXxoD4wS8w+W
	35+n5HQ+WHdjI+DpRdZ7Qbgw6K/7PahapQn1YBlevc0hubbBnnnZmEBN9INUDQ6TzGVCkX+M07l
	ZPQ9/OkYEv5RhHQHORhnD2WQsW36OaTp0wLMPjgeOviv/oMX2jvCOcmKOfyLszuYO
X-Gm-Gg: AeBDiesCtdGwdsmugfu+EtlJ8dbblwA0tPOSGuCPfOcH/DcF2zw3r8J08EqljyrEiQF
	LVFQDMdumCZFMiKbSni9LHUseqV+zZ+q4OrLOeR+eCB5COveB4FBI2kuPN2dIoPyxtXrQR5gNN6
	8SYASdjA6DcBbO22cchVAfen+YiPMXYUa+XlTvCGS7LxfBA22d9QrKui/3Z10N9TEiiKFin2YAH
	8rtvDVh8wsAWaMAKUl+6AzK5tjSAKCDR80eSJvfRNK4LRzDFX/AwN3pC6UgGwV+9MYZ4ygUgON3
	fKAyz9Dqtx2gJ2OwS6/SL5H2jH8p5ECeHWioZVFfaS0RrfIWxBjJmPOyDfNAsk4bPhjEGQpblO9
	fgSwr2E0wV1xhcskilO8JbRVEJxfeGNErYJ144BBr7K1x1mI=
X-Received: by 2002:a17:90a:d448:b0:362:bc8a:9c22 with SMTP id 98e67ed59e1d1-364c3126f20mr2972341a91.27.1777551890690;
        Thu, 30 Apr 2026 05:24:50 -0700 (PDT)
X-Received: by 2002:a17:90a:d448:b0:362:bc8a:9c22 with SMTP id 98e67ed59e1d1-364c3126f20mr2972318a91.27.1777551890241;
        Thu, 30 Apr 2026 05:24:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e79sm53756765ad.12.2026.04.30.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:24:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:54:44 +0530
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Qualcomm
 Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-smmu-binding-v1-1-1a28572ebccf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAtK82kC/x3MTQqAIBBA4avErBsw+4OuEi20Rh0iC4ciiO6et
 PwW7z0glJgEhuKBRBcL7zGjKguYg4mekJds0Ep3qqkVSuA1GZRtO9FyXDh67C05alqanTaQyyO
 R4/u/jtP7foLAqQtlAAAA
X-Change-ID: 20260430-shikra-smmu-binding-7befe45ecf2a
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777551886; l=1113;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1sPp6qkgLL16bC9J8/CczkLx46Zc5+CObd4eTssOwD8=;
 b=FOl29HQGOmuqRAc/DitTXHvBc+Y1BIXIhzO7Gt6oy++8zB5/N7SvHf5+4YKAwQ4IiCQCXTRpl
 ugnuoIa8J4cCf9P1fU4RFKg86MoZAA/Bxqr/bS3fEJTyKFXiMJWkw1w
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: EwrIGjUDNPZPuLV7DPSAVxpEU9sD34M4
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f34a13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nZKb0XQ6c_9jB4svJKQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyNSBTYWx0ZWRfX1q7sbzNHyA7r
 nQm1QGJLr9b6yXmxdrNYHMth8jngHIfLv9Bj3ZxfpjUgIRL3kKKwwnDT57Xsw0zjEoEscDxucfb
 U+nqlT7ITpyTLuvCTknHONDvTfg7jxQzWCiRe27DlJOejz2Vxw9KSWFIJiwCBghT6v89jj6Zspa
 ePtZq0N0l7S6l0u7aJrfBOZpLElLkNFyKG+8KL/+GkyPwRUjs6bGj5ObRnxGI4+/cDrQ1AwzSm0
 0x6z81e7cfwFy92y9THNsLMsCHdWkT0JZs1El+Yik74Ks5p+t6JyxCkOFDT2+StwL0NNndjhSpj
 3iLc8+vdw6mziw1NCYbIzqUDOF+WpMvTPwDKhoEqxAYDiXDuYgaHTe1mOc7/FgUXUxEzRraWs3C
 JMFE2J9ZrhFX7lmZrQGT+128yn0d40bZngt8CNSHQSkJPfziYpN36Ly1L+K8L8XvE/fNyRTwzkE
 7XpMCIZjn+SQxkItAag==
X-Proofpoint-ORIG-GUID: EwrIGjUDNPZPuLV7DPSAVxpEU9sD34M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300125

Qualcomm Shikra SoC includes an apps SMMU that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to physical
addresses. Add compatible for it.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..1f544103b574 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -55,6 +55,7 @@ properties:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
               - qcom,sdx75-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm6350-smmu-500

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-smmu-binding-7befe45ecf2a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

