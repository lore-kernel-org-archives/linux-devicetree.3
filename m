Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D668434983
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542221; cv=none; b=DLkQmlL95m08sE/rgsQryy4E3e4rg9Kcl3a7YnVxQDjvCko2wzMIg/yneRHtckgRP2uv2eQLqyLHoLElIkVroX8THuGNkzt+7eHY4GbeCorjIUediYkgq4b4Is8E7EkNhOjk4Aold786Ap4MW0PlNoDGrgTSk7hquvIUjNc6xVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542221; c=relaxed/simple;
	bh=j+6E2DsyWVACZ4BJXAoVepwTbWHw7Rvhrv180mSV7PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfxhCRlPKwnX6G57UWPYjM/0UGHR8+/NkRZ9QCTr1bgE7r4TnwJzeU1S2ez0vVElH6BxVXXel0sbEQKsniYbpxwqWFRYd0IWtrE1l9gqcyFM+ajTHsJlyPxnrXlP9gvF82LJqt7ToG//PnOLkQJlTt7rOujS0VZJcn3m/FnkZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLCDXaYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cl2qKjq0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLCDXaYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cl2qKjq0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFcQ642362
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAjKpEiBJsa7RVtneAxPAiJWPxqBzUXw9AZO8LSFdjA=; b=TLCDXaYKeThkyfzl
	NneLDG/cgoEwwfQTE+F4RcvaI/04O7qYBXRw0/n7ypt3uab/o6dSCG3SCfT2B9FP
	yRxztaXhU3aVzMvQj08w+EGjaBUn2qDF4Ba91hilmGWb0VsA0S0AW2LAlObmaHG2
	Lbr4ke43rAe7vJADJxmnzVEPgqZVd+lKdpT6cFYjKusLxnZvQNX7UPosrRPb8RN3
	H1RK+WqROnvKLplM+VkqTgal00H2VGIERS+YW1wexR1FcvGby9XomNi1LSRSmOdw
	gEampWiQChKlNJcQPMQQq743O3GPgQmvyf8dpOyqrYeCltY7WAPb7GQWva1p8/7C
	wa5l8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru5et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:36:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e83df1d54dso8299165ad.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542219; x=1792147019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAjKpEiBJsa7RVtneAxPAiJWPxqBzUXw9AZO8LSFdjA=;
        b=cl2qKjq00qvr/UOvWDFnaC/8orrb/4Gl9tXef+TlhzNt6gz4LaRzRp8PTrCyN3LBoO
         3kmTHJBl1VWJIu/JecqwZ4RSZWW/isiyTZIdoXMhVdaZCT6e3sVuJUKA9Q5yzh8j5D0c
         wP0aylDtRTkjDZ+mZJK114RB+9MzbPFEvy4zNxZYPpHX8aM9N8foopvOvEk+FcwZ4xMu
         v/rjl2upQD7dnubQ5zq7Jg1u+PiBZtcCkiganzT2OV64/2YAJB0DV6aKYAIBYgnZGG6t
         yC/Rle0Jra/a95vOiSX+2Vo/DIRQtWJ8C4IhwbfH1dA444tW1phYNMYDjEhCz4ssghXJ
         H1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542219; x=1792147019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAjKpEiBJsa7RVtneAxPAiJWPxqBzUXw9AZO8LSFdjA=;
        b=kSFDt23HOnH6o8Q7bSQnT2F5rXFPNukXwdEFB2fO+r0JVmawMKZ345z+45QImVtZhQ
         F5nio1pstMC9/fNwvxZK3KZk5yiUs5r537j0oCBeP60exTJ40xP9drbrgewTJf9x7buh
         b8Wd0UeSHoQsLmbN6VDBRFFYtP4ltriwrxKEju9xYYaS4LCBNUcCppHK4o0PVhCtiZhA
         09SDXj6yHUvZqWN1qtDRSusTUCyJIzX01hTYjEdeQPqDDYu/nFqJre0J2kjLXTo89zry
         Bvi7eXuUxDqmUxT4fbJFEXqJ0M2akh8iAoSmNTuLgLd+W690JYOXVoYCZkaK0F57bLtn
         DCtw==
