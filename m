Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418533E5A2D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705977; cv=none; b=DR7oEP0mJNPRpPG8mSh2KCsNJOnkJXykNGGA2Mz/0p98RaoU6qOJZ2KSFm2i175ZxhcwSZ7ibXN2XaDZIdxibaDByCokDeMOCFQE421ozLG7x4QMvMLMJSOjgB4GWQhlW4bG1/V4EHffspQNyRWjhJy6tVgf95GVHg+XZ8eMnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705977; c=relaxed/simple;
	bh=sZ3Bgl1SkNEyXTO+EhHTREB285lckQyhpOOgnegCsTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mfy5ALlwfviuhFXsXAxXr4c0W2zAaTScAkcIrEL0cUuljFWdaF6rpaFvfBkPt7t2P1/EN/R3uUpjv8R6ZFPffC2AaQlq6OsxuVJumBStakfNmgarPfNP3wy7DrLwl1c+Ras/l5mhS2WW497RIlaf6y6y1JgvS1fRewJUodAxsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZqfAbTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5sCXKjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZqfAbTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5sCXKjU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P81hLU1707573
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RrAk3Qchsl9HTYYm+whnBS
	rxmWERJEvxM4jVWJl2EWg=; b=mZqfAbTEnRpaIWs5d8tduMEw+NTdHXNbZfILfL
	PLgonA7oeyGfQKdlwL/7MxAasB9hjFNrpCeRUnB/Z1dMtN5PRjCskRWU4q40Ibk+
	n0j6TQMtlzRQUwtQVgEfuiZsbWmB/e3FxaFgtvCPx/y40HLaTAn/IJbwpibYuJ3m
	2VATpCLG0IUave2AI2v09FKzuH2/+L1nA6RxspFDAJGeY08DwFGCC0O31cjMV/yW
	VxJE4/0pNJ+X9P+zw39ZeIiUBAkVfGXcAWo7oCCc5V6raHaTmdyPlqP9dCMoHh5b
	i6KSZ8Ysv7r+FiDqv1sGbryg9tku2wBUYngJfxvaiYYL0HOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpayh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so100893515ad.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705974; x=1780310774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=f5sCXKjUbX8cMPBQkbpYYjyNrp7W9RYFKg9s4+gPVFQgGycqIdaiuUssiqHuqrAXqw
         ju0AitrZTNoEHuDL7VfOyqkF6odkDcsVDZLRTOjHkpfK6Z/lqISg0OusasizbdPM2+0E
         Pp+ieF25Cv3q5HYeRxf92gLbGi+t+1sFUXjTdSaq3XvxdBLICmYvKhto66MVUsuEMTSa
         Wv6aF/qQJiQM0mlCuUtWUerZEDu6x0pAXQR4W2X98yCMYdlfK2MHItMxWPjOXLsPRUKv
         +zEgJxJkmjReJJMHuUPAaj30HzqURFCkP4coJyMPK1iroM4VK08rs+n91+D+xTY2EWPc
         wKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705974; x=1780310774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
        b=khdO7QLe3Zet4SuQpLAM9t7S5MNGxP5MS00mNIbApZ/ejq9PGpjV7oZsusysTNKL+r
         E7iCexWqpV7MPvsHzfupGObzcOJ6T4GOw2J6wS9NwcW81+VPwcvOlE8vF6oS6t+gm4M0
         ll4v7cFhLS5hZFuDf8CPNg6UbPIu5AY0/w5h1JNZd/HUCkdoWB8U/tkej3GI4WL2hrEs
         RmzJ6RVj7wk0byu0AQWuqjvHdrGiju052uzqdmLtLCvB1Hnq2849lks8m08+/86Pt0aE
         ZGPpZya1gA/52RZr2cuAJ+hahv6bj4BORbLR9Nq6xLeGD5zz+SvK7b/ke6uYLYd5u0nH
         VDpA==
