Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738877;
	b=0UibTTf9HcCwxD1Q0o+JafmQFo9vcLkUuKgqyYeu6n7IXVPx5u4K6LbfMCcEEYM36x2I
	 QNMx40bxW0MVEI2sYS3aZk6lF5N9ow7iDC4pRLN4l5M2RhqHQAnXcISmUg5MH/TClaQJW
	 dIsRGYczAEL2Od6jwiqZfJzJeQUiaQKpx0DtN4VYSg444IyYhFF5ob4g9ZXxubjj9rHHq
	 OzCMu/LveyzlnC7/A4jsR1FTgg4s2nnQndPMEIeDMaA5JDeAJgYEun0fifvKwo596y0FH
	 6hLvgpKNJMRBZg4C41I/n5wBZIhrvQN+CT0qA9s/YkNTDF4AqoCvB4Zhhdlns6JAVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
	b=nHK3KiymZmMB1MYT2xt8ss96EMVLCHyGOj8phbi7YME6wfb0/IF2k+sEE+kYb6tdJbBk
	 W0cdOdD9hUYFVGYkU9ocE8SctsaKCjJJHV+477mqmQtaP96wZk/5TtXXqZCWFrSYxP6C5
	 CDj9VULb2+NrLODUMQaRB40YeefVsW/aEzzSqmFucAt6Au3uHcHSZf6lknieIDqvi1lTI
	 oBWKhjKSenepqbxMJ3R3+qiTIXAKtGLGpFgJVJu1SMwscjHRHk3MZa02db8LLzKhfvX2o
	 uwufq4vrV0xmY2Emw2YQK3nOPd6e/IRXsT5T9oDWsy2M6Ywbdo2uMQHtJDVZvTG4zLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LqEZs/9C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQyFQ0Er;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B26F606A325
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B26F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqEZs/9C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQyFQ0Er
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FvBo1319415
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p8K8L3wm/2TFwy9MEBg0/j
	022FtSD7ewKzpYCuY3Up4=; b=LqEZs/9CtzveTW1BQmCuKGsRV4Ouli4SjIZIHw
	Kb42DKaWDD3kTRLwXim4TKFL/0VSJ9Cigi2lKKyfGIF9wVVu1JwXsw7DyQENjOJF
	GcBAFyGT/T2QR5Yx9hDIdUpmzaF130CMLw/+Mr5cggLF0Y3k+yLVI4U7hYFEcySU
	fezzCshxBfCfK2+84fgpGxYFwkSMg1z0h81jFjBXm8K3SiFVDt2+jpK+GaSb8oV2
	V2NVi+C0gxdLjyHvTOAGVeFDs4jKzlf/t7N0X1SAVuZCu87rHBSXKUuQQy2jX420
	LiQ1QBFx9Z6lsWRNR+07spaJpZoNDrBIQZU00b87Wgex+wNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9jmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so546093b3a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738875; x=1793343675; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=TQyFQ0ErsxKQjebb6LIqAHQh6FWHYCixcj311dvvQ7oOm8AdxAcuqMlvH5eHLO9iV2
         6/+QNcruh304LmTUVxT+DXC47WMNSsnGeFgORZCz5hlsVN1rgOo16Y2eHKnhXqz5+wQr
         eJjF1WfRAHQ8i5Iv2K3mB8j89WkXApkgdc/rN/aTdy2LXi7kOzuW6qi7vUtGLU2TwAmF
         rKCVyRxNRLMx4U9lH0GKlUOgPzK2JpFynyYQEGZbxNw5pvAurGkLMCdd0IJfen7Ipp8j
         m7txvGxdC6Iure8LeUbOIl6hp7N5RdyjGCkZ4+5ZuK5K+DM46spnN5i1ONbE1J9q9aWW
         mXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738875; x=1793343675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=y8FECuHCxaPL4+aEI5vGKJuNsr2SIZAuMeHl2JrlIRZAShdhw/KOvyddzfQ1XAcYHG
         Aq4VeWDI9drMQLJfxv6+NSV8v7T+/UcFoJKffo8BHXhxqie9l2C0Q2RjUQG1a11Q1bhv
         bF914+PSZcVBX384dGjeAs1aNk83VzY1j7nsRoo/3lCk44JXwiUXoTGAyBoRM+3+5fDF
         Dur6wQBw1Dcdr1uVEDl+0otlSSJcFAI/jFih01SeeAXVX8GDhfPdjVmFfDqqmghsua2f
         sztByrOdxZBEE354yedDFyRTcAJRElgPm5P+L2hjctp4TwpNaAx79VvsHq5XZzXZLhcK
         oE+A==
