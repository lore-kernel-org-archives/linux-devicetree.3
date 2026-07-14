Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C9265629
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005285; cv=none; b=tDs4zdd93tTtObx2wPsX/UAGj/cyDA4P4TnaYBPwIYjZkM7yJMYH2vTM0S0gktxlQcTPSamP9YgimjKgQeLVpnSHYztXmxhbP3z5j9Vy8ZY4UCjT7GK/zYCZ33NqslOpjCWx/C9OMLgOKgBafQXi3A9DhCwcXupq7u3bdwToNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005285; c=relaxed/simple;
	bh=xxXQ3tAzhzcpJZwiK3EmmM7EKtPJpwX+UibM6B9KZLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfaNwAye15ZfDLHE0H3Y3Avn4rImFUg/iYdXoRohaw7h7JtaiieHU1sbE73CXdw8/vOr2HM2wTI6QdUS9C+N1NRF9REUB4QTNF/D1JHkCVHrYf0u+p5sjLvyatrvTnCxCm1tm2f0gTqeS0IxBk7RgxAP3JDzIpOL3pJw3H7yRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDb3qg2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2C4xIjw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDb3qg2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2C4xIjw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3865S3181788
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=70vSSYIPe/KVT6CXE0EZM6
	VHwpcK5x/cEFZ3CpOklkI=; b=fDb3qg2f/TqDV6WpAKpRR3XeqAQqUM8poC3jQL
	5QNU2kuXYoKcNPXKdCFrU34U+NS5yFkYzkGxRE0qewmrAI5Etz9Wxaw1PsXqDS7l
	6WmaNCZ2gcEcjo9HwAC02TATm3c2bc7xTa1jXhFmlL/LcWSOwll+JXfpjPol+Q04
	YaulhszeqrclK9VwV0evZsfhKNECWBEs+W96x+ZfSlGUBTQGtEsQRpiu2dtmFMMW
	B4fw6z7NikNiRXby2qBWmp0x3RaxNgNjOtCfzy9fjY7s9RkvZcx86s2zCvNClt0t
	AIZqURVgJByJga+ZcamF9E7gf1i1PCcelcxUtOA/v62Wt5KQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4quym1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:01:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso5763683a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005282; x=1784610082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=70vSSYIPe/KVT6CXE0EZM6VHwpcK5x/cEFZ3CpOklkI=;
        b=j2C4xIjwoVtAgLtI6D3pYhBUOeZislgBXcKdOB8bCozPGTx1kjFC3ERpWCMxoGfZsY
         0FeQ98s1apX0ks+sbxcv4IUqeZiO6OfrQ4km0G+OJG7XWFzydxE4l0kYMVSAIjlY923j
         QQSr2P6gF7ORY8Mr0bGF3a9yVV77AMuqn5RR+MG2oXbZ/WP4c2TcGTzXN0K9FgL6G0Iv
         PcAd65tAIywb/2UrCptpL81DepvtJZsLgukpEXqvrkxAxRUiN1Qqcc+Z6AsWGG6hUKhL
         kQg5eU+nmXTzAnOYlFxhWxukk8gq3UJuKiWAkcQnfbMS19v04qkOub7E+Tn/lLuWz5gy
         Vdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005282; x=1784610082;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70vSSYIPe/KVT6CXE0EZM6VHwpcK5x/cEFZ3CpOklkI=;
        b=Jx5/Ks01ue3ARJkMeDjqbXeZ1lf9lbYbijJa/FPq36Rh2AXBGyZl+4qx4MAAKlhOB3
         68YJnucR/v7Nfdom365Z+mwcqI19PkGwji5a16hR+tTyLbIJeCz8CvlRhACJDs96qrnT
         /+RRRLduEroZs1Cfg9PT+b+H22d+HFl46IM9rJ306j2yesQKE2UdNgUpskXsb310yPGg
         oyJG8HAxBLnk/hfCO7agUVZs1nNT/hjtXH1L6KwTcPgCwItSS9Le0uAddB7tI2ayn/Xn
         yTa5glLgZ/skYQpsUc8zFGa9MkAdE4cALm74I+qHa9rCi3+YjiTY056j+PkPk2mPCvSi
         ZYnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzcMPh9mvTZatvDmvKJmVHr2yAnnf08wVT5SzxWUz/bq2ND7Lizmj3cKmjEd8VNjV998PdBze+IgUH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7VaGCr6rnjpmCgFtbRt2CbN9BIwRo5XBuJDL6JvnFUJ52OCim
	I5mzyXY/mWq++Piijyx75ZkCf5bW5DKkp/3FbgNnBAqFlpn6C8a/+/56Q0UCPQRhCagGSu3ZS9f
	XGrNuxN2Vk65Ka37p1dByYtoZeEnxGrkxfuvRLrUm2yivWKXaTHmXeFqYFhUAqPhx
