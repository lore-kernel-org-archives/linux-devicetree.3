Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39A3B5302
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342384; cv=none; b=IdtlJGP2s78soXGK84x6izdynpo8a3NhriWELHCh4j7VB2kVdOY7pK0A4s/9LMpKWPmGntDZYOqCk50RRaEl+XTrpDcJJ81rhNrr6pLpAAOYdED1BueB/tQ2dRw98lzEluEbyMfd8A0lNRZEZ6fiGfCarzlEGb6EZcAhlnRUEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342384; c=relaxed/simple;
	bh=HLksdKGJAI0iCgDUXw1Rzp6ezeKwOcpnSyQnHzdCJXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d7r3+EgaQVV672u5gh9ni7sHr717b7aWsBchXNBkRqUcSaOH3KR26m8ka6Zu1zAx+F3YoNzoYluEyORPWwlLgAQpL4x3U82o9fAabn4htApwXZO7Zvfhg1n63wR42UcbvImiqv5mc0fx+xPuuMqj/e4LjkXMUXM/manLbdxFUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+FIJYd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkEQYLfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+FIJYd7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkEQYLfc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCJYYi2653859
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aplkmEpHZiGBKfdGyVM+q1
	QOGEwDPUO4XHDxKA0PfAw=; b=U+FIJYd7hDfdlddgMNL9MmWZzHQtk8agmh+nHU
	XBVsiqh1CrL2gea+S4mh/5LjXqbLJ35RDMCXlDjbBw16yG1q+UQ2Fe0htiBvUOE4
	TsWtEtHoY29bxBSSVP2iBlpUzZN5qI6znOKTAc+mtO5V/PtTWS0yM3qYVsdBYzJW
	0bYPb6oPY3FnekxpUOyIFJlExfITal5T9hNQnWswcOkgRpkRUeE+4QdJTWQymF+b
	xWUa2zoTpy0Lc8iAP04jNKiUrkqlN06SDc58Pdi02/pI/rAhtKUe/O5Nm3ZnIL5/
	V4HZ0IudFMNEs1qxO5ojL+LifGmHD2+p8Fr50d5ohEl5BZtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh8qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso82070725ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342382; x=1776947182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aplkmEpHZiGBKfdGyVM+q1QOGEwDPUO4XHDxKA0PfAw=;
        b=dkEQYLfcQ6XAltISDF+u9TxCpxz4sWxiMzj2ni2zZLHMXWj8ueJAsvH3yrsd/wON+V
         gKhvOz0ydlqzHJUntotuD7FarFz/K7a9XAiZjOK+852LnJgsSvH3gLCDZbX/beY29e5/
         zcMCdddysfCejBrbUNort0ZOVT5cvpJTO3VRKX/g3ENRjfYZC1gOSBW1OsrRU8cSaasP
         wYO+1uGLeCpqWNGaEsAwhjw7437W9QTfUyEUchwSi2yPM5ALwDBAg4PXXwL5gWJPR07U
         UQVDPBLYYwEFDVUmT8pw8vCM+WDzdbZgIlGfCDXAZrG1t6AwCIeWVx6cYlrH+zlF21t/
         wWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342382; x=1776947182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aplkmEpHZiGBKfdGyVM+q1QOGEwDPUO4XHDxKA0PfAw=;
        b=TdSSwrMENqt7t12rd/fJ741FPH6WPPAPGZm/+ZhPQocg67rLto9Iq3vKtXo3LDpy8m
         ABdIovGi+VQWO4zghyfGIYL7vaC3hglMA6E7FVfHbX3VqTgs2CvFVGhN8FOagVIm8TY0
         xFBeU5ZS/zMhY2FJehDcIgeA5M76tpevyaeKRuFajgZCPxBDfDWe1sO814ol7LLbx3Wj
         CiYq7Xu8Md3ek1hre9LQWrSd0Jsvzo9nOMY30JeWQbWlRZpn6QfrOUeI3tVIxOcAk3lF
         FhSG0vtP6ykEGCrlYKdvh37RVNH70hWKCyAxe1wmmRzdOLHW1W0DAAZBN3itPg4hXd81
         5o6g==
