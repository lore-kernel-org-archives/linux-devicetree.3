Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6E37B018
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177409; cv=none; b=ECRXvSc7EJl887/H3vMwaX/HWfespuKZ8jc1yj8X0pRoBt6EZPivSP3QEQZOnZ5Ik9LVJKhtTbViFyGX/y8nxVq26AiFA0rmtBIcX9yS/WHfuU6dtA8JHS1GJLe5SdEkFA1mU11nBeBxN+TyUUouswsmC0vOL1vH0gEzHx4/Bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177409; c=relaxed/simple;
	bh=DFBGBI+Fb4TWrbyw8ZhZzKweTDZK+wYo6QnsOwCN+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQFrCt81l7YnWEh1NTJRD9UPsaoVJP2mAsjRcCJvUgk7F/togjsOWxMbUTSITuODGt5wfTaBQhlWP7njFZUJQlQ/I3XghqJKBZggUFi+CCagQKtD30jnAI3olgaR3+5EInTH08naPwFoQ+t+ok/ttuq3QJ8YeQibFmkYmAKBgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDW/fS+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFG1qcpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDW/fS+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFG1qcpS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBMI263553
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VwDoNWR3cgc
	GYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=; b=KDW/fS+C5icZv8KjpUzm/iddFJQ
	VHXCmCrIXb2+5myqa/5XfktpZoaAtWKEiIbPq1Bdm0nTg9X3IZNL+uxMR0U0HX/U
	SWckIWBn6P+iEz6sLAe3XcueGqjRRBAX0/pV1qTCuiLsocAzX11m3v37yLucE3gD
	kjsxtFAyFCe6bJ6FmYcdvEWuT8FHSBMPcY4nz5F4RQyC5iJPWHo0EtczrEJItII/
	iHLsa4EjHqLeHMWO5IMm7EXTj2pGvwlmcBXq+d24reEibbwDH7NQINfHm6bI+UP5
	pmlc8oMGDB9Aj7dLkPx0qhUj2SxfFAtzYusR1/DdJGSzrlJJy6qEeQ34QRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu52a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84233efcaadso5317084b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177408; x=1781782208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=dFG1qcpS2cEjoCqwMn9uTxRkc2plmV88JCeQaV27/Ek32UARQnq0w/zPTRexbJ8VNe
         NZy52SUrG/nK664SY+avM64cuy+Kvn53Erte5OlYqY8wbYlw6PkVGWUqKv9XeURoc2VL
         JQJrf0zb9itWmBWC2F8JkE7QE58/xwAh9a+O3l6beyd65f0cJojmf4YM7m8+dVB8OURx
         cd1nV499qhkwq6GYXRJUn6zOQX3Uu5YHQHiCvvIRNHKAA7rwZbq+YcAjpK+NXEZe96ZH
         Y96PKTJPCiixfZH6f8jERemEsI6l2LzaiNkVwTp0EKsG/CFEdz5vObpiRbBe5zp7R82Y
         W+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177408; x=1781782208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=AW4kWRiD/AgXZfXLKznGvkx0EYdKuuevqrFANqv5BfNhxYEs1sA+fZqtHUoyuXfjnj
         kZRFdTwTkkpYdTWI0p0O2PwivIfIZhtipHgG1kjNhpqnn+zQzxH73K6FSmzQZ71Rk2Y2
         zXriW7LDTXXUuhJDjfMTgNqlMSUSPKQIMKDLRaeXV25suIn/AaS2/SPoWsaxbvHtvXhI
         ZTohePIjudT1EUY/DTAYan87RbKidam80WXK4vM5gthZjiyaRjfuFwFTUMjqSujpVuzt
         X2S92iA/TQRd1zFL1SHwuRUdPdBSBhkcwpLQnQXJx8/kOUaUppYW0cFxenJdPmWz8Q+D
         Jm1w==
