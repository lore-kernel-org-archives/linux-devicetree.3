Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF04369D6E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209139; cv=none; b=XitTfLDTRffsk+yYmKiJDI3GoeciOUf7z9w5/2fUP4CQjW9qN4pDtKmXOb2wskWHG3SbPlue/6kRlHF9dOIOFQkKJ35jW3U39nFeN47yNOHRIteHp58dm3WAM6nlRg8iBUYGL0l1FQB8ceQFbFDVEVqkN2EdgOz8S/KvKKWKnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209139; c=relaxed/simple;
	bh=Pv0tbeX+TyIfLQovm/ciZVjweVaoKtdkg6d7bQLC8cE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kxwz1El/jNHc6BjwAyKNMw/2ZVqiS95rQ1uSH2BZ9w1kRvAM18sjSseXn7bX1gd2waaK8bMrMRAKVexBfMvFVEXnHVT0JgyFJ6a7znHDGcfncxO1J8O+rM8KqDm0EXrNaLjq0X7iQonycAJAcoSk+RJDiBUATI87jxyDEuqVAok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeXA0PIr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baA7J8me; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeXA0PIr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baA7J8me"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UuNO3243373
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oqS7gcc+7CisJCCUuyfIrz
	xMclU2XzUbuPFvuo6CJlg=; b=OeXA0PIrBGGFyJz45M1c+mBcZUijhLzOlbJmua
	FVQvi9UyZPxEjYaGQZJ4VsBaYKYA6rpIF8f48WgksbnCD94Mlwmxk/SosTUVRgTB
	ir0ijocRaTtT3gREmjZtGmRbA1EQNDfwtP03ONCDkUM2ZE3LAVvz5K1tlimPkBI6
	2pZHEkIwShRpA2yA+DR+yxnJVNDZ3XtEByCbDNR+ZsmjJGu+Lf38K2B/CDF3Wi5g
	n8sB3KF9oFo+rAv8+ep3q/rMCwufhYzm6GwFXvCW29eP96+dgMQjzfhVWH94mYzn
	YXHn1+7EEqE6SEo4amPVS2mJNC15ISRRkOp+XmJsfcL/BcYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyge5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1370417c0bfso591692c88.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209137; x=1782813937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqS7gcc+7CisJCCUuyfIrzxMclU2XzUbuPFvuo6CJlg=;
        b=baA7J8mezPOSLWT5QGU508Pqo3ibNBigKT7Rx6MjTLQBB1B7BZakB4ndYx8n7f1ahm
         ipte35TXiKmmou6BZ4BmEKYOoNucrXCq1jB+q0UGyOgaMnfjmD7arrmFCKRf1na9XJFx
         iFRzQkHtZgWy5wRqLqotM5j2+hNrM3rjT2KA6iyP31U6LMLPtTF2rfVtdQ+Qwi/iZDM2
         FKirtwPdsui4oC+d1F8r2nmz6sc6rQCve3cIczjdPjezB5i3TW7yONz7xDdX2jqddlg1
         HSkwami3aOZ2SaRkLYdK75LtPKYX/woDKupV94gVa0Eq08Wgu9Y2wXJ+hEK2sDFK9q7t
         tClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209137; x=1782813937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqS7gcc+7CisJCCUuyfIrzxMclU2XzUbuPFvuo6CJlg=;
        b=F8x3Igb9Z4OLBnbNhpD/8IOFd7BHiRpcvsez0MFahsWv6hQOh5k87YWxRuq1A7MWq7
         pu6BustSjztmF5qzL/C6N+l++4A3eFUX2wWBNpqvqrcoLGwh+rJi9NwiRim81yOXPQ7K
         DUQaCc0vqMOTWm93ZoSdrsEgGhJKJGGc5PpvpL4k2Dd5QcQYfw2VPh/7/wkQHPYzSB1k
         PcwNa5Wfi90AwHGavpAu340TCF5cOICzDkSvtXh2obESFASuQKV5DSrAK4vqws1wGS4C
         ywPnYUhzZhKKhzg8x2PCtWuQMOKlG6QIu7TaXPW1wDekqEK7W4i72jp3ufvW4cgVlHI8
         Qn2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qaKsi8sI6pqFWzE+MGWnbxAPngKCud1fT53B+n7twq5Z3+GEA/2A/uwGFMTnlrD0LhYfkHtOv61Xe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+SVPBVphHB6QPnFAWQBgSloWRnqLwjJaKX+gW/78IEFQn36Vb
	6ZfYsQi+XIvPwf8rxISAGlpk19B0KUVki3ygalAPk3x4kKGPcx7d30K3uFz3rc8CW0TlDWUq45n
	PFPuJAD2H7fSTpKDNjELDGOj1RrQWBskL3BPlKQP6ZdrLJrUnA/glHq0WlhBs0V5G
X-Gm-Gg: AfdE7ckhcy1GMjWtoNK8GkQiPkui4sPDwfzYDN1stcKTeV02skCRgEBp6ziNOyzBlnk
	pJ2nLPvxhsS7CMmQnmM4VVrqgPXdnTBUBl+Gcfg59NjE0FhPTPYjUERBGhgzM/eK6ltrcISWYlH
	0Mj4AcAcmhmvnctsjvsWpPibJfCL2KzPI7a65Aibc9frv8WycZ1KRCFxgVyCYv1VyNejGH741YS
	B5lCLrXB/Vb+A35go1XIpo+2hdqC1wXvK2UmXTUPSmZnCcJAG57NyvYADk6DYB/enraPeLm9rAo
	HWvDTgKTw4elty9D6B8/GuQ4o9sei8kQGTtVbW1kBmwuTDOUDQ1an7vRiZSdQuxhGBbwHYpU3YZ
	wAVKY0qhzvwIVdz2RZxhkuOmTERo42SkM8DtsWq+ekq9HkEdUpiJvVh5B8WOPig==
