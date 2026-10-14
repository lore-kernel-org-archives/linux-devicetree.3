Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527A4D9F68
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969271; cv=none; b=RXgn7WP2hRf1HRwq1OKhEvqXj27MSb2aF9LIAWYA2O8f1hhnPcnrLobRFiBqm9ypEuaWHL2CCC42mHt0brCCwAuFe2QbNE+yfgXObgDW8b07OM5rYwqZGVhLK2SoLLxed7MaLk7O57d3Sl8/3sSQcDe2OzdZYOb/lbn73nrp9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969271; c=relaxed/simple;
	bh=ubWfHaaUXVvf0YQc8C8dFRG/yatLpOHVQwrf/Ep+x8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdtkzdT27nzCmyOizlKz4b02d4adyc2QfU3c90mPP+c/58ih3ChYAepSkwle4GwvnLusU2TjeM8JKPcWJDmYJXgyOuPsCulfQ2V1d6Lx6jMSGM1sxSaBdewqb4o++s0qGLc3Y1no37hE2VJF33lzSv+QhKWvEYxDt0zuWe3N3Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHQeYU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdAPfUie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHQeYU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdAPfUie"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7d17A2874533
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=; b=iwHQeYU7N86SEjO5
	rCCPaFSwY+uUNPw9w0+3QA7j2ZxBh3r8L7Mcc+C3CgQkjZahn4bWkirvbajF0tlJ
	eHVhtNHTtoFVHvZEnVRiFo4GWAaP79Vc44imFIpIDe6ErFmYefy1jRKj1Hf0M2US
	/lUqkElQTwzcgxQIEyJD1frpsaU8i7YNsuABtfg8yuvQci3AFSwq4IsEP+AYsJ8k
	KvzmQSD0Yil/QtyyV7x9crY3aEentiE5d9Cr7mdkoEioIpK+MmWU1QFB+HvhqIjB
	n1/A805JZR3KxHJhGt1ioWkwuHqF/mJ1f0MXPriVbYiU7mr3SBgzqCPRAHOiqjQ+
	a8wtHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphhrsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ba4757baso8121745ad.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969264; x=1792574064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=YdAPfUiekadDinpxUGxwIYcIuda9lTvM/5ZGExYiK3CSB3FiTucnuHtVg5FmNuebuc
         yQyz9gLYGAippwrIFnV3OlKq8Su9QktKXKbetvkP8XFOWycBnTeOWoxzQOnagPuXrQMM
         dnZf6T1bYLAGzIV1pgmsQMP3h6sgiYIfFRpPyQXPzfBT2Q76b3Fa/ZNBaw8Dg5p6/++d
         bEhyDUUcE+mLsktB5Z+Xd9/WxvjPZxs1JFejb+pDR2dacPdgyRi/bYZH7AsYBvPD/8NM
         /voXvW9TyFDQPgXkYlsb3StTDADjyS+JDmdAkNLvtV3iaMQbJib4feg2I0V9xqL/z/oR
         utFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969264; x=1792574064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=aeOvB4YoPk8BfJX6PcQqpmEQEEOBVDqh766RU339kGSXW5tuu2+LLb/J/XfHvFQs4m
         nhtjTGxnjc3T7Ibh3EyP0by3MsUTci+tvNOvD/ob9fiM/1Lrs+kXBxDJDF0cjeufymM9
         Hx2DTSk/El15B2/Xr30YVEfqxThM7Ph1tu1Pmhy+w8ykZ1g0U4LctAyZtQUGE/VEXPXV
         9Fsh8sTxe+1l4BwE+RYxHO6E/DcFwLBoA6TguZ9CY+XcJqoMOcDpwOqqvNUrGWJbENI5
         lXWGcz3RRdGUhAql2rtFEwHBDn7xBL+ut9aQygAn2SC6gctZ862HJO8C7kmeXmMtZ4M8
         eEbA==
