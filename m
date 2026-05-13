Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F33AE1BB
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698367; cv=none; b=FwHQ9U+39znkGF3L809Olc1ssscBulHaq8NUuoY/7isErD7yRQl/OKoYpA0d76hdMqr6ToOaYGjeET60qPxAMKc7U6y7TfYBx2GxqNfbJNLUDaaTQj8NPLpGdvuoi+eKseRkjtRmHavPUhcpBqsrjhZoe037O45Fr5fhDEewZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698367; c=relaxed/simple;
	bh=z4FbzAvY5pZ8H9vX/hG/UlmCYedeJ/87e4jZmsMaSQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxMxdymEboIxvVw8NDGdgPJnNXm07c45pvg7TKig2jHa0zjVHFCuQxCPomkilbeHF1aUNHjz4S1yhIrlLP+SIjCfeBmxhxeDxvKv3vCuCOICGwsTv0fRuwVMbU/wDycS+Jfw0RiawbYJy5SlUgUEOWMWvhHHVXs/rOPzxJLJl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuDx3Hpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdDOJb2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuDx3Hpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdDOJb2N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGvrbK2321368
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=; b=PuDx3HpobMVhh6cf
	vYT9Nj5kLtyTR1tHGzpFz57KQTgeR5WMujDJwuD7GfLT12USLXMqCqRe3bgbaL98
	PujkNrcyjHbSA7iT7KkX0i9ibsTa63r83KLbHRNntM0Gxu+QVDF3fxapVeumLypB
	Q/QMp93UZnpuh3NJkETwAufNZdYFHnwNNRtezfaIr8Qhbyt1JuK1Ikucs7VcvhqV
	ew779iTXrnZTmxn0FCLdQNZEUTMltRj7QRWAIs+IJ2KDd3+5MMpUOcTxe7cccJEw
	SUouCwroPyV6/3Kk9GXIpCPjodyjZP90C0LgDNsJiyslWVBeQTiS9xI0U5JOQb2O
	JZW4WA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgubjng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:52:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so4122203a91.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698364; x=1779303164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=OdDOJb2N41iKLTeSkAFv1fvX6RbOZ7JA5bcvmd3kio3foIpJ61W6UJRQjkAEpbLndC
         oYfb0Ebbma2HkdkXbAXwa3TixjQWge/Vm4WXELTW6UCn5Nli0JI3Y0RqcKjl4LYiNTmk
         spApSI59DtO+EFt3IHzzifVOcQyIMTAQ5Jq8+SSY2dDW4nJlFYJ4CbJXv2muUAyv1jqa
         qHZMTBYCnaaoxq0vVZW55m/Rv5YXeaQUAwFy7l3WagzOPw42lagSIWcewq04CSMaIpMF
         4YH9J8lFMCNkz1eiS/1iT6kr7YmkWwYw00IT0K0Xh309iEeQwennwxIVeVsazBxUxshB
         528g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698364; x=1779303164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=XY/scpbvBmlDP/iB90WrlavHUZQMO2zEVLMAe4BrQ9zBrDqCUdskoSncENsTejIsIc
         grbC1dbVXxlT7OKgW5/9Mkd7gf35DtNKtR6ocdUQr//1QYPbxIbMjtXJC+Oice3CN+lS
         64nKyMErDghd+9ZQ7yqTe/8VS0EDCLB5Ie2CvZH+I59OA9eYrJIHBC/W6UWIY/Kat8oY
         16RO+ZfEeM81t0v5LYkdGiQ5PboclKCGOmK6Y9cglpCo8iSTg7On65gSPrZtcglansnH
         P0Sfu7L121eKQ18t3a2CFbSFE7fcUKRqjTM1I2b+kh97+ez5iJ8kBxqP40r4AKT0qXSv
         lzKg==
X-Forwarded-Encrypted: i=1; AFNElJ8yY+EkL+ZTyRtNYlrhkRZqbQSWZuoVOwVFt0ws9TL65aNuNDJyMPBWnzc4BM2UQkwTF75oGPPJs3x4@vger.kernel.org
X-Gm-Message-State: AOJu0YyklgpvPuLaRtE4yG38TP3qwSzA7nw2pCiJTxsNdcxdv4jCEJPj
	2stFcXmdg1sdk9sXWWjCKDuQC073ezZZq3UUeQhDh6mi8FvhLNohqgma+InW/wY5yymo6QlcQBV
	a5jyXvaWrfMbHtseHRblNVVuRG6JmkC9Ohq9iretTVXY584xxpn/GJ/fnuYqAbpdz
