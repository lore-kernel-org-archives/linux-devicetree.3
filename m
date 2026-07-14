Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1A363096
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023556; cv=none; b=jU3VTlNYV5GAHd96WXolD7+9Xn6W8d9mjS69IDMmQ2Qd/bE69B4kq2QkDcufe/jG3CC7aTXGz+/44yWbdH2vj+kuyM83jkITYRbnqLPOPyIx46Rfg2rDQBCK+QlY+ciBRA2f2sGLHu3YDGU6Y0U6FNL4tWkejdDyz9Ngivhd8Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023556; c=relaxed/simple;
	bh=eaLOALOt3CvzVzqyBJIw46fZOpNHjs/TGcOVYyRBjWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVVhzFagg9JEp6+gixulTdUWZ1p4zQY893M3UZIFcom/r/HJ1xgsxyTcm79fMwfwIwDjvMOZQSVqWfjHq6T8LFAEHBj3T3EjYtbd1lvPFzNNCpdlrn9J/2fRcPwruoALggOPUSen0qFqwmGaYE2+hE35GvzSBsd/4jrS+m2fSvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k13I5Q1g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqvyvyQ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k13I5Q1g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqvyvyQ3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E77DB73931675
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2db7vq0piVVlS+4APeSpwvKH2xENTUkfi168JwODX5Q=; b=k13I5Q1g1Ih60WsZ
	t9cYVlXw/I+Oga6DX5GMnoPGGBp0aMkZdusKzUBjLohNEbJvdAKeoOYpuxAsrEFR
	ytzX7uCwziARrJRUD7RfoDwOpegfL8plvRMdfw/4cadVL2QFfV98O1XPZ2WgJlXt
	YO892B+2F4Cp4RedmAkIC0mu77whOdx/BixhL1x7PdLFfQAF/0eI4UdnZDNQSXMZ
	7Wq9LJnodz0gxN1ppURmnzOnwJG2Ndyz+UOBEjWCkZ3VMK+qD08xamRkc9j4e5un
	6n3wuKn7A1BexXgIu4NfC/vUgW1oiGCXeeDhyhvHpMvgTuIxQ0QEF1bDpIbsC6fc
	1hB4Cw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq0p0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so660609a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023552; x=1784628352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2db7vq0piVVlS+4APeSpwvKH2xENTUkfi168JwODX5Q=;
        b=HqvyvyQ3YeCw8B+SRFLbhayWwUnD095MGdtazm/Y3TpNHm9s/bq0XGbMqRdObdJuw7
         u1MXqUYJvW4PkjnmpKxF0QBCS09YmqcYsdFwmPHhzBmsqT99jxkiLqwah/1BfhnP1LEZ
         kOmWZauK2YgwGgAH1HzvK4ER91aB5CeI9X6gQdyzJEowEj83AeJtORvebEDbpmzAaMcT
         e+DecLC00Cstz75mFiHQpFgIST1gUucnbpDCIYrDoLdEhUIvE6hLXPFIjLSyZSLwJNSc
         TeuhrcLYUGZvuKZplyV1t5IKDopxEULRa2bLmBkdQT7NIAST8LXEUH1lWUJIT7BDrXFS
         GSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023552; x=1784628352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2db7vq0piVVlS+4APeSpwvKH2xENTUkfi168JwODX5Q=;
        b=LWu878qhTto70yydWQ8CKXdKEFLiYzEYuoChMoQTGpdhKQ3T+vDoO7/khzsHSk0sex
         UaKcQnNokmt18W6JOBczHdfJUzfXbbLN5O42GE9GAgFrimm4vTcBubzmEdFy3IBWYk//
         vhTGByXCZ0vHUOmgj7Gah6F///b7CpvMEG1GkM0Boyjhe6x4ICTyy3w86BqfDVMC6tRG
         5iVvNQUikHvmBaWwxw4Z6BIOul7dDE+hQgVlofaSse03MNTHDgkBt8Gnl2ILY6fnETqS
         taRbTE2uH1BWtMEz2Q7xAH4lr7rut6ri1SzlDJ/8iNeQ3h8KDn5jZMnmXsRIRsOgYyoJ
         R30A==
