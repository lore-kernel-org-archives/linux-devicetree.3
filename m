Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982758;
	b=x7palbc6fD7U2mFG1oBsc9WKs1j0jHlrXXT4oXKRMMg1cXWcqWQT9FgX+NhdvW20MPAQ
	 dIMMD84vAV/AJR7HWCqw7wjSejrmeBgUZgvijiMJvATaqoBErZKha5OmYytzhzUaMLEXP
	 2sDv4gnVeLYqU41wLJ0s4QonaOGb+Y6XHLDJR63ek1yi7sNm+SvwpgBZT9KnDeKCnIXA4
	 q3vmHJWd7Gc0Y308rkheTIobD6bbKBowL/KjxR1CI+nxWn7uDmxgzwtSmXcYOf93TAE0M
	 IVgaAIUdn77icB0rgGkYModNlbBcUkohYJEyEnolsWlbTPcFdrHPZ9qAYRRpiZwMvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=MCKzOWQrwWzpNeGoC2Fy+x5f9pJlSrt3mx/iRR9Gn0tdjymyZU05Bl5/XJSvqCZ1T8is
	 REENAhjIHNF3RgH1tKVKnisueZGissi47RjTg+2DtGPbXnZH34vQfRmKKEq2yOF74l357
	 51MgyNXg5iEkkLlKHfz8qHvreagPLOueIuGeu5ic7/NQ1pAXOEQFNFlaWwqR2VlSDoMHQ
	 cQ7PXSHJ2A2EyTA3etSfJTABSxIGnK6GqM/KyjXC86gzMk/8do5DLzN37hkulOjnG6GgR
	 MWDHbn2Gl383agWwYvt5UxN1ZAWSwgLHYkvdz7B4pyK035uoq9Fov7gjKUGoy77NR8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F2606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08F2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6Qj764294
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Do76T8LSF05wtpgg
	Gt11GH2PLpKktrmfYjxLGxCINJ6jNabvTRQH4fUDsv/Y5iDCSpGE75bwfFRdSXJo
	MZTfJiGGZMTSqPN6brfN4ZjUmDCZ+CVjy2KiZt3mTGPfXXBbgiJ4HAcIFATRsUk2
	0WvG2jIKmvkb/7Nw2fGqTnSXki6AEhw+4BVSLgrcoUDYi0FUZGAWqlx7mR1qNWlz
	myG4kbx0wmJ/pmExKb65ugjL5zipXiCjfEnZQoPz0urufdOfPk8QBzurCLQaIs2N
	NWrqQfa+s+ZRCA7+HNmnYzJNkEAGpvtyRmk8P40r1NGKFn1C/uLsCLkFo4rbEaml
	O2hNaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9gwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so814483a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982756; x=1795587556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=B0HrlLuWddp5t+34hghWnEQTkNFyss6Y2zCfKRWe0lnGj/iVycNut2s3WfqXmYvrsq
         CMrB+VycTTJDkitsKnr30gO/nV0Zq1IVeAHzsshue0u44IDTcNbWeSpV6690BlVVuMnu
         LEFlrpHv8Xju214EUncgLLSAK2K+4LXF9DYUzbJB3Na1KwN1asJmUG974oq2mHaIqwrW
         yYov3Cod2rkZM7ENtwvWUgS0hCFKEdKSlkYSykRzEcvkjTatc+qFT2SkJVdyKPe5sRCA
         sV/fHoVL72uPMax2vW35IDHYyy16ztVjJ2j40ihuBaU51dakf7q6a9eGRvZJYm5xsomV
         8hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982756; x=1795587556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=QVYXfCChpFtwKpOMxOgBEnKDzlkiaj4J2wpfotPmeFX7+WMGNo4xJU4Y65DdIsMmbw
         VjfWPcbBdBmvlPkLS5bXuhB8R4NIvjEEMRvRPsafDAuXVNfqpxGmtX7UN5r9zWWZO3YD
         nHZ34r9U6Ur4B88buN5InSfHBqfUO4bPervnFsdtY/GJe2quiMQdMal2x5QVfMsRFEi7
         WCsRbLpZ3ZHqf3Zb/cgMlL//CEmcL82ASBzdLvTcNN9Mh9acQ/U7kSeBZqGbrsz6xJ87
         U7+mye7tquXk76H7bEAWtWCmh28Vitj7kG38FBov5Jjrs3CGYxp8AvlYndPz92yVEN2H
         Pq1g==
