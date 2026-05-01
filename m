Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FA3C942C
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655201; cv=none; b=ZaqieRHdA2ah+q/XU+f4ol5ntm6Bnrm6Mb17+5d7/rr5DskRGSEHYVBnAfhl5lUWhXJYeBtNA0pUXb750rJ7OKPjUFoUAtM6OmFv1SGAJHnAQm7wZXbTw3rbD7KgtfhhuVNgRbBYHeJg51lEXyWyd34ObJcWXPKwZYvt1IoegNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655201; c=relaxed/simple;
	bh=um2Fwsw6rvf7kRd8oo8QyYOwgm+AurrV4ZG+qMUluyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fPzbZEZms0T31+AWeyG7DRixYTP2DBueuwfSYkgmNrfKisILKdIowy8eIQviNVifc0qC7dfV7ZjvBEKJseHwRVOVUfdB9muTJbjGMlhMxDoV0Dih779mbKPHfXI6ruc2iZfGZhtOP3WCzZOmZIGHpQ1rJHKaTVxGtfZpPdcwj7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJ5WCHOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhTR9lsP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJ5WCHOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhTR9lsP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLrHo987930
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X6aSb18fufpWwdWm48PtfA
	AcEMvP6VgTU96OpcmHLrQ=; b=oJ5WCHOM29Rmtf+aB74L+wEu99OdEW+HicbFOH
	9/7waJ029DZW93x7C8X0AMcYMYoPZkc+/nhjZhPdcxIF8eTZdQtzs3+ulK20NHI6
	6SMhs5+OfG0bH7WzijtKDNnXX0zZ/uVXISuZGqgYCBq0saiQAMqHMgx8Ta0xBhBP
	uYA+n2ijugisdvQPH1pFh9vrDEJadhs+WwojyhK4pmy5ZV2Z/s29O/XwIGk+Sq4N
	sf8NeH50AMl9edGPSFRNd50gLql1rY/3yeMjnxaDK+2Fcj78IEo6WQBpdJnFZt+A
	IaSJrohr7dZ6dN4/7ABClZPnQxCWi8o2fZYl7uWcZ/JYCggQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvjhst3kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so1629761eec.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655197; x=1778259997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6aSb18fufpWwdWm48PtfAAcEMvP6VgTU96OpcmHLrQ=;
        b=KhTR9lsPNNcZ9UvzqgPff9RspypPHWDyQ7JzllV887Kw/6Op54M20odp0czlSRjwa4
         +ZsejCC8HW7MuhZaTBLfj7vmwmor5N/DNEhSR4t/lok2R5PFPkptm8MUCeFx/PUHsgc8
         60Sjf58fGAN54EA3i8xPkzBlhp2/mozTXG6aXApNnA2D6wnqRWCbsVshW0BwbI1P8/US
         HD6uaH5aL6wno98X0cthHDJ0jilVBoagw9G6MJscDkIAAeH8gKfv0dAblPZimruaBe2E
         ftbFKfj8MzK5jt6tFD7LqC0OXKCFtkV6GzZaSOOZXUwo5JKXokf/7/2oNQpg+f7lxJFd
         C5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655197; x=1778259997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6aSb18fufpWwdWm48PtfAAcEMvP6VgTU96OpcmHLrQ=;
        b=DftkD1Nqud7k6ad/a0X28cmnubhAANla4qpKS84rLU4v0WAhSQNLQCl83jdZSN73xz
         FHkz9/T2aphZXJbn02m++kmVRj7hwjTd3wmDuGzLu7RsqiybfFuCO33oZuQPbsUnvODl
         AHH1Hg2CThh/hP20vvGGj+rxxxgG/eSMqHLBGPcoaGixOuPMLEgMWm/BgbOCIty0Bxy+
         fkdcpkV8nUBFa+L5WT6ILEqwA4RHudPT/98KrES/+bZedubVSW5Tm7qGu9RXQmOUsAf4
         gI6aWezdoyP42BGZpw0TVSUtWee98PLVgWbwT5TtxRWiTkxiThojchabLmNTX0JSXOBG
         exvg==
