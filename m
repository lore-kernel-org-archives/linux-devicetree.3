Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867544218B6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337547; cv=none; b=N6oopsY1llyDSJKVOHq8VNxWf2Tu9gV2y2HiX/Wxm8RiG7g18RYxLyjXtrDIkzLUfIegCq6siGcbCef7ngAHDrBNac5VIADXYKphbI8ArI9BkShtoOM3Emfn4s/2CaKtEmv799ikXz8raZPdS0I8R5aZlER2mazRZkemJjeyO98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337547; c=relaxed/simple;
	bh=1pydzzpuEgb99srFhSDcm9R9pFLKSlB5QaWbAzMzsLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVwgWBDj/8S4QJQTYBTS/X/A3KubsGzAG4xZ+4xVB+gHOs+Qq19x6gvAS0G7IVHs/oC/8KqzT/mSqrF3BqoosBVs0gfB8D+PTuNd6FOJSX2yaUOXDG84WUjYJZf/ocVGtyaZ3CO6IE9NXOcdwp2tZ1Jf9vVfecy2u+yBJ80Z3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/0wiCVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1vjafZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/0wiCVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1vjafZZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTQ1317147
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=; b=k/0wiCVAxdc0lvmY
	AGxukyenVES+/EL/HdcZgGTRO1AxXjMyW1i6e72AJxhmGpx6vVwCMxyCBQD3tCSX
	MJP0/Z1xXwVUN0ddLQkuAJS7fqQS1r+aVrJ0tryEYgH0iCYNX6KnNdWht0CWdyu3
	JSL55dSaFtvBioX18YENlyF0MCR4G/kDj+hIrFJgUtPgTcJMLsH2+m1nIHOy+WHQ
	NeXrnnf00q32PMAIV7IFbmP0ALBSogjK6uMkL90MabD+/vG2JZV28IrPHmAmJuWe
	Q9M2aKcpHaFKus5eD8cocap0TgtWz0elN6nYIX1eAWgrKo5QER9vmzWre9cWnqPA
	ik4TLA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:32:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so4625664a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337544; x=1783942344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=;
        b=D1vjafZZ6firn78uiedXmMJyKmPNNzCKHCeWcqgZVYERDtRUQ7fzb6GeN0HjovH8Uw
         XRaGrC+PZliIQA8DuQQguPY9PJCeQF3/gxsxThRQCWbR5GaLRVn64yL9+pEf1mAdkbYX
         xtBrzHrFwBeeIi2IBa3wza3JR/dyCaWd0m/TDyMqYiWSWMJkP/VIdOJrcdvS4ip8Ax2M
         69M5o5HY4EwnxPjFrDKEPXEsBxOj6aymcKzsIxfIItDe84VENJOrhjHeJnWNHSupJXHy
         Bbdtlc1gh6RvIJ4JEcXQUaGr0nxurXkEwBVsqE4gqbAyuUWKyj/5Ewp3MTqVR2yWvQs1
         P2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337544; x=1783942344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=;
        b=b/fwRvvYXwdlbRIw8hxJnxS5otfkAWeG/ovPQUqqA2NRuSv+Zz6lkaDZF2UJpJhG5a
         xwedDBA89dcS4h0tI2VUOgB2TpnXab9Dxz3grobIO6hUqTVD96aQOQpqliBtPcAv9VN+
         uv6zfREkHNgAZ0dKJzMBtiPIIi5ut6iaAcyz5zX+Sn2m1Ap8UbsmeOirCuXA7M5jMnyu
         jH5gNu/RtqDrhNfYNECZsG+bM4fOM4YQ0PjDYlY3wzvyFGCI19zEe0yM6ItnFD5G5wqm
         DB8dKnU3TYBseg/bIvH/Kt/W1KhYOykL1YAus43fqr/2djqv3MY0+4x5zIVqC59dZroy
         lU9w==
