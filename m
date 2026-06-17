Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAC737C936
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694483; cv=none; b=DU/hIQIHPY6MbdQD2pRwZxArJ5wVS7+nieNnfrFjtASmqKK348DzF5wLB+p76kKobxZeHWBKaBSMXsjL6g80mMoMi+aYTw5HvmFQYsINDJWNshY+O9/ocPmMKlLmmx/g1664E7BDGEje7ZtbnYRKn82l7KdjPVq0/OFeWS0K3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694483; c=relaxed/simple;
	bh=bv8uzhE1UalkFsBO3sVAwdznQlQ0C0w7nZfUZ/Elo8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Drbqf/aNHPIp52BvplSAjrCDAqOjFwDFV3d1vLDx/21AlrJft0R3SpA9JYSSDNedvbudnJrlVyGRHRerE3rUhMyv8+kUwRXAqvjEs2PyTOxvuB5nfe8GDsvdDEpwoiLR3POn4mXIFlPd0wFvXVpQOieGeaSoC1CSeSfNmGRO8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2Lr0Cv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjgCkXfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2Lr0Cv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjgCkXfu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UWE81703608
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LvGStKxZDmkZlkmNhX7Wnh
	OMVUTKVu6r8MbouD/ky6M=; b=e2Lr0Cv8mn62aJosz2xk5rnvowS05Ue2VCIibW
	Q1iRzbEL/uvHN3QArI1CCQDkQbdSh/QzQBvE3+YepeEANUz6bvREhIoj122zbS1V
	iYagycu3RgwhndaSy8YHeJ+pF3rkxe/GbQwQRVCrJqObbeppPGOPKHGVtEyeCk65
	3Rrt3kVi80Gy+VaqP1Ti4hrC0/3eCdCUJI9gRgyG4vp5lH+mg47GSDKiNvIipDWl
	Mc9RbsbfQ9rB/idfLlj7rK3iv7zn4L4Die+QdniCyU4ohc8gvtdg2afuL8gdYF5f
	kpPuAfnBttHmhQKoI8Dmx7AMHC3m8ykxezQaYL1BcI3gBdPg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2qjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8453031c57cso320499b3a.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694481; x=1782299281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LvGStKxZDmkZlkmNhX7WnhOMVUTKVu6r8MbouD/ky6M=;
        b=hjgCkXfuwF7tFV+tmqb7DT2P+f/IXNRTIRD3jZgiDHwckB/k7QFRyn0RewHrIo9if5
         rWl5ac52+6v9oTlgBP1qNOOtiQFvf01mjYH52jz6/RNl6YCyxOHTAXDk9U5+FCfopLXD
         j6AbImSc+lxHOb0W3+AuIxqX8T3zOb0r2U5G8/UFTX47QPcP6c2YqdxSJ7v94RHqjlhN
         cDmJogC5rUB2wX87W9U4fZ2tPgk4CCt8hSxrUtPh/39rSrIH+u3Cp83cHUOkWnce6pSg
         n4eAGO+CoN98ltV+Cn7YFBSOcuL1HR5403S6rsE0W4pbu5bQEnQ8aEAa+qZH065JzbEw
         oF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694481; x=1782299281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvGStKxZDmkZlkmNhX7WnhOMVUTKVu6r8MbouD/ky6M=;
        b=ooDdqh0KRbaCMq+piDxlW2Hin6j26KjPpwH1u35wOqfSjqP6Kat17kEe9SuaIiYtye
         79X2my2yYsc3su5xSU7aflkKaFQXcwVjnzVMNmTvhqKj6PTQBVs2capAmJLMiVFB/Sk3
         RzUfwZZD1xAriIwnJzaiK8i7gbINATszQ7VQSfSWesBRgUo5wq1i8WvcDL6C5hJBTNPY
         Idc7AuFHv7Vsho4YTUrnNAq5iBLo4YXQB40jGYiGPIYYaMsKO/ziVhPPzYJUWmSXNfp/
         B72peKqGVYNE0Y2OqaUV1zwM0kHRYG+zyFm1/5wp431DHZF3ZCPWtBKeZwxWTrYpQ8ky
         fMfA==
X-Forwarded-Encrypted: i=1; AFNElJ+a4u5U6ZJyH0UQVS2DEq725WdiXLmQMNd/x4rUmZHht+oZPIRXeNPK6tCMypqgFnvsMpnJOwgnbKxN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8cBBDmUO4jCzIJC+bemhPHX3FC1wZUoG1PYBk2a/LZftxKO89
	K0p1BujOdRC12IrJPhXpm4KLBCD9yN42W6h0O09QhHrNfNlCdpHlqjv4XVxilcDER4VcbSqsDCN
	9QoEyewkvU05P8FFpTcXQm7J5vFsnVR27/+lDSAHgCzZdMtC6YXibG8vnNzMB+JAb
