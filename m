Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB6364E84
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867443; cv=none; b=DNGvHHGBFyKRfQaeTh70WYYWjrS7E6dW3CZdlYI4+k3JE4js6d+fioN+JkL/xxuRvFWsNw9RPVS69J+0KlHbjpxkLKweyK4AF2V5yk6hFtHK5cdlH6jncrXsUwcS6Jxd11pfUJ8UCrMSg5WzwKRvhkL3A6+zBIYlIGbFAP5oAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867443; c=relaxed/simple;
	bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nq8UVA6lO6gySD80bBxO0nMNsvV+CFWO+dIEmTmKKezBGrBE8n/OrCDvZnsT2FbXKxE6K6hMCR6L6NyIyUSteyYBcwtbQU5s/US5T2bKTmGg8UA0RVL58zL7Edq8XHjHSAXl8zfycChUZbQfSZKHFx1qZt2H2bVJy2F0NSQcoLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMbz80ZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5zx4JXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMbz80ZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5zx4JXe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJM2LG1117797
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 21:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhR
	jqhP+oXA=; b=gMbz80ZP4Ql6KklApEFpVEAJl+vD4EA/79j7lcKeJIh0YVUVsv/
	ytp9LhIBVrz1pW2aHHu6nEo0jb9uvimL9oJdswQolwpvA4PV+Z9GIb6VbCL9xe0p
	zSJpAkzR5Q9Ac3I57RZb02ZfCkpEsnT/vx3DWkloOKWw7hSoBA93+R9z9TfsNpvm
	cUhMborRo3kzaSnEEAoCm+ctfaa/MkqWoUp9nY46+yX4ETpJ0owLHxwWNOpCiBUF
	ltnYpfaaULRKsWcsHZAfZJXP4qB+QNlAarZLKSkBnAYSQXSGPRYDnuzPBR3GzlaD
	wCv0wqX9ZcpcefjyT4n2gu7ui5C0ouQtXkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0hd1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 21:50:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so5140341cf.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787867440; x=1788472240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=H5zx4JXeQg1SQThQ6vgnvQya1VinMreFwJBetOwWOfUJ4mgEPQEjIukPGJlpMZ1at0
         +vjMTPn4Yac6xrW0Q4ZCOvaYpKmEv0IuxuScE3B55yhWA5wg0Rc5urIB8AA4M41CaTMT
         9VzUOpl4dE7US613xXIt6klxo/vLsEUnIZs2t1Ywjjfq2YySl9wDEH1KM7v9EFCuMFat
         8LGdImhNvXDuvw2ZsIWj6kCm7DUjjTwJGeZbQCfIxXyUBwyjbM+UqPOz6pFPtDqy8rWi
         QkUFLjDmuTCvT25be7sCSBTIoXSqcYiGkCtjLj9ABZ8waaLqSgbVpWZBDCmiu/RCgiee
         U3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867440; x=1788472240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=aBcbaXqjywlzXFmTHa89epvViaMWeHD0NgeU1mUi7h3vN0HqHq4qEZ565BAIv378fS
         NHyHajRIpSJBWhGl8A8TRvVy9pVRWhugI7TN45HBxzrr0cWfgchNH8PS4KVZ2XvsgMZK
         WuD4JsMWzOWXss2fYMDYoV/UKfpM2LDuTtmVuecCnXdrFD2JH3x6dRaHWHBe/bvBRCJZ
         vx3W4N44HjXu+TbmWuHL5F6NNFBa8nxZ7I5NMWnyEBEYrX/R47v1shbYNKc7cUMvby+r
         MFq8yG4qMv4eHUbeE0MDi8zCANVG9XZMalL0V86btyp+ens5LPSWceTM5irIhqQlx1Uh
         Wf+A==
X-Forwarded-Encrypted: i=1; AHgh+RrEx3wLckaN9TWMg6jPadzTNIds045E8FiwjwrJdtsjZC8B/MRybidOukpx6RMaU9s/YhtAZ02kKr+2@vger.kernel.org
X-Gm-Message-State: AFuF++lkfUEHe6ssnMrIDDb63o9TSbX1AzcpxUKj1rPks0QQQ1miICC1
	+tMUJ+SP6AHPJpcnFc74miGWZdZLn19dS0DWw4CS2utLgGtCohpYiBKprdsDYQtK6meyxgH5Evo
	cbu6Lw80vbjUDkQxl4vflurZ/1fjTMDhLlQUktvpF5DUfM/W7Zc6TWzY26PUk9cB8
