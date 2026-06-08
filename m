Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC93D3CEB
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941254; cv=none; b=pffrW1ButP+9f59XOHp2sc0RgDE86rBuq2sWAJKs9j1ikhDrMfZ/AedXTHsIjuBxk/fTOV+ntZaoc3TOGkHyHQIOdrB2QA5OW6TrJ3msIedIRKwHKGnPRLHptlT4CN3E5CFtcdoljALNzUJWE+rIob/pYNaWW/FABooQJR2ymeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941254; c=relaxed/simple;
	bh=LfhnTSE/G1T8B/h3kxwLBybzUKV/tBEsJgG9HLknHEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NRVJkCnxq416PouTa/wGQd02BtjEpqctTNHTTuthaQrk0g0wjbrPUigUIoH5J2VztCty7QQFLXqG2Ktr9wb3oHAzfZi3j7YFuK5jhA2nptu17wpFmKsMkr5kMpOC3+D52C9PUbOyB/TtGsWV0i93Ou+A5QwgcVPD2aSZsZ95ZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgUc/81c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRI37CbY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgUc/81c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRI37CbY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFS7l4008425
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 17:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zkiCxaDpqw8
	LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=; b=WgUc/81chQmEnATc7sZTPfEhLF2
	dRqQqgQsj87bmGyKBgMmNVwFF6+pn/grdYSQcem9+8oSc8i1AuinCtFIKhrUd6B0
	Jh2wswv4d7cOIwfZAtNo8zgGS5G1ubhnIJVXP6nWVxHunCUgtpEn723EbZdV0qs2
	Q8fzbbeyk1JNAShP0rAliWm6GMVLMBhD7ShiOlWl1nh8zN/EVP97Z+oJkAO3wfCU
	tuNavXcsM3P+Ym3WQ3YDABr6lEI0nTKG1dl9yxPWpnlK3tzUHspFlYARm3npjyUC
	/bIIlg9YEW+FC+0C7rWOj/b3d1Es8JR+Pb+ZhoY+gn7/4sXxqVmFjxfZj5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0jgjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 17:54:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bfcd629eso59451795ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941251; x=1781546051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkiCxaDpqw8LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=;
        b=gRI37CbY1/cZHj1VhXTOxwMMMgAwhRVUuSlr9iZhdBRX5+ja7TqIjNfaeXNMySDEAg
         4fZv1viPECSnTEZRzkYNhezVNu2+P4KZdsHQI3yFilHGVk4KpZHJCFD4oHiDHXHeR9sE
         UZkK1aT7GwsFb58dTQ4Cb918xsR2gxUz5UC27ZLDLIKGjVH/f2H4D3A839bbyuDDIlR+
         CBnWUlwwehPK2frw3V1YiZQ/oRgQA6fjPJtrXGc0i0MAEqCiTIZj3RUXTuXeEZm4OWjj
         4rvCLQmBErwI2zRXvvHh4hbhjpN0dx5grDSv5BrqtHSK1OoBjW9yb7UaBMpDCt4ei7Ap
         CzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941251; x=1781546051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkiCxaDpqw8LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=;
        b=roVMF1K7PW4kU3ZdDk7FYFPj7Cp6Y38ApsQBeDx+LGsqxS9YpSMEhcvC8GS3Z5X9/y
         wv2QZRmGT28e5ue4CCmWluaMTM1KNkehBjFdKCs8jk+ERkETQ+4Zv4PpCEmORTM9GD+x
         8y65LbFxrOleFk4o1jqK1QT0rb5+5fo2RJEN976m6xFxGXW4Ds+tPhrUoAxl/T0eFM0B
         +oLO1Tsja3xzKPSMWKgo1gEPbF3Oe6LImRKX5djGD7VX2BqeuHc4XCTjuqg/iWIC0X7G
         s5tJ/fA3sDaqiXySWJQLgUpwLyR7o8qxaAxN0LR339NIAoAnOFAVhEf1flFtpFNFANPC
         9NlA==