X-Forwarded-Encrypted: i=1; AKwUvBzBHYiwvdVDXQ0aRW5WhEhKpXI9eMDOvPscxlWJB1maCEAWhYxh0LIFNvAwc37zelpOr9DxU7ftjIcK@vger.kernel.org
X-Gm-Message-State: AFq9FYLNBV+B500UmSbutkKjf3qmzKPnwDcTWlCQnTmWSa1spdaqadWX
	3q+nxrDtPmxR8VmYBVUwiRF95d89FPnUNY+c9VlNfYHOTu8KVzSZAufMLwsPB8l8jAR2Y2/48CR
	XjC3SD/FnLwkIfqD8UKJCeIuiYOM2DlP1Fq9bs/f8cl5lpOh4xVetW0+u4/a/mb/1
X-Gm-Gg: AYBFou2a7EHIGHJ/CfIUUqDxWelBqCk7FJh1lyyHDBB3thBf/ozDIM9W0tj3qm3oVRi
	H2ITjXDT0LW1k5oIBrjPntCVBQlj184KPnMRzXQalBqnHntuGh6enyj1qDKKgszO4aibAEUK7GJ
	fOHGRUKDKK+b9Qpd+xWVZZTuD0COl9zslPNZ9yLwOcJpu/ogcjEDdo2ecY9ookDJfdCpF+Psq38
	BmF6VSjp0wrYR81JWaIuexf2suZxdW4wWRoRFDPG4krwwlxZdCMweFONbn4TmeSlj+Sep4q45C2
	yTledFUxFqUWdAGPVBIoZkCFiidnWlhnJHpzEQkKg9u0QVFqq+gh26YuFaAeNXdfhbXfkzkX+ko
	2CnAAQ9Jp9lpYxuBUO264lBem
X-Received: by 2002:a17:90b:224c:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ab3a0218bfmr1514334a91.0.1791542219159;
        Fri, 09 Oct 2026 03:36:59 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ab3a0218bfmr1514298a91.0.1791542218650;
        Fri, 09 Oct 2026 03:36:58 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm2827285a91.16.2026.10.09.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:36:57 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:05:57 +0530
Subject: [PATCH v4 5/5] phy: qcom-qmp-ufs: Add Glymur support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-glymur_ufs_qcb_enablement-v4-5-9a6ce83195b7@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791542167; l=6448;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=j+6E2DsyWVACZ4BJXAoVepwTbWHw7Rvhrv180mSV7PM=;
 b=l4MArN+SNZYmB8sxb1HMmCFah1CZn0Rgx1GAo0pMRdNBZUmj7CADZ/QvEO2Rf7jpHIGVUeX9M
 pmpzEWX7IzMC2EA9b9vG4M5Wow+hcJsf5+C/ieylkYKWwhvrLpOVjad
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8c3cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EEZK_nQxm5Uv2-YDnh4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DaERt4hYxNiwMGWHzFnp6F1STm9UH0q2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX4KBLepsOKRbU
 XyBnmRgIec9E8+hB1ZtmEK9f2eVYclPte/VPU+WI2YEUeXbyOacjzwmNQHXfkzd952dprPPEdiQ
 S03GImVLglyle3ylmcdf1zxucddmatFfa2fsgaf13YKxOuy+v4FjSrP+z+fpkLlP5EVx5Ckwvwr
 99+WtdU1eNGWQu7t3KGhElXR2tAgD5as6yZeP5SMJIvIzIDAp3IiLOci36EmUUIbnbiVIbP1gju
 aL7JIK47+G9A7lQbATe398M9aXVraqgNkEN11S8zbblnpK9v4tRuxuXrNaPy1gCqUyBv6HzjF1n
 m3h2iXZOO4mwqXNHFk702dX0FM6vwrVxFLMdDL8jx6NDBlaLYVfibWaIKjgKYwqdnjlQPOOO1St
 mrSjOW4yntr8qW0qmeBecnSmZWbpoA4xGSabBpJn7tVS9N90rZ9R/FOuK3b9qub34hrwyi/i3T/
 nJ5rSZSz637Nw5J/2bQ==
