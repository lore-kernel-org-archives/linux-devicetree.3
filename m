Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801025;
	b=mvBFhrnRcx+3e22sXsJiywXJPbQY0DIH5O/4JS/iOrcaUU0WEmkxcoEVACI/4sYeGGAZ
	 OCRPK865Wunv7+LsgaaaMWd3U1UhM+icObyFtav5pNh4F1YhQ1K5fobsnOPcdrfWcbHWk
	 RyJes57nBBi/w3E7i3cAEE8vmNOOO3yHPddNnbVFXjZAIfJxiC3OK7ZC9V86z0jHeqn7u
	 qvCaDwyiUCVNZd+v/UQHy8pKVV+6hyI03Kxe/vZEdV2cHw4JyVc83gduyzFDwtCKqS0fD
	 QMthrcZowyLjAzfcny+K7Th+jO4rSIqKb5aZp7cuX60JULgWIEr54zIrndlroRkpUHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
	b=4xab+MRDzpP6OJYUZKmQTxkBXja76r9lZwzmRNE+EjbYroNZYVqCqnHyWy31Jxc/Kqbk
	 i+1eJhP/tdD8VlRbt03ag7/poy6e84bs2v76EM4wc/YX5I+kbUSMytM9NL4GjSYIyEDoe
	 uTG003qdwSxZHJVkBbvYGkTO8QUFr3Zfry91K8GeegPyPWt6l68/uxt5ZTNA7okddZDBk
	 J2FT2XmlQel+g2LpBEonhSEbRo6wdhUPWqSYCPUnrFwAhWmG8+Wj7Lk5ufuwRx0tPtoTy
	 T2r8VQj6bf1juPmoiCr7LQEg5AN9VcCiLf72tJNwi4smnFDzhcWPorv4Uolz/DdAX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jR/uLvhZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0pl0+jB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3333606A32C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3333606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR/uLvhZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0pl0+jB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsZh2667761
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zjTT2oSPpv6GIMn50uchi/
	8d3fk9ClR81FB3L7DPO8M=; b=jR/uLvhZcgZvaBLAQXAqTXCiQddR6Vd6uoVkAG
	xoSsqexEFOFeREnbJMPfMz+Xc1NFaMTVZg407tTXyp59EsDMRR15JQIYE+y0cIqj
	6HYckZuXrYnsfxtQnjZghlnt5qjD1RKmbSU2eEKSlC9OhlFG1ztgeaP17ikaUOKl
	li7TBHm9GFtTrfR4zI6wIavwVYrHp4Nch3qX8mEvJ2xgeqrsI3SS2jRHavCfXvr+
	k+daqgBmjfW6EwZhZwEoE58ewrDT1xPtFrqITVKCNwM0UG37lYG8T1qvbCClMJ+T
	X1iH6QQmroyhq6hSdWZgrFJj1HySzHDxzmGstY5eWXUJwUvA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmebj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:03:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1567077c88.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801023; x=1794405823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=b0pl0+jBG55IEBnkEiYBDXYTxpc6dDKJ2w6YtwIXH09Od6JUvAG8M28miTXypkpKo2
         OszG4M1yJviFW3GJv7k0IUBULzmN4oU8fl8qvWrTpjjY4etC09FO3POaZFlDMdcR6ZAG
         4pBGqgPyqpcHi6HN4oS1e/uAeMFKnw3cqNrV1yjt8oCEgyI0FhRxUWjm3tsLU6tXqOLo
         RzV7JhTZHTN6rd5i4ahTXnUs7DKWXBXTOsowtrKwA/OC6d4SKRez4qGIIfOZuC6sTm0o
         cMwqXt7b/nSnvMkk0Cc20laK/iFARbjDCIuqF2Vsv2tSC9MHI4VX6B2jshtZa4N4JdPq
         vM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801023; x=1794405823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zjTT2oSPpv6GIMn50uchi/8d3fk9ClR81FB3L7DPO8M=;
        b=q24qb/czrV1VxVilNDtpIJV4yx7dH1uOI4/dykN9c0xyFRak2JyM98aSwwRa7DdS3F
         1AzSFM7RfFiOAlaPRxiqMYUM+3QTdW2CZ98cS9HpoN13KHNBoILzpw91do+JqnW7/ryx
         IS7fz9m7gtfYX471KUtihilXFvRw9LB5Mf7uD1S1LJwKWrhYYiLlBju6GO3kPlBwbqWo
         sn+YnneBzEAHtmC76G99t3O0HaYEEeayEAYECmce6LHjYsnhf/0TBoQOR5CtKblgYp9k
         teVA3ALlvPyzcb5rF4f6vjS220lgkuB4+C+6Rjs9hcOYYZ5wIMGDfxgWRAizN3ULAa1h
         ZqmA==
