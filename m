Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ADE497380
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455048; cv=none; b=CMMb1JTyvEfc4aMzueBZKq036/38LCVycVwt11RdBUKuMW8OKkv/g2BgoFAObLlKoD7cOMm8fGZSyl0kYi6FXkI60tPF+2xofRjVFdKVn7y5z/NcYRh/ImpNlB18cPqkK6iZigmJOVD0pNd+OpxmjmtYtfmEQ+uVM1tytqiJPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455048; c=relaxed/simple;
	bh=IaFv5AMFE24zsG/chUB5/9DKQ/soeSuovpeIDY9lPp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zcx4YnWuVpJZZJlbMv9BJI7tdDryDKi4QW/MEoT0m9MFAQ0OA4BKRODSMeo3RkGeSMI80LokDIu/GqIGsblydmOeOfTUh/B8yHsTHZxtI6xDP7bZ8v0mqrboszoYElhmsjp0aYlKmvoGlwQ+kwXR1PCYCP5DceR+mSseEqNwkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDT5mI2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUF0oLjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDT5mI2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUF0oLjW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KAQE3191018
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AxR0pOAsOnpdhKn+bF/B85
	mpSQ3JMl+/gElRNNM7YSI=; b=lDT5mI2fFVQYm9SYj0ZlX9BFHL37Lply3mxRzl
	jhNOx5G6UAQaBYAHYxtzoGx/hYz1caaczkZDOVp+EMDUMgm9POqCdzKFudhJPke/
	EVZA8h2X/u8ov+3B1AZon6zshJa6ov68H7Khx/URx5Lq/phRjzEeIi0jJH8iqDjB
	dyakN8Pj9ErbLgJGbV0lD3531YXczfih1dev97x2L3nJU7BA/Y9O8FuQFyv0cmNE
	/GW8IALJSkYeboWgPrJo6hwrfImqY7Yh8dCnZoZ3bDvX9kLWM8U6FADrAW/zeJZz
	Km5zVRaYtcrgeupj2QVAGR1ctAMZxuZRTLmFRkROcxoVNgGA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6afgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:24:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so61948595ad.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455045; x=1792059845; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AxR0pOAsOnpdhKn+bF/B85mpSQ3JMl+/gElRNNM7YSI=;
        b=jUF0oLjWIY4XDpZxPYRcIH4YyNtwkFTPshJr0wJcmeQZFnGmJpoU1QCqFk5Wc/JPGY
         APzsdw9AfstyKhIxtAWcGlyyPy6qDA6JZW2XYJF8KSm+p6zgeCqgFAi4k/sBNh++hOCX
         zQGZIpDluDOLURB/ILZsb3i+bFJIqMZvQAnWA8pPZlqbTKG+aZTsS49CW1fL88UP0vhB
         LE1O3HJb8rEUSRj3kdu4H6Vz3OLPAFxJZHAejtQpcdQf3vg04opebFiF6M3BRLqifNH+
         jjIBkjoy0NJtt85H9X7/3H6nF+n9dE2N9/d/xhtp3zME+gkq3LfR5MsLBsFQtFzdyAdB
         zRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455045; x=1792059845;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AxR0pOAsOnpdhKn+bF/B85mpSQ3JMl+/gElRNNM7YSI=;
        b=U6g6Ydphyh8noQuRgLnjG8q/hsxmyd5BbrlMJIiAo8hs2Vljn3GuL0D9q/YwiQUn58
         XyZ8uYGmXo06oZGi1ClSaK9iskFI0Ickh92Af7H3flRimXG3wc1/zhcAKZNISxDk7gv1
         C0W/o1QKNDcBEf4XJsKiikOv66sPTwjGaLtt3MOFdUOyZE0LFXX73xQOkWy86uih65+E
         xOtyWxiETrcAeWgpxISA+2+/nwy/1e2NtCguQB5Qp2ngirbPLxQpZvsdnJB4S9zdb7Ub
         AlSn5eG26p2wAusTAyag5uj0D3ntkzmjwsv2RDXC02UkP3hVTYLfeiV+zqwZGFtWNEtX
         Rz6A==
X-Forwarded-Encrypted: i=1; AKwUvBysuxGAauWjd8obpI/SHk1KHwzGTsyFF1zmPMquwNM1Ra/78YaTFEPWS5vWTGzEN0CCpNIZ232/rHRb@vger.kernel.org
X-Gm-Message-State: AFq9FYIWNZV7s3ZJb6KV+bi4Efrgaufv0dRMp0OHcyP/smYvFcs6jm8K
	rLhS3D0z81chLR+6+sSrc+iafnTOHSIP3mX0pC0anq6RWWXrY8SkfqCMmfiWKgpH0MQZfvAJbKS
	+JHDK50V2AVj2ILQzZUSh3VrPgGHvBJC2hVR3oh+DS56LsCHHBRqMxtq75XEJc1z+
