Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B21F2380
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392133; cv=none; b=uKoWJwS56mxrLrmdHVQWe9LXrLNLEZqEXiAW92F/UQTLMv8G9JpNGE7aiEl6oxt6FwY3+l7v9623kb6cmdg6U7ppZM4sXizUM1G712uMRAeYfp2jVZ/5rP0+l+N49fJjZZ3iFllrwA+IH/p/9jY/dHO484eli3EDFN8E4NnMc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392133; c=relaxed/simple;
	bh=tJlShdbumFRNUNuWAJFM3tKrMWOngt5fm4kXwp3JGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqoAn3TbstS9A7eyrU89OV3pCjy5DfNfyX6Q5dT6nlp1sjV+kyBT7mOQsp+E1wYvfrCJn6gPaj/Sadp9lOO987P0kfeoGokYaaLihNtl1ajoBB1Y6wvDllAtyk8geB8UYliRRDetpJQmoin50Zcl0XIkiCWL8Lem3zUdz1+6GDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AW6imkDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcH983Li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AW6imkDD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcH983Li"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tiJV4012749
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=; b=AW6imkDDwrRZmj43
	yZ6ZEauqto41+32DGMhBbNKoAESf8YnVBmYTa0kezv5xW+ZvznfTC2QKHBjuInFJ
	Z9MNBPJKod7CKtF7sAm2F1niwcKDML/pYS7YEYGrRiPDNnl9+oKzduCvggZf79O2
	YMqFU6GV64VFB+X0A/+k0SZVSFHTJMkhL7sryxO/TNheHELcvMtJbY1QNcLjAEpK
	8fDaCsfFu5l+c/kxOXOnL8Vifr7AmgxCi46cd+ihuHVGF3Z1JwiiG8wf1HXPpe+T
	o41X3nkTPdpXI9v3+h2yzpki9JU9EDBPSA5ZqiAM0EdpDaLqOOUcIXIRx03bxgV6
	DQ8BIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4gunv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:22:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so3175588a91.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392130; x=1780996930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=;
        b=XcH983LiDj1eJ8+qkp8bV1TtIwPCHHaU+EIvTV53QI9iMgYp+5N/hSJlI+6X83s8bp
         yH0VobF6WtDVhJGYtAhfZl8Z+TFl9cj7c+czZp7KwvE9vL71Mc511ZR1q8zcXBkrXaGS
         lDotb7hZZY7/t0yB7fz7JIk+OLZVkO8bpUqvmlhjuekrvZyVRb7+dHRHx5ccCzfxEbmy
         4UOsToi26RixrDLmddSpoWqH9Au+47z34XOUf4e4eIJ6QuVhlfF7rMHitMPqyWsfxFmy
         ReVl0Ti/Rg8llhMH/L+8h/h+2Kng6EK5+aP+vfr6GNQZNG/a9iQmcWQ3nfpTZqpurt/E
         GYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392130; x=1780996930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=;
        b=PpmpINdW4SiCiD+8acLd9hCEYKPHKtcAtw1x6LiUjAVyl9tuAoV4PJxUC4E4Q0sO0A
         nMez1eNOi57sMcAmfVxAvJ9zDaeCvqn8BY0wr/wsrndgYw8+pSzUtS0hUcKcFrsLA2so
         mzUwruMfnhXW0u608TFETbP5N43HJXEbalXiE9ty2R8k5INVr3q00TKpQu8IuZ67A8AX
         ZJ5yIz2f1ib7togYhNkcvWGHEaqDaQn9KNSjfhS6zOjZsq7jR08g9JNn5+9AOIY35kyg
         tqltnKCVQ+oSMq3WA6dtsXOebWcCadgn7Stx4qDioiH4BtfKUcbD3oMG28OWB7dZvVDK
         Kycg==
