Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA9A43BDB6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320855; cv=none; b=hCrJs8kDKpa2rNe4cCtPNby6fV+c6kG9SMSB7dCQISXuSTDf0/WsvA9PYiC+q2hIiTYfgtN/d5J0gbL8gugWFZxbjpxkPTfIIUwTMPY3Bk9X5dexYvl2DoXbpKkbnw8SUI0HoXo81ZUC6Oz0cSEr/d4hMgtm4K9KcCAqpgVTlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320855; c=relaxed/simple;
	bh=zG6hfogN1QbgPMv3UdSFqanqcDvbviqWkuzyXTsFFek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRcQQDLCnF8j3VqGIaHEL58ruAk6xekdYRKWacfMCnqbq/Y7rNwh8T1zM+wPxp1WFyfeyW2lGEZrJHwTLYobbSmTrks7gGbcRQPJra4bH3va3GZC0Ue23CRJbYL8d5AvYRKt8oW+k4rAME1Sf4ZfQXQMj3zfnmFgCyjd2kuaEGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JezCoWW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6GJGU53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JezCoWW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6GJGU53"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fW2M1054071
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TsvQ5qZzRdvqfu8ZM+ifDB
	ppNvF7vGfqrD6pbLxq4SQ=; b=JezCoWW9q/kLpz6O29Xb4zJV5qdY71GOniK0ZQ
	lcVCp64hiDoVsVux+vJHsHk+qelRI6x99QOVCzYarrTsOZq/lYUEcok7QBDY5Tn7
	axlCuOeqg3k+T+IjLC3PWtjbmINyPz8y6DoJhrMWMSvaZSS+xuViT6oGjQ0WLxWW
	XFerhwnYjIplN6O+ZTQlLzyICkMJ0pOSDjtNMjWcl3zoAzoP+lpJMgd95LOBJPCR
	ih5xwTrXoPlMVkwkt/CiNPaAtDy7nwVWPbhCvoHWSLvlAlZ4hnpAc5EFU5Th8orX
	zRDvqs3LMtTNXxPMVwlszEiLA1KO4wnZtb5CeJFQhqtGHYIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa301fs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so167321a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320852; x=1785925652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TsvQ5qZzRdvqfu8ZM+ifDBppNvF7vGfqrD6pbLxq4SQ=;
        b=a6GJGU53QlBbV8XEeR0f2PIfuKeWKrVTtM8c0KGiUcekbjEJJ13i28RB3HeJlOUDOF
         rxhdSaXbrTQAr/euj0NmJTv2H6Ap1YhkDbXD3n4op2n4UaFr7FPr6Oz6HZndDAorEakT
         CtX2QBP/KpYO8PhNhZ4sCHNhSNz6Vterx+5XmBQlD5Ffbdwdx2CzjErhQbVXwH7wTmFQ
         jG2SxPPPfZztUsFBg+fOURzHyYciGOKgHAMrte1oJVNDtSL1Akr/ZeC+pMPqMuJvqZxk
         t9NbEHwVTmX5Qt6rIHOrW2q4BUa0Or8ELF3VcvLqL/MJW7khtcjGF4j7IUX12x/fkOJM
         lnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320852; x=1785925652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TsvQ5qZzRdvqfu8ZM+ifDBppNvF7vGfqrD6pbLxq4SQ=;
        b=o4ODXl/I7OsUx50vmlNWAR2qjwOnePczjFMtUbi+EopQrXCyy1HyvqR4VGQjQPG2qY
         Oyo+s7EZrV9MYx5VdHGrAGpcM2WBIdZozvwhFvEBL7FUJe75EDxn3HVGPB9tEFtikjoc
         abssso9u4yEjBmP7rRmTx/xF32bC5PbSrlpZ991URpQYGW2Xc3TXVdPgn0qDRJhMccqF
         +GKkqTCp8syDmZAnu05q5TalmnUedwkbVdxIfL/0QkNQWjAkAiSpybgeNMUtur93puAs
         Y2rbaMOYeqzKU2+iC56vrB0aum2VxfwnmwW8Ms67ggN+uaF652SnEr4p3vieZJ3wuJmk
         arMg==
X-Forwarded-Encrypted: i=1; AHgh+Rrz4pYRhaAOAhg/oKFsVMnVNVsIHMqJIVPGNYcIMAxjEnd96OFzpstFpgBSZLchoHt4DCfbKZjTPkMs@vger.kernel.org
X-Gm-Message-State: AOJu0YxgifqV7h1Pqmi4MTzt3a1tAFmuWGd6C6XAgUSvpiEeBS34MI+/
	dCYmDUooRMjU1ZT8oQCt9Y12o9RM90RyMlle/05rKf3SL+RBEtuwZHUaUm10G4RzE7rc5dyAy3d
	/pDZdkBjpcLitM598S8bAF6x8GkvGEzqHuhLH+wi4nxWcNCr7p09k9UQVxI1NHwSo