X-Received: by 2002:a05:7022:6612:b0:123:3c24:b15 with SMTP id a92af1059eb24-139c3cdd5femr1761237c88.19.1782209136849;
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
X-Received: by 2002:a05:7022:6612:b0:123:3c24:b15 with SMTP id a92af1059eb24-139c3cdd5femr1761189c88.19.1782209136273;
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Add binding and driver for Kaanapali SoCCP
Date: Tue, 23 Jun 2026 03:05:16 -0700
Message-Id: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxaOmoC/02NQQ6CMBBFr0JmbUkLUoIr72FYlGEqjdJiR4mGc
 HcLbtz85CUv7y/AFB0xnLIFIs2OXfAJ6kMGOBh/JeH6xFDIQktdlOLmJ8EBcRJ9jaWtG2klKkj
 +FMm69966tIk7wyS6aDwOW0FqpTdtcPwM8bM/zmqTf/FKNX/xWQsp0Fa9JNUcu8qeA3P+eJk7h
 nHM00C7rusXtku/68AAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=5634;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Pv0tbeX+TyIfLQovm/ciZVjweVaoKtdkg6d7bQLC8cE=;
 b=YQHwEXw9RUamlnh5MA6jW2tMGusMcDiYkJ2avwcDrvHKRilY1ifVbQ3V8y2xV4DuFWqe4dTYd
 8YipdeTQPZQCnoMU8WNBtQBfWKvhUiEKvQahOX7MpUTwIioW2b6rgDV
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX1yOMdWedrh7t
 bek2tM/dXFzjI+LgLS1xYqQmWRBVtuNtbJgrvxxfRkxNM9mxxmL+1a1jsyUSadguZarNLmWj3Su
 FEFzHM2N0bJTTh33vb4Bza9DpK1WpnneXIxRqjY6erwPKZ6ppoSyCcLgMsTj2VB38Gcczntz+9J
 SByYF8s4qWX4pNBn5qjnNoXJ3pOmexVumdkrqA2lUC5qNiKnLs5vXJ7QhyUnKVHCw7VRXRzMhL4
 pVmKXuMO6caLl8lMORng/Vf3qp04QJu1yPX+a7vPsPbgV8vmF15Kvp+MzSgsXfNtDnQT0xIF2GF
 wlDZy6D5H/84doTpWS7f2bTiL4XJJgeZuqaa8j4vsV1/N5AgIpzvqfjAlVKdpFy6aSF2gpFIdbh
 MSFvAwfxkWzKkFRt1dm7WHS1Qztnf27VIajdCb8+htK2Rly+7pei521XykR4cEXYMVgHMfpJa/t
 VeQb3l84c7wBM0XfLew==
X-Proofpoint-GUID: Fh6NQaQJQG6IZ1vfDHwZXy-Uuwp9UJzU
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5a71 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MYv4Gc5Rv-h9wPO-xRgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX1aS7B19hdPyH
 AtDb7bgtflxZj0z2v6hKG18KRsCDcTbPxPKOWOceH1KnqvnEA6Z8il4A8DzbD/F2yGPsE4Be28Q
 WYWhpjS6W4ex0Qg/PTdr4fpbRTwgYTA=
X-Proofpoint-ORIG-GUID: Fh6NQaQJQG6IZ1vfDHwZXy-Uuwp9UJzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached". As the
interrupts are redefined differently for Kaanapali SoCCP, list for the
interrupt properties are moved out of pas-common.

When we return fail in the rproc attach op, current remoteproc core cannot
handle it correctly for further recovery/firmware loading, which should be
generic problem shared across all remoteproc drivers that do attach and
not mandatory for normal bring up, a separate series is used for resolving
this:
https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v7:
- minor coding style fix - Shawn
- check stop-ack and shutdown-ack when doing attach - Stephan
- update "qcom,smem-states" to fix phandle-array check fail - Rob
- Add interrupt list to qcom,shikra-pas.yaml
- pick binding for Maili SoCCP
- Link to v1: https://lore.kernel.org/r/20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com

Changes in v6:
- remove ping-pong in the attach workflow - Bjorn
- fix handover_irq imbalance - Stephan
- add attaach callback to minidump ops table - Jie
- pick binding for Hawi SoCCP
- Link to v5: https://lore.kernel.org/r/20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com

Changes in v5:
- squash "qcom,smem-states" patch with the change changing pas-common
- drop the patch that set recovery_disabled
- remove the 5 seconds timeout in qcom_pas_attach and related logic
- patch rebase and add reviewed-by tag
- Link to v4: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/

Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

Mukesh Ojha (1):
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi and Maili SoC

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 156 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 ++--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  20 +++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_common.h                   |   6 +
 drivers/remoteproc/qcom_q6v5.c                     |   3 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  86 ++++++++++++
 drivers/remoteproc/qcom_sysmon.c                   |  19 +++
 20 files changed, 642 insertions(+), 76 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260623-knp-soccp-d7c3f790f0c1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

