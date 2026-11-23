Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454073;
	b=gc+F8D+arudg4jGbACrZLT6YtbloSHgJp5q/XBZtlIia++25O2OVFv07TAdUIiP+gZmr
	 c6kxByg7m3FDUgIJedNw+sH3q1AHQFvqcShyA6bbGZdPgOpnHb18SzzAmeZgSSvye/IIL
	 VBKzNSHEVlFZAAcv4PxRVSTLRsNUGTfU6NpFGv8TqAKIxBjJX0jLua6/80FBGE8lsgWzF
	 /awTcfTeF860bjLh1w4MVx9y7nlOpeJZZgovS/FU3meF7b5EATiCzZDL7OEdDld/YLP4F
	 v3KobYw0vZlFPjFPsVl7pwAStGbV9MU8h0o18yKIe5+pw7s+l7J+JXNATULeu5tyDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
	b=gKLCLFIq/HjLwkgHeu9rjUFdgrmvscoa1KKoPY+sNqjOsZrNx47cW3fyjV8FJjWdYX85
	 sArG6EtT6xiCKGLie8aMO7WS1jtaO+vbt6rymA8EWXQ/WbOmrJrtexO+OpxB8Zq9+17pz
	 Nnb9+BlRoB6hzJeGz59KF0idawAFeXaGNSG+tJRtk72gJ2sAsr4L+XEuQe+HWJjFIIqRg
	 AaXPDyJz1L3bfWzX63cyqG2GQxNQZHVg0xMPUVDUF+3lhVqLhCuxuCIC9yaTvzuguMtfg
	 tDGRE11GTq0oUWukfeE97KXnFXfPJVMbOXELptHOu7ZXTVFpgxJPhE69g0ialB3Uu0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juNq/kq3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E6606A686
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7E6606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juNq/kq3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpiq2769030
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BFs5eXxfxc5
	hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=; b=juNq/kq3v3/m83E684FI0cXBlc9
	EYxHFjBLjBIWDAg3NBHb+VClOhVOyb/+7WiBpF28scbJFskh3IrcOGQat/M6J7kk
	b3F6FtR18X0CE27YPOML+LYEpzERnzrXiMUG6PNOrqnloTUjLBgDn8Kn3/S+m57R
	QOTY2NMbbZiTphTmH2vPJWnM3076xdzxrI/E3FlLngSzbgKKh4uzUkXSyF/irpNj
	u4V/4+Tj2JXhdonk5D5M5hvH9hX/h4LAuABJvh09LokGdjb8SXP8oq1HfK99hdYd
	X8yGxPED8QdFhCgXZyHKIlfr0DQGNWAS0M0vxCb4xmsl8cusXFFjlqggqag==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fb1f981fso47294807b3.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454072; x=1796058872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=GZ1KRd1Uct1EmlSnhzzfTOhhwlX5V3+TkiqAsk/taacB1aF+YOAjtWiO4fX5H+NQxU
         D8p4xS2ypqQkYJUtvXHOMCnw7juHBYY56jXSWm5o85G4Pmyu755IO1g5yW+JBhONS3JH
         d0uGFrDjclCiTEy06iBin7zMy9twLpux4xCl6t/rn8W6Z7BafPcHS9j/LVc9lhfKxYd9
         scJTCtwiUs6IRV7C9njlyv5YmvcuXh99NbYlWKNt0N0QJrSetTueZQDP9BQmyo5xV26R
         fNWi0MUcYAVImYzLbdIsFEINkmz++DKLvxEAnFoOh540KGoyApcEtJXnTpZxlMLV0Z2s
         djWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454072; x=1796058872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=qajGM0PgTTDgOEvmlFtuWCG3vNSbttHJiHNBr6V2bHULmnFpmW2J7bAeB64jtQAKIR
         0MxNVFMIxJGhofuKpV206Qo6VwXt+ZKpOeodHKjUQWXaHGI7zpnjX3KwboM7xQ7C2d8m
         0XnIS2xn9Fa/kgIBUzD7kV7CGizDNW9DDMf0JIxP6aauFI3f7jHSSw+u2cG3Ye8k5rg2
         2Cty2TMAlx9mqjKEUiMtz2VfhJuoY+O3HyS6D2dVHXzUaUrmt9Q8Uj7adtgLUT/CbkWl
         WfZrdEA+/0aC2lXNXWAgebRTUi6CaXSqskRbODoTYp4ZVuLKgIvco5qVdRBKkNdatZ+A
         4ViA==
