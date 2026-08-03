Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E551F4181
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726939; cv=none; b=prGvXYMW75bku60PE4/+3J8BLKMDtgFowA4DnLnBX2cSVx/22VCmkiHZyOqCgp+JTE3TrwcksFzUllCgNvxUayadji56oiwu5zW1ocJkdVT+vHmdyQOcJK1FGqwSSBKQ5XIVqoUShuZRpZHapzisMdeD6cBdGDTIN+OPpAkoNe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726939; c=relaxed/simple;
	bh=mRhZd4ArISJcnX2zf7KSxh5RdZds15VDAFB7RXCaohs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O6xBgC51aZTdlysRLd1m2JB3fIWMpRNc+tWereUM9Jvn640GA7ZsHYJOlH8TPzDoJMjzct0fxbpEHnHgX6V2uWUb8xBystM0JF7vjr6mQ6qOaEXSs1EZM1ivY/2KGccdPV1Xq7mKi/Jx+/GDbTk7bVRAu2wM4ULCyVBvx1gJYlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx/KdwQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqqaBEgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx/KdwQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqqaBEgf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWPWI3961171
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=alsyKeVDpdyzB30QyLw4UE
	PQxiF/ylPHfRQqsBXzg/A=; b=Hx/KdwQauF0kK2wCv8Cm36GYYOu32RkZ9axIe2
	J0shmGc7+xcE85C+4EeJXfi4JyUwlmCYCTDw2GQMpCEuQbu9SMtRZcAVaEPUpEuC
	u3y9/XNK2YjS2xTrf1ELHZQV3sZWL15aYVyeJw1K5w37GCppiqLVtmk3cOX+xDTC
	cbRH9WsjrqA+y8cN9zBtPMZzmYIrVtJZGRMM6cG3g60ojpZQ0Ax9dSZGTEokgxem
	20Z4w+Hd3qoqTi/gco0WwQt5kY6yazAHka5Gt6fyhl6uNQjB8rxsCo09v9jBVINv
	XFrc7mwWiaF0ranM0cKPiZoE8hqBPMvmdYEha3Zckcubxm4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah2s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2787554a91.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726937; x=1786331737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=UqqaBEgflxmQl5J39R/9lWTAQDeHOXTz2p77ROUsh9FiTXE42mf7MLIkOfngN09vwN
         1jTMVw4CTKc14QJyr4LTjjZM0Jvqx2Dub9rtm96tnQ1p2MOgnR1z4iLde5Ob/A3bb7Sz
         jGcpsL7/unnkZncugHdsyWpdrWFD37hnSfWBDHcxEK84HylDQ2PEhpuKNiCB4oGvSfKK
         ySqURzLkBbCgFoLr09vmWNGoMxxEFidO4uhaBvUyQUFpd3hzK1GfBB1Ne9D6dQ+nvEg4
         4azIalv2T9smk53/iPXKn96iKaJejJ8EDne3XReekCb7pM5kaem9KWEGns3neZOuxUbX
         FekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726937; x=1786331737;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=YDxFLCb3CaZMs3Z5uLxSM2wyXUZHuOjrBn7jJTKUyPHEtCl9vYLpflH1pfLCeRo9Ac
         O6MVNwiWv7CpwXhPCVF6hcvlHaXXe4QUYFiRkI/zKXJDilHigG2+pXl2PWhcD8CxcTKO
         EYvQ3u7x4ktFFAJpRojLdL35qP843/mIfhyOr7bh0o+2q+P3TMxr0Gb8bNxmAoSNDz1P
         mV3/p14WQMVMNJolWSrp67VavFHERPsChMUaTgLW4yUorvUEG54Dmiux0T4nNQAupWTy
         TOgTnCFz0LcgGKmHADpdgcx7Kd0I39O6Ty7RwsTbiwDKO6+K6/ww+jZUdaexhsQuecwP
         RtAg==
X-Forwarded-Encrypted: i=1; AHgh+RpcFjEun02ckkLSkBX3xu4hZGlVaX3OiYk/0+VgD3JcA6j6tGPkAcwkleuZZisft7a2/LaqDLkNo4eX@vger.kernel.org
X-Gm-Message-State: AOJu0YzbELwaTAYp8LRQFvEdKof3oUQv3PVaLvURxUX4hpWbUKlT7P9H
	mrXPBYy1/rlX2mlMKcL0+w3ojMFn5X74Ak6/lidD1dExR/I075PIYJxDrGrq6kMZp8gYxGrYBsj
	6HG+dbij97rsS33+QpOFUzqa9MztZwyonye3fgh/YYgJEKlo30zA9xHFr7oSvwHIc
