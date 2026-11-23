Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454072;
	b=ROLWQXTaw8VJ8VcvnvUQ1Fe7qGyiGVR5ffdEQ+M6Osvl54yg38xGg3OsvD6rVG2O25hJ
	 zNGrYqgBpbrlK2G8tTmLctej6CCJEPVg0dSDVPqX6PcHQLYFccHuxfuMGXJmShyhpJudB
	 LMUDg6ZDmosm/pfBJ5ls2r03iLE9IujDVxow+0URNQDAKUyQZQX7mmKAhaC4ULdXmjEA7
	 y+wdAaNNJxCCQSi2XC6a5Q8LbbJ2jyZ9TKsruVOxBva1T31CoNzk5XRKWyyP5aSiPT27i
	 +1KbUsRaAbTYPm9p79Boo+3PhgjuKaHyvwQsyBR5Rr8ZRwJ8608RPlEmvpTogen1jUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bXpMTJeZHAgnGlu3rTxPGbCsrPA1Miz/dHfBJUZypo8=;
	b=0OOwUmuGM/ZJTOHz6i4gKiglDDbpW3MJP3W8PwxvvYqMLa1TpSx9UkJ4KfmuWtLPDoWt
	 26TbjUmWUc6Zr9lY0IqNajx81TWPaD0uGWOINcpHBZ3/AtnHl93U21T7yWksKpukrG7zS
	 ODHluRUNoFtqgt8TgHMWwGMkHWKw6MYVB3WqrzQHUmdJmDJZKe6AnBdg43p+dzdRqKfEO
	 l91f+e+DIWkvnUTIILiShMmOY119uzN1hNeLKcp24OEBmxypE/cYqwHdeN9RKEbxDwl7j
	 ssNL9A3D6eVtVInHeVcQc3rJa5WbjbMyecrhIlJGWI3zE5iprDHrZFDzsK4RTdrKqGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gt4oBg3p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5+AU2lU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40914606A689
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40914606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gt4oBg3p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5+AU2lU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGulu2340279
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bXpMTJeZHAg
	nGlu3rTxPGbCsrPA1Miz/dHfBJUZypo8=; b=Gt4oBg3pi7JMJ9UAGZi8Um+WlrZ
	KLc7NM9c7z/FPEo4ozk6zfqCsGSNY/3le17L75Mc3fxvOwiuENHOIlqJoETnMGtx
	XgHl/GHNcwDAx8+RjhVT4f8zaeV1PfWhGnWd2p62Al7m67zWd731x7Bcsu52kbWv
	YSWXv0OfdbRSZWscPmfoIiUXrdNAHndqfzIy+D2zGF9vt/6L5DTQ3F7B8ii19sAh
	ZJ8YXxd/mQ6FqrLKI1yfhCppBX4E57VbvVku1vwJED9Su2umBt0gRLa4ijh6rgJl
	aw/4iBZ6fojTWh8oHGAC/GyVENcRl5gUt3pbkjXBegkEgUffBVdFOPQWaIA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2ray-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4fc2d32caso50972037b3.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454071; x=1796058871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXpMTJeZHAgnGlu3rTxPGbCsrPA1Miz/dHfBJUZypo8=;
        b=V5+AU2lUNLVCcNc6yeRj97fPVR9v99UANJhnFQNp67vdgD1xhQ80c4hDAIOlbS5bOt
         pTB74zwhrG+cC9UdfFE3AFQTar871vYP4zNuD5neynejqYRX7qhnWHSFtG7kY1ROox23
         +xH5Al1Kpt6YS2y3wSomDQXiFrBEIvkVEMugum89X5yWJjeVg82/7xzJvyVSNENo15ow
         Y+och2ca9xdP8iuh0OpJiDIQMADMxkLAMbpBElYzr/fyq8nrhl1pExQa1KViFELH9jlJ
         SkQnBzS6MdAc8cajbMREvXSUlYl7Ovwl0rFwPQ0IiL2WmQs99yuYfAWrmfqTVFnbRWel
         ricw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454071; x=1796058871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXpMTJeZHAgnGlu3rTxPGbCsrPA1Miz/dHfBJUZypo8=;
        b=Qh64HFtl1Z4N87gkVQlMUTZ27LBxVvONCrqgHNbQNI0SICtgeUyRAyhgX7FtKlJi9q
         eBF3FVvt5z4i8eoEPFSOPIdJN6mgzkBQYhfn+DSwDJntLWQ+mueXAT6yaJawwqX3x0jP
         DKH1XskU6dYMtn0AoR1r4+LyaZ7y5kgjZnj8TEPQ53UQza9UftBEjPNW37pwA/z+v0oi
         x8hW4mywp2RuiIJfyZdiVU6I9CD+EoLQ1AmA9NeQCo/GGvL/Iwvzp6YIGF0s/aciRg4F
         Mxy3ykEW/7CP6OHTPf5Eq2PTuXPoOgShpjai7+7cVd3cpPHEswF5xEqkOv0iBgdvxke9
         hV0Q==
