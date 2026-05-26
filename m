Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5D3FFAD9
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806558; cv=none; b=IvnTqbxrskTg8t4JmTcr2wj2RD3vgO6yzHMmqtmH9UUwsfhhJgwzWucmErdlt3NdXznJ80lhjqkC9JetWEPf99zXvkTbrHL46sa7g/humFbWKGwzs9KJhgp0C22Jx5iF5dMsxGQqGF7RYTRRpge60QfWy8mv9wafDUDYQR4igvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806558; c=relaxed/simple;
	bh=lWkUuj08lvraeSSyxOex2Hdt1a0/ULuWaFXQJiE4zls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW0VX6T+VU7aOQo4MNej+AZhorCW6LzDTFN9IlipBSkxszUZZ9qKQfGI1ohT3Reaq7Em5VWxQUM5hzrGhGQm95by460nlf7iVCFtxW9SEFDUrUcChMpnN1eZuKZg+1794w9l5zUk1S5663LrurEdXzer2g4x59iC0m03Y8GYVIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id8xhIpr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq6YWTNP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="id8xhIpr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq6YWTNP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEYAqx4030393
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=; b=id8xhIpr0lPQukpV
	WJswVOwAOr5F9LTpVLcbIs0I/1dzkuDWfSlWtyO4/Qdk6kuqsfe0KTji01h6fRpX
	aE0Up+qe1i943O7cQUG3TOE1hegqhm+dUtdJxz9x4mkr5t2z2he8DkYMOgOJ4E4d
	TPpcbPfd6FYs66V4tgZEHUmefs3BbVZVVX5J+gapLPVCeR8DmX5MssCXuWlOSPF5
	G0kG5taBkXVUvbcuX8PryRckr3rqp2VzOnSNJ4X4i2DhaVRNERJJk1zpiQB+6mss
	MeKeuRaz36WEpm4qawT6ZMaqiuVf+eZsKp0/RQ4pyLWbEyop1TKDvsvVQrdUsv/I
	GFhkXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddd7r1ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82894155ceso13753632a12.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806554; x=1780411354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=Dq6YWTNPMJkCvnWGvKpM/x1cssrT7v58YuEZYG/r5zKOwnHM+J6OrpHXLpD3Nlzznd
         sjhK9dkJyf9Dk5fPmQQ3eekozejYUp2creiyf1Id/Wb8ABSEpQazJDoD0LdPXM1zIGmh
         Sq1C8ti5QYdhBlnQmMBOrdYFdw5dGd/RSxQXpiq3tmpJlM+8fS8xR2ReykyPDGWba86x
         2CEQ4j+z6pICHswH6SeY5QBTzQHochCXIfYTvWku300kbscJGb/YSo7Dzppyl6C5S//L
         m+pUAyZxBz+ZbQfuFW4g2AOyj9LpTrbpAGfGjR9RYv8RUqtZvLjaGMy8GovIX2N2WdMg
         2N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806554; x=1780411354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=Yl5dcGjFdHOUkSq76cBY17sHTGiG2p5CrG76/Inx6RLo1ZhI+ag5RpS/RKkC+uQZsz
         kRUyZsm2T1qHiPLVrQQhSfRrgUWul/oANSN1JmqH4GCZK8+fVeIBy7O3IbZSdTG5/Zhn
         IDUxaRvc374+2oPDtzxSbttPhcucXhp8MmnsJlUh1n9Llv/wufkilFAFbnujXtXyZH1x
         t5Llz3FaQrhlkr2x4x9FZPBfZRvjUKna+UJr8cuJ91iyFJmW+ECmrO1vp6aEcEB9ShN7
         4/djyLxnAioXqG31K0KANZmD6ue4+Aac2UmqIewYttU8cveg8htoCDmf372oXKgPhnzu
         zdeA==
