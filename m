Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC83E5577
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369505; cv=none; b=aKXC7XZgv5c3Q9tmgbwOA8xBE67acFaOSSh1glOlPluGFzRwEY1rGF/ttXzV0mnwEoAfvNiDR4GD2rvVai6LEFfFyCZKCnsCXs+5WS56hItFRGBl7oT1GO/Xw/0h6bub5zyvM9q5aCbxXxDxOzhhLptBH6Yhrd3WMTM0XjiYsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369505; c=relaxed/simple;
	bh=NTwlaax/lh6AG78S/JgsCIhqbIXpaLk3tcWX2JG/xaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP0IE02HlBrs2Ki/hl/xSKARlBcNOkQy2poeBIvtRyAdDvMbOf2+E3Ak0tIr+QWoc/82tigib3MTprwGaw+udOLRPa1hFgUO6MMhc6iB4W9L1InSxK4upOVUpn7VCV2HMJHCDsH/Aida32fAJ3aUT9SQL9nAeYv00yil2aUJlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzlVVREp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh1hvIfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzlVVREp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh1hvIfz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXrXP818826
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=; b=YzlVVREpIkFlU72G
	eaaDHr8OlGNN9XqSQxBleR+N//2LDh2Ce4STJzEVdNEI4KYKnaWha2PdXQHZr37f
	LlL7PpEIaiC2Pot5ICYHIER4/PSHJL/R5zYqeb/SstmJ5iO5CLpgwth8tKxWBnkG
	mLEHazhEoqi0daBpuXpb59Vbk4jBZa8fisESsSrcn/Ht9d/uWdTHruXlWXTe8Leq
	X9/iwt7RoN6Pke0itZSXpcKINtortlnkRMGwi5PDcgREuTYQugIvQOXRgBlWx6ir
	3xADQ4ghm5rcoJcLle3uSjnKq7L5teRKV0apHO9UO0W+Jk9oZ42b1uu7F5kOXZ9e
	SidbSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkgjqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so3098618b3a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369503; x=1779974303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=;
        b=Bh1hvIfzV0GAsi5DZwlI/3eLUx53+v4T7Mnjj5bO6EKjHSbCFLWpvnr0mAVrBOpkQ/
         FRtVcx0kgHp4t66n2XzWbMUH/dmkyktWzW11zsx2jbsOkcABa9lcjwZ7BM9PS4aZhlQ/
         h7CHCLDpe/HQkTdbvLz9OzM8O5IuGAZk2ZKGG7SLsEWuFbC6AM3LakUPfwG2Lp1GRN6d
         1BJ+5ubOtM9EXIDzbhwg7SWMpg4lJXyPJIA8+mQ5ooAMYOslj9TbVEydkts3kGgCewRR
         AaVQxEOV87LIuCH1ejuM6YwpWxFhH0hDOdeCvuauAl0WMZkVxc5X+m2dzMVxOPhw0qeH
         LIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369503; x=1779974303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMQJhPfnLBvDiSVCVF4l3ibrl3mzFihtcnE5yfd3vx8=;
        b=oXrruThR5FHw/2O1+8N6LglhHc1pTHzpFDF/EsNg7bDdkJLcphMayeJYYvc6UANq1n
         G2yBtxyG1eayjqP6XM9mruq06ET4w7LOLihXOzJEF7+RiRlJRU5/5l+OHhMiIBxHCF/n
         PQLlk5/oFdw1McgXoHSl89I76eOXBmbl8Nbv8mbNbQejfXewwZWx/YAhb3vgYUdpblCi
         5fCSgvtaB4IojNbqmT2XcXN7WJL1XGNXVAAdmCUpOn94eOQ22sQ2T+X3QnXentKfGtJJ
         ytc6HzmKlZYKA5CL4xNw1BQQHBF/hK2u4jF0ouI5bNWPwH7eVYi/RnhDKWWdVYR0Zq2a
         aXsA==
