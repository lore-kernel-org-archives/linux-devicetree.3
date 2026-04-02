Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3893A16BB
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117525; cv=none; b=QHZeNvxw9DOrWsOLKNToleejy6Vh5Yww9W3xQnYIdTH4to2RGI8YMbyvK08S+tuRzykgnWp1ycnK/GQ7j0W/8tuc28hnQUaW3oH3NtT3xpNoP8yN3q4F8mbae5keWpmOSyO11oTumk1bvrEagDqomrqAFvYLoVR6SVhbbwseecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117525; c=relaxed/simple;
	bh=3nJe78cfkL1kyPmx34In1LIYXv2cp1Fw4uemtw2se+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUQFdRuhwBd2lvZgrPR0Z5udjp2UsoyqwrZvMul1D7biQXxjng1mTJ1GXO89fMKleVGb4l2Hfly+V9mJqjesx+QnceHEOp9V7GWEYnxAYi3k0YzqF308il2hTwowpUsPS1rFlFD6LuoKJNn8SJ00xa8M2C2yJ5jicxZl7sdSOTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHrhWAYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiRmWJA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHrhWAYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiRmWJA0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326luU24009498
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M4hAckrjCeS
	PiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=; b=FHrhWAYgUBKMGOHZm37puc5aNmS
	y+z8pF+icQRs2o8A6t+NaNA2pDufRm6MNuHHpuTqndaTPawVRrVWK3lBuJWt6pBc
	bAwcwp+2PonQCEAXAZPJBNVPhnlbaniOgbmVXg0lxQI8HIWoUlpSyfbtE903lo5E
	oxMN+FRjfC8M5x3yGYTh7lxuF9XwsOzQpPrgqwXI7OiC96e8mMYWzq7vZ0YKjE+X
	IuWTOPFtecEO8hvw5sm0xScQDISxx3nlmz22sMLls/zRHWgu+MxEUbWbDzyCqAks
	VHcZlOchLaAJCtJ2Jf63NHbdjuOERoKnw/R2DXOrGFKczuA8O2GwdRfXa7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e02y59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so25835721cf.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117507; x=1775722307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=aiRmWJA086iH8vIkpNEpJRmztZZ3YmVoxa62+CoahILPNAp+DD0+34IVhw9s9FpM1R
         Iq6ox38cQ7HlGw86PKQ358wNy9Brrdy0xIsyojmpWaddYVFM31SgdJsk3vOyZ4tlZ2kh
         RlbHM9SbJ9Vi/a2R9CeQdKDvMxZsp0dXLWXAzBODsxASqOB9nNIqBDnD26RiEtFPWmM/
         GXrF4OLcyiqZvSCHkvOj6MBZ2hYgT6GU2fPFNYgAqmPhw8IPEx0eZxmsaqdgy786fsrz
         oS84f4MEj4PTjqOcoYOX9Ds8exynxgS7n1iNALdT/i8TvQQOZQrkXtdLK0SOwdAvVV5A
         Fr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117507; x=1775722307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=p2G0lygpNKyMZTQNeSmeddNFeoGYbzkrJjOSx5AfW8cMIsEoG+bSERN2BaH6VVJilH
         eqAfnxzYcgbi9IQjBiOHyg31Q3lQUSrRU2rJYKf2g3GR6bcUCN9RCqVtEpRcwxbtWe1x
         pwvHV2/Y9x32MjVccVLFCJwoGdfmLPx/qM4FhPWRNHRzeNdS/0IpdgwcuneB8mIz+lYT
         oE6271JxbS7AsBiRODmH0UqZNLBXxllFgz48mu0atp8x6kEOralQR18N3kIlYp/Ri7Sr
         mCegcYv+lT79sGjqZ3rgf7LKzMgDnsgrteMHsDqgdHTQDP5b4X/6N+y1c4jZJpPt5Ilb
         czhw==
X-Forwarded-Encrypted: i=1; AJvYcCUBiH5WjDiIo/kh7Jp7MZ8Hf3z/OAXgLFv8ZAOwDv2A7q5lftWvvNTLKcyqAYfGScqNqz+ZHBi5FAf9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9muXv9rQhJKFoHQuDJqQyePmcJTvlBpsfrlj1q6wZARt3TAXQ
	qB/IdC60KEB/tezpHoiKOeYgicVqtcPJV7RGjsJEJVhkour3K/wSu7nzFL4JRK6oZGgBgGqQHLp
	OnAk7UGe/pFCCDsNC77mSgwoVLeMdc9Y4c8Cy1yEofgqjKmOSeghZ1wm5OaBSdMZXISoCVYrl
X-Gm-Gg: ATEYQzxCd7GsiWagdjYrhSmLsIXB40yIKfKuStSVxj917zVeeaIJ3QRQ7cvn8fXdlPg
	j62oC5z3sMevSfXRUKGJA47kXLbnh8iqDhUczGm2atwhP+p/ZmdPNH0JaicV2FKMUcMTX48PF1r
	VRtLqqnR0vrPCzmZhs8ojqJ268AXupXTuhTV+P5CDB1FXnF1/Uxpy5vM95/Rh6x4i8QxBAuU8XE
	P1NXf+r3RSnOr8OVLkSZEOW+yRvHXTsqgVdybELWpYFl9OkANYUnWSXgnsxZY1vJ8Ds4/dnKyXF
	h/75WMfu7DoxfUMWgYJRSOWxPy3dMS/TscT2F9wzI7CC700yUOPVN2R1+XOeot14xqnOLO6VuJW
	gWF1JIzKddKOlBy1ixHa5T/OQhaYleF1EgMKr9PgdlRrynoja0yc/I8Q=
X-Received: by 2002:a05:622a:53:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50d3bdaefdcmr94591901cf.67.1775117506678;
        Thu, 02 Apr 2026 01:11:46 -0700 (PDT)
X-Received: by 2002:a05:622a:53:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50d3bdaefdcmr94591691cf.67.1775117506259;
        Thu, 02 Apr 2026 01:11:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:45 -0700 (PDT)
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
Subject: [PATCH v9 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Thu,  2 Apr 2026 08:11:17 +0000
Message-ID: <20260402081118.348071-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce24c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _pU72iQObjE8PPO_tjRZPgFcYBF7ELDR
X-Proofpoint-GUID: _pU72iQObjE8PPO_tjRZPgFcYBF7ELDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXzjF3M7QKeKuA
 Nb8/HloeMSRCHRECMRFzox6c6VsImhKHAvvGFF8X9ZapYRT/O5aFlhREUxzu9zD8JX1JJjI3jT2
 NCstffvX4yqj5ZDXGq0UGFhgab8XlOIHgxbq+yWKEmVWBvuBsfjFy4Q2dxObTzQxoLs79ZJJZ9X
 YyEU41BLIfaUAkgH4UGqBYUVONNH8Coa+XWQtjetdBNBw5xvfhLJXaDBa5bQ3x66g3mMSw5lWA/
 yUdm2RNs/lShuGqz9TzBEEFcjkRcQheuEy3itJSzPiU9fHUjza7DytUgEBNZ964si8xDQwBY4Uf
 eUsoMhp+BaLd5dPu4Ih7JMhG5JK/JTEYyW5gNqzHJXAXO/ySsDMckWVzaXsxhpkIgwxjG/9kiYB
 Euup2UPx82ptgoyqMBdQikRZFDESPf8hqJwkyp9+uyFRye7H/gKXjcrUXzMxi2pM4KYMyPBRG3o
 upVOg2eT1pmaHqQXvcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072

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

