Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297943AF66C
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260009; cv=none; b=jugVb3SRZ4AYmxCyHJ6PIJZPrs960CgAzp9Qd1vJQLfXDHxCHOuo3bqMuiHdYSYWtPfIXoCutfvVUMtlc4ubNObRFDP5tDKmP80StSEY3xtJGztNA2MvFCSNaMRWQoNSlEd844KKX2pnVb/58cVs1n13YaTk9AIZKbgW1wYfoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260009; c=relaxed/simple;
	bh=j4RQSX4jl5tgcvA7X7wtjdziWOCRMMs7pw/KnDPtK00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BPBK9uJywQOXKAaocrAAGatoBag6hHvsSpBWZ1+3CESNqlyVR1UExOyroT5i4Pdj4vuXo5vBePpNpEE2MvG5R7qxqH3WipXrU3BliggaDwT7QkGjraoZ0/Fil9oz106b9A30r97h1x+uKqVbQom3ngqFp0jFo6hFfwIv7OmjAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2zFFI3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlQvfBqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2zFFI3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlQvfBqv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8lA5D731084
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p3SZZI41zCDljAg1pMfpBt
	kuAqKKIYM1Vlgmt4zsMHY=; b=j2zFFI3xoxFWSZEbNA/ZqfDwxhTXRFz7YhdADu
	KTS4dSpRTvDmsG2pJv5UaeVI2KQLskg/3cde/QQVtZCbu+EdERiX91iyz0TP2Jn+
	HVJWFq7Oc2I1lXPWPGB17gi4iGcOBLFtO3j+CLoaJ4r1O60o9tlUA9PYSp+o/tAq
	zOP/ApH8z1dKtdcNC90NuhU+3aM4EnyiP5IwS47Gehb0qmJu7p7r/evTy9LceQSY
	/70hCncal9tTHA3B9DhmnK4xCUKuqBA7jW5OylD4v9uFBfS7aZFuuTiiRDpApRNK
	Ge3dvnZWUhOHDe5DqlS3p3EscnlqMg6zGAGtH3GgsUM8lcXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubwsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f308d385bso1895222b3a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260006; x=1776864806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3SZZI41zCDljAg1pMfpBtkuAqKKIYM1Vlgmt4zsMHY=;
        b=hlQvfBqvaoCmZvf95grFstWCTdCRcG/ETCQj8/6u7ZSo1yyBSR+87Nd3bP8WqxlrAM
         xn0g1TUal66GlnFhjHaRJI0joC/tBkjirgv+bDcTMdUfOXbFTaRkqhzNvTa3gxIkQUcL
         pFfejjpPQ6GtcvkAwBxSea0VQ8oycCw7iOoYZy2ask1M3/Ae40BROplBjEatSKIsdCdS
         FsKEwDE5CoR3//WjXpAU7YJr2gb5krgM0ZbsZjkeHq2ofb4oWWiCwe2TC2uJPQwJDAYJ
         slDXWr9NasPRP7Pe3w7SHA6jFbH8cchpsxstZS9wXTCAjBopmgSdqEDdd0J2I+0BYkln
         Fb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260006; x=1776864806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3SZZI41zCDljAg1pMfpBtkuAqKKIYM1Vlgmt4zsMHY=;
        b=OVoepSWbatmYgudQ4O7VxWVlh05vspIg/jsv4zR1NJfVjHPBJ3AfK9wziXFFxi/PZj
         C42tY8U+OF5+srxcW2KTy2SdVrsWM/X2kXg/0zO6DaOJL7R5zBpw8rw+R20yka8cDBnB
         fAPou1/JBzy5sgl6LyFjm3NA72eJgPI+apCfqqbzqearJ1u/u5svwvMkU6lrW2btrZro
         8Zrlyg/wAnJQAJ1Rqba66IGyfi8yZtKdtHX9vviQs+DLSgUlKK1UHl9LYcsMa3jLpiKO
         vpv8sCjV8jFl8uEPPVOHGIHbO+YpUGouVXe6FppozL+nJhN8E6QpXBV0MMw/H1ulO0+R
         YKdg==
X-Forwarded-Encrypted: i=1; AFNElJ9NDfERngqQJ//nhCuDrzJxthpRbuaVgVFbAMstdN/CH3XFdsCmNXWPxKqYYgo6IamnV5CK2d5QZ3u9@vger.kernel.org
X-Gm-Message-State: AOJu0YxHlWy3tPVtSjLtdBwlPqNcsTYu33UVRbEz7BiOR9nxBhPk+DdT
	hAoTaPSOaFAKEAZ4/XCCSzVV6IartW012OsfFoqSfIYvajIhQyiSp96/393MjaedQp1NPt+Z60h
	tgIcvuaY+9Qq/J9JnE1F2OT95p+EC6jIpV8Gi3U8MunfXFNuO1U8Blxku7Q8yspj5