X-Gm-Gg: AYBFou2VnuVcVMpaYHmDHZT2jXxIw9tAtKaRsd2nbJr0xWtgewLgw6XFwqXnpcuQXEb
	Yl/npVuTg6jSZmoGwduGnOaQImwb4E9ko9p2iPXMOewPfW6Yma00UQ4G1Y232uWguXKRyN1XxEv
	4PznaBDl84ru2frX0uuF5H9G5ph3TEoOIla6ZBQ1RNwo0u99cWgwG9GIvXLQx2TukrB5SLY+MAE
	YZK8/RmJLBtK0uVEG+AX4nIyqqCAlhmm5rMrXUur2UgD80PWNY+RiULaHsUzmtPnRgebH0mrMsl
	j88GPsol/H8V5MqF1BoPUEfymwjNw5k0thGVmItFYekVoV2jM04L7JpwyvjKhnnk0kNtx4w4alM
	SIKdS5RngW98x4+/0abBrc2+3F37IBA21RPf4r7NsDkafaQ1Edi/HDdRutfwTs6rF3fUXiTj59r
	YkJ4BuCauGMHgX+oA92EzLyA==
X-Received: by 2002:a17:903:320a:b0:2df:9bc4:e6fd with SMTP id d9443c01a7336-2e6003b697bmr43567935ad.19.1791455045127;
        Thu, 08 Oct 2026 03:24:05 -0700 (PDT)
X-Received: by 2002:a17:903:320a:b0:2df:9bc4:e6fd with SMTP id d9443c01a7336-2e6003b697bmr43567655ad.19.1791455044626;
        Thu, 08 Oct 2026 03:24:04 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:03 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 00/17] wifi: ath12k: Add support for QCN6432
Date: Thu, 08 Oct 2026 15:53:56 +0530
Message-Id: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxvx2oC/yWM0QqEIBQFfyXO8wrqQ0m/Estidasb5IpaBNG/Z
 /U4DDMHIgWmiLo4EGjjyH+XQX0KdJN1IwnuM0NLXSopjVi8/7WB3bh6QVYrU/VKWm2QCx9o4P2
 5NbBpEo72hO9r4trO1KV7hvO8AKO5Y1t5AAAA
X-Change-ID: 20261008-mpp_bringup-ea2187d10a28
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 0j0T-lLqbi0pfBzxsK1RTUE3BC_yJlub
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac76f45 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0j0T-lLqbi0pfBzxsK1RTUE3BC_yJlub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXz7KMkyrABpQa
 X/VBJI1bLlii+00D1xJhwvaFCk0zcGkdqDa9OHwjqOdBavTn5xRAdcBmmbFTK5SviTKmL0cgGrz
 oH6AwnxehF4/M3VTlxhDVq5BggaK8biygOIH4xNEcpCjn0iqALGK3BZ/wCTUKs8i9HN5MIHHFDY
 FSS6825/lYfYU4AKgv4tMTITxccs8o5LVkYB27V+ZY07r1+g0RJw1ufqaGBWr5uFaDj56Pp3ijN
 QiOxXoTgOPw4tCn099gWYQzn3jRenw4NgRqfyiQXXubkcH0kcEvxnW+LyBFt9GDuxglyXlOQpZL
 WLuGLvZi/ITSBZEJOUhklNo9SvOw8Ig/7VasqvPHNhhmjvOeIUNKpNdPXE/sjjxOyHYA2/VbX5Z
 6ehhVLJ9GIsm4g9dFskMIgj6ztMnTQ6HsIraZnlYtSwoyiwqrcaAIgcEwyv1cLvpL3rfMncd0HL
 kVRtvg+UJRhdZ7aeqZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0NF0SSGgDd0s
 64XmhWo1h2eGapHUiQpuFURkiLHADf8Fra+83S1rv83s5JSRhjw/FbLQLbwAFtYQEWzXHhqftgI
 1FsULkuYst/v6wEuI1tqVpSE8Xe8faY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080041

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
registered as a platform device (AHB), and remoteproc APIs are used to
boot and shut down the device, similar to other AHB-based devices such
as IPQ5332.

However, PCI APIs are used for device setup and register access. Since
QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
AHB/PCI approach is implemented.

Overview:
  - Patch [1/17] adds DT binding documentation for QCN6432.
  - Patch [2/17] refactors PCI operations and MSI config structure to
    support different MSI configurations.
  - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
    for QCN6432.
  - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
  - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
    QCN6432.
  - Patch [9/17] adds support for unified data-region memory allocation.
  - Patch [10/17] moves MSI config to pcic for better abstraction.
  - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
    specific to QCN6432.
  - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
  - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
  - Patch [15/17] derives QMI service instance ID per protection domain.
  - Patch [16/17] add userpd ID mapping per device.
  - Patch [17/17] adds support for QCN6432 in the driver.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432 device tree binding documentation
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain
 
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  51 ++-
 drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   6 +
 drivers/net/wireless/ath/ath12k/core.c             |  10 +-
 drivers/net/wireless/ath/ath12k/core.h             |  24 ++
 drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
 drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
 drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             | 434 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 141 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1213 insertions(+), 104 deletions(-)
---
base-commit: 17e4b9ea527b6c9491bed60f646bb2eff7d8db7b
change-id: 20261008-mpp_bringup-ea2187d10a28

