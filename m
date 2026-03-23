Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E8383C9D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305545; cv=none; b=Xm6jWnUQ0alAMZqEd8VRexxNb6lKUT3pzgHQaPiwIdiQROoad/YN8lHzTPLmODSM1BwMldK8fuhlotR3v6umev1S4Bks5UsxCMKhkdBZgJIUlmVPrZVARk5c6Dd1/AmLkv4vn9XYuzeoeclK78hbBdzNU1yewKGcsdxm/KNbJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305545; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVG4R3vs+nzAPa+cU34GZIt53+1LsV+t4aP4NnXDHFieXn/lcf3yaz/LofWYd/CEkt09S6DbnySJhizTCeidwwl30VfV53V2vZVvmO8XdAiHylLGmDf3WeFvnIoGJiTgCu/Z29JokqUrLvwphMyDkkBL5GT2vrmc8vsUFn9jm+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHbJWsIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSxYg5FJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHbJWsIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSxYg5FJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqqK73934910
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=QHbJWsIx/8lLLj6n3P/BeISv0aQ
	kBaTFMKLD+cxAyz55BUhVzExBgrs1cgJiYNojyZnCC30x68+kVZQnUGvcA91hvNH
	CdOu4Dt3MncJkU2NlH//PlKCKSxfgoIGhVeF7hC9N3trUtDWcyqm7CV7ai3T3Zql
	DGHOlqB1c+T9ZTxmhm//WsOlc/hFc+sRghEtJUs3endX3fg7XeHUMitHUHx/E3JU
	QWj06u13jBrbiLLbGd2qxJ8mkOT2Ux2Hq2nT4nKhInbYhBROWXaQl4BtZ0RjJb4s
	XtYkpGWEYq3fpELYZ6gJiXG+Vc4/PMO9WvCblHBrSIyDYDd7xAcMS1jnlBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hkbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso38579391cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305542; x=1774910342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=gSxYg5FJvmJUWNNPuyFqPVTw8NXuJDjIWJNPOETNL/QXuLed5zx8ISFcFOlOPo5XtE
         NahxU2a8HRjN/6k3WByFBJMHsBhB/R1rMbNrau+bpJ4Rf72Jl3uZV8++u+bp4n5HrOkN
         TsM8inZeN5VTpyBShdFkyWoVMgSbhJx2WVuQ0lJlbSfbpT6sgeQZKuudIs8eL9qm0oLA
         QNbFfC7wJToeRViSvhOCW2xWOOK8ZSxfUeGw5WBxQxdGSVDASNfAlfSHQ48AALCHLtif
         oZUAbCfYOzQ6FznZlMiFLKAfJEDtqVckrJoxSRxID1yTOeopgvye5w8oqX1z6cuSWIM1
         tLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305542; x=1774910342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=YZ/8GFx+In/RQ0rurvl4je5qfyXNAsB8fwS16ybjWDcx000pEhIGzRoeXRpUas83J/
         XZrhrEmpkl/dT3MD3PgjeyPFljd25V2M3oE+kEb54yBpVGqAZmseo/Dq3qr9CBAXyd53
         eI6UR5R62peTdoaOzCwk5So6gYebkg9QT+PMaN71sA8qjBSgIfGvAeTkQhJPwV7VHDLo
         HwaZ31DevStE5tdCb/6pCJSnAjmgIKJvVxADXX0B0SImd2UcFceDAPvjZGlGHaRP6SlN
         2steLg7BhVc0tSnupoxWENT1ak6oOQADrnG+VqjjPXZiVyUtxHQ+ZUo/mGqY6d5SpBi4
         kCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC7uKPDEqBMYF/4d17pPtXmaP2YK47PfFtVt8Wsg8HC3oNHMhCfrkPBYWbZuLYbupqIFW6sXJQIZMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiyCpWMfbhVcP1H6uFglEnB8RhML6iiQt4pzBGKCD8sIu1I4EQ
	omMbIShRjaP8oMmYL6ykKJqyPFULxaDXhvDpdLqHKZIZsFKEmoXyP3BgfyKuhnSQ2zyMDXY4zyX
	UG47F0Tz4mvZ0G2ZWn0A2+hlpcqyMZednXe+sZQnBWGZHUeb1f/6wPXUTY4KT/SEL
X-Gm-Gg: ATEYQzwzUmAqfLumEBWcHj6XsG7hyv2bsn+ax3ojKpKtlTxL1TkfiYoBMv1XWLBPCUd
	dKkRGy0W551rJoqvuUntsRN/MJb6VGG9+joYRsJ4JnA+wu8E/g5TNj4IL3Vw7uLw/pNqXuZJW1V
	wiyuZqi2Ffk0nC+WPz0o2rISacVDwk9b1ruvU5qdInABeGBcFItBSvIWqSDLGlg2qQkB53Ow9n0
	JMHp2FCKx0aSbSCRxw+4Rf3rNo7AsK2yuABbOoB9Y8RkGGj+rVQ2593+59jp/WGDUfNxfRPp5mh
	reMHxZ0RmChNQICbs6is1TuLgHAC0Yqh7go1QvtZYKLk9z0GswVURbozQNRwtUjJ2lWRcbcqDhV
	jwHA14d5pkD1u3drCC0o1w/Qztn1VOWoODHt+2ll7yrERp6aU4u7ym1M=
X-Received: by 2002:a05:622a:5d0b:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50b373a041dmr159958981cf.8.1774305542226;
        Mon, 23 Mar 2026 15:39:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5d0b:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50b373a041dmr159958711cf.8.1774305541822;
        Mon, 23 Mar 2026 15:39:01 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 23 Mar 2026 22:38:36 +0000
Message-ID: <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1c107 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX0hgWTKNYKs28
 1ywMdR2NszRD9azUfd3GjCp7+FTxJDuSjpK6nQuueWLsA+Nqo9lRH4GZiPuQA+uItGnyNM+tf81
 BUZlGa4fMksQ6HEdhboBYFgakesPUeO+W/XTmJRolIeilL6LTpRsO5CAHKpY+b+r7JPMXku+80e
 XNq/WYP+JrPSN4aGWziXKyWZoFW1sgpezUYdhKDd9JlFNOHoogN8A5TXsHIYWq29Xc0m6v+HyYb
 Q+aJI5CXPm/+Ssy1G/TmRXB/E30RTWEz1NXCYjpleyYaxg0Srrfxk3KQwrJw4wAOWq4v/xC2uuo
 VBlxaXrnbLGr+mJLNOc34aBbYBNvKSK9aRyU59rkVaTnzNCZff6m63XjWu3ihfAXlpb3FMf6Rih
 Fmn3n3Y9iX4UF28rx0cfYtq+G8M6Jf1xtOObpLukRa5LnXKQCjhZlbwfjxyvabiYIo4PM95NwMX
 gXGdBkOwn4CVfCSwNJQ==
X-Proofpoint-GUID: zwgya9-ejqq7GWX693nKbYUg-0Qgh49O
X-Proofpoint-ORIG-GUID: zwgya9-ejqq7GWX693nKbYUg-0Qgh49O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 5be37eeea329..ba64117b8cfe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