X-Gm-Gg: Acq92OGyPFxVSBocW3m/rEjxsGdc9qcTb0wBz5gVg4Y5wuDByuEpqXb2s0Ubvsn3ksG
	i0sXH9W1+fm74z998kff0zluiVV6FT+juc27keqxdcMkuR+wgEM4d1oJX+nTJ6Plst3mxXp8wsE
	zXAIcXAsZk71uuDYazxxOhHQ5JfSMM5oEHuy8oqngSa+rvf4eykWU3YA+wtUFQXE63l723L3Ixs
	OeiE7vB+/sUsekMB33BZcRF9W5GC7ZS4ES76sPYNPESF0fJtlcjBlafG+f58aS8MOotR2h9ZTR6
	ieSURU9pLFnI1rlsSvWvQhpclyN9K2QU4NmmQHBmUdpO8XlEL7pJObm+2soGVxFYjqPc4L2mIzP
	m0Opvx+gCkH/ruiAAtDR5Yd6Zh0Z7BYIVk7U=
X-Received: by 2002:a05:6a00:4ac9:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-8452457f6aamr3569982b3a.31.1781694480799;
        Wed, 17 Jun 2026 04:08:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac9:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-8452457f6aamr3569936b3a.31.1781694480305;
        Wed, 17 Jun 2026 04:08:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add EVA clock controller support for
 Glymur SoC
Date: Wed, 17 Jun 2026 16:37:51 +0530
Message-Id: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAiAMmoC/1XM0QqDIBTG8VeJcz1DLa11tfcYMdRZCZmbLlmE7
 z4X7GI3B/4Hvt8OQXujA3TFDl5HE4xbctBTAWoSy6iRuecGiinHjDKko1DqNs6bXT1iEsu6PYs
 BVy3kycPrwbwP7trnnkx4Ob8deiTf7w/i/1AkCCPJiWoaxlSNq4sLoXyuYlbO2jIf6FNKH4mPZ
 2qvAAAA
X-Change-ID: 20260525-evacc_glymur-5b0b489af038
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: TH2Jze7fVB60vghsO3v7_TkuU1DWj-gx
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a328011 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=qPUPAFQaLVUpwlA2bBwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: TH2Jze7fVB60vghsO3v7_TkuU1DWj-gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX8lrl3cmAroNX
 nxf7hOhQ1Vji9qIE/VvK+i/LQ6dUrHqcZ0Ux1EeKf/UJ1iImfVbw1EiuVyP0GS2MquOY68CHNZI
 PgBJG2hLOWHp9N3kJarI4nqywwIWwjiUVivActNMFd/evJKpMc4j+8yvVdb/Sih1Mg3tiCGQ590
 RkplqDWCJt1S07DbLaVj4ndDmgb8Rclmdx5blan6G7lLzxgl56tHDgBh+H0IGHchRc/Rp/mb3Xp
 jAVw5BjCnxnO7nJKcRFtMMjtLqTZX2b+lG+ywUM//KrDfJ0BFYK7ViIZAASQiHf2kQ7jYyWZ5HP
 NdlwPAtm56AlTq5Gxxw8TMQoY5nVkQxcD1QKwLl274IygfRnauyKMpyFsINgT1FzIHnrIKEUOtG
 MzNFK4babTaZLpy4u9XY7qlQFRRrgLygtceBkqQfdRK2ldxszMR1zEy/BSB4QWfXKQzwr1j8dKp
 6AbBwNeCEiZJwvBB1Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX4LBooqiGlbcz
 xe4Y5K0pGEn8MpnBzM0u7Gm+v1DpzxSZI37gZ6dxz7Tj8pIh7U5e0zhn82ngAoZ2oDtIc8FnMg8
 WnFXwZnuwdY408mD8WwGU5LstkFWXP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104

This series adds support for the Enhanced Video Analytics (EVA) clock
controller on the Qualcomm Glymur SoC.

The EVA subsystem handles vision processing workloads and requires its
own clock controller (EVACC) to manage the PLL, RCGs, branch clocks,
GDSCs and resets.

The series consists of:
- Move gcc_eva_ahb_clk and gcc_eva_xo_clk to the GCC critical clocks
  list since they are owned by the EVA clock controller and must remain
  enabled during boot.
- Add DT bindings for the EVA clock controller.
- Add the EVA clock controller driver.
- Add the EVA clock controller device node to the Glymur DTS.

Changes in v2:
- Update commit text for keeping eva ahb and xo clock [Dmitry]
- Remove description of 'power-domains' from bindings [Rob].
- Remove XO_A reference from bindings, code and Devicetree.
- Update comment for CTRL_IN and use regmap_set_bits [Konrad]
- Update commit text for device tree [Dmitry]
- Add RB-by from Rob, Konrad from v1.
- Link to v1: https://lore.kernel.org/r/20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Taniya Das (4):
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

 .../bindings/clock/qcom,glymur-evacc.yaml          |  72 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  18 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/evacc-glymur.c                    | 455 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-evacc.h      |  38 ++
 7 files changed, 597 insertions(+), 30 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-evacc_glymur-5b0b489af038

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

