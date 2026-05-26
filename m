Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F83D25D8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786618; cv=none; b=rGpgujQ2DfEQiBVRSE/ILjsljjMf5cZ7Ads82fDaPyljkhbaHf8t1LJglrG24GTDNsS3R/KkkLmvmdsmdAybybBIxrokdzn7KDntmHQqCxxcP5rSFqL0G5rVOxuESV0M6xverPvpXWNYHeyTiBxtAYvD851NyIVmdyH6GS0Difw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786618; c=relaxed/simple;
	bh=Jh4GLxB6Rml7ZWF9Pmj+De43LcnXHClRiwWLaGtJ/UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=edfUIbdF5+b9XK0/zn53DrWjRsoiUVk/dhaQe3OoCjVL2kC8rxbhHC2eiRq/0U0K3tafOlss4IhT2rJTf8rxZAclC3w4xkUlu1zakPLy3UmyVe1eVHPBQf5hBCnoQXt9YabUL3ZCqHskIp3ml5m7fhfjSqHt3t2SVvodEzFAmKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USZUTzBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmTQrCPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USZUTzBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmTQrCPi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q4GCig004544
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNN
	durUkg00=; b=USZUTzBg4njH+5H/R99S3hfvmuV1x5rFLxsREzth4h4en8DAcwb
	PFfU31E6QSzZbxRMa7nXVE65qBYIco+UgZlVNp7NLAef1zxXb4SJ/9PvGPfK7MvP
	6R4xlIackLmYwSJ2yqCK3qHsHrXC4edEVwGK+dc25YuAAhH0eOfizcquCH6qw4zK
	4+SUwXzX6cH/ooTohGOU8ddRf4xObEakPTJu/j/8pjeJOH6IzAWYltPnUyMuBwEJ
	rGBL/uuDM7ciXD4TEGwFRdz02sysfCdcQiDkzkb8lYd97jXel7hWKlVRyTD5EaaN
	DrjvKFZL1MrnJIjFhvD6txpTibGSdtyfEwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm02pp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso113825755ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786612; x=1780391412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNNdurUkg00=;
        b=JmTQrCPiOy/z54R66LiZ3AZAAsHnK9oSa76phr/tjP/59w3FGc8RybYhEAkXvh+x7m
         Wtt2Cn3q6NMiAFfvzPuN5f6Qb7o2C7gsEfwWClkzdB7vaen1v00fwxoZ9bKIiMM9sHqA
         XmpfRQZL20MdD5MuYFm7mvFJVcuUa2jUjhst6xmlim8nlASXyVg4zIY65d037P/wt0RM
         i7cdaI9UZxI1c1LiMgvhcC6sQ5ZpZ8ir2XvSjmFlWCGsTaMEIFI0HyfAyzrgdXKA8I4u
         FRNWItHHhdS8l/hNRZltyu/8R/4+wRLNDU0d5/VyerWwgWmMcngX0xfWAr8bETF3C48C
         tPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786612; x=1780391412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNNdurUkg00=;
        b=jP8DVLQi8tu4UK9JSlreJCZEhcKAq2PaBBKKpJ9HNegqxkb9BxlArBYGxEmtnCHHF8
         0A59GZ7oI8wLfq3C9WYA8+qBTxF3RjdRc4rTT+RhKmiVgR6X4pAKUQQRUAmEd74CV/T+
         76wRjGwBoIYtpXNpLPzl+eNkWRa+F48l8iF9QUOq5Ia+ucnzXISfJd8KnhX9PhsGwNE8
         nhu1X/XY1RakkIoA7duY84e6rdKS6JLSiJZApidEonFkl91uH/Z0Z3/uM/S3yWL5y+pO
         krwujMqohwtXLGhBzb+RSyLDTdy4fuVcpm1nlvBM/6YJPEfpoip5DhcmIwmk4T5qhlRU
         qqog==
X-Forwarded-Encrypted: i=1; AFNElJ828baoOuKiSJQPPuuREItdwm1ccpzYFBYVzKxigahXMDwMXmAv9iidbPLll2sLIoy1zTMS3TwdUwBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5ZIDKHyqisfcRjXTdjne2LXHO3Cv14lBOdGp9zcURVmDE2e5
	tVinISywDA59oXjaHAN65wFBMLOKFs4fobtVN3R6ogCSS298HD0CwtuD2K8bBQvVx3MqqYqkzj9
	uzAvFlHcUZVLrhQsHlkOgGHyq+noTyCBpLlskp8kR9J3eUxXTeP3e57e6fKoVQ8YM
X-Gm-Gg: Acq92OGdDCibm00OR6/gtqGKQ4332Ja2QmYidXgSHYlJ+cb778cFN/R9uF6wLihcmPE
	fF1LFXw/NboKqZyBKNUyQLtRuxwCgj9XworQCLYnQY2VkDX+/8pHT1rrco7l9ZBME2uskDQtm83
	BqhrO5i0q7lZAz/eG4NqcP1CKk4nCVmsdtditagDtgbByUEQwyV6BfQE9yVFquDQMvUB04fJwfo
	pMr2aTj1CsrmyWY3ro+CMvanj6KbETj867Eb5Ss6/rtd3xSbp2TpBAfLiHnc59PuFKfd4MioAzL
	MQOcm5oT30QWvHrnYhzRx16sRO8+r2eJHgHkA2zEgK5F4UMmp7vTVG4a5WUOXqvU8b0kRT7MQwh
	8OofcS895brHw93Kh6+hcKX3Ky0EQKArHJ19Adpq2fMV2lFZhokvMhg==
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr206020105ad.27.1779786612140;
        Tue, 26 May 2026 02:10:12 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr206019725ad.27.1779786611626;
        Tue, 26 May 2026 02:10:11 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:10 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add Hawi UFS PHY and Controller support
Date: Tue, 26 May 2026 14:39:53 +0530
Message-Id: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a156374 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9fS6I-YswbyPyBrBmRbOr8QmbYxw5gYj
X-Proofpoint-ORIG-GUID: 9fS6I-YswbyPyBrBmRbOr8QmbYxw5gYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfX2KRMxZppMSWB
 TZdA9ZG6XsDqeW5gqVW7GAw5S+C48+uokSK9pZ7u74hxNcgvBCrs+Lo4lv02k6EsWZ2n1IjJxHf
 obpxiMLDviRw+I1IH5NpGgBDGH/IAsKIPmje/MH/Fphb+9N1xeR8Ylj4PyGgHRfX/h+geeABm1k
 yxMX+gGU/yoVCPHs+FFmhlMsWeG6JFCtRcwMpq06pO/lB5bqZTj+wJ62dyHrl1uYXf8QLhi6ZZv
 k/fCYFYRAdAR6J9k8QZs4Fm6xrYsdhLBf4fLUXiVxDm0cNmVyxwpd/kajiJ77P0Q3HlROVDjmV0
 CYNNOxQdRkwE1hH9wnoLzLk/pWd86kCWTl2VvvNvuYGhuvsrbW6OfiDd2mGajxhMdhGxh3gDkyf
 BhyrcvJbYfF/G3t1Tbg7/7B6/N4mWeUt66OtOJvbTs08TEuMK/0R+5UO2KWfZ5hlx00KI0FBKzp
 +0eLfLuL+q04EP5R/xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260079

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

changes from V2
1) Addressed Dmitry's comments to remove whitespace and stray line.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 5 files changed, 204 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1