X-Gm-Gg: AR+sD1288/FSNcRkIJlvyM4Ror4HKGkwITTNECAV2rt36p9td+cFWSoJRA1i6B5PXkW
	rDvk0pVO9IaQ0L41R49JQiG62Gbp85zMWMc8qekTZI1S+xUmJlGtv9YwLuQgaS5Bs0A0ZF49wFe
	O1RYCGDqyESKKFjYjeJLV0AYe28OKn/wapAN2PynM4Ry3TW4JBSvy80tkcWti9WqQi4/hDInl9O
	Gfu9+Cxg2TmwHeB9leSB0HoAu00UYG9qjBpmqx2SzuyTg9e6bXMB3bpXbOSw225KzyrnPqHhbYA
	CWPq/rN72wg5mFTxatyVtllfVy6JAjM9GNGeQkAiR7JTYe2q5T5AGXbMp8eL7b8yKgBV0W1amhG
	Yj00w2CbqsP7l7eemvDemFlSAGOctJiwfwK7CEeKMzTZYpriNy3sXyg==
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753183a91.32.1785726936823;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753155a91.32.1785726936288;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:35 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Improve Qualcomm EUD driver and platform support
Date: Sun,  2 Aug 2026 20:15:25 -0700
Message-Id: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7007d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eIg1vlXWje1Bm5DpEBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _jFSAt10hpwjUMMZGy3LlpiZ8KtEcvRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXxTNLwfDKYaZi
 8D7UJthjWvoafx5cqfbbAOKzNUCz5YKYntNcH5Nvc8tRce1Pa51oei1lkd+QFte8T6jmd+y6Hs8
 2OUzmzyam7E5+rmrj+Vc5+XG9cLoteQ=
X-Proofpoint-ORIG-GUID: _jFSAt10hpwjUMMZGy3LlpiZ8KtEcvRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXyHbaSyoCAsSK
 EupIy5KVsp2wD1pl45LoZQbRtLciPmXptMyQdRJfYoDSXvmfAK8nPixAcsQYRzAlqKPbJztTkJh
 kf9dsW4nrFDEUsTS/tG0hDEbx860nxeFt1fJmQjWD9fQCCE6L5mfLRUjSakmoep7J+tkN3N0BKZ
 eNehVSU5EIxQctvdaeqba8mfFG/HxtYMzhPImOOOCWAjLqrqzaBVv/KYeK60BV83DiYHnD0hsbf
 qUt4afQLscjzNq4+sMn2XZwm0ouVtyt34enpt2xYhXk+v+XhC63pNwAhX9cC50jnjc1xzWa0Gha
 d8sKYSjqsrJU8JCThpiaEzCw5Weq4wa9tB6N2/jG7fkv/wb45J67jMwsHbGB1yHPXbq2ZMtJr67
 hfyR+c0gAeGPmvmyWL1Xn4VlYNfLORAGwLcNLGQvbOGfOHK5wBf2rzBLupPoN832i4RV/3pp9Mg
 eLIa9UnZwlv0RHwZOQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Testing feedback:
 - Konrad Dybcio reported running a slightly modified version of this
   series on Agatti with no obvious issues:
   https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/

---
Changes in v5:
 - [Patch 0001] Add a compatible for a SoC that supports EUD over two
   ports, restrict paths based on SoC hardware, and improve the commit
   message [Krzysztof/Dmitry]
 - [Patch 0002/0003] Document error codes in ABI doc.
 - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
   Add a dr_mode check to handle cases where the USB controller
   operates in a fixed role without role-switch support (based on
   internal testing).
 - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
   device role entry/exit [Peter]. Allow EUD to be powered on only in
   device role and defer enablement in other roles until the port
   switches to device role.
 - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/

Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (9):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
  arm64: dts: qcom: Map USB connector to EUD on Kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 332 ++++++++++++++++--
 12 files changed, 513 insertions(+), 69 deletions(-)

-- 
2.34.1

