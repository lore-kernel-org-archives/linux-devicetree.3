Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1C492532
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336539; cv=none; b=n0NXYodk72DHEbynuVKgcAKZIOPNfl+AfYW1dnVRyfahWUFsw746O8tyP1HgY14qlJnFGKwHSVJQ1L0H0N00fqNhbBzzonUO8hoCp/Ik6XnsHk5g8sn9dCGHEpBfTIktOaa3H35pZukB5pgm79HpPGVE/OTgE3PTQn/zcodqNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336539; c=relaxed/simple;
	bh=LzRk42hLPF44h8Qhf774xSXDeVD2osjbP32jNzvxnz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SCgpfXYqNJVRoFq3b9dCk9xpP6W0Tyew/Zmxsiw6EcNa7NANQZ7M15CiKWkR1J+FwF13SUHulH2T+y1GjX2w/9Fwd/9jKmdKzmmzrp0mdA93bKSh0/72j+Jban1S1UIu1Jk2Msp3nJ/Srf4Yzi0FKKQYzxc982YKA7zYdWkzS78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJ+TbFjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqJL9zzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJ+TbFjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqJL9zzA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TEMsfr2313210
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWHU+t4rJhXrXpGp2LtA0F
	WHC1o6WO+Pu8Djb/P/jUk=; b=OJ+TbFjmV9ovxMNP0Ec3ypevpf5VOOUVQqxUuu
	vVPo7hfn9NdAeaLKSNTM6Lr3AMM7oZekTkTnlPbTTGgGURWVTlOAFIhJ+eHqTbvl
	X1p9+u1jiIzgb27m84uzVi1ZDO5FA2E3sv+okoozazlBt6MnS6vMfOu08/JlIWrp
	Ps1wKU4tfTvwySN09t40zoy9/LMWFXnX+nW9GSZjqfNc1+QHxoD9m2wOQFIgOxq7
	UTwcqF3OfkpR5K8Gn49yRnsF56wDKOgTx2WEcq8N5csyFsOKFD2ZRDoIa/0EDB8j
	IBoBomHsoxsm88eu8pLoSO2qLEg/X1PjrRAZXC26aJ4RwgNg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ggs3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:48:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso15881225ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785336532; x=1785941332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pWHU+t4rJhXrXpGp2LtA0FWHC1o6WO+Pu8Djb/P/jUk=;
        b=iqJL9zzAc2QI4g+4dllYP7o10Ex7R6WO1rpUa6YhnjXyRxf09dgpmxl4PCK8HoA/hd
         3CYK7j60OTCA4+YPVJ+wMBnPTM7/D7FPO/U+Ll5yoXeED4/cqUTv8QwajSxTjNvl4fRo
         95M8ND2Y+yjZ5HpVz27e6WWzvZAV5GLSHIveJD54IEvehMWTn3fkUiNN0D2wsII4iejy
         IaV4C0DTUf200kSD5unkTPDtXTcv6hjs9QJir8XMSJnXEa4fRIWbclnQQlwwAlLTf0jl
         vya/KCCrXWNhf2DBMixsTrBmMiZa5Dkm4A69/+6V75GpSaeyAoCizSoeKst7jka16N8e
         WLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336532; x=1785941332;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pWHU+t4rJhXrXpGp2LtA0FWHC1o6WO+Pu8Djb/P/jUk=;
        b=FMksb4CTq5PUKWrykajUvslDn5Xrmo38DUtJWfo7HvUO1bP/HjdBmlJMYK0Mvmg2WP
         3tL4L9x98/yvID28Hc7vN4YIYEaInxt4hXAwIVJl4jKtFrmh4kiRXVCPSmgtUbuCHZkO
         ys3J1AFqC7gkJu3c3mxV9ZPQkQ/3M9JACytY8RdjTiGxoU+JD61dcU6dEwkAkpKg3ah2
         lsFcGKIAIiAKpZXB+ynMW/QYtszdE0OlrngWvWl1bsM56Ks25SqQrYvraTod9UDnXV9F
         gNvzgPQwHJYU9qVJ3ljazXi+RmzQRMNmAQ8LKEGa2aBlFXtZm39SD1rGUCFiIwNSUVcy
         eBXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoL5//1/uPsa/lOavfZCRw44yYwoXCHQ7cx/F/Bt7CeaZfHdoYjOeQqTOtYmZ5DzjkTa93pAgA9+PL9@vger.kernel.org
X-Gm-Message-State: AOJu0YyAo5L48/8rN+nRH3e5RVlsDGUsnn9XmaV6CMjbYCf9cXIOBKCU
	M8Z7H7e1PjJvbVbIsuVMgmw80PImvYbnLVqbzR1hTQ8To2AL+eyymW3mZACusKqB4N4wpOD7Wob
	Kh67qwCWcbXHdLgDd2UTsuMupBiFaOUBa+iaxLRBr6C4Usq3YoWnLMUkTbiBOVF2r
X-Gm-Gg: AR+sD117Z2PFJ8EscgcpRRXAbSBs8Q8S/L2eJKsLxpJCUNLZA9SOnAB7hZrU0Xxh05m
	Kxw5GuAZImJ84FGc4RU4OKQticO3xhvvGx1gPos052cODwhxW6r0FMy9Cr1ztqeK/r0MtIIOOpr
	zeZcbgO/XvafctpMaOwv4M/0nyjzifcbYkotLAVq6HFzctJ8zkN4Llf9bw8PWnRHCMHpMbFdvG4
	OOSKiVVy0v8KqiJ1nhAkJW+DD+2K8ufsdefsEIzuqJWU5dabj3eV9O0DQ4lc5zOE5SmSTzwGauT
	TYIff+kpJzNp+aGii6ZXo8h9WClnho3ZVSK5tLWTEk6RRKyXwYoFoY160eeC1yTUz/sf3JuEjbP
	z1SDgm/g9nrzZ2WME0efDqgBJtvMIdUpLuvk=
