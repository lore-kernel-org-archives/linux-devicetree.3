Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E33E7151
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173721; cv=none; b=jeR2Xk2GaBAhCEAAcCUKk8/EuqiCH4zJdx3n4IR8WVP2o6rzAv9cs7O7vFizo6SpLUOF8mAG0wu7RUSxGy4exNXhUhMBcrWXI3zWmyrcsiTSEMQv910YJIqS0f+zkhj2KbfPSsfdCrLJxhWZCGcg1TnmlfHGxQmXzQ+GKJMJkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173721; c=relaxed/simple;
	bh=iqVsyYlA+PkqKzWx8JHLx4T3/K9tKA/nyf40GvGZSeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yqy7L2qCJqhNc2mykuHr51vL2DHtBZ2lL02jVhztz3hS+G8FFdiiw6p423m3CIoPoF5jDYsJ1Liqp9YDeViO7HPi5j/9TPJpIGlPc9PBQHQHiC6nzVzhvTfpl6gyjIub9RXeBZb+3vXSkgr5aLlix9bXIORM+MOznNEPOSD8m8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrlOAxb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1kIs6Np; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrlOAxb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1kIs6Np"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GWK6b026468
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 17:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hQs9VzGCGguaVtEJTIdHQJ
	wjgFMmJ7q2cn+ev8SAwEM=; b=DrlOAxb7taVvlcJd7WjM3uKSSJXcNh047NzahG
	I4S7Jq43FXUVh+tV9rorTcLjXYvP0E+DIjHkjV7vdfP6w+tcdEY6kTwCdIfgtefp
	RS/a3b5V+V4bDoVLAZI9qWpjDkLjc0jyxmG8tYAb94lpjKbrfd6r+RC3T8UQbyj7
	l7RbNvAJcOjmk2hJuUCphNOwvV/JLoxZGgD+Sq3+iWvw/t5aFjxMbfIDMNLD287I
	CyyTbNl8e2C0KBtgWrjReleye7dFnlcaBS0fTNWEuG8dAabkj9NR26UNe0xnm5fG
	E4k9DOgjfVfsrK5W1mOQKUu+Y46z3lqDrCuH9GoPlHP5LXTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t338p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 17:08:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso20960715ad.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173717; x=1778778517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQs9VzGCGguaVtEJTIdHQJwjgFMmJ7q2cn+ev8SAwEM=;
        b=Y1kIs6NpWDS3cDY1065Bwg9SoujW5B97WTSJdPrEZp19CvQxSPLDmj2T9EfTeIr7f7
         bP0lcHBzxPtgpWCC/p1GRC15apXZzsUKdmj5+UTNKhVVTcWdZaYVJav8QmTqc5Dj2bs4
         xg/y6GpGwhJ3+xt+W2tgueZG66Z6qPRpsgCgEqT87QEEmPFnNInsA6ICa9rcY1XXfKLt
         PvsaWOllQcotbQseirfXVz6YtxdWqxVogh7qfZBjb+AsUyA3rAG2gl5stlXKozu5axzo
         O/JH5FhUBA+W/XhwH9Xu6CIdnHD1h5Xa7gMitIOPmmOSRij5TJERM3UfKdmrwSrNELaV
         fjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173717; x=1778778517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQs9VzGCGguaVtEJTIdHQJwjgFMmJ7q2cn+ev8SAwEM=;
        b=l4t51OvpSb0r9tWpBWimOgNNUSume4rLPrAE2h8c6K49wpKxocfea1pxcsgE9JmsVT
         f3Q0hVtSWKAOL79CFu5oPAEpo4OLiQMZ8CFAlumyGt97MwbI6Owon4YLEVyE3r6q7FK1
         q1jl1vu4m9LcEGq5asJrwxQJ8hLL+jIQGo0xnP4SbvxQS8+jygyFQclKpEPDmD1hlsKo
         HEmHCWJdGcdDhCyFCrwhCsKf45V8iAYWTgrLqIZaAXNiE2fuyGZc2h2C2V/TEANgrioK
         VxAd10eoRbahjuKs18zLyfa+YmgVcUUSBoxgY+a0ds4aE2QmTKhSH1GDnVUIgZ9c1X0r
         7iuA==
X-Forwarded-Encrypted: i=1; AFNElJ+HAAgCkxT85k1waeu4PltwjVmo76gFOk6gJ1VgmNRoxZ1Te69Zc8bsWWJLRwHWqyuyehP4C8oWmvO6@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4NPcQaGrYS8ufXwxGcN/+f0cUM0mNPbNsAPL8/Yd8AvyLqjI
	6jj7q9AaP9teI/EXQZUaLvLNH/iNQX5qFZRtQobpPoY3H/p5NzykgUGK3csCsKH6h/wULgzGelc
	lQPED7A+TCs501tJArQbPJpqWB/xELaXXKcci/s6tCiGibLHbUIypS8quNXQy04sL