X-Forwarded-Encrypted: i=1; AKwUvBwQ8NlLemtS25dK+bTVP3UCSxhFACf7BRsZITGH6mah598PjH2fvJMwC82SG5mcIYi9zeRpCNjUV+gq@vger.kernel.org
X-Gm-Message-State: AFq9FYKPoXd/itG84BJ21pg/WIZKTFm4nqQJXJrFk7ZAqjyBjag4S80A
	VetMy0ETB+ELntfeWTVvomz0s/X9dp/rD9MrxWqdAgIathlzClRlm0IiZpBiwsal/yAfCaO1zGk
	nBrdVTr/uUfI422/E3KI4GhzFIGsZv62vB21l0eLRsq4bs8GvYBmyG041SYQk3mTx
X-Gm-Gg: AYBFou1WebTCChjt7u0ndjHbb6GC/Exj0AmKkKfO75zA7VyUxzJ6JY/8NzqP8H23g9P
	yY61eKpnuc+PvkQIIcns7ERSk01N6iM0ZR8bOa4M3/ESZhXDuctfpaVmxeUmWLkEwLC4Pe+/Suk
	S8bSIF65bNziZ9las9RzKT6cDu4L0r/ALySTdnyabdY+XcnjQ29qo7UCOA1ISixxUYPc0zu7tUS
	EFeFUwSOgVab1alDQLlXPBR2hI5sOrYk3lzJ2aiZx4QvLyJhBw3sC8aAKnSEaFUZ6FT9eZeuCEh
	s/cgDgPJzVWYO/8U5UzuW7ekibHLOpPrVYdzGeSZdNeA8C7UC/PFM55U6+rbOFATmR1XwIV8eMf
	KEdVu85V6bhy+UEQESt9ScUtgsS2OFBcGWOqPlnYmMrwP3qFd7EoBTqVS+9eHvhzXcwNosGPxiB
	EaVptH34Di2+zHha3lnV+77w==
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr965990637.70.1792738874947;
        Fri, 23 Oct 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr965967637.70.1792738874414;
        Fri, 23 Oct 2026 00:01:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
Date: Fri, 23 Oct 2026 12:31:03 +0530
Message-Id: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC8G22oC/1WNTQ6DIBSEr2LeuhjEok1X3qNxIfShNBUooLEx3
 r1ou+lmksn8fCsE9BoDXLMVPM46aGuSKU8ZyKEzPRJ9Tx4YZVVBC05G54jw2vSTIzVXZ14LVBd
 ESAvnUenleLtBFwdicInQfpMwiQfKuJ/t3UGHaP37AM/sWPwY1R9jZoQSxQsqy1IoqXhjQ8hfU
 /eUdhzzJNBu2/YB6TORMMkAAAA=
X-Change-ID: 20261015-mpp-bringup-75f457bef8ee
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb063c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5RhubQVxv4Oi
 XYY4IcoYQO0/DXH3etH6LBsIii9F9QQ4G1nfHTWZ4cwYHg8LrWatayhvCR43lsYwETllGb8kNnD
 3MlsqyMWpUVwmizJogRIVdC38pQulDM=
X-Proofpoint-GUID: LJYNfWzKkSEeEbKCw8ac2KyciXmUjCE_
X-Proofpoint-ORIG-GUID: LJYNfWzKkSEeEbKCw8ac2KyciXmUjCE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXyyd15Sx4qkqr
 dsITn9lBthZ0cD+HJY61xybu9LMoef229LAWxYLein622GY697XbLxF/zFhaSFZ9VgH/udukXR5
 lLGNvkRIKztgH1PoDzbRabngt+EPjMjNibVOAB7E+SxU07G1t4ysB0I1BVFb/LmIJz03s6Hzo4c
 ncu8OOXwDaAFk52fDrJkE2Uca72qzjJbnrBhqetLXsPCaKxb2r5MxzZXV8rSMxdtDoQs0jyrXPc
 ojFDaivqSgUXmJdka0YKFb6ETCNVuUTVki7bz2kbW2pqEKQorTsObUD3b28zHCThGZBWM8lgT3P
 KnCqm1HbDl4xhEI9tUYGAHLKCY22oaSlpPycHY0jaSvzO9jHtqCtDeB53tsNSSlwHPum8XQcTRX
 VG+szR+uMxnvWMGe+dGIaPkvHFnDuVuq3PPINXouX2X/bx1a5R/9dg0OpHs/cz4YfqtZQgJA3oy
 9Ptqb0Ilicjx/h3MFGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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

Changes in v3:
- patch 1/17: Update the commit subject and change the file name.
- patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
- Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com

Changes in v2:
- patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
- patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
- patch 16/17: Move the NULL check before the loop.
- Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/

---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432
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
 
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
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
 drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1214 insertions(+), 109 deletions(-)
---
base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
change-id: 20261015-mpp-bringup-75f457bef8ee

