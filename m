Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474831;
	b=femav0MJ9u9e2uA3UCj83Vns4XS8WF8Ezy5FI1/bDiu4jINyQQtAmAFAK77nTuvdmUOE
	 lYZ9ue79XD8PlaZndljZYLEWjCJuQc8iwO6UHfB9VYsgxJByTCZIS/G+wpDqq088nkEZZ
	 /Nm2NANg6sXTvmYHFpBWz80f5yif4R4itnjHOjqLF504gheknvn1yZIZlc+BEEJE1/hYM
	 R6RtsQfyBZGMfQJkAVNvNelFi45gOB2kC7N1LTjxU0zqP5rrWWt6NLth8XjkC25cznTmu
	 wVg6Wlin5+uCJ8n9CKtKUrBTGyEsHwPkcfbdanEyIgG9YGb+EXh/7aqEJk1WkrMec5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cYmTZoPUYSFPWFNC0zeiwN04G1lik/3NZ56mk8EnAuE=;
	b=yEY5UNE1DbbRN2XHGXJHVsPb7IskhsaCpWCsgKWFYGqzUiKmkcAXWERb/z1JARMKCXB/
	 MAYRtZRCg/Btc4QlYponh+L/d4dWf3VZ6hObHfKamnpy2EyQmS4uxykJ67d8Gb46UJkY0
	 dzwjc3lvvZruzdeqoHQYFkxAeFVrMsndIh1jfVVwJU99uc5P+PW2V07ioh6ifeMAU9G5G
	 0V9HBnNgIS/GjzRuxMtj1DdmltjEgvGugZOdYJgJHOMwzJlkV9n6pHvCBhyUDQaT8tYUF
	 u9fF7fyDTBk0pXRRdOKpnwy6X2xwIFJkHsKF7yBQKtaEHPZyZdKMXje7z7cEuGnL3Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGoSKcNV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoQU8Zxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EF606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 271EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGoSKcNV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoQU8Zxt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zgxj2514376
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cYmTZoPUYSFPWFNC0zeiwN
	04G1lik/3NZ56mk8EnAuE=; b=gGoSKcNVu/SdEU0pH75Yf9LDuHrTPf0eLBqJyf
	4VXT+FXjUAurE9zf1w3E1MYLr1yZ8zW9IQ2mq8kgun9yCYoBUvvtcc24c78kluWy
	yygB9W1c3F6VcLOIUacjGCqCCLH6MZniFRVtJSVuwyredPMJCDfgDmN3tgE0wdiu
	249/yAGLW6KbvbTG2q7/plyWbcjL1bJJTXGqVRImd1lnYTpqkjedFuRxJK/t4CT4
	snw5IuUCnM3K3BtxRHnAX/+4ezm6CoLZsAmhVR2U26/boN6w6F3ijO5J2m7NThia
	jDyI+rzKbFMRSicyZxswXbjETFLHZrWKOUm8N8q5Nd6l2eyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tv8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3382426a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474829; x=1795079629; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cYmTZoPUYSFPWFNC0zeiwN04G1lik/3NZ56mk8EnAuE=;
        b=aoQU8ZxtZwbY7DAhn57MuI92mdo5yzNQ4eav8NSAnlC7rVRbFvxadyj2zcgf2CAoh4
         6adBCJQ49sBlvZWwERE3oPHSvgbL/8JRsTf2eX1Qmznhj9vH0z+M311pfQ88gCjuieIy
         3oW+LJJ7AqKVAQUG4rKqExwNVfdeIEotLZXm8X/I6z/l4zQd4FnPdYF38nNspVsz7OhM
         QnGqSKdK+paL1RYiUXsh5Am75S9Wh4hvKMU7ko7AA4ZkV9EXmCOhXQQd8MwIlzvELVbt
         zZwit/5uWqJXpa3UBgMJqTP9DSJbhTcWPEXxsPoDQzODsM+2y6KAkzQDPnJ3zrjEEMXz
         W/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474829; x=1795079629;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cYmTZoPUYSFPWFNC0zeiwN04G1lik/3NZ56mk8EnAuE=;
        b=IFhAX9kUBTzGykYxm+n2UD+B8AB1Zg8ZWrj66Wr6tcqvV1LBOQzIRgHxLCS3kN6j6s
         i0tSsu+8R8c7roRZOexgKOBfHI11v87++eeoW5rSej542w8U4GpTHwIaE9YAjbiBA3Mk
         iIUeWMK7j14xzHixf4OYoJXxJc8zchF1FNpmpPYuSG8MYA3OYaHohZt4nqpFFihg8S2w
         0DEXKFgo3mRrrCpWB0VIYiT/KALiF4NwIcaLUp0AFKRsniitCMQWeBLRv7DsaSLIHmPJ
         wINB+afuvVQ6E0VL+Zc1xjUOwEwO/nwGPrftyNQgfd2EtKjVdeLriqhSvqHidEAFOCiC
         xfMw==
