Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6AC384252
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305561; cv=none; b=ZEb7uKDddsH0mWe6fcgF8T1yBgo3hZT3PNkyanLA8XzV0vVpijkQPfScYF43XloUBdsZ24iOBWCM3ohvLsQwOd3YWjVeNsBGaZa3aR9qNIhSd58ha+zLMqNsqb2SPW7iFQ9LhODokITzsdgrRQwwdiOiqrlWbTEuBsLE237bOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305561; c=relaxed/simple;
	bh=PuJFamBh81bE/Zj8ZHvJy/U5gL5zjKCwi4dfSJ851vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSzr5qq63BulQAsjHiqpFu5koFb+KvisLV2s9dtfnarmilikWKS5247cTQEgT7oWq8LUg2ijapvMR7p1GmhfwUBjhGTaDTAHWsRGrTwuBVqfE51pwm16XUWwJTq43VZNA3mc3RxUl0iSBB9dbHqX1jv1KMH96n2fKpZuc4sAUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8uoxNSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWX8KDpc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8uoxNSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWX8KDpc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXfH1761789
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fSPCBd3T5A0
	bZHkS+KsyEWqVlhqEkiuzb7wl/h6xEi0=; b=k8uoxNSMU7vahl7ty1y7PsIVjy0
	bUz8emvwcfiiy5VJ4nUMIG4yQzzVW+D0yl5PYy5SbBrNrCd/2NbG7ZYCg59Purdz
	4+oxrhwTjp1UR8cQ+/h3DefyKriagCORWUsDjt0JcAiE/BvL506weLWq6R5Umj27
	uw2msCxcVLtQP7w5D0G1DBiAi15QYZ2d0dutZt92gPTFp85JJPLSIdIWUOv9LrJc
	3e/5+5CBKj7ZXxfHgH7oIFbs2LDAYppONCNaQ8G+XUX72LTOegJ08YCU4e6tzQO5
	reMAL7DykwnCDpOrYuJaqgM+trdgdql5X26TKrsbk79R280V4x3i0Y6k4fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f09sh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so177386681cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305557; x=1774910357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSPCBd3T5A0bZHkS+KsyEWqVlhqEkiuzb7wl/h6xEi0=;
        b=QWX8KDpc9x5c7/eM4/cDxHAaybH1LB2qDpAc1/Fw69mIQ6wTWWm9WGJu6cZgwT4bim
         DlESHwTWO/PXxq7Jk969bHP2Psn1GqDG/oHuo+ohNstf8JOOtHsi7OYSsu1yN0EBguST
         KhexXU67mvoQrThM8vESp1cqZRzieaQNDTmiPR6+S9sdpJaXLzCgM6n4eXnFOW3HYj5T
         Mehjigwbe8DKox7DVJ32Za/4zNaluyr76XTcEqfaFoxGJeowjAUQ7uaF2XXQg2zT0KM9
         mxBqJ9yXMs/dEHkDpw1+krAEO1MuJaFvsvct8vdjJhI2glqPvVeGL52qY6VyDr3isG61
         zYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305557; x=1774910357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSPCBd3T5A0bZHkS+KsyEWqVlhqEkiuzb7wl/h6xEi0=;
        b=W7FbEJgDUKSMLdLduZwN7OHTSr5+ibhWV8QjQvRvYga3+GKP4WM2gHnk84SF8qBA4d
         DaUecQe2WTy3TqhNbptJIEcdRlUFhiKHxnY+oewTSP48f/H0q8/WC2QewCcwEZ9LiSvn
         WqRYW19vAhm9AyF0KGIWzfh3YAhT46OFucpMqgHD+8kpjE8x3yR+7lZVwVGNWEwHHKqR
         6eBOECbbWwwKpEStDWLPemvuKMueWklqc+Y/DlQ45VIIwlrorm0rp26srGs7sSEWE9Uy
         z8MTS+qOeW7thAn0QNQWdwHc/797q40I5NFRbEMhO7EGIHGqvFIuQfQWjm3j3bm7vm8S
         QI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfuSp+oKoYocpMcB8qMuOUBoSRfOS/Wmf0msrLVc9SOgzEcbLO9T/PXv0+MHNJp4N7g31/ypCIhr3l@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSrM6lPVXafdnrA8zGftd8tk7eABQUS98/IVTwqaOBqeQOtEh
	+6bFy9OwpIG6NuWPUd7LAXlhPKkG59UkRp0hgIcnSzVkQzBen52geX6/QN2SReTmGg6sPOmzzH7
	rPjkPJgDGouWd0oJTz6X8veexf0AVusRkZ/XjL1RNawBfdR5OAFTzWPlDiAxFrCmFTkCQERgF
X-Gm-Gg: ATEYQzwbQr2TSZlMYMVskr9JSX8FdR0lSa+CaD86Ua1yZ0gH9R1LouaRVW/QitRb0J3
	2Srs4m0oUu0ivp/w9aPryh+nmiZXZKF8oyfQ5SL3MhNIeXtkgudi1VGLS0mSyycoIuNvMcx/3GK
	xiSipLkplPnwqecvt8L1LLddt+rTWFzP9JKumXAbA0rfU6U8uJz5VKhwaw4CiIuma96kbf/RHLB
	DlkRDEK6h3jzCrB4CJUj4AEGvC8OwV7VofNiY/GEsA0zs1TUpJtFGl7qRmq4k3br3bXZuwBnIHs
	dX0IcqlCFeDQl4xVfwra4l+N+sYPTaiig5hH3mDz6QXf4eQVUXcjbwga5wT/2oNLJU5N6ZShaCF
	M+t4l1+dKxDMWzUJSaVvgKYrdBsw4Lbp328XSH9vNhKbwFE1scIF9/lM=
X-Received: by 2002:a05:622a:1391:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50b375a89acmr211411321cf.58.1774305557252;
        Mon, 23 Mar 2026 15:39:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1391:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50b375a89acmr211411001cf.58.1774305556758;
        Mon, 23 Mar 2026 15:39:16 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:15 -0700 (PDT)
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
Subject: [PATCH v7 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Mon, 23 Mar 2026 22:38:44 +0000
Message-ID: <20260323223845.2126142-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1c116 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HoEoomHT66DfvO7cLycqgTv6RPTp-Ri4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX2jN2Q7k2Y0et
 /8/Sghm+ZntGasJRx5oHPnUTZxT1HdqgOWo6U1mpegUOW69jGXC8QcZkS4jy9oZzbZOaIbYfpY4
 zOIS0KptTSIO73ziUnL3XJKY3cQFfOJG0xJnd6MksJlv7pjpDWV7XlOvjlI/aQJXpuE/nEHfHQB
 ZpI33RZRQYbpvVm1wKkidBI991VCLIwmThLCFQkyZ/BFQjiuBrQtlQvbKGPIpKrnZajsW7ChV6i
 /u5OwVkHsaCCsGOCMvCwJ/aYf2LuH5M8sH0ykqgHEvvFojlZyKhsVRSJpF0+P8iIqSC1i13sKGn
 VCppAIe0PFikeuwblDPsitX4WfnNxrrsUpmUiGelf0l73kwnKGNFgomzEBGiFpPq5iS002SxGdb
 ql4yCDrT8w/Rvn3L9jPhDCElLjo0ZVgK/25LVk1pKvVJySvSYe6ZqJS9w3xHvBPglcG50qk55YZ
 RWO9EKX5dBCIeSTFl/A==
X-Proofpoint-GUID: HoEoomHT66DfvO7cLycqgTv6RPTp-Ri4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167

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
index 9d4cbe29cf94..c874dae53163 100644
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

