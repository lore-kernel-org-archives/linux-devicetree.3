Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980433A63E1
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117512; cv=none; b=cT+J1NPTOOJUYMjw4gi76zdSDM7hCRCQehWGwb9XJq2Bm9Zr362B5OwtN+qGUkXILbtl7H9MLghoGFRoOxEebQuLz4KCyV0uKwypl3pBCp5xnlOJnPh28Mvuf6R7VWm5XO2NUJNwjcgTzPy708b3vlYFOwTPp6vkXevNKCK5v/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117512; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIA1Z1qzURXMqF3glL40MKWt6bqFm175vnblryajd2V8iBC5LE1PCck94ZBl2Y4mkwgvff3bslfEn2grf6nqpo2FMOcWJgJKD3PXCrxAQPeXUXzkIrt6PTi3w+edPi27+1FWn7KaTn6XW0T69PS2Lq4yjFvm4wjQBhQbNwXccLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVOh9pWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3kuIe8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVOh9pWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3kuIe8b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QwZk1551693
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=QVOh9pWEICPGgTVQyCUf2lFQUB3
	/3lHUE8RrAhf1r49B3XSffGuoEHAWWsQ1tp7fV31ETW4u8Clx3bL3vnhauJY0P3B
	YtWDeAS3hwXMj3EmEfFVIdye/XfKu1KB4GWS6jEmz4bHfyUfy5hIhz4JW6j/2O7O
	p1pFOy3NT4JtoYhBFwFYjfHfrqtdkucq95sX1a5IaPuoYdtGh/WwtutHvD2bP+l+
	wLoE/aiWO7Q9KycepcdLkYu9w3ZZRuDzb/KsmpHXFikQ5hWIQ5JOV+CHlzvTLV29
	2EwTfnpAN2j0umYyEKwGPkgr8U4jqSsK9XP5vjfPKHWMxhKqNRvXYSQbr8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerwcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso6108421cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117496; x=1775722296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=R3kuIe8bKjjXm0vU2ggqOTTFVcPQ5cQefR1J+4rD9jfYqwyoJ9hi+X4RJC3iJuixgm
         WpW8WKrhmUuSe1m06UhwGf8Q3cydwEZo89sVzHjdF8gCcMq42k+OO+YGzpJEp9wJqYV9
         3t/0WSdXnDX0Ljfd1DQD6uLZyZiPwu9Pw8bY34TCoeTGwteH07Z21DgM2nXO2AWQFp4w
         DxIV/1vNH9ZuBq5pDtVJC5L5KZAJintNdxLh95NpPweiu9oa9E/W2CR+XtK43PIBpDdh
         uvnGqsfxBY5moTaGg56+pVoCdpTtkkyzJf9t3HC3kZUVM3Rba7CLnkeLZUtpyuILJ7WI
         adhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117496; x=1775722296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=On0W+b8LGV3T5oBuHFJpvBjPUO1NJJcOV+/sLxeoLN6pQ8tr/EfqmyeRAxQgEQHluw
         SQVNw53rN1H0QcInbz4qtbG7sx5Jbt32V+H9yPCsaIPQMu0ivZU1scBuYKXerWzpZLy3
         BeOSmFW2WeFsrwgqq1KDJorE8Mi3mdq2/5/RcnSqymbrERGZp2wsYud6NaQ9jgsC2k5Y
         40CYM+Or80iknCQ/oPZVvQXmzmeYH/XuOrtY7LohBn9Kj0i/p8hWacVRBHWCE2JZi9H4
         +jBR2osex0811DK/4gCDsAUgD0phmrExqX07MlDy8gXou4Fv8SNlAFwf+kbhF0HFsOrU
         avLw==
X-Forwarded-Encrypted: i=1; AJvYcCXnMte2Wo6skgbSMWKTw+AaeNWTHNY2/4zbcXAwlyE/jR0KNzFCbRxACFWcpQsU6LpVLtAyOWfMIPl3@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqDq3Q3DFcPPRb1ZLmP/njKZoJ46D6iUNr4M0dVClj2L3sZTy
	afHq/osQLvv3C7RDwju/a9xGPjSS6PWsNxedZDLG7J7uo8iLctHxgPANyuUiJOjWmqR9WYjDEXl
	n2Vx9r5Qz0wcNi36g0l2zmS5rBIaac9CxzxOczfqS2oJA6po+zxMpzvVabf83QNPz
X-Gm-Gg: ATEYQzz/q/5EF+tKlLn6Jh/nT/HjxTwC3Ah6AyXSPQBxqZCbeBXratKg0n9caLtfWf0
	f0R2myL+83+66KQHhunlPtd9+LJJXvzxpsV9IbE/Javyc3F0JyZoIBCaarxZ24ZzAzlSzBd4IR4
	AXfDpxq6/jAIOcFnoFwO+vh0w9M+ImGwxGQSjdzyKZ1edgJRDveOltj5Pd5lOIxvFguiswaUqPa
	3HFTU562bgwXSzFZLbn5kNu/sW8ORRwPR7ahefVsPCQ+EwRyFyHrPjRkHLPhIFwKGWcV8x7vhPh
	/rGThHA3UPcRybn4g4yqZBLpiaM7vExV26T/R/zcCYNRS41gnHituSAE/Y9GZ0h9IgTv/eA1z1+
	wCuARLFUepT792cABCwzDyMkBgOuRYdNQB6SHoD+v2ygWwihYsVuGNc0=
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90671161cf.63.1775117495856;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90670831cf.63.1775117495403;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
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
Subject: [PATCH v9 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Thu,  2 Apr 2026 08:11:10 +0000
Message-ID: <20260402081118.348071-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: dNb64OhOaEcag27HStZzoOZ94EM6fY2c
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce24b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dNb64OhOaEcag27HStZzoOZ94EM6fY2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX2fTzFVcaF5rv
 ETRLtyWrUFOVQ0u+yzpxAeHnEm+IQc2rWgZookXgCuGRZ4JaOBKCb19W+XcbS0V4iCUjHCqFPw3
 zdxNRnideNykrL0M24A0gGD+A/zUONAUBioKk1aixOqb2HKkTLpNP7t+9uE4ALzTT3LQes5T1fi
 8yV7RjxykHrwxuTh8wnUNmTuwxyyoewHPCB8URpUKj6ZKfp69oe13ATF5hTmGMLWlUt1/c36Snp
 BvieWgQmpomanT8aDIOo4bsm4GYZsoYX07czQgmuxc3fMSfTxBGMqZlT1b4BNKuvf6wUKP4rxd7
 MIZw5UeMBBshh3x9H2s7zGEzXuT898P8RFMzSxFMNNYEd4zi9Za/XXpziy3iUq/8Ev+tbnD30/6
 7N08MLKzZeDB+K1NYpAW9efEyuBXrVK+1xyVZJDU2aBfx+i1D36bPQ0DfTVhT7jbCw55+uhT7oI
 VvhNzlWk05YbnwIEWeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2dc525c8be42..5751e80b3b92 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3

