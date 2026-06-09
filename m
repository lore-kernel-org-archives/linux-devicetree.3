Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920963B47C9
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021779; cv=none; b=n4PCJEa+MiP25iaF1hv5rvVzP07IXfnLi3L4+nj4BgksA60U0SkEQB5/UX7HQTZOGYiMWkfhMsd6UtAtGc6mNbb5uPElAQDVOWew1WkvpY+6Z4wgInvn94CkbPNmyG4UcwMZuEl73LyiS1g+zsQS6SzNSeO41zX7rGqRVFK0xhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021779; c=relaxed/simple;
	bh=ehmCceB1Usjo/FqCtaacHOk9iR5fZCv3ObDqoDrh5oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kl8kop5SkLcAlipL5PRD59Z1fi6FO1M3G4e38IWSwezVIvOjxDItXua7x1v7WVhbeKQ1467ylMJisDmYOh0VOyfN9uVLnrdRRx365wrTumXLjrG6dEShHgMysTWEchzqkZUbkVyrqTRm1s2qqZfOJvoqJF2Zt1cFw3hvhfS4pAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3jffM2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGXN5VTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3jffM2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGXN5VTR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKaX2251625
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=; b=X3jffM2puwNmlTpv
	i+8OLwsdruhjqSqLkf6QlGB5WyKN9PQNOcodNAJPr2PEaTPC9WVIdqeoeO722Jr2
	lXDpxN5c2BfpdxlWgGV9PlYsisRps8a4LQNXoplJsrvOsOZJ8/0YGeNtZqCU4p9N
	0f9Kvz5dQep6kt6Ob5Zrm69QQw9oI5XRouV83SvwW7ZbZiW+NDZzdjyp/P2Pf9or
	FwHTrJJWjUPrJInYcHqfeMFcTPJIuVAT9wkW5CB51/iQUJYmPH82PGdyeZChmZrw
	cNNYIfTKgnazMG4O408jAcg6JInCeJiDfgfCPRNhqrr0Bq3PyNiKzh9Km2Mpa7Pq
	vSxkig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgjecq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 16:16:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso9793091a91.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021777; x=1781626577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=;
        b=cGXN5VTR1vfivk6LKhpWBLXoVlhavrLrAvsCFyscSLXhWCdCDeL8LM4zB4HXbMrju+
         dAwlBIDjrj7fufxFadoEONcIsFEhdPHcoO0YM0a1V6EZ3s28eDNp19vSD5P5TYoybSjh
         eIbskkzTGbml5K4VTftXgmxVKNcMJ3viIDqx2EZ0zX3SWr2AhcGo2qzWGaB269s4U72n
         +BTPVLbSxxJAV/JUdcT7ctBfoNj/6hACvplI7Vj510TM8PYtlgg0viMBaadH4D2Yskaj
         UM5XwvDWo8nRQXPPi5Q0SjHOzToV8dqsL+RzmXvZ7Da8DEJry+wTem+J3oBZeT20Bta2
         TaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021777; x=1781626577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=;
        b=RIRqxkzNWSzOCUqxzcblt1y6SwHJcMc9v0yoSfJwan8QrayftTO3+Aj/nMjsIQyjGN
         cwEE+VdatO2giCq/VaPLSV4Xv4rTYQcBVm9PBcttHMBBU3JjdDlRGd32UsuX+ZNJ4gUa
         zRc6c8djZKmJuwb0PD0hq05Z6LUM4ltHQGKwzaEL55jqACtZM2AzxffliOgf9WCq3zyT
         TvQ5Kql+djyxXNh/soNl509JvDIzPgkep5ip5vzH4aWnGzAe9sMTBA7q9XpSXe/08gUz
         tOtUBDfBv23LeJYJZ9+e1ZjeoGn3xs9ixj8G5MhZlE8o1Al9xop0gxXPAEpGaIrOHOBq
         DX1Q==