X-Gm-Gg: AfdE7cla60qLRkKdfryHtId6oVv0jpdoEP4PJeYMaHw02GD+f+nvh5fMvx3/9bQvK51
	H9INRgmDnnzxwqqIvmUAd3Vgh4yLTzEChRMbz1AOFYWSLALslSowOPr+8LQw6caVG6lVv/BHWu9
	wnrIAIrEAhY8v98nYLzRDgWQrB3j9sWjk/+uy6BnNdO9PbbIoflHl1vUrP6p7vgTITt3zEOHOm4
	yxBPG1DJnEMe1iPrNzhhg096tgQbmnDrzOMw/ubRO2aRp/gX5lzIHY7aDzyffLiLST8m+PDYeB1
	xz2LOWpvJJCi+Pu/Fp64eRv/TjjZXyuGCtTu8ev8sXguXI1Hgki2Z4EEQM/pDICqnxfzcqrKLJC
	ldxh/vvUarjhDIAaUbzdlbHGfrIII8qvo02VwPFb3mn0MGQ0=
X-Received: by 2002:a05:6a20:4322:b0:3c0:9c19:65c1 with SMTP id adf61e73a8af0-3c110a7743amr11079341637.73.1784005282418;
        Mon, 13 Jul 2026 22:01:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:3c0:9c19:65c1 with SMTP id adf61e73a8af0-3c110a7743amr11079305637.73.1784005282014;
        Mon, 13 Jul 2026 22:01:22 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm9327406a12.32.2026.07.13.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:21 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH 0/2] dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs
 to a remote VMID
Date: Tue, 14 Jul 2026 10:30:21 +0530
Message-Id: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXCVWoC/x3MPQqAMAxA4atIZgOt/3gVcahN1Ay12ooI4t0tj
 t/w3gORg3CEPnsg8CVR/Jag8wzsaraFUSgZClU0qtUVHtY7nIxDcgYvJ4R8n9iZcqLS1lYphtT
 ugWe5/+8wvu8HaHaAKWcAAAA=
X-Change-ID: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005277; l=1298;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=xxXQ3tAzhzcpJZwiK3EmmM7EKtPJpwX+UibM6B9KZLg=;
 b=0SYCckzh+nhKn5OMcxLMUXqfilZkbxew8z2T7I1A2nj9YXJrur+EUV3Uc8Djw5DKBGofyWgSe
 DuHn/VyIdM2DLaAOKKZUtu8q1DLz2AqY0ovnJ0uXvzv0HtgdVnOFtD9
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3saTW8/cWkzc
 wRb3YEDnzV4Ve9um+DzxE8WmmmiYpqzQEhi49qdiarrqotlipeyvq29RUeG6mgg7mG1BTfaSwmG
 WrnUFppfFtz/TWpUCvlcSf2RNaOcOXm7ZYG2jNXxHPLR4htR+TBal1BQXjgrH7ifY8JZzhvl3E7
 nmVc1mxDTvzyD7rwMui5ChGgkXWWjwkwbR4e6EdaceFOfatyxU3ERKddKAIQcHeUW0Be5xdW0ms
 2pZEpx0ghYEh1sw8LUrhm0XrK8z0y9qk9f7Lzmla4yimnfe+mDhFoUMReaRZ+enRj9fJS9FV8Qr
 dkhCpeETiYdDNfZTPZ1B36QzA6w/DVO0s1X7ZzsG4TthINAapGtBBhQVDcBZ/P3gob/sfIc6lZn
 ztNsAD8ZVre9/AqVYjf6T4+d4l1GtN0/UdYDIU8TfX4YT8OADkK3bRzQ2uUETbx5IjXiI2j0MKW
 l2b5V0DOm+Vl/sFedFA==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a55c2a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ByYuNnzN2TCMuokQ2IwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yjiHUx5oEHDOUsLvoT1WgDSAreRT_jW7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX4Ut0MhZnkM9h
 3SwxlNH6svJtzpBs9YYQfIErhu1nood6TjnwfVLLWmcvL4HZ9zfQJvmC979P/V8m+iCcGpD57jd
 wqEPXY49+3Bbu/Gj94QaUG6R1cI0NDU=
X-Proofpoint-ORIG-GUID: yjiHUx5oEHDOUsLvoT1WgDSAreRT_jW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047

On Qualcomm SoCs where the BAM is powered by a remote processor that
enforces XPU (eXternal Protection Unit) access control (e.g. the mDSP
on Shikra, VMID 43 / NAV), the BAM reads the descriptor FIFO as an AXI
master under the remote execution environment. Without an SCM grant
for the remote VMID, the first descriptor enqueue faults with an XPU
violation.

This series adds an optional qcom,vmid DT property to the BAM DMA
controller node. When present, the driver SCM-assigns each channel's
descriptor FIFO to HLOS plus the listed VMID(s) so the remote EE can
access it without faulting.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Vishnu Santhosh (2):
      dt-bindings: dma: qcom,bam-dma: Add optional qcom,vmid property
      dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs to a remote VMID

 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  26 +++
 drivers/dma/qcom/Kconfig                           |   1 +
 drivers/dma/qcom/bam_dma.c                         | 197 +++++++++++++++++++--
 3 files changed, 208 insertions(+), 16 deletions(-)
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

