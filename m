Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D13B895E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937063; cv=none; b=B5t7zzLvSuWJpofP+UfD1C5psUUnc2Tc2R9d6wrd1DIEubYhTqc0nPO0TWGRW0HR9+CQioS2r2eMW19emY4U6t5ut10VTfNRY+hI34e/7A3cmeSZlkWz3YHuDwIbbp4fiz9oe43PdgifVtiDmVFWA8c7VqtJkkzQRfa0h2WCC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937063; c=relaxed/simple;
	bh=fUfTQ+WGGqb9ciSQbpp28uE1qLiRFaDJmt4FAE0yCHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOmSluKlfzfSypSqBESRQk9ApIvAHCfVXmgu6gvL3VQOt7to2fMCPMgoElbWzeR3hFPvV/G633wc1JVRhsQUHFMcspy8FTT/msMbreWvSV7AsGVt8gUv44fDPSpsZ8Hhch7+T6PeYbiP4uHP0XPwl40otqeocoHVSdK5WkXWq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TifYpNU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gn8Qz9kW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TifYpNU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gn8Qz9kW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmbL31712864
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 20:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=; b=TifYpNU8yhMH0nWe
	tBrcEwKQl4WmWmPsPzppe1M5omDMVDtEt4HwlaKGJ5q5DNOVp/kEIC5QtbWFu2NR
	TeG9CwOqTU45vvqWFNCHozxviaQRgL8uBTVwD2583ccZiQCurwK3d8NfZs3ANUdJ
	SXMCboVQc81nWk1JsbIfPihFogNJb7V2RvQPZGGYIKpKq+XOWaWtc6LmIyWI1oZP
	ZjKT1sWwVgASZqida9xHLs2wVJEvKYP6Am8Ns97Ncruj13doGdmK+L7W1XcrYPuU
	iNs3i1+eMrEuqSyEB4bp8Vdmt6M9eubEL7u2TEi7pjC5wZBaiNd8YcPwKX+2Tp4N
	nn4tfQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd2haj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:17:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so1617969a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937061; x=1783541861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=;
        b=gn8Qz9kWq0DFs90gf8cdEtEfHaGbaICONRbZHUYmZ4UGzt9Tm5tdEvuyhvtxElxNRv
         6MwOD3j7MOWPvu8A2bdJfEpfWOnarKJEq/cGm2dwSSWqvGsImTZAccuC684aArrcp5iL
         C1+gZ2T2CeDWG6uLHY8ATqmoDMW0r9BKSG+4liQ3/KTmY5+V5WL4hHpuzmFL1+8oGmY9
         sLxZiSFkcP8t50/stH76Cx6IZdFd0oGTq/OUtdepG9t9zpUkuQw8T0pnTvFZJ0BYdp72
         O4N5jlWt0KDNcY24kjKyi9+G8PpDsQB4OH9jygu/dQa+noqWJbfI6v7pC8M6rWivz8+A
         WbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937061; x=1783541861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=;
        b=MXmA3OHhErldDGjDygLIkPFB8FKnNVCP78wr2ByTfIpY+iNjZ6YtfPNo3MBl83A9Bs
         Jd2YzFKaKlxTgfxCJF69H56/KuFgKdF//EwtWe/j1v44jVNCOvuto+bRHMgEGYOIWWFL
         XzFurhfeVUJ6xQZzqWbFyMtHpji9hdOfWyzN0yKjTaREAuG7sWjivdh0DAkcAMLqCIvZ
         nnEojt+VSaao1BqvTu5NNMYhfgTv30gtDZYmy9NcpRIIItqZAIDoXFJkYfOHS1Skak8S
         pxZ5TYbQhXFYQmKUM2Ef9wK+8y/yVHGHACOzxwofuyiDAKvn2XsmuCXDP1nBoeSSr+dc
         qkvg==
