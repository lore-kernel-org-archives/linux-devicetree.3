Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C3425CD0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600582; cv=none; b=TNcy7vQlapw9zUamrVT1PJ1wtr1UZRUOtqseQhmFSyucpLZVDEPhCndseyi2rQZRSczhb2FdCzbHT03KvmYjdXamSXw7tOiN3c1Vw6kC/IYFjZzOWmHlZiC4BnRmrQzSTnNtY8AhnsG+sZ13ARBaOvw/zgplHSzFAwZL23dnoO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600582; c=relaxed/simple;
	bh=FZhQkSnMM9dPRPxJpT7lhmUWUWrvHN2Yh6Z3YZfE28o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uy2pxzdR0WSwbaLwMcfq6Dvb4S32thVbYhDF3btFfQCU+ymB9fZt9oXWDnPhfj0qItoDRRMdV6xmWYTdN2VcWqvOolDjSOPo9Q95PBVZiq68RKdDRzOJZsYIfiGRlTSRqpt7q+7oy1GMQJlInWMR3YXcEGlla8b2Ike+E/t70bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU2euAsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ujv16wp6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU2euAsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ujv16wp6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN4931450385
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=; b=KU2euAsZzJHruV8i
	NlofZbkin2W4jax4po89X+daOfnPZHOLg6Qflp8WWl1H64hfKr5aohqTuSfh7WXN
	fN4cR3BrFdhAYusvXKoIVPK9UX/SBrWebnsx2HlM0+fxOJfp43w5Ta1VDW9zif6g
	iBN50IEtevJFcrAw+HHAmsnbUURel9DiV4vutg+CDQixK0zq7A1tw0yuzp8Ybhbo
	bPJe6AirB1ujmbQhGZfrs0rdakjeECIaAOUG9pN8xHcxeCSTdPwYlnWfiXwczDu2
	cb5oTS//WiBI47x+1WnHPmVmKbHrz3gS4BbPUbama/bfOqCtaogEvnhWoh4h+TiT
	d5WbAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhxch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3881937456bso1708926a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600580; x=1784205380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=;
        b=Ujv16wp6EvjbB/KZGRcjoix3k6mFe4wiV6wKe6NymKrZF8H1I4PWQPgv7aQtgMbgBS
         a36h6kqBf0vuJU+qcfPxAE0ykXs7UJO16PuRW0W+bIULvWOwgXojoMti3Fo94ebU1Yjg
         tA4xbdsU1QTUIcD5QnaJdCyWhN8rPwBhh9+tbpweTWW5cIq+uvDWMKWq19DQHBGN8v3p
         f0ffNIw4PQZLhbdX76m3JcVxyfM93LDkRfLagExsx7UcdDUATQb1yWX1CUpohGssgsQz
         iq45hOWZlsjLRHhtEfp3idcUHypqt1ACmr9zpGbX4GDnl8Z02myOusPFjCljgMqI2YZb
         2DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600580; x=1784205380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=;
        b=UVLg3/oRFQL1mJL1zZCk9F0+qOeQhJWw71e7zQhJQw7Jaey8uPS2C0zLLf6KlfCf8q
         E5cv2v0eC0kqfq9D3ybZi9dSc5uPd2Iqg/qmt/E338xh+2dhnGUH3jR5P+YgvEsMnL0/
         JqlIb0fkZYs3adkblq40KNQpIpSyzZgv4pZVBZ7iJRqJszpEblPBvM+PEi6RAzK9X4Ab
         E4Ob+MCrNrKTe7MFNuNKevk7lJLnsaC+VhsgfNMh0+ZszlY9lPL2Y7JLZ+L7mnUIhf0O
         exGuLFcbuuWwr8C0I6DxwieKfy1tMuIYTm39v+e6nyDYSuUGKecDXOYhxq/FJLeRg32G
         iFmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqkzh8VscuVpeJ3W5fJhJw+o/RozhpMBYt14uNv/D0AojMGwi6XonKKMYB017K54VuSSk8FZGizsz2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzVObGIqHfQyCyUk3lMKuzpXCDRBqEz4szXItdRcO54Q8se+aag
	Hmock+5EGII4yn2l81eWmUa8MR8VpqUaKHGGS4SYXR/m9ImdP8XzqqbERixLnMLxz89LQP/Hm/e
	3soF+deuQwiv04Oa3PQvmBhRPzKM9KW5t0Ilr+YvXq0sbdGttmac6SPeKuEF67V5f
