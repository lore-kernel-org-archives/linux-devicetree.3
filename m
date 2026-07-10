Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B073B27CD
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665592; cv=none; b=k+gVshFYdmdtRQlelXx25G7+M+/fKOQZO2ZNIIsFs98TK0rFIjp1jP9MfaiYNEJru8WRyC4ipZK2+P2azE/M3cNUt+2ldGHR1p51lkfsUj9ZWg8fRR0XsAeQlzDu2GfJLft26180y2Qq+Z0U0hVnYrMK2w9npEVY8xyDcPSNqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665592; c=relaxed/simple;
	bh=GjPLiNk5kURIAhDWZegJ8UV9Fu+vWfE2XaV7dhLeeYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WEO4AWsyOJw3QBBAetC7LVR3dPu6d6qoIgPNI5E70muN5JAX6ssDl1Qt3WUclAC183veAvy6WzwwZvYSk67lDy/0XLg11yAKBNRGTmXfV4bYMN9g9Bd+Ir9cpl9tbLSVfRBlKdmgCSh3iC2abKdFEZITGh2sGPmUckcdfwOM5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8iCJmMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9T1L2oZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8iCJmMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9T1L2oZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mhtY3847265
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EW5YB1F8FHpFPJHBNFxgrJ
	BQVmDA7bsp9InxtpYa5Q0=; b=X8iCJmMFk0LVPIFxQ7OEgYxTbgUdkoOTZgiGGo
	/7TK3VwjnBLg6JoaFk3mEznVXn7SGf+RBD0VKePJuLYtaJeYN3AQQ23IGsmqAmEX
	Jz1arM/g42ey9fPAY3PfDANTb4fp934vW8Ue/RRsrB1GTGM1N6Mx/FBhP02jq54J
	fsJUFZDQRGQKBv2dqP/3Z7b6GjXgSbvawTh9U2IIbs8t2VyAyS+iuxw7AeQLFXw0
	X6d96D9usFPufdXWqHz91/yLGx9TMlGJiNagF4SB3fGozttp6dATqCm5lnsB/fJy
	MrnbJUYRL4jkugZN/OMexDb6EZjUsHCLT46/aGnBw4YEqH7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte1s8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a298cd62so568203a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665588; x=1784270388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EW5YB1F8FHpFPJHBNFxgrJBQVmDA7bsp9InxtpYa5Q0=;
        b=F9T1L2oZbXxfCJXQ+tRq2N6Czhzf2UEc/Xtzk2BwvjQLmc5IjeqZZh+xkz+lnsgJiQ
         roU45ZOfaojOstEy0aWdAhPXZWbw1C8aees1qvy1UAuhI5PcMXziYHwfK7m1FX5ZYDQb
         dtaANKLmXxTNEF054mchduToV8ObN05XwaElvPlU3DdsEF/vE5nS2VF6Kbl2ulV47gad
         ksfqDvQKaHHW03PyWa2Ot0Zr53i37Hmb7GUBaGTE6wHBLTXfMaekIWgvkwsqXj5y07rz
         TNHCodRGIq+LcqTSDPZBtpJANL0a/+pc2QKqHNlXPheKiwKxWnUCwDuBo/b1GHoO1YDs
         9SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665588; x=1784270388;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EW5YB1F8FHpFPJHBNFxgrJBQVmDA7bsp9InxtpYa5Q0=;
        b=ACzUlE7mHJZamvcVDnjQiVj5WoMpsGF0AqSycsSXPN8EB5FtBrbFACm1vUX1+PCnbM
         yGkvbOURhyup6fVNsP87+xmEIbsROk3kwZjHN97/Qd87ooYMv3UvuqS28NkKOtsAMXIz
         0UYYtuFj9F4HdSeDNYlcS6U7ldc6gDPo0Vr9MZmoB/G+PSdbrDbMCBhZl3LOVOO6u2zo
         va4qkF+zuWZo9eUVtCwFlpg8432TYsfRejEeLb+BW6ewP7tZZ/t2DifkIjb3yd/1j/5R
         MmeA5qZPWqt6gIBbAlVdpSV1+JfHcPcZXn+j3X6ja07ymtoL+7D4V3f0lHAqw82OHO4k
         0z9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrrbOgzjcXklSvcvNnOmu97GeUEOOyoEhKo8vqaveEou9t5qjzSPFJl+Eh2RT3NaKFftk8j6B2YknDH@vger.kernel.org