X-Forwarded-Encrypted: i=1; AFNElJ9HAopS/D9ZKC1r+CZ32/A4jr6NUNpESACuv6tbyuTasopHXOCzV7pVVykK8xyuT87T86FmuyxolzRG@vger.kernel.org
X-Gm-Message-State: AOJu0YyixUthc4cwlerS26e5+8eA76Aoui4wNeJeUW/FdgyvimY7rOHW
	NG4lkAVO7vvhaEu0GOb1bGPtbDs9PncaAFPse4iLxbz3/y98MRbcduqmKXsA9VrY07pHG9CosQy
	x6MdWyL//mDWsAm5nNE2GcUXd/m1LRawoNr0PSbeh4ISh+wvl3RAGVxKVSlErZOvT
X-Gm-Gg: Acq92OG8ueY9j/Lx2c0/2E3s6quqq4UfS0lQuppm5l9aThfUUtNqTYXK4qmA7VKW+6a
	p0czBctdI6Da5/hzG33XPTvteo2YqQFkvIsW3Y1ettyk4iSsAQUTUT/MsU0BckjGlacubSH5DLR
	bBv7YN5/k9UFETDPtBpQ8t0t677mRdgFpAg6DLiX2ZJuLJVAEYUWLLGPpzj9RsMwCG1ykEup9Mb
	m8RL+gPKS/4bTf9HWhwVRDASyCWZSf5f98z/3xgugq/pJRxixklwIDMZS4zLS4rAUydb+uEB9J/
	+ie+RrIQ/cD+oVL/tqwuvc2pD+aA7RFA5HU54mVOFEJlKIqigmMx+9x1wVc0y40FmLLqm+YJBZ7
	mVV4IXOkhdKOMlnG8aRtvY/g5Zm1JE35xhO4C8fTxVQ61R9wIM3sNuZNXnmWv
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2718006b3a.33.1781177407356;
        Thu, 11 Jun 2026 04:30:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2717963b3a.33.1781177406887;
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
Date: Thu, 11 Jun 2026 16:59:45 +0530
Message-Id: <20260611112946.954172-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9c40 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IO9S6bmGf6N6HOI-BKEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX3u+zMhv46WL7
 tHW5jhsodX7Hc/eE9xj35CyV7uJ0u6c9lSIbHUucP+xaGvDjs6zwJRfYtX3qb4m+omfyuaiXbhT
 sTlCoHJg1F1fH1S8MXF2DP3hrnLJZzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX6e0J0Yh/EGJw
 xxC11nkBvOL1Rh/zl6hHEqIqJkBxet+T9SmbUSUaXSDckDraCyh0RcyWC5JlOCzUqJ3ov29Hr4L
 Hvakk2hZqKM4lDPymhwYt0HQk2hebELnhIhjpLHA7u+bhu+xwADKK3xNaDpVGenVyOUuFuJ1+ej
 ShqkA9z+lkEpj6IzVtqNuqrV25fymkheL3p0sPSqfCoPTOYnkHbhyjnS+27pXgiC3YaL3iJZVP3
 1DHfDpuSN6Zz9yFePkL10E7YO8Iz4lePcW9rIhDnhcjr6scli7rMVFh0n5f8447oMu+CTuoy3V5
 uy1Z4DzpPazGgbbj9XHV5q/RhON7rWg+xuP0XJkvZ62Qfc8HLLS42QIhKqi4n97NQ2znzoiHaB3
 O5uXe0rLgpJwTqtbAbM4sBmGP1S1jpxwr2/4NVD5fFV+pO/F0ZIhP9izBy+QYVAk4iZLEE3mSwW
 MUFq58mkEQ/81ymeTxw==
X-Proofpoint-GUID: mfN9lGEhtq1BVS4BWiwr8l4DHNZS82VJ
X-Proofpoint-ORIG-GUID: mfN9lGEhtq1BVS4BWiwr8l4DHNZS82VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b..c5c7284bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -45,6 +45,9 @@ properties:
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
-- 
2.34.1
