Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B0298CA5
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670437; cv=none; b=VLQXReN04AzJRApF8NnT+f1cJbXIDuHfbUTemkJ6gTiewFfn7oMciTw0Ve3Z6z1pPBpN0cNWTgPvRtZfXv8dVeX1DgAYq1/r94XTgirr5Ogyi68qrfevBONq1guKRpb+pd5x/INS2CNe3x2FRLDc+9kASgeh7Roz4H4JijoSje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670437; c=relaxed/simple;
	bh=CSaLB4+lx66rKWA1HMABpkbkL8JeBB916Ok+DqqthyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBG92OY1r/oxOXx86BKepn83V83IC5RB254b1cIk/ulDGYFTzzJ0htmlEIyW2jeBZ9aJzn70tfDedB4grsdwn/dU2oJpVbFyQl3h7Ky8rgQndED8oZnQ4+INwb3Y+4W8UzCtvsCecd+57lN/pR09c4oRhYftkAIAF5IhmKww180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAgE+gVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVPSztZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAgE+gVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVPSztZ2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Wtg81532096
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxH
	Q4pf6is4=; b=CAgE+gVkp6yzMJNwJqI8W93ABEOu7uZDkZ/gCGIPZVIQ6l2uVQv
	bxY48LDRcRNCOj9a7QAduHZI2cnLtYLMt/Hh+eUKI04ijnX+jKOi5LTZN48aNT6f
	7PmALc3DUD63qH/I7ib1Fl1nKxmIGqiWCRC0UWuJeLzPfQG6j+UghOFkeYC1U48x
	l6wVjJftxyXL6aVo+2UWaFSHm8pJ9F5uB28LaQ6qiuU6fjfD4l7Xp9JzkU8zCQKQ
	IAUGUlK7GGF/NuwT20PqzTZYOq/MHp/Hu+oStIpEh0WTFxGI6ha8b5SqFnUK6YaH
	cPoMH9foAVL0GudTyTsE0wMoCv29ui/UGng==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus00c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:33:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8de02a4dso2471315c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670391; x=1777275191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxHQ4pf6is4=;
        b=bVPSztZ2d9V7WHdanAEDS59n7o+A0fhxx2iZJAd4x9yFlcg3oeFNbiG/InI8jtS4wH
         FbTog+zfpDGgf3hTXg3qZlWmmetsuPmemsHSjPWYmxvLCEQXCIazfOjyIUb4sfWHM8T6
         ovFPpBDNTLlpj0gGMBRaSUrvdoV0fjwLdyLYXQpREyCLSLWCGVBs/wku1kLRzEeF2dBF
         9mnbG0XdoDZc//SPG8ZqcT0v5FfWWzTpxJ5FSk/W6RSusFjfJRwkKRiOv9mF6hWEgsh+
         NpmeU/HZGcElNzSkeBlhbTwzKAMLgKFJCIwWfNj2LxmVGP1uDE5YHf4TjKD3VUq35pIb
         ZRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670391; x=1777275191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxHQ4pf6is4=;
        b=nTe0P6mvbdUPY5//Wezt/NFPv3Rzv85N96QXOgQ5RjsUjxlXxkprJkkcz+QexAYjBu
         nhf9oyG+ipn27ZTTI8VQCwprVm3oAz+F+ZRhJWwUW3p2pxZuYbY+ZANZk5VSz/dADuht
         37syigJNUDp1L8VpaFWUdxKa6vwDgLT8Fdg5wI1a21Qofs6X7kPQqzKQUYetTzRBXWYZ
         vwpuhB64Iq6OQMq1KSkaw6n0g1KMfpxGI4AmfmYeW8NrMD9hKcsFRK+TWzRkitmk61V6
         MbpdswCbr8cO4JzoAET/gFDEX9OQXktCsOTEJuebRqk9g7Fi3l0Z3Z1ZFHaJEHOtex56
         06TQ==
