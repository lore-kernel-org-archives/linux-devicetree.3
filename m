Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0533DDDC2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764603; cv=none; b=Y+x0n5pNoFadBtLIIcn7n9ESAgMFcRc4OoqqLdgCED2jR5osS+zX9w8B4MQ5zbVcHcR4yxnkmJPR9UHBis4/c3tuaJuNjOft7ayJ2I0j4bV8WH+CwcBWZjo/3Nurazsa1Jaa0bjHFQ9u6o9vmH3uON+aO01HQk6SI34xVCeqVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764603; c=relaxed/simple;
	bh=doRT8cwl5tuW4v3nDKY0tWcMpACQ4r7ipwewcgGcF4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jOehedDIcefBl041VBCajLvfeRJC/Tq8Myqjr//tdVCQ/4Lze4+0XhXJXnEGXCjxJIAhRCHQq19jhX4ZGW9cVIe3pfHOwu/KuaPUc8R8glmxjPpBwzq1tvHThCLD8haufOYwcrnNqy0fFPcQEERTWlP5sjLq7VjaQcw15m0XxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJ4O9nvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtW4/rle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJ4O9nvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtW4/rle"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYFh2238425
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MSrY1vYdLTiLQUIIayjkcA
	EoHn9Qam7mz3CuMYOBslo=; b=pJ4O9nvLiJsW5EMSIZ4lS8u0tHjFofwxQMLwmv
	FR4YDpL4rHNFVmMo/+/tPLUprNvyw0C98FH4t77PiAEWu3rVl8X8NfKHHJ/mlfAU
	7pFYhznenI4CZ99u9bxXugs8PA8ZYNn23QGkxrjRNjZmqIUSFgh6KbT7j8tlfwY+
	Y49lMsOw2M0qg6OaAUZ4S9iMrYgpNpmfYwRjsN39VHFfUhnV+PAtURaLUkg2Zen4
	C8y/qKSpsNipSQPjOw+w7dzogITG1YwCa4mFXJ3TbrZp2aKlzPR5v4IOfCmULaGm
	WUvU5Ua6HXkxvCpcbuuO5qh2a+ZBOiHvphZn9Ds7QdF3+BUw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhvk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8354503d9acso10025866b3a.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764600; x=1779369400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSrY1vYdLTiLQUIIayjkcAEoHn9Qam7mz3CuMYOBslo=;
        b=QtW4/rleex2nkQ6SM2AXOTMi64fnyBeNgW53MbY6ajVfF3Qw10J1DZDx79YiQNIjw4
         6GkLb9j4ydeLRI9Wh5hrrKCdN25i0W2Kx5TSn0wRgAgVdkmE9P9M2HuF+3Okyh7mw6rc
         +Xor/G5JF3fnFng2Wnt+j+V+KPAzn6z6febEkpnBTq7Zsi9kZZP93I5lYzgS1LLW7LFD
         XmtPLbXIHiGpFvkVIMAR4GYfFqHFTeb9I/0g057ChWiVHbu1FUKayp8BhAmdM4PtVoaS
         eGhYfHFkWn7uJP0zglR7pC94WPzBTmJCQpbA+Ma/DBNqfsLHx27B6fC9iWH1eQEHg79F
         mEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764600; x=1779369400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSrY1vYdLTiLQUIIayjkcAEoHn9Qam7mz3CuMYOBslo=;
        b=RRtdNDTAADG+F5Z3MkAkfsim5PK+tuDOAOdTRfiAdP96HXUBxAmuyxJloYIUZqeKpX
         d3XtRqM4fjvIpMF8113gnFLDyRfR92HsdcRCKrs1hmjcowZQzwAL29VbK1DcuM36bXtz
         /fdKxozW40Z/SXltdVTufRPqcZ7GXmfEoWHZyR0Ugs9ByIvE3Axg/d8QEb05WrD3IZU1
         cGfcJWJAJUBjrE48Yv/lTNhHP8NfegMNMPjz91bsmz6jsY9pDTIAjxFa1GsbpW1SdxNO
         wGgrmf3bsm0A/ySuKFLkJCzd4pnHPDZbI77XgMpwqiOeABUYR2R3dt6wdKau2sUPn3uH
         EfeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vGkVKQJK9Rk3wiHsQkqIXX1hfybicanhwUvXhn2oFeCTz6Fw77F541lAwXBgKZVKQIHyI6HOX/2ps@vger.kernel.org