X-Gm-Gg: AeBDiesa8k9cDfHc4YDXiQTO60Q2lQxTMjtx0HQaGn21B5F9CHTeH7qeT/L5Dg3+nad
	oYM3+xc0FAVw5s+cAhOfv6qQwOG0GxxLhq4HBZVasinppsSGNao3ILtPQRhKo5RyoIXMDKwvRB1
	3BKPX57bFR9FPUFqJ9SKPKDKXNggux9pegvknkTBvRWsjjyY3mnNz5WMRLbdOJDQ7dJv0dJXiZr
	r+hoKFckf9YhlnKgV/crKSDsBktknTkhwFh8zPyAWWZEpadnjOccwYf7q0mEXpFuFUbgYbaMkIq
	CiE7ZRnDkXNSVNtY1jh/D3RwUBPEhTSRvAMSnLmOXXy+M2k7wTsLTcpnHik/tHZTs2jWHDQWWHx
	su4llGTXoPZKBxaaiDmy5X+fNG9nEbcm+xBRjpzmYWvmZD79rP/kCBNn14yvolF6aUmhYhKUsst
	EgVHA++FJglEl9kABKJ1gUG6jh0pxfqKAi1WmLufFHdJq2JJNehhMC5b5o
X-Received: by 2002:a05:6a00:4218:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f1f4378dbmr13170919b3a.3.1776260005730;
        Wed, 15 Apr 2026 06:33:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f1f4378dbmr13170887b3a.3.1776260005252;
        Wed, 15 Apr 2026 06:33:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Wed, 15 Apr 2026 19:03:15 +0530
Message-Id: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJuT32kC/0WNXQrCMBAGr1LybCA/TbS9ikjZbDcaaU1togjFu
 xut6NsOfDuzsERzoMTaamEz3UMK8VJAbiqGJ7gciYe+MFNCWaG14GG6NtaIzsWYuxy7dKJh4NI
 0Qm17U+8QWfmdZvLh8fHuDyunmzsT5rfsu5jpeivBvM7+vbZaa8r+ankYR65AIkFtPTayvcu3x
 UEijnEcQ24rsuTBoQCPIFS5ldXgwGjttekbIeUWnNppdng+X3RBUEH5AAAA
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=2207;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=j4RQSX4jl5tgcvA7X7wtjdziWOCRMMs7pw/KnDPtK00=;
 b=fE+pC5Svf7xG9In9cOGtvvMwqNJxK51fGOldCl0LSj5QHf0GHix1jmS2/k1cob8UmYjtmjy8s
 H+Hl6FXJd9iAVkU+/bMbVs5hXClkf4VbUaKhQzHdbr/2CJCiVNUR9Q+
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 3Je8aSs_Uw_38hggEV7wfdJfGcyy2hFH
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df93a6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX9U9jlJvcCSDm
 /pQMmOnoPWRJmI1cof+OQSdI5Sv6GVdLH4R1Bu2bTgDi5yM9956cNzwf6nPA+FaeddelFbxfF08
 pPSsxEIsJXaITB+E+IRim9JCqg2b544qczlQ8uBpidpcXXOrzB2X8ZU5ihm87sVgwmR02SufhQL
 RAKDq46d9eElbPpgJJUBGEoapu/Bj+so/4rweI4s9I7LcdwJYEpEzTI9MxZD00RdYksa/JQK6Yw
 vwqVXPlIkwr0Fdxd1uUyeWlhLOTqu4cXx3DCEsvQNz7Nc6mQHBAvdS9VPG7l5cNdHI5ArDiInaa
 YOntQqymKAdeAR/WzZ6Wasq4B3AC90gzPtuuhliI60NKplPHyqSHSF6mAYa7O3tJIESLYSaAmab
 evroW9JE6yVZHGcceMExRkNTgPQX+gUdTU+qd6enGGwJo9fWnvYmzVetoteNSnKxlo1Hkfgos1A
 97xTQmmwH+tDph43YJQ==
X-Proofpoint-GUID: 3Je8aSs_Uw_38hggEV7wfdJfGcyy2hFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
access points. This change adds minimal support required to boot the
IPQ9650 RDP488 board.

Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
configuration with four Cortex-A55 cores and one Cortex-A78 core, a
2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
an integrated CDSP for task offloading, enhanced PPE capabilities,
and DDR5 memory support.

More information can be found at the product page:
https://docs.qualcomm.com/doc/87-96766-1/87-96766-1_REV_AA_Qualcomm_Dragonwing_NPro_A8_Elite_Platform_Product_Brief.pdf

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (5):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
      arm64: defconfig: enable IPQ9650 RDP488 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  366 ++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3794 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  190 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  228 ++
 11 files changed, 4742 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc
prerequisite-change-id: 20260326-ipq9650_tlmm-2a1cea46fc91:v1
prerequisite-patch-id: 13d4c96c03378602b50fa7a976e57f97f960b018
prerequisite-patch-id: fcc2de8f1b615b06fe2e509bdcb1ffd719274dc6

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