X-Forwarded-Encrypted: i=1; AL+hErFOU7bvprefKGVecphXqP5ZcMTowGYhCYR13QxjXlKGri/AbEtPWxWtL9Bh/IkjZXAkjbY9DPrI+pLa@vger.kernel.org
X-Gm-Message-State: APuU4Z+a9mgavRag/kYP+FDhi14bw5c0c+Gv7bVCMHJeXYW+Bq/ZXQyx
	L8xLqAUHS2dUSg0ap4TlNGUctTDIcYQ8fZuax0p9Sa3/ODSz0dvBug+H2bR4ncAMktgmaYixVgn
	E1NNz8xTRl8D/jzaBaFLddJhA2r1B2Q/iaRdq8e4YYv9mzl8InAxzz7xNv8TRfX9b
X-Gm-Gg: AYBFou3sJm6KWgTvSBoN1l4kvYTO5e0+Sx0u46826kEwzFG1DAwaXSRKZTmoqQpKQkB
	VnfkCFDwssQVX4h4sLOlqNUGopi734XQsss2o0kzksqfEYn0WsUqzC16ag3OcHOZR9uMp3sMewz
	RI8Lb3QLZZnUZG+QiZx34mpuXD4lmi/5FbB2L0Ctg7ciwisP2q2ZF1d2gxbC9hnEig5ZEOgt5lt
	PAckGoO3ww3qzhZzcJB6iwwDa2jsxThk0AvOzioPYzGhyZsYH4lWxCQ2JqY1oM363mViAnUURYr
	XqU5Nmu7mDprts3jZVGW2itMqPU5StlXIHXguuypIeC3gZb6Wv8uSg6FbbEQC0ejBs/e4RI+oin
	ZU7VQ/4pytV4t7kx415W15ML5IK9Z+hxvNqdOT27apkUKHMW0hfTpBLr+8UBWC1+owVvUp6FNoi
	FAWFDsQ9L2
X-Received: by 2002:a17:90b:3b48:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3b182e127d1mr4373574a91.4.1794474828639;
        Thu, 12 Nov 2026 01:13:48 -0800 (PST)
X-Received: by 2002:a17:90b:3b48:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3b182e127d1mr4373555a91.4.1794474828108;
        Thu, 12 Nov 2026 01:13:48 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm3019826a91.8.2026.11.12.01.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:13:46 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v6 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Thu, 12 Nov 2026 14:43:30 +0530
