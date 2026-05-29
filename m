Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F2343884
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064620; cv=none; b=BKSBeTr4Ow/HsY6hdcdMEbkat/tNwZ0HHLkvQHIfe8kfao+/4XEjIO6OsCKTre+KwtZLhjNTZJZ+Th41ACBuhl/54sThMROU+uzdmvrCDzRWL5LcGD84c4f4zAFFf1sGPKmgAY0jqdxwmIx7mb06LXjbP0kq8njSXRgny5zwi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064620; c=relaxed/simple;
	bh=4m/P4aKCqww4XSbIOnY7M5yOKITBB5TUbfT7Znanlmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8PdWdyTxAgQ8ua4ZQcXBP+GE3OuthIIu7gnG+HQs4FEb/YL+Sj9ITIxbHxsvicATYQ5HGykbveNuaisc2I54V9BguUrl/JhtVoG8MV0doB7mX48SI+xC23k3AQCBfQVD7AeZUkLWpJSL1i5WMBCJubm8adxFecC7eksbue/iCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVU35zdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjwsux47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVU35zdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjwsux47"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLBFL3656454
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dQr3wcVcNRFl/VYU+7/Fxg
	ybHOtzvUmzx4XQAsVMcVY=; b=UVU35zdO3ww/CY71rth0aSfvZGJQXZ4cSUK1Yx
	VOs+NUQrXJoZiSIAr4jEDzUkizUHh4sKSYPNjBm2fn8hyiR/Ls+qtiVQ1cK7/SaC
	AwhPKlA4aE1NA+dmZ49cmIj+yjnT/OfFQbsEnJBYAjx1xhJBRh+h83juTBtoOZLw
	FOajHTvJDkX95lKX5YQU/QIxS303DdUbG/LNyrZdpEL0ScVUEaFL9Y2n56F7xz6w
	5nzbiuwET8tiPlrUr0ur0+33GgV9Ycpbn0XD4aQiaqpMUO4GF+8yCor+TnqzffSo
	9gAwKt1OdWJsjvF0Sd+FqagCe90zBvzk5Hvu60vk+Zmf292w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5vmkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so152325955ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064617; x=1780669417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQr3wcVcNRFl/VYU+7/FxgybHOtzvUmzx4XQAsVMcVY=;
        b=kjwsux47GHO+b2kFg8Cdf/YMj4Zne/mlmwX49Ug6juFb9bLB0L5IwBYyiuoYgDxxdW
         ZyD3DTg/+HgcFZiZL5wZU0VjhSe+Jce2rIBzlLhwLa0LCeycg6wND9q6fUsIohgGBdHb
         ZFxmy2Q6YoreIfz6cmdsjY0dw0FBlxX9vx4x9ckyVRh9g9oL72mYALRwwG0l6z6juBB4
         0r6OamiuWDzFJ5PFLMcPZtJg3RatIQ/SQGHcYFcXv5dyUGuasNT8BPSazv3YbOoCORRn
         g70Ea/q3qAZigTWyMVb4XJozQv/EMQ/qmXnpC26GOTE+p6P4Pb6bdJubZvk6kqNbhZ2A
         4dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064617; x=1780669417;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQr3wcVcNRFl/VYU+7/FxgybHOtzvUmzx4XQAsVMcVY=;
        b=lm2jZENzvJMbOKsdfoElYUh9cUya3H85DqKNJze2Ii5ChHIBbtw0MuuF7738jfJsXe
         7Wh44vsHbc0bkBsg0yUPWdyQxQJk9uVcwdD3Mqc0zBgPIhKd7fTCQKWUEl8h14Xqn6/G
         0IEgwQFMphIXw3CMFYxYo645jG+PPIhRK7fwHJaEmA65Nlun/NIh38bbT3C3pPIs1kfa
         N7uCE2syuQ0tpMOnvWbbGoXMOdasD8f8EF0L/cBZaTDj6fOPN/4m/n7A5NQ7PMJnPPM0
         Tyt0dwIoDhkjknG6vVUXmAXd0/x7y7a3cBL8Ov6/lL4C0l3HeWQifGXsux2BXoOLwsfn
         jTBw==
