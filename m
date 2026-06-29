Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC33A6B61
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715525; cv=none; b=NWxFWd7WuM7mMTS+t0MZ7hYQ/4gYL9vbjTrZUhPD6euMHq4+2oXUEDPRIoUrBkYTzXCLh3RfTjSXjH8IRuZ1dP6yFU4uPyK1c5fse3Bq1LAbh79SeepuERcd3IOPh5HutvE4ONcsiKesjn8QVSdXK6GWSNtP9HGcbAprU5t2bYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715525; c=relaxed/simple;
	bh=dn0QrbOG/qJL5Pj+WWw2i/sCV3opwAw6wsixL8ZNvMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZh1Nivxox2jflhCJNqkqTXw0+5b0ttBVYbjsBahbUC/R5HOaY/cGYCUnIiB48+c3PJrndsjm0eBjqmd+nyPUwSXYDby8tAMKxQ6tymxPyZN/i5ZEfF8z92t26BhylvimntW3XOhZVaf3rnMZ2rvV4XGWyrLPiiiWsbqzbI5cJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLCimOUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaHsF8vj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLCimOUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaHsF8vj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NP801745101
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=; b=WLCimOUwL2rA/sji
	/B7YjjllcgGb6v+5LZI3fYJlq3FppLz8K40aed+TwqMxR0aiIR4mk2gUqhQCNZQV
	AkBGd0AlOaRh/20o6yCk3vzfPOickXnjV84/oDED8BGgs1yxRrPCRG+jcUveU2ZU
	4RksXFM7s5kZAIw6Me35cwdBcsQwCrRg75HHRCeIQKPsybygzp+XHI+0Qq8Awyw/
	l2oFepcC9EbE7u26de1qWOCZxagu3bbwmJd1xEt3aAUkefT2E1j5VbwEfLdVocBC
	VJX4lQjSLioT+rs/Hz8ubG2+s809TAJTBxCbhudkmGVzxVM1dTtzmHTHA+n8ZVYS
	SkysjA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d4xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ed53abff8so333547eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715522; x=1783320322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=;
        b=IaHsF8vjyQ8elUCeVEb/MrCB5RBGqFfr4WB1CqrKBNnt9EkfvEZ9slCw+FpKpveMa+
         dDDYJrKD6VsxDu7hMPuzRWdbyTUr/WGGr7F2lYAlD5T+xz0HejTy7wUK8IpY543De1qV
         JVhiZHuClt4xyCymGZVgDhr1ZQsdHZt2hT4Xn8VLE8WOucZ/16xFbxR4JbSKGlPQW08U
         TV6UI8W2sN7SnTp3FMfQPz5UY8xWhan3VRXtQprE0VnJrxu0zjqriLZ/ReadQ1ALHxIh
         dg6U9xd3cByYMMZZIDzd/6d94Lg5o073780YaRyWSoCPLcP/U50FX2tN/ksblJ/gE/lH
         ZAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715522; x=1783320322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=;
        b=m8yxHWTTx1wk/aPuLQM0zJFnJJL5Wj4BvEktoaoltGbWV6INVzjAHlGATUsyJbRqEf
         E5+DlWLBx9Ls3UbtDNcbDfsvjpW//XmOtTJjfgc1LWspylTrqvoc5mc+bMaOVRmpcFuJ
         rE6UgUMNch4ZqfduJ0V0UR1jSZ2u5BnMi2jNNR8Ke6gOuzLl+2/O5HLKrgTpSg+/0wwa
         wU/0XdDxkguJQgTI7U/PRmPoPDvU8Sa64GlrYcMrTrv1hkG4KGWhgRs5TaQqTqMV97Nd
         DLE26prUKrHCVvPTVvXLpqlhXKfSMQgXB9x5TvhbV5d15wIsQCKZFued2bXNh/aVSzF5
         FPUw==