X-Gm-Message-State: AOJu0YxRzsbIV9LHbJ2YCbqpz0GkRRO+/SGdjIBS2+79LwTErq+d2tAU
	zmL11PkmKorpscPGYIW3LtKbEnNz7LMiGknaqID6kxZvRLiBmYzvYW2tb2jPSGcbzVDtZMb21rA
	qtR1dhFfw12c0VfKmTzA8lt0YzDwlhbPFVkNlGT54/Jaow425X8GOKwlxMBuVcrbd
X-Gm-Gg: AfdE7ckPOvGw7eC09PMyRzwQaSWc5J5InQ7UiuvYMq7+RR/C1xGO1QAHFlUqGb6DiQo
	yQb97ZLhqoiHaOEhcRQKBw5pfKH4A+J9UlKyWnAArabihUt6zB/dMcLVbxzrWYAt5zCobjf6X/+
	CDA2uhyiF0sffBeFNuNgEjz3QmXiC4y0ufoWAgveDiYoVFEkiY1vGvbsQZr02X/T519DBixq+hn
	OeqLR3Cer10QDX0rDEUCR2DbFY6wb/WD7h1ehomG9Pf8yHBk+bdGcLPccvlZ4PequESd81u4CAL
	ijpyOwizoYd1jI/KCB8/LSb9KqSnHuI4VyOFTEsfgPpQaAW+Jze/GQeAO/YcS3QNaOhzzjv7ULF
	hbkjMrjA9XTnrTvgZ0BwXiISPGvJPjDTeSOQExllWxEsZFgqEHU3BsJgKY/Qn
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr11786907637.47.1783665587881;
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr11786870637.47.1783665587359;
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:46 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Thu, 09 Jul 2026 23:39:41 -0700
Message-Id: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2TUGoC/23NQQ6CMBAF0KuQri0ZSyniynsYF1BaqBGKHSASw
 t1tMSZq3Ezykz/vLwSVMwrJMVqIU5NBYzsfxC4isim6WlFT+UwYMAEZMFrf5nZ0FK2UPT3oFKq
 cZ1rAnviX3iltHht3vrwyjuVVySEYodEYHKybt72Jh96bTr7piVOgZQZCcpmXiWInixjfx+Imb
 dvG/pCwMKWfRvZjpN6ANMnzRIMUWv0x1nV9AvvfgH8FAQAA
X-Change-ID: 20260702-glymur-soccp-8f50d947f601
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=4740;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=GjPLiNk5kURIAhDWZegJ8UV9Fu+vWfE2XaV7dhLeeYw=;
 b=8eJrPBaStZIimBxa3XctHLPhaamivcJaclrfJmuwB8xMFRWkMvX0bPwQtjbZYd57uqFY7NZqA
 07lkVRsn1M2B0buZeaR09js7rqJ/KD0r1vRbRmycXFkEWQ4S7JKF57r
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: 8222RIVBmifTWSvD5giSuJcyXolwMA61
X-Proofpoint-ORIG-GUID: 8222RIVBmifTWSvD5giSuJcyXolwMA61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXwbo2IXVRXz7j
 9hHtdtGH/C9YmZjR0puu46fyqiQUkeoD/IdRGFSVQttGXD+3YlRTwoAzlM2VRnGieg4rF+tIumM
 w0+Bw0maMq76Grx39PJNMxK5ZUhIJzW5wFh0A2e+py8o1gpgzKOhqY/ggs7pXtaWVcF0XAMiFQg
 Zn4HCPv0G+6FVOnjhS/cOZu2+y+WVedSmLKciqkQKMrsnnjpp/CJJgZ+rWKlIqdJK/JJfyeZ+lx
 IKKEQ6YeL/4aZTTRtTtcuSvsnVCqWv2xWdG9eBJ3YWuvITkEvEM44nw0K3Q+XmsmIpMZaJ0dYJ/
 JO/vZdAeIRBJptJaLsnHyUSpYbYk0OAqHURQ/lYlqGEEykHYfP+t3rAyHCysh+E05sUnOSJ781Y
 w9gH7Zda68UDy3XbOyaDM5kmEpqqI4vQeNNGHxOLbigtH9/HvZNTJLxyvqMuHWM6KLF9mU10oIe
 73Ul/byytZ9VaFPSloA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a5093b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEyMePVOpC-_YXVUAVYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX5oi4E3NwuXHh
 zUshdk5zSPDBFmRZP2Yci3TqEUPSHbhGBMgg8Y//nR+1qAdv4CAThTa06UQyBF+p+JQcAnoHmCc
 +xaEz2SjnPMMZuu8lk6sCOGtiqG8b3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
