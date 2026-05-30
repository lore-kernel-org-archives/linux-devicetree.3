Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751E313E34
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165683; cv=none; b=IgvZS3C9y5saWCGFKxLKcLdjaiMZVV0X7GE+TeHFXNzADnxEL9izSCSdw6Zl0FgQin7vFy31Z36VVrRghG0T/hHPxCzTn/zhMZzy4oWASubnTlQ7y6DQ9yDaB802ZJQRh9LGrej/RW/i0isezTfksb6doMs6UC/PW8Wiyl1Z2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165683; c=relaxed/simple;
	bh=mjrd/5WRTtizVxAileTEcsI3Pcwm5BCTvACtsLVlxwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzpAn7xcNXcYJBJJq+Of7B41nssYuNuzbbLuKPGCDYfqawXd0gGCj3rI1iD6SOQFZwafqvDg27tRx7rp2Mxo3JzGRUZDq+9M214duEMzkvRYn9fPeMzm6eGbDNmRr3o4sgU5lYIT0M3CS9qJd7WsrSA8atpAI4uj74e+MUvs6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4LOmhoC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4gdjuxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4LOmhoC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4gdjuxr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOWZ73468337
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=; b=F4LOmhoC//1ULH2m
	z0OXsKvYwjH6BFxsiunaCfeQSbEaiNDoel5UdLClSRtJQdCMyEUg4QGp/lQuVuxs
	N87bKUqYXzDfTTYAjdxtf557PVOsycOfn9Sh9RVfXOOohVOh7cyZLeSdutG4MCS7
	ISRvfi95+0zSjC0XHRuamiJ0hKuhiB/q48VVjfh9pkWSl2G9VJ6x5uINHDqaZknV
	taomnxc42mteUR6FV2aofHnLNsS3mDcHrnuRO5iT1bNrCO/XFBjv66IDauLBVn8u
	R7tMdM/s2hHIBDTfyS3XOe8WteqyS7U/pj9zz2nSVFFSQcNjsohy5fExI9u5ye1P
	cODV6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr989n1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf3636d6c0so9892765ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165680; x=1780770480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=J4gdjuxrdODYs6/ulWEu1JylI8cXk/+84+SyHmcGKhr3YF5hfJozuz9rgTW0CMvxn+
         9pSUyXe9okcaH3tEdIHFVdQyDcgIaffvzd9iXw+ScbSdBsjz7tXnGETtkI09fJQaVMoe
         DJo1gPcwG1M8YLZmax3pDCEDBXu33N+qm+1b8a85X9EyjtT4SAm0UXTYkJi5hRLdvl+w
         PN857RYYPNedju1w0dR7ESZ8z5oqU6WgbS+HFTq4BB1WEGnBEim74wJ96bdbzfBahyDK
         yP+pJuzMJgrRBqeXRdSHeuIYPSiJlrD7yO7SVpXaf29HthqOniund3m9WnWU9isHFWCk
         zksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165680; x=1780770480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=HE4Pbx8TTSMjO6m1KaH7kkCY8tmmsmse/g39TfONHASTB0rWV/aXxUwU9jK6r4KJ6E
         aramw54rCPUEdZYKnPUuxQ9EuwYWDcsrDvKA1JXY/vZ9WtdF+9YEMZJVeQe1gSISxH0T
         P+r2U/RJUl7qOw3dwJHnJvJh9Ybx2Ln4T6figHgZsO4251MmcIsnmyQXdoqtVCIljiVI
         RDxBeTcC0plLVW2JwiSGpjqzH2/eYEnEgpami9OQ2GjmwbFZVHJ5G6sXoMIeEl3i0xpN
         mpbfl/7j9cedStKVvRXhE1E5bT01FCbzaDi8ThcTdyrqi0NC4YIR74EfLL2pKRBpC3jD
         oR1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+dLj9uVlv1xJyBq8fPgDmBLs4GuyaDyTKpvQZz8X+RkKTV/By5rn2GDBzD28zq+OFI8KhouWR563T8@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyMvx2Hu745HE+UvuH/9RWoB2ebZJRDhBONcu1XB0yWk3o/4r
	5Ya6GLuBttPcI97LeI5+AReyotk60P3FxCv70wMlOEos2cj8Hld9p/Ib/H+ZeHo1Bajbum2H0+D
	+3kqBxwQuwBKBTdiVJIKN7r9M2sjIBGa5wDtH+mL09fKU6SNGcwdfj3j5kzzJA2Kb
