Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04193CB8E6
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749921; cv=none; b=UZqvijSHKvR4oug0WvR1I/sw6d+NCxgb2GKo2o4ZS/w+0oRei6lviR3bxPT9XpE8RXMsLp5C6xCGodq4VF6s466oFzm2JxvlzZsKxSOWjPK66W3vvHNIQZ6JKgSdS5NPZ5KWsrpUgIdVDNV/SLm0vnYHei7TWq4CJz163rdK1aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749921; c=relaxed/simple;
	bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z0Ww0cgnoDI0BBBaiJjiqRruoeKRWGo62BCHuZvPlmCK2DTmGL45irLerJC+Hzj3EQVbf/5Q3H+BoFDQ2wREY4P+X8j7fRWLKwQvMqcPN2wVGds4Uky6+aTRQgjhuiZj+8kIVdXx5nQtNRF6R2uafHpIyO3HR2HoMGHZFUtdB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Skbhn1uE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcEnL6zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Skbhn1uE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcEnL6zx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U2PHVT1522376
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Elp4C05nM48nzcrjsWZIc
	niOHlR2V1fdy2kVz45OFo=; b=Skbhn1uELKzP5gIrpXAzXaDFfRZkGoEefnNdQs
	fKY0BtcGPa+YbVamkoBG1ZL2p2ANgv/j6KOY4IYlK/m1Guwlx0JiZ8Oe86GMlzhY
	2Zz+waeCkhmCwvvRI0sUYNVou9OxO6TGOpDwwz+4VpYcBmex9/nJXooo7PaOPwxr
	HFp1zdsQOkllTbC167ernPcuLDUsDx5Lfd7FLizvTcQO2mSTTqaabP826RRRN3QT
	NfPVUotZwF/yGFxZuvLQtvaWeEcTGXeEyUdwpJzTclOSKbL3W2hGN9JAkq885LIF
	kqtvPCifr+jrOg6+hAjIsI3cK1MFVWLh+HW4BvS35V8Gx/Jw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjgx1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-349ffa249bdso4595346eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749914; x=1791354714; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=HcEnL6zx4Fj0uCBXoAI3fu7ZSAVq+qHw1ynykePDyeT67ezLMgHu067tZt6YFoOzYn
         y+HltRV3cASo6n7JuaNAv/RtbP/AfKbaT6kSzvoZPlqHFhLL5KHDKSc3VrX13cj2pFCZ
         DXHZwA0Aw00mWfH1ZH62YjOm4E6PNO+3mkQQvR6qUY375tbJfksBDEm+AC0Rw2200T5t
         MbbiBpHOJwAhPP3i6QupAz0/4ApPz+tHKPaChvwcmszjXlFqWOhZfCQaLfVHa8tUUsHs
         YesIb6Ko+nq0UaUpym/7302VzP8Akif7HgSJxr9pSe0u5vPixTNAmNCD6yusILhVxrix
         B3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749914; x=1791354714;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=DlE6un2uIBY4+2MqMTX1IDwkv+kuJJUcj+BXNDagZgv4UiaqGqZQt+TntJxBtq2yTm
         qjdFxX3VYiVKw/crsoNYOxhmoZbwoGYluKWwpxlXpTLydPkJQ332UlAJgFK/irOO8zKN
         54JzzUvXEebuIzy2K5zXwrD0Nvm1kp7BwWsF/thoelRCAP5PtKefuymGh8d2gD7AbX8C
         8Dbg316UJpLJPn8aWhHnmoZmLIfGMONjVTCsvmfAMteePYaF2YUc3GkoMVnoXnbYq6Ek
         0nDsuTnYM+iUDHGyolSWH52Rt+ZK2ldwYkYTqZP/9PIJLaaE06M4fk33CTthEdakilBK
         7OTQ==
X-Forwarded-Encrypted: i=1; AKwUvByHAYeKcA1vlZ4Lza1uaboZJSbdoKiz5y00bKYgnLoZkmEYSQlDMV5CgpLfjvan4YpgGsaWE59ebxyz@vger.kernel.org
X-Gm-Message-State: AFq9FYKcIpj58vPwEYZ+XYNODikcUB1RjDchTweHyZpG5kOlYEmgRUI5
	S0s2Ieq42oz+BtOLl3FBhLNMRnSdzj2idntBkvu33Icpd7GGMj5A1Iaq3Pb1u6DnyQJKI4lEU/S
	5szcp2pocmxXksffK+9XQJE9Lk7kiV9ih7w94jTHsjIWy8vBkfj+N7nbNQ49XlcGx