X-Gm-Message-State: AOJu0YysRR+e/O4yM17F7VhywTtojCa/gPFZUHDyKRPh/b1jcVlu245P
	iwQmY+cHvh15fFrsriYVUTyDm8829BxGCyZzHegsARQjZeX9ajoK7zGiyUfGXuuVzDDX5wR7j88
	pD4SO3CKzGwUI07tQ8OWlkl2Dw6CvzH2DNNG0Bw39qhE16FoITAw63XBAxivqHNFVd1kulSbg
X-Gm-Gg: Acq92OG19Af2DD5A2idi9/YTi7GZ3DExnqZMzOnRiY5IDDSUb4Wf1WzwoVtu3GaI18+
	WppXe3fFv9T5GcY64jK8V4AdXa5qDkcF9iVAUDJzf/inUqnw+n59ImFcJutBDLVheq10m4pko5P
	n1J7gW3vMt+HpjSzt2X7qWkdbROleU20+P/HC7V2pmzMV22rD5BwBoLwgy92y9ESFVDUXMBLP1t
	3kobxnZxjpb7u8Hs7QQ1mpxHjSoj/c8sTO6UdCz4MyfuDVMV3MtVhQ/AcKaqKmUuiDx0jUlXf83
	QexQrsfTG2t8InwVB7N2dumCTyS5EYXWWxQPGW+d1jauAJQTYcR0mu/74/G8nNON/hgcqmrJq0d
	d3UM+Jn8Ce8fLnmY32BnLb4HcfCX57ZJ+fLEopvewmf0rSjbfEolbuv4=
X-Received: by 2002:a05:6a00:8e09:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-83f042c3b5bmr8052731b3a.43.1778764599912;
        Thu, 14 May 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e09:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-83f042c3b5bmr8052683b3a.43.1778764599429;
        Thu, 14 May 2026 06:16:39 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:38 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for rng on shikra
Date: Thu, 14 May 2026 18:46:23 +0530
Message-Id: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfLBWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3eKMzOyixPiivHTd5FQLcxMDy8S0FCMjJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAKWRhVxuAAAA
X-Change-ID: 20260514-shikra_rng-ce87409afd22
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: cfNEgtj6CEhpraDEzedFtw9ZewDvrNf9
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05cb38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RhLXBfPnT0iXFB-BVwwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfXyQO1LCSg+dYK
 LGyEKkwAnt+KOkdfHo1Nfsezvu/4OxXTFYwt0trnuRHYkjOuVpJcvlObKlIXJADmq5sfb33I9jA
 VWANRctOTpvSDZsZxP1ylpJBVZ3QYL4dqlIWRnovRbn0ejEhvInZS2ZbeI1QYl5a9enLUWZhIhq
 o9vFmOKFXLxjzPuCEhIg5tei7AFsLhke8B9VhElfRcTj8xn0t1P3/JpcwPs/GutnRxPP9RK0EV8
 IsNaB6DHkgA3zWW/ra5p/2e/YyBJngTo1SqLsH8DiX9G0m8flN6k6OpYyLck0F6TD+UPkPSDzkR
 6rqzEUCC3oDpafYl0zMAstw/f1pSYoOjlB9gDiV0a8tlIuhVnuwg7G6L1inSD376VdDoQXZMTjn
 RNMZ7mUo2OEESe0jLvqCXpX+DuaHnYSZ1XyW4hb/RMT6SB5DQga/2sJF7jlMkv39/7wZLzmOqxV
 LHISWWuZZQyFI5QEmhg==
X-Proofpoint-GUID: cfNEgtj6CEhpraDEzedFtw9ZewDvrNf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140133

The patchseries contain dt-binding and DT changes for enabling rng on
shikra.

This series depends on the following prerequisite patchset:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Tested-on: shikra-iqs-evk

Testing:
- Boot the board and verify qcom_rng driver probe success.
- Validated rngtest utils
- validated against dt_binding and dtbs_check.

Steps followed:
- cat /sys/class/misc/hw_random/rng_available
- echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
- cat /sys/class/misc/hw_random/rng_current
- cat /dev/random | rngtest -c 1000

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,prng: Document Shikra TRNG
      arm64: dts: qcom: shikra: Add TRNG support

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 33c8e3305b65a2e757e68b10af521ad54ea051a6
change-id: 20260514-shikra_rng-ce87409afd22

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

