Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3503FC5D0
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354638; cv=none; b=onUbS3orPEfFUKswfYdWEf0b7wvwNsvxUMMHYXRy3NwkQpaekEtsUuwZPSxDaasmHD5u7SxXN5J2CUq46znHcofhUkWlFRve2+3lzBmLTAJobxWFuOSnWKBMvpYm2mvK+AplDB3CbFCH4lqckLdyf9NMViK7wCmV+n6SYIjCEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354638; c=relaxed/simple;
	bh=IpVmg/qBc5NOLUk9QAKH6+CEUPEEHszJKpFLsr3HzZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvWF54zVC1P/6s6K1/Mt6dS2E2j6MRs//Nd8e67P1ZmAHdicgDBBYrQ/gYziq7kDlnu0Lkq4m8edM4XMu2wUqDX94xvgtUqP6W7dApXGCRAcEVK7gxYmfPJWrEcCNkVkHp0oHTa2NYViqecjq3APl3gXKj+LDqH5oJ+8Y42QP+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KC6QKalP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMJqFekn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KC6QKalP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMJqFekn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UB5o3924050
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62QTNM31+06E+TiE3GERgLq84foFaobkrRGMU0K+n+U=; b=KC6QKalPH7bBarAk
	VaR+br0Q2qXFiY5VAJWKoXPIIBoe6LmC2v79fRKJVilqccQFo1YYRuaCA5C5Dcs5
	BCST+pmI1fZRrpnc9OuQOIWE2mfGF/P3JmWr4zlNJzEwX++iAywEpJKA3mPzxShi
	WptNEEE+VTJ1QJXa1nYsP4LfARDDVm95o30hWSgY68snm6i5jxWnGPyja83fRbMd
	GpnqTEDK3o73XEg75/dngBSaclFWLVMGKkj1l3YJugwzZXFSoxvHCZkTb/dK5AKK
	kv/YiIPtNT2d/I5QBu5L2QAXqVNavFBIyriAUURSKAWuPrmI721JOsbf6EzM1TXa
	gYYHEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c718v5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:30:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6758293a91.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354636; x=1791959436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62QTNM31+06E+TiE3GERgLq84foFaobkrRGMU0K+n+U=;
        b=VMJqFekn0YmjEPrZCSGvKL5lvx3Fqtx5o2R/rNmHG4drVSAju0JoUDMUG2TauldvF1
         sioqFPb0pYh8MpYgKPfRt4CMwv/opRgKK/rp1H1hGyxINFL63t7fZxKwHYhgRalu3IbQ
         p6frlTct9RI3+VMtgkWcBft0R+oPPuSNEya3rHXJqAg5+mSrXHvih3zXIoSygGeHO+F+
         Dl5SphNuDT3JlzgDSg4RqyiNUFUODP0tg0z9uPuupFsl1b1Ve8t5w4NDWCxzAISrRZIL
         5GI4SbeMjA6MibwMKz6Awp6Pki6Wy7y+zmUBhXBmal6wcHQ4jg5w0mp/mmWPECEpHge0
         PypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354636; x=1791959436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62QTNM31+06E+TiE3GERgLq84foFaobkrRGMU0K+n+U=;
        b=l/kfwX/tQi15kV3b9Dm5NZZa93CcvtQfYCYlRcJo6dIZDFLyR+JSGWoAm28G56XMhe
         u/ExYDCEf5T7Rn+hu1ZESCDLXiwDIvlLud+cVrW1HCAov36T4wQfgP9YDSDD/lLG/78h
         L+FuvRHf65QY3qJGF4itdEwb587Q2boRxHwUa1RAodtcANPXM+ErewrD7Olivb0K09xU
         pYDH1X97AgigLpQbIEMVuJ3LZIjCyhCZ/EZrkKnWfT4VZzhyfSJnD9JInMsINkH15dkD
         zdJ12pFiivirOsPZbr0lztIMzE9Fo7otjYQO/FZyyKMSnVTPuF72t0RB0AQZ24cGE4Ld
         TQnw==