X-Gm-Gg: AYBFou1iXOrs3R9Jg0EwckJEymNF4gETL3pBMh5PMepdOCidlgL7UPaguipZcqlAdPz
	cj32rBJuNLf3AgVeUSwCMVLg6U7oA84yiLq+8NHNLwAwZcVqYLkBQ1xDe0g0+erv5xJdHMlNhxB
	FDD5A4lR2cac4Pi/hJezBIZcCzE95xkzCKqnnTuDqK5PvHlzjtEx0lugLeQ4K+7rRBZG0bn4Hzn
	IDlYAy2/SKGnzkmY8uZKr6pMMqIwRUlKIz8yl07+oWnIKP1SHsdLLXwIKEOoUtB6PCjLGq0LGr5
	cz238oYuD+I8rbMBcuGmAQxQd/HCTZ6tw5dp96JBclafKGHV0l8tYLuNCN4CPSmADYveCNYZ0jx
	5aa04eVHB6pv6BH35KoP09ucMfg/GYWngO26nCxIdoXwGrpAsc4g=
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696798eec.39.1790749913552;
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696758eec.39.1790749912904;
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Introduce Maili platform device
 tree
Date: Tue, 29 Sep 2026 23:31:22 -0700
Message-Id: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqsvGoC/02NQQqDMBBFryJZN2IiVeyq9yguJslYB9S0GRtax
 Ls3EQrdDDx4/80mGAMhi0uxiYCRmPySQJ8KYUdY7ijJJRa60k3V6U7OQBNJt7J0dXvGWjnAAUT
 yHwEHeh+tW5/YAKM0ARY75kJeZ20kXn34HB+jyvIvrv/iUclKgtVGmbYxg+uunrl8vmCyfp7Ld
 ES/7/sXJEe5dMAAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749911; l=3112;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
 b=Gchh2FhbMf9DJyVf4XHt6oL+dM0246wPlkIffdjg7FLhHl53oxdcWzso7K499JOwFnxDk6ry9
 T8K6dtqIx7fCCoQe91C1/i5dvkCYy91yGojJS8UL0WPTSW7FBLOWwxC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX3NVoT7tfODNZ
 R4qUFwSjavY5xp+Adm0bgp5/T6LxehrsuFDaeXo773AwifpzHit8xFmNiD7Q/B7fSEYLQpu6uDT
 i83MPLLeoZEEyUaEFj2n2100/6MD4AU=
X-Proofpoint-GUID: a97PhP_PJjiAvlkQ7I2YLDe9Z9Qm64fx
X-Proofpoint-ORIG-GUID: a97PhP_PJjiAvlkQ7I2YLDe9Z9Qm64fx
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcacda cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8 a=_I6dFAXXm9IZ1C54fn0A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX/cWPkKu3kDbf
 z6cCeHWP66ehL+jYEM/ZuY5Pw3MCtdZFS/itoMXtyzvOF1co4YR7kRyMkn+wn9aA+NTWPqULW/8
 NfafIYuOU7AKXWAzHeE0y6lrFC178RGIUQ5DtqGy1WkggfdIAzd/4IQAx0z3rYnLWLc7ivaJdcP
 1ZsOdreH4nzt9RkjUNgeXYPJsmJF7l6ndtQAl/Fcw0t5brCcg8fXeNsQMkiA8FqZEaJim4gKsGu
 dBYP0wjJ4Kd4z6y3gVXTIW5r+jQZuZWiR4gFCU48Fan4uMNrjcMGKRUEUW1l6fjhLu26G5NuRUd
 5akCUffK5WgkmthXi+iF74ymCDqTR4MYTRW5dHSuu8i+g3FKUSqtpIDlygd6TfTc1XNllwljfFz
 +KveoT2tn6JnabRN0PfZpEaAqCUNjRtedj6+teM7hiuhc/Evxugd81xW9kLF6VdhBPu9oSr5Tre
 ASZrF8mS7eCSWsJC9lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/videocc/gpucc
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- tsens
- PCIe

binding dependency:
ufs-phy: https://lore.kernel.org/lkml/20260917080622.824253-1-nitin.rawat@oss.qualcomm.com/ - reviewed
cpufreq: https://lore.kernel.org/lkml/20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com/ - applied
spmi-pmic: https://lore.kernel.org/lkml/20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com/ - applied
qup: https://lore.kernel.org/lkml/20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com/ - reviewed
pcie-phy: https://lore.kernel.org/all/20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com/ - reviewed 
gpu-smmu: https://lore.kernel.org/all/20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com/ - reviewed

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- fix the size of mpss_mem
- using 2-cell specifiers for iommu-map
- add reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com

---
Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/maili-ipcc.h           |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts          |  960 ++++
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6956 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8098 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-maili-dts-d375e31daefa

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