X-Gm-Gg: AfdE7cnwPdwmBo1XCi3PYqEPfZo7+Y9UdGQ94bwlXAxikuxhzYviGj0E5brPomeFYyY
	o8e5qkZR4SNEwJt6m+qtW6/ctrH1nF0qnuyOjPSa7nuuFhlZiHacnjMQTN+7tmfUlwjW/RsY9Nw
	rgVtEEo0G0yfD6ZvBvLlfs5MM86LoE5QUMwehJMTf6P9zurvS7bFUu9Mn70KdITjuVSMZe5J6Bt
	RM5SEm48vpw9+ZfcVeMoPsTi9s17F3o6lvVu2MNyG6U9OOgmBj7o7/mMDm520kLSbSkvACR9n8C
	NIBGQDLMj+zLiz9qA2LGA8M5dO+bcMKHXaJEcHBOFkm3Kk6gGEZ+lX9eS0onUh0UTS+4FqKG7/9
	x0Zz5CpAOYHhqelfEZpWXfAQhFC1rPdsTUqf2j+NvpjOI8g==
X-Received: by 2002:a17:90b:584e:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38b75deba5fmr3144366a91.20.1783600579649;
        Thu, 09 Jul 2026 05:36:19 -0700 (PDT)
X-Received: by 2002:a17:90b:584e:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38b75deba5fmr3144306a91.20.1783600579081;
        Thu, 09 Jul 2026 05:36:19 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:18 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:47 +0530
Subject: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=4197;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FZhQkSnMM9dPRPxJpT7lhmUWUWrvHN2Yh6Z3YZfE28o=;
 b=4BmCNtKT8f49d4eMVC+mn7H7tvLVXZyANyc+VdD7aWOA75ngBiXNUSDb2vnPWOMSpEi+HyuBM
 lmVTcccir5LDaSMqYrSoxqAMMxo/AfGdv9whGYUXYEz7u3eBjk6CfDZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX5w4NPlMsVLRz
 0z0E6oM5EP5aeu9boL5R9FLU4afg5LJwuYcqZqwmWf6CVX6iRiDM4qP3AQhzvoFIjaUBiwgZt4W
 Y+ZCgfMtndvm456TDDQrmrIwWg8fCyWFK3fsSbF7j9TougZZPiE5x0RhsFGddmEMeUkRZ8cdI0Q
 Pp65SjWZNwxyie0cwvJvWdtCnXjq2GmJQM3aWLChcgA49eT+O1fQrokpz8kmGxJn7EyTg0zy+lq
 1j1Igv/JZlZk1tBdlF0Nn9I5Bb6H6XJvxu8MeiY3wQfqY0tX22XJWrLnYzzG968y3mSx6gWd4UV
 0kmXe0kca3H/d9l3AePMmMyQ22rMVtju5/drtgVJz8MQBh1KrSUInDNVhuFoyoD8G9nDMt+Ttys
 4jC9Z+ktHe108Oyyy1foEuov9BZA9rr0pBzt1m71+SUZD5cJ6deQiBv3oDgYK6FH4BmameRXOco
 Z46gH5TT8lGffR/EINA==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f95c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=WNFrAvLKAt7umNMUY5kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX3womHQpNqfe5
 pxDyl9Y2+FOkioYjd3KEFH2zcuxjjlpJbhEgWc1XmrP6y34uegtpCTTek+6GXOoT5CQ7cf7qWlP
 T+dhbe0gBrR435W9cjYNbz4maG1yc84=
X-Proofpoint-ORIG-GUID: _09PIcdyLl-VUrAiaeAq969giWF4P9by
X-Proofpoint-GUID: _09PIcdyLl-VUrAiaeAq969giWF4P9by
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

VPU hardwares have a limitation where VPU streams are associated with
dedicated addressable address range, as illustrated below

    +-----------------------------------------------------------+
    | Stream A reserved region (600 MB)                         |
    | 0x00000000 - 0x25800000                                   |
    +-----------------------------------------------------------+
    | Stream B reserved region (3.5 GB)                         |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | Other reserved regions                                    |
    +-----------------------------------------------------------+

Mapping a stream outside its expected range can cause unintended
behavior, including device crashes, as reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

To address this limitation, the subset of stream/s are now represented as
sub nodes, so that they can be associated to the respective addressable
range.
The limitation could be exposed when running usecase like concurrent
video sessions. The binding have been validated with higher concurrent
sessions across the SOCs supported under this schema.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -91,6 +91,51 @@ properties:
   opp-table:
     type: object
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
+      buffers. Non pixel buffers are compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 1
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
+      Pixel buffers are uncompressed buffers.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  firmware:
+    type: object
+    description:
+      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
+      VPU when no hypervisor is present.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
 required:
   - compatible
   - power-domain-names
@@ -98,9 +143,15 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - non-pixel
+      - pixel
+
 allOf:
   - if:
       properties:
@@ -177,12 +228,21 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <2>;
+        #size-cells = <2>;
+        iris_non_pixel: non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        iris_pixel: pixel {
+            iommus = <&apps_smmu 0x1947 0x0000>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

