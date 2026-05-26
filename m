Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BEA1A9F96
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773399; cv=none; b=GaNG9LLM1V1YYRQsY2xmqysSrkqssG1cmp3A2oQhgX7VtZmp52QsLKY0u+d+EwD7zi71BsHWyO6VehpmHSbOiGOPpVc7ubvpcGIrRQFle1SnhiZ7XazjEBI9L+lq/RopTipAqi0Rs0g7CI2pEEDN5FyQO/lHOES9PAUKzKQBgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773399; c=relaxed/simple;
	bh=RDv9C8vo882b7grqcNEBmysk+rZ5aRPE3/o5s+kdDtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ww2UOwB2KdcFET5VeKC98w88QbglAQYlpNYGXN3R3h1fUeZ146re3VwUrjnb1bgDtRbM15yVjJQVmlAasqg/BDpur2xcfJY1vFQfhI2wBLxhDXFUErPRIYQJye9s7gAE7iiayhE//aGPQZ3xE/8JmXTP3Fr6zbLTo8HfQ/xS9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzVCek8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx4JvDuo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzVCek8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx4JvDuo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PI3efG2146016
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMn6ZNqovB2tg0uVljWWvF
	cE+D/UKXK4nk5ckLii3Rs=; b=OzVCek8PAyzJSsFP3OaXRyT0ZKKAwZjVwg/1gs
	bdVE9YcM4F8bXndBaEMJ9iaY8nGTAycODZ4I0t1J6MNozzX6aDpkL5oqX0silZFe
	If2QitzRW9E9UdvO+5O8Rv4AByWKW+6bQXHhvUVZOCumIIxYUXTqryHMtdONe1et
	bg+voXHjamUgSEm8zY/nzLDoa+TLoExD8dx08fneW52YjGcKO5apQ6uz9F3+n0ke
	B4xkfleG/7e1qQyRvAbQlpiRr+/I7C3NaRBD0KNu2ysRepT8z2OXzk/IcQzRgwck
	aHHEkbu+g2G4KG027GHsClaqcm4VgWRq1JeLFwCXei9W1kdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv30mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:29:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso102174915ad.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773396; x=1780378196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=gx4JvDuoP5dcPvOpzvZYFmGfdK3b7SgcecZJZ3Zi2eff74DaGU4575CqUHI49UygtW
         20wC4y3SdoWmJoGWM0OfNBRcqkF+fMSawvXWYS5/0nyj6NSrkD70jJHSQqJCvxR5P5jO
         xLDHoDk4zfB5UXnq5xPTC+u8C/xFchnMsGplpCQWC/4WM7tn77Hsk1/R8WA/d3Q2GxM+
         l7sZB3l2RddzGLOieJfacHGgLB195GP4f3rlxe+QJTIj2ZEaI1WhWAmsdQvbIhi9znkP
         TvAfeVrUl1F4gHDoAVyEDtTvQnnBRN5UitTY1Te54SR1pakMHl9Bx5zwl1iroMqcnj3m
         GReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773396; x=1780378196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMn6ZNqovB2tg0uVljWWvFcE+D/UKXK4nk5ckLii3Rs=;
        b=Zz8UvjLaWVp/pU9DWoAQm+v21JqhQ1X706R85/8P+9zpKqayRNe/UQQTWLIXIJrSwi
         9Y/AUcG/+Hdz3buwC3nDfOwFZrpfFhC1+8obE8mrBimi99GPa0+ZAXV+8WNL2w0+uXk8
         +ziefwJcsPFWCcx2Z3fJr7ZM0tia60SpRDfshXNEeRafLmma1m19vx1gzhYxAIXZb1pf
         PN9oBoil5cbLT8Hl6LWfryjjSMAnz0xbpBdrmKkY7Z4coH9pqYQ13AfRc5UQGZ49M7pK
         PvwKZB1xi8e0q5v/yvQZye7EzmI2BXC9X/QuSgdCunyR5Z66LWjrTb621iRkbS6JkYPq
         l6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XgT94TbVCbB/wxcVHc24XlbN2LNLIM2TIDYc2BhHYHnNESuMg7a8AmhACTDj2z4BOKVJi8sZ85qBN@vger.kernel.org