X-Forwarded-Encrypted: i=1; AFNElJ8vZIjL5IOIsszuqw0H3aBD7/s5l6NvaQ+Ga9gR8S54lD9RgEqzEEXM8OtkblukoKNT6hYk/TCfonu7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bwLw7+OGKxmgRoNe1X4qPXoBg1ifxknaCgViYNm1onx1bpkp
	MButuP1srxv/m5KY1MU130mLs28p9x4oyr7He0h3pdUBsapvroDO0SKnP2bFlWftu14Mp/3a+jZ
	tfqOn7wln23SZHGsSJ2wpn88zBSHyGBcfW7knXAcoSpwMX78wq/wrS6lWiXJ/z4Ja
X-Gm-Gg: Acq92OFiOmtK1IiQLJw+JKBTHO6TbF+D7mWO8Rg7snSI5zk2siH8vHGmhyKTg1O/elt
	Ecag4syIWh1M3v1I2LTGot8PCehLcDtlbeXXUOYATVxfmtCc+ztbEJY+t5CKblpfwV5iMspPlsm
	CWjWJy5Ztvf8+WtqqqIvsraiuGKL6sOqLoNU3wErGb/+gXWb0nXB5Rz1I+QgIZfuNm+AzTEZVB+
	Qo2alCbTWAXJ31rxDyv7S4eDt/Xg1BeqiMECiK6ppBNWtwExEDJiJsqOOp5a7SH1W7BPAieyJ7u
	5q9fICAenEo8KDNJA/vbopD51ejbJiKWF07yRbGjrF9VZBrqcOcclCfL8TufZOwnVKbSfn0QY+M
	RCk4Bx9ue1hZMhZhZctTvNgXmY+hwQXw4vqlTM7v9ZjQtbSyvgP39uq8+DuqN8Z+MtVok
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr20041840637.32.1780941250886;
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr20041798637.32.1780941250394;
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and cpu selection
Date: Mon,  8 Jun 2026 23:23:45 +0530
Message-Id: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX/yhjrrWFaWm0
 2MgHnYX1U5AuEnL+MszsD0xFCXQ8j/A20TtQ56Gd+GUIaRFOAPKjE2WUaW/60Tvb+yaDv0Iqc7m
 ZicxqJkh8Q70XwFTV+dHbUho3rp4HnLiGub09ynpVFJcehKk0mIxDkW7PRG9ct+vTRFV0eMuEk2
 7nZ9IfTR46gdCGpRN5fAWBklTFJJtjj6SjbDdWnK7cL9quVmhvD2Ip3j2qRAJsqUTU9LqO3lyV9
 vAQQQphhp2sNwk8tudWMBDTHAYj7MWQUeNtuT5fufIXXjZNem6j+bTLQV00zW/w2EEPe11LdoQL
 SVupANz2n0/c5C1x4Iy4Fhqo940/YvHHI8y0I0dsFKnPGsup18/C9HR8lRZJ5uGCtb+702CJbER
 cyfyCfqyoJ++k1IijN4Mwbhcm/LX6IwCK7Dli6LobrQkV7OO6+9xRkKSwaT+Q5PLcc3/MEQZLIm
 VxMJHNr5/3ZqG4UzLpg==
X-Proofpoint-ORIG-GUID: RLB0rIKQ_2YdCkhlKmmhyiO7-A31wf2f
X-Proofpoint-GUID: RLB0rIKQ_2YdCkhlKmmhyiO7-A31wf2f
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a2701c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pCi666Mk7v47pcsjtEsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080168

Some Qualcomm SoundWire masters expose interrupt, FIFO and status
registers in EE-specific register windows on v2.0 and newer hardware.

Add support for selecting the SoundWire execution environment from DT
and use it to program the correct register window for the active EE.
The driver now reads the EE value from the new
qcom,swr-master-ee-val property, with qcom,ee as a fallback for
backward compatibility.

