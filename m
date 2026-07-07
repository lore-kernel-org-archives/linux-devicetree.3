Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3940D584
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427981; cv=none; b=ImE3WG4jTgHQgULG2dl1U7htQGjJO51mZQb+HKyCNtFS5cUsam6eAYM48/iBX3qGCFVrZO9OHQZxrSqc/veUxO6TDUUAvUjOdFpKpQ9j9SXkhyM8ueSPDrRn0ty72SkNBoALCHG4bvIFb1L9EsKmXpqT/nYzWIq17aqINNn2tLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427981; c=relaxed/simple;
	bh=eHDpd6vgtbA0sxM6kFLyR6Zm++9MayE3SXUYYVCO4NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EXg7/w3HgXaspwCUoH6oe6fSzsm4GscoXlyHjM8UIzd7Ck1QdNPF+priDQ+JVMxcNpEWFuBNcjtYFI4UB6fqtFnM2kkNblPwzO8tPUSoOgxmCrNqpw0PzK/GzhrpXE2As3860Do5eUlla9N9VULbNKUiuPkHsT7iycDSmbMFkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJpP01Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzDM2c8A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJpP01Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzDM2c8A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8hjK3616665
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=; b=HJpP01DbxV3KMaPa
	o87Z0eKtFLx1mowpDDoWDEvfi+E9/0mLUC/jbcJspPUrcZ3QuMjejwWJXfQgpnVS
	/CW38GHQFSMtOPFa15nBf6AnLxy/NBSupUk+mYbKOoZsChm29yaaomlwPMDK/zN0
	DuHAiFG93OVCKnhNCrqnwe7XPGR/OJ+L7FClOARgSZWy2noCi2/WJDBNhjXOyhi/
	NitYMO0ECX0gHIV1jj3xXoyDpuvEUUfbiPyaRSfS6ZPa+SdWvCjY4MlSKizdGhpU
	3RG6c0dgdaFjmRpRIuKjqNrVkXhlSLk9BnlOmf2oTJdNdadvjwu+z3o5kiHgkFoR
	v31dbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun18vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:39:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0867a75ecso84640086d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427979; x=1784032779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=;
        b=ZzDM2c8AOGyzRZ7rFtVCtZMFtz1fLKPXxkL0O+vNSzdTr9BdGNjuyP11B4Cwltqae6
         mybJqa8CAAH3XPEDo+xpleCAV6pSH4oMl0HAgdw75XETW+zxaY9IOlitxwKRpSxdo+0m
         nqCjZfgbur894Cals5q/3+sLBMUrg6BwasCRKy0Mvwc09i1AVX0igiG5MvAQbSWUv7l/
         OQd+SFnb0TCk0no+BmhqO3aLRDcxLMs8xzwzeQUuCy3dbNLVZp18UIlFO4Oshix6S9ok
         9isfC2sqEhuAoSTFNjou3Cjd3QhQSnHPmCgwdmruI7mudTMaB8mP9R+0OAPgrOKsJXg5
         Oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427979; x=1784032779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=;
        b=SV3Et20WPs5982wkBxLRXM/pPtkz/6IpgCL8QDn7he2J8lqu9F4LoykkpoM4UQeQ/i
         DJecSYulbP/6psGEtznN7phtq43k72Uv6Zlk9tIz6DWe9tm3vsSajLRADPk/Cm5cV5xh
         I65sNAMpCSCllYqjomO7KZClbqaTVRRPo7hbxiZp5+Tbs1nyrffTa3RCTyIevAuCzWVr
         DormsYEVXJmcZBjMfjRRj/474YVmJ3ZbQBvfTdEymZp5nTfYIR02gwcPwUgl99HRyzJT
         YHobnF6uI839ezAveA1XXXis5uUAjnPXhIveP/EXnBda7PtmmlT5LfymaPpycU6+Vofb
         pLYg==
