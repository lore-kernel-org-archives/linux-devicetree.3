Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DA32470F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=WsvGbURn4Mk8LNfD9mC7CcztpBDrP1l9RhyrHygNYY/xxcn4pTAc+P09Ex0xszhF75Hca4me2W5UxQHdKcxcpEKyUPr1n/TlnLQFTGxQSmvaNBd4Wp+f/fI63cqD6U1W643pEGiFyR15u/p9qWHOVsC6E8hSx7u5Ma2p0tf7P4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=w4b9VTbExigoHXMmj2K30BvMI7E42FRXJyk9Y5xpS+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pR6vfjTXfVl1Xa8ueG7tiDg1TTYBE9fF3xQw/jdUlj2h58hNOdq5cJ4eB4lfB6BciGD2m+kOmUS2/VxyGVjJVC+AVSHKgFsTpsUcKjiuyZFdi/S+/EelBUDJo7GXY31eWk8WYxwEVjIfvYD19ESZYlwPNnLoYsvFmu4lD+LIzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFRPWNTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyCmRoPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFRPWNTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyCmRoPe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJal3733697
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=; b=lFRPWNTOk7mlv8cD
	PQgTImSUiIUUrZLwyei6nTy2dEmO7QD/X5yKfZmXx+N5gVfVAbQwxYkZ3VZ6/luO
	DqKX7e4vEh41E76CdYiHB5NeDOhR/f6fC/n5pEnThZImBLI5tA9eHTVNUbGrhuct
	3N3GYpE7ceMVmMPQw47QOnrPVIuewbnfIqP7tUQG29EUuwNXwEFsCQYiQMHtx0i9
	qQ5B90PU9Aw9WIpJ0bD4KMgUGCvvEDItsNi/Ecknqqlq6dxHizPBJmGENX6j22Ip
	tUvLNURUmJG5/nJrLJn4ntMvmV3ytT9fH4zqBkX+Yd6uEOA3YVHSeqNxOiFD3eUh
	tqQrDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq83hn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fed0652bso37526585ad.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123744; x=1788728544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=;
        b=PyCmRoPeJsvLhxz00GQeIAn+3tM5DNq0qBTCfI2JnVOHbwWPVdS4gS7wuL5Y1T5edJ
         1+FXflaQaAZJQ8IVCvQitlBWmyHmSodQIhdS+RwO4fALjbZLwwPiaINUx67DP11Qz679
         zo1IIT9CvoBzMhrUTe6cIE7KsQEnYBkjd4PclV4ysRkKFBU0XnTMUMx4S1DPjyHOtywK
         oEKofpIhSiuL8x2UzqruOZeKjEBXnJrQCrY1usTVuzv2tWHKavTupm/xAwMwpG8t35Zh
         brcVepnewoGZsHpQppE57rLimiiJDBm8+IsWahISpIr769/RC+/B0td/nQT17h1pbEd/
         MNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123744; x=1788728544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=;
        b=QhZHBVx1wNJyEB3tWzapIGyb84prrPjvW/Oa1JJPF0kVYAXFpunPof9lF3XoAd2uv0
         v/o6u4lzjwZLrexJemOZ86HXwx9yz7ycMp2HjvEjBBEQDo2S2P3lqwyraqXUrJqifskS
         27iaiYXxoYr6w29mkKAVsb+ouUJCfFNQktR9j9/bdS0RSSRc1EHLazfPgJfyvCwUHXG+
         60Mfpt6cr+inLRznGbS0aicEpG9fFTbCkOvrB+OXk/PSq+eaQT0AWJk9+WB86lU9k9Rs
         8+Isi3FwPsiQsKcisfdI2LU1/HLS/hmo8P8f2dSYmolPF2jZy/baNtVUMBLfV7PS6s82
         t04Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6sqi3Pn3LgXOSvgAemmdi/j3hP/kgZ4cjsPwG4IlCtbeUEAmJC6ETRgi3RyKkUjl3EG8dyY+uJddH@vger.kernel.org
X-Gm-Message-State: AFuF++nsQA6Z+j2pmbk3oi7v5+Q4v5zcukWKKGUgLM4kJygjfjM3vZlm
	Lsf55G128dKxyRfCvjKRkmI2RltFMQvPAZQWtudEG6jDIOFhsYTh13KnzJkt+uOEnUwBU7mC4vN
	7PZZdb+0HY6im7+Q0/q7EmedrbsQbIG0r/9bcVBkgkre/11bNPSqy9hdGmXUWac/c