X-Gm-Gg: Acq92OFZfPoKhNPZ1WoC65D+JTxNgvXl+QiWCltEDutuxXRgSQaXuRY657eO37S589P
	FLIPOKateroKfqjIG3jdBhqX+rNcZ2MUN4z6RztOotsod2uhoXmtHZmOGt9pK8Bh6g0tD6J+e9O
	qLQr45iaRyH5F1H4epLNNiIQJQnU/jUyzFMaCSlW3gSogUgYjAF3qzgb0iBdDqN7v7QLx0PMz+Q
	4NcfT4PC7msLAKMGawnJUIHVSL0K9LZbkncW1j8webVBUwcR+qh9EvX3hCYBd2eB1xqju/z661L
	Qb0ot3hIzplFSZxahWqtHguBH/GFP7+4MXDlr0g9P+qvoH6Bpu9U69nlJ3hu5ddnOyYzORSvotb
	uDSVuJ3eqBjXkiXCwHtXfawrcW6SvwzJ85VlpoLGrb7FeiGrYXY9/Y3E=
X-Received: by 2002:a17:90a:fc44:b0:368:4cb2:17b8 with SMTP id 98e67ed59e1d1-368f40835b7mr5264324a91.21.1778698364346;
        Wed, 13 May 2026 11:52:44 -0700 (PDT)
X-Received: by 2002:a17:90a:fc44:b0:368:4cb2:17b8 with SMTP id 98e67ed59e1d1-368f40835b7mr5264290a91.21.1778698363854;
        Wed, 13 May 2026 11:52:43 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:43 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:22:20 +0530
Subject: [PATCH v2 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-knp_qce-v2-1-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04c87c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QMZoEd0Ms9iLIoMSFykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Jwm-1SYDvFCsoo0t8vncnSPvbSkayvpg
X-Proofpoint-ORIG-GUID: Jwm-1SYDvFCsoo0t8vncnSPvbSkayvpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX34byRAGpIvva
 QH9OMJqMEVdRaxaxOeIRBbROeh5XA11izCcXbKkJoQOIblVosbxbeAzwa4QagmGloVHxZ9y0R3b
 8c7BZ8ZcrUgchu+2mKGFWeccDtgzzhispSMy9G68xo4KrK3wGEMc3jzshZ45q9Mm2WWpOw0Y0rW
 h2ljBEcLKyQ3WaKJzUg5Cz0ZGd1fxmzwD6XIf/Z94CRXvNgCY12m8p5mwwKoiu6J3pMsqbanQNK
 IyEAVJluSFflPFwUhqjJh+ibFqLAPWRb9ZohVsSulNgoAWBO2y9GIIqM0vzgD1MX5gASq1xGbsq
 xXTZAx3Q3QRe49BmTcjqaRzomLCSOPIcYMCslP+Jfjn1Ceb26FUpG/M3FxBijNjlpY1GJGphcHd
 8J4Um/XRD05jBQH70qGD+lgW14xXaOigLaICzx9BiqG927kdVbAP3rw1lrERWotccVXIAoDYow9
 IEQVukZ/qDtIx/PKQJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186

Document compatible string for bam v2.0.0 version found on kaanapali.
BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
layout and offsets, requiring a distinct compatible for correct hardware
description.

Also add a new example for BAM v2.0.0 to illustrate a more complete
configuration than the existing v1.4 example. The new example covers
64-bit address and size cells, IOMMU bindings and execution
environment–related properties required on newer platforms.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 6493a6968bb4..0923fb189ada 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -23,6 +23,8 @@ properties:
           - qcom,bam-v1.4.0
           # MSM8916, SDM630
           - qcom,bam-v1.7.0
+          # Kaanapali
+          - qcom,bam-v2.0.0
       - items:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
@@ -118,4 +120,23 @@ examples:
         #dma-cells = <1>;
         qcom,ee = <0>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@1dc4000 {
+            compatible = "qcom,bam-v2.0.0";
+            reg = <0x0 0x01dc4000 0x0 0x22000>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            #dma-cells = <1>;
+            iommus = <&apps_smmu 0xc0 0>, <&apps_smmu 0xc1 0>;
+            qcom,ee = <0>;
+            qcom,num-ees = <4>;
+            num-channels = <20>;
+            qcom,controlled-remotely;
+        };
+    };
 ...

-- 
2.34.1

