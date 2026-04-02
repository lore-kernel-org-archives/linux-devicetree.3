Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057153ACA73
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117524; cv=none; b=TTwPgAFupfpNdUPNQScraVi0d207D9gmtuKMnKyxSPLHUIaNX2o22r3viYIWKSQetjVtW4Qql1JrMhk1+TsYzbiIBDcNSa3hUk0aGcCnxqjYYbUhPJwMZjF6B2fFgxGnbue//2MAX95tJgeJPJ5Zn92C9790FCCEGjyeNvh3khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117524; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0kLpns2PS1X38Xf3o65b+bQuKSKv8RDED5i9PWK98CwFPKvKfNenEcoWrGe0jLdhQubVaJ+SYtr6uGqWbx93SBrehMwFKdFR9PT+nvWTJbCTfLKKjeRKNiIhGDE8HmJZdH1osXwyKVnrPc/x5ikdbK8+FoM6qvMrr2Tes6RvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXWoOQac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YU8B/D4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXWoOQac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YU8B/D4X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63273Abn2903314
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=WXWoOQacAwtuIXibE5A1tE6zjT5
	OKcVbFpDpTO5uvLmm3BDcO9ft9skGO/P5ah5mrGRIc43fdjpneEbgLYUcGm1F3Dv
	I9UJ5WPOw9KnnPjsJKXjmZJynZ/nKtXaxFE+e8YJZfqEsY1MHQH/hEz8js8Z3BBw
	E77B7UiA5dJWONnA+Ja2VdgJgDiqRhJGV4suKzYub9fvvQ59I9Z6nnCa4Y7YJfwx
	2cco1QI3EB7fHzhOeXTn3K3q2Qv01HvXvDoYuyg4jXxyEYefLztiYI3jjBqo6RHj
	MvsnOonh8ieWk5e4wEUXE6ZBmNqLwXhlmMKJETUNfpzG1cvAS4uvGJYwINw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbp1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso2372171cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117505; x=1775722305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=YU8B/D4X+a7RKaeY2Wwofi14yD7XArmrjjP2BCpWFZWsrbrZhVdJuw8BPmNplEm+iD
         xAH6fNVAZ3Wu3kr2M2kqRBYafLweQU/RaSX75QtFGMirqZOAZMlaTGByjzBEBDUaR8Ak
         /jos0bzPW7UES9M2ba+a+W3PmwF6Z2NssDO5MrLrRV2DOZkAWYzxXDwoWItX5yKxHsLf
         LURfDz0vqpQglW/QRuYag++HZcZDz1hNJPZn/QcWCIJJ1aZ0fMnEX1061OH018iXppX+
         mDDHvHCdN5Z4gXKwzo4A2mpd8nrxOp3wjcGMLENdg7tMZ3TDS3sJqG7NrCyEcrNN25h1
         d1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117505; x=1775722305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=ZP/BI2kgibfI/OkWqqUy9fGVTRTczLqX21QOcVbF6cC8vCzwX1RO9QlKRWjz9uI3Ye
         jGHVtvrQ+pvLn1a9hYZ7Mnlo+w0hWLpcrYdttbciwpbAGb2nxLlevNyW60t4wijfCmeD
         4tck8cmnBLEdZx7rwZF7gqy/6Se3Agxpr6KUzNze0N5fMT2+xdbnokfdX40xZfWL8+cQ
         SWAcht+LmEQo4DFXDGb8ws1KaWAFX5MKRiglNK/HjNRbgxYUiVy2Vj7vtA2cbmQxyvsc
         BNRd3mhb6SOnzZjEMwe6bfAOMTmOegbnhi5nCZ8yob6m7JLE+C9Z18H0LsRK17IMo5we
         9cVA==