X-Forwarded-Encrypted: i=1; AKwUvBwXWtk+QBWcecTZvHzvBQYCxPncGMgVkYjs6c+K0fYoLu/eHesF7pKbHc7SRPt0SxP85RPhxV2bSS23@vger.kernel.org
X-Gm-Message-State: AFq9FYLMKKLt1AE1HzMo8sziMPm4Izwh4VnShRUDnqu1e9MhrlLBgkFA
	4sYsTdaq9sGfWz8TySlHoMNGZ14PpuT6B2f4bGnme7pNQqemN5ATvz4vNhjI4sc011T5QNhgmOL
	cF1B/FMTVp8lRCTNcQHil1gFhE+aHckAMPr0/jxa+le4FcJGGNYOfsA9eXTf8dv4e
X-Gm-Gg: AYBFou1v8CYodn0zqldhAxtOataQEK8VeFfWmHYfLiBMPgE2KFE2PY+5iJrWtZudZwg
	Ky66VoIvIRc3PPdmoKvjMfkFIUgY+Yc2vizfO66xg8ZCtP0sbfwwzvOAImnSlabyjl7qsjckdSv
	REbWnTE18QQcxcAqdSqKsHoHRApFtVcVB+wzko0VK1kJHI0JCo8SO4hsN7hK/cQMGT2llSV3OSz
	bILQYmrIhGbghwxXqrRnFT9jSWNBf69tWqYYfwTsa9j7d1ep8nXG76BBygtotPQSKiN0oyshrRa
	OQ/eV9zX93ha+1AbbTFxBqUIUJ15C/VmD1Yag6jaIOM5vsNsmO3Yu6Rk070fdP2gUb2n+/ihGtC
	zlZfgK3DO1oQp0MdUbl+PyLxMlg==
X-Received: by 2002:a17:90b:5903:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3a89f64976dmr1071900a91.4.1791354635058;
        Tue, 06 Oct 2026 23:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3a89f64976dmr1071873a91.4.1791354634511;
        Tue, 06 Oct 2026 23:30:34 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:34 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:38 +0530
Subject: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=6225;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=IpVmg/qBc5NOLUk9QAKH6+CEUPEEHszJKpFLsr3HzZY=;
 b=MwrN5U5NSZBf8B/dz0lAehrHwQ07UNNyuvqHTNnAEYWybyc4uhz6thzIy7qSxLNI3pMi1CuMO
 j/mR0ukrSvZBWaDVNoqBg0rEWBpoh2GXR2eUXLowEequ/wr06U1709I
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX2iWY5rv7jO05
 niGYGJAwpvH9fcJnNgWHTBxgOT5gNYtTCqwqk7i+yEdE9g866iovzKNNfqJm4zKua/1YcFYBd80
 sM2u2RIsj/G5cF7Mq0HdMotf+QaKG0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX5PhjGnNhbZdc
 H+phoxIsURRDoTOhderp1d8vgGI0m7oK8s+Vre71PiO8FaxIy+KqezVq2WGiBahPA9ovxauZdGd
 1jLFa55FwbwiKMQi32O3ObTst2uBaikwbGHHXP85iCW7MognNhDaRbwTTH0ENQ0O5xjpqRbX+CD
 reB6ajtmxUL4Yuy/aWD+pnIv+Hn+zb/9yUhaoawjiu6aRoyEFN0CSO31KsQqgHFOn97xEKOfs+p
 DzzPb4MkYYx4uNum0Zm6Ce8Dgn3hCBbSrWu05sHWpvv+bv+ezZX6pUqai41pQIWgwu2svBJoknp
 oV+XTVVd+kb1BI+mvbgkc/WOoKx9raq9gYEOFR+Mlqd0oVyZvH7EsEZTSuS8GepYB7XQBpgIBjq
 u2tHY5ks0VUw9TTY8+xBstQwKlY4v141IuJE+Gx/A5GqwIdUikrJ9iVl/4WkAS19M8BLjHs9Dz/
 6hSum/PYpyDuOMCk1/w==
X-Proofpoint-GUID: nfqMbkuZgLsZLiFpJJn2t33VinuL7_9n
X-Proofpoint-ORIG-GUID: nfqMbkuZgLsZLiFpJJn2t33VinuL7_9n
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5e70c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EEZK_nQxm5Uv2-YDnh4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070025

Add the init sequence tables and config for the UFS QMP phy found in
the Glymur SoC.

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

