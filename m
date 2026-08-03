Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9F40D592
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762554; cv=none; b=tfJQI3jBdCPanX8NZyMLBdELDASPzBvjN3xfxUUZUlXwsp+JyEHliCH4qta2YUACAtxaIRBwB7kKZSMTV90vSw5knrbTDaWa4uLNpruy4Ju7vWqievYm6OIiKr7JYUc7jK2vMa/xqHSC0lLI1/lvfv2LLkk4Vmv1vQBjTKRtGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762554; c=relaxed/simple;
	bh=vm+Yn64aFDp+QbVMtjKFCnfosLeMgH04LpkabcdCzqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GSUkkC18EfI+WdcBdWn2IgUIXHggvGvkCnJPZonyPHAzUuK6Nu3mxOq8pyo2aKWRunCz2RhQXx8uJhvJE+oatC3UiRB2QaYGdDMmiY27s1JME2DegrMm7TxJ+Za1EoU0KaLP+MFmTLMbQkkP1I8Gz1G2soS4Nzy5hGhB4JH8aKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Efd4kMHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eglj8DDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Efd4kMHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eglj8DDs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4sg6365369
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 13:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tQzBlaOnuUBoY6SiAYBdwdvzjNraSCTbt7z
	+aaqODd0=; b=Efd4kMHNaiThIwP7KIaA0EXedumBam5QlNMvCjgST44C23vc2UY
	Wm4Uc6/HE3bTuMNHBw9O14AxxtjaZlKFnZO+w2V9oE6OQbvy6C0S1gkS45eMwHBU
	H1t97NY5UmhGb6JoQjbQLBRm3tjdS6ndMlOITFPZ7ZnA1GnvawbHdiqp7CdNenuz
	Zn+bls+5WbetFibrbLVJ+T4GJcesUqtA9D2iadglnkcjQSf5sjYwNl3GRlG+3G6y
	KUjUvkeLWf8DrsrEoA2o/Gpl/BZkjlkk/Dmv6ZGO/ho9TGQZsU333cciFZ1m1zmF
	MfAnEEtv5+PF63PclaHhBFmbhm/EQzG3HQg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnsm82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:09:10 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ec6685adabso4892149a34.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762550; x=1786367350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQzBlaOnuUBoY6SiAYBdwdvzjNraSCTbt7z+aaqODd0=;
        b=Eglj8DDsw+23z3717FnfEjKp5gU0bo3cmDADqm2yr7vZYo3+sF1ti4EhmZtOiq9Qmf
         VEpRbXlkaGtp0jL0yII6zpk05dn3cAO+DtqTd8Wcndmdir8qhJu0Wl33BMQyN61CRCRx
         XRFyp2e/rD+N0gaWG86/eLJzNJI90VMJZ8x+irVwnsy+MjKrW2vQ3j9G1rDtet93L0rv
         u2osR12eprQAwddn4jtbvOzG/FYqgn2D4bBAAA8fdaydt0mEzv+WvwPjlgyLyjw/cLru
         zUFkXp/3kTE6AcQ6axvQ135brGVDP/kFDpcx0UjKf6yDm1iGMbgVWu7jVfsdrLuxKhny
         wHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762550; x=1786367350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQzBlaOnuUBoY6SiAYBdwdvzjNraSCTbt7z+aaqODd0=;
        b=LslXqKKLsaObjRcp4Z7t/JKumAx4u8xtfYJMMR7C6z4fQpuV34cwoztPVKvJL13vfd
         pEcBG6IMv41UJ9Tdre5aOsK57Y7tN+FHPg5idaxbfXGY2pRczQqUabHBKhwXmtVyIqft
         9cfQey8IvTeyyWQlb6HREsTnwC1GrwN0GSkvnG+/Qe6rJamUe7XpCezBKJbO23xToyL8
         z2h1sqaZzqi2lVul81S8mu5ZBMmxbkwLm3ZOM2IpKd1ElwQG+4d/dGsyPHqEiAubc+cc
         wOSmBHRBGrWc1roUi55FyqtT84v33Lf4nBmZUx7Fv7lEMO0ZffNCRf5mLQCICz8JQFst
         Y65Q==