X-Forwarded-Encrypted: i=1; AFNElJ8kad6KXX0JF5h6mvkEV9mV3MGVsicmBr8dkuOzx49qLLDaqjDqzennV1PnquGINT6TtCYgU3rsxBBk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpu013YT71OBZyMLLq5PdlU8DuEMuBwQwEdYETLRbqhLUJCQdP
	cJmPRG5x+Alf0LzBDT8MfA4InYFoYshU5yl+9qK7pMoxjgAWs6GBboyoh23o0ZsQXTbjGYA5572
	dHtiKiRNrUpLGeHtV+lRvsAtfrG+3tF78NqgI+megXvZNsaXL8HJVdEEbO+XXXYuF
X-Gm-Gg: Acq92OHlA22TzB+JWgxz3xTuZdN+S1V//3lpU9fTKkTCtEa6yRicXPezdZkeqq/78Vy
	x5LIo9YkRpFhhI3oF7rMlEKMcDM8eUijwHHZTVQr6Ze577gRsD3hswKJvCl0yxJLWQ3AzzYH6Y/
	uN9fTUfDMj90XjK89tCDqHXZqI1SUTl98fuoRwxHSqS/n/DxWLQlpk9cMcgoo09kVe+1+4P3Y7k
	PxcqBxVh4U0K/OwaLFTm89W332zezEOg7E5gythgTp1yXg2Ugjhapz0LrosfeDoaxrKUD3amwAZ
	kYSJxro5KVJ6n+XgXZScxBy06nmSvo0s2MVTcgWzY0idUHOe4p1Mil2SyAqo6ZfVy2fzC7v7uKW
	C8R8ZbhSHEBacuvaDj3jUokGHWrT7z1TbssbXHgXTG9zok/Amj6jiv9cF1ZGIJEvUcp2FKzP/UU
	u54HNYetygY1vgDW0RFy/suW05IF8Ki7LE7Wwm2ZpStltzYR3Q2JyAcnnZXjIhru6bLD8=
X-Received: by 2002:a17:90b:4a89:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-36dd95082bemr2396345a91.7.1780392130087;
        Tue, 02 Jun 2026 02:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4a89:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-36dd95082bemr2396325a91.7.1780392129588;
        Tue, 02 Jun 2026 02:22:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:51:59 +0530
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfXyut/9Fm3LBgZ
 RNVOBhJW1qhHGjYngzqnModtPehfwQFLSL3WeCHO3Lrk8qGj5NnKlIO8K1OVT/XPX8ccsNf7Pe0
 uCN/BFiYOKoc+JCehFnvLJBo7/61/sPB7DBd+IYBFgHTDftSTvMy2jlEOhzwNuERLa/daTgXFT/
 N+vE5VtCFq/a48a3NC+2+ai6Qfh4kLhqpcRyk7AMWb+eprHuTP6gEZvFTzhpFeuneQVtK/r5yZT
 JDsjN55Aqo1IktW4vvxq7kLL6NtJR2yk0talIuk31ZwMFnp/M3ZFko/5igpN0EIhXyW5TyipYcz
 qWdpfSqp0V7ohPsMmk4OUdbkypK8DRod4lRS06nBfmywsSHV0CS/2Xv76wGmI+0uJYZOK2HqkjD
 4u4SqDMOIMlZ5Y094wxMpXTz6j7+WCCgtOccxzSxYxif/5K2xPqZ2/3KEEWOwO1wssJqrcQSyIf
 uiKMyxYPY83kp3DBSLQ==
X-Proofpoint-GUID: RMwg-jVo20ebMgiR3WiuVbeeAPApFCEs
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ea0c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VjL3xhqMjkKYvgIonoEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RMwg-jVo20ebMgiR3WiuVbeeAPApFCEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020087

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..2686569ca060 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -16,6 +16,16 @@ description:
 allOf:
   - $ref: regulator.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9650-refgen-regulator
+    then:
+      required:
+        - clocks
+        - clock-names
+
 properties:
   compatible:
     oneOf:
@@ -29,6 +39,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq9650-refgen-regulator
               - qcom,qcs8300-refgen-regulator
               - qcom,sa8775p-refgen-regulator
               - qcom,sc7280-refgen-regulator
@@ -45,6 +56,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Core reference clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: hclk
+
 required:
   - compatible
   - reg

-- 
2.34.1

