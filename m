Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746C3B47E3
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858917; cv=none; b=u5XbJlPK5+9nvXejtVqqB7A9xTFFawUJTXhodHC2oRK6F3vd7iWwJ3V7zK4CFwqA2j3zIg9JoW9yDWZyYrV23twp0zBVX+cE1xP8tmXvGsspMnrHRQZgywLgw38mnn1D/yJC40uojBmiNsA7eeuAEstXompVFQZCYISnjNXCySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858917; c=relaxed/simple;
	bh=3nJe78cfkL1kyPmx34In1LIYXv2cp1Fw4uemtw2se+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCfGIyuX2X3joF9oga3XzCucNFwhuENqbgbiL/SWsVmyaP8pqc9m0Xh6Ujq4zNV+WTBT3ZHVEIedSyXpCtQDY0RYh33T1/0EvjP+6GQGB3eSw5baKPVbkpB6UPs84hNTRrI2XGSeUPn/wVNrHWz1jAg/JvNPGH3TppClZ2B0F5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIOZW2xA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj0ePJC9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIOZW2xA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj0ePJC9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4PU7f581263
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M4hAckrjCeS
	PiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=; b=RIOZW2xACaETKY0eRKCB2sjsRCP
	KjBRShHQa0ritDRfFZIk2H386rB/cD9ECUcYl9viuAB8+2ZtxcgK+v4JiTZRWa7Y
	q78F0ZdEL0cHzLBpQw85ZVTyHYmeD283tsCewjirdtHy/e0bPMlK33hyLN/mM+EY
	GEZ/k/zMJOPXOmj5YS7USh1lNHgOL3vC+omjx8/OZgbXm9OJP8TNx2j32mV3Qdmj
	68gXXczdY56aeITu848jUhdMZ+jh4+w000HC4Sm69608JXV89iQXT0PL6xKDfTEK
	JvUtL8G57DnBlbVekuOhSh4WJgHgTu/zGoAfbMeRDwqBeCnc0nexnZgDELA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b781542c1so100976171cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858914; x=1775463714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=Dj0ePJC9R1XPnlVIaRPb40oRqqp/UZZ9rc2M32dEL/2fYfrweyzo1jigmDxX6T7new
         GQvLRviFwFBTECpW47miz5708mGsCG+lyE1Zw9A27/R8EZU8tJf7fI0kuC6DsnmYbqDy
         DlMW+7sbK5kGYD1KfGuVa4YhEZGnckYmSxf+4i2uzKnszaF0j+cS75g/VTQgPbpRiinq
         2wFYy7FX9roDYQDFfZhu3Y8Z1lhqTyspT1dnSTASRU/cTcyq5Hi6No3ybxzveRozfn3m
         UasAIgoiLKqbD4pPJyvJMpAZpEw/o0kjDSoSrSxtLwVZ4Zp34ZpZcEAfZQUPzj/vPNtw
         iT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858914; x=1775463714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=UqVxw39tOVDgc7xIIqbmT3jqpgkvPs/VLjhHwYrPqTiEcB2aDIe+vVnh9qwSti4iKz
         /qahffc7v6iXvq+yd3U3UD13wYcqRJbT85s7wiaTuV7iFrRLxjjQYvtcDnY9cBozZLXc
         3y+6ZeOsJYdawygQbbU6OBl8P6TWOF8D5QKisBCDp18eg56FlB+Ywv/so2jJfJZYy9U0
         W9evUBxgLdC7wrhzn6/1RbD+4VQmv3KS0f0Pc8XKKPX3doMwnyyvENsrnEro6ipsy6dT
         qrZri9iHWrUiWlqslENJbJ+X7yAhEyejbLprw/eR/ChymGJ5fzrlAfkQ/mbfr/svvV9E
         0QvA==
X-Forwarded-Encrypted: i=1; AJvYcCUvCD/+u6hCDpVns2uT64i7WJVuZV0OisjJsndBuS43WuC0aw+tOYZeBGfU1ELEOpywNLHGsjBBlSAK@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXlgRsDE0HugJlsGggWcCEAlcVrKbQN17fgJrg+268NRFVaB+
	QiUrawjFu5zobwKoL5spz9ktwiZvI+XDeU07V+roMd5KXvLZ6tU6L7NehF2Y27ygc7R7fiYQK1D
	NDiPgLjJiCN8wUwg7Xh32KwoeMFpnHAbLYdsc7w5wNX4mxKnLpEZ2KPpBoyqenPU+