X-Forwarded-Encrypted: i=1; AHgh+RonG9eqXhtMZBe3n41pEHZMGbWbTPF1X2TpM78uBIZUMH4S4+UXsv26y6YYz5jn9eHtrxEjZfN5kHgi@vger.kernel.org
X-Gm-Message-State: AOJu0YzG8i5tG7wCIfNMRQYx6Kh49HUVctIW8R8i/ru1M5MhCKcTC7g8
	TNmlKuoR20tM89GjCo1j4Z+9BYihJIAfPhSFS8+67JAWeq/oeVirHaJWnEnSTsj4dFbQSyxTcQC
	YM9z9pNIxgEEzppNzGO3qPZqvNGJpxjK2cK4Vw2NQgIRJTW3pGn6WNtyugCFFfipU
X-Gm-Gg: AfdE7cm1MGJHDizrwt7OlQUjyRVK97XxhjyUExx+kHjjbTG+a0e05UW3EGX0H/WzjY4
	2kYG38bWwNNqCd9bqJ//LlE7r5Eai9sRcvsKTrMgIKDvv1ImKxQxj+z9udUHFBYNkCaYsuYAbtj
	8D76ZgFCe7d8l62COuaYcQhMMHJMEinlkpir1laxPWKTGAzLauNQ7tM4IEP1fi4PP7lkrqPzznJ
	6LO8vwT6qY73IZ96G8hRezZGaMw3f1EMNa00MoAmZasRRWKCC0ViSKNUV+ZV2KF+4MB3dSKqpNU
	W0+2KMuYNMbJkVvMWI5Mbho8wCA3J5WEUo/k7osdT8KGG833bH1hkbgKO4RzUgQ4nCI5RwSZtY4
	REEx8cD5d0Kq4kwUV1DfwpepS2O2QZoELQA3XI/Qjmjn3
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr156261105ad.24.1784023552465;
        Tue, 14 Jul 2026 03:05:52 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr156260655ad.24.1784023552026;
        Tue, 14 Jul 2026 03:05:52 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:05:51 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:13 +0530
Subject: [PATCH v4 2/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-2-06a4ea97c209@oss.qualcomm.com>
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
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX9Jp4yGs65dAm
 +rwEbqKXzfCoc+udIs5gsLjiKLeTJB0T61tRT4YIJia+kWjgJ5wOQF8pWP4I9lXMQFlhwXFEkfL
 kMA3U7kMIFpxvktVxcZONjMhAjfPGnTfZ2P+hC8RalzmjfS/JNv9Pwos5GEPtlNYM0RihXdgQaG
 Rd8kdidfcZdf7f0gQAFhycsMo8tXFu0ZBIPzeEW2pHArQUDcTLjEws67by11pRSAUXDJeCwTKgX
 aDxMJ3BYUrhWlXuFMoxOmhbsBAF/KslXHPHAWcrGGA9YdxW5VspyWLbVgDo+lTkHcHqaytb+Owb
 i7JBRtR2VgeJ54wZXHD7lbauxcVgnkaScJs1oV5Ocb7Fwaz/VUeOpeS+SPI8TMfdvZkPBHVTaOh
 qv+L9qYhknWwdquaSDbZeiUYLfl7x4tZshbrtS9y93FahrTjEVvgtpYexZNrhijLoE1z6CfRLii
 JU6ZZmpirJW2OdSJRKA==
X-Proofpoint-GUID: XjdVK8-EQ1UABXfc3fnaVHGYrnRkQzCA
X-Proofpoint-ORIG-GUID: XjdVK8-EQ1UABXfc3fnaVHGYrnRkQzCA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX/YR9SelbigVx
 VW9drkmP7t5yaovCmkll4VyMZa47+DL3a3CWZgVbZBfAqrKqUgw9brHRSEQbKX4/NABhw0Qhpgf
 cvX2YfXHodzx7mwTPdBDFdcfKV0cYbQ=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a560a01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hDoUnBfku3VNtUQ37LIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140105

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index cce21aae6499..ed2dd99eb1b1 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1

