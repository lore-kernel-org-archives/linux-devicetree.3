Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC863382CF
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019736; cv=none; b=FfnuaL6/y/WQZHx6DylrjMsWDV4R4VZYMsaaGOkWuVE2CH5S/7uE7ghtQTiVg8ptsNHksYFUXBSPNyIAE7wni3UHlvuXMd0WjjVOyGQfsDWl9mGeiZII7OBB36hhhu8iJL6TIkjHmM52Q6h99yW8UMFqj0l063GgczRzQ51KifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019736; c=relaxed/simple;
	bh=dtdz/yukTGy3rf+mwTbyo7Nqf64WPlvGCi80RhNRT1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unB1F+3tSvd5JLswEQlbTSU4ZCbmkuZzje9wwwZv/TJ80N1uZvZb7yY5G0kWYaIvBGPu3av0elcV1IPBLG0XvlKO23KZiIpIys0pjDs/1vkjYettAE/tTkg8LUMbFSyBCA8qw/Nnuin7x2OeC+C21FFxGRbyPhf1kmPTBQHE5ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYsxF/M2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ni2XP+U5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYsxF/M2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ni2XP+U5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5lDZ71960105
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=; b=WYsxF/M2c6N8Y9pB
	VNWsgujJt0lda4ZJlNLhxqAdM8r4f3uNegF9LsisficnkDhp+1SusKyo37A7TQoj
	4sJ8Po9EerVHPlYm0ulnIItVNvfid8EwzJ7qCJ9lPJtwDF2l4nCfnYgeqF7/+Dgk
	d2Zfu2x83KrxaJZic2C3072no9LIRHrkdBiks5DV3OC+Fcur2pvL2hvcjFL4J84D
	UfiOHa/q3XGnZwdhDsSKyNk9cD19sDax/cUttYfl3hKtrvJM3HqjzTvAJYWKfUix
	ny9DsP/Kg+EAyo7hbJ/yD1CvhNmc+cwT3IEP/UqEPHSeHk2g2pwQOEVwJlQwI4Nf
	Q1oG0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrgq6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:35:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7c904d476so3007195ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019732; x=1777624532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=;
        b=Ni2XP+U53HM2lpO1HC7LaEprqJGmoZkBJdLYmqBeKFSv5DGuZiaYQ4LNZ9yJE9ADXv
         8E+6b4c9dmYGpLztvKTXzWpOMd6cmOhMgGoPen1fqvYGALzXz8oF5PguQMvEMGtLbq6T
         AIxfYWm3AZU0QMqt4+HGY+aYSUd0UczPtJ704P8Me42F7kZEudnKRk466ppBwb9d+pGJ
         KtkfMG/5OsN+bF5UzXbM4GQdqmcOuScljhvzAr4Nm2QTmf3BZFzAClGAm4/0k5ME1GBj
         2ILxZKLN3bTSAQk3LA5LKdhlIFhwJGcIF00JfHmrz7aIESEuM0WbCAu1Myxr8L8eUrbm
         tKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019732; x=1777624532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=;
        b=ijOJBO7SlACyV7zLA80vRZZzQUkUpYdTDMdd/E3Vd/W/ucrvV03v4wr2uKD92LdMoU
         ZekhvNGVeYgosgQeUovDbVNg/kRIC8uANBEqVmwRz7COncYolXofndiXlW+f9otZVP8d
         LhJKwOW/tmHau78bvJdgjfszz+H3CmTiVe8segdq8eObYAPL3St2CyJcP/OrN7+VDkjg
         PyeQO3cmBFO6/ejLopJr5Jiz8WsrroO6tx7MAuzVGcSHO529iw8yoksqLfe98snxiBBz
         vSYf2Lk9Rdt4bjgMKmxBRmYX/W94h0z3qRkV2NM7s0ueXgmkCqcZcCr0KS0X+/8qsO98
         FvOg==