X-Forwarded-Encrypted: i=1; AFNElJ9eRe1dDBe1jxY6VrUTZAfsOF287uER23pewiRSdnD+0g1ifyyh6cjg1EY4jyBoZrdTgiCpAqiGjWGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz82Y+QkSdDfIPNrfoBir2SH041BRQKL0YplGdRGSCaWR772dg
	z6NGwGxJ8KM4tZQLbHQAanbBBL2UvJ+vkz5RDieqE0yb7dSEbST2rp5zc+5K27NDCdwb3M4FNlb
	z9vE6NUCRl9O0yU9YiwzzDtAGDHT0crMNwDOzwgVtWtWjbtJ8nZiRteCJJunlJ08W
X-Gm-Gg: Acq92OE+YQmftI358U3srls4ItQK+XXTwBZhjJYHV6yZYnqh3LQoxqgmVOIe/xL5mHw
	n/BDpefdldijROcFdKh+U9sz3GpHTqjf5tP5KjXBk0lO6t6oEfVqaHhA2TaBFZTY2g2GcEGCLi+
	lsz8byEkoFR36cF4xJOJE04oPdpTG078E9FNfIwAp+oEADQ0GHr3Tws3WR9wphH47L6hVuntyS7
	h/ajytI1ZLO8w05dInlr4CgtN+KOoYaBxIXEjq7Nj7SGX9KxV6YCQnRcwGeEXKqjLMttHMnuRwy
	7wuvEsaTPr1CLvqGEfOqcfY6oNJhLtG4HIXm4SulEPnHCDbJ+X67slJuvS+ZhObuYu4WODMtcWg
	12HiUlvya29CFi/jkcXNZK4BerJ9Ac9oM9x5ftuckFQ+kPjV3Iy/7RDA=
X-Received: by 2002:a05:6a00:3394:b0:839:dd77:3505 with SMTP id d2e1a72fcca58-8414ad0bcd3mr3150663b3a.22.1779369502786;
        Thu, 21 May 2026 06:18:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3394:b0:839:dd77:3505 with SMTP id d2e1a72fcca58-8414ad0bcd3mr3150613b3a.22.1779369502244;
        Thu, 21 May 2026 06:18:22 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:21 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:10 +0530
Subject: [PATCH 3/5] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-3-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMyBTYWx0ZWRfX02H1fnUeClg4
 BwA2mxzNb5y87M4+6jKxp8aA/zZx1Mo4049OAOp0r2CK5hnYWtjQoawL7bf1q/2/MZUVlUFbZML
 dBChk4EbfwT9b60aXKCCoS9uZAfbbGULU7KZcvynIIBFohutLYoKxQFAFcjIdglTZPsTl8jqdx/
 Qo/Rgz2Blhsq7LVhUCY/K92HZCGD9cmLRB/1K9JqF7HUGCDDjNGwgr1/B6qqjvUBuC9mB8v3Tb+
 l0Xs+T2pATuJQaF1l7bB98k/t8fiyjzLJ9L5Nz860tRvj8S34GT8OUJnF/X0u+McdmdJs5kqCl5
 oyyPNu2GJPgpefUP3GSm12iSjkB5T19RcnJbbXWJwdqu8OzRaGJjGJXyJgn2d+k89EQCzIcMZBE
 NF9TuZwke7FxgJ5/9sCbooPhbbrlfnFBQVnbaLu1Vuy81xtr3MFGoL3sEfNSS/eGhSRsksmaVuI
 UbokV3WCa+Y1xRUdyrA==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f061f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mnL63iHeaYg7R5sIRJMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: NFJ0sRGnyDrfT6eazKcqXA0plritL5x1
X-Proofpoint-ORIG-GUID: NFJ0sRGnyDrfT6eazKcqXA0plritL5x1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210133

Document the crypto engine on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22b..5a653757ee75 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
+              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce

-- 
2.34.1