X-Forwarded-Encrypted: i=1; AHgh+RobF3GXlGAEOJ+sf204x24IaXG/38jD8dhQK7sDgi3CMRcj3xA5kaw3qCYkIDyxs1k2tXAhpQpQQ79c@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6XqijUwGPTxdaMzJDpQIhR0Z19s79RInCJwpLWub1i2GaRG6
	1XM1SxUXJ3466cxYIcT5615tT7e2T9Rlit+KiNPt48hPmeuVdd1NrOYJjoNW4VCXm5o8qDqR1ch
	/CNJOmUR1Bu/i3uu11s3pyxg/l9yzhWr1UXMPbvDgptF05ZuPTgcSYWszqfruceT6
X-Gm-Gg: AR+sD10c6glNgAEiV1kxLvtjYhh/SN9WD5I5JCIjMLWsnmkPgky2JRqm9pDm3AI3Gjm
	U01C30vg36FfiEWp8d5nj+ncIu9JHogoQ4mob6xb30ee9XfUU5V7GQfXWbSXooAmsG79LggOdT8
	8L5EYcruGPso2FjJQemfbu2RCsK/zD9+zFnHSuZSPUiGEgpfzmFsVxKuFP9d2dKeZFXRtmM4+7b
	aPt4ekLK0Ruyap8pv9IHTcYN8jEP8JIxWEUQkPYoRpiHsT1McApM1VtCFRtezQ/1P7jnFcytH9H
	91uou9jHCsYRiym3P/9UjgcgiivnRG9oqTmk5C2xRdpy53zxuuYhcy4nF2SbAaTYVrrVvOtzX6S
	t+en/Z5mYPwPD4pVo9g==
X-Received: by 2002:a05:6830:44a1:b0:7e9:e0f3:b914 with SMTP id 46e09a7af769-7f196ea7991mr17856202a34.13.1785762545085;
        Mon, 03 Aug 2026 06:09:05 -0700 (PDT)
X-Received: by 2002:a05:6830:44a1:b0:7e9:e0f3:b914 with SMTP id 46e09a7af769-7f196ea7991mr17856105a34.13.1785762544580;
        Mon, 03 Aug 2026 06:09:04 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f0d6ef6sm7366929a34.21.2026.08.03.06.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:04 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Add Hawi UFS PHY and Controller support
Date: Mon,  3 Aug 2026 18:38:50 +0530
Message-Id: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfXw1bt2x0W4fTJ
 k9k3Hvc4Wnanh5dC5f4FSPUz2zDJ6/9UeXneQzvROUMXPlvdsdwoGNG692TRr9SKwHCEQ367DIs
 cLqiSMIfMl7l+nwu+YRpulPT1EeRuC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfXwQ5Vg4eGdxBs
 3mK78SXgkWbCgmGpnLcQTRRw0diKT6DPngS0VZfvaRUMrI9wBQC5/nh6vRmuYr2muJx7CuS2Bwp
 lVFoCyPh09XI7xASbx8RY62h7mwYIR4md9c3aTA9HGPUIeidlnQmY+pqyPhDVR6ZVaH3dxuML88
 lcTOiEOv1TQiV1k/5epXB1oNrdsljBIIaKNykmA8q3wFjgI4wjaNAf4Q9nh6K3BymL5F7WjYGE7
 MlEbbet0GoQEK2TCF4So4zcWbUr9a1y9ijQ1huLMqG7Y4/hNukcCG3zV7tt5nfBXS9vU1ScsDRj
 Gdhm4udtelzc9Roo/oVqIuQF8nIwYzTnKLGneze0ICd2mQpMCu+CxBYyw8eAcVyiHZmFX7O+Fe/
 q0e/Q3M3KIoD/En/cjE40HVZqI65ED3OFHvqMb2+DoCJKw3DWyEYKoPEwoQM9t4E3lhXKImk/NA
 m7MWOfqUtxxW2tJI0kQ==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a7092f7 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: OsWs5vaFODNB4zihIVESMWoH2AB85l4q
X-Proofpoint-ORIG-GUID: OsWs5vaFODNB4zihIVESMWoH2AB85l4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030118

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

changes from V2
1) Addressed Dmitry's comments to remove whitespace and stray line.

changes from V3:
1) Addressed Vinod's comment on missing macros.
2) Binding patch for UFS controller has been merged, so removed here.

changes from V4:
1) Rebased code to tip.

Palash Kambar (2):
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v8.h    |  13 +-
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 5 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1