X-Forwarded-Encrypted: i=1; AFNElJ+TGZzCy11FsxUnFNTlVSIs11xkNqCwLXgXIrzCC5ClNSmvQVpTZsCpXn1Qb3j00zujAzTwuels7efA@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKYHahoiK3yWBGGkIc8j1zkVI1/GVQsSWRag4ECYtlnzX/YqF
	r9UyqbFHFtnj4GzHkhXPc/H4IcnZrgeipw43tbRunpNc7ijusZoZhxY0H7jznUKesm+F03PGvcU
	GjdKcS4OK7deVz08vwYC/4JLxqhwNzHDgku6uuQj2tE8VMUCIomgnV6IdGzso2iaLoDKrL8/4
X-Gm-Gg: Acq92OGxWFhYiE/c6+XUJvKivHjyPJ2o7//jDFfj7EiSUz9ZauS3HtGwyCqth+3JIqB
	NnTQhM1bYXcaziTVKL+D4zBON+TtbA+LxR4Gdmp6gJ/nIaE886yVYqxb8nGKKYxVgvkBAD11VCL
	n5VCR80CpN65wN0ysuSW3MCln+XNzR+OWXaFuIgvm0rHfq26uS8VK6DLfdpU0SlKcrn7OIY3zCp
	Z0jI+gXuSDkWenPKh8pZkph2Rd72KdIKki2YmlDrtpv14eNh2FZYmO7CwY/aYfQm1eJriG3YbY6
	wCktDq5xdY1dAgTQgM2yOgaJyJDd3ubWLsRrO169vEARGEbRh8a/DDqyhmUrf7+9+znsLGnFAf3
	mLSmPlPLiVNu1bwdVgr0lORpMbAF3f3siSAyJAQ242E4aeA==
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148146155ad.35.1779705974065;
        Mon, 25 May 2026 03:46:14 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr148145745ad.35.1779705973407;
        Mon, 25 May 2026 03:46:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:12 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Mon, 25 May 2026 16:16:02 +0530
Message-Id: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGooFGoC/33MSw6CMBCA4auQri0pfVBw5T2MITAdpYlQbZWoh
 Ltb2LhQTCaT/JPMN5KA3mIg22QkHgcbrOtjqE1CoK37E1JrYhPOeM4kKyme7auuuq4CqAZONct
 ASGMaLZHEp4vHo30s4P4Qu7Xh5vxz8Qc+X1epOIw2wCA3RusG1M6FkF7v9Rlc16VxkVkcxEdRm
 fhSxKyoEoRmBniRrSjyvyKjgnnWKCkkFqb8oUzT9AZZ8FIqPwEAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfXzvAbmatzUxCt
 remETgGZ6YRJ2bYN0jzfOlynhBhbhb7JRRIBXRubGyPwGGa6y57g3vvp+/sPR0tQ50Iqh3u/deL
 qKgX51QI8IXeSbkUzL5Gv7YVth6tBa1vNtEhEEk61yf9mmlAnBjcsZpaNiXFfYUeC6hidqGUElK
 YFKD6ajrpXb7QHrHvUQDtkr50XyMgn1Dl8+Sle2uOVH4znOCpBV7cm6J0t62GQCsQ+sirsiaeLN
 7/dRchbVi+VpfUCb/L1sPRFy4AtBgKUmnW7O4xAyapTTo8o8lw/ntHQhhqjm7Pqk7+gvr9Hza3/
 Kyw8fSmtm5l+9Eo9YWG3FCx+1BxF/HL4u+e7ocn5z9ecVPYcW7c7PX4Ey5igZNIuUuqwrcxq+/N
 L2s7v5EGk35xmmvk/H7jiK88m8B9vJx+vbrWygnMIpx4T3rMbh9FnKnGRky9tYHGCBtOR2G1dzZ
 bVsR1qlfCGaMno4v83g==
X-Proofpoint-GUID: eXXV0Io2HIwTP_4QfRgT84R9lJkJhMRR
X-Proofpoint-ORIG-GUID: eXXV0Io2HIwTP_4QfRgT84R9lJkJhMRR
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a142877 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

