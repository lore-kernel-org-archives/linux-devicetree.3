Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212938CFE1
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119587; cv=none; b=sfz7vyAFkmPVIF8YZlAUFYGfZxq5uEIW6yvbPZAwZkO3Ha4Z7SnpTDWpKT5aAfswNT7mfk9z4vZz0oCjEfNmp/N41eduuSAdXIIaNZEqrTCh0/YpnKyT5KU0GrdK3H/+iQKS8CuNm1NHu1SNUjKm26Vz4LlT95xgVgQ2dXkXZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119587; c=relaxed/simple;
	bh=A3670cG5pqWhdM+3g7uDH/kQDG79YTkWX2wDkBAkcsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bqXjU6mE1laNToCo0//GKpP1nRdf8APUUwg5xV/0gRBda5s+syIlqzXszWDZr8FYsKK93nc++cZUJ96rxMK3LGXP1iVThx87cSvOeQTGbBxIgkwSP15ne/93CBLysXgL6UZ0I38wGkegEvcJXpSH8WKTmPQeqpZri0fwg0DTbZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+wF5XTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWB/SVWW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+wF5XTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWB/SVWW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kgE43366302
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B/U7CAw0STdy1SmtzubC/sAJKFjxf4bCxFS
	FnjNHPCY=; b=n+wF5XTIrZ+1D7pGljJ9uDrnMXx1wkjjkeHp/QEjQTZTV/8TW1S
	tYKfgM39vYVUKBeMbqFGX/hLVImJQShG5zrKiXLKLrdFygpd63Uey3PrpOkPl1re
	Pgy97mEfDGNsj3AOpFP3GL31W/uI4h6hiieeo4Spt8UedN+Tf1+6UIlnigIoyuyc
	cta94oJcSYwqSGp3xg7IaUkMbdlvCIwSLF63eWmmVMAT5eYKq6NGLFwMcE7/jCOO
	tGfb/uv+DROik4uc89p+LnpM4uUZiHYQ0tO3tOXuIKVWO/RkuGILa2+QEcNTg+Ag
	ChVYi1ql7pSRT9oHbML2YOl0d5g7Nfe+pzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2b68j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:39:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so22237355ad.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789119583; x=1789724383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/U7CAw0STdy1SmtzubC/sAJKFjxf4bCxFSFnjNHPCY=;
        b=iWB/SVWWxwggMKTh2STJzwdPcBgbilw1PQPJqJjInXuAIkYPCZiLD7t23BMOKrqT+V
         HRZeiYCZFonEStwWvtMav5YsleQ9pApgujflXUD1ZIitkr01u9nd9iODvztOOZqpvEa/
         aPx2osw7jBG0pTpHpvMgrmwSOcGAgSphBUTTaD0rMBQ2bAz5fMjbmeNWsJS3ou67YljJ
         jE5a7Wl7q7BcZRm3exLfqkIGp8wGA92xYrZNf2rhpD7WYoTDympPb04RuG/rpqsyjhsf
         9ZVF5lEbdptAaZbbV3AOxQJyDqW2zLYy+Hfwz8swAM4Fj54L8C9HmIkMMsMwqeDBp2sE
         xeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119583; x=1789724383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/U7CAw0STdy1SmtzubC/sAJKFjxf4bCxFSFnjNHPCY=;
        b=RDsBuo6ixzu6FZMDEmOvqmukXkdSU8hNb5LAip7ZCL6zf/WkG7/aLcmUsTdjV+PIjq
         dkA+mK/+hIrQcqhWVNu48FKZAaRSF8T9hueHLLf+2ZkTfgv5ABWkEHleoU2DgbHaQLWD
         e8l2zjamdKyoM9tDOuBjiOHbNpt5BDTylF+KPWPcgRyHgf0tLIT/UCro3i3QnzocC3Yc
         IsJ3/xsY2qtQeAnch1CxfMUK6O/DEAnvvDP4Jklb6SnKNsw48T7sRZNlyCPyW0GXwVOq
         cJMV7kUR8kHIsHhDH9Et0wywl0+93OYphUvR4QAk2nqZNX9EvPYqTKMHUx1ae8KKVcvF
         EsHA==
X-Forwarded-Encrypted: i=1; AKwUvBwRRg7xUScYdViQF0vfyhlvZAa4huecunTrpegtmAkhbWSisME7qoWl5lvIAa3zxRmQI3xOC1HehUO0@vger.kernel.org
X-Gm-Message-State: AFuF++kzVgyh06DELelU/0xAPG0i6QcnBXU/BO54xk3c8vG8elqe6Ghc
	axbpdPGp0eDPFX+2dKV51hkrg8Pv/OO6dRmYlPk+jxukWiX/k60L4W1EX6jjEeuyABBEvrzT3Y1
	gpTn0jiWyR3FVt+2vEF1crrXZ5HMQjBc2v0DwdWQx0TvBeKwpOw8uQJLhbII475Ir