Message-Id: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADuD9WoC/4XPS27DIBAG4KtErEvEgHl11XtUXWAeDVJtJ8ZBj
 iLfPVMvmi6KuhlpND/fDHdS4pxjIa+HO5ljzSVPIzbq5UD8yY2fkeaAPeGMK6ahoxc/DbR3Aw3
 DdaV1yIHGdaHBcmNDL4B5IPj4PMeU1x1+J2Nc6Igp8oGTUy7LNN/2jRX2+X94BcqoSNwGp713W
 r1NpRwvV/eF+eGIZZcrf2qWs6bGUYtJesdBG6FNQxM/GjAOTU2g5mMIkJQBTDa07qkBE02t+/6
 pssx7vI+l0NDkb002NYma9NoyIYzsu/4Pbdu2B3jbg8EFAgAA
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794474821; l=3727;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=S282AAmO4qCH3Q7rBUN1j90iYOz+g1S2HGYvE2MxTzM=;
 b=Pv/8XW3bnfccuJZs6QMW4PkqbumjCKZjlOBGNwqXlKwIn1n+SjVPbKLw8YaOxKOt52RgPMOrK
 PgxfwJ1H+4mAYlfAcTj8CMiSgWgfy9mu3fGt8WCbYb4csvsmQYbGNZZ
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5834d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u9u05p8RAF7SMS7wY-sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LoY_9CvZe5f6Xb0UND7gXOFARn7D83hd
X-Proofpoint-ORIG-GUID: LoY_9CvZe5f6Xb0UND7gXOFARn7D83hd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4zWZLn2pTyOB
 MXgXLaK/ymymsjgPKk+HjC0PW4ImU56jgqx6gavFrt37VK5U3xIZSpTZYDrPRd57jor0igxqKcO
 YUuf6AgRDBDnas3vvNVEZnP9U1Ta6d7qpQDZ8jJjFetvMJGPoKgLc+TeUy104YiTz/E4ivFUzgh
 2vHdHT1lfXYjvITzjBI63QGbUovD7QydA9McKShBGS4AGwQfS76lwP6eZnjVRUIkQRf5mQ94AUo
 SDqAxD/a53ND6xuYvOlmeIv1I8IqPIjx09kpsotgRg7/eE2qL6ZHgrSDHE4juR3RrrWDNSrR311
 bTFk7/qxWehxy/LSBcDObi1NnufO7E6sVrKHErPMANmrEeUtF0AVx5+MJRsrUNOrFF82we7Dq9P
 R5mYeDdVOR1542L6GPDxVMuRybPM2WShGsqbcxz+HLebJ0qxzpMrueiZqpqizVPW7c1GwyXcxI9
 Xll34MuJpkp/JjiTKKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXzg+z4CVaB0si
 WGAwP7lqPeUCbaqBkeBIwwgMDsSpktnTQn8jmUXaVTqggbQ7D0Z1tJzGr92DvC4LN0h8Vh0pp82
 47qbm2cFOEG0wrl8I73Si+IsoU9h/0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

Add memory-region and qcom,vmid properties to the BAM-DMUX binding, and
a qcom,shikra-bam-dmux compatible that requires them. When qcom,vmid is
present, the driver SCM-assigns the entire restricted DMA pool to the
local and remote execution environments before requesting the DMA
channels.

The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
controller references the same pool, its descriptor FIFOs are covered by
the assignment as well.

A related binding change allows the BAM DMA controller to use the same
restricted pool for descriptor FIFO allocations:

https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/
("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v6:
- Request the PC IRQ disabled and enable it at the end of probe, instead
  of reusing remove() on late probe failure (Loic)
- Link to v5: https://lore.kernel.org/r/20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com

Changes in v5:
- Drop the redundant restricted-dma-pool compatible check, since
  is_swiotlb_for_alloc() already covers it (Loic)
- Link to v4: https://lore.kernel.org/r/20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com

Changes in v4:
- Decide the pool reclaim on the remote power vote after disabling the
  PC IRQ (Sashiko)
- Link to v3: https://lore.kernel.org/r/20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com

Changes in v3:
- dt-bindings: Add qcom,shikra-bam-dmux, with qcom,bam-dmux as fallback,
  and require memory-region and qcom,vmid for it (Krzysztof)
- dt-bindings: Drop minItems from qcom,vmid (Krzysztof)
- dt-bindings: Drop the example changes (Krzysztof)
- dt-bindings: Drop the statement about the local VMID from the
  qcom,vmid description (Sashiko)
- Reuse remove() on late probe failure, since the PC IRQ may already
  have powered up the RX path (Sashiko)
- Skip the pool reclaim when the remote did not acknowledge the
  power-down (Sashiko)
- Fail probe if the restricted pool is not attached to the device
  (Sashiko)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com

Changes in v2:
- Replace the Shikra-specific compatible and coherent RX allocation with
  memory-region and qcom,vmid properties.
- Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
- SCM-assign the complete pool before requesting the DMA channels.
- Validate the remote VMID and restricted DMA pool configuration.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com

---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
      net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |  36 ++++++-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 103 ++++++++++++++++++++-
 3 files changed, 138 insertions(+), 2 deletions(-)
---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