X-Forwarded-Encrypted: i=1; AFNElJ/CcqVVT6BakEvqHzByl2BRiuZ8ve1VrmTtn7w82UP5WE1Och8QbNLKursX1VCTmQ+Ii7nJ55l8mjFg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxd+6TWUTEybqTHamrQFqMDPPgE8JhnbqKVlpdQdqayqXuEqlK
	8CA8+jO1mkiAMb04K0hUe+UiFj+/La6tJv7V6j9OQigub9L8PnuR0xkjcsnP4BfoG9yynqGM+My
	IyWAlqjwr6h5JstOyA7VcnFt89oQkkM1gBLtgcqiUn82Hkm/A3+7e3HKwEVk1rccB
X-Gm-Gg: AeBDieul+GBtTcHcUxZxGyy4CbWTA8XNId7ZlMiF1l6J5eVbLtQ2Y+L5XzCos2/NvjY
	hVyZ/8SvPwlT9t8KbeFvkFUXMsYm1QPwe3awPuqbDp2TkJzPzH5jqEFJMNbiSrI0YNYotuMRsCd
	UOLumSYrURauOwMlk0oJrI0CTfDNzvURibEVtm8WXtcdgq5FTpx1tQOjVJ9VSGjdxpf/zMWilDN
	ZbvPzgy+KUCEyIRwQWGjaLzAIgQUC3fDnBJRYcARexNQ1QAuSdsUsym8S4qP+FprPW/ZYbusyuL
	kp3qbB+0myv+SkgH/y/bVslTnes6zc6RIyqYXJLYi6n9EPkwuhyWZAFtForVnat/G17w6tUuma/
	6kXa3QfQKbxxuE0bKMj4TWI0l1rTfm3uPY+brS/uCp41VnO1GelNsAEmFtA==
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b5f9ffe73amr295732755ad.41.1777019732367;
        Fri, 24 Apr 2026 01:35:32 -0700 (PDT)
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b5f9ffe73amr295732405ad.41.1777019731856;
        Fri, 24 Apr 2026 01:35:31 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm211389495ad.72.2026.04.24.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:35:31 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:05:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: Document Glymur
 TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur_trng_enablement-v2-1-0603cbe68440@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777019721; l=879;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=dtdz/yukTGy3rf+mwTbyo7Nqf64WPlvGCi80RhNRT1c=;
 b=o3+GM87zYpuFf61xL2hYMWP1IKf/7pTwrji9hnNyymjO+JR2f+AkbEVLwXKnn8XobOSqGTrQ6
 YWe/xKzaH1dB8dX+xAEPGJrl/4vfUapk1BWIFKyM31dWhLWcJlf6PpE
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3OSBTYWx0ZWRfXzNiTTqPmZqho
 J+BeNBvUvGrnyrCYw4I/1FZSXFWpNHbF+ylVddHZHjgxwfs/QcVyLr03nJKTr4j3ZY1XvnMZz6K
 ShEPuJFWUDy0LyHcrlsBSh2WGDPEZ5NIfPBk2jln6hn00VrzOgF/YMnfPMhPzvZRw0fh7ABpF4M
 8WHgBmMRII0HOlTdSsm5WCwJ4NL/fWswKIhVHZStEkV6vz7B3nKOQGBLgpvgM9qYk02oV684f4+
 mpwViw8OMyIPOwuHrNAG+eJEHPids2RBpncuz86dRwADvQqIBcv42AXaSY+3aGAZzJHVvPSBvAx
 1f0uv/gXi5lVYQJPiul6tHyd8VtEgLe7nn/sOkQ7neSbdC0VOMT9u5zRNlByq/2+yNRyN/p5QvE
 reZu5n/HQbQnISE3Dcr96vucVjF0nkX2cQ4LfP6Ly3e/Mx5blFVIwalyuozeQ/+mFl7HKKMHuab
 Bwb82hd7YJGMl+wjd+w==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb2b55 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2IqcgDMfN6YEDlzvvDkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: jtZDu09jm_ovMGkSIqHDfv7leTQBUzL8
X-Proofpoint-GUID: jtZDu09jm_ovMGkSIqHDfv7leTQBUzL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240079

Document glymur compatible for the True Random Number Generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..498d6914135e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,glymur-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.34.1

