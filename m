Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41373AE1A0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858907; cv=none; b=PlD9cLkwaFaZ7fMOzH6vKqi45gJ1b4ktMx9kIFkoByC2re4jUvzf4lLI0kqd4is6gxsCv7pvIO1bz9agv89PVvpZaU/RzpJwtsyRfPFHdWOb5tRX0hR3J8YWFHkcq8lHUHwUz/wM0VHaSX4u2k5MUc+S5bUrKLyIQ96tzmRyRCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858907; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjJDAgSqeegCI9S2F9iO8SZftKBFikePbvMV//rr9UehAZFHoWHjD8cko3C5yxxC3TkRhJyUUr3mAHhpM/h71ZvcJRmOoA3SHmuzW/yX4mVjIUryuMsfX1PoVq8hHdvi13NaLajZPSFJ5+2qIRGvx+rfzPEH1OOD0opAwPwZiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm6gpN3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKQJJmQE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm6gpN3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKQJJmQE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3hsLT4088648
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=Hm6gpN3uVmzLfqZbkE992WozLU6
	KTlx3d0Ta/UswVXL2uMYfrFOxDSjGPefz9hhlPz4WmUpSxZqCr5v4Sh3ikhA47R5
	cEppGu7D75F/sE6jQ81Y/l18NdFsR2wsSVuh8iQVrkLLvQEUYSiAjjaEjV/59d1t
	nqrMhUpBQr/6Gk17tfIjYHLk+M+bGpBAM37Vq7hjc9rMaNya4pMiTZmEALRMbcVi
	/hLeBmhvlX9F/pPFQwHLjv4kXb7kZZ8ZJXyhM/kRd2NdRHzOB0w1i+9T8Z8Cszl4
	kPWK+XBAEStBTam8vDUtdkoV9ShoAOUv1/kiZNTccacI6K3sJty9HkKL7sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so52943961cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858903; x=1775463703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=ZKQJJmQEm3GAgJJHVW4ZkDp/RYowwV1iWJ7XFrMViFnBHDm0DSCBOkhisrsT56pVE+
         qnTgupqcbXbyNssBjgy65sR2wv1nHIocux+QfAlqxRKTqHWhVaykTqdGJpg8ZSTlnQpH
         RpP6SNASkjUzRWmlKrdEXfE+j3DK12EyhcttDeSMsoTlri6/e71L57C7ReagTq5w8cpl
         m8kCExOKiQM+0aC/o7gejVY/Bkf4AuzMWiGgK97kjRmBU/59+/vqRr2T6hnmriXuI8sC
         TJqH+FFPhoQL2jkY9N5nuyxsy1HvC23D9nePcSUvrM6K6DLGGCcmR0oi7sGegdDuNXbv
         xy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858903; x=1775463703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=DTage27t3/CF8JfGT3gfbwx4OqPaH4mODxb4xNlkT6O5uUgMoz4ApQybD5FCMOq4kv
         lKrqf8XKCf3c7Z+KkQYCoUdmusMfwPkzdLXNxc0pDDG5c39RfHYODJkFOiSPwzKiQkKt
         SmIJ29nXXRKX2vfv3t5xyZCswEv5OPKd1pEQ5UTn6cu2PKSWKo5zhV1RReCtocmu3eHG
         90RKMKO/jm+lRio5CHOqSy8k6jdO9+JWMPT4aPF+/rGjM8zEXXtr8sfS4Rl95DDvJLex
         RFLOi4YrxV5EWcYVDNBYPjHfBOrHeZx5cadLlGAeRiSal6xXUueWKb6NzXgu/Bpc4B2W
         CWsw==
X-Forwarded-Encrypted: i=1; AJvYcCVoyprMuEjUXCO9JutMKXrJJK4Szc/q8z48g38sGLatoUaciCC6LFdXOsL49R0dyaurcTGYg7FlqYzO@vger.kernel.org
X-Gm-Message-State: AOJu0YzZHLnYEUfhV7lQksONwQlQpopuy0yFZMdxBJArGel5WqVRIify
	8jLmHqPKKh1M47ZdwS0NnqySh0DF/O2nZFiPH6RS6G8vsq448izybnMZTiNdgdqO2DW6FI5J2Mw
	ojMQp6yXY5I3XsGtpGlcGlG+HhhqA5HMcAzmA8ifJo6rzYt5++PvCN3ljyj8HWHIH
X-Gm-Gg: ATEYQzwxPmaLFkPqs6iByGtCs96m69PiivU3dSoSaUN+uV2Et9nSKWgM32zYaoOACaQ
	S/Gcy4vIrhM4MOf94SMGd2+k8i+J4POtxf24nHP+V0eXL52sLxmUB/3sg4/LHO7SaFLOXcYEwiv
	IBsdyrM0gTP75cZmhhLJOFk/SnFN5Z8L4Zm2BN4m13aaZBMrsCO6uAHTgmuHq8Smf8OPrqxpJr9
	3DSYwly+t7E21l4nREQZUGiF1YOYCJab6jvkw2T8YFozaJU8PGGFe3r9pxHHHQxs8wrCqdWdX4K
	+zLb9reHkxBMMLqFaTFIFcDYwFwE5WDlkf2231oPElxNGG0Psxd9go9J7s5biL8IWqAgb9U5mZZ
	W2zz9iDnJ2oTrRZW60EeoBzNTA5x0McSXibWKOTT+1osIsXW4EiMmKxk=
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614521cf.29.1774858903178;
        Mon, 30 Mar 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614371cf.29.1774858902706;
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
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
Subject: [PATCH v8 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 30 Mar 2026 08:20:57 +0000
Message-ID: <20260330082105.278055-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: aWUdu9o39hR-O-37Ea_Nsg1h59XhEYcn
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3298 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: aWUdu9o39hR-O-37Ea_Nsg1h59XhEYcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXzdhX/qy5NSVn
 ITuDuW7dPTMn/rLGsCBEC7iP8CIRn5aQH1YBgWovwg5ltIT7pU3LZRK2D5azw8omOAYUseCgnaS
 5FQOQLOpQG6zJYcfFdhafgt8GYG6EB9Juh7Afh6EzMAawPaWgC02bgxuxEXkok6WHX5MeyVWpys
 Rr77NO9niKi9+0z74rGR5ZYHInNS4ATtc3hGl0sUO6RVs08fxSdVTnL0b9DieAqYNtYbmti5iTp
 fg6j89Hjuhh2qHk0t/Ddr/t+E+gVAlfkN2l0RoSJy2fZ6D+NcC6EzopDYaL04LEFiEVQSTIb2+h
 RFiEpUGpATRstKSYeq9E/uzOWAArMJoAqwMw5GlxDro06M+aQMBMEbKuYhRmUt9BTC9PErfDD4Y
 C/QKmGrfMboVDCN/PafXADKrGADwj4skiVV0DWQlLf7eHZw7eHAIl/IkPXVZYQZKwIAZVYwuRJR
 cGdAWV+cHjiBJlXPTug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065

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

