Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03E398902
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347247; cv=none; b=t2dO0Dx8u/CHblsUGtVRxHeNVd//htdEPKbYdMqap8I3Fp5l6/inpKgB3Kutf6787jr+9XLqtFvqRIWlpNqOeZVk/P1I/NzklwaGIBdjRxhLdZuWZEU76ZbBK3l/Dy4nm70rOGbnfDE8WiEIiGLJqVR1WekKAja5PuQ8Iq48qQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347247; c=relaxed/simple;
	bh=3lbgfXvd81xS1Ka4NSEHJrrRihwri5ozqY5Mf1Rx0zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HE9mHw4ju8oERRiIcK5XebjoaZOoAmH3yNJmiCRyIvUIgx9Ve0JdFXimrEPCS52hqdx2Dvbg3ce12k3r+GdNRVPeHsbQF4EpTYGdKcRcNmYh5r6C6WFwMXtcBY7gSTcldb96utEwMpXVc85cjs/yDXrTWQlwxseACH+wFUdbEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSXQqISS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyUnQoCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSXQqISS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YyUnQoCU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE59w680487
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9h
	MZGcm688=; b=NSXQqISScWttrlHn/LAyBSHs8Mc7PGHk2hkeUi4VZ7C8Zjq3xRx
	DQ5yCplrAaZC2m3NW/1I4QzHQngAigiVL8WwPQm2p+fZaLEd/koAO4Dj34dVDibd
	cRcjEnR/Puw+jQVSpuV76HWQyt5cec2t1xSQkHBQ4tNWHIdtl387PvgboLHfBlFQ
	DPGsjXTZx9BiN3V5xPiGxjSCc2GEEziILFBSP9zXmX7mPdG59Cvcqkp0MJdeJGbS
	Bf+9yp3Bj3cr2Ac4PrF59Pk2rsoNZWf8zbwmbG+AB6JY8r7/0xaVV26pIySYUJPM
	M0bMgnwPGUVHz9FECVxANEaNVfAkLNO6niA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89d45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:14:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so4531245a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347235; x=1783952035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9hMZGcm688=;
        b=YyUnQoCUFlcNC7+0Nf+ZDvcX/RZlo+dwIZGB0Cb/mIp/hqW9Mfu0IV5N0lz8lCMll/
         mpvwlVEoQ90K6005xGDXx7HdMoi/hGSQWcnkTkGw+FhNOVN3BmckdYzGyDmSENk8oZVs
         v2gUyFdCykJuYdQ5oiTH7Nkar3h7ENrTOsvwbVJ6Rk00L2UmJChiNwewghWBMn51936o
         RqV6kuTFgcrYeo72GJ69MmIWzUemsdf8OZs2rbKB8c2Y0p3kTV7ktp/Q3KwI+Jr16kwy
         /t59oKdeg9paEESbr+nz1nJu7Lr3OSTtV1lhXf5JLSDYVLvvkxeN0OKRx9NBQeYsXx5l
         OPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347235; x=1783952035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9hMZGcm688=;
        b=h5tIlil8JOKMJSB4MDlH9vKGPjydYEpsUaI7W2z3obdQ24Mv1EjIY4wexYjbSmJGnU
         KHjdjIzQn3CpWClMWv82yITBqAjevI5XAYUUODCjBQqPUQOl2pWVEV9u+duOP1wzE1zI
         2p42hrMZfrylgQPdO2JdOdDa4oP1Gj9v1fr9lw9YlAoQNCfbIRM+SvuumLg8J5uP8uPS
         H4LEw3tY5ykVWTZZFv95pldj1PLILZkgN21X0Y6S/QU3pbO687Omx6IlRbaCk2ryIg4A
         H5tT3FS+r+KWzpPesEXdkIPQMs2Qs04wK/ME/EyoP9Yi4oCqOO5c1rtmioO3vgCjHblA
         IKaw==
