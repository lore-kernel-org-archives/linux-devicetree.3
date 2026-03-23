Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EB383C9D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305548; cv=none; b=Yyi4nAmvOMWAJi8pFLUGNV4c1tfvLteBfOazTYQrLWMxdDTlniG+AWVbZHIiBhYaaahk6obxbAyHDHzOquJkRXzwk4++7TBJPTH/lgxLkaRcu5l1TXIKf3yrc4lDiLKowFff0G3oVQtVWzfaEP5T3fI+hIDeA7nn5O02DljWLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305548; c=relaxed/simple;
	bh=uSbPbbEF96iO4/jDf1d3kH2TPon+s7DHfw5HFTuRwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erw7Z9mic0CPALDs0N0s7qZDBwa5eMIek8yglNK23gKMluEawECF7WRJheuHA0Y/cTNuD2dLPz+u4d+ljZ0qhY0jZLqVZHB1ssHKNTzpA3ozyZq3oj+KPsymMDFMsLXZbhfn+Tovt6B4VTYRiPXd94Sc/WCiCyfkjAOXpzH3wAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFPfg4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEcDTOH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFPfg4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEcDTOH0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcKr2831909
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/jKQw8dGxLC
	6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=; b=UXFPfg4Pc+yf2grujnyk+iEix6P
	EGl0Ezy9IKDWfnTcxfEvfXpvaAJFq3lHhyjbh1jzAZQGY3JYxrksAaCIj7p/pgZE
	hfMNe1sd+/7jkyqC58m32NZMcXODN0demDCsiK8ZELr/k1er/+R+WMIZhN+/GTte
	FcUfTV/TEqls7IDe5JLBacuUYH1InGq1t1lqX2JVbM/EUafhNTnQs1+7ZZ2INz1J
	w7cSpJLpbyq7wl4cbGBt4x1FaZZ1mB+iEHMkiaXvt0fuBG1oBTX1IcLpHR3/pBZh
	9Y9Qbstm4o0EtvMhrI33AwKNTU3OAv6Ir0mqyBfdf3+zNI5gxdF1/hZ7mQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsvg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso55802951cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305544; x=1774910344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=BEcDTOH0KlM6asJ6wnjVNKvGXIuXK3CTdxPmHy+FQO7Qf+LoayBeqMpW2xMwoB4AZj
         E3dmeSUelNXffw+oTXQAx28xlIoaanZ1k3w7LICnb2tEz43DNQspMDqR3g/5Hi7mpMkC
         1C810/nO+dCc9x+q/aydtWdIBOsvn/hFKPnlgf3aq0uJ7mEFWfOv2D5OBRm9a4AX2QZP
         BhYJPboIZliifUk0bnC5WV/nOnMu9AOkdsvDYe+FCqsA08ObqPQj7tU5NRZQvjJ3QDfo
         jAOjfXeTFfvKzbyTw4kgwto1vpn/xkEO4cNptVgE+kxy8K/zhhuIuw7dno8RyaHtA8J/
         0T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305544; x=1774910344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=oIM9r5KJN5JBS6+8uOMlnLX+GkJVquh4cJlxVydHDkSfSMydgJfhwsRvA7z0WZntuE
         jkmuC14xZLj2Z8ysmldl1Ku2mV1Z09O/ZzzI/eWGvy4upKrbL8YBvQs3+LHNIEpxLRkH
         KqKrarU7tL/WS+w4sTLzkekJ2X84FvoVAPro4C3MSPkHBIasfWfsrNMLXG2/XjSmw42t
         CGnhNXH8cy+SdMgMsjE0rtKsMP19UcltWhx6QnKuydZR0H/INxtb75YHcxy8d+lf6ehU
         IWvMUV6N2mReag3slNHCKFf5ILvH9GplPRKeMTi3zmnFGq3j8rw3b4X6tfXcE8yP9fUm
         hTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3J0IfiuwzSASH4xZ4VwWgphtrR9F6ikJdtq6NcZtErOf1Nl+FLygP2dbSHdfpGXiM+yQweEISvMME@vger.kernel.org
X-Gm-Message-State: AOJu0YyEo+K8VLmr7EYdLzp6WBMfeBJq674FoiaySiDGOf2HRAyub9ly
	IrFcQa5/7OvIMOX93YNKD5g6KWjLtROmaJcvbaW7mRWSUK5BXo2Q6ibwxjaUbzJmxdZGxA5HXrk
	92Ioyft7sqvTwUj+j31j0qeOorXKm9DU1LR7wzy7wx9DgDLMlyyRd+t87IFDzxMcm
X-Gm-Gg: ATEYQzwD21WV976FQnG6n6zL1qRiOk1v4zb8rGt5qvPfG7BfgUsRLW4hztLaGJ6bhH4
	mU7VcQkDJz8xtnmaeRq4Z6zRe9quiuAWaSs+quC9PyYQ/c18z5NL4+soPcrkJcD1ZSDiQvTgOfi
	GT7H1AwGHlN0vgy/nz4KyGvJwk/TJ/IRdQ7Z/qfJYmFMWfjzzzDnFzZJo4ZrKD2QzR70YC7efhe
	10kQJZbFYBQDJI10DV4/7CAA9I/fH98qYh5guKh/60aUGg5M0r+RvMSs5IPWVebg2Hgx8IRct+4
	7s6/Ho0t9oGRUf0R+iasD5lELT4L4TVydsGwuPotC+5wbLIXvytcZdDYJs1MT6gJ75AMxa4eFRX
	fP2lY57mz9IXytXrNT0XUy3GMw93TTxOBvL2j27VgGP1xmLRVEFFUjgE=
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837401cf.42.1774305543698;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837011cf.42.1774305543137;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:02 -0700 (PDT)
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
Subject: [PATCH v7 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 23 Mar 2026 22:38:37 +0000
Message-ID: <20260323223845.2126142-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: yHufvfcPrHUVeE3ouDFS9-luZ8ZeOUOU
X-Proofpoint-ORIG-GUID: yHufvfcPrHUVeE3ouDFS9-luZ8ZeOUOU
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1c108 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX9VXZIJQRDFR4
 sfCedS9KdJbuR4yCQ5SWq4tGFiN1dBr6Yo0NOZWyYu2GJjYR85Z1Fvnz03OJzZV0k6XU1cPh5Iw
 w5LQ5AZgdEnXz0r/wbIWaXeFlXEM+C4GpiVrckjfTzSG94tyiNWMH6kH9vzhO5UlL8FJWCJd9Gz
 +MC0y/xBxtPBJrN6xirPebI1Uh1qvJzLOXaile8efG4MxQj2MTyuSgnbl6m1pwbYjLEze2TtEzj
 uXHVR42Zg+FKx/ZOkVHUeVThG4QbACdysMVYTBv4AAJY5VLF4ezhzefL5Rgm4M/ZYnBQJ1kEhnk
 CQvFid0HlP8n+baDYsWc/gsOsqehavCcj62KSVjSVhmwzqNqryADsbFaJINq3twFJSByPLYHtFX
 rlyj4d22D1UG87qQ89ri663K9aelI535SATpFINkShooGhzXNJaJTelqnlwNAWKKMDZwu2cO2Us
 S4d7Q6hj7jixxVZIoBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167

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
index 1fbcbbf3123d..9d4cbe29cf94 100644
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