X-Forwarded-Encrypted: i=1; AL+hErHNjKQmfgfJ/ngNHsyGi1s9OfBDH/kQ8g46BURaurhIcxZ73thMXJ7C2WQrgo472lxt0xm686J3njeD@vger.kernel.org
X-Gm-Message-State: APuU4Z+06NgusF7fO/MKXn7js0WIYzA1+wRrCQMJNOnZc8zSGVWi82f/
	uV+cfwd9jQ6wsMGZArof0XlAiEfIi+11uz9m3ZxvpZ9Q1XbdamjaKuIxm95QU/1uFvmVuzZL6MR
	fOPkYDSkCTeGtC4NbknQKpYIYsyoFFfvtUg3QIcrVPAR5vx/0IWEeGkZx1/Ns0Cvr
X-Gm-Gg: AZFdTZd4yfUGL+toUFBoKB8BZm0i8IMpAfzGM71OFOWS5IojU41JXkZU4dIUg+9qvvO
	pf2tMf3hN5MPdR3ycnmyRMyXXb8soIrZ1CCBo2J7U6ZaJsSKaJJZ51oInP8g2fEwsxuru+FANj1
	igWE0iPXoeTy/jddk2E6nRuDhFPVo+CBmKqtYM+N3C3WjCxUPdW48jd3UMlE4MmslTsbR3qxrS6
	p+u4V+eMjLVC46EDMjp2PoqQ47SoXUyyAhb6dt+MzbN5BWtlP1aF88C1LieCCZaS1PCBD+zuhA+
	RZaPuEX/vp1c6KYZsczlf4paNfmJTH5FAfhrRQdgxgau1XQf/j10cKMVG+oivSxTtGNd+NRp2Il
	7CmpCkQSNHpDSvZCBvOqNYVHAgbeZ5vhh/hJ59UjOiAp9YOjEIrWjh7CXy2YSdamE
X-Received: by 2002:a05:690c:e288:10b0:8b4:e2dc:3f11 with SMTP id 00721157ae682-8b52043c5c7mr25697637b3.19.1795454070163;
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
X-Received: by 2002:a05:690c:e288:10b0:8b4:e2dc:3f11 with SMTP id 00721157ae682-8b52043c5c7mr25697497b3.19.1795454069490;
        Mon, 23 Nov 2026 09:14:29 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/3] soundwire: qcom: add multi-master support
