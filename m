Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640237EFE1
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653864; cv=none; b=pUT0FnlwSA8eAM4bMo0zYWsmJC1NuvL3j8QfsFOsHpHxxR+mSX03z9f+NY+VB+Ctdb2DXmLl9OswT4x0CcszAMSywF4IyvpI+tVv88g8F74PRyXhvUNG/1t/Z/sBYENckAsa5AIHRG4q7KZtYcc56AJ/Hrp66U+bwgD89gFiN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653864; c=relaxed/simple;
	bh=9dOaVE48Hg/Z6lF6josr/LqHefZ+NYo+hszbsN9lkMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaRCCjaHGhGIf0czswKAQAdVo5OmyjYjlA/mMaHviVXXEzjA4XJ5wECXZTme7mSUQ6J17tO3ZsEgCDmGS1dmILv6a8JIw/e2Nes8/DyvIvVHwaCD9wroJt27q7InWbAPqi2/oiW5/u/BOiTVNehzIzLIusgMcTO/bsUM6sd1OT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bfl9yydF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ib+AMMH2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bfl9yydF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ib+AMMH2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J9mGTx1843753
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF
	5oHV/nMY=; b=Bfl9yydF/gqkmIK5iN4VBoxfLJmWF4sPg6doDjMaFM4T0Il5qC8
	XaiuiURyKrx4vZwnk6L6ZqprsLGaIWE7VnpQ84pXT4jYrvnduhTHURgKP8vruZpC
	uNiE+ggKdmFikebv0ybjGPpHpSvvXKmKRLLuhVRguQK9ZS5Ld3FAWt0pk9buqV+E
	pLgOc99mLElWVdvnmYywhmVWVG+oJxIsuE3D6niyyvuyeOrMKqWyojK0X22s3NlP
	TmYId+ISTd8q438U1FWZz2jDl73jxqYow+E1P3JtGWc2lulo9UIjcsS4q0XHGU9l
	0Y2nbBiEOSyUo/BAHeOgwyEUNFm2K3RDRVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388kpbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:57:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249541063so22167245ad.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776653861; x=1777258661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF5oHV/nMY=;
        b=ib+AMMH2xj4YZCYiJz5jgCt4Sfez9rH/Z4ZvIX2o1ObgJXp8Gj/bYVycvyu5rotvTK
         h3Bg1ZW6AvmBWmNLh4KrMd9UEFPcvFtYBDzUEAjFiYHPkC7ydPYUJC1g2CLK52+ULkF2
         4ojyASMImiRzGZAsEmixYi4dlGbgtvDz+9QcxYMyW7LlpzUWhnomDyYGiW7X1mYYwT3m
         g0Da6ZIusXoKRfPo5t1vt2rxgpeUxgnogseEQPDTmsk6kW63yT4PX5eKec4BMfplVwT+
         KPpe4Us+Kp1eXyX2tAEMYMM/1WwijxYm3xv5eBpMLirQwA0rguSs+7b4WOWmcOEAfz0d
         4Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653861; x=1777258661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVmKcB2K7HMO18UqcPnricoqZOY6WNlZ+jF5oHV/nMY=;
        b=e7GIyf7quu+O3mCg1V035p5CYF9GIT/L8tPXZpPoX5Rp7No+ZZ3QWxNCZldPFYy4oW
         HF8WCONKawyGz1u46zo87y19mfK4HZVy2XbV38GsdPWVcaunaG82e6fct7hpLhA9Th/I
         JEJVzGiOancswfp6C262FDWCqOa8rKI7Ql8DmjZBglDFSaYefcg/o4VXyyDQYWH364VJ
         tlUnqPh6HfVaX5SV92m9ocNYl/FuUmzgRPB6hzlQ9qPlNgAiKsFXJZQNO5ToyrxjONql
         pSw0i7HCNmJ17Jwq1HPsAJdRz8yp6zXHodD8k9GI1+Q+1eBywhnhLAPH3WZfuO7l3BA5
         13cA==