X-Forwarded-Encrypted: i=1; AFNElJ91XCei+dJHNAH2qOnxBx+F8BTSnKIauPE+3u3kqRV8fpOWf20EQmPfTOCKHFvzCPQkGsPQrlQn1UQa@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8YHcfDZeFlECAiitB23CRC0yYH7E827L/42xOCc4+Ey8D41J
	Nr98/vtenHsBGvV01sToNCA3wYWQKgtXXTfYGKKhj7M9X15Eay2xqmtKeTJHwUxK+zEmQsrIOmv
	o2Luz0u98Ira7L9a+a/3UVUdeWPPaYrmo7Sztg/BOYVhMlypSaEFBjZYxWOuFP3XpR0G95IRHvF
	M=
X-Gm-Gg: AeBDiesZ5BL2WbSZsL5In2l02v3mkWHlhBmxU1f1Di8GKOUMGajomYwrtWziJ/gR870
	BAI5ADPxYDpkP8zYE+0JNvsolNeidy2FhBTt/WEwe1WQKd0q23CdtONEwlZ+RheJ4cZ8FE4yq4x
	87tHsqMgG+Eqhb1s97iAeH7GodtnDLNjt+NON6qp4HuHy7kKSjifqWTo2mRtTo59PbQI7PmfBzP
	HaKKNyLjg8BD6xT8zygxPAMGmAUJCPRW3J2ah3bl9TgDMw6dFqPMqKgbELQu9MlLtR2y3RpvHJ+
	Yih4xDlC/4s5SJY+IEyYIOd3K1MWfRIXY+Lr3zx29SULCO8w30tqZ7UBaGGZEr9mHZoCFB3Uwoa
	tA60ldgJCPiLa8WBx/F+B/uUpDz4Zoir9zO6WrF83bcR99MsuuVZAjErVh8gWlMwPrcvnShEwbR
	SSR7fW9QKqOKKmIwu/
X-Received: by 2002:a05:7022:fa0:b0:12a:72af:83d1 with SMTP id a92af1059eb24-12c73f6f6famr6516761c88.11.1776670390794;
        Mon, 20 Apr 2026 00:33:10 -0700 (PDT)
X-Received: by 2002:a05:7022:fa0:b0:12a:72af:83d1 with SMTP id a92af1059eb24-12c73f6f6famr6516739c88.11.1776670390198;
        Mon, 20 Apr 2026 00:33:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c422csm13714081c88.3.2026.04.20.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:33:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Mon, 20 Apr 2026 15:33:01 +0800
Message-ID: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX3c6jk7gCEC1b
 4h/I5UWk1NGOnYjGIyizR4gks00HEpgUiaWACWnPLAZ55XGco4BZ+tQZDNRgv0PAacou7cyFwNW
 gjFPWohoiYOM9TFEsBOSLcw63mQN+qvW1BE6gwgC/yR7BC8KNztwZic2eP8Q0J25kmm9LLjHWUB
 xPhPbVVQHKcBR5yV9P2pctEP4w5uHDgCu7/t/46CwJB54L0wQi2Of8QCu+u3lrWPnHzasafDq/A
 YAb3WjHcIfGg/PPAe0kwhUNs0NDzHiprh+hVC3rWWpcAE0oY4xVTmxJM+RCDOjvjWgAKQagxqnK
 RqGXL0MU32wTx9vvAzgeG3ZG/Xaaz6aMLNo8/GFa4lLgYZ3xhDv95BnHkvhPEFPHJiNTpeHCHuJ
 VaWGaia6uspGC32ZNeXTwM9/ta1VCyW3fT/9ue6mWZodwQEeRpSjG1p478v+NFFZY82oYAlov3M
 mL+XgDXW2MeDDUc0yZw==
X-Proofpoint-GUID: 4UpwmqbHFPzNlnsO1xbsa-ITOtG5owPv
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5d6e1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SOTGmrOMbzj5vsbwRJkA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 4UpwmqbHFPzNlnsO1xbsa-ITOtG5owPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200072

Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
witha fallback on qcom,inline-crypto-engine.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..9251db2b8fcd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
-- 
2.43.0