Date: Mon, 23 Nov 2026 17:14:10 +0000
Message-ID: <20261123171411.444381-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b047477 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kM1eI6GKewQnb7ihm7oA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: sHPrCh6Eo2rsKOX96gUgkqjAZb_jiTdV
X-Proofpoint-GUID: sHPrCh6Eo2rsKOX96gUgkqjAZb_jiTdV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX99BaRef3xHGm
 EQwJYGeiI3VZdllU66n2VY6SKrdA2zS5l4kCZzSv7Y6Xpc4irciZ3W5x1G64StcE9ETjYXnDAjR
 2NAStJZMEZoXKIldzxUtfsQ29oHmTAM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXyyQx+hPGlo04
 1L43jshQYQuyD4jfMqlj7ME5h7CDg6sv6eWMRUYQrYF2rRALphgYUE6+78ecEQJu5IDdIKGD8iy
 El3P+3RYIQefvhjbLyBLYwnkvKS3EDeSZV4VC5M0D/6/CqWfgu79pAgFnmYZhTMkFcPk5viTbtq
 H7uQZ7pPIBZIwOaHz4RC+uMNq1GBynNGRWmvXo7kuD+CBwO8Cffp2G/R1eULwa44DHYzmcPp7Iw
 VM/pcFuoZZh1Ujceypgh5UczXi+Vg8gFgClxP1i5QU15bYZbkmC2voJ3TcqWmHbdmScwWH3gBoJ
 myRNQnA3aaSyg38aserwn5tPt6UWCR6yOTWAFrWHOX1j2UMbF9htmTMP65wAZtnsJDCijDSUUw2
 2BEmUBUBijhFdzLgaoDnKk90/vZ8za5kw7LPwjM+3xWVxeJ/qVDcP1jI8EMBlbeke5teqjsIrxL
 W3kbOYrAESeBpcjiSVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. One IP owns SWR_CLK and drives
the bus; the other contributes DATA lanes only and never issues
commands.

Logical ports on the primary are mapped to a lane; writes to a port
whose lane falls in the dependent's range are routed to the matching
register on the dependent IP, offset by the primary's lane count.

The dependent IP has no sdw_bus of its own. Give it minimal runtime
PM callbacks that only gate its hclk, and use a device link with
DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE so the dependent resumes
before the primary touches peer registers and suspends after it.

Single-master deployments (no qcom,multi-master-mode in DT) are
unaffected.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 281 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 262 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a4cb62897192..396b57d8eb0e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -113,6 +114,7 @@
 #define SWRM_DPn_PORT_HCTRL_BANK(offset,  n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DPn_BLOCK_CTRL3_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DPn_SAMPLECTRL2_BANK(offset, n, m)	(offset + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DPn_SLOT_STRIDE			0x100
 
 #define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
 #define SWR_V2_0_MSTR_MAX_REG_ADDR				0x50ac
@@ -187,6 +189,12 @@ enum {
 	SWRM_OFFSET_DP_SAMPLECTRL2_BANK,
 };
 
+enum qcom_swrm_mm_role {
+	QCOM_SWRM_MM_NONE,
+	QCOM_SWRM_MM_PRIMARY,
+	QCOM_SWRM_MM_DEPENDENT,
+};
+
 struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