X-Forwarded-Encrypted: i=1; AFNElJ+ULBe/4z5/N42t7Nw9AVsBw1PZwwI762S0RVHPe6BWqoxvi0xrpC3iDXp/7KNGMQP+jqc+T2O1Pkgw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmhh1znJa5mS0kJfPGI0dfyYIRyyPTCnC4I0h86DOGLciTukOW
	ArKC6wLKscoURi8ggWHF9jbn7ZWlKjVl+QAHqBBnKfXAulVRNgzVR/gEPaXw9Exe9ctvNqXcZaM
	kaf3+JOODo6YyEG9GjBejSPew5R9qiTmWC5tBOmD2wBknkjbkOiVb0M5sKBGE9GPM
X-Gm-Gg: AeBDietnSZYhiqLflQnRSczv+ydlsmOSZXNgjdjCiS8b/VClnhObzjZ3sGRUf5ODP53
	XW3IeUd5vjhGDmPAvdlFO4oi6X+veO+LCMqHZsXcS5cvuFBoD6wOstqavC74FBg8vs7c8974cKV
	FY6Yq618jrtKR2E7Z9viWEUx7GC19UhLWN2ecXQ3YLAkGeVUK2ENX59debu0lrwiebNzuNtVobZ
	msMY9fdfYmhHVlIZRMj9x6noZIaNYgrmQ2JO13SB/r4ehe1oMxPhrNfcBEOmScUvfhauQse6Suo
	rhUGvNRlg0XEKmEJ8xq4jdx07uDZtQt5aTszQFDjPfNrIDYZlTUKaW4tOzjlp61jWXErtqxEK2Q
	OrBGs9YuNCUhwUp5xoc6aKrI+QmcngXQL4ypvU0sw4FTFQqRmaDE0HtYyqTb8hPJM
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr127496625ad.27.1776653861513;
        Sun, 19 Apr 2026 19:57:41 -0700 (PDT)
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr127496315ad.27.1776653861049;
        Sun, 19 Apr 2026 19:57:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm80865365ad.29.2026.04.19.19.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:57:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Date: Mon, 20 Apr 2026 10:57:32 +0800
Message-ID: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e59626 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TDQlr1YfmYFMKhKHBNIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rhp8drnf7CW4vE4RXBWxePa2VRig5fbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNSBTYWx0ZWRfX11PfExhU0c4W
 SOVmVw1Zh+pCgncYD2kK1mILZKuvDTLLypxbRSHKJrU1xW16RDpMvNOvJ3bu07td10FMDqZUJez
 xLZbERieAG/T3vfM1eUovB4X6d0El3R+VKFiKcsWqxjt3a7a6IYK/+IC0pY+IrGH4J+9ZsBxJvT
 rBnekhh1yZlmeQ/7SlSYww7SEyr+Yo2GWTnFjhl7ToUDd1Kt3HaNAf1a/B91l5Tt2AqoT2teLrL
 oZ2gYVBlpZrteZQvL6q0Bum58lCIYQI7a8zzhWTlSca+/IB81vr3yyUz9X+im4xLlcfZ8smKD4L
 Zd1PCvlOCNgpW3HUqdXggGMZPCacOI4IerTnTEMas0mayCxbCgyBoTPD+evgRkvELHPO/BgkTjy
 n2ouzqd4zrKG5yP6VtCtVKuM8Jsgx3RZwX/zyAGUjDi60GsHp7IdgscWoCTOZwdRVLX8sYNc35l
 cQ04iOV9w4aHar+Y7iA==
X-Proofpoint-ORIG-GUID: rhp8drnf7CW4vE4RXBWxePa2VRig5fbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200025

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for True Random Number Generator of Nord SoC with
a fallback on qcom,trng.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..1362a8b748a7 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
               - qcom,milos-trng
+              - qcom,nord-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
-- 
2.43.0