X-Forwarded-Encrypted: i=1; AKwUvBzQiUAV8rvc6V1K3vbkNQXrDJYhuaW21Q31lMuYvLMmOjMAU3haM8qIlCiXKqU07rN7/d3SZbSGXik8@vger.kernel.org
X-Gm-Message-State: AFq9FYKT7V/zWEOuX2o0iUJ3FEIgZTv9FHCGVGkxpOTI3KQ+SdjZy8VR
	M3MKz97uX1fCvZYKWLSq7srKVnNra3SfabWSh+W+d2/gg/FiKfOxSbYSzFwQLhrCXXMQLVB6tv4
	gbyWFHLJVUl70wmJs9+R0oR5wnieiv4hZXT4ulu3L9KxW3l4xt29xs6CAYmYBbXok
X-Gm-Gg: AYBFou2te7WzHXhjCeJ59p5EU2bHGinyjZD48cACxacgvqVOz/SVsNWegtfSwbs5vnG
	ypnBLvroBjklDXnpbt3qhMtFlpjqVmYnZPPNnRvGwQV5+mqqJFH5Dz52hvTHkxuprj/WNiOGeOz
	4zvw4RLEJkaYsjj27y9k5OE9oWvveXFbHVT2gPMKiDBoZ9MBpLPYyZEsPwf2GQhPcpVD/DrEfw/
	4LSA+cvQEx2rrVLF8tTn77Q6HxRYLM7AYzlcvzS8VY+DCknSQZ/HyT0bAUKvopFPonQZlzOQKSf
	k9VYd3ZUiyefXqYMTI1aUuqgqhmqNdiyjkPTng6HYQXLgEyOlP+qByio/3kH6W7VmBDl6JyEV/r
	CGLxw9XIrwoQ8jNBJGrYeGb8UOa40GyPdFLY=
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131951125ad.59.1791969263924;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131950915ad.59.1791969263437;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:53 +0530
Subject: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=2665;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=X172senOJGEpt1gOkSVMmtQdNj4w/1OL1At9lde7tvY=;
 b=tAdFsJA+m9R6QtFjHUn6cCSVwjy/krexQU5Al0ZEP7+fn9rbQS4WbzLQ7UbgJ77i1EydHzmcv
 ug/GHAdQYQaDPdJV+Y4MN5h9yjOccxJKpHFUGsVxzDB2z0m5BJN50eR
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: EcH1GV-73uDDsjK-pWNA8VQGxdn3faMh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX3LRZNZJNdK8o
 yBnQmKcXGNxzfSc4VFRZ+ZMuY0wxRRPUl2Sa7TQfB8eWGKQxykd4mM4wLLGGv4CXWegmV9VGdNY
 X6EF3bfRO7mrjSv2TMx1dqvSPxLzMUw=
X-Proofpoint-ORIG-GUID: EcH1GV-73uDDsjK-pWNA8VQGxdn3faMh
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf47f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX177kl0p4Z0yl
 GlkdLhCBZr3AtHI6C4/UJIydZiHY0+mgWIGhO3vzI2KFYCYvFhKKqKXAcq5F+024R9VDdSjgiDN
 MLsBC92FV7EQFVyRECtO327KQqrFNEScxFDG18WfvU3LvpUwqdRlML1qgnN6d14bpcWJBo5w5yQ
 gxN6ljveKypz3HQGWp6s3M3s4snAGpRk2MQYeVm9NKdiq+dNOi4hSg9HnbUyWRM+LRGKgkP5MXc
 94DnBD6Wuncx6xtixYxjZK9P3eVoBAT9S3z+Pzsk8U00gsW+Uo9jfJfQyBJgUfMZ6n+mHSde3Bu
 Nfq0IxhLQi/Hyr2vG7ICiYz/wJjLnUGy154MuR9rTrRbL9TI4AUAUUznv7I12v5BHhMOHSJLmYv
 LppPbfiwnPNf/7+yvX6X9H1uQ7M+vZUY1HkONAQlU7f27t3A3n2mzJffREoNPUFETTcLVC31Bo8
 GyCCOBv3WDS4RHNtmHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 142955b85..41b578f83 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d..900ed97dc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -28,6 +28,10 @@ properties:
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36..9b8d9afd0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
 
   reg:
     maxItems: 1

-- 
2.34.1

