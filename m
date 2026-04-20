Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8837FF50
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665591; cv=none; b=J3zvhuouUIWU0rD8zIyfKmp0vqomWILvoJF5oohubGnDQ3u0yNTAHM0iby08JBFYFLYa5la6EKhX+PhsSc+m5uK0OZ5RZQqHD+HT+XzmmwJYGR2Zbohd/IGPEW+7FqVqIukdQ0rS6tJExSdOOZx9qltfCtnSHtSM8p8pvVVDaLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665591; c=relaxed/simple;
	bh=RM2c4wnHu2llAa0LGukFWmGGdf2Sq6KTH6ykg7vqkuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfjLO64Tq/JAn8VahRY0Ht43czrj6LIggZPQMBu5qZYuyypu3pxamWJcP0fDDPZfNZcv9ZbJ/unBeYIPKSpbcjd81nnKXFaoV/1ZkZjnOpCTKng8C/6AsSkrmIcIn1QwsdykeYI17/VKHAH6C3YdK2f0IKxhqewHRn/9F1XBUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLyU1kAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnz+CqcV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLyU1kAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnz+CqcV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JLcwJE256496
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iy+zbMbgWDve7zvxrXJ5iX
	qDOoDx1v+HHEDvyPa5CIY=; b=aLyU1kAncQHx2guNckOV/zjKDEGZi1+AyJpet1
	PflGzm1onD9aWnWbUUEjrYfiizMv80ZKFQbbLMeeQM7etWt0U3GWCsPCXJjkMWmJ
	dzxrlhXWtOLpJOGJuyGGyFLXRFQ2vobvuDe9n8+7Yy3HyHSwN+Bp+L1UZK918Arb
	hGezyC5yNBFCBz+cc/rgsUQuYHcIdVY81j8lqxCb2HKY0Sip0LSPpy3Zd6IDggZM
	4KvI52nICVHUj2Lj4FoGKZUHIWNKUPOzZq6472CbaH0J/0OJtCNLEZfuF2tlQo9U
	uLeasL5E2DcJZ7bGvoxil3eA8pyOfZZd9eAdX3TT2IsYvNAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynecn99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso3180612a12.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665587; x=1777270387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy+zbMbgWDve7zvxrXJ5iXqDOoDx1v+HHEDvyPa5CIY=;
        b=bnz+CqcVjwl3QbZnCNMOklCfcogKNawqIvnZbSk/oqRPNbrXdP945Bj/kGXx4Su+cQ
         88mmRD8MeWf9xmSmTVkUsThwHWwAhFXiFnMsumedSRs0mf9piIIRKBY1IXG10eVgow7U
         sM4dF/kZgk5pbRIodqHejA+YUTDv9Dr4ErBQC/N0QNJgEjC58Jc9jlr+OFB1YqzaQ0L/
         p900Gcm5RM82foGkAxClY/C2n/ZVs1ybOunxYRkjTEWDHlK03rp0wjmQMfUhANuDB1h1
         lZ6WMkYvhKy3/5Lot1T76ZSZXCf5xNFJpgTjJ1fDyZ9YztxFCq+MT8V7wi0czLEMt1sa
         5d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665587; x=1777270387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy+zbMbgWDve7zvxrXJ5iXqDOoDx1v+HHEDvyPa5CIY=;
        b=Ym5YN4mTD8WqDJTxqs5xkCrNemx/kZE/ARwUFD6U6eJCLAhoaqikJTa94EYSm2JTXA
         KT+ULLHp4BT0ML7uHCeVOfs2V6o6Fxh1hYP/jNljr6I9NkJvk2NlV3qahwGXWaPhX7IU
         OFH0u+alPx4OMiPfOfHuqK0rm+ZN31WqbsnexCwnnWpd2pKtsJ0RrhFvwyAS5VBF76d3
         GD8QVx7E8lC06W0go8p2/eDpxuXEgbL8mYhLO/uWwdqPnHu1hMNOl1YSsOrtbqEKx9Yb
         tQCF1/RMzaNCUCNrKfT/zCfgsnrykSzgjpH2E/tvDW1TqvQ4LKHAYYtykRbv8FolNGND
         qj/g==
X-Forwarded-Encrypted: i=1; AFNElJ/SPODalrsrmU2NIyuM+5vATnZFesu6kKJLWM08YCQINJC892FaAxmbzbWeuEE4FFC4Ia2qEqPCQclF@vger.kernel.org
X-Gm-Message-State: AOJu0YwvxFZ2KZdsCY/EdS4OTpGfDcjuXNHR8z0nw9A/og2gVvVMaQXe
	PK8GCSN3R2Ze7v6t3FIJpJwIvIx/lPhb4kSdC1jUc1cznveIlnxDCC4HbkYzVwNMSkcEi0HGzIz
	EMVlzo8wVwtbsmVCtYMVJlU4e6JgS/P7AM3Ko8meIFhuFbblPi/IVfAB7ZVzoF9ha