X-Received: by 2002:a17:903:2446:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2d026742789mr26659075ad.16.1785336532192;
        Wed, 29 Jul 2026 07:48:52 -0700 (PDT)
X-Received: by 2002:a17:903:2446:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2d026742789mr26658695ad.16.1785336531690;
        Wed, 29 Jul 2026 07:48:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm19515456eec.22.2026.07.29.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:48:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Wed, 29 Jul 2026 20:18:35 +0530
Message-Id: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQSamoC/3WR22rcQBBEf0XoOWN6rtIsIfg/TDBz6c5OYnl3N
 VoR2+y/uyWFIJP4RdCi61RN9VtbcSxY20Pz1o44l1pOzzzYL02bjuH5B4qSeW4VKAdOeYFP5TU
 84vxLONLgehelk9Ty/nlEKr9X1sP3ba7X+BPTtAD+bIx4ubLJtK215zClI1scGo8SMkXUDryRK
 YcEGiAEkk5L4ztrvVXkN6e/KsKUEGQH2soYCCBF7MlFDSrLjGSy9zFS+qjyXcouReMt5Sw9CzJ
 27G0sklZogtM9Jr+qBqw1rDUcmq9bCxpEnqq4pNOw1SGG6SyWSkLO4jyUVMUshRRkGAfUpb6P9
 6da7y7X8MSq4Y4/3xZ6DBXF8qdMhyYn69EQBp/7dmnwWOp0Gl/W48xyLWxNwM/d3YGtQHROGWM
 g5s7lf6xW2Kz2gH4PUAxgb6+MSxiD/ASgdwAl9wDNAK+iBNA9Sf1ZArMHfEhgGJD5lh2h5RT4H
 8DtdnsHW3gW6q4CAAA=
X-Change-ID: 20260629-eliza_evk-6f30686b161f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785336526; l=3295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LzRk42hLPF44h8Qhf774xSXDeVD2osjbP32jNzvxnz0=;
 b=PP5SvVYwhPc7HriIlnoF3NxT21s7ujlCY7niC82a8Qsbv9lybLvdRBF8ts34y2Zum9P7JiNhG
 UcCRq+GzRobB6BdMWeJHqYXrjvMbYTX2bQ+nF8ksZPxCDCKzWI0OqN3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfXwE41adeo680y
 l4mvMnTpNaHasfQupt1CQdQgzCjsaZDaF8UWs6M7sKRUzvCjEQD0NSo+llgGskC6N7vt1FVc6Qv
 DD2KFqVE0F+1NoXsqk0nJfqimRm5luLHSYOnzr1jOMR51zerVolFET3tJH7EZFPS6rMbu6BrfIo
 prpJ1iIOADijZwfrRfewECO2nnchiI3C/t0jINn4bQugoP+7+OIPMVIpNn1jR7tf+v8GKWRi6VL
 abD42sjjaubKr8ouGDxFg5VagLf/Ht/RrjjWxQSYaHmM4XEjHRz3QgUeaw9d9pHl/yDyzKazxmr
 DmW7b7iaegCDrYtuUxI6ZbgXkZ+ILOzSffnil69lZEy5CqZ31K9fsZqx7w+3Zz77lztif451SEV
 mhWWv6n+b+s672mZtP8BNocKe9w0wxvhCQCQZD51zvDizhsAMJRbjxINtKvdeHB7y9Ou6As0AID
 LHgNUaAzW5LsL5yloFw==
X-Proofpoint-ORIG-GUID: evGM4eO6yKcLG_23L4_u2epIt6ODVHPn
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a6a12d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=h7GK-HNMy1QVH8K1SrQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: evGM4eO6yKcLG_23L4_u2epIt6ODVHPn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfXzVfpwsw7lbkO
 modhvsVE19Z7BjwvJ9c8TLHi0znCSVGWE8s/SQ4mbvAjLhJXiZXYWzaim0PBJtHIWw2zVcn+TjJ
 bl5u8+TFgrYwen0VCuraVmN1l0xYGRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290120

This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).

The Eliza EVK exposes two PCIe ports:

- PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
  via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
  (connected over PCIe) and a Bluetooth device (connected over UART5),
  modelled with the pcie-m2-e-connector binding.

- PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
  management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
  PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
  the RESX# pin. The iommu-map covers all downstream switch ports
  (SID range 0x1400-0x1408).

The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
entry is added to the M.2 power sequencer so the serdev node for the BT
UART interface is created on PCI enumeration.

This seris Depends-on:
  https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
  https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v5:
- change from pci to pcie for subnode names (konrad)
- Link to v4: https://patch.msgid.link/20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com

Changes in v4:
- Added new line and used pcie port names as pcieN_portM (Konrad).
- Link to v3: https://patch.msgid.link/20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com

Changes in v3:
- Clubbed pcie nodes to this series (Bjorn A)
  (https://lore.kernel.org/all/20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com/)
- Added comment for PERST (Mani).
- Extended ranges property for pcie1 (Konrad).
- Link to v2: https://patch.msgid.link/20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com

Changes in v2:
- Drop patch 3, as this is already applied
- Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
  and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
  pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
- Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 229 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     | 415 +++++++++++++++++++++++++++++++-
 2 files changed, 642 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-eliza_evk-6f30686b161f
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

