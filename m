Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12348364058
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065042; cv=none; b=epOsxywB8mPVu/IQcc+CU25VD9GtJKlUYsbzI0sTVZukDqSsJ5WWjFwsTTVtFjJLdsjs1kDbsH2krl4HWc07gI8IbFIv/tT9bxfOV2yPrISbifr8HKqiuIkqhtIeIC6R+8meJLpBIZni73ToaZLR+9NuuI4HsSsgXsZ18KhEfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065042; c=relaxed/simple;
	bh=U38Exkn5F4K0dBOTHvXgeHPpIHPzDyvOnWH1mlmNjsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nyojktZZH6k2xLCeRLK/756VcuDlMrKNQ5A4RfYcV+fRu0mE8mebZQlXMoMRO2yDh+qutAh0oRxDXFisxmGCOdh0C16hfLEVjOCHZZU+GoYLdZBz1o1Vt/wQ3zkpvaEyrfLUuSoPsi7XUWd1R5fDsffzht0uqjZlNo4VSwiqxmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkSY2tDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps4qW+Tj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkSY2tDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps4qW+Tj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s4j83148185
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=38e/h0rBiS/Qf7sZDXyxGk
	btU/FLkAzEU1CnnW8iABQ=; b=ZkSY2tDHk40SQB4KRiTxhHXS7h8f1FocnhMrWr
	FL5bCRoSftRFfMrnKqiAafOEAs71JnxeqVADyC4YW2DX2y83WMxNbT912QhmIgEu
	8xlVr5+R5bnEh3flKSkK6aVgu+UBPe3Is0VMxL//4dDaDsMXfbRaZxoYmUTYpclf
	2n3NwdJrZLognY13Lyljc1OAV6F1zHa0IXviiL8sqJw9B8N7c3d2zSuZdvbO3xiG
	UFqoSPvNgjv6ylQwxcM3F5G+cdJMRHkd9RLQGT4i1jaFuHTtBC22QM5QdeUfCtyM
	MdaFELLaetQV2XXSMDFtr17ul3j9ZzV2nvmeLHMwd9LKDiCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvww4ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:50:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so593194a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783065040; x=1783669840; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38e/h0rBiS/Qf7sZDXyxGkbtU/FLkAzEU1CnnW8iABQ=;
        b=Ps4qW+Tjia5otH8SekOUVVQ7opvcY6mThthYgyH2oj/C9rop03VPbE6svOlxgvBAre
         1GpAMd8PRNmBdJT/moc9xdYLqcaHUzZ7j3T8q/s7Fh/LLS47TL/4P3aov5LcKpY6xMyN
         6kiF1a3THh+VejhV1eK6i8iPXe6N+tg+ii270DFuzY3eX12FcNAkRFfvekv1lbNUFyHk
         NW2Cf+Nctd61LceY9V2nTgiZ+VwZUHA8bW1NPB2FDYOVCdmLpdbORdJlMpfajSkJ9vUi
         yNVfepsW3gkJkU+ekAPVU6pteh0JjSEfRK/J0nZyFmGCCRh48Aa7VqBq8PIxuNZ4o3qs
         Hwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065040; x=1783669840;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38e/h0rBiS/Qf7sZDXyxGkbtU/FLkAzEU1CnnW8iABQ=;
        b=echi9loPY08ryFZ5r8BFgDqwXr6O9OsHergFRZWqadbV4lOLHn/aciuZMNrpjoVZ7Q
         q/mxggLxltZtA0dwzB/l7dP/GB5wYXT9bfpvDZGCUrSAJ6tbALCPd3I4tFufNIRGxAb4
         f9+9DIjuoPMMSDeSdGTQI6iNEghgkgkULprQ5Fqr2DbvQ16Fx4aHJw54VNghD7qmeuNP
         SwQF7l/8ft0iFQBC3dFFcY20dPH8lFRZhE9Xl+OhNG02Hy5y5DlVThliBoLIrQnNgU/Y
         Dm4CLDRJVgh2G5aS7dK+qZuGDX6epmX93m9eg7bufIeTkp1u2GLN8fvOiV982GnQSvk2
         BnIA==
X-Forwarded-Encrypted: i=1; AFNElJ8LRIJSSfw4aWSiOiNsr4vrGEYwrB5CIDW13XK35nmecM1n0E1HBjmFebqENdGutvv2+l04khJAPepn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/haqKt1cikhLk3w8yGWgEN1JaesVif+8rDHwK4r+XA3HqYZhB
	WeC8Ss8YX6q0w1DUXRoXi3EntOfZw/dT1ydfSoHLjDjJTxb484A1CJ+1p5mbB7TA8mm0qnNeFC0
	0Zg2Dgbvz1xWBz3vDhyAXED+Wjg8E12/2b1eKCltKrHm4OWDFITa0BtJWV/Rqv0XD