X-Forwarded-Encrypted: i=1; AHgh+RqvwH3HA/xJJ9czVeW17WldYOQrRr4RKb/LfN9LF1LLayThgJcF1lWnmTgttgpwCdqdtDoJkdYKMv6o@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSHA17Nzyjo4Vv8OpmVWjgHqYPIH9OvbOXS7n3Xr1oygzxRXb
	jjw7WtRXEMBA6cCpAjRgZGMkAMRlj+axjj4eVSH0hm662wyTbZM4x+1xv1nxBd9v9kSSB0xRGT+
	MDkQdiGGb6E616jQuOzXz7b9gfNsS//l8Y2h3T/nLVg+Xbs7Q/EEEObgCgkZ6QSqWuYz+uErs
X-Gm-Gg: AfdE7cktHCzgeoIiEJ0YvoFmTdDvihlvn1RPY9Uk+Z/LWLn8812FLtWyepkoeX81okK
	u+zoxfeUHVZ8HqWJrti14+NeAb2SyguLMBebJ3F0aHlS9prPvZzJxRHn6/97+4qj/x+t15Y5tx/
	cNEs3XtX+Y9dzN/Nb2LcgysbBJp9p4i7ccO3T52P/kAEnBwWuFyEi2yspgCx6Je0UpjxXE+Re2b
	0vEafpuOYa+/Xc+J9LCafIwa0XJKDFENkgfQe4SmOXOJslL5zUb36uikPVSnqiIWVaABfbOIqtW
	TfnOtNkgR8uixZuf1avS5EOf20fJoJWCsHVJJX9LinThjRSnZDbDVRpTvFJanPft/TyFithHwgj
	+SJG0s3NymtDK44BcCiHKK+02M50lj21FaJBG93BhsgGL
X-Received: by 2002:a05:6a00:4501:b0:847:84b9:f3e2 with SMTP id d2e1a72fcca58-84826f0df14mr86390b3a.50.1783337544435;
        Mon, 06 Jul 2026 04:32:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:4501:b0:847:84b9:f3e2 with SMTP id d2e1a72fcca58-84826f0df14mr86360b3a.50.1783337543972;
        Mon, 06 Jul 2026 04:32:23 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:23 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:31 +0530
Subject: [PATCH v3 3/6] dt-bindings: crypto: qcom,prng: Document Shikra
 TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-3-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
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
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXy2pBRk6PvY3i
 8Guf/fUmBcDGt5KsygmfK+hc2Lu25VYk8fiHXXRg4lR5vFZFwsk30/2rsS1b5AHUOes7CBm5lWJ
 AQ/T1lMZoG5L8EwIw4K1Sx7U8OhdA95TndWCUnDPC5Cg+DNloMQYcprNe+V6+2U+9us2tOJohB1
 yia6PrikephksYL7BEivJDOq5c7dUB3eDLiOPoLornyG0L/Nwv+CNxTsz12yGALCwWs09IXqZ1N
 HBuzrqc9fT7XPDVx9I+vDLY2Mm02/XWxvQDasOpB16+dUz3dfob4aFdoSUTEB4JlkmHux/96/e1
 r4Kme4iFAgf1dcSQo0zS2LO4IgwQbIAZ2DY9Ru8Sb16qkS9lzXA+VXC0Wtme8wpokx80cmfX9Cp
 4flCMk8A5ZzHmsRZWsXP5DF8ZIY7aHqT0F/m7Mt5MhXsDvmAM76IiLlEU+CipEnKXWjOWvXHFPX
 ZyYaWlxn6KvVMSZlhgQ==
X-Proofpoint-ORIG-GUID: 1spFPwWjVbkoUrF1KjdiBE42Uu_WP41t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX9ltITO3FC7M6
 C4/iRE6QI352Uv/qt08lEA5AmJ2IxVQDg+4aFwquSGJNG9UAlYW1XGlBOEpwM+38yqPNk6sF6bN
 MHBz14qqAlq9cOtJvzAqvrXtw2kUd9Y=
X-Proofpoint-GUID: 1spFPwWjVbkoUrF1KjdiBE42Uu_WP41t
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b9249 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..5de52d7a745c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1