X-Gm-Gg: AeBDieuKDmhHc3crHNmU4J9nkFRSnyeB7+P4wnH06b+p7g/6JiFIATtaZSDo6dvTTHm
	Eol8RzFFOTV+PmWG3SX6xqjEBqxpBrcO+OCaMomSC86JMtQtjoqVYiiWfTvQyfvsRod7FFAtOIc
	MXiLhmpoxPAtJlitu/Ee35fYZNHsLGsdMMpqJTRUwcMtHx101JfwZ86TraR3a6Jv3dnzNlSVmB3
	eHNF5bbtKEIE2mzLOSUn8UQv4YMT267JPWcaKYigBhcmjBPMdmuYnNlMcGI3lIpCSaEWvS2Z8Fz
	hGTmRseGPaibynF8Qgtl3fa+lr1Aj+Rcvxv3+CFL6BMR5MeBPo6BrqxRbVFaY/AoosNks7loD7o
	b0RRZQmzNGb9/OG3IYw92QrObvhMuu02/HI89wZjbuSLqrk2DyqRX/QpS+JnI7nsq5dLH
X-Received: by 2002:a05:6a00:17a1:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f8c850e93mr12591567b3a.21.1776665587295;
        Sun, 19 Apr 2026 23:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a1:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f8c850e93mr12591532b3a.21.1776665586745;
        Sun, 19 Apr 2026 23:13:06 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:06 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Date: Mon, 20 Apr 2026 11:42:47 +0530
Message-Id: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/D5WkC/22OQQ6CMBBFr0K6tqQthaSuvIdxAcOgNUKxA42Gc
 HdbXGiim0le8t//szBCb5HYPluYx2DJuiFCscsYXOrhjNy2kZkSqhKF0pxGywfnuTBQtQZFi6J
 kMT167Oxjazqe3kxzc0WYkp4SF0uT889tKsiU+20NkgteYIelAQlSmoMjyu9zfQPX93k8LJUH9
 dG1/NJV1BuAWse/dFN2f/R1XV9lgUYN9gAAAA==
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665581; l=3533;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=RM2c4wnHu2llAa0LGukFWmGGdf2Sq6KTH6ykg7vqkuI=;
 b=vW+pzUitkyOrIgjBmqcKuy6TK8VhOpd1zpsC8Yc0uW0NkS7EuBVm4CJQExsA20QSSYQWJ0YB4
 2liA9z4c34fCU0WrgXMCFvm5FA0/wazNdWrB0h4CU1pLyy7vS2Nv0vn
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5c3f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=i1EFcCpGWxuPUXEeyfQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: KFuKYzdI7NHHbqBpJXu7JHG9T6jNlAUT
X-Proofpoint-ORIG-GUID: KFuKYzdI7NHHbqBpJXu7JHG9T6jNlAUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX/A0icoACjbfH
 u1Z9I94L1wCPzAbnJSfcly1ywCqMC6fNz/IrNNIcFro/9Y2rRt48es5XVD2Mi0hlOzLrFTQFpoO
 FafzTCHTP6wxH04bsBVN6NgHOaJj5bswom/foJr5gHHPv7vEJ7g0A/YLrgz02ParoE93uqe9DnB
 pT6zoIbsjmysc4uz4cbps6qqOlvmKkOMv/Ed1TZNf6VjBS51fkskQuJjiWalUD59iEu5W/RKmEp
 pB7GFmxy5mxqie1ciziVjsOvmhyKjN+SOweuZNd9y8ZKCpqPqn2yfcs5feuoKDMUPjMgCKWHl+b
 FiIQLa25vBEKG4StkfugaeBaOU5/uLBkbQslgu2587nbpZ52INhOLAUkHupOvgaYy4cU65w3mLS
 NpTJc1J6ECGKFvzvTPyOxxw07rUY5L4PKapS47QQ3NnzTkbNfBRfoFnoGGOxCLWy73ypUhSYVSi
 hjDxcE0TruI1Mp6T0gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v3:
- Added missing interconnect-names constraint for qcom,qcs615-qspi.
- Changed interconnect tags for qspi-memory path to QCOM_ICC_TAG_ALWAYS
- Fixed suspend sequence: now disables clocks before dropping performance
  state to avoid brownout risk
- Link to v2: https://patch.msgid.link/20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com

Changes in v2:
- Moved allOf section to bottom of binding schema
- Added if:then constraint requiring minimum 2 interconnects for qcs615
- Fixed runtime PM error handling with complete goto-based cleanup
- Added proper error paths in suspend/resume functions
- Changed interconnect tags from raw 0 to QCOM_ICC_TAG_ACTIVE_ONLY
- Link to v1: https://patch.msgid.link/20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com

---
Viken Dadhaniya (7):
      dt-bindings: spi: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      spi: qcom-qspi: Fix incomplete error handling in runtime PM
      spi: qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 21 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 76 +++++++++++++++++---
 6 files changed, 188 insertions(+), 19 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