X-Forwarded-Encrypted: i=1; AKwUvBwvOMbRtc/HSX8K3xiA7pi7vCh6FImV+WFNEF90rDLkcXbpSr4vRBnUZNSEUvaTPfghJDjdUNErvIb4@vger.kernel.org
X-Gm-Message-State: APuU4Z/sa5h4rfrrbWVgmQuPTWc3liMwuQFjgbghg2AMIo4lYAxB4IDK
	9wtTVgf0WONRCJ9UizRKOP9KVBPgbPE61yn22iDq8jJW3gFT8AoeSGpVGwufc/+x7tUz19rvyJH
	M7ekZe5EQ/1a2M/77/xeu8+Euwoooi/TITCijaJr2C7sNOWaXSGJjeUn238d9VXP2
X-Gm-Gg: AYBFou0O8dBDI/WdaZ6dl+6dPoVrcxlmwyQ+VO2yhwYALleg214yNsidaQFi9JrfwlD
	r4al2PNTAS4uNsiEvYBWTovXmDNerzqJdSWlZhR+Yw36HVe1C1l/tIZ3L49qQqphJBQzcu/Q5rg
	d+Nc5hoZVuTZjwO8FCTeiP00T/vaaLe4Gra/+8jajSyKFDv85xWnW+uE7SMHdP3XyKfIJu+dRaU
	ICoHM2OPmmbI0tZJOiEZnbpwgR5OVlUB6k4BnTScOxH8axVdSyjksXjCRamgvVYwR4aZAUAlT2X
	fYWGWLdIXCaLecXGVUlumreh6QeJi427JsGrml9hVv6FoSp+SCDZbfGPMLHthRY2HFnE3EWrRv5
	W1BRw7lJ5tbHFt7UB2GwNvS0yLFQ3FuV45pM1CnatHbWLaOskqbO7jRhKieMGUxrz
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39770049c88.29.1793801023155;
        Wed, 04 Nov 2026 06:03:43 -0800 (PST)
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr39769937c88.29.1793801022222;
        Wed, 04 Nov 2026 06:03:42 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:41 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Wed, 04 Nov 2026 19:33:29 +0530
Message-Id: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADE762oC/3XMTQ6CMBCG4auQri2ZtrQUV97DuCh1kEZ+tFWiI
 dzdwsJIgptJ3km+ZyQBvcNA9slIPA4uuL6Lke0SYmvTXZC6c2zCgSsomKahdldvKDacotGFKoS
 WVlgSBzePlXst2PEUu3bh0fv3Yg9s/m4yA6OMQl6WkPPSGMEOfQjp/Wka27dtGg+ZtYH/CAJWA
 qdAK9CclyiNQfwjiK/AAORKEFFQTFe5yIQqpN0Qpmn6AJeBlGcvAQAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=2786;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=L882II8VBUM+EAwyKEsaOTPVGKLyZlUm17EREpF3Wxs=;
 b=Ua1vv2E0eJ2mz52U/dBlpPOF70UDWuhhQ2vbVLFm/WTlaKZSuJYv4hSRnpB2pEreSNBGnUnqo
 Bwln8nBZ7FSCoZRXZVcOCqkoIwFEUmXXSsckICMuAZRhPe/3pNcZEG9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7hAM8u1rUEiM
 LxptuqCPzvOyiU2aI91dsCF/SLZuJNi0z+96JTDQMIK4fh8FXx1K0XH4YtWPuGe75LQImRDiSfz
 +TlqzzfykXe5WLoNTfnCBXxfa3kktNpVnZ0AIjKu7j/5XuZnqDvCG/ixSvOuI1VFXTOxoN2lV4G
 yg10DzeADfys8McO3Zrz9kHtz5EP8xFlXwmwG4hP5p4z9FcjDCuvzLWGZPdywemLvdhTDueLHke
 I6Dwynlx0bxOP0OC1y7C7xrBVmDqWrfx6qCmaPbzcwkT+0SHsQ6cp4s6nIXSvww7nWmMpy0QGN0
 pLVH2BVPairSaXrbSc9etG2KIJZB2+TPx/bV1xTXi2mWE+4afm7voRLlEUSS2QRXlER+bGr3mJV
 vQ8yGD0ZFC85RFQiCBJdqHawUN/ZmVZcbkUBjQZiHrNaqo1XD394mp0a4Tp8TfwS+z+pHjZSitW
 c2pjAgee/JPiTok4GxQ==
X-Proofpoint-GUID: AQ2Yz6YRSRMg0WxZOK3QWwHDY_n5u_V9
X-Proofpoint-ORIG-GUID: AQ2Yz6YRSRMg0WxZOK3QWwHDY_n5u_V9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX/YYVy0tWtQxm
 OHUIUAjehK42wBiiL45SNg7e0aGqae+cpBUGxBb9GarYFZmC9OkLw//C3IxbZ5pCPQc/pbx2Pou
 pPoshUxIhYTJnRDHNE3Bv8By+WuUudI=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b40 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c34ISMXoqBeJqo_8tdQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
 7 files changed, 75 insertions(+), 3 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