X-Gm-Gg: AYBFou3Yu9p7SplvvNmuPFlRUoGmqsEi4m4DDdF15KdRKuBf9NbIiHcpD6iILWuM2fJ
	mLkfYOlYATXPcgL0kgeOL98OfFuB+DOpBHZpPIUDv3Ftm31tus1OBysvqqfdBWRi5uwdeJJEU5d
	bzNfq7py7vTCmNYI78sgVRruUXNrfQkQkmnyNG7ferKG27wk7fgl46I0XUrm0PGMZGFBSD23c0G
	+3Nz5OVfDshPQm8kH27mrMIRwXePPNIv1Dbd5s1q58zHa1EjGD45vfMNHWc096wsU86aFoU1PXF
	iOC2bgwzN4mrSnuje4js4T1V7GgxRdZ0Uw1q0cxn6pi1dnus3s49X9/mAKa3j6eKvjej+iFAG5m
	YjHFpFSpwI5XrL4RcV6mSR0zXQeALtV+qji4=
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr11523618a91.8.1789119582953;
        Fri, 11 Sep 2026 02:39:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr11523568a91.8.1789119582489;
        Fri, 11 Sep 2026 02:39:42 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm5549984eec.24.2026.09.11.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:39:42 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Shikra SD Card support
Date: Fri, 11 Sep 2026 15:09:30 +0530
Message-Id: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3cc60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LG_lQ-h6YDT1eqFI4YwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MsRR_RFtInGD4phw1DJq7J89_QRloY4a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfX7T75vyNowZw0
 C9q7BogthyeCsdzNAY6q733If0E1vnetmyambRKZ4mNZHB0reYXvExLUbi+dt6Wm2L2OD/VPDJ7
 nM0glh1m/YjGHw1SeT8lSOjBSbPArJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfXyJi6Y6vnG5mD
 0DVyPofdCbUCp20AGHRZk+0RZDjkSf0xgAVzMp/u3w8T2wMRep7DM3nwViXXIy3qDOv5GhGguhu
 +rifD3tE7Mqq7UydCJFH+EhA6j/rqiGRB/algJz5k6MyXFZk7JLShloPINCxx8dM5o1qpPxekYC
 PyYtNhB3NovjtvFpgUvaUZwnvtIO0Vqs1OLclNfpXfA8ALN3UmeZLoA0kBAtK9+vP963eYIWN00
 uLrKafduwX9/KyxCxWR18M5SGWjC47CW/vBBJii9gq8bImGgXoLPPZzkzR8ocRbXsDO4BZgZTvk
 72fp3cTqv46ncdf3YBFBLiQdqOeeX0A3zLSQKQjf4hdQO/tz3rcEoUBZSHWls52Xm7AxguFZhVH
 fF1YGzgo5AlJfICkULlmc4OAT0r6YVCOLE66LCehaMiq0XcXwa66OohZPG4y0vuTbgwe1t+amen
 n5J+PpwFAOu1x7G3s3Q==
X-Proofpoint-ORIG-GUID: MsRR_RFtInGD4phw1DJq7J89_QRloY4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110134

This is v5 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v5:
- Rebased on top of latest linux-next
- Fix interrupts-cells to 4 for sdhc_2 (sashiko-bot)
- Moved gpio include directive into shikra-evk.dtsi (sashiko-bot)
- Link to v4: https://lore.kernel.org/all/20260804122054.3462145-1-monish.chunara@oss.qualcomm.com/

Changes in v4:
- Rebase on latest code base
- Collect Reviewed-by tags (Konrad)
- Drop the dependency link - since all base changes are merged
- Link to v3: https://lore.kernel.org/all/20260702073354.3641966-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Padded the address part of the reg property in the sdhc_2 node to
  8 hex digits with leading zeroes for consistency with other nodes
  in the file
- Moved the common sdhc_2 properties to shikra-evk DT file
- Link to v2: https://lore.kernel.org/all/20260630165700.1886608-1-monish.chunara@oss.qualcomm.com

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 5 files changed, 135 insertions(+)

--
2.34.1

--- b4-submit-tracking ---
{
  "series": {
    "revision": 5,
    "change-id": "20260911-shikra-sd-card-61d428639de0",
    "prefixes": [],
    "from-thread": "20260804122054.3462145-1-monish.chunara@oss.qualcomm.com"
  }
}
-- 
2.34.1

