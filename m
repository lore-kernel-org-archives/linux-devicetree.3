Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836A375F81
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306549; cv=none; b=C81kaYkglBbGdSyznSahPCaOWReuCCV3rvc3dKTDhm12WXxArkilHinaVSJ2TqwW+4Uu+9jvN7fc5UZHd0RZ998eU3VfUQPFoZUCCbasP+d7FAZHSiIG7WhqPV7kzwqooi6Mdhfp+c2OBeoabmpWay5cr2bDBI2p5g+VEglOmBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306549; c=relaxed/simple;
	bh=iS0+HvRPMnjaMBIrBnifaAZYp0yH+UUeOB7gtsGay44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lGCK9UD7sRmgh8EvKxyvrs1fMHRP1EdbGgCwEH2gvatI6qIKlb7unLX3ew8vGcaPgZYLQBrgeRN46CNg6UWz5P07RTLBgGDq2rikPk1wkjM/IjrMkuF+Dij/FCOLOcYPUbIeAICSr9aKHZbFhbkuk9H4CzNVL64O4dCCCQ22URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYv5r7tB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i04nxAFv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYv5r7tB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i04nxAFv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9FD43974635
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C+Z6FeCC4nB3+cJ6p8StuQ
	NkGv86+RFH84uiGZyNiQA=; b=UYv5r7tBNQgTSSV196S3qJk5x5WPRoq92lhkBw
	f9+eckEVzDo0slwXABhzNjupK2uC1isRclH4rLLJRsedtgjLdyeg1z96Rteq/NzP
	WDm0HY75zv0hJYhqB2hndnfDClQC/6DaUywvv70UaJqy++W2GygYjLbpOyr+AKPA
	G5+G6S+iRAH/HXja1Bz3xsuoPZarNMcqJfyCzYhusPr5kwyI8GzAOWxdqBcahe9R
	dru/FTuNR2c2NiP+0BDfg63I9fxEixNwM2TVCTWulcSkUVxztGf6wgiQ/o6I2Bfq
	W8O0JHksA4GW4OGNstWaRSYS20stWgSEhA1HH1uRk5FkGBBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkjbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:15:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so30297651cf.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306546; x=1786911346; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=i04nxAFvLuF2ZOANVQ3qhlBXpATuHdVqQij8TgqUBcTKgB4c20zOhAaj3ly89bkpg+
         U6LTYq7ikWhOuT/FobSc37mLAZDrMIQm+ur8RCN15lKIwbjlOrJyLZQen67tqdHerP5D
         VjBOltpf1CVgoXlSz4TDfpRiXGb8D02iPIsV9ojGghQuo4ZnMRu6zo01Pc82lp/a/wIc
         4919ZGE4jFGcnHq/izAtvXMgyjGfuV/zNfu7ggG0wltHO2pO9cjgj7sh2uqa99QQcsNy
         tbFhEApsmsSp2qdqabxrXQh668CkfdfpUg1PKFms6sVo62D2H7OarRrLw8HF6SKdPcgI
         TkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306546; x=1786911346;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=MjDtyO+dhPCf0IONRz2r4SxVyNtPBwvSAIoWky1uSuGhJ9wF4dceu6+d6mQblZ2/Ed
         eN7Jf/V5bZxha97LBriOMRpo8p8kZna1vLFSAOmR0H+UsBEQcKI6G913Vbe3Cr4uCzzM
         qBpEH8hO5n8jgQZZ9I5eu0J9dhsKQAbbwLbuLRgKL46YWUQ0ttAFXVUe9ttlp7B+wghP
         YdSgWqjKUvF9TMINIY4LUEqrmviYeWE8l2wiiqdAqvMFS7fFpqhwtaJpwENXrB2kiw6e
         VXvEBlhdi03ZDxFRzEankkeeks/4li0TYz0kkacFywV5Of7vMlHr4dGuQOcQmKC+ccKu
         z+ug==
X-Forwarded-Encrypted: i=1; AHgh+Rot4h9WiAEPgsK7kMW00TADL7tr9FKtpnXNRrt2r3hqGpKSSOzB+/diRPbmo9Nr7UIV3TSwQ2P0OguH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpeHNhUg4pQAT4lX1kXcuE4/agjNKSPq08PThWxgcNjiKjfsu
	0Y3iUDRy+iHgOAWlx2J7AZfJPeGpKPXi/rsnYlJOZh/COkQpnVG93a/3+53BnT1D6S7muLlX4ij
	z9s4WvVrNI+yJ1b8tEj5UGSOyJV0nRuE0MQ3201zaL/RuuyK/8Qvp0Mh/C3NlSydO
