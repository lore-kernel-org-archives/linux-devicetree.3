Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CED448B9C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913353; cv=none; b=RJja4qS/UcpslqqvUkE/pfeh1WTUvjL1yDBQVCqhTGZq0a7WuJ4qc+SgiGoV2xVthy3u8Z0bHEYUZpEZLtzL5EmUq4PezL7zBICBWu11TLByShwoXuprOseUDShUYIoNnhl3UlkPCCTTDLxJ7dsjnwAYOj57tU+p6LwlTdN07xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913353; c=relaxed/simple;
	bh=cqy555QSWc5h3PtpXrxjXRNReCwntJOnKsOaYjQ+aG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ni10LnZ0HLS8qeMDIoipHiboDlGBy4+bg+WfnkXxzZG8YcnInUTyLSOC2Bxhb6BvVaC3KqxAbALDH4gu5VimfnvU3Glyb2V4qlXQEl/6UYNKM9dJMPnmabbWqTqWpMK/PRoCyeJmnsBYCxKhrkYAVZ4QzH0QiocLUd1TRWgg61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQzVet27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBTbD/aN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQzVet27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBTbD/aN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqh0q595018
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hcBNhE02O2Iu2ALNDoF6GS
	g9Hlyx/IdIZQTn66e6kfw=; b=dQzVet273seqI+wHmIX4EQd9kQPFV8N4kxBcHU
	Xl+CFAWYytANwUyeAE0wqUUuqDAbHJYbHwFYDY6ALAvCK+W9yRicDfBPX+aj5cei
	lwIaaphEfDL6xm84kHIDhzft6LxRWUgms9QuPwiAekduaWB3RkssajG1JlU5c2OF
	86dSzcA5vguKFYQl4kdas6oj/aDYtYHm/Ndh93Nhp51sK3h4aWFPj9uxQiLBKIPW
	oDx4S8POEAQnEEeH2v7J/Jaqve5bkMGR08LZ/WXQ/BiwVXtnDBoUztsFt07eYFQH
	ASQeLspe2EKHjOs/OerA2bACjMqMeUeOhYzXfDfYQWmO/ssg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8xtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:15:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so708230a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913349; x=1785518149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcBNhE02O2Iu2ALNDoF6GSg9Hlyx/IdIZQTn66e6kfw=;
        b=YBTbD/aNthHqKWhRkeCxgVUC2xhbEkpBMOxRNzG4ed0DHe/99QeQaKVXs5Y+853esn
         hz66EqIjUZHZw/hNLt8WDwAq/RSskSFc70zbkPnNrxpQe/U0xjcJWUe2z9uyUo+P9uUo
         ZrIbVwXvt7Tq8LRe4v2irHRYOb7Ktl9ErxgGeRndO76RA5Q5RyH6OgeawtbKPoe6SMBG
         1l1tRbFzPcCYdyJAPsGBgUCOY8lZdbsj5AA98arYtpjjyIKOhNbYac3j1DstzvkpZWxE
         +wDvFCXg+2C0DgjONGXxKd/x7G8/81HY3fZq2iEti+/qJmU2QezTv0jR0OkqwF9W9yTZ
         2F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913349; x=1785518149;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hcBNhE02O2Iu2ALNDoF6GSg9Hlyx/IdIZQTn66e6kfw=;
        b=kWu8QV/janJQ5a0AlSn1gcgx2S7enlkyD3VImYg+AV1c7CbymIbjJQtli7AeqhVynO
         ey1UOO+XPj9ied97TSuazkVy8NOaOuBhRi7RoMkEKDF+nD3/AL42RuJnLI/0IDk7jyjH
         1YHhJHtQQ+Wc947dj1VIy+WmbqCXAboYF+J4yRAcCNmxGgi6WxkAx/j9ZNK/o9Gd30pk
         OrLpzAmOX0FdgmYe1+ekmEZ+OdytVmLGamD9uvDyB3MQqlT4P5xcEFtZmPNONuwhBLzf
         CdvPW+jaR/cvVhaNlk3Q+9fI459SdYGG50PMQWWIXZMDeHsZrr4ikcY/iK8eZ0mhvwz1
         b6Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqnPpGT0C9mpm89erEp6r1KAkxf4fE/CVhhjB1lXUjt8vRnUAiKnUd7iLqS51LPFzex9RLPCEImr8FC@vger.kernel.org
X-Gm-Message-State: AOJu0YzflVzr4gM0Y6gu/revBZLWqDBjUzYWpFpqNYZwGXItndvREHay
	J7hb33ABNsrQFIkopRckyrzELKhYLBd75xOPlkm4Y0k2EBSI5EpbQmZwSQgdEwytQgEQInBOq02
	T5+sdW7OyyD/TQqGt+i6D1+2Yk1uSJFU9KcE37Z/B4TxQOFVy5GkV5toOSzxWubp4