X-Gm-Gg: AfdE7cl6KMFVtuA2NVmp6yGWzkQinoXwv4ZiDL+sANBldzwO2IfJwzvejDNfEVYyUkP
	fpcgE0/IENBDQrCYSQ+XK7+OirKX8FrLMW9OUZIkkp1UpSKCdjJ4pHyUswiGP/0XiZpRjUkz8NB
	/0JUYASuFOMb4UpiNaqI7PFDEwftN/Hhf721FsJThE1ZfeQahqq79L2v6NHlEDPBoUySFjEFcHE
	LIugRSD0EPP6rJachHb50DLYi6qG7oeeplpuELSMnSNQR2w/93GDw+9yk5LiMxWG1T8+XPpfhG3
	MfD+6jqEfnRcklpgK4w+MdmGC6FoIs0xtOuvyeRkw3SZTzAk/FjpjB07AIK3LP0g39p8DmrBIO8
	BX4r3hsyp7oQ/OjN3A1XzLqkHB4C8br0R4T/CL32EwoQTNQIMQ+H1O9l3LLqs5Q==
X-Received: by 2002:a05:6a20:d52c:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3bfed274077mr11178601637.17.1783065039646;
        Fri, 03 Jul 2026 00:50:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52c:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3bfed274077mr11178571637.17.1783065039177;
        Fri, 03 Jul 2026 00:50:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm20729977c88.12.2026.07.03.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:50:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:50:33 -0700
Subject: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMhpR2oC/22Oyw7CIBBFf6VhLU2hL3TlfxgXU5haklIULNE0/
 XehLjTGzSQnuffcWYhHp9GTQ7YQh0F7bacI5S4jcoDpglSryIQXvCkaLqgBPWrqjZnpHlXRc8n
 EHhSJhavDXj822ekcuQOPtHMwySEpYr1JsUH7u3XPbTKwFH7ba1592wOjjKIUdcd4r0CUR+t9f
 pthlNaYPB6SRgL/GH7+CzwaRFtVAtqmFSj/GNZ1fQHj9U1+BAEAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783065038; l=1717;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=U38Exkn5F4K0dBOTHvXgeHPpIHPzDyvOnWH1mlmNjsc=;
 b=/pzt0aDH3YX449O3+iIsthLRn64BLGWMr+/DRFBjwkhN6NDmKQrVxdpjzhWYxZ6/GMr3MGJtQ
 jFu1jgHClwLAFGXkjHXQIczQcnEK++d27l2UNsEZKMVdqt7yhcf2wYl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 3Hw6hvW1PQuJaab-icepBcoJlWayBrx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MyBTYWx0ZWRfX8AY/CcLG4kCi
 QLhCRx1qYnYlTlOMz5reW4jRC9gBbIZanqKPss+X/18THsAefU+kAepX46yNEIozhOMpCJluFCF
 eFCyPf6aVBbrtgPjidMsXPwsx9Tqhn5p8tuh+CudBVNQSRryo/qNhiZKSQWFhKIFJcjTj1odxiu
 ly8PCogKvm95oc5FM4mVsZkqk/oxMeZrb8y6p/BLXT7FybzciWtMC2+FfeJQBVKhdPPU07Mx34R
 qhrQGhSdZlWNB5ORifD6HJriIm2Q0p8gvhFs1apvxHT7LC+lyl1vNwV5PDGn7+WnF/vsa8YbwWC
 KgRtZapKaK8urGvKtdaIY2c27q1Hlneqg81c/hYH3Gw0H6zvY97OdEVrw/Wqaw+XHiF/4zQ3hNc
 TZZbi6Gn8c4lMWvDZCs3uHquzFXP2uL7lpBZXkAAMH8VdNWwNRSrsFWPgG9GoE6F5/mybp2EttS
 y+mEjEhniOf0qGgFz5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MyBTYWx0ZWRfX/Zp8ZxlZuGry
 dC6t3QGuSox9zX5nnlxLEEATV9WcQDf5jLbw1cAc0HsB1ACPcCO1exdZJyyRFwD7UNZMnR99xyy
 HkMkKqhSxISvXMeoKFThoXsWg3iAx/Q=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4769d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 3Hw6hvW1PQuJaab-icepBcoJlWayBrx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030073

Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- add smmu binding to the block that disallows clocks
- Link to v2: https://lore.kernel.org/r/20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com

Changes in v2:
- patch rebase
- Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..fd095161f6be 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
@@ -621,6 +622,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,maili-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,nord-smmu-500
                 - qcom,qcs615-smmu-500

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-smmu-9ed0f2c189ad

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