@@ -195,6 +203,12 @@ struct qcom_swrm_ctrl {
 	const unsigned int *reg_layout;
 	void __iomem *mmio;
 	struct reset_control *audio_cgcr;
+	u8 num_lanes;
+	struct qcom_swrm_ctrl *peer_ctrl;
+	u8 peer_first_lane;
+	u8 num_peer_lanes;
+	enum qcom_swrm_mm_role mm_role;
+	u32 peer_dpn_offset;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
@@ -950,7 +964,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
-	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
+	/* dependent has no sdw_bus; keep IRQ dispatch masked */
+	if (ctrl->mm_role != QCOM_SWRM_MM_DEPENDENT)
+		ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
@@ -994,9 +1010,11 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
-	/* enable CPU IRQs for the selected EE window */
-	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-			SWRM_INTERRUPT_STATUS_RMSK);
+	/* enable CPU IRQs for the selected EE window; dependent has no sdw_bus */
+	if (ctrl->mmio && ctrl->mm_role != QCOM_SWRM_MM_DEPENDENT) {
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+				SWRM_INTERRUPT_STATUS_RMSK);
+	}
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1091,9 +1109,48 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	u32p_replace_bits(&val, ctrl->cols_index, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
 	u32p_replace_bits(&val, ctrl->rows_index, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
 
+	if (ctrl->peer_ctrl)
+		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
+
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
+static struct qcom_swrm_ctrl *
+qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
+{
+	u8 lane;
+
+	if (WARN_ON_ONCE(!port_num || port_num > ctrl->nports))
+		return ctrl;
+
+	lane = ctrl->pconfig[port_num].lane_control;
+
+	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
+	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
+		if (WARN_ON_ONCE(*reg < ctrl->peer_dpn_offset))
+			return ctrl;
+		*reg -= ctrl->peer_dpn_offset;
+		return ctrl->peer_ctrl;
+	}
+	return ctrl;
+}
+
+static int qcom_swrm_port_reg_write(struct qcom_swrm_ctrl *ctrl, u8 port_num,
+				    u32 reg, u32 val)
+{
+	struct qcom_swrm_ctrl *tgt = qcom_swrm_port_target(ctrl, port_num, &reg);
+
+	return tgt->reg_write(tgt, reg, val);
+}
+
+static int qcom_swrm_port_reg_read(struct qcom_swrm_ctrl *ctrl, u8 port_num,
+				   u32 reg, u32 *val)
+{
+	struct qcom_swrm_ctrl *tgt = qcom_swrm_port_target(ctrl, port_num, &reg);
+
+	return tgt->reg_read(tgt, reg, val);
+}
+
 static int qcom_swrm_port_params(struct sdw_bus *bus,
 				 struct sdw_port_params *p_params,
 				 unsigned int bank)
@@ -1101,8 +1158,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
-	return ctrl->reg_write(ctrl, SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
-				p_params->bps - 1);
+	return qcom_swrm_port_reg_write(ctrl, p_params->num,
+					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
+					p_params->bps - 1);
 }
 
 static int qcom_swrm_transport_params(struct sdw_bus *bus,
@@ -1123,7 +1181,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
 	value |= pcfg->si & 0xff;
 
-	ret = ctrl->reg_write(ctrl, reg, value);
+	ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	if (ret)
 		goto err;
 
@@ -1132,7 +1190,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		value = (pcfg->si >> 8) & 0xff;
 		reg = SWRM_DPn_SAMPLECTRL2_BANK(offset, params->port_num, bank);
 
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1142,7 +1200,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DPn_PORT_CTRL_2_BANK(offset, params->port_num, bank);
 
 		value = pcfg->lane_control;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		if (ctrl->peer_ctrl && value >= ctrl->peer_first_lane &&
+		    value < ctrl->peer_first_lane + ctrl->num_peer_lanes)
+			value -= ctrl->peer_first_lane;
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1153,7 +1214,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 		reg = SWRM_DPn_BLOCK_CTRL2_BANK(offset, params->port_num, bank);
 
 		value = pcfg->blk_group_count;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 		if (ret)
 			goto err;
 	}
@@ -1163,10 +1224,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 
 	if (pcfg->hstart != SWR_INVALID_PARAM && pcfg->hstop != SWR_INVALID_PARAM) {
 		value = (pcfg->hstop << 4) | pcfg->hstart;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	} else {
 		value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
-		ret = ctrl->reg_write(ctrl, reg, value);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
 	}
 
 	if (ret)
@@ -1175,7 +1236,8 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	if (pcfg->bp_mode != SWR_INVALID_PARAM) {
 		offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK];
 		reg = SWRM_DPn_BLOCK_CTRL3_BANK(offset, params->port_num, bank);
-		ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
+		ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg,
+					       pcfg->bp_mode);
 	}
 
 err:
@@ -1193,14 +1255,14 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 
 	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
