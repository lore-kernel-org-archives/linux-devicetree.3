Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9E483BD3
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782647; cv=none; b=WsDctkf8OrgmQMaSHfLKbtosR00v3WXLD/y17RjFTSd4ER8OdZNsmWnegLGm1u4YojCFqs2nNDh6A1GYuse+76St/LzcbwWQibRYiaVDBLUfz+gx00a8b2CR/r+ZqJnZ94RZh4ZyhGu7+BCMo1h2iEln/VMMqL4fGmrqGBESfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782647; c=relaxed/simple;
	bh=WAzemNAMBlLHCy0LwRLtLcYV4tH22L1qXU3EjulLZFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZ4yX0Y+AqXnu0aMzUmU/MzS8/WezBoxiLOLsZBDya9yIAUniLOcXYVqIB6WxyQeTX3O4g2WIyYC1e17AqTKZRqEjHf103+9aOq/XcPBon24TCutsiHoZR6omBEZin0oDjTk1oHKBTiZM6zhUx/jNV45AE4mRxEQLT0Ow8IUKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0G2IQKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5wI79Ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0G2IQKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5wI79Ld"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRLb217680
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=; b=V0G2IQKitjbPpFxS
	SJ46EyVV/kWyfnM7OSrv4AR3EFHkEvE5wkW25KCrJlzejAmvzWFCr2TIchCirvLm
	gh+x7idC/G1ZMexwXC45mFh1MP6sZYqyhej5YrNmywEF5PpEbLZIXdzUUk3j21eZ
	mXGq1NXf9ZQ+/cK32IEleUGgh5IUN3rDME+KRI8Vos2wexzwnOEwEf86FA6uqdk/
	wo5OH/SurkT9nA6kFFNmM7EePoLyajwY/15rJspxR8P5L+vyE00h7Da5HFEgGdo6
	N8OPEZTzw9TRmbxFZOeULspj1l4MBAgHIW+G2UsMC6BZwbq3q0KwHktuXsLxjG/3
	nb41gw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgpnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:04:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so6403696a91.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782644; x=1789387444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=U5wI79Ldz0DDbJdD/BEQIsYL8H3/2UjVpgJ1Q/N+cFfu5SCWmeO6wkGqFnn5p3k/k6
         2bn/i/mX+B8RBzHavMYa8OxeYZuZ1EXidMWvA8mSTYxoa6b+wz9xchHgJSU+8rmj4PHU
         fmr50wsM1t5W+0kveK9/LfkqSIU/SMhBnWf3iyeUJGjQz7nZbNeGgU+wkadqFiWGODQg
         NQN70KqsyeVhUB8EXZEnJZ0eEqUTj1rPMvgvVyl1Sm++ybz8JgZIAet5B8tNGIA5SS19
         eucd6IdBSq5JvUZcQjwETP3gZ/gnAhuOXSe23amEDMQksnmgGa3OUo8M7cdu+HDmTuE/
         A94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782644; x=1789387444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=WENHPUyi+mIOjzE2CJrBhvmQW98ZNeKvQaykmfBGf/aA3SYn8YZn86vF4a8mw1zn6o
         mMJluKu1nqHIW+Uh1VJfptXbYiMXkg4qvWvnEwOy5YzYOCxCQpQCxIr+BmYhOQ7uLMUx
         T1e+B16244YQ2hRXWCB6qJ/pYGYn+R1pmfVfCleY0GiS+Gi4bTuIn+KXABbJyE6Rdi1j
         axet6ugZ7htQbTFVVXC3HTSPxoEc4l2JLoPCd+S1cE9dqZRHN9Ih4aIho0DiWvHMrXt3
         nEC9Nu6tFV9EAc6mPFBUZCHxeOo2DPEwzULwEzaaS51lrExxV8mVEPQJmJ/OZZrvUI2k
         sAiA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ1aiI9CLvKW/fY2IFKjezUUStbBRfo7Ya8PuIEnIv3StxqHfMX2SZ7LI+2UG091yLdw8yQICRI7ph@vger.kernel.org
X-Gm-Message-State: AFuF++mLKFhYwPtclpuZoBY8YTdMjFW/ifXL5VL6OVCjaII7/2jjpoPE
	XAn7yvdZjAJgKjPCUSvBhZyRIXgoG6wwvQ4+UGUo2a946JVXIS+jUjFUpMAuxQl2EfqUDgRZgcZ
	Mt1y4De5W5Iv2X5sxQEAPwb6j79ewkRLriLAAjhcQUarkbFkQ382b0UJ73vQkkKhaAdbRE2Ep
X-Gm-Gg: AYBFou2Vcgd9lHCNzZwGJ3G/G80EOLnoTVWUSIlXfrPX8o3Vj9WHRuSwA3AOzil4/Yp
	rLDw1eYsftlMMdy5687pWscOpthAYTGJga2w6QsHrijX7CBSdbLzajXFg12SSMJQz2O+rgO9Ik6
	ebzQr/jW1soXfx3AlVjIOM3EpSlt+z9YV73P/xqRxOY39USg2DclJMwaFMho0gee4bhPGonlsaF
	D1aiC6gHI18ZV+1tol1opBhkd5vtumNlMP+x8dzYC0NorD53/rzwJAdwgmJ5Xq1qYoRYccppG7Y
	J0Dezt86Os35rYiqG7lCjr9IbpwL1EI8omKy9KirRucP/GqK2O8LBcWmOCyHx4FIOXOx17gn+hg
	K4Cv9pjm/iFbdTElIwGlBvJgtavxpCEFHgA==
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356184637.4.1788782643525;
        Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356089637.4.1788782642990;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:33:36 +0530
Subject: [PATCH v6 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-shikra_crypto_changse-v6-1-0676f61894b3@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXxFppRY35ZReT
 +WybeiVi8qP6Umq7T7R5RMXdT5jHcmHd23w9sPG6ZqN6upVOxhJZiXWihXceEEuCWigTw3kxFOT
 BLdELQQPbbWvVtVm7udijdhYUYotjnze9QQCKU0hi/MlNguwBG0M+bCS+RF3nKeyt6C+0gyuj9p
 XYBt+DVrbHgIe8hR8Ub1b/UZ2Nv6B2SrwfRg5geuROYbSohj57kotbXbD0VJVXIhWK4s+CvqbRY
 WBJyhyLTzpMq/7KOhQEa7VYhjXqH3sybYqXOgqmrtnUq3Nr4qK3+NWrikklwBnoqFHeQ6/JDfn/
 thxveycYL4+288hD/YUVYcETi+JBXSU6dwY6v2us+4JTv1pJmGJTBiRyJ0tx/Syc1C91f8w0feN
 wIQFnYNCIvcdNY2PDWbDsML7xYSDr8d9kQA8QypZKaQZKEwKRzGgXBFPXjmcxKNfV3S+JOWtGVT
 74iOqBNRMvBTHrhDqmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXwZkOI3eCI75i
 uxWp1e7cKG9wVDFcruUbXXU9Cg2GkugeJXfmzv3vtVaipsnwFTfqp//sjX5/G5+cX7V4mfBtEdb
 nYxCZlwRf51oHraTqihVZJhzmgWQjC8=
X-Proofpoint-ORIG-GUID: pk4eQUvggXXGx4QLDV5MXdPd-__Wdjfy
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ea834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pk4eQUvggXXGx4QLDV5MXdPd-__Wdjfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070133

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