X-Gm-Gg: AeBDieucWNsfA6F5WkJCBTDR4LuW4a/aEAALCrajm5Bcs70JWswXqEu3AvItBqSgEn+
	woKYscP5FMCAlxZAFtGFy3t8goHAnI3PzdhSCI60ORZyyb+OlU3uFrIGwXREOfFkaOvo08Lw8gc
	9KrWX280DLT4nU1N752luRSiBFew96RKlXG+l+hV1LXaKcgjIioW8fKuPjKtZky5eg9u/7+A6B/
	E1Qt1OQrYfqEPKxoG4mzeA0dq8295hBhdjINj+59QRQtbShJR8HBdrL/1/M1soZfkAg3ahIATvz
	NLTeh2s/g29zcFj9fcQNEzfczqRWmvJuinrfQvPDgb3TjD5yXoGlgZP0N9KtT2j8sr9QgH0aRIh
	g4Qq87XAbwHoAP9MPIgQCqcZJtR6W9eLADOXVAjPQH3Ygf6WKb3VUHbgBFPwddNTHg+YPjuuS1W
	8HV/nENbQhhiyB4M+VPO/7zyQ8advHjFYhCwr5+7v+2n9oVMtfx24w4P7P
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr64873325ad.26.1778173716973;
        Thu, 07 May 2026 10:08:36 -0700 (PDT)
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr64873085ad.26.1778173716367;
        Thu, 07 May 2026 10:08:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Thu, 07 May 2026 22:38:26 +0530
Message-Id: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArH/GkC/3WOQQ6CMBBFr0K6tqSlFMSV9zCEQBmlBih0CtEQ7
 m4BE1duJnmTP//NQhCsBiSXYCEWZo3a9B7EKSCqKfsHUF17JhGLEiYEo3oYs0SyojLGFc4U2ED
 bUi4zFqW1jM9KEX87WLjr1957yw/GqXqCclvZN2FhnLzQ/WKNRmfse/9m5tv2EMdc/hHPnDJai
 RSqWImS1/xqEMNxKltlui70g+Trun4ALWXOVugAAAA=
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=2791;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=iqVsyYlA+PkqKzWx8JHLx4T3/K9tKA/nyf40GvGZSeI=;
 b=+2WUeZSlDg8W4QeAuP+zv3zblPxROagGLKrDwEnEOdN5dBrguD7qg8fiS0t/iqPaSztHjbjk4
 4C76MlY9VDkAhHTaSpkVja1iGtM4dWC44oPATfjaY6E01++a3nUX72v
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fcc715 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: zZZA11_Xy0CMGNLj9YyZPZk1wNx48VO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX44uAqdlCfEW5
 0hHYI9OihmftPwPWYIsYGWkZ6new5muIeYXHuqhS+gXaT2iluPf9COx7sy1xQ3tg5PbTTPXef5d
 kC7heFrvMkRyvv8gGJJjNNv5dzNp//0WYFZ3N7N5IYAr7ap/9AQkV4/cQK6ZfUWy2sOlCliBa0u
 NzMRQjoikxFaKaiWjmcGRUIGuLYWvdTCy6T7YqFpo2bxWp1gAcI3vG0p936HbxGZtIrA9GNLV2K
 7XJpVQxqX/4hD5236BSw2KolWslJADWlaGFKWoNluh//cWuOWywY4yaBxRP4zIDqi/FpZkZA01N
 aCslQ/1RBYLtPMGCatDt3ApXk+4ljYfqp7hXOrWWMoufHNhR39nHhM3w0uFeTmQtoVgWZK+6TaW
 KeGyfPJcFMRK0ZEgqNKcUzTXjC9lBWVTE8tMdm90aVbWg410XNkrxT39XxmFTHPD6vZAWlei1YC
 6kEA5L9rnULcjBPL94g==
X-Proofpoint-GUID: zZZA11_Xy0CMGNLj9YyZPZk1wNx48VO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172

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
Changes in v3:
- Added \n before the status property
- Rebased on next-20260507
- Dropped the REFGEN, PRIMESS clocks from the bindings and the GCC
  driver since the ownership of these clocks are in discussion. It will
  be added back if Linux needs to play with those clocks.
- Link to v2:
  https://lore.kernel.org/all/20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com/
Changes in v2:
- Collected the R-b tags
- Add the ARM64 dependency to the GCC driver and enable it by default to
  align with Krzysztof's effort to cleanup the defconfig
- Updated the GICv3 interrupt-cells to 4 and added the ppi-partitions
  and hooked up with the PMU instances.
- Made the labels to lower case and kept the \n before status property
- Dropped the defconfig patch
- Link to v1: https://patch.msgid.link/20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com

---
Kathiravan Thirumoorthy (4):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  377 +++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3445 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 10 files changed, 4373 insertions(+)
---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