For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
the EE window stride so the driver programs the correct bank for the
selected EE. The interrupt enable path is also updated to always use
the selected EE window.

This change allows SoundWire interrupt routing and register accesses to
work correctly on platforms where the master is not mapped to the
default EE1 window.

In Shikra, the soundwire execution environment is set to 0 unlike other
Qualcomm boards.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81e..f4b8ff77b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -26,6 +26,7 @@
 #define SWRM_COMP_STATUS					0x014
 #define SWRM_LINK_MANAGER_EE					0x018
 #define SWRM_EE_CPU						1
+#define SWRM_MAX_EE						1
 #define SWRM_FRM_GEN_ENABLED					BIT(0)
 #define SWRM_VERSION_1_3_0					0x01030000
 #define SWRM_VERSION_1_5_1					0x01050001
@@ -118,6 +119,7 @@
 #define SWRM_V2_0_CLK_CTRL					0x5060
 #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
 #define SWRM_V2_0_LINK_STATUS					0x5064
+#define SWRM_V2_REG_EE_STRIDE					0x1000
 
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
@@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
 	struct mutex port_lock;
 	struct clk *hclk;
 	int irq;
+	u32 ee;
 	unsigned int version;
 	int wake_irq;
 	int num_din_ports;
@@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
 	u32 slave_status;
 	u32 wr_fifo_depth;
 	bool clock_stop_not_supported;
+	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
 };
 
 struct qcom_swrm_data {
@@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
 };
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
+static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
+					     const struct qcom_swrm_data *data)
+{
+	int ee_offset;
+
+	memcpy(ctrl->reg_layout_local, data->reg_layout,
+	       sizeof(ctrl->reg_layout_local));
+	ctrl->reg_layout = ctrl->reg_layout_local;
+
+	if (ctrl->version < SWRM_VERSION_2_0_0)
+		return;
+
+	/*
+	 * Current register constants map EE1. For EE0, use the EE register
+	 * window stride to access status/IRQ/FIFO registers.
+	 */
+	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
+	if (!ee_offset)
+		return;
+
+	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;
+}
+
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
@@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+				SWRM_MCP_BUS_CLK_START << ctrl->ee);
 	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
 				SWRM_V2_0_CLK_CTRL_CLK_START);
 	} else {
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
@@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
-	/* enable CPU IRQs */
-	if (ctrl->mmio) {
-		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-				SWRM_INTERRUPT_STATUS_RMSK);
-	}
+	/* enable CPU IRQs for the selected EE window */
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+			SWRM_INTERRUPT_STATUS_RMSK);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = of_device_get_match_data(dev);
+	ctrl->ee = SWRM_EE_CPU;
+	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
+	if (ret)
+		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
+	if (ret)
+		ctrl->ee = SWRM_EE_CPU;
+	if (ctrl->ee > SWRM_MAX_EE) {
+		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
+			 ctrl->ee, SWRM_EE_CPU);
+		ctrl->ee = SWRM_EE_CPU;
+	}
 	ctrl->max_reg = data->max_reg;
+	/*
+	 * Defer EE register window selection until HW version is known.
+	 * For v2.0+ the IRQ/FIFO window is EE-banked.
+	 */
 	ctrl->reg_layout = data->reg_layout;
 	ctrl->rows_index = sdw_find_row_index(data->default_rows);
 	ctrl->cols_index = sdw_find_col_index(data->default_cols);
@@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->default_row = data->default_rows;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
+	qcom_swrm_set_ee_register_layout(ctrl, data);
 
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
@@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		reset_control_reset(ctrl->audio_cgcr);
 
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+					SWRM_MCP_BUS_CLK_START << ctrl->ee);
 		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+					((int)ctrl->ee - SWRM_EE_CPU) *
+					SWRM_V2_REG_EE_STRIDE,
 					SWRM_V2_0_CLK_CTRL_CLK_START);
 		} else {
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 		}
+
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
-- 
2.34.1

