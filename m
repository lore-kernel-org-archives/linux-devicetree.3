Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2CD363C55
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023573; cv=none; b=a79XFgszND4s6c1a7d+VbQ6Uh0DdOHBTf6xswXcwqcla3GroeKhh8hSXeih30vugrTpSksiAWTVhgQMZAic+YSoFVAnhRgNl+embAPMApDswzQpp8sbY0Q570C07nkxPhPsk2jWghYcRtSouS/YNDOyrsd7mfaebemIuGbXpWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023573; c=relaxed/simple;
	bh=UoSRo1GW6MYk2CQkM+hrKXykAmZ+r0PsRTTvloWVEdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAyBLaOEEJ/tmso57TUDL16NLG+Kti1A/tbORhcxo94X+3mFg+Y/sHcW11CNMnywxHVzqF3yOEfKy6EuAoJ2r8DlMvyIEtt5wqwBHr0q445afF6K6p5NUToRGOVh2aZ3LkmuUNmoquZZnQQIJ1L1QgLOr0S4bTr3H8MX2aoWU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMxlrDUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftNVt4qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMxlrDUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftNVt4qq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SNKZ3718200
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=; b=cMxlrDUuEEEfhQiR
	xftx2pzAUcDNd4SpwQMFGiO0lAP3EBjagcqcMMHYgo1Gdcjlw4oYsFX/q0/8mg69
	Qc493r/zU2IBvMbja8P+SQ+HvDATPSodWNiSCk+MmDCbmpPvp1AaSyvFgCJJuwha
	7pkfpMXStKn2KBy/r6w3sh8Q4vyddf0rtVA1XNgMzmeMRHnV82k/CfdKO3dom1ly
	I3SlQ8W86dVwKnZTvx1h1FHw2Jfc4vCkG3Xt5/IeGCe9/4GOmIse5GzGmRUlJx+C
	mRc6rgrmBF59g7gvFy4QwnYGMmKSnTKBwRrcQxvNqxVsajUJUP7Rn2/ep50wOOE8
	sMLQ9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvjdm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so44630255ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023570; x=1784628370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=;
        b=ftNVt4qq2AmWMuzAS8jRQeBXjSdbpp8cKU0ISjLVUurcJOwaRQwexcA08L2L7dq3vc
         tlUIyyT8ycZhvWc3m9SidzwElswAPl/lrpxVxbXktk4yiccfhF6+6PomowWhtKvbbOQh
         9XN46W78dOGTrpWaRJ27SigwugpCFUaMVedXaKu4BWdZpjcCCtmfS0pfUSE9ZDjrJ4QE
         579n8abER9l6qi2da7izk6M09F7DamcZU4YaoTZU4xCbQuEfm+NJj3rsBaTSl2vLlK8T
         pzDzAzO9TGpqjPSjLjWPCdeG/g7nHPg8tJlBZSJDQV5IzTPAg1QFN3M1Z2fupNwgwyEh
         BK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023570; x=1784628370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6ytOIDKhwkP2y8jVaN1ZuW7AxSttUCjFdaRma57k3Q=;
        b=CBCogkkSIfEQRR+pdHxfZgrWER2CBAGXKa8tglO10RuMOa6zYfPQBPO2s5oM5AN3Jr
         8NnTfsbPerCelFWwtirDbQpkLgKO4PL4zPB65n3WEB1EwTP1xGpGKHlRCjr3niYxjXg6
         HBl76J518JtfTps4FmJW1zKbGFpHlDAksiuuD7UY0s8WrOZ96nQpkrupNd+XuUn5Frk9
         Z14K2OjmMHIVmWN6/8m/loSq6APp4zz7sneMxETW5nOzUm4Q9zq74j5BCt8QmPpuNNmf
         o0IJCpzvDpPgQR56TwTnOZzv8y7SSVJFtHdi/jfKGtUycVhtun2tunnqRHBALwzH56I7
         b+eQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpv1x5uy2XkwJ7DoDvY7YLWIWdaVkrZt8uS9ALczt/aCrLwnRRZrcO0XTcXYVSeAlax9DlA16LP14SM@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFte5cfweJNOe1xyW/fMNsTko1U3fmne3+fzRP2g8ARN4T8PF
	1yWcNCHnJo7Eeh9KjiB30VthNLrDSe8p2kPWFYICEYkQNcpkD0UPigKZQTzutfJxa2DrznBH0hW
	VxAEh9jcaAvDluxb70sppddYlRmbhwEiNKH7doHmOWoU3Li85vh0b4wgJ7paNsaaD