X-Gm-Gg: AYBFou0+gYCdF/i6hL7yjypcW9tInRacNwSdLP6ktGGVf1lTealsxteW8fJA0kAQN94
	38l6I3haV+Vy1MM6Yd9pdMkBPnEclzGmqKbnLxnBLObowdKKy6Exo5axKZ3gQ4oSDOogzSkA2M4
	Fe+y5pvPxPzCU/oYB3neRK+wnr+y9IUUFv2ppX5gduItRuf3qhBH/F5nxpoLPB8iHaFVHXByZOQ
	aVZbbdzSIEwoZpZnO0YRl/Eni7fXhdm6CdRIYCYt90+1B930LIk8XM9s52Q3LSdMElkDcNBiITL
	YVOvzH3jDVwhvkjPZEp3Fh8EHEBOBjOXnfg77tIJ+cQc7q25U4yQYW67UeWycw8d6C1rlnhMANm
	uouw8h5F8jJx82Ua/pYSyNfS5v6AlC+jYW4tIHEfmZg==
X-Received: by 2002:a17:902:ce81:b0:2d8:d4ce:9f33 with SMTP id d9443c01a7336-2d8d4cea3bdmr177903315ad.17.1788123743756;
        Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2d8:d4ce:9f33 with SMTP id d9443c01a7336-2d8d4cea3bdmr177902925ad.17.1788123743285;
        Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:04 +0000
Subject: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=1050;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=w4b9VTbExigoHXMmj2K30BvMI7E42FRXJyk9Y5xpS+g=;
 b=OUgfAQE0wG1HTw6RQKQLfu8Q4bTK9xua0eGtRhleYT4wvh9dup99rfGgQClqji4DTBfLB1BS0
 Vxjow8QnltPBdPUsmj1hUbibTuqpo8TS0w7upPjZUlgoNC4ZdGNWev8
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: zAuBqfBv3fHrYNHBNhXHPyRWcZNW_FTf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfXxtOY+hXGxTYe
 P01roT7vKLR5cfwpK7PBHA2huJshe8C0VZ3dAtlQIfEztKvo/p3rZKc6CiA/bnAT8q0Z2HaVcd/
 WPXOUD2714jmeu4eShRKrIfgb/psJj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfXy5WSvkzYGujj
 Omxkp3bzVJ5wwAskgo+rw8agB/yYivIdwVOz5ggBymCQz0lX8MJbsSq31U7GebH4ZoK2EM7i4VF
 hAteAkGwYEmGOC/gvdcpG/3hIJeBy2zNfnEQ5mJa+5vrFKh7QnuSZ36tg26lxUBo+AkK1DTTkCm
 2sC+8sRQ4CK2Uh4JdNUo3kXyXuovXRFnhjsCIcZpwlwxTKa1J9c7ts6vYbbPLXd7h3fIM+M7hY5
 VSoBMGLVFw8VEiHe5XGuABvZfLP2xLcqr2ZgGF/vNwH4By8OUEvbf/VrqdPLKr/HZE7qxVmLtaU
 TnVM8NzeDC44mO6k+v/lTNfWS6IQ2kFBp9apuZTN/gJ8ASv5LTihZTRzQ6R7VPLhih7JBFZg+H/
 sv4GBNs1TXtB6xDeSH727Z6YM2UDvsmu5k2iQ4LuODUWP+hFL1nw4XGY1I5mYubZ8ySSEjBIgHJ
 uEwdhHfIQTGoa/R1SMQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a949a60 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dOedmflVD102KoYFdoYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zAuBqfBv3fHrYNHBNhXHPyRWcZNW_FTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300184

All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
measuring temperature across the system.

Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
enable these use cases.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..08ff68643e21 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
@@ -1699,6 +1700,7 @@ CONFIG_MEDIATEK_MT6359_AUXADC=m
 CONFIG_MEDIATEK_MT6577_AUXADC=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
+CONFIG_QCOM_SPMI_ADC5_GEN3=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
 CONFIG_RZT2H_ADC=m

-- 
2.55.0