This series add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

It also introduces the needs_tzmem flag which would cover for certain edge
cases by serving as an alternate trigger to the PAS helpers to ensure that
SHM bridge is established on SoCs running non-Gunyah based Hypervisors. This
change is required for SSR to work on SoCCP on Glymur.

Since Kaanapali SoCCP does not require or enable needs_tzmem, SoCCP falling
back to qcom,kaanapali-soccp-pas binding will break SSR on Glymur. Hence
qcom,glymur-soccp-pas is decoupled from the former and added standalone
(simply dropping the fallback would result in a dtbs_check failure).

We added SoCCP SSR verification support in diag upstream. SoCCP SSR on
Glymur can be triggered using the following commands using diag:
  error fatal: send_data 75 37 03 152 00
  wdog bite: send_data 75 37 03 152 01
  Software exception (Null pointer): send_data 75 37 03 152 02
  software exception (div by 0): send_data 75 37 03 152 03

/ # send_data 75 37 03 152 03
75 37 3 152
/ # qcom_q6v5_pas d00000.remoteproc: fatal error received: EX:idle:0x0xa90cc050:PC=0xa8eb5d8c:LR=0xa8fe5b3a:CAUSE=0xb:REASON=0x4
 remoteproc remoteproc0: crash detected in soccp: type fatal error
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 remoteproc remoteproc0: handling crash #4 in soccp
 remoteproc remoteproc0: recovering soccp
 ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -104
 remoteproc remoteproc0: stopped remote processor soccp
 usb 3-1: USB disconnect, device number 3
 usb 5-1: USB disconnect, device number 2
 r8152-cfgselector 5-1.3: USB disconnect, device number 3
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
 remoteproc remoteproc0: remote processor soccp is now up

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Changes in v6:
  - decoupled qcom,glymur-soccp-pas from qcom,kaanapali-soccp-pas and added it standalone
  - dropped qcom,kaanapali-soccp-pas fallback
  - dropped status = "okay" in glymur-crd.dtsi for remoteproc_soccp, as it is never disabled
  - picked up "Reviewed-by"
  - Link to v5: https://patch.msgid.link/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com

Changes in v5:
  - sorted soccp memory regions in ascending order
  - readded qcom,kaanapali-soccp-pas compatible as fallback
  - updated commit messages
  - Link to v4: https://patch.msgid.link/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com

Changes in v4:
  - dropped soccp from remoteproc node name
  - dropped status=disabled
  - added a new needs_tzmem flag in qcom_q6v5_pas platform driver, and added glymur_soccp_resource
    which uses the flag
  - dropped qcom,kaanapali-soccp-pas compatible, due to the kaanapali_soccp_resource not having the
    needs_tzmem flag enabled
  - fixed memory region mappings for glymur soccp
  - Link to v3: https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com

Changes in v3:
  - dropped smp2p nodes which are already merged, and adsp and cdsp nodes
  - updated interrupts-extended (dropped  <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>), interrupt-names
    (dropped wake-ack), smem-states (dropped <&soccp_smp2p_out 10>, <&soccp_smp2p_out 9>), and
    smem-state-names (dropped wakeup, sleep)
  - fixed IPCC names, GLYMUR_MPROC_SOCCP -> IPCC_MPROC_SOCCP
  - Link to v2: https://lore.kernel.org/lkml/20250925-v3_glymur_introduction-v2-24-8e1533a58d2d@oss.qualcomm.com/

Changes in v2:
  - None related to soccp
  - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

---
Ananthu C V (3):
      dt-bindings: remoteproc: qcom: move glymur SoCCP pas to standalone
      remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
      arm64: dts: qcom: fix SoCCP memory mappings for Glymur

Sibi Sankar (1):
      arm64: dts: qcom: add SoCCP DT node for Glymur

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  5 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 52 ++++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 +++++++++-
 4 files changed, 76 insertions(+), 7 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260702-glymur-soccp-8f50d947f601

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>