X-Gm-Gg: Acq92OGWcwH3nG9bu2DrGG0JjrryVL1zKvWPoKGbkN4ZTV8uNAqwYjWA1mRwsxJ0boj
	gc7jWVRZUJdQdcWczXMWs2xRPd4vddpTzcwuo1QwFLqtpKrQAj9NYqnBSt+J/Syuw5R4u1j7480
	rDqbx56P/3uX7rqhnSQaXI6IegDtL8vs9zCwndXGeHZbk6xQRZF/R3kY//Hc3xmzg1dUKZSikTJ
	9okDXvFqvQ33oma9mprD0/IvnvMzj6+sX2CZFk+8DPEzUl0f/LjQ5seLtjICdrgAh4qyKtOop7t
	RgQDFm5dKwaclNsIgxTaxyTH5c2Po1FzQjAKclMECPdZELmZQp15asPaBLrXb9GWADg76GwroTh
	N14BqE5PI1WsV2YPkvOa9st0R/Rr1emOhtPQlHZsN0O2q6aA=
X-Received: by 2002:a17:903:22c5:b0:2c0:c625:4019 with SMTP id d9443c01a7336-2c0c6254474mr318235ad.25.1780165680506;
        Sat, 30 May 2026 11:28:00 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2c0:c625:4019 with SMTP id d9443c01a7336-2c0c6254474mr317975ad.25.1780165680028;
        Sat, 30 May 2026 11:28:00 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:27:59 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:19 +0530
Subject: [PATCH v2 01/10] dt-bindings: dma: qcom,gpi: Document GPI DMA
 engine for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-1-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=857;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JRwNa7gj/V38SNuXulP2MlFnweDp961hhJdbueICCwE=;
 b=zWWaFqHSP8Vk/mLPkC/+xc6zW/EaqcFc/llcdbnCatLUnMeA1FqnMId5kh8acH2hWQHE/jylm
 oYBDHZraf7hAjAlepPcNqUcUx5R7dmqm3I07Btm9yTucHnPU93ynR3r
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1b2c31 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jyTGefxJr8I4-3Pae4IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: unWFIhdt_T3p31jjynnajW3YkN0q12MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX8PmBRKpkvAsF
 RUu+mqvzuKItZBTQOTjdOgIS9veu5drkHyaOKUflP5aQ4zRD54JEXgn+qwlZzWgI2znvhs1Kwol
 7WGjHQrKPW6rrHDi+EBf6G8dpQC9o4i4y4o5oMGzb4hwCvUulvczOwulia3H2QUKzl07D/ZmkHF
 sXl2cNsMoqfm6CobMpGKrgWrvQ0K4hUPBxSa0Fr17YV3ynorMjEImpCeCTSpmB5wjCe1GYhiOVM
 tr7TYeAAlBsyr32uitkGJX8gt9qUdd7jE9cSkV8hfSE4wY9YuVcZNp6yWXt3rs1KEf4LmW3QEHo
 b64VvkOqocmdIielfsDc9qYS+j8qAQ3pLm/pD1sv9rQiXdtOKNvUpjKfFOgHG11vJiNNVlv3occ
 FbDbOGgIIOWdLmtKGXRnZ46f5qA9kEDmvO2Q2zehl39hXiF91/F1NTGaPzU7yLrTVRNUtwD+mmP
 09gs4nbjKR/hVt0Z3Wg==
X-Proofpoint-ORIG-GUID: unWFIhdt_T3p31jjynnajW3YkN0q12MQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1

