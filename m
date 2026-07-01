Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE633B2AA
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924672; cv=none; b=IVVvaX83TBUhOmTo3BjekO62Z7uTQEeLNI1U6wcpQMmCgWQX0K09F9N9ji8r1pGhYk4YDV2LeyDuWf8TKhOD03sVymEjjfx+5TTY+nPgTMHOQJO01bRiQW9BUohTmLGXghkizV9wqOAP6x8wqZnfOVABh5Ug8EMnLJYIX26/RYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924672; c=relaxed/simple;
	bh=3fa5RxnLg0h9FzDOxZcJ5txMchAfDC1BiBec04p0mAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VSFEOWv0otJ622+UtJhDMVuwcz+sS2JqbmFD+5bfBVFcYKKZZSrw39upJXvPoKakKhte8uEvnKEVrJiB9S4OZ608ln1GRlXpw/sZB6p62FY0H6ktp5Xwr3sqyxj0DJ/d9zGqTSDVeu7y8TwtY4f7t/iJsDIvWia8rH+zDeRzYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVf+vu1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPfDr8FT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVf+vu1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPfDr8FT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmY3t1730545
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeM
	ohFlzEKQ=; b=OVf+vu1KMLMWhmTaAOdmdqHjOjGTw10BCZAUMjFSgDVxKU/VNpt
	rqynSylirdM/apMdUbJiIYL3SwcB0tQyw+jfr9LQjwypkxNZegxwtX59x6WSc9hT
	Nj2RIflfnXDCT8R6gkXM6L/vXjzfDlxVuKcewKMQO1LXwN28+4Ij38BPWx2s0ptr
	Zxbs1x8QSo/Eyvdx8GkC4eWQtf+WDHzROEpaKxFdAfZt6IHlyRh2sgRZD9EPT6Zn
	hEuj3ZlrVOAEPMm4ta/a2/ltI34yQ7/sLwXuIDscBBGlclmBlmFxCKanQbTtWHAV
	VQFfYZL6CkhcKkcJhSb6QEsrLjoIpVdpz3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ahnrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:51:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso701092a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924665; x=1783529465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeMohFlzEKQ=;
        b=RPfDr8FTNtb/j9PGZ7qa5Zt0FKZV7NqkpzxsfMK62E0RfIP1Uvmx1fUEqLISySkO63
         I1gbPGrmbk5BGG1PsGEGcTgVRGxTqAsCC7QF9lktS0gui6eIMWPaDS5rvf8782C9iuaY
         UFnSnK3L9yZfsB/2iUeTRIwwGhimi/yO0bNybYpsFclzRwdg/IzJdf1YLIuYapnahljd
         0ImtIAIZFUBizz17gYW99g+pVfGCl+1xtH4pUGnqNsfu44ZnlMdYsaW5ecpA+vRxMa3X
         cIfXFk17SRBa0JFbndQThQ1OYB6ztP74Y+Czw9smDOpiNk87i+JdTZHccnRI7ZiukVhi
         1jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924665; x=1783529465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeMohFlzEKQ=;
        b=ShXRee1mmaQ3xHkyYVfCSm4lKuM78EKoQYYK6m/kfwb+uVNeOKFQOLiQoyZKvTV3rn
         HoVFhBkvmE+BwS4KNNpTj5qlV+9ar6tlIWvYHfkiaf6At2sIyr+it/cqpy15T5fYW7Ed
         0uWwz2AVkV7MBkiAM6bOjppYTnsbvsLxnAf1+HVRZXFKGQr7Kz2L/Ct21xtI8/vB0jYh
         vV+Ekq4+7sXvC+uVhb3mjNfg5d1QnJ0Qlhwa+IPJh81VdQ8L7fGtdARj192473u1OFig
         QzIUBwayub8MNdTLnp1sDawAZXO1dIxNd6jMdcqjWUXSgbk1vULMz21QXW5rLb2qFX8H
         hGLw==
