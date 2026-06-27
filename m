Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD10A2E11B9
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554525; cv=none; b=PRj3/F1RftcSDD5t74ALoeR4UYhmcrdWHkNuUfK1iyauDai5vZpwppw46295Xl7cj8SRtsmuBy0yYQgim0ggJ63itdXxWh9sFqhBK/jgQKfL9t3dCnEv/ZxWxLEPfljJqzeKZIjOxnKYYRaLeiExeFq3096bq2S4Depol4TNDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554525; c=relaxed/simple;
	bh=F+1vuwUREseEO8fmrN+L5VPd0Kb9dANgwZTePjZ5YTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cnru5EOjGuYmMZ+3f8DE/bXLpGudBPyAzZ+wmq3hMxEXAeIaDubLOXZqmNsn6Uj7jwn485UJIsNx9J6MwXpDzWdy5YzvF+JolhX5RLOORf6BEkrezR1LHTP464wy+xY7RctsbSruu9pbyCE+CRnf7/8oQMniY9V4nXQwB0DmZVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULkVnaIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOx2Dj8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULkVnaIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOx2Dj8k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZfXh731628
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EVWpvntptBmcOLqqewmuNr
	YlXqpbIZ+aNpYVUgqbp1I=; b=ULkVnaICzqpPwEJlWtE/J9AJtipLUeJL98K1KN
	ocOXZI9Xhde5RCkzog7eRySMzkQiLT142/N4JXup9n/JhKTtaXerm9YnQ19lTGv+
	H7fr7K7tA46G+4IczxZ5s/ohTWk3YTHg9sO6c5xHHSqUxB4J1WPvb8AEOhvNCOmP
	S0n2VzWJMNZi+z3TGYOXF4g0uBaXkja9hZS2sFu0DeFWFBUUMPnalEgFHgm27cMe
	CbxdOjvwZCxuM2bsI/zC5mB2ioUNXThXecm4dg+8ekwrKW6SRoBmtPDlwZb6GFsq
	xU5dJbdvaZs02GkwbpLVNvjY0IfrODjhMvJTwq3AKsT+HfSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u70kpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb5001ed8so772898eec.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554521; x=1783159321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVWpvntptBmcOLqqewmuNrYlXqpbIZ+aNpYVUgqbp1I=;
        b=NOx2Dj8kh26J5b7m2kacMg1jW6itinXe5YTCad8FlLpV86GXGV43/aR5JnWlASojay
         6nKJG/Wbt1kTkjUgNR0UThb70ZLniBF0gkxsD+pLkVqXT+1N9YxMoT4z9Cx3OjEdTi00
         LY3cV9r9VuMu/v+YdM426PIAg9TN3uhWwpE85sY8pAiSnh56sooLl6U96Prrs5y0iM1P
         rkskEQ2L4CTh4ubmFeqvCB2zx+pXoRvpX7LwCo+JwV9uSgTBN62PS/e7UfexjS1foGzN
         P8JyTIyO1uciOddTosT5U8bVTWbkS05qmtCzXSvm0rOB57gYbAe2VauomYfvejHI+VMv
         WwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554521; x=1783159321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVWpvntptBmcOLqqewmuNrYlXqpbIZ+aNpYVUgqbp1I=;
        b=QjyoBZIFC4waMg3pmnRUfqv7eJX7HpBJiqBWcIrj78Q7hn0aXqIsEo6JagNbsHGkmq
         WV/q8dv662llxM0wQX24UoyzDr3QrhRWIkGeLTeqwm16pX4UkQvZEpfZlgQepsjzh3Nn
         c95Ob7RF1Q5Eu0S5KnKSyIi9yX7XtLme/LkfqdS/4pYHQEUNFnVSirfW51edEMGn93Lk
         SI7NzRZcSGiSUOT1n/wNk121AFl1dm31cfTLYZPm6ZF2jWJtt6dlKCOHcBWmc2HSHIUV
         F2hmx70xJomzTRBBCiiG/TiR8ThQhfSPxQNASRRSkpF6ulfGcNUWbH4eX+R9rcDAjTnM
         mHCw==
X-Forwarded-Encrypted: i=1; AFNElJ86AJaVaZ0+GMV81IKSXYX2b+nARgQlCH3Msgzj3UABX8p0e8s+FtpBMWTAwa9SA52Z0Rcx4v/8FhvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPW0Cgu1qY7ZofNihSkIf9+Eus68zq4CsV2sDy53Ehf5Yk9gp
	ECG2n2D9dNcGuY3/1P8iVWsbi6bdBudmyC29NJhaY/hePNTmNANGiUWLDAi6DhBRk4VVDTuiaNk
	wDyrHpYF+78UqydEDFRQVJDTSH7GJbQCDVgBuf/Fuw8+BCB3PD5j3ogpKis5D/oa1tVLrHAoj