X-Gm-Gg: AR+sD13Vdae+jucTtWjPmHE5hLQT7bqMJHiaaI7bqcRZIw+DI/tSd+QywNAbPZ+KQc7
	+kptk2/jp7gSCWg0IAK5gxsXkWyrF9nK2yjRghbJDEppkPRmrRw9AidXyYfyDl92EJpzNhuOqwv
	wVU/sS6IKGfMbFlt3nrM+w8sU8JzpahglTYMcXIRLgxx4uKNdQqU8K8VLi2khH2Q1nF3AsgIOkR
	G/nf5wnoUfcF5o5ZJfyro9cHyeOrLaxlL3RBxAhInbTJKPVJba089NJnPMbdXOT/Ho4On+ycSnu
	O69/IwsPwSjetvEVgoWZ/PKwPjmrKRCACg3a6s+/o8TOf5NPMe9tkGtCqFK1hD6yhc0vVF3h2wt
	P6EmuLqHRqWusER0=
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32770161cf.24.1787867439045;
        Thu, 27 Aug 2026 14:50:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32769521cf.24.1787867438526;
        Thu, 27 Aug 2026 14:50:38 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm1261435e9.4.2026.08.27.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 14:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay
Date: Thu, 27 Aug 2026 23:50:02 +0200
Message-ID: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkLEJBfeSdGx5LyuHQUK+yJZk9GXbb7Yi8/aBq
 1ZIZ61Qp7eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapCxCQAKCRDBN2bmhouD
 18c2EACF//Ar+37STpdRJjelbC12XOkUkuksaoF51Qq4rWH8Ibq6joAbAIW7RTHARdvwrpgtoGD
 HFLBdwuI+ic4VzN4cwPSqOsPD43j3ULmJImjvg/pwBiQHw6BJfsS1vDMM8pGK62VMN7sl7bKQwv
 LWD77p2UKcw64oyOvARLOxrhEvAsW6QkkhEV7Rd9wJz7p2ZyF3c/aCyg1pv6SpK0x7grM8Snhgp
 sYglhCwkq5FZet2QncCtGPHKR6igdxGQ3jkagSzAdOfPOFNMFjXq6kwbi+QxtiDyQsSceOHPN8y
 XP+pNhR5R9FdGQmvHGlTN2XQ9QAa2VWsu4baZrq5Nm5HLF/bwWgqRWA2NOfMJ5lm3kId6rtFGu6
 pI2OF9kJh8SKLSMsahkVMIHXncY1ppkSeuqlXH0b87xxA6JE5v51aU0b6o1HdYsC6HrP56LP50V
 gWtBj7R2o8mNQnVw103RsevfxGpcCJaCrVRhPSwxyKRnICXWXLFiSOvHq10K75MWfKjuhZkuDpu
 N+EPb9ARAYErVIbPDCEDeG6XYJGLOjZ1JL+Y/5Wj1SLnI3nTf890UjZMCfHFCO1PsZcP7oVAnqX
 OSx9AfIroAwVljqeE3P42VPJOu26S2HK235sresIPFfPopyjsvVlxCLUWS4uD43PYdw0O+snF16 fMJlAThzaBuFfqA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfX7ZN4e6NiNCAC
 8mbJwu/XVDP+V0u8QfdLoknE6p7Kr/VPlxiU0ufKvMkQTl/flGX8Y0k/cblfdLkeROJrU6cmF7m
 Vc0DWwPk2RmkDjoXXiUUWIgEwVc3eZ6jNPUy6W0Ex95lw1ivMXZNFAvCZSdokDYi0CbuSy4dFgQ
 GSNh9/Tgsxn6h03FE58IG/8+u2iZlTz2QkqvR8Co2HGOa8do6ux84hcLF9rjChM5tSUbcA9kvg4
 9s0DJOJAfOAokQQmXhI6R5FucGyv+clvM0RBFisNHc8PB5Zjx8IcwT6oN5//3tFxzfogiSLQw4K
 druZtxvZXJ/RMuuT0m9NQzGNmmqNahIgSm2Pf8WxU90H4hP9AUceZ8/A7qsMA33ow1eUw5lC+iR
 qbLxoyBpHxiNlQc3m01a3SN8zhE8B+iKpTLXt7ryvkTA4ULI5MUPXBc5+0kJejoc2eAki6l/l+4
 UUbjIffCa7C7wmdf53g==
X-Proofpoint-GUID: gf19BfT3W-KLyCw06QPxBKsV7w-RSBM3
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90b130 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9VaQ_ZmEn04Xv8QsgdMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gf19BfT3W-KLyCw06QPxBKsV7w-RSBM3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfX1vtPQAdhWgN7
 kFcniK61nXBcbmtwBoz5B1i5u/y0P3CQg6dKK5yRud9qQTnjf67uABjAh0hWbBMgaMUXA8Q7plE
 5492mOsIC2yXYeMby7FLSKjLJFOyLR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270184

New nodes does not need to set the status as "okay", so drop one from
fuel gauge.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e3..d98e3b2f1c30 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -510,7 +510,6 @@ &i2c10 {
 
 	bq27441_fg: bq27441-battery@55 {
 		compatible = "ti,bq27411";
-		status = "okay";
 		reg = <0x55>;
 	};
 };
-- 
2.53.0

