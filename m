Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD384CEE47
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847513; cv=none; b=WSCaZbudXoCduW93mOTfoAfFdYjM9QjWZAtmr1Id0mT+UqoNqOscBwG7NHHPtocDcgYrQMmlJ6VCcXOILWOHOrFWzcXZltLUbVo/Ivi/4ElEXFE6Y+Dz7FhzlrbXQrygizqnQhVuLeGh10fnoaisAjz4uA/lJYij8Nn569gZP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847513; c=relaxed/simple;
	bh=k4/Vn2BuzlSbPoooATz7z8CrUYuOoU9Vb51MVMBg0qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaOPdlUOkQivB/OuGZHLlZ9h+lqnJIOD2ba9ZwbdMC45Z7Zhu7MzaWQesrj/OWMpoBtH2p5R9CF2CkhheHMEfghPVMNcUJILVQvIhP3OngPdsx+GsSKf0vzi+mtEb0YlZQAWx3ilecPf0zmuSKrRzLF2P7Iu44BApdq0wR2mMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/Wz2F5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th7K214D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/Wz2F5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th7K214D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xdiW1933282
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 09:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fdMiLJvgMjs
	cRhmymC+b5RykLbqp06ugDaQHifg2Sj4=; b=A/Wz2F5xADgLQYfhmS1XErftVI1
	42vLhj6+rX8CNopdn11S2BQpYHZtQbjCeJUU1W2ir2H/BIVr+YHI/+LWYrMio41N
	3qeacqTpADP1P8y9TGX9YtvtowDj/B8ZqzNv1q5iYxNtSV02GMaYL2Q3eRgJX+eQ
	MKrf3DdlST63fTcykZ2atMhf8yAf2Ia46UHYz9f18CrBIpXDWat1fuwa/Exz8AaJ
	jVWtr0kLLgs4X+QOilI2rAK8LLY0eNOItRrO9vum9mqWMxnc4i159OY7VkUb0Dp6
	QzgqVjwxZ3EXl0kRG3y8Dd3maYjeiKDwLf5KBB8n4QMKaE05m97M0lxAmbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfrqxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:38:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so138688485a.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847509; x=1791452309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdMiLJvgMjscRhmymC+b5RykLbqp06ugDaQHifg2Sj4=;
        b=Th7K214DRvNr47Ec03n3H0VyViuuQXMZpW3UGreUNaGyEWA/tCbuN5WjmKxP++LTMi
         KfrFgyuH8flBxpSu2tCW7f7Va5wihyaPFJr3VZzy+MWibNeDAPmKozRnh6Jgk/u95uFh
         xmSTRMj92yvzSoj8SpDIvvDu+6IZIreqxeoKxzt0Qt2ytIqXkZbUOHi1/UQ7WWeN87QE
         sN/WX4OMBOzHUHKKyRL06tSw9Zeidcc2CFpf4UvWnVs3T7Il4zI30j3L2bF+/lQ3GjlK
         3COzEUfBWttGpqeSyvY1g7q4r+n/lozNSlTCt7fWvzjLAGTyBvgLBPCjZ4eLGB1/7E0E
         qiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847509; x=1791452309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdMiLJvgMjscRhmymC+b5RykLbqp06ugDaQHifg2Sj4=;
        b=Y2kYeorZBTfHXyhDhA5TG+/fhnO2VJuscNaBH31fZoxzUCMk6lhPHnm6O0jKiVhyns
         bfz4HwQEPnBRXvC0TpHVLNASx+DmMZHRQ5oM5CdLjsti7uyhRSod4cyjGXH1UewDg7Ef
         KmbY2N2db/xog4wTSK6u2WjE3XQdKBK5Mwti5saN4F47ZJqSrV7FB8HraUBGDn6jEEd+
         2vr7N3NOHfyQSNok2RseZTqevAbdj+F7/58ERAJtVQ5SJXPcGYna5GuRZx5xI71qa3VX
         8GagXydE3eH364TBxSSyU3fi8+voYcJtqJNDvVpMZJESHrTvBHJaI+/fW0rrYBRZb01S
         2Fqg==
X-Forwarded-Encrypted: i=1; AKwUvByLUZLTaQ6Kxdr24BaAWqdsg15Zuu48V1BU1NmUjfSoqXVTKaWKOBPrgv8Z/5sy8n9nUnbojgvN996V@vger.kernel.org
X-Gm-Message-State: AFuF++lF/sOMApRyQ4no6cq52GVvEiv0lX1aF8MHysA9oM7ernx0evDA
	gj31VQPZ3CO5rSMSvW7nxyam9ZIR7tzUOIA7HZ+kDBrC90qnrs+FmJlr5urgfUpNA10l3k0audW
	gUXqvxd30jduLM1AirzRt46yIxMOjzuF70S+Z9m9f8b8NMfRiXyJOnjH77RGmKv1o