X-Gm-Gg: AfdE7cljT5Rn5FmNdrwGNdE8caPoKI9vzoehn43lneay6ByFq0m/E/uZisa5+leHDnO
	FPzgH7jGsl6dbRzdE8C4QjeT77OyIPBqkXO1OEgD7BVSfavligSMgVfjc/yudaxUWWcSm4A8EE2
	Nc7jmCbVyIYTO87CF9iqFTrnSnRC3wU3V+z/0lkkgo2/Fy7AsKcKEHwtEwFg9i861PtzdwnwLaT
	KNkt+1h5GENDhMgc6TSSZggfxNEhtvPynvm9HjiqL8DGxZTem7rxmXGhAjBNTAPBHCXF7KeuuRa
	Pma+BFZsG2cQWMz7yGiWnFCcwreG1oH0BPuw0gp6JeA+tDnjYgp47Rc+HY81Awn230sNhGk6UaU
	DKxkFSQzVaF/nZA6Mf5KdHu55fDv/pIqaISpFQA==
X-Received: by 2002:a05:7022:914:b0:139:7a47:ab68 with SMTP id a92af1059eb24-139dbbcc212mr9246863c88.37.1782554520422;
        Sat, 27 Jun 2026 03:02:00 -0700 (PDT)
X-Received: by 2002:a05:7022:914:b0:139:7a47:ab68 with SMTP id a92af1059eb24-139dbbcc212mr9246835c88.37.1782554519801;
        Sat, 27 Jun 2026 03:01:59 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:01:59 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Date: Sat, 27 Jun 2026 15:31:34 +0530
Message-Id: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6fP2oC/yXM3QpAQBCG4VvRHJuyW9bPrcjBsoOh0A5Scu8Wh
 09f33uBkGcSKKMLPB0svMwBKo6gHezcE7ILBp1okxhtUAaevEW34b8L5k7prKEiVS6F8Fs9dXx
 +zar+LXszUru9IbjvB+yt4d11AAAA
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3380;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=F+1vuwUREseEO8fmrN+L5VPd0Kb9dANgwZTePjZ5YTU=;
 b=goyzx4KXA+AOAzYVTSCrTSMlFfZ0+qMIiht3NlLRAi92uV+hZgN1UTvjJ3kRVLBS/iOWdF/JS
 p91sNxrXSRGCXlkmGBp+1Ji+N5W6UkrW5fuRO0doq93amp1NME14DxW
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX/BL1Nq8xo1pH
 iKPXswE+S8TpfNYMQitHkqe77sVz9xaMZrZ6OHy0veK7YJ4oxk29LrOmvKA3j3/51SKuTrJLxHM
 AijGsgw8d2vhJ+sk4h68MM46Opg0qZI=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a3f9f99 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=zvx2cZ7kDf5G4oDAlPgA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: UQC5ZlfvdqfnwgpunGsdACFEYVFdF8ng
X-Proofpoint-ORIG-GUID: UQC5ZlfvdqfnwgpunGsdACFEYVFdF8ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX/Ku0lNWTCFIQ
 fc9oZq0MI8BlqzcMkt/r846YRpVi3znt/EaHbF16H7vEtcp/YOpKe56f47OpIc3Ei7r4wtCgFLR
 YZe12ius6BRoHIf4g6rSyMB4RBXsyAuZPZ6MYOTEvbQGfF558i4Rp440XMzKK/JbTK4gHeBf8Hk
 dAaKsNpCDhAKUl5lnT2j9GZK8kmPrlajHvdNwAFFJOOTfkqfVi3L0h01GXP2tCbSFWQrFlz5Nm6
 Z/dIMxKredbw1rDodnvBPQ02b++lHt0AWkbhZGrzBkQWb4IH+GzcpqNf7qOyA0M32P5vKB+ZVeQ
 X5bMB3qQIFp8Q5aoRHCBj3m+71GgvFazeJq/yztwGqi0h3VPL/nqvw29/af5KtqtD7x8pcis8Vr
 JFYIU0D8H1wqAgvoz4bdHtM4yi8Ex4mxZphblZQ5G0bKmQfiy6ws5dfJyrnvFxoGr/iOrpcIz1g
 OXamsbcOJj6b2aK77fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086

This series adds display support for the Qualcomm Shikra platform.

It introduces the Shikra MDSS display subsystem support at the SoC
level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
support for HDMI output.

Nabige Aala (5):
    arm64: dts: qcom: shikra: Add MDSS display subsystem
    arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
    arm64: defconfig: Enable ILI7807S DSI panel driver
    arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
    arm64: dts: qcom: Shikra LT9611UXD support

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/configs/defconfig                		| 1 +
 5 files changed, 534 insertions(+), 2 deletions(-)

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com
Cc: mohit.dsor@oss.qualcomm.com

Signed-off-by: arpit.saini@oss.qualcomm.com
Signed-off-by: mohit.dsor@oss.qualcomm.com
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel

Mohit Dsor (1):
      arm64: dts: qcom: Shikra LT9611UXD support

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 5 files changed, 532 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