X-Forwarded-Encrypted: i=1; AFNElJ+RwkzsHrW9K9Yi9vEoqb+oACGMuaZoXRNuA5UsZtCZS2NNdFCsFcE4uXi744r8rJHbgYoLrS+w6gcw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1SDRO2QSE+yt/ik6teBtSkbPZj6VkdWdfnw9C+O0Pnp3pwOyf
	vGKaJks3hXa4X7SxZVdQ+ISYji5D8ZnKzYmPilTHUHeif+41V1MUyqDMPY4SGo6kvDuNuEmYg/G
	zLpjT5FGalH569o1tv8DRrR1O2whBtH2iUjDScNMyKSvpLoF3yQBNMWi57iHsxnk8
X-Gm-Gg: AeBDiet6AyCLTCxFeaDACB6USWbX8ZAwjZlH/1DRKfqv4+e8c88vUytLxFukdR7lcfO
	dI1v1jKY7Ug6UlfJdt4nV0xwipQoDY3gmFa50TADJZo63BD4aMdSRR1yWdY4xE3koQ+2DFEeDTD
	U9/0tEN5K7OEBy0WV/vgGQAevo1fTE97ss6E9LK4B5ArhVKhgI8LCH49Crq2WCOwy+aghvW2wc8
	k7Dz9OXXIqXzBNUHYYQfgZvvKn2HKksdB5e+eSHn3012vpbf4ZWtexqVCJ4Yxhk+fBTtM+/zUUF
	jZWir1rNr7A2q+ZVOUO7EQyhRSXARCqIqGQKPIG3Ixjo329VHKbiw9LautGHr5uuyvWsXUzaJ3x
	AODcGaUb+R7spGJ1YUH08NKOr2bxUrOoXNAY5TiFgQ/B3XSGCqWwHVB+aIZgoipZMjsTRAoZk48
	RxbpWmMRBrYg==
X-Received: by 2002:a05:7301:d8f:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2efbb96db14mr84756eec.34.1777655197451;
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
X-Received: by 2002:a05:7301:d8f:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2efbb96db14mr84721eec.34.1777655196683;
        Fri, 01 May 2026 10:06:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
Date: Fri,  1 May 2026 10:06:26 -0700
Message-Id: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Br6tB4X5 c=1 sm=1 tr=0 ts=69f4dd9e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Yfec-YhPFyhUVWsMdDIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KXA7tyQeGnk6VlxO0FJYrPXf4eVE4KZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfXyPLATyY7G6ms
 kG/8ALFMP2XnxX4OiDmPiTEln1Uh8waLbt0O5FYf0xx7v5lhtAh4SCGjB7yDaaklrtWHAf44pvz
 Rs74VJ0Yse/jAmVmrvAlN4g1idkMfKq46Mn6YZsKnsmzumUdmIOTPNqHywu7PyQcrhQzvq/xoKD
 hZQomwRTY/AH0SC9uapbreJ7EnBPOTcTo02C8qivqYSG/lzTZeHoDmeyM+kN8dic14ASveHkA8R
 y+UvSY9jJnHCMTnqql+tdI4EHHN4+K7L5fc3xIrFqqFoMn2rwXYf3YX9VLI6bM1+qbLHc4chAmN
 xqlwg4KtgNbR8iR1cvKLt50ryZo5O6+eGGFTO+/RPgLb36jRyzdloisl85oK5c/W9pZPQ+UcHNO
 RKoDkfLQqwPhoWA+N/A3LMHxfaHaW3Tz25d7JKAyEwA4ZGmOrUSEeG6CAnDsxfYqZDgzvUJJZ6s
 Clo6HU7iP4D998D4bag==
X-Proofpoint-GUID: KXA7tyQeGnk6VlxO0FJYrPXf4eVE4KZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

Note: This v4 revision introduces a design change compared to v3.
Based on discussion and feedback, the binding adopts a child-node-based
model while preserving the legacy top-level 'ports' property. The
child-node approach is required because EUD needs a separate OF graph
per UTMI path to accurately describe per-path role switching.

Link to the discussion leading to this decision:
https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/

---

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

This work builds upon an earlier EUD driver submission:
https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
and extends it with support for multi-port use cases and proper handling
of EUD operation across different USB roles.

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

---
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
  usb: misc: qcom_eud: add host mode coordination
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
  arm64: dts: qcom: Map USB connector to EUD on Kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  16 +
 .../bindings/soc/qcom/qcom,eud.yaml           |  55 ++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 346 ++++++++++++++++--
 10 files changed, 446 insertions(+), 66 deletions(-)

-- 
2.34.1