X-Gm-Gg: AfdE7cl/UK9f929UIncgR3vPyQxN+b3NC+rDBkQQr1zPlYmjelpIN+g79WmabUY54DD
	gWKB+fjJpUptUpEMg1pXxqdKkzMO9ljjgeDR4VNCTp/jMHQQGvxPJioCNo/E2rB8Jtef/My51h+
	fG98Mw25th7Kj5BdZ3hb0Nsl343jZO8RIp4oUa464f6iUTPokqjDTZPa+2T9fO4j4VgEAL4ztA8
	Nrea5F2omNMgA9WZAukZBlkGdKGxeApRWydVHOp6jOuKhzfyV24zZ0mUntCl/AgdEjPH68J54XY
	xVWXeQbDZykkDWzdyNzxo85wAKNXUYsGvGB6DoCiX3cAaT57u8IMsxvxR7nJyxtytQMrpvLie6f
	H2BE7cUy1Bd8vPkvbtL35tI1P2gp8V9xWh4f10XZITEoy
X-Received: by 2002:a17:902:f70f:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cef11ec5b1mr20323055ad.20.1784023569974;
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cef11ec5b1mr20322545ad.20.1784023569452;
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:06:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:16 +0530
Subject: [PATCH v4 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to 7
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-5-06a4ea97c209@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX5hlaBzfDcuaU
 yhMPWjraOoPtbCfxBKFNrZ7OCv70JlyUX9elmdEntNTu0wByqZmpHtvtDMbZla1N7Is1gblkX+3
 1i6Xgcdip+3hixHFs1orvFJn+YuWitb4PZ1fg9nkrlPRb/IObUEwxgfI1naZqlcfnJgtKlsyYwP
 AfSN013Zkp1F7PGbJG7Nd9CsT+mW1tipPy6ci8C/vRmi/6IapjEGbN1/Szc9te5FAfUy+2A4WGH
 aPw0AvE+MSpsnHqpY1mzvDuv2g1hdZm4jn8rbScYWTsbDbAwDn3WiO2QDcBwSF6Bsbhxtfvi81V
 VkvKXOjx18bUMQD+g1Ldmk0qYcWfT46CrHos2GNYGgqZKF4m9ZZgordUo9wEP4o3AmP4VdmrKcK
 c3IwXF0YotvskxuDesX4Q3FloDJ+wfchPtcdbmg5K0sW7cvz4WDcTiSjPYDxhjjxgEWzDI+GUWj
 6YT0gYA8z8ys58qdaig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX4tzMnezTq7N6
 yXb9icMJrrTChSHquFjAhiWwj87nNa5t8gYfJ9Wk73x+6QPN2uz3N60/y6IPm5RLcrmU5i8MPU8
 BJn/n17R0nwN84OmDjJzFMb3G+EER5Q=
X-Proofpoint-GUID: x4YbFFLaMs1WMnhxIyUVe0ZsHqApuPo9
X-Proofpoint-ORIG-GUID: x4YbFFLaMs1WMnhxIyUVe0ZsHqApuPo9
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a560a12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h8YGW4MSmiDDVbuT7RUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140105

Qualcomm Shikra platform describes the BAM DMA node with 7 iommus
entries. The current schema limit to 6, so update the binding to allow
up to 7 entries.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 0923fb189ada..e72adc172af1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -48,7 +48,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 6
+    maxItems: 7
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.34.1