X-Gm-Gg: AR+sD12ohdNx5Y+b9ch/Bx8seRC4taoVcbJOyC5gtvLQ3R+bWqUsTFKCRcZKQlNGm2N
	XRbr76x4jsPHxbEWMJk0NUI3FtzJCFtGjIigREuZZcWaUDcRcJQ0U1QZX4ZOm8AcAdJMy/qFSYY
	iFNd7GgWiZ6+te0ywGks4UeFMZFdKRR3yIoGlzgnA5/9NTTTFg1xMUjruoZ2gTdbtAWhFu2HrJ+
	BHNrd7aeGUueEyQG308ov18A9zZq1Um/7qNugyZpOBfoALn41APbyXKnjJi9PMCNU5MHKvftMoN
	Lha3DQWo4ddq5hoWymRqIIggOhtdowa4ocuzS7ZpgmVnIy3cZSsA0eHz+7nILZAoIsi+naTcRa6
	HYhiZgRZczVEKVdH0PGCje7PZPQRJEweqMRt3TOCLib1pWUZ5lQg=
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr5396380a91.2.1785320851609;
        Wed, 29 Jul 2026 03:27:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr5396354a91.2.1785320851214;
        Wed, 29 Jul 2026 03:27:31 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:30 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: hamoa-iot-evk: Enable M.2 Key E
 connector
Date: Wed, 29 Jul 2026 15:57:24 +0530
Message-Id: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzVaWoC/3WNwQ6CMBBEf4Xs2SVlgaKe/A/DoZYiTSzFLjYa0
 n+3cjeZTPImmZkN2ARrGM7FBsFEy9bPGepDAXpS892gHTIDCZKioxon5bxCRzisjJGQhOx011D
 VyhPk1hLMaN/74rXPPFleffjsB5F+6f+tLIFHorZRuhLVeLt45vL5Ug/tnSuzQZ9S+gK0ZCNct
 QAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: XzjUn3YXitL8T5_Qg7HeUL1lXw6oeEhn
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69d594 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=HBrWxFKzBfSoTCUu9e0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX1PXDVz4OlsmW
 409InpTxj6fOy9YMtYY1l4D0k5o3agd+70q/lMUtJ5lYq3Amw9BvbOkWcr+IFzsMWHZJIIAM/Pb
 D/6ZAFsSLRMsXDYjdhsiNUy7bxkpMYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX34iLKgPBut7z
 SW628R7G00QqsocvBLTsTxxRyP1oAKq+wJ1u6IYEWLoPX9YVN32csv55SpXyLkJ88Bl437+egGS
 nWFtrk+UtIZseLPhE7iqUsNmQ/TYImJGtN+/z6zkEcOYabHnNdfWNsgyAIVCP2qp9gJZ1vEHJkG
 IkOZwul8MOjz1LPG2dtOzWgshia8GLTfV0QK4El+EHxvbUObegvCx5ftCW0VRmU3ySCGRaNDlS7
 XNI+/4JEA5zZG5QO6yv4IZzOYomMRJfIsMBn9Y8emJQMpgd9YLRCR3xZajChJef5Krp8/AgPa6e
 dJ8Z7zS61mgAYKuVVchFZJTZYKBPePiBGlUs3t1lGJIazqD5GTdiUB5d1jBJrMHJoMedx7cGVaN
 dY7vaM7+uDnWMSxIvB5ZK1lFsV3QJnS33Ax18ROQxQVZQG8/mHTBeQ7yoEHI8HFHkLgzpIFFq9q
 +2cQN1TYnzzjjZP791Q==
X-Proofpoint-ORIG-GUID: XzjUn3YXitL8T5_Qg7HeUL1lXw6oeEhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

Describe the PCIe M.2 Key E connector on the Hamoa IoT EVK. This is
the DTS half of [1]. The pcie-m2 sub-ID patch is sent independently
as [PATCH v2]; the W_DISABLE2# else-branch patch is dropped in favor
of Chen-Yu Tsai's series [2].

Depends on: [2]

Changes in v3:
- patch 1/3: add uart14_ep, usb_2_m2_ep and pcie4_port0_ep stub endpoints
  in hamoa.dtsi, so board DTS can reference them by label directly; remove
  superfluous comment (Konrad).
- patch 3/3: use &uart14_ep, &usb_2_m2_ep and &pcie4_port0_ep label
  references instead of re-defining port hierarchy in board DTS (Konrad).
- Link to v2: https://lore.kernel.org/r/20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com

Changes in v2:
- Split PATCH 1/3 of [1] into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried:
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop PATCH 3/3 of [1]; use [2] instead (Mani).

Link: [1] https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com/
Link: [2] https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (3):
      arm64: dts: qcom: hamoa: Number usb_2 HS port and add M.2 endpoint stubs
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 170 ++++++++++-------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  29 ++++-
 2 files changed, 87 insertions(+), 112 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

