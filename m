Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BB43DB33D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542179; cv=none; b=AHY1I6A1JR/1zYAytUjivL7bfYEVoAYZQpc476jikCcoAZg+FsrxfIHk2KcuHLh0aUReG5Mr0VIRwglBD6VJ46OoBlnxphoBf5GNqcsowsGELglIYoflNjsTTNqzgG52Bg3TM2DG/LDckgdby9M3DPZs4IKAQkD4PRg84t2m8XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542179; c=relaxed/simple;
	bh=sD8MJ5v7RQrtT3/4TQqeAdToHXfv1J1eK9rZQsVMz7k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dplIvtiUX3mLMNsHh/UhitJxhCzcWsBtLFay9MT/aqKqapSmskTY20W9FLUWXdTV1by5XVTWDYUwcc+zGxRcsYgAxl7vfn35PqJWSDSteXXy7hv/Y4+QWvWUstb2fA16licR5aJKieqrrR9M1UHdudI5lH8Th2HCEWAwC8hoIlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMkgUpJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCbMtXYR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMkgUpJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCbMtXYR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJRR404410
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XGvgn54K0a40R3IVJczenf
	eok8dRXyckmZReWXoa2HQ=; b=jMkgUpJNabOs/SKDc8eEi00s0A74j8eTvPgFS3
	8i54C9MGX5imXZlMjioYmPP9yzn2AvAh/sl9m3zqEWm+aJ16UJwgL5xP67yVaCiT
	I855ivu6M9hOEEHTUQFD5fTYibI6n9Ybc9twhIj8cNxekLypPyLwqcBDN/pgvArI
	OOTPPKSDp1nJ37SJv8Ujh09QD+39gBDbVpsfWoBpnymWWXQCuziHG6stzfwcFyYD
	qH/UE9WBrTgx/8i8gBKmgFoCWoh+7/ByXu7ITss0MeNQ/7plP1x0V3J6RxpL602P
	ps70y5/M2oQS+QJwgOSimNEPtohy4ttL4NR0s7HVWeb/VcYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk35nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:36:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso6050382a91.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542177; x=1792146977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGvgn54K0a40R3IVJczenfeok8dRXyckmZReWXoa2HQ=;
        b=dCbMtXYRdFPCjFklGV0ShVwiMP8dFzeEdj9bGZDnyVtJ3kVDeuvtYw9Fl1+KzOkbNp
         1BEWDYqEJUsaxZSv8NSqdvukjELSY5Im2f+IHlJrBsZJCwlJH4EXsn35bIAs1NgwtZzK
         KPCbrL84JLVRgO+w5bdMojhdrCSrqhplWFqhsFoTMZVFI8/6xITMSKxoisky7hibuXh+
         8xoM2RzH5zczBhgiREUHQ/YJO32h8We2S8zCKazIvGErBQ6X5VWnJdSgG5QySvgY1xSd
         ayiwjFp5193+bJdgC1EG9M2ccqpvqU8oekwW8pdQ9eC/5xBDlcc91dYP1IYgtKGwIGSv
         UT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542177; x=1792146977;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGvgn54K0a40R3IVJczenfeok8dRXyckmZReWXoa2HQ=;
        b=SnrfLl1usig2NsDoyDq/PrvC0mQvNvp/qIW7MlOHZPKNPDVBycqeZKQrMI8g0Pueie
         E8bJUgmXX1e0YfXrPlUyuZfPF0UQcVjo57x3H6Is1fPn+MQz8kIK2DXpK1LTD3osfng7
         x/9+b6GM0/JMgNybA85vF7260Aed/iU8h1fEy4E6jMdvadFlBEzgDvKie/IN7UpaEDyt
         9aTjjfYwKJ47A+pQF+MPUeYFQf2YHKty9TtkI3MGFpfZvWnXedwNmrhdeJj+kfU1LIdn
         b76q5rFT1PmjjoUeeBkg8v/oZk/JhpTPAUkAu7AcepSC/C+wLpqcx8NQRIz/PEg3D80q
         iWgA==
X-Forwarded-Encrypted: i=1; AKwUvBxrrvnXCKQ1jFXDp7CO9Tkw6HwfwIea/FkVL6oSlyp4YJeGupDxezJCgC6j1VYu95apfNSs3sj5lWim@vger.kernel.org
X-Gm-Message-State: AFq9FYILKlx1ul868EJkoAijefOVZofsM+6cIvQ69sq6/E9Z5zaMG8bz
	KiwooG2/D+YaECqbxamNst5xeYX/cA9cSraYXOdgBc+h0FlfXN9mRqZRHrTd7/GlmaThnhCtLVL
	aBS2q3eQPE6xqGLY+P86ZSWEyJshfRwRkZ98/k0Zj46pV2RLtQ2alk2k6WLXRnUSw