X-Forwarded-Encrypted: i=1; AL+hErH7VaIYUe7ZH2tVHRVSQqkyrOuUagIZebXZKQhvdCEamc3Mvxe/OndugRukH8F/9R53KwXuxGk3o8SR@vger.kernel.org
X-Gm-Message-State: APuU4Z9a6CoObrYg55CGZgZcBPMLzenP7xnxj9ZjCwNsFS2kaZHEvSAW
	m0x4rtHzcScpWE/Df+OzA+3E68AsOcY4fpYCCSxtCItF2M7jcS7b2CfSlbFuGSrWt/pQjER9K3r
	OOazSUyaErTTdqoHPfujwXVHkXDxiOJqRSoSOQzIGB8N0ksaOmZsmUqnZsybMw3ks
X-Gm-Gg: AZFdTZfYh6WJ/bk4J3zUhgx+xQuZ9MZSO/6ooAQ+9JRLAu2hs8v1t0gbUQQ5UQKkx6X
	5ht4OBN9a3e2ZK3v4/AAPpkZnTh1v7PsClTkA6dF9xPsuSOXwYaB6SH4nSruuXJ61J8HKjdS2me
	uonaD3koAco7F6Z86aG6aB3zYCF12rZCn8iklQP4jp0q/ujH0kEQ+ITSkS6qDg2850YTov/Fjs3
	F8VYpG5K0VWos8eQyHWKM8DpUf20kgj7sfF+II30VzfjTn66PK8HB+osyaJ+8c6wR04oonkombG
	WOnB0yCxaFoANXdU+Rq5PupOalHZeIFGg8mdJyunzBako2O1GMql1Dg1OK5DVCkcaIY0k/kaLiC
	u9n0bynzsOU+xq1/s2JJ43JE3P2EN5xCDQx4s67SDW7oaxb5AsXv8/ac0DVN/JS+/
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273287b3.52.1795454071539;
        Mon, 23 Nov 2026 09:14:31 -0800 (PST)
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273187b3.52.1795454070951;
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
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
Subject: [PATCH v3 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Mon, 23 Nov 2026 17:14:11 +0000
Message-ID: <20261123171411.444381-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX/NdonNIlPZKT
 QnviCU2LPrlDWRdp2nHkgHw+V/MsnzXMtIF6l9L8uphT8VXgOwG0IB9MB9VYFw0HW1D4f0BdW6D
 hKEsev5vN0A5i2GsQOLsMxqIxevty15cussIFbi77Evzxgyu3MOFXrX0wn9kg1AbBYpoJb46XyU
 mR9wpn2Lq0zaYDG8QSP1gNOxpxbjO1Vj4puB/jq7q/sSUu4DwHi8AYvVIDojcRJRaXf2QHgFajI
 RYGt0AhTVjYRAPpca1I8nh0TIxZSmQ/L/nI88gSDmkxJpCp0xRLldk7qvSJwpXzCdlWmaK8TEJF
 eAqJWA0nH+Dh+Au0e2nOvONmBDylrThB7/VdSlArTWi81R7WNJ1NGu+sv31vjRrMBN4RivMZFYU
 tKyOryOV2B+twxMksdy4hP8zSW08vfuss5a4TzPF/a85c6k12z60GzdX+2MTquImxNMWdcA/uWm
 RXbgweFEOnXhqM6PY8w==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047478 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: etGkS18bHyrE8IgOUnzu6apMtwwlUkq7
X-Proofpoint-ORIG-GUID: etGkS18bHyrE8IgOUnzu6apMtwwlUkq7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX9KiDxftVDTO3
 4pmVBOLisolyyletKZbVF+ZJFuj+qAhA1YStrxJeCIG2DyldjDuH8UXbWFmBV/SLG5YJQ7EL4L4
 szUonL6gu+s+Q/KNGecrzT8ozNCBOKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 396b57d8eb0e..20c805204de5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -48,6 +48,18 @@
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
@@ -949,6 +961,43 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	return false;
 }
 
+static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
+{
+	struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+	u32 conn_mask;
+
+	if (!peer)
+		return;
+
+	if (peer->bus.controller_id < 1) {
+		dev_warn_once(ctrl->dev,
+			      "multi-master peer has no qcom,controller-id; MM_SYNC skipped\n");
+		return;
+	}
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
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
@@ -977,6 +1026,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -2059,6 +2110,11 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+		/* dependent was resumed first via the device link */
+		if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl)
+			qcom_swrm_program_mm_sync(ctrl->peer_ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