X-Forwarded-Encrypted: i=1; AFNElJ95tzX3vkY0+VAQoBVf2AbQHaYQkYLLpwo9Nw4GQmzfmA/s4Oodt2cBMMIW4ypGGPvwAezZ/BhYnzxF@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3Ch6R/VQLBAzlic9TaurlANi9yDwz0zW6p9KB+8uJkeI5s9O
	2nmQBs1t3AhhNMTKzDzGUMsjAkL6lNP9q0Ndcq8zJq2WU818S8VtDQPPC+7IybUIVOAyXwtNrAJ
	9y+eqfqOBcm6flpxE7OaRUegeoiIRAwgJ0EEqjOBTXK7MwYVq3OcKS22sW6MGZtTA
X-Gm-Gg: AeBDiesZ/ZuC1/mH9jvyXGu1nu821SEUPN7iCJDcRC1hUqP+K2VqvcG/a9MvTTgcMCB
	l2y1/cUKo+VPXr8A+G4vGfigAAg2wkBVnMcLyCvXfqZsgRZw8fiuEwd1qL9lWgGAy5NDrhpUDNs
	Mgq0zit+JAXu9J45735xE3zTbyLYkb1mygDtpFpJO0LC2TLJpDB0DRj5M3BH/Gf6bxUhq09XQfl
	zgb7s7JRrHFENK7/N97oJisdWZcLgoHtcxObKwbPEyb6P1cTU3eUj4d+y4K0uteXdYoatkrcSRf
	/Okkf3/Qz/pXWjVMzQVmYY297fTj+5uR6cZJAJhVGnUVcNVrUvMmeMmpFgZC0jyw7LSA5hRLLZ+
	TJ2fgXW1cQp8KhcnePRVUPLE5gmar/SQQE4ln+cTJpKMVg+tBTYyC7TtSZw==
X-Received: by 2002:a05:6a20:6a27:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39fe3f55568mr29161921637.35.1776342382004;
        Thu, 16 Apr 2026 05:26:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a27:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39fe3f55568mr29161889637.35.1776342381463;
        Thu, 16 Apr 2026 05:26:21 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0b56sm6227542b3a.37.2026.04.16.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:26:20 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/2] Add TRNG support for Glymur SoC
Date: Thu, 16 Apr 2026 17:56:10 +0530
Message-Id: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLV4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3fScytzSoviSorz0+NS8xKSc1NzUvBJdY0NTQ4skM8u0pOREJaD
 mgqLUtMwKsMHRsbW1AGqQTf9oAAAA
X-Change-ID: 20260416-glymur_trng_enablement-31518b69fbca
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776342376; l=613;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=HLksdKGJAI0iCgDUXw1Rzp6ezeKwOcpnSyQnHzdCJXg=;
 b=mG7KiALHFvK6cAP3z1XDvOghxNC9BUw1l5PAsyazoDMkEoYkSXd7mZ0o4kXIygqdBgNHU8+DQ
 syNWhn0gRoHC4wkEo9jCW+3aqBfhDESoOElkfv700oFGkClnG1mz7gB
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: iqppTGYFvyd9VzJctSqZct_Aj-WaMVm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX93jMkFvFRE17
 CFYw1XQTGvIj0TI2hDrVFUds7Ug7mxgIBYU4uc9nq7jt9PkJ5hC0jYX1+KE3j2iGOUo3dtMRTa7
 d5KcDxsnsRNBg4rPkPbuv4x8kooY9uAi1IHF+RDMYI3CByMGk4402BId1UuVLPmxYzJhJy4sD6E
 99ITNer3dB+9CzjF9dRYFUxVyU8JAa+/MFak5K+RRRSAqnGzMeN7vjF0t7egKZeOuvjXWTEAVvg
 t+018O+UsHOZGEQeSFwyBKMinXCrupHIqwrO2hhVOZeWsdgaeo9kt9c/zPl5z4O4d8uGha3Rs/G
 MjQiMT6uZF9WsFXlCQOJ9StugjUjEu8Y1sZoim/3g+me5ygxulQhTVKc3FjsdTEN8050slg6fgt
 BXzOlvUFGpBcyQMYP8HAlnzL6gbHEKE8PdKRDe+VPF4CkxHw4+1dhrNz9nONlcBiIpZgDdylqvI
 SdBx5maT04L8bwvdyCw==
X-Proofpoint-GUID: iqppTGYFvyd9VzJctSqZct_Aj-WaMVm0
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0d56e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kES01Y3mVqZ45jXFSuIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119

Document and add the device-tree node to enable TRNG for Glymur SoC.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (2):
      dt-bindings: crypto: qcom,prng: Document Glymur TRNG
      arm64: dts: qcom: glymur: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_trng_enablement-31518b69fbca

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