X-Gm-Gg: AYBFou2mQhIYYZswjLexKYMJD44qOZmpqLX/AKkpAlJZ6hC5ruh46wobVui1UVkqXEi
	w/LelZBkmVX8vLy9b3j7X6Kfas0s9eyc555HZjvxubz0NRpFbh2EkALEXD3aT1/7It3T+Bc7Mr2
	w7IZ/5dB9QAo5Ide2Ey5XuLC2KxPF9UiW2htLAbNA9ltysgzW+jw5hGHhAnUBk+18QID7GeaL9Z
	kmogk1y11Kpa7QyNuhuHczKrtGq59nyUa0G+YBKGcUQWGA4awoQsGyA6ypfgYQ9ZnWChLgrMZ+u
	Rg08Im+YuerdkpXYGYbkC39q0KeIWy1jyZpiMkF7//ld9yDcaQAyod+2my0mBjoqv1UuNcUXe40
	N9+HVgIRr/tV/f2UWe+nEJXJb
X-Received: by 2002:a17:90b:5444:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3ab3b01f34bmr1379812a91.60.1791542176667;
        Fri, 09 Oct 2026 03:36:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3ab3b01f34bmr1379786a91.60.1791542176119;
        Fri, 09 Oct 2026 03:36:16 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm2827285a91.16.2026.10.09.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:36:14 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Fri, 09 Oct 2026 16:05:52 +0530
Message-Id: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjDyGoC/43NTQrCMBAF4KtI1kYyaZo2rryHSEnjRAP9sUlbL
 NK7GxXUhYqbgfdgvnchAb3DQNaLC/E4uuDaJgaxXBBz1M0BqdvHTDjjkikAeqimevDFYEPRmbL
 ARpcV1tj0FFIutFBZyllJ4v/Jo3Xnu73dPbLHbogT/as8utC3frrvj3Br/5kagTJaKmtS5IhK6
 U0bwqobdGXaul7FQ274yN/B/BfIIwhSgrIZJlLLL2DyBIGx7BeYRDAXxgqbSxCQfgDneb4C3vE
 si4ABAAA=
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791542167; l=2127;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=sD8MJ5v7RQrtT3/4TQqeAdToHXfv1J1eK9rZQsVMz7k=;
 b=2Uf8tkNUyXcX8VeeR0t+R20IbzPYmzIc8FhwRocx7ASXvMvABnzr2Cm7Z10VnV2DwHM3uxbBi
 zzNmIH5sO06B+z60JnYTD6KELi+SzlZfanP7kdX24Mw+qKO9aNK2Ftn
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8c3a1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjkSdyLvD0LHWdEy_1oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6xFCYGBAVlKg2wKaCG0-a7dSOEOzc2t6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX1pBlM0fx2UX3
 AnowETPpXfUWoTowTm//I+STIY+WxbiHs/QJ6pMTBbvRdp/V+9wVNlAgs92o4Q2cH/aopNxtDd9
 FWd/tGa61P12NjAf4FxOvuBfWerTq2o=
X-Proofpoint-ORIG-GUID: 6xFCYGBAVlKg2wKaCG0-a7dSOEOzc2t6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX8ioXBeMbWlSr
 JgubKs+j3WOHTFHFaegNDDCeXE/T6YHL1hf8rw1NFFPZ/RBJF60KNA9cZHipIokW8TOMlLShtLa
 BQhDGl1s8qPUL+Z8XH2WzXL1vbJhTM+tOJLZny5oPMCtpLYoQbEIPnEcVPAhzEEi4y+ILSg22d+
 Fc+1q30mSSWoOs5gB7BLTw+lwqMNhuMYBxLMRcD1qtpK94VHgroyN930Jwjs4EQTcBzgf0BY33g
 Dqy3YD138qkYNNgnjK/CHG0Lj0TIYTNeOoIsr9RceJrbmKBvAJxq/kMn4plFAvtlu6+DjBTrMs9
 GnYlgWvA2VHU8TJnkp9l+ijTAM9D72/firVpntZBaA54jO/Xz/RpZcU4l51pnFQVa1rUKS6fajn
 a9qUg16McD3REaI5mjIDFvsw4Ij7BnT/1Nr/FJjRIiYuMINoPXN33BIF6g1DZesrUgGasFp1ilz
 X+bhjDATNPv5tHV+NfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v4:
- Documented the lack of UFS PHY GDSC support [Dmitry, sashiko-bot]
- Updated the commit message for the qcom-qmp-ufs phy changes [Dmitry]
- Retained all RB-by and AB-by tags as is.
- Link to v3: https://lore.kernel.org/r/20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com

Changes in v3:
- Rebased on top of latest linux-next(tag: next-20261006).
- Retained all RB-by and AB-by tags as is.
- Link to v2: https://lore.kernel.org/r/20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com

Changes in v2:
- Added 201.5MHz OPP svs l1 entry [Konrad]
- Addressed minor cosmetic edits [Konrad]
- Sorted references label alphabetically [Konrad]
- Add RB-by for SoC dtsi & board dts [Abel]
- Add RB-by for phy driver changes [Abel]
- Add AB-by for phy driver changes [Konrad]
- Link to v1: https://lore.kernel.org/r/20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com

---
Pradeep P V K (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Glymur QMP UFS PHY
      scsi: ufs: qcom: dt-bindings: Document Glymur UFS controller
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   3 +
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml |   3 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  18 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 125 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  99 ++++++++++++++++
 5 files changed, 245 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

