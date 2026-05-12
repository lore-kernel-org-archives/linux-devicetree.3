Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE0296BBA
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569506; cv=none; b=uiGHF/HDBx5Wxee3YNbe1hU+Td2ihWOAuvRFVWbUda5kCa4mCvadJTncj7VP2WNZP0b903zpEOVvsedySkm2pLDYa25DWKGJnvUHzXkwX3uex/ddsO8gPSVUY+e5dsZdDGrUn5U7WWnTGke6ZyadzFxg8nDCf/MAMwQVEHYK67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569506; c=relaxed/simple;
	bh=3uXfmbzUS9NvAeHKvCpU9UZ0aQY6rnUGZ81s5p69bMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g8+08ziWvHWu/cSVhkuBTmvRWUWGpT5Imy+/ysnDg/zPkzuGy9s9zfpTgohOxYGAwVCa9wWoY6BVl33pCqXc9frQuwjlLPX6WcaIZ9YhJA6mivjiLSh5xxTul+V5pxUZ6Lmll+fy42tSKyXWjCGPPWi5tzsxKDgj3BZv0Jbrj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGKbzafZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etSLxejc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGKbzafZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etSLxejc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5A8ts2173016
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GRFzOTE5kNwfoKKeGN+Dum
	JgWdvZjhQApkuIRVwGXX4=; b=TGKbzafZK2g43npIgGUCAHdc9IUnHL1PNue4Kt
	O6mPOhaFH2SdOwnilvKW+GnvkXl1yg6OUGHQi3zEd9w+hyKB4SjBLqpSPhpF4iHA
	0DxXyqj8kQ9fhtyXagzQQACC5Q81y94Eovo27BrzmoU3YRhFrwjdvhWH8RV2iRn7
	POEQyY5Clu5Br1e4Ei8i+UvxolZoucrKA4N/luC9eTx/YTfiA+NEE0IyLALILxip
	0s6ps5/azuh1cH2YL9slEOeMXH6Dldt9gpEqS5qXXBMNKhNx86WecQOd7xsdW6jV
	pDo6LK6JHv8bwXP3wla7J9c9icpmNa49HBgMM/9nY0xJPpeA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj9ynd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so1275036a12.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569501; x=1779174301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRFzOTE5kNwfoKKeGN+DumJgWdvZjhQApkuIRVwGXX4=;
        b=etSLxejcBl5JXSz44zLnIuL6tWOWzyp9THd+nqh+URo23qN5T3+aHY/yf0KHZrldI4
         C/ZrmoyMvS4EsSwb9/VtnGNVikiXAAiRxf505lWu997uFORCm3e1nTeBRAzIzgoMzD3I
         2oaRcuhOzNdd+QYxBs19Vr7Jg3SdmxCPfzLtWxvguZ9aEEYz25L9YNXwEN7w4bCIySAb
         tIU8U45JBOip2hl3OutVh/AVMeheFpeTLqj1U3IFCt8v+MnZURa2JIpmjOjAHMclaH5j
         iJB3TLHMKzpynqllE5MsxU5caC0gI+ttcxAY27ienhjn7mcOjFs8IGmYdzXoQyBEPu8C
         XStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569501; x=1779174301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRFzOTE5kNwfoKKeGN+DumJgWdvZjhQApkuIRVwGXX4=;
        b=HOjNtdtqH5KjjiqIUXxgfzG+fYkrQmA2sRV91Gun5G0F8gFPqCzfv/v1jdGSOLAtMp
         8VCZ4K6K6OuRMQOyGaSWuPM2QKg/k2J/Ahs9L6aUbzP5f8qSV36e4VuAUBM8pE6wuwbU
         BBtK+Lr6ReT8MAffTNrt0MooqIcdZcZley3NO1KIZGNyaQfwaK4XL3tcF+I/IV3OIXfi
         gUeS628jNyDs3qjCizuqNhABgUwhU48a+fYmr08bDXQexan0o0ghcASAf8cOcbSm+fCd
         psU03PGzGow1rkHVJCTogZVcvM4U+ogI/X0tZu81oMW4KuQqTLCj0mwDVgDUSJUvwPq6
         /cDQ==
X-Forwarded-Encrypted: i=1; AFNElJ96VWYnVbiYghOm9869oLBYJ7RpmXUD+Lna7dvcaZvbYSmTm2b2G0IKplK2De58A8a4gTNmV+Bbp5Mw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmt96jbjF9dKjP797w+sk/drg/Kw3wmiiASDcToS7ZQOg1ZWNk
	6a/ULBVSUiNd0Wb4G5ZE+hdhV/CQ17P6sDzVk0Kl4mR/rB+JC9AgjjMOLAd+SU2LJjzh4MqOuB1
	QqEvVSqeeXRbDpEGr6GrRdxgEKFpyL6Cv/T1mIM7xYf8V5puv47nplx58d3tvs8QB