X-Forwarded-Encrypted: i=1; AJvYcCXjf4mMuOQJVulSJDNBMuC+CC1MNlRBb3tKa0y2PsPs67A4n3+1IG5WhU8ZfQwGXD+PL3uo9pXcS1Zu@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvH5yqYS0/Ntf7uoVuzHkUT1MGMQDW2/E4lXEhweG5BZEOHMK
	L+ofj6MX8YqE/s22sHjiLnuoHJVv40WcPRhrn1CyuyaVA4KGb8RjBOPId3wuKQKNiKvF7GQbutu
	J19U89FnUR7AZCP54ozs5MUi8E5iIgt6i5zvynzWtQlfMlxMMwGo9dZmPs9dA80Ar
X-Gm-Gg: ATEYQzzYcukA1CV0/VZiR3K4TcM72DYbOFlYa570yL16InFxgVsBdroHbL9JLGcPkpr
	cblUAyERy3+FIv/UCwql+NmYDeANwMS082/qhFbJOSASOlXgJ+uwywbiGsRlaGYJXUhILxJPd5R
	IWEj8ZvoRg3Jm3QQBIW69rUCCAFsSuMmmscB5f99hVd9fdK0a1t+jbbzd/mlqEQzuI2XDjb+fdv
	C4uMMh3DW37Kd7v6aEmA9UMVtDIqQbNEVoawqZlOOqyXxpFDZFUMvFs6fJpNp+IakonEOmWvKat
	nIgkINFb4LI0KF9yyyv1FRyElb8vZ8L8kJzOt8aYPMf+4Bek6ROrB22svRd5qvCKQV+k8lBtNTJ
	jXHvIPRg4WdiADmdjxaC4hzbbIlWHMsjLAHWAWNypGpCZaA6jQwHftWo=
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr14829901cf.7.1775117505054;
        Thu, 02 Apr 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr14829551cf.7.1775117504668;
        Thu, 02 Apr 2026 01:11:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
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
Subject: [PATCH v9 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Thu,  2 Apr 2026 08:11:16 +0000
Message-ID: <20260402081118.348071-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1crIg4A0BREwS5MxuJnQ9bePKlOmC4HR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX/uI0+llVHD0o
 /BH3OVVJ/aa8ydsAiw4WRMkBhRCSMyKsuhkX5SBojh6697i4/+C6W9bfob1nQHPT4YWIMjU/WfP
 d9rVymgxt03We8Su+1FyNkORMiMp5IecYumLHIojSUO/WxxoQ8CGR++xQPOalruZYViBFAJNpdR
 xifQSaJyah+xOYocLgIUdIyr/xERhYlZ/COERZd8zPeQ69Ry5WoXS5xWUAbcO0hLyTh42HVvTCy
 x8xkoL4Q1JvWejSvkb4Zr1pLyHonnE3cNWlAyTcYQDGCITOzf0QtN5F9luxlnmn0Cy3vo2z+auE
 shHx398y32oXO+nplCbWo3HHWGYI9+tbQdsXij/rGN+FXGX+o4FRObptw1D0nM9uW/p7IHcjRqg
 gZYbf2IlYklt36oAMX9YMSIQSAl75tvTqjab99+/do7HKelbw2ZXnHzJY8I37jeDxypNxQVTgxB
 tGr1U0ujQ1Z02HNDcVw==
X-Proofpoint-ORIG-GUID: 1crIg4A0BREwS5MxuJnQ9bePKlOmC4HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 87f6db12003e..e904066484d5 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,31 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!dai_data->is_port_started[dai->id]) {
+			ret = q6apm_graph_start(dai_data->graph[dai->id]);
+			if (ret < 0)
+				dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
+			else
+				dai_data->is_port_started[dai->id] = true;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -171,10 +196,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +224,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
 		goto err;
 	}
-
-	rc = q6apm_graph_start(dai_data->graph[dai->id]);
-	if (rc < 0) {
-		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
-		goto err;
-	}
-	dai_data->is_port_started[dai->id] = true;
-
 	return 0;
 err:
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -254,6 +267,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +277,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +286,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3