-	ctrl->reg_read(ctrl, reg, &val);
+	qcom_swrm_port_reg_read(ctrl, enable_ch->port_num, reg, &val);
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
 	else
 		val &= ~(0xff << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
 
-	return ctrl->reg_write(ctrl, reg, val);
+	return qcom_swrm_port_reg_write(ctrl, enable_ch->port_num, reg, val);
 }
 
 static const struct sdw_master_port_ops qcom_swrm_port_ops = {
@@ -1613,6 +1675,103 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 DEFINE_SHOW_ATTRIBUTE(swrm_reg);
 #endif
 
+static int qcom_swrm_multi_master_setup(struct qcom_swrm_ctrl *ctrl)
+{
+	struct of_phandle_args args;
+	struct qcom_swrm_ctrl *peer;
+	struct platform_device *pdev;
+	u32 offset;
+	int ret;
+
+	if (ctrl->peer_ctrl) {
+		dev_err(ctrl->dev, "multi-master peer already paired\n");
+		return -EBUSY;
+	}
+
+	ret = of_parse_phandle_with_fixed_args(ctrl->dev->of_node,
+					       "qcom,multi-master-peer",
+					       1, 0, &args);
+	if (ret)
+		return -EINVAL;
+
+	pdev = of_find_device_by_node(args.np);
+	of_node_put(args.np);
+	if (!pdev)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Lock the peer device while we inspect its driver binding and
+	 * drvdata. This prevents a concurrent sysfs unbind from dropping
+	 * pdev->dev.driver between the check below and the drvdata read;
+	 * it also covers the mid-probe case: if the peer has not finished
+	 * binding yet, pdev->dev.driver is NULL and we defer so driver
+	 * core reprobes us once it is bound.
+	 */
+	device_lock(&pdev->dev);
+
+	if (!pdev->dev.driver) {
+		ret = -EPROBE_DEFER;
+		goto out_unlock;
+	}
+
+	if (pdev->dev.driver != ctrl->dev->driver) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	peer = platform_get_drvdata(pdev);
+	if (!peer || peer->mm_role != QCOM_SWRM_MM_DEPENDENT) {
+		ret = -EPROBE_DEFER;
+		goto out_unlock;
+	}
+
+	if (peer->peer_ctrl) {
+		dev_err(ctrl->dev, "multi-master peer %s already claimed\n",
+			dev_name(&pdev->dev));
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	if (!ctrl->num_lanes || !peer->num_lanes ||
+	    ctrl->num_lanes + peer->num_lanes > SDW_MAX_LANES) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	offset = args.args[0];
+	if (offset < ctrl->num_lanes) {
+		dev_err(ctrl->dev, "qcom,multi-master-peer: offset %u < num-lanes %u\n",
+			offset, ctrl->num_lanes);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/*
+	 * The dependent's hclk is gated from its own runtime PM; keep it
+	 * active while the primary is, and resume it now as the rest of
+	 * probe programs the peer's registers.
+	 */
+	if (!device_link_add(ctrl->dev, &pdev->dev,
+			     DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME |
+			     DL_FLAG_RPM_ACTIVE)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ctrl->peer_first_lane = ctrl->num_lanes;
+	ctrl->num_peer_lanes = peer->num_lanes;
+	ctrl->peer_dpn_offset = offset * SWRM_DPn_SLOT_STRIDE;
+	/* publish the cross-refs last so readers never see partial state */
+	ctrl->peer_ctrl = peer;
+	peer->peer_ctrl = ctrl;
+
+	ret = 0;
+out_unlock:
+	device_unlock(&pdev->dev);
+	put_device(&pdev->dev);
+	return ret;
+}
+
 static int qcom_swrm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1627,6 +1786,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	if (!of_property_read_u32(dev->of_node, "num-lanes", &val))
+		ctrl->num_lanes = val;
+
 	memset(ctrl->page1_cache, 0xff, sizeof(ctrl->page1_cache));
 	memset(ctrl->page2_cache, 0xff, sizeof(ctrl->page2_cache));
 
@@ -1688,9 +1850,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ret = qcom_swrm_get_port_config(ctrl);
-	if (ret)
-		goto err_clk;
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode",
+				     "dependent") < 0) {
+		ret = qcom_swrm_get_port_config(ctrl);
+		if (ret)
+			goto err_clk;
+	}
+
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode", "primary") >= 0) {
+		ctrl->mm_role = QCOM_SWRM_MM_PRIMARY;
+		ret = qcom_swrm_multi_master_setup(ctrl);
+		if (ret)
+			goto err_clk;
+	}
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -1731,7 +1903,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						"swr_wake_irq", ctrl);
 		if (ret) {
 			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
+			goto err_clk;
 		}
 	}
 