X-Forwarded-Encrypted: i=1; AHgh+RrSVZFqzUBToNm9r9E8BPiLf/rzQRLFp5A0VOwtPfUGiHZQ+CALqzMpBOkI4mBBiUo1bVmvPhjxyKrX@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGWgIMOj7+UQ6pd40Srzmcs7PUmNS8KNbD3YsHZvpXyJWlwLO
	MmoX7VrGdtsKX+k4Tl/FMgRrusbKYKHOAiiF19h9asQbdn5yDFpeV5ElXSyYPUmCCVAkk2q5vNA
	1QVu8v/alKhPdKlE6huU5C8puoyCkSERdznXdHWdRB2EKF9X50xHrG3EjPxvH9Xgv
X-Gm-Gg: AfdE7cm0RuQtGVeg52DayjOjzHaYOpkw4mowa+rRBh8hRQWIXhUu/9YZ+Bxf2TDTdgi
	5Z0twAIhI0VEuXcWo0NTKWDJmVJxtone7udU6//J0vO7+/y5yNAo/V6s53qnK6QfQEkzWiPsfMP
	JPWLsKzbfDkYnOhPIYZ8N5+LcpiaZSMUrVcMeO6n6eKUxhNgpmjaeEFortHyGSAn7YR7HvqJvd9
	O+2sAfxGyBn6wDNriZgnq49gcDwtLGgFL5w1rZ9662L1GuKYIDflL8CLO6CJRxwCOL1d94wjzAK
	Yljg1ufipigDPayX7Eaxi6Dg3VATjMVwPmbG1XQr9aS2lROB4IDzr62hbAa0adNwmmCYsxNw/mR
	eHZy6PUHqxNF1LeWfmWjkVq9le72cU+Q6vtE39A==
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr660414a91.20.1783347235426;
        Mon, 06 Jul 2026 07:13:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr660380a91.20.1783347234943;
        Mon, 06 Jul 2026 07:13:54 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:13:54 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Mon,  6 Jul 2026 19:43:42 +0530
Message-Id: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX0am0L0/IX2rE
 DUaFU9nTcKL/gFGVaOtUuvpeIiLSfVXdyvIZMm7DzpPOWuecpRYPy0uHBAH1e+NItwnrmGkkV31
 Nk98V827UMZJ9Fiywa0esbnYoqhNQ1k=
X-Proofpoint-GUID: dRNBUzUHSlGi3bh7dAO2CdJK3n7j82wD
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bb82d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vifq4xLP3jNeXsT3PTkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dRNBUzUHSlGi3bh7dAO2CdJK3n7j82wD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX0jZCXFhvXCKt
 ehQG4D7CPh8YMD64e0kiLS/H/mYzMcdJYxGyUMzbqwEWvQJvjNHhl98jFV8VjQnbYpl5SFcyJjV
 JFzeD77NdOOGPppoTTTcedyolMbcQ09viqk9RheqOvXEUTHxBDce2BfLp9hiHpIg8Kxxp+K8XM3
 v0kuLhy7Mk2CQwKZ8fprfKmD4zhwnnrznibGzKJxbbjY2BOhLCCmXav8ALUfA6B+CXBjCev8ImB
 Gq22qeEBydiSsN4/Mi6nTsexWiIWNMjeT7JAFCIodMEfdnbpaugn/pCCr+tr09e5dML2QGrKfrF
 UZ8lYStIhJRu7CFQzQfOAQUs4bs93yg7ptx0vbhY807HR/OC9im7KMkzV2KvrS98n6/VKwb3Yyn
 eR1TVlLuYawTZiKsV1Xo/Ha94W46IsefoF+jjDs4RREnQ0yPZ3shAE78MWBcbGxppJ1oHQN7n5z
 DAwqhgDo+JicYJUp/jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Respected Maintainers,

This is v3 of the series to add SD card support for Glymur.

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Changes in v2:
- Collect Reviewed-by tags (Konrad, Dmitry)
- Update the commit message for dt-bindings change to reflect the
  purpose for the update (Krzysztof)
- Link to v2: https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com

Changes in v2:
- Rectified the iommu sid mask notation to hexadecimal format
- Updated the power-domain corner for 202 MHz frequency as per the clocks plan
- Added the BCR reset capability for hardware reset as required during the init
  sequence
- Reorganized the DT nodes as per the DT coding standards
- Link to v1: https://lore.kernel.org/all/20260610111508.3941207-1-mchunara@oss.qualcomm.com

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 24 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 10 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 4 files changed, 121 insertions(+), 5 deletions(-)

-- 
2.34.1