X-Proofpoint-ORIG-GUID: DaERt4hYxNiwMGWHzFnp6F1STm9UH0q2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX/dtW1Ddhu3Ia
 O/2XlFTIoAiQTeIUn/BXlAHTTXAbXwiUv+FpNjBPKQsJYPjfAuss7SxdVq3TvbHU3tsbywyTS0g
 bv5402JYQ0zv8PdrT5FxWyxWceVMlFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042

Add the init sequence tables and config for the UFS QMP phy found in
the Glymur SoC.

Similar to SM8750, the QSERDES RX and TX register offsets for
glymur SoC follow the v7 register layout, while the remaining
(PCS, MPHY base) register offsets follow v6 layout. Update the
register layouts accordingly.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d15db9ab9a90..f441b26bb8a6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -93,6 +93,59 @@ static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
+static const struct qmp_phy_init_tbl glymur_ufsphy_rx[] = {
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1, 0xce),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B3, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B6, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B0, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B1, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B2, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B3, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B4, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B5, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B8, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6, 0xe3),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_SATURATION, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CTRL1, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_TERM_BW_CTRL0, 0xfa),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM, 0x77),
+};
+
 static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
@@ -1212,6 +1265,11 @@ struct qmp_ufs {
 };
 
 /* Regulator bulk data with load values for specific configurations */
+static const struct regulator_bulk_data glymur_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 217130 },
+	{ .supply = "vdda-pll", .init_load_uA = 18340 },
+};
+
 static const struct regulator_bulk_data milos_ufsphy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 140120 },
 	{ .supply = "vdda-pll", .init_load_uA = 18340 },
@@ -1324,6 +1382,44 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
 	.rx2		= 0x3000,
 };
 
+static const struct qmp_phy_cfg glymur_ufsphy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_ufs_offsets_v6,
+	.max_supported_gear	= UFS_HS_G5,
+
+	.tbls = {
+		.serdes		= sm8750_ufsphy_serdes,
+		.serdes_num	= ARRAY_SIZE(sm8750_ufsphy_serdes),
+		.tx		= sm8750_ufsphy_tx,
+		.tx_num		= ARRAY_SIZE(sm8750_ufsphy_tx),
+		.rx		= glymur_ufsphy_rx,
+		.rx_num		= ARRAY_SIZE(glymur_ufsphy_rx),
+		.pcs		= sm8750_ufsphy_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_pcs),
+	},
+
+	.tbls_hs_b = {
+		.pcs		= sm8750_ufsphy_hs_b_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_hs_b_pcs),
+	},
+
+	.tbls_hs_overlay[0] = {
+		.pcs		= sm8750_ufsphy_g4_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_g4_pcs),
+		.max_gear	= UFS_HS_G4,
+	},
+	.tbls_hs_overlay[1] = {
+		.pcs		= sm8650_ufsphy_g5_pcs,
+		.pcs_num	= ARRAY_SIZE(sm8650_ufsphy_g5_pcs),
+		.max_gear	= UFS_HS_G5,
+	},
+
+	.vreg_list		= glymur_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
+	.regs			= ufsphy_v6_regs_layout,
+};
+
 static const struct qmp_phy_cfg milos_ufsphy_cfg = {
 	.lanes			= 2,
 
@@ -2371,6 +2467,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-ufs-phy",
+		.data = &glymur_ufsphy_cfg,
+	}, {
 		.compatible = "qcom,hawi-qmp-ufs-phy",
 		.data = &hawi_ufsphy_cfg,
 	}, {

-- 
2.34.1