X-Forwarded-Encrypted: i=1; AHgh+RqY8Zmoc44hwnaRnzcQBUaJu1t9N35uzhMuqVzK8b3KqqWkuS4xPl/xTDSdo9nmYtRVvkRftF97+4JK@vger.kernel.org
X-Gm-Message-State: AOJu0YwrH2Q+vYI30NjjadwuebzVN+ZSlaSMd1QzWBYObd1++A0wv7dq
	6N4JTfCWsC9MiBRaOysBJu7xSfrGbFu1AJcj46DYCLwdY9+PdrPaks2b2v6Dv4WSryhb92pC+KX
	bgQNIGVUNJ90BekmV9rhkrB7mQ+yB4KVpM7oKNWAtCsCCDZkoSBPlzGjboNgv3kJ/
X-Gm-Gg: AfdE7ckpZQAdCjaKX9ULoIXwG/JJH5q+qQID1NVG3BCjh8xS9sS/tBiBC3NWnzSaJJY
	q9sdlfxtgME0bSnrHCjk0lvNjN3b/lK+2WK1vBCp3NU/YC5kFUXMOUIGiZoW6gBI1eeGsSvN9JX
	7xK49dwim3ldc45kVhfsC79cFjNsaTWHXCUJuyoLLTNPz6U1XfActXp1WezwHULIeAWQcnUl/mK
	/EnL68gLNLjKB49OQnnQkGj0iA6v1sqrf2jyIBo2axymOxsc9B+hLxcqTqEQDi82H5qG2+iGJgD
	oct1lqOOVTb0nQyG6diAeRmgx+iXzuSImpxqqOUad61sSTisXLmgMQBVOvy2buaOQY6QoUGgamc
	pAXbqH1PthQVD1jSydhSwuHhJF/RPUrtxhujn3IXdJ2q49Al8dPgr/4WKHaC6yA==
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr1650433eec.22.1782715521599;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr1650400eec.22.1782715521105;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:35 -0700
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,prng: Document Maili TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-1-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=972;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dn0QrbOG/qJL5Pj+WWw2i/sCV3opwAw6wsixL8ZNvMM=;
 b=BIK2h/4rF4ldwJ5ch+79v1P6T02xj813rGfQ5I36mSWZTK25sO8VzdvhDTOz+83jb3XwEHABZ
 h1h1nAx4JXPCVjUxGz07RJ3YYH6fZnzi13nVeo0ipay28uGnsNgaK0P
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: v23LyAzEXiV62eQajDjl75liTHzoss9J
X-Proofpoint-ORIG-GUID: v23LyAzEXiV62eQajDjl75liTHzoss9J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX82T0auJvb2po
 wsmHqY4i/aZVus6B9gMDKx9BFixQkaBz3nXST9aOSRj8v1fRRFFfZxPFgrHXgaPVbsnPD+0ypjo
 C4jddptEurQ4dHmEiv878wKgmUtAwtk=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a421482 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FNAlisUgfRrBHgIoG2YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX9qOxGN1T8fUb
 V8F4FjsVD8f2FehRLRcx5W7nVixcfShU4/qAQFAB22M2UtHEq8ntpxRcjMZrWfd2J2meSkXoArI
 xFUDCp371HtVS1sddF6s0ClCMTgX4cBwFIj5fOvK67DjFiqTUbNcX90rZVmjPolHpD9XiIhm76y
 VgXxkmUdS4jQbdmSNowXzW+Gp5LsZ0x3gahX4+8appdmV4ZEr+Ll6sABwhQAp3bk8n1tpJOz+0b
 Pu4krKtecIuwSF8HChaE+cJSDn56/ke8LVS7gY+aLlL1o1WoqxtWxY+pQuureEe28xjiBLD77TU
 OWjzykp7/wbQxuMbU0pK5fc9QxZUZeCBupSnW3by22sSBWl77pVRNBNa+qwYl09Mwh2hEWtPG83
 Tm6KoKDSFGSym033tH+NC2ATVyYDe1ovlt2EzqxwQ3GrALKzs+NJG0Yzg9qQ072CBVzJETIDD39
 hEwllxXKNolZ5wecoZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290055

Maili SoC has the True Random Number Generator (TRNG) which is compatible
with the baseline IP "qcom,trng". Hence, document the compatible as such.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..6116289ec413 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,maili-trng
               - qcom,milos-trng
               - qcom,nord-trng
               - qcom,qcs615-trng

-- 
2.34.1