@@ -1742,6 +1914,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		ctrl->bus.controller_id = val;
 	}
 
+	if (of_property_match_string(dev->of_node, "qcom,multi-master-mode", "dependent") >= 0) {
+		ctrl->mm_role = QCOM_SWRM_MM_DEPENDENT;
+		dev_dbg(dev,
+			"Qualcomm SoundWire multi-master dependent v%x.%x.%x registered (%u lanes)\n",
+			(ctrl->version >> 24) & 0xff,
+			(ctrl->version >> 16) & 0xff,
+			ctrl->version & 0xffff, ctrl->num_lanes);
+		/* runtime PM is driven by the primary through the device link */
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+		return 0;
+	}
+
 	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
@@ -1750,6 +1935,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	qcom_swrm_init(ctrl);
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl) {
+		ret = qcom_swrm_init(ctrl->peer_ctrl);
+		if (ret) {
+			dev_err(dev, "peer init failed: %d\n", ret);
+			goto err_master_add;
+		}
+	}
+
 	wait_for_completion_timeout(&ctrl->enumeration,
 				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
@@ -1777,6 +1971,17 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 err_master_add:
 	sdw_bus_master_delete(&ctrl->bus);
 err_clk:
+	/* tear down cross-link + mask peer IRQs before devres frees us */
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl) {
+		struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+
+		peer->reg_write(peer,
+				peer->reg_layout[SWRM_REG_INTERRUPT_CPU_EN], 0);
+		/* disable peer SWRM; releases shared SWR_CLK */
+		peer->reg_write(peer, SWRM_COMP_CFG_ADDR, 0);
+		peer->peer_ctrl = NULL;
+		ctrl->peer_ctrl = NULL;
+	}
 	clk_disable_unprepare(ctrl->hclk);
 err_init:
 	return ret;
@@ -1786,7 +1991,35 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
+	if (ctrl->mm_role == QCOM_SWRM_MM_DEPENDENT) {
+		pm_runtime_disable(&pdev->dev);
+		if (!pm_runtime_status_suspended(&pdev->dev))
+			clk_disable_unprepare(ctrl->hclk);
+		return;
+	}
+
+	/* delete bus before dropping peer_ctrl; in-flight ops deref it */
 	sdw_bus_master_delete(&ctrl->bus);
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl) {
+		struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+		int ret;
+
+		/* peer hclk may be gated by runtime PM */
+		ret = pm_runtime_resume_and_get(peer->dev);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "peer resume failed on remove: %d\n", ret);
+		} else {
+			peer->reg_write(peer,
+					peer->reg_layout[SWRM_REG_INTERRUPT_CPU_EN], 0);
+			/* disable peer SWRM; releases shared SWR_CLK */
+			peer->reg_write(peer, SWRM_COMP_CFG_ADDR, 0);
+			pm_runtime_put(peer->dev);
+		}
+		peer->peer_ctrl = NULL;
+		ctrl->peer_ctrl = NULL;
+	}
+
 	clk_disable_unprepare(ctrl->hclk);
 }
 
@@ -1795,6 +2028,10 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	/* no bus of its own; the primary restarts the link */
+	if (ctrl->mm_role == QCOM_SWRM_MM_DEPENDENT)
+		return clk_prepare_enable(ctrl->hclk);
+
 	if (ctrl->wake_irq > 0) {
 		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			disable_irq_nosync(ctrl->wake_irq);
@@ -1864,6 +2101,12 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	/* the primary has already stopped the bus clock */
+	if (ctrl->mm_role == QCOM_SWRM_MM_DEPENDENT) {
+		clk_disable_unprepare(ctrl->hclk);
+		return 0;
+	}
+
 	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
-- 
2.53.0