X-Gm-Message-State: AOJu0YxIlNU3XlgjIgvc8pnqFmBRJHxGnidgkfAIdVfwqwWPlyF9s4QZ
	1ZtsyIuGPPxxbTEfgzno2Vzp0Dr6ALbphSaO1tAiJyd6zxEOcD7XJzMW0u1Z/yySinHMDt4uBDa
	V1dmf7WtANB/ral30rzwYgUdLfHvvxa2IEXwduDYDESlaGSCxuWQ+5EKyyZoEm4vN
X-Gm-Gg: Acq92OGMsqQq8yBo+/3h4o0L263153NTT5W4/5RQgHsiRaxLSt3QiuKI0lE/BLGvSTs
	A+7oTgps+fFUrCIPWsaMc9mz5oXnWW3CUXai3rrBWBqFA8vIJ7iqgVIO8+82AvohBlT9oExYBUK
	bnB4IQY4jnQdWAWeAo8Cbi4WFbjJ5aImtKciyIhHsAr/fvbIvNi+PZciqYYHFIGMZwaSOyBwnyp
	N9Y7tpwQPwg68GDg8Ir6X76+aNm/IadX7hyOX+mvyZtWj2CqCA029LWtyXwgw7Yz3K2bPce29Gp
	apM4e8pCphJSz/zDJcpj33TIvDfa2v/rz//+WYATQpRk39MedUIed3rv+h38Y454oVDQoL5UXwo
	4u6VytOGs6Plo9lvwKIWRDi4fpaVXON6iYgl/1ISPzzfWNA==
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092625ad.26.1779773395578;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:2c07:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2beb0631a41mr173092265ad.26.1779773395067;
        Mon, 25 May 2026 22:29:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:29:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add EVA clock controller support for Glymur
 SoC
Date: Tue, 26 May 2026 10:59:43 +0530
Message-Id: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcvFWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNT3dSyxOTk+PScytzSIl3TJIMkEwvLxDQDYwsloJaCotS0zAqwcdG
 xtbUApM5BXV4AAAA=
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX6m/LNtKUQ5/F
 QFnAWrk86k35c7AoyTHFHGI+bKmTzhNS75OEEfseG9odVggagKt6DNtW7hKGAz0rAEKbReDN0s0
 vms53up1gbqWC9LSrt7UO5qCnYrOsXy8NwiV8b4WPG+VBTHu/hkMZg4PWpe3icjRLKpICPIhJZ8
 ZqT2SuwGCcar8thA2SBbXHsUTXxuEmdcqAL0rkKdxM/Zw0U/sD8O0gDUHDuQHP+4lxK97CT063j
 qgn0Q7hdlSSp0OP1bzlL50GKmUDSw1/2/ncMLAVoew/dxlqrbYMdlX9gmz5jwEY277ntqvE71x7
 rQWy+e4++mhAjaqNwaVFN3kD7eHBkHsjx6wKZvEuFkuIXogrwPp12tqtS6PKk3ODE30JDCjy8pZ
 AADNCU+eqASlXA/zIGJIwS7m5LjCyY3u+jjJiKZfF4Jl30XIa2TsRuuncbTn1dviiozZRl4T3i9
 wcvpgB2/JFa7m6Ltuow==
X-Proofpoint-GUID: QRzsxiR2ImYiaHoRfr-WPd-EpEyhWX62
X-Proofpoint-ORIG-GUID: QRzsxiR2ImYiaHoRfr-WPd-EpEyhWX62
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a152fd4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ECThnQJB1zpBJANexocA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260045

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

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

 .../bindings/clock/qcom,glymur-evacc.yaml          |  76 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  19 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/evacc-glymur.c                    | 453 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-evacc.h      |  38 ++
 7 files changed, 600 insertions(+), 30 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-evacc_glymur-5b0b489af038

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

