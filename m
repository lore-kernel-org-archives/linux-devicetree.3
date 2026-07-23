Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED44315D49
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771224; cv=none; b=sER0BBvlnxWEPr+HJe17VgejaYHFniAC2QYhlQ5ELK64Hac89kfb0+jTa4DjIbxFmnphtmKZFDCi1Z3q3EqezzP8NfWtLnPAlVPR9eFszGRhCoC1doefauwkv2w2eaPlXDQ98miS09uNckbuhMAn8qHgcLfozJ6SOp1fQeLYTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771224; c=relaxed/simple;
	bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUHM0vQkPG6Dh+YDiYMHQqwRWD90WhFvX1gGNke9tqJpOf2/PnqWoYby6ChxYvhHm9BPSJLnwkTquY0PItQFd8AiTPCd/hEwEbBkeReM0pA2fd7kWznYJ2BPqlS1JmC6LUOk4NkdiyFRT4kHdyJcUrmHvBuEBvP1CYZL+kLIYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azy1mT4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTyR1W6a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azy1mT4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTyR1W6a"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WkA52260349
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=azy1mT4kMdMyli3R
	YeuVauPdoJXBz8OpeIX8wWo3UoKfEeXTtkejiDeQQrKgJCOO7IvV6hrIk/kzQnCr
	AGjI1jFz/NBj2mtP0Thbv062aK/514fQYmNQkW6xWmFcp0mj9UTDeqDaF/l3fiwX
	4ymgoIOrR73qIztYZJU3Y0ogihl+rMTiGHNbn4NnXwSjwt/KD2WhQRGaTLYZ4oP6
	ukOw6hYUrnFAl1fk+IJLv1CaQMrrPigbdK3ZPD3UkfX4YpSsp1Y5IF6sPEOTDrwM
	JrR4TXpMP2AdEXxK1LKcwkuuWznBRG5oklyc49jqLcKGyZxN28UasqblM32z6Ug5
	MvIGpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275hp7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:47:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so3045565ad.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771222; x=1785376022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=NTyR1W6aLAYYms/KK0u/nPbGSsoEatCXCvPMry8SG0ICH7LOWQ/9op+5WWYD/KnwcJ
         kGumWl/sYn2LkzWSPSwmbtFyCpswxcttzVjNWPT+9Um8bW+MyiJ41EXavbbTn7MZ+5Gy
         ZxnQPGxPpQBjZFdv0dyOgsZ4RcbgV9cxAkqP6n2Dv+IFe9MhHVlIJIdpZdy47I6GChUP
         oDm9jBzPIjDiPL4M0Xft323Mr8hhVgekpbCCZg7pUhPex3oNw+94Cr6UV3WcXVX4FT6c
         hy69mlpg/gt2EeaD61Fu0PrshsfSjFcCxxaUapyM5Ov4QpGBiLpb3GSA4iY8oiL+lzr8
         Pm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771222; x=1785376022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=hm92fD1RUhJvU6y0yFGeA15Iu7nCYxQwz0cyDcNhkvAzRPXjLyx1TO1DPHdpIBLgru
         6bAcs1CuxpCCGLmtg9h4LcmAzwNflyTU4dGQmSMIf9z8F0DuO/9dJynl+P6par44xl5L
         AFQ43T8mD/qEuvKwW45pdgngQqh5blVT1KMYd9rfIb5gWuFIKReuXrCCSZ1HaES6chOq
         kXoCgGVgq8PqaFoXSS+t2C3lbDPgVp56Wv4tlv8Agku3P0sz1E6n+psWNJW++iYGU7O3
         kEvMr9e6zx1MNS0yGuibvWnXmtwUGDULlyamlKUWUTr0Mir5atT4eacIrHu5DXYJIvqX
         ou5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoRRolurqxZDd5CMdyXkOm3MmJ40LFJ9VCllMlVyWul6IcJAWvA/84kkQf69P8v0GPn4wL80Deg+R04@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3cy8KjbWsuOo0KpJs5rTv8r+sXCBSxLkZfG11BvthitrtKC7
	FExCCdxHS2vZiY8xZAjBOB584H/hdFj2KJ8RtIxVZ9RHcP6M0dklS50VjyjjeszUNkO0t1xhzEL
	cjsbJBs4t4etl5yZF8UfOJTgrU6N74fnHpYGzce64gL9kB0sAlYRKV3FGmsa3RcAvLAwjGeDY/2
	A=
X-Gm-Gg: AR+sD11d5zW4JHeBGEq0lcs63HZZ9MAPxFGm9RBSh38wqWHNkS4+W7XgkZSbCwcM3nz
	v9fV69UEryZ1kPhYGy70+W7KTrkZ7GbdvtyiVdTXxFxBXZ/CXKeV3qTSIJ8MfQxs69OR1d/OwGr
	nmGQYxdhpYtRFMauQBm9FZU/1npNxMEwBJICv7UPeba2wMgTYye4Et+3fRoihxUchY+qyPn5HaX
	SB2Hm8/iuP+vuKP8+v7rEUH/HnfpqWqj/Urtb3/Ce8UTvlT6FlPqouksRKeaj+4C3sFPeqPEx0l
	XHmayeYm46Rzxp5tsovv8ci13FYE2LclzJxDRRgk3trmfzDfwUk13kEwBKVj6xJsSS3y9N2mBSm
	7ysqyZr9w2J3C6PQ6T3sc6QTfG6qOy/DzPEDu+T8Rs8YHFG36bO7COTWgjAwb8IU=
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816445ad.1.1784771222034;
        Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816185ad.1.1784771221548;
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:46:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-1-992615f9ea15@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=MCVWSdx3kFRU6sl12LLfX/j6oW1cFns1Kbxbiws6kjgs1+ouZvT9ESLEerRVnbqM6vSCEwB8T
 Gej5nGzKwOVAyRSI3jMXfjbVBYm0o2bMwOMcQhKEjsxq1ndFCZSFGQr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a617296 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX3jX7FQxI9GhA
 p2D4jDc27iuTXqHYwzMBZoZA3hF76IemZ8tJmhW5+Bptbq2OKXwsTZN46NuaHbXIZ/fnIQcmQx3
 EqY5i9qYFfENDVup5XRvtBMRwKle7Jk=
X-Proofpoint-GUID: GjmJ4UjIiZv79hnmZIOpxffv9MwLwmrr
X-Proofpoint-ORIG-GUID: GjmJ4UjIiZv79hnmZIOpxffv9MwLwmrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX31XC0rrCWs4C
 2c8rcn6ummimXVzKvQwZHks0QFjQBLXrWstC9de9VRSU2TEGF4FFPtqTPqnF7S5fu34tQQ2vQEw
 8V5giY/AeUSpu3cyWDNLEd+SXQYgVoFgFump3fZ7foNZDY3alC6ti4svBdhiuSc5G8IKg2ZKCA7
 IGajhOxnuGAyQ5m+7w5cs9/aC9QhUeDpg6Xosaknle6Llf09clSObirzsNpWimtEbwrPtiSyjsn
 AysS6n21LTaOF3TamfqvXCbzq6BEt1HpTptyE4rz1xz+AoO+WWv4Ly0VRdIYyMKFSzcwTDIDxGq
 FmiYF4/vEtosCpzRZmmNBmTURpGzSrsvbNPAmh44/QT09jVUTzXseK57MskKKnuOjLokJC2ODJL
 g0ctr2trmHB/XUOZnFaS2LMr2nn+nNO6C8l7gry0of7/kHFPnw0maqzgW8qRzfWD3hYfzfJiW8m
 b1ULe4g2SU7Rjzm+ruQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