X-Gm-Gg: AR+sD13L+cyZcO83CHiZSiIpdYhtYiVEWyE5B32Yh3sf+4S9yICN/x1wMpuy9+XCbLt
	uRUyK7Ol2V9h93p6FyPQf+huCE+7jHJM0K0+N2J3Q8IQhEQukVEkB7CYR/uL2E7eI1oq8mY3VXn
	LUcVipTemH08ghCkfC8bNVJu+OJn7JTFW0G4vzslGik0SzZ0dtzrYbSHUSnZRA2ytVos+mWVGGv
	f36veIf3KUiaK378zkIotZcldHDCQn7lvUYcWO0xSFWGW7mu+7SeA4jsymfXOCwY5xDfUzKc3E2
	HYhbqxuGHMUtUN7DbXlRdEMDKSL6oD18s11dDRBdZ3nOMkosm6iviaQuDWW93SEx4tofdNqHYcE
	rJs6FTRUi6PE+WQ2ntcfk2AOdVa2fYaY=
X-Received: by 2002:a17:90b:2b44:b0:38e:4011:465f with SMTP id 98e67ed59e1d1-38ec660bb25mr7845326a91.23.1784913349041;
        Fri, 24 Jul 2026 10:15:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:38e:4011:465f with SMTP id 98e67ed59e1d1-38ec660bb25mr7845291a91.23.1784913348499;
        Fri, 24 Jul 2026 10:15:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:15:47 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/3] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Fri, 24 Jul 2026 22:45:31 +0530
Message-Id: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOdY2oC/33NQQ6CMBAF0KuYrq0Zp0CrK+9hXJR2kEal0gLRE
 O5u1YUu0M0k/yfz/sgiBUeRbRcjCzS46HyTQrZcMFPr5kjc2ZQZAhZQQM5j7U5Bc91b540PZAx
 XOVVUgRSZzFh6vAaq3O2F7g/vHKjtk919ytrFzof7a3hYP9u/G8OaA5dERZlXaDeodj7GVdvrs
 /GXyyod9lQH/EgS1KyESSoFglWIxlr4IYkvCcWsJJK0gVJJpQlsRjPSNE0PjT1m6GQBAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX9HlbpcwYWTvr
 Sgzj0P2HMad41Se98amG0l5HCjqulZVoK3LfoWaQ8K3XdTF4iBT95lABiTke9XBaEK1LFWqUbo+
 MiOAuADVckGB+IYLUIoUiyt7fOj96VeGyzK8dPNYffqxpVbp/79HdcwAgBFqW16hO69ecq506Gu
 4OtFJfXt5f3mcEIdcPcDEvO8oOmaBn4uSNYCH1rALzTDzLaUp6CXFZcQDkKlArsd+VOWbQvbp9I
 EPNGo9+jn7UG9Qwmie3WVn6XFh1JKu3EWJt61OssDXIOZJal8HjuRG/5QomTukLr+48paRpapDq
 AjojquRV2iQ04xWt8W9bqDV+MAIaUljIS5RCgGWjQX9BXYWWcZRW7ZwrDh/m03TWpZn6jWhr8ZB
 967XeMCsQ0hiypQMRHOSDdaAt/hFKG7tx9jOy7twnrv71422YAYYdt4DFRMqGaztUwPG5ZdofMd
 KzV8zkVGRZ/K8uprcag==
X-Proofpoint-GUID: 180LQpD1vclRI2EskabxXbU8OuekbHB5
X-Proofpoint-ORIG-GUID: 180LQpD1vclRI2EskabxXbU8OuekbHB5
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a639dc5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ks5C-W4QXeNcJ-T8xpMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX4wJoXdIvIfmP
 VfSzjqQiRe/IBF9Ocj25BXBY/nYg+hStgi3WMrqd6ybd8glgvHMV1X4o6fpgxBoLVUyBOyOyLag
 qbCeT5V9Yv+zopjOnaRilmjF7CPmgpM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240155

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Dropped "clk: qcom: common: Register reset controller only when resets are present" patch
  - Sashiko AI review pointed a valid GDSC-only corner case issue with this
    change, will address it in a separate patch.
  - This patch is not needed for this series, after splitting AudioCoreCC
    clocks and resets into different devices.
- Added NULL check for device_get_match_data() in driver [Sashiko AI review]
- Removed unnecessary <linux/mod_devicetable.h> include in driver [Uwe]
- Collected the R-By tags received on v2.
- Link to v3: https://lore.kernel.org/r/20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
  DTS changes were merged. 
- Separated the audiocorecc and audiocore_csr bindings into separate schema
  docs [Rob]
- Moved the AudioCoreCSR schema to bindings/reset/, since it now only
  describes a reset controller.
- Updated audiocorecc DTS node to use status reserved [Konrad]
- Kept audiocore_csr node globally enabled by default in DTS [Konrad]
- Collected all the R-By received on v1. 
- Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com

Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (3):
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  55 ++
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  |  42 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  17 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 810 +++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 8 files changed, 988 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260605-shikra-audiocorecc-85efef073474

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