X-Forwarded-Encrypted: i=1; AHgh+RrsvogLLgKXTU4cO/hLX0d68vQ+j4s2GJ22SAhNxqUqAghdTkb9/cEem7rbCWwbhKTV3qPlTMWhO0yr@vger.kernel.org
X-Gm-Message-State: AOJu0YydH7RY2vA8hJwH8K/Xy7FH2FR1cjkyZDNLmK0YzON4L+SCrycy
	huUcLcAxe84Hp3zuKiqQyAu/xUpXW8rocPS8bNi5w2qjqQ72B/u8QsAbvS1slM4GBlwuzLUyLdO
	qNV5mdbuWnj6KvV2EnhFnOHI/UnosE3a32HK12oHKuU8vDqu8bgKc/5YW83bg+CA5
X-Gm-Gg: AfdE7cmAPY4tZ7L58N3caN5tEFg4858+JUtfqetkk5Xz5d82hoAUUpOKvVXJP0NHelZ
	vZShRoGbhl5T0YLg6mEFi61PMet1Noc/4HtTYI26fQipUHQveKe3hIsdkmlFAj7wmIQ5j4Li+kL
	aByGfX3vwuiyVrJNCd4mbs1BNklrvcDlpH35DD6IkBQDTa0SGrvkb728nuM8D6lxnSTRTAZ8jBJ
	ymIruh5DOa6UmhkmCPS51PDrGMDU7cSWRdRzlG8pbvTTxrKyeEjXeFBmGPfMRWYK+QF1C8RXChd
	5R34Mhm/1c4E0AaQvNBEVLRePlUR37ZloyEdRHSwQpNhI+gMgkFLudATpkcVij0algmt8ijxEeF
	X+is3MMdjiL1JIN+iFDt4GyjI6MRlH9SU9Bg4B3Q1lLqdp0pUJoY/vrUzCPye0MKReenHQEEtRY
	H/uIMv
X-Received: by 2002:a17:90a:d610:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-380aa21f0eemr2164252a91.30.1782924665469;
        Wed, 01 Jul 2026 09:51:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d610:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-380aa21f0eemr2164211a91.30.1782924664973;
        Wed, 01 Jul 2026 09:51:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Wed,  1 Jul 2026 22:20:47 +0530
Message-Id: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4FCvBugXTBUJEz6znlM6E5Yjbct6qFyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX44Moza/2mK7P
 JA1yWcbJiw4aGr0eLYZGY2hwopCt0OyxvhJQMKBQFzcuCGmBXE+TndKfS4a7rgTfNj+IxbTBaPB
 MWH895qPbjy2wVARL/s5RQkUeVkk97YNMZwCB1bvVTlH2hoFlRu0KT0uEy/14ps9rUVPK0ImZQZ
 bONPmUO3s0Woe1AS79mVMSzr4RkyPCH2dAXexb1ZCkensu61tfHsngzpqRX+ifBa2xcot318NFF
 UqgDb6WkjbWxIguOkSvzzzFsql2Z72ZHGiRmqHI+PrBP7FxuV4/CFX90pWyJe8DFBVNzM9a/XhX
 6OiBqbSz6rZXMP2reivguurPLHSuQFLvVU4PO3rdBoiv3/AUB+hNHKwoInZ2/v3qS5y0fsEhY9r
 VevREA67uPRExNrINxNt1ph1SKiQtRdR6+5j3rt4f0+FzWD0K3joOJRcBxLowdF+JZ7V3GWH8Ov
 apsdHUud8GC9RtcV7GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX+GkqbLrhGueq
 QwaNwh71R3popN0Ge73grp0n14qxnV7WPlqoCFqA3leUG3MNvtyijuxtaeug6Zned0+mv2Ihs5K
 IA/3GXJNOYjEg/2vD/SggCD6VnfwxFM=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a45457a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mO9Zq68peapftSoldg4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4FCvBugXTBUJEz6znlM6E5Yjbct6qFyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra
      
Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/
       
Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.
        
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../phy/qcom,qcs615-qmp-usb3dp-phy.yaml       | 54 ++++++++++++++++++-
 .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 53 ++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 16 ++++++
 4 files changed, 120 insertions(+), 4 deletions(-)

-- 
2.34.1

