Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCA30649C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410840; cv=none; b=EtrpC5lRoIs0UW/xg1amGNPol/9Dl4rcB1/32X6AaGUJy5VW/TJBWqJIzNBvcyRMaLIU8gKACSAWaRU5t6SEEAyOyUAYe321l9hdnnwsTg7BHopWtGwkxKjwUAkmEZx1s3QGRNwlp0CZY4nNgvZxnefeU8AAzNy7qzSQ/QaKTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410840; c=relaxed/simple;
	bh=+eMOLBXE7wjoxeetGQX1D3VW19q27MSb42IYcApWQvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EbBfgzI/1PMXW1KmMUyuxxTYDMu8GjmVHjv85ulW0zxXNcLgVSvistHISMbOKYBnwWnnkS47qyyA9kRnlJ0shofVQglsRkPErR3eSI6OoDVPM9pHgnl/uxoMyFVDlhZOHx6rmzR29M4u0zBhcZwe4xz9gWQfmhUD2S8PIvPA67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au5rUQ0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSZPEiEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au5rUQ0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSZPEiEG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD75b3731506
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vzyNvMFuHZ7
	AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=; b=au5rUQ0c+E6bEn8qGk+2XRn+Tnf
	M3ygFDhnB5kivVqYU9utjr6eScJE9CNDrJvF6WbiGRIb5sO9z849JkMCptQ/gjCQ
	ZtUH6d8koDX/l8WrGGUEHZFkMEgg5bEVIHU/fVk/l+A8IpGHgTO07D3b8WaDg0Qb
	zlTG+lu/5AwjuY2cuxrWWCdl+v6pfLnSBtH9iawwl3+u+n4N2yIgVATaH7zYdhTi
	VyDve1qyxoRULdSU5c5FvQ1jOA0tUuzZnOeOtYzFBIbyIgL38cZP4RDmzQK/yFsT
	hp9YPZ0b0MuXbvCM3GwhZUjEisD3cxdmxE9Z0CRWqTJg73vQehQN4cpz/9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeuu27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-359fe456655so5639649a91.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410836; x=1775015636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=DSZPEiEGIi5MoXT7vapJdkVVAVyCi1TRSdj9XZFWq7RbdfMJY5RiDNvT/3JsTRoCrE
         xEduMK3unebq89xl9LMr73KkVNzuHCGj40h5ghodGH+nLiR9ZswWTesKpQFVbFO2doYu
         3bakV7UDT4WvqmjqhFqvYFJgJP0neC84tL2lKb5DcTcUnH8GLWnRgDUTa0hiTUOB97Gp
         oIC9Vt6IqF/6BVFrqZqh8YGxQBkqjKJ3ZefkIOskPtaJ+EndWCrGOy7S2iaXaecFrevj
         UuHbimYHa6+fauXYeQwVSnmPt20wZtQXmcpUbpuSaF/NObMdHxCDGHQOjNl4UdLg2gIf
         5W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410836; x=1775015636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=kB02BXGOEkvhV3eH53FxRISa2u+yS9ZcbayF+FKpvx6vHGlmVzGqVz0XFqEP55wL22
         8lPpTrt9gGIrD8ZeStXJOKakzivX0lSiDmY7Zd9nZmLAtmqDgHsCKmZmeV5vOq6G3fwu
         gq3fb9efyprM6D3Bp1Lu2vrrD5VN3CkoFKnJWtA1XraXgGwIh/CsAXeXwdbwwn/lZMst
         NArbLuSOOHe10AsH33P/seLdd+tlPKBaSs1u0MFh0lhNmGU1vW08dzifuHtzLgnrSRfY
         NzIG3RuBo3Jhwo9oE6YzVRK9DQ/cWXJKNiRV0pZVlri9qh8CvMYgX7ZIcMJSpemG8zJI
         kzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbF9NfIPHcYgAzB+tsT2aJG+L36vZvC5nhZTfXCFfvB7dN+LmJw8SehEWws4ZVJ+4Dp5WXY5BECpZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwyNKs2R3GtkBPdDX2HDm9bSSCIMpRQegEc1LUK2FiWcRik4M0c
	qNyCfkqsOMmTgItNieOpRgagcHcAde20CMD5dmDH7BelduogxdNXC9E++Qym4QcWhcKQ2YAymXx
	kqsgrzojpqZyPI8AI7xdZSKZjIWUjt44QcMAZ6dvmwvH5PMZE8kahz8RrD29/uJvm9HhE/mbX
X-Gm-Gg: ATEYQzxBAzipOKIP01nVicKpX26ojVGqMDmZQ3CCFtfgPmRFf0ZJKbTV3ztPRIBcQ8f
	r09F5qh5ojiiNBdUZ2LkLd5+P9DEoFP3ykqae6hhV80dkh317SVqTo/OPsYWMgDzhgg1QRW6tgp
	2RvOaNs95fjDN+1Cav1U+d2lpDkPHYdjtdxwWvUlyA7ft6wdH/o9VEHrDARg6IZyzRG35+bN07S
	NDWnV99lR0AGHCEoW80JNlhdDvxBtqDIF3aOyfDYVJ51qhhedFcJyv2sKIt2iL9RWArSU1tLf9i
	ghF9Ofy9+XVda83KEegbKW0faYKG7R6ryytbHPV66fTJTaG3MdkaCkPs+nOHinicv4HJ9a4owID
	cj2GdzLUNytIoDopX3+P17YDnpJ0pi7d+xMleKvtK2wCBL3U0/q9BJ7HWAfdmJaLCsf6iRpsuzo
	L3ewMEaFBwq5T770H+1xCmJtYFLufQx6crz9Mm
X-Received: by 2002:a05:6a20:431a:b0:398:ab13:b990 with SMTP id adf61e73a8af0-39c4ad5b696mr2381831637.34.1774410835788;
        Tue, 24 Mar 2026 20:53:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:431a:b0:398:ab13:b990 with SMTP id adf61e73a8af0-39c4ad5b696mr2381797637.34.1774410835085;
        Tue, 24 Mar 2026 20:53:55 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:53:54 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V6 1/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Wed, 25 Mar 2026 09:23:34 +0530
Message-Id: <20260325035338.1393287-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aX3xh0OauctJYqfl2rq-y8Ws7NdNSCrY
X-Proofpoint-ORIG-GUID: aX3xh0OauctJYqfl2rq-y8Ws7NdNSCrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX1hSf1ev6VHVu
 nW9WgKUNxS6R6ttYLOJcFbrGQtaaMOiWGundKmwxHhkMUjw6pQ1M12jkQbnHe3NEGlx0WiSR21/
 VkAIOQL+5smjCK14x+kBf3N/kt9I/DMmtMnf50sFfhEm8mnOe0l7oC+cMVYBV9d9ATZEvRP/Tta
 3RPy07uRwQNdE1REzBuYsCzjhf3Re+DA+D2fGgJEGS6XG5WId+RcBDBI+MCzkL/0Lhs/kueeHcE
 VymRbKMTrJ5QqkYv62QpwVcB7K0IPtv/DMNbn9ad9KbHm813LBUN59KlqA3NKV5RumFcp/qLrlR
 vB5OT5aZVR/1wW4CDf7oke4goPqU35QLR/8RPOPXsjNQD2Yitwt0zthEjNIEoWsgVE0rLViml7w
 9P/W7k4Q4Hpzq2mWr5du8S1T5SXLXfl4utDMZQBM7hodY43oBSsaU6UqeZhNfJOdetyxY7enY0b
 Bj7zWro4bCgJEVK88Fw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c35c54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=z2LoTb0XuyLmHK_nd1IA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1