X-Gm-Gg: AR+sD12COPhzVZe848hlhbM0AlOXJMiWyxae1xivtTZ6DkNX3IlDVl6PyhpLM+q5Axp
	EeYSgOfaj8ujn7pl0LAPhIsap8GYNmtLSYvsfu6/rZoQMqIzb2bw5ZYHwu3VrL4CNDkRvV4Jibw
	j+OpevbdyjzDEjXHt8MfcVa/7lOjJCIlTZrXL/ldGdMNriH1fHDJ5RofBrP5z807UaWl4VvwU/G
	1ysoCx+miraOSeFZ/gvaujE8CW51iVD8xui5Ktg1YHsRHq+OdzXSI3J73BEbUxW3qCvh4sXzsi0
	bhxH1cnn2Ngny2Qs9Isq2g+/DzTVJcdTchTjJ2yRbmubsI/QFuvKhm6kYOFkfJLxJUyXKU8EFbI
	ZF2HqKfXxZ+pVZJ71DSn49M+xE0Zq4yR3UEKBMNv9NRxhVOnPeXasB4laLoH7kw5902Dt5iq81U
	wIxTWe8mtgYycjyg==
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44062181cf.16.1786306545978;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44061871cf.16.1786306545490;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Date: Sun, 09 Aug 2026 23:15:39 +0300
Message-Id: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvfeGoC/yXMQQqDMBBA0avIrB1IQtpqryIuoo7tFEYlY0QQ7
 960Lt/i/wOUIpPCszgg0sbK85RhywL6d5hehDxkgzPubipTo6hU9cMjzyIJ06JrpCBove8suWB
 vo4EcL5FG3v/jpr2sqftQv/5ucJ5fM3fzfXoAAAA=
X-Change-ID: 20260809-msm8974-iommu-upstream-144b1e2a15f0
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iS0+HvRPMnjaMBIrBnifaAZYp0yH+UUeOB7gtsGay44=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/tOrgOI16LA45x/Ox0EJO6o6/tsToKA7nIH
 +rrs2dtFRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7QAKCRCLPIo+Aiko
 1TMTB/4rwEYJgew1e/uJmyrWp2cbYPFOFfOla5icjTzj9aO6/oWaxAgCvwjZE014WwleQQm3jWB
 /XXpBv143pWAnVsh8+QfyP6ZjyRTxfUuW8z7sdtfRUF2iyy6daa0UihSiv52mJFAZD0ihKeC79S
 C7BpuFB8+kq2hin2ZTcB7zmW76hN7+QaT0XqR5dBAtZJGGDO+vFCtJax1FE3cAQylv5Hs73qP98
 O/48zADmykv0wof7cpT1Og+qk/6Q6GJyT/pAQh9ij0T6cOBqx7tYP8rC79viohoMR1vngadtEtb
 FjKGLMxlcQryWwu63c7cPxPXVV7g5e4bfjfqD2wl5y8z5sg3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX/ztguWrh26U9
 pAFp/7LIXqZouio5enM1nG8MKMlxeu1wG8PtU507ZG17hb/1Ttrjb8KMJ2BbRqB/NrfBH0aDxT9
 9ZNrK8USJaJUlXy3xodhtHxXTfKN46I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX4mvPe+mB+0Qq
 z9PSh3CfBttLGMvILBDWjLMX8wJf1+jywFaOf0E6o/OLHbIx74ThMLWs27Gru+5Gqswsnm3QEM4
 mUwqDvpcm7mbaX93zfq0TdVI6aUZeHSW+HBfDx6r3aiDrU+kHWzumfj0WMD20jLVXPAUpbR9a7x
 9Lp3PnSDM1F0HiQBTyQSoSCtVzZ2waNNyYQHjsEabA8gaEEjOmIsk6sc6pZXZtW2vlrz16PrDWq
 6b5R0cL5KI2J4b0CAp2H+cQ/bunWTvtenzv19YLGj+8ej9kvvTK/uUu2l10MfaHWCYkww4VPbtt
 SZs/rO5WRZnP2a3JoOW1NHzn1JGe+pL/kSKbjGx52qdeRVUEwYXzFTiEWnYdEO7Z2cJT14H5825
 HMjBYGh5HTlSge7ELs+36BiSoDeCj6CW5KUvTDTa2cKWNY8qocBjRKtiQKr1SquMACHsjA5lrwK
 pjCBDz0DrD3uvVsxMDA==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78dff3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=u2vn49mHtsTZZS3No3cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: iwsgHci1Bhum2zyAyQ-ycnmPomvrXgwn
X-Proofpoint-GUID: iwsgHci1Bhum2zyAyQ-ycnmPomvrXgwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
spec, however they differ from other Qualcomm platforms in the
implementation-specific registers and also in interaction with TZ.
Venus, MDP and VFE SMMUs are secured and require programming only of
CBs, while GPU and JPEG require full programming.

This series skips IOMMUs which can't be tested right now (VFE and JPEG),
and adds only MDP, GPU and Venus (although untested, it is required for
display to work) SMMU instances.

Note, to get display to work properly one fix is necessary, [1]

[1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
      iommu: arm-smmu: add global register definitions used by the QSMMU
      iommu: qcom_iommu: extract context bank programming into a helper
      iommu: qcom_iommu: support the short-descriptor pagetable format
      iommu: qcom_iommu: handle the SMMU global register space
      iommu: qcom_iommu: support non-TZ-managed instances
      iommu: qcom_iommu: restore context bank state after power collapse
      iommu: qcom_iommu: halt the micro-MMU while programming context banks
      iommu: qcom_iommu: allow faulting transactions to terminate
      iommu: qcom_iommu: program BFP (prefetch) settings
      iommu: qcom_iommu: add the MSM8974 instances
      ARM: dts: qcom: msm8974: add the IOMMUs

 .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
 drivers/iommu/arm/Kconfig                          |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++++++--
 5 files changed, 517 insertions(+), 40 deletions(-)
---
base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0

Best regards,
--  
With best wishes
Dmitry

