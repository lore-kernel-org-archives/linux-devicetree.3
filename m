Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1173F39DC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996157; cv=none; b=ROfdkdRL2YhJ2zzqYQjhoPhI6X88CDm7PVrLCr5nhrsGZgrkyzPPx280VLug06VfuxL9ng1+w+qk9eqxLjAmT9tiXsJeOHJ91MsSTeKdVOY2q+6cF2qvd25qtJIASwXhHT+Fcqe/dPhE0JGClO+M91kSjeHFxTQYH51k+Ph51o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996157; c=relaxed/simple;
	bh=7nycLbB5N/ANW+yrShxOF4HkSLHBeldWJv9RE6+5o6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f14zpdZIS0cBG+qJClBrPUbOhRcsePne/s/An4LUyM4L/UmJk2Sy+5pMLQj6tv5nIrQSIvXXR2cDcC4f/bmCNybrCBL30KrYjT0AevTqPVqfM23h8XJwi/rSYS0C9ZBB45O/WR3ZCKiDK+lQgpOY0RW5JKE58C0uVx3q6cttDjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIjSWwO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+JsuA9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIjSWwO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+JsuA9u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqTx2001516
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=; b=MIjSWwO7YL8EFDHi
	m5z3otatOHq+eJP16zDiQ4eEb+BM9On/cx0LkZjM/XOvgEPb6DX3J7+v6ZYx3OSX
	eHKGxQfhP/S2GgGJSRBtnloOpu7jD8gIiTDJHPYnP91hj6MRxWGuXt1vBzWXlpmM
	2xbW4oRKofad/TGaTNfJ/ayeii5OQIeRiPg3w3erq4KN82C0Xv4IQJflm8iFqnrk
	PMInjmJZnIhN9m/ah/Qf6dPB/GuOhP1l+SUdCsUh3E9frgN5JkvZMF+Mtj8gzinu
	tiGLEl5ufVNqjNjDi2e2dz5/oWSBPIv0lzj9a1l54x+VO9rAkDXlB1lgufCjsB9Z
	tKyOyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rgv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:09:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so5272809eec.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996154; x=1781600954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=;
        b=A+JsuA9uyd6TQsFQBGaDZbl9fYOafeqqUwf6xQAHNqkmVusX34/fxgTqblMmGfOWC7
         DVFt/wNRkelEILUqi98TCetk3TGyccN/QMvfigIMfm6fSWhgM6/IQJfYLU7TNXNCbpk3
         6QSHDwWkstktaV1K4B8BmMLbtEYpW7m2qnRXQiPHOJZYyX2HLCFXHxSCUsxIoBrWHXN9
         KnVuz5PEe+Wyn9MbiQEvXqLt/uDQBgKL5f9mpEP4HQT91sRInp/h8vzu4mofQYfH28zJ
         V+2NhPFVFkAEWVqCFrklbwZMenxH/iWD7ApSQinJdmofOWWTDmgfxdQSP9FUkaeYsXG2
         AJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996154; x=1781600954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=;
        b=fKHEQl6dJurN1hSVbDFm0qSndL7kBmd7kLxRVkuReNP3wUW8+xMd+rpQV0r63hkcQf
         pBKQj6q2SmzC4Uyo33jaAKXmvTUV1Ln4VNgO2K6e/TDOdmDZ/b7rVQkAoLQtNrO7Fdjf
         QKFS0yVN/I26iRHqR02U4hNPanxguUACruC58SKZcdyKbOh9J552jnVKgyNA4n4iWBE7
         RFGcjc5YKrbDysqhGEjVje2wLSJZ8bWBTEuZL0Ip5XEtJw2V3VjhTqAlnCM7xoP4jZaa
         C+ir5rFf1AdW3MWkYJUwXLAAxvqehnXviX5UCyGJ9p147wdsGeWp+C0LpUbv09wUHqDe
         M1zw==