X-Gm-Gg: ATEYQzy8C1X8pB5XSOD2SxBko9jwZNNrsPEjpDOlU7qKEqNwOjqHSfiqJ90Z+rpVxpE
	sbc22NqdNeZuQz714qQde7YKBJCznGLKab68RdEN9TpygtArV23DzZLYzJfpc/0Bm+pIpdbmOjp
	VH0g0yIjzLIhOIvklIn92PdGeUU3Nx9N+4pIVuIisUDxMj8aDlsP2quEHFUab3SwGcSnxbcRmVS
	t2lao+Gst2AmDI+hi3Tr6kEj/IKWOyOBKYMNoVsm9Ei+hGzTldpb62zTQwxCWDdcnlcP0Muk7qz
	z0GwwOCEvbvfY2LsWwu+ZGlsPbEzLm76jcjAv2k3yYeQNOpYX+A/rTHTOfoF3Qr4meX/Aa+/k3d
	6aqyBaZ8e5l+x7EbPDRECnnUoTHREonhcmuHyfQsvQo9GvycMCY7X6Rg=
X-Received: by 2002:ac8:7d15:0:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50ba37fac78mr172230591cf.22.1774858913631;
        Mon, 30 Mar 2026 01:21:53 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50ba37fac78mr172230191cf.22.1774858913115;
        Mon, 30 Mar 2026 01:21:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v8 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Mon, 30 Mar 2026 08:21:04 +0000
Message-ID: <20260330082105.278055-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8sfalAhaRvmY8ChuMsUA995fUAMouMH2
X-Proofpoint-GUID: 8sfalAhaRvmY8ChuMsUA995fUAMouMH2
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca32a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXw1dxg6YIVu2z
 Rk6kGNFQsd+IBoBIKvCsxmKtHBnL3bnEoJy4YfA6+mpbAOeJlnuLiPw4WkoK+eYEAFxz1GcppxD
 QQNCcWRWB+k5wbkCA8c3eOA9MH1yKfLsIHMyfWujJSRVTCC8kFc41l7BNjHDgHHn4Sf7xHieYnr
 rz+VHICD1278sSTAUJKJyRYKjxm+xYn5ylPO6zVsL7SybMLlKCudS4Ros5wHzTsVmDwghjOyPuS
 BuJjUySe6PIQhyKGsKXhIE1KG8dIJskI4PweFlPNwBM8HtlAOqSE6Rope3qQaa8Xq2fOuCWimVh
 YYrRJXd7CS31jOKoNuP0g16zT5dkE1vzi5Ks6fTYNroifGSVBx2KX+ftq+15FzaglvoEKXJIDS/
 WVpVyzMDLHc1+ARaoXIoYg4W2ZyumXsSRGRPh0dYwEPA+6R2PqIFKWEu6MRVCwgxPbAe5HiyP2F
 SnUCi629kxB2C/YMWlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

Remove searching for Shared Memory module instance id on every
read/write call, this is un-necessary if we can cache the shared
memory module instance id per PCM graph.

Add new member to graph struct to store shared memory module
instance id to avoid searching for this in hot path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  5 +++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c            | 14 +++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h            |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 292be457764f..86d6438bd9fd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -355,7 +355,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
-	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id, substream->stream);
 	if (IS_ERR(prtd->graph)) {
 		dev_err(dev, "%s: Could not allocate memory\n", __func__);
 		ret = PTR_ERR(prtd->graph);
@@ -496,7 +496,8 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	prtd->cstream = stream;
-	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id,
+					SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(prtd->graph)) {
 		ret = PTR_ERR(prtd->graph);
 		kfree(prtd);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index e904066484d5..006b283484d9 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -203,7 +203,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * graph, so sequence for playback and capture will be different
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			rc = PTR_ERR(graph);
@@ -240,7 +240,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			return PTR_ERR(graph);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 5751e80b3b92..6a3942a1ed28 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -411,12 +411,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
 					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-					graph->port->id, iid);
+					graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -449,11 +448,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
 					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->tx_data.dsp_buf, graph->port->id, iid);
+					graph->tx_data.dsp_buf, graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -604,7 +602,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 }
 
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id)
+				     void *priv, int graph_id, int dir)
 {
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph *ar_graph;
@@ -631,6 +629,12 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->id = ar_graph->id;
 	graph->dev = dev;
 
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	else
+		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+
+
 	mutex_init(&graph->lock);
 	init_waitqueue_head(&graph->cmd_wait);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cf538397841..7c646ffcf956 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -99,6 +99,7 @@ struct q6apm_graph {
 	void *priv;
 	q6apm_cb cb;
 	uint32_t id;
+	uint32_t shm_iid;
 	struct device *dev;
 	struct q6apm *apm;
 	gpr_port_t *port;
@@ -113,7 +114,7 @@ struct q6apm_graph {
 
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id);
+				     void *priv, int graph_id, int dir);
 int q6apm_graph_close(struct q6apm_graph *graph);
 int q6apm_graph_prepare(struct q6apm_graph *graph);
 int q6apm_graph_start(struct q6apm_graph *graph);
-- 
2.47.3