X-Forwarded-Encrypted: i=1; AFNElJ+CIHVaupj2W6nmCRwa2QLYAmQHP62LLmlfdDFm5z6lBKi4vbIT0unX5LGYTChGO11NFLeGyKFFXKIy@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFtDw4etFolDpgBfliL9VABbEhFR2pRGgwshM3y9oXTbVhdZ0
	z+bAB/Q9oG1gTMyQUTzoeSkNcqRtY4yl1ZQAL+9jBVhAaQNQrS8h3bvTp9OGPZiglQklI0hj9M2
	Oid0WBr3nASFVoWCAAli0Ytm8X2kemG4+DGJPkANa4x5woHHcmCyFpVmKe6H9dY00
X-Gm-Gg: AfdE7cmsavKuuW3cg24NKFGN+kDQWAj1Cx5Isx1PazgEqxGdLRPIYWU3bjUy9LuzJak
	QdWa9Fbj+PpZfsqEoC3c08kFKLLZ5QePf4llDKi02RUP89ATYv4HVkyPWhMDOe4c+PCAXMmFrPB
	6HkJB1ccGhjTbGo41kDJkZgIQd6GdOsMvmVnI4E+lJVel9FQDRBbbIWLBUIrfLtq0cFWYkvsB3z
	ji+mBNETt7LjBIi7FaRFwTHEqKdoGP8bRgmgBUGMhN6R7bWLAjipOrsG56EPA8lfCbZXz31KW/6
	kB+yGvOwYVeQL4Za4ZiQJ0sBAkD3rJSIi4gVSp1DJUW+bLdE20AYvbefZ1CMC9mZPs3Mbmr33DM
	AKm3RokRRi1Cxv1EJcTZ/MahUcz8SCFJPcMm8HxoCTta6
X-Received: by 2002:a05:6a20:7490:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3bff42828a1mr2740853637.40.1782937060628;
        Wed, 01 Jul 2026 13:17:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7490:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3bff42828a1mr2740802637.40.1782937060021;
        Wed, 01 Jul 2026 13:17:40 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:39 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:12 +0530
Subject: [PATCH v2 2/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-2-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a4575e5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qMhC6LGQ_1aKn5J9HqIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: qQecBdxWQsI9_DLukIbiGUggojYtlqN_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXy15Tf9ZVKbcY
 b8CNyZUmAWvOWiiHlvkfCNBE3CniCaM2LDWLK6CXdmwzo/ItKY9qcT2TjwASg+6wwhQeC1HPO33
 t8KYq6yfSP/GZHVvIAr9cDbFvtwI1gY=
X-Proofpoint-GUID: qQecBdxWQsI9_DLukIbiGUggojYtlqN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfXwtSWIi+kbQFI
 6oS7vNqVE04Ylybvrpi8G73SIaz1tD/nSAr7MeoVZvX1m5u2z9geemHb/+g6F9ghGwlrbMjh9O7
 f45X7cUPhb9QHl+annfhTLzo27ZsexGDqPvlLQNuOBLpLUXt9tXxGaV/fhPovGyM0d0++Uv8CSY
 9qu3U0rBeCwvfuePZQL3BUirLbY9p5sXCGDDXIinJ8wpiIHNe5M4ZNeZkoX/4/OlcIuNhTlTX66
 qn/dCcYDi35TJscTH7Gz+Rp8m6HFLuANVjGi7xgFoF7q0cJhS0tf044RLySz9Iwm2qIm9mMOCPN
 Z6XrdJ0cFSXoziNSbT9YZGQ2QPlMcp/uWp0WQeA+j4gtdi3L3wToOvidxqtyE+QSNLy71cjhFGw
 TFPM9OSR2USB0GicVvb1fl2Lrpkiao1tDxLBY7d9nSXNKTu2OuD1MJFF6GRfgRXV4pZ7CJWsq6A
 BeWfETPe8ubEU0XrBIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 4f3689a24410..9e6d3af42971 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1