X-Forwarded-Encrypted: i=1; AFNElJ/68KwxeEPU6XL5Au3UxtrQ0KdFfRKaG6at9b+0tg7jU2rrQexiRE0bO/0w+jO2VPZ9rvfU9LO2O6Eb@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMm7z2ZRMzWF+uI/sh+ohfvZ8exEQbOKUg0MZFv8Ct/Y/TKvO
	P81UuUmChcYxTjxGVEUeVy50yeXVBikkp3IxCA7tpqx6gBkLZjY3kRWQfva9cNG89lAp1M2M7qy
	WM6JQMHxc+Y5KAM2xBi3cRsxCC4qYEDUMLRLoGB9KKli232aRpUkrGVoZukEDINvK
X-Gm-Gg: Acq92OEH6lmkX1eKKETHUs1Ci2ZbWCIMTQqHPenBjyUbncvD5doFZrBJfozrB3k7p6m
	8KnFwy0BgDnKk87HB8Gl90cbfalpQFQTgBHrywH+g0XBfCshGKokea4lKXVoIgnlUodd3+uga4i
	9zxh91rf14KL9n4KU8VIgmcnyY+OnQ6xnaSagA0GJb8Jw/rbKgweWtprOKmSxX5Re4MNGLL7NTT
	C7M6QLlnoPFaRR2Ujh4roHTmawkAaqb4S+tBl1MBJiqNzFreffGQpl3ZeD2LLPzuyYqTu+IFrI9
	DniI5KirhQGbtIQiLkMXar7XtOqn6706Px7iSEMXcrHaBZn/LrmxLJU/UX3gf6tgFT6fmgb8LAP
	iwnHORRbZVksen1HN8nMK+45V4Gp3d1dcP/ZsnknyDHGRlTXCT4IUWDUOaTCZKf4ga24wnRWjPa
	aH/eVK8Nk=
X-Received: by 2002:a05:7300:5b88:b0:304:9b48:53d8 with SMTP id 5a478bee46e88-3077b0689demr10301694eec.10.1780996154374;
        Tue, 09 Jun 2026 02:09:14 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:304:9b48:53d8 with SMTP id 5a478bee46e88-3077b0689demr10301653eec.10.1780996153872;
        Tue, 09 Jun 2026 02:09:13 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 02:08:57 -0700
Subject: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
In-Reply-To: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=1073;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7nycLbB5N/ANW+yrShxOF4HkSLHBeldWJv9RE6+5o6s=;
 b=Qyaa6xPHtPHijQ6yZkM8EQIl9+4tNBo5rCOLMOeRWhBqlpPMXcpqKT5KDARaIOHjuQp31rGbI
 w+E8ajPqWirBswLJwa5XPbteTLp7ru85UZlctwPderqzAqb/9xWAWmc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 0VKYa9QCZ7fJdurlO4jm-j7khbBCApLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX5VTZYA3C0fb6
 OYQO0K1q8T3bXtYLWFitutNFOec+sgmXMG59zjcA5pUej2ne5+idTaYGAPkKPnJrLOyGtoEjvtf
 eLBzcXR3vkXGUFswqJcQRWM6AkkZHTkRDlcxl9/7QON5eQ6dUljPivgaK9/bvIaOszEhGDDm8MX
 9s/9wqhayHmFd+AV/jXGi82yp+brYN5oUY1O7OSAk8BEnECw13d37GYfANS5m6qh+iPANkTJeht
 a3Wgil/GWx//GyKzS6EFVkw8A3xiNigF/Y9x1XXgzgfOx565lg22JvZhGco3tvSN33j/4B9ihku
 j+iJ2SYXxeMIgDhMh/SWcpoj3wRq3MvQl5t5NFNzum5COnjW2exRNebUTBGwheBbackW3URA923
 DvoqgLm6mNpxfmp8jj84XOhbAKpmuwAVsO1GquBZ+B0Kl4Zb1EjghFJZLjldXs5FinNwJAYE/3i
 WtwcgesakL8o9ASs/qw==
X-Proofpoint-GUID: 0VKYa9QCZ7fJdurlO4jm-j7khbBCApLI
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27d83b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NmGC_Fbkji3YBVCvtbwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084

The Inline Crypto Engine found on Maili SoC is compatible with the common
baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..c9489f6b8081 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine

-- 
2.34.1