X-Forwarded-Encrypted: i=1; AHgh+RqwVP8PQPjOwEmPYr+W7S0N3DeeFZKflSxrbStwZK8+DINJFi8ZZ39x7d7oHm6XK2mzxV8f4Yh1hQU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwzW7BmpBxT1Wzc8d/CXOR6WYUaqqJlspB7IW/q7+JdTvyqeDCc
	1iYf1mypNWWH7u9ewQfWLD/8Ixfnmq3rbLOgmEEs5nI4SuOrUDselo5PTzYispUjaBDWw5WSzi2
	boF1K/m9fFlnNBW2Hv6gsSgdBJBKAtdXtFhKsOpaOdlq1JsXOX4KQKuCWO1+djGWt
X-Gm-Gg: AfdE7cn2Mwkh+wCFIuCPbzt4fGOuEq8Dln+ZrNUeLgeY1d/FC0Z+USkyaLJ3/wfrWei
	X3mVWDQctoM65vnhuNScBeDK51jfnluETdV+Mhnz60m4WFPjdvT4vzBpK5gsqHKuJ7bvwK62h0H
	x/LBlk64VhzTwi8PZBJkaohqWxGHzMUlABOqTwVdh2GzDU+faNuzvl4OjorgXTvTlFyAjTKUTST
	cW3QTa8C+3L+D6fbrC5pqY1iQ/yCUoJgt8n0h7kDz6AROd90tibi9lr6Ax3qTh+m5/geVasqtif
	hHZIrYe/TUcXcF1ugWu/Yk1ijRG8tzZlcX3TinGLZZf5rDI45+kwQKeRr/56tOj1kNY4aJMeeP+
	grmQJQhOF3hRJ2QgGLm3LfLOaLBSUWgJfBOjOojYYTQN8mE3y4iG+98EjITZdFMVpdxiGq9s=
X-Received: by 2002:a05:6214:5f02:b0:8f3:9586:c179 with SMTP id 6a1803df08f44-8fcb375d1f9mr56762806d6.17.1783427978163;
        Tue, 07 Jul 2026 05:39:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5f02:b0:8f3:9586:c179 with SMTP id 6a1803df08f44-8fcb375d1f9mr56762376d6.17.1783427977708;
        Tue, 07 Jul 2026 05:39:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue,  7 Jul 2026 20:39:01 +0800
Message-ID: <20260707123902.3868016-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX/Co+3T0YI8RJ
 YmnxxLMSDuqtJVRlWwQbSqI7kChvPJhkHrsglF2SUmMD/4QtKgA9ahPemKrwGJKp2yhyY2LQL0q
 1HzALjeZgEj2wa7egNQA+C33eSmREps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX4n7yiMXASRHs
 LPiZUfp+he0kMlV4rwqcf6YWw0wvm2KJgqyJ2f0c5q30Sddb/ZieQ2gwPgMtDJhT15Txn5jyTFh
 dZNLceKwCJagjOs6u/l6gzUMKI0z6OSX52h2DydfFyG8kxnXz4iKeHWfBnPuT3aqarpZNj3XeAE
 KgJmoj6V1wZa9f4/zeLrrGzs1Z9hyfDYw7B5cvlyqPsD3XCNgHUzUbuPsQyfc9YD/VB3lI97suC
 vPgJX7wNk9ohtN0OjGrPl5S2KT23zz71dp9PmRNsJ1AxQVsLq94ERQ17b2Zpy3nIbg3FfPhlIk2
 sfcmmd6Yvmw9FdfHYUuzJxOZBhv2h9hQh7NN1LLB7DRqj4yLignjYwiw+n/4RiP2Z9yfLRFaP7v
 ARK0RGenGezsUDV9LGjyb79iRIvfKeYV9acA1pU9+T7YDRLWVBnDBJVarDiFMnGhUlu912l0a4Q
 tv+drekAx3k6unKsKwQ==
X-Proofpoint-GUID: xCkvkhB8U1hFGPsapIYdCO38Db7m1ROe
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cf38b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: xCkvkhB8U1hFGPsapIYdCO38Db7m1ROe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible. The SA8797P model compatible is added for
distinction from IQ10 model (Nord IoT variant) which will be supported
later.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..7f137b7a478c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -389,6 +389,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