X-Forwarded-Encrypted: i=1; AL+hErHCouJtBKEwM/nrNcuPGm08DRzj/4Tg2+O2x5jpdOM5jxN6xU768WeddxgeD1f8RYbfvpQ7T2VVR22S@vger.kernel.org
X-Gm-Message-State: APuU4Z+OQcvauuUzHuU5Lnqpp/LhBy92U4tjTd/IHBtznL7b+LLiBLsl
	eLqbwelI6FZ82T6tSfz9OkPx19qfpBb2im4ZsCwWFHO56eospBbwB3lXy45Z22utJx+O+7Ce/Qi
	vc7SfW+Y6Xb8vC99qd4tBiv5JwEb02Pk4YNVQYzPNYGTEOC/GJEyl8IZ1Qm++2X7l
X-Gm-Gg: AZFdTZdPhuQaxCs1wuPM95gsroacURAIOWplzQL0NCHP6PZSM18F5HzQunys7ijJdXN
	tpGZcF2zWfk9YLItNgSa5VSu7u37MtNTJiQbop9S6Zo+vObNpXCQMky67pJE0YoiBPh2OZUYG2D
	L2kb7M1p/rJrxpzWq5nrwTWLaIfKU/wWULpcNsEyaoU9/DzTNhOx3V8d6vqm83ihO1a2lV5oApI
	cUGgPBZa/VgRqPqx1D7EMFbNNp095iCwdssrQQXKJMQLnQEEvBDJNIwIP+WsqG757LymBTgU4SX
	MxSIRxZLVXylJddRFlVzm5q/Cd6lF65XZiRPZVE3N6VGyAEWHXm9FResJE+ETgTaBEjUVG8LcVp
	avLglEwkrl98gtwPcoDh+ze1h3bny5lME98MuYyjBrQ8+t+IKVho7hiqseaOvWIIrcChNvlMcqC
	DBLDkYCvVSVAHCV0vH41WnAM2LFegF0/UFAo7EOXjAD0MsMSCdoePZOSbCEOPAP4Va+4UZ9voB1
	xU=
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569825a91.21.1794982756160;
        Tue, 17 Nov 2026 22:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569814a91.21.1794982755695;
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:04 +0530
Subject: [PATCH ath-next v2 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-1-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: DCI10x4E2or3ygJoU8sRRCAp90GZvt__
X-Proofpoint-ORIG-GUID: DCI10x4E2or3ygJoU8sRRCAp90GZvt__
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4364 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1jogYGVIdMyl
 X5NF/Q2u59FJqS7PzbOB6z8AgPT45MVtBk1CA0cnGAF5XxqhgzhrGQ/qWop+iQB7+qEAo/mrP7e
 9V9OX0srJnugglpfedUjzxx3rhN7cF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9WbRUJpW1yyi
 mTLEX+XPE9CiPydeiEoYmbcKiTb0jUtkcMUevaQt0xM76Lkf0RQNRJi/3s/gApv/syedvnfH6Eo
 V7heF2errIkRLeieVzJHVe5O/04RvW/fGQbdO58kwC02kqrOCtxB/YBLcjoxJnQnbX4OxCdXGxA
 T1bTIqJUkxsKGyrH7b6LlQf3C8KUVt2GaoIJX6y3gQzjDBdrrwhp1kK6Njzl3cz7Fv+T5wHLDFd
 e72fQySCMeZhM+f66k6HfCQIyVkrqNIzwCQjn3/1rwPR1udLj55NayFfBUX/S4xSUbTA+GzIqJW
 VbXKqWWz74fAxPq9E0hq5aq44QG8TiwTOosZgD5kh1Sj4mzDB0+ZTxMeVpIz6J+vvdH4rqlAWS3
 GcznSwsn85JaS+grwAdWOVMEcCnWPjeYy8/0Ak3mcarhCf/yVeJ8ykJNk1f+KWo6BuVDrx6Br3n
 y7PP3rR23arA0OdVHGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