X-Gm-Gg: AYBFou3vf6XrjH7rbsosY7Qp9WRM8k+760TC/bGYiCKQ6mOYdit1jGKArl4inCh4Yz0
	iCCC+/h/Rroz16Frvnn9GmQ0HTcedY4SgLcCTkQf9yfUtFz2OFQe3o+1bLMdPEQod8bm/VpzfPN
	bhJqGy0QZPSY7ahG5QYcIIMubY6kLkrDyjL9c1EA9CZnewmk6rarEJjEWap2SnXVYIemtciYz4g
	YZMEb/PzCKsBjM70z+uVutnAb/4m9VCqcAWhRwLUNGcdOEi4RHxSsfV99aJYSutGtD2voS0cfFQ
	VRWqlnNi/KV5XV/yOgHahctafEFhTYXNU7ndosvbBYLscG43YcIVxkR85TvXdQSooyVXNpOb205
	LVPEaDHQfJw2E
X-Received: by 2002:a05:620a:72c4:10b0:93c:b23a:f976 with SMTP id af79cd13be357-93cb23b07d0mr436958385a.13.1790847508869;
        Thu, 01 Oct 2026 02:38:28 -0700 (PDT)
X-Received: by 2002:a05:620a:72c4:10b0:93c:b23a:f976 with SMTP id af79cd13be357-93cb23b07d0mr436955585a.13.1790847508384;
        Thu, 01 Oct 2026 02:38:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692b5d7sm5231750f8f.28.2026.10.01.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Thu,  1 Oct 2026 10:38:05 +0100
Message-ID: <20261001093806.634862-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7yzqpmkWp+Ms
 y9BvU0Qg9+SIlsYrptEhlKQNLjxZdzZPfv9l4TOfR6Ocn3A2mEhf4KVSkWVBr3i+BYLB3uNNXXd
 oXSWWThfod4mFBbLk4fOuPhY1Sikaaw=
X-Proofpoint-GUID: _3YYmwu90n9Ka2_qgCxbau55RQinBHwB
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe2a15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _3YYmwu90n9Ka2_qgCxbau55RQinBHwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXx/3h1Pm4tkbf
 cRkFVH1wlRVthSjIBcZ42KzH+3iv45wA6lPQMQmxp/VewC3CdeFbPwbD7a1MOw40Q38Hpl10MuO
 s7YVfVfC/TbL0WGORXKVSDnc9W1e8+JjgclJc/VUPZv/SYCq0HF3erT9gGe3Z5AgGEl/BdIm2gI
 F3fH9Z5kubJqcWuVXQwt+jZstvNxim/1AAC+HyIC5xAIU2pf318qLa1aqBPxt4UavKF0OgkYfH6
 lNtpp8l27IQVHSVbxcGTztT22LoTsokrk5sdLo9GADkyYiF76JwBSegtERGhmrNGgALH+0Auf9E
 SSpb906SHpF0ia+Ot3xrOSPaPaO8E/dEVi2zTy2uMsoNOeJp8kmzghBpfpFlmT03WechhhwND9z
 yqIJLRzwNWJnvNee3+nm8s/5y9Sr6OLjuJLc7/lgMHjXFQm03i+EbAK4ND4Lk6AZMynKuiyz2Eh
 ww9HqueqXJRuI94mRQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 767147a6635d..92e1644623c5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -46,6 +46,18 @@
 #define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
 
 #define SWRM_COMP_MASTER_ID					0x104
+
+#define SWRM_V3_MM_SYNC_CONFIG					0x108
+#define SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK			GENMASK(15, 0)
+#define SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER			BIT(16)
+#define SWRM_V3_MM_SYNC_MASK_CONTROL_BITS			BIT(17)
+
+#define SWRM_V3_COMP_FEATURE_CFG				0x10
+#define  SWRM_V3_COMP_FEATURE_CFG_BASE				0x00E
+#define  SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN			BIT(9)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL			BIT(10)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE	BIT(12)
+
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
@@ -892,6 +904,43 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	return false;
 }
 
+static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
+{
+	struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+	u32 conn_mask;
+
+	/*
+	 * peer_ctrl is only ever set on qcom,soundwire-v3.1.0 IPs (the
+	 * multi-master binding requires that compatible), so the V3-only
+	 * MM_SYNC / COMP_FEATURE_CFG registers written below are safe to
+	 * touch here.
+	 */
+	if (!peer || peer->bus.controller_id < 1)
+		return;
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->is_primary) {
+		ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG, conn_mask);
+		ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+				SWRM_V3_COMP_FEATURE_CFG_BASE |
+				SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+		return;
+	}
+
+	ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG,
+			SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER |
+			SWRM_V3_MM_SYNC_MASK_CONTROL_BITS | conn_mask);
+
+	ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+			SWRM_V3_COMP_FEATURE_CFG_BASE |
+			SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+			SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+}
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -920,6 +969,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -1935,6 +1986,11 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+		/* dependent has no PM-runtime of its own */
+		if (ctrl->is_primary && ctrl->peer_ctrl)
+			qcom_swrm_program_mm_sync(ctrl->peer_ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