X-Forwarded-Encrypted: i=1; AFNElJ99wC464v1K+b4VykGqQFCbuTNy3GRnThia64wnpbY93RfrzuWjqyzaQdTmUQ892p5rEMUfDAEQ4Ni5@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZjTOnNwV9B5Zn6fI4IPxUWUKR15zTLmoFM02cLnXtIWQvx9H
	WZB7Xzds3tPAzBm4P9DHWIHp5OW2MO/PTgtQ+2TAqOJvzAFmdcXstxApr4ifuHW8YmEE9yZghCE
	a9YS8fpJYniPDQ6uCVy+jzbjjAW6MFZX2AS7j6EsQ5YRUa63/aB2Kglq4Ao1Z+mil
X-Gm-Gg: Acq92OFHIcAW07+JDDbb6ypn4iovW6YYGz1kytkrqNQuU1Uh3AFyyNDqqa6+JmjHtl0
	fnZWirk3D5jCpcB+dKwnej7lEbhU4quQtMYnV31pOMlUwkCtV4ndAPvvGtl0Jq8TFd8m4TiqBb3
	uYqLAYYuqHqfW1SeuKLiJgcJltfvov7qVkMt6yBaUlUOn3H1kvEKlX+3prxR3JO6LTtqh/hDaD5
	adXhRoL+zypLxVBya0ocgMMozdTkqay6StmlG6FZ8vCG8KzAam92QJBwomU5d0LRireQCoGqJpt
	tNPf7Po9BDWeMZTQPlYKD3sxv39FxxuFLciZ6rgDGWa5Lu/OvUVPEIUAQe3etmodG9EUk9t8U7L
	+Iy5Uh9UByosk1M9lzZVswcKKMDUEkO6eatOfxGWfVltTgOg92ynGLa2Bzc6QPABbOqk=
X-Received: by 2002:a17:90b:5106:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-370ee82fd0dmr22403469a91.2.1781021777102;
        Tue, 09 Jun 2026 09:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-370ee82fd0dmr22403432a91.2.1781021776624;
        Tue, 09 Jun 2026 09:16:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:16 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:40 +0530
Subject: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=2185;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ehmCceB1Usjo/FqCtaacHOk9iR5fZCv3ObDqoDrh5oo=;
 b=/E1dPUgVRbNCyXj/0pvlvKpZ8Zlo5cHJ8zELYiTFuncIOpOYVEUAQSwFUp809rhBlBF6EWEVF
 WpnxCjg/UHNAcOXr+hx9vOL2s8yL83eWCL94ZrPyGiuFAOxDztmhS4a
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfXyKDmOraBuCuF
 WkYiUUYeH3Z3LGQgH8B5SiQPvZNEqDc3bpasqp/twNtYWmT27tc7hyqRyglVHNwvHlXGPdOYrUQ
 LyTC+uZ46jvFq58AYSfYc+NlQ2yt5Uz9Gewkr0sJGlqOM9Mnkk2MKMknWQC4CrZbfs8KNJXcHiU
 6YXinz/xW6z16RjCrIzuYQhNWe2irU0fUHEbfPfSjML7HmB/w1Ux/mFaU763QvZCPQIyGQ/o6BG
 Oyz2v14CRE+feabgWA+BqJGdQmhxp4tHryTJpI1+KLb9sj9OcwcP07JTqXdmIujt0jfK4tA1a2u
 JlCXgRSIVlo4+j7X3vY+fEPYDela29KAd5QRheHU2mrheocFdsNKOHObxdgHBHE74scH9LwL6jG
 hSrRhCasQnDVsvjYUxcCj95nX/hsdfWKYSjceuz9EzD7HWUzEfWC1DPcKHTiSodNU89TKpgsE1h
 dOWj+kMPiL+PXM/cWnQ==
X-Proofpoint-ORIG-GUID: gYdjc2amntxTYn5ad86qBNWtfRbD_nUT
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a283c51 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gYdjc2amntxTYn5ad86qBNWtfRbD_nUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -15,12 +15,27 @@ description:
 
 allOf:
   - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-iris
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
 
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,sm6115-venus
+              - qcom,shikra-iris
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +60,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 

-- 
2.34.1