X-Forwarded-Encrypted: i=1; AFNElJ/0pRuobQN53PFr1pQpY8Hp4rq+WxVzd18GfJGUw6xNQj9uA84zWA7wMM1PyBaBHE2jHi8e6Nrv4ruH@vger.kernel.org
X-Gm-Message-State: AOJu0YyOLPB7Zg1Ri9ovbTs2P2QYnza0mbiAW40hnKgMc1vdozbMiyPU
	jt/RwS3CZ0b3MXvZei+Op/7IILlIp1RWHQjodznsOx8NzGN2tbqtUdzqywaIObwvBWcUyzNxat6
	1cdeXL9Q/Shdo4uLYEZ8xnOUcwObHhiIY7qvSdWs61XkS7AV6PL6Te2Z9YqH5EVTR
X-Gm-Gg: Acq92OFWRSvQ5WbBGfZIrliuPB0vpFVDx4CvQA/J1VaUJLmfAoAexQRDdS6DKvc08y2
	hvZupB0CDOQZRT/wyTo+qeC5Lc3WL4H1dltvd3G94cb+p2FvWNclqKLfuErm18ez3dJFGvs85Cr
	Ffe3YgmIuxT0zn6v+9CRi+z3pAHrSbI/SjhKUzNtZ25C3kYaoZTZoDBRXzAmiLAqw+ixLP+s/F6
	k7oL5/cs55O0CnwBnin5MNEzeuPJjT//Cc6Q1vJ6QFw/ay2zb9a5LWCwJkHLxSVUEErW7Zc09sT
	5p+PIJAvtKFbSe6y4zTwk07VJhJr6B+bM2/AQI1cL4QazFzPTQ8P4DKdKo908BJQcG+ahKqTaLN
	PdWHJKzHF/XUxMxSMRgVRyL++V1eUw2Kv7Q4P7hqezvuIsK9L+EYf
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443829b3a.10.1779806554411;
        Tue, 26 May 2026 07:42:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443777b3a.10.1779806553947;
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:06 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-5-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1074;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=lWkUuj08lvraeSSyxOex2Hdt1a0/ULuWaFXQJiE4zls=;
 b=mIdUsT0ginPBt0NEy5rr52A+F4ILAPui5UJEns91Xrujoak/KyGU2jmd3zW303drZHEnRi6ae
 ReKZYHSyJHRBGAYXCc6RUDVjmkYlFt0lVyd7y87izB/po3f0Nt9KRjj
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNSBTYWx0ZWRfX/X9vJqyWUjXx
 JbtYAU4HgAucw9/GCUGxZx7EvPVilSFqAJQYGLYd+S5pvLL0IINp4B+icwagoqh7BXjkOwAr+pr
 zvZOM7NfT19yFa/yLca5hojn7S3OuUhmhIMZUB0s7urHfo5k4BxgLPIzkpU4x4vCZZc0668+Fmi
 DNgvB1TdGMFBuIPZAnksDI4uHg6TxA2RTmiVMt9OEmgyBiHzpJvpmAzML/QuWz4nJ6gqnbJIwPu
 cjXCVCGk+JXgFrljE3/oyqspVaOFue0Pfz02B13Szi7n9dp7tnnuIxg6zF1X5URO5oHAPv4cMe5
 9x41zq+lv/5vUlJozmjKXghifzdd2a4snh6GcV9fjTnQor2SmmhN/wsdf7RqXKhh6muBXVkJGS9
 9vhsOYuqHhfjgrB9a7RJIE87as1hcfm3CiWL0oLHMlYo0pnAqvCTNb73EAPeHE1MK0wQ0PbXumJ
 BTImVtA52r37+0xw4yA==
X-Proofpoint-GUID: lSDGQJaoGLiyUUflMwh4DaJ09t3I3SXG
X-Authority-Analysis: v=2.4 cv=fKsJG5ae c=1 sm=1 tr=0 ts=6a15b15b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EzTgQT2ADBj4VUy-sZYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: lSDGQJaoGLiyUUflMwh4DaJ09t3I3SXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260125

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 2660c161c3d74f4002aebff40634509e885fb3b3..00183ed67ebf0645e1da0c4674248354fa2af941 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5088,6 +5088,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