X-Gm-Gg: Acq92OHGP9Cb1O/nC8Z3FlKDrGN2FzSDPCuMkqVTGK1XbZpyboaLQVHq65nasOpqL8x
	cwLM30U7PZWOscFnGv07hooRGCjrIL/RWkpoN9hcIRuDPn/C92bnbUuawfxWgSeB+fTlsJfzkt/
	fIrnlDq1fHRnpY3CJKb3veDOpmXZ64y77M512iC1cZURrzDVVy3MgkwG1q9SqNCkKbIaRV0pZPV
	Edb65IXx609r/1l6CcZObzptH7WQ0rz5/HKQ6l8SkjtiircYVQKC01DHdFX2q+7lPvMJmsEIXEK
	rbBgz0TbKzwsqcjB5EVGkmdkwS/NlieCi5gb3QplBGtE286QFAa1cxamYV19pyPMTeSxm/kvaV3
	jVhewDDMWVPqcOL7BGs4mWe0jIkY0cdPziYbpuTkuUezZCET7LYUIftC2QvDj05vNM16gOaealR
	yCBoWPgg+WSn/R7IdU5VBuxbkjCEzGwlYlv7a/DDHIXK4x7OzzAHEjNSne
X-Received: by 2002:a05:6a20:4320:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3aa5aa7a038mr29162291637.39.1778569501139;
        Tue, 12 May 2026 00:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:4320:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3aa5aa7a038mr29162258637.39.1778569500567;
        Tue, 12 May 2026 00:05:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the SMMU and the downlod mode support for
 Qualcomm's IPQ9650 SoC.
Date: Tue, 12 May 2026 12:34:53 +0530
Message-Id: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXRAmoC/22P0Y6DIBBFf8XwvCYDCIK/smmMwNCyqWIBzSZN/
 33d1th92Meb3HPPzJ1kTAEz6ao7SbiGHOK0BfpREXsZpjPWwW2ZMGASBGV1mG9aCujHmLB3uPZ
 5meeYSm1kw6U2FpUyZMPnhD58P6c/T6+cF/OFtvzu7Y2Et2Vzllftreyqp5BzOIQmxtKX2OcLX
 q81FRpY60SjrO3Whvy9d4cFpQdcbE69CZML07luwUkptADvfLfS/9n3p3kcl4Pl0lkQjmslYWf
 NkLG2cRxD6SrUyjFqaQsGqHPouZQeGDfGWy8NpwK0HxQnp8fjBwtSmMh9AQAA
X-Change-ID: 20260512-ipq9650_more_dev_support-b64369bce88b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=1168;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3uXfmbzUS9NvAeHKvCpU9UZ0aQY6rnUGZ81s5p69bMk=;
 b=3bDTcz8pVwr3q6uSpG6dAlW0GjKmjnV6MKvQSZ+VzRuZsPFcGot1BSAOAJ0/rswTacByI8RKW
 UZia2q5QxW5CwTLUCBIXnZ9FJwr87tV93dFcrgLUqCQbVgJNVBhNykb
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: JSGyOa3E8EdW3e_ElCwnVH2coPrtSamh
X-Proofpoint-GUID: JSGyOa3E8EdW3e_ElCwnVH2coPrtSamh
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02d11e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=_3c_48eCv6knbha3:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S4QRGENoijvoE2MVpVEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfX1wljgVKWU1bw
 V++zig/FW476acfWQ5aWRvIvUFqouNG22qa0QtvQFu0KINMwieCblyiB4U4GUhiLsE6UaX1Co6y
 TO93yvJlv43jcaHuGE0xbCqA4EUM2j3BCFv1Oul/L4OYP1q2LJjqbPHYs/EYb8rmfLgtrkGLJLI
 b2pRZIvMroa8dkfzJM4F0iPTZY/VrGD0xnLcoxUNDCzlxNldd+M/GEgwgbpypyDSY6poE+Fi/Ph
 jVVDgA4PKgwLMQSoj0gQ86PX8jbKwS8Lv1NbGmrFNzw3MplNtYOpmkQkDKiUqfY+3CMfaEzJXff
 2wntnr61rFBbrxgKS69t6n5lpx55d0IL1cmPyLnJMLmZwZVdTcD/9lKz44/Pt2KboaM+ul8qGHa
 dBDc1xX/5wbG/Ir/HxFQGBKZqb0XOCAZxuIoHCAUTM0FYz0Gp3yiXL49lD8+NsMZYpQjJ664+Hc
 78HkZwmX+N7vurTCOKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120067

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9650: add the SMMU device
      arm64: dts: qcom: ipq9650: add the download mode support

 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-ipq9650_more_dev_support-b64369bce88b
prerequisite-change-id: 20260330-ipq9650_boot_to_shell-159027d548cc:v4
prerequisite-patch-id: 16dd91c965e8c4e4c9da7c077f5f6e5f56624149
prerequisite-patch-id: c74b31333eccd4eba783b927b7eb0bdae27ec576
prerequisite-patch-id: 940367fceba083009275adfbf26cec848e676915
prerequisite-patch-id: d00248eca6cd1203ab16aed75a6932581d90321b
prerequisite-change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf:v1
prerequisite-patch-id: 12a6b83739dd22ca8a25507dced2e56e5cd2fe4e
prerequisite-change-id: 20260512-ipq9650_smmu_binding-36dc05d39860:v1
prerequisite-patch-id: 92f58d1b58fd36313dd488d024e7deb95fc35ce7

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