X-Forwarded-Encrypted: i=1; AFNElJ916XrXKtB6Hnf5yAl2rpJgpAWANTRjlJOW3RL7s6aN2kn+6L2tVkDN35KtYqyVYNB3cltxJo+/15sz@vger.kernel.org
X-Gm-Message-State: AOJu0YzcNBKjfoH8pl2OaLaz7/5y6ndkGGt/UuiiMc3NZuXTQtkqvgUz
	4TYBagoBtboEiyoR+Vp4ONXQxQL6YRJOvv9BtGbb8hORdBlZGM+wfA3Um6Itl0Fe+lQypfqEZRZ
	ooNa+UrDpRrszORwUVaPycGI0UL8GzcRiW44hFELV5p6sbVAjZhpZAHvNk70I1y25ZtK1njTeR7
	0=
X-Gm-Gg: Acq92OHWRRdLEWN/EToHsTCpljV3UN39l7MCLDGTwhOo0a3Gcs24Pzc4Mlcesqh+z9J
	5j/B65GPQd+v7PxUZxsQEynfTlBZdMTpR1Z9hbA/Q/+iKfWy0VNJz/AVwtbUxN3aIzeGG63rA4Z
	4QUo9Jej+n4QkHAxkqAR2B+CVU4WjiZs7zPq3YUSH9aJfG7v+yw31hMiUVL377M8JsskSmr+vRZ
	jkjZUVEdBu3inFOjVyTFaT5pzSl8i4Y3Q9nFRT+v+8Gixk2SOV/IRbsv4CuI92XjVfcVboSY7g1
	sSX7za7Uu4aPtawazVB5RzUjf5ra91quJw2U++9zi2K8LfBZLOpr3SQS/EY24S1cVuEAU/yIQKS
	AgGvErJpccNE+k718O6OsXz02Ijvu3QdVebpscm/F571J9ZjN0rt5QzaW1MIf90MyscpI
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr819565ad.11.1780064616600;
        Fri, 29 May 2026 07:23:36 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr818625ad.11.1780064615951;
        Fri, 29 May 2026 07:23:35 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:35 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
Date: Fri, 29 May 2026 19:53:10 +0530
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6hGWoC/5WNUQ6CMBBEr0L67ZK2BgS/vIchZC1baQSKXSQSw
 t2teAJ/JnmTybxVMAVHLM7JKgLNjp0fIuhDIkyLw53ANZGFljqXmS5hZONqXrgOxDRBM8Fvx2B
 9gBEf2CGgLK2RpLHAQsSrMZB1711zrSK3jicflt06q2/7p2BWIOFkjlrlythM3i6eOX2+sDO+7
 9MYotq27QPIRQkE3wAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: iB-yvIDLvWV2u7kZZbuYSLtRSDMEMu5u
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a19a169 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=duSgcVyVFfa5pOUly18A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: iB-yvIDLvWV2u7kZZbuYSLtRSDMEMu5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX6UEaPG+iVkrL
 sw2FgwU747DyZsUfdtrl6jjPO64slN1WuCa7xyxKwroo/eLu8r1ZPCA6inroH5iRKSKf06vy967
 bU1wACAc+wLKu8U7oHyJb+qgFXyPV5hziOkdQWj6Hzc9c/nBgzt1qW9c3feMNODfNgNXNMs6vrx
 ZyADEgAWKr4xNKqspouKl18w9xfgvqqhTpCJnC5XbnGXbbft5UxrxCRtjUUjYyMVOHkGQG5iHcl
 s94TvPz42bgvoNcwOLv9niCp+uZCOqYzbqbvFWQX1GbC9IYIyisUIzRZfcyr7bA2+S4OSNQEti6
 iFqjIn+k2A2MgNXJzr9R13nPw4rQFxf6mVLnaKbBDepuHSZPrz/h0RqZfDZziJKwXFWiVH2hrh0
 dGP/ZBOsIMRkjEzb6iuOyrYcfW5hXuv/ImsKhH4QDLw82FCDDqcdy5wSrLk1kKCU4Ko2ZnDht5T
 HtRTV8SIUYw8J7JAz0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290144

Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
kaanapali based boards.

These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v2:
- Fixed subject lines.
- Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com

---
Anurag Pateriya (1):
      arm64: dts: qcom: sm8750: add reboot-mode support

Xin Liu (1):
      arm64: dts: qcom: kaanapali: add reboot-mode support

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
 6 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

