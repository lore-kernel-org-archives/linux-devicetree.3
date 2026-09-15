Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B454BA1E1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491457; cv=none; b=od0vUpdSO02EuXNeade1UEuL0Qi986oBPdZ9Vhz5y2/A4HfLzLnAOyV8ivD1HLoqzGL8cruySpMa8Z/8jz6ta/2vSCrffznJVudriwACmf5WBVAv+JDcRifS5Pd2HJp3nrwXialPRCYHCLOj8T2pb/2jN/nCa6NB/T+zo2NGdfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491457; c=relaxed/simple;
	bh=3JoZslnkrMsaU3dbbMDWnwmTMC8zQq0qdN+qFoCdvA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0U/bRX6H4g2eUVJ3KhkKas5C6LqKqhegyzwL8DCmfjaiyif7sHQuIZnJn7bATxz+3rTm00eS9qjGFCzd0rVP+zDYljwdaHa/1L3Ywlc790C1wSODK3KU9uMVo7vJj/uwdCRsMiihyuvnVXgsI2uLDp473LVYCZF+iRFmNGrEAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsL1mDSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSCqDkca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsL1mDSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSCqDkca"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAePD2836578
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fN1FhCnQZY6
	7jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=; b=OsL1mDSjgBPzJZYXh04KiJq8jq0
	NY5vFWNH5KAJiAhaQifGCJ9uFu2aKlWT9QuZfM36taAYBMR2LioCszAmGH1/qYuz
	hDoJwBvfQqAdhz/NBGo4EtE/FwXyzp7SNO9UCzyyXW+ih7JV31LwKw7YsgeUdC3x
	l81nMT7xjH5QeS4U6rfGbtU6S80IlAbDiLohTvZfDwDMjBGLcWHBkp3NgFejSCLw
	4VQbEAVE72OF5khGrt2/xHvOu6cVfqY+AxbM47lNpy3AoDul6eDnn6Jm4MOBrO7Z
	BNeuJmigzksxfHPLq5RVYs8VFyfhK1cMYYDPvo2s8BDnfOVGh+b/d/fVLig==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb4a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso4174186137.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491440; x=1790096240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=DSCqDkca5giWlQXbanOaARaFmbbKWgjA7bKneDkKGXN/ZguLPViBTYnnGin3CrYXW2
         /H+hPaLZlrPQXL+08XhvveXTajPJsDQo5/0hZ29GEpg67yB0Scb0FVql3RUhwDeLqY0V
         1r2tMzH/Qv1VeItSGrPkYiYhLan/iHcymKqrMmZhS6wMFNu9/ISf1daBXYj6l0oqiQsG
         FfHY816rF/iAovwL3Lz/Q/UoMcuADGFU05ZovwYX+4TkdqsAqpisTz9RTKFtQUEcJZ4O
         tf2tJM5yYav3+RDD7uHcD04yBt1BbLzLseVw+MoCUAQ9W1koo3e8885+LZ5VQxRDJdcn
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491440; x=1790096240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=WdGqcRfVVl9b/0/Sx/qacda4kwIs+YEZFTSJ35JMnE5LZcxp5EA1vEN8KXzdkQawEL
         WHGFneINlmm45NAqB2N7O6TCgtO/wLcxDCYAdmVIEOw+Mf1In/edAaIsRWjN4TONBpRl
         YmdVAe4bEQjBH9HsjyreN5kUZfeyR++E4pIpK9ksaJGaqp4Fx6UWUhl/PJZX2m4gtIyi
         jkTEkqievQ2NzI9xTIQoBgmoP0VYZx3p2Uf6T9cHRlvFKCq/BASWCSOPLwsjXH9AKd4l
         7T0iLT3g7zdk9sOmAPe+Czkcejh3vWsAI0h5c0Hbs0sNegknrPwjkgEDY51ZaE2gYV6a
         Ydlw==
X-Forwarded-Encrypted: i=1; AKwUvBx89Jl9nSDE8c1g7XJyQ+Tf4zKRIVml5MYvQTrSKmTLy0jfLBfJvtvlJpMfQ3geK56C8/lUZikxzDqq@vger.kernel.org
X-Gm-Message-State: AFuF++n4MycJ0tBuVZf0e0DKRtPZTugZ4sB0/gHkifmDgnr9soTX7a5O
	sN+UOfvxK9ibrDhMF95/7fL8TNd+1hyVUt5cIbmp55OQCTP0ysulfI+BNpOXFyZKKEle8No1AYB
	33PyP8xc2sDSdyMgKbSIIohJIPwpdrvp1K8uGz2h8Azj/JiKDZxQVER0VBlApFJSI
X-Gm-Gg: AYBFou12pxjFFZfgF9btyBPcy3q/kA5ahLKxGxRfHoJZo2N06ilUJBkmq5gRkNXZlZ6
	EAqTDIQ2fnpEanzeovf/GpjvykCO5W+WrIwLTItgJw3iVwBYhvCaNTniCHsSi+7G9/z91ImHExy
	vTsZUaj0sEaVEZfpuPoSkIMPlv/C+y1nEJ+Bs+NjYYS9ZDX2VLGOYkCyAOpOttxvfg1CP4d07bT
	J8LON67aNKaacA29ern0Od1myYI8Da6J33NH/lHdw9Ndq1jyqsgDnNqOm6cnKe8xtAgc8lL6YHw
	baGzZW1sjuaeVOBLJPvm8BZBya1m3/UtfY7kR6vjsqo75svi5ksiwNCUvX6mAiA9f88LBK/xIHM
	3NF8Qa5ePvqH44g==
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876349137.5.1789491440431;
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876292137.5.1789491439960;
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/8] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Tue, 15 Sep 2026 17:56:47 +0100
Message-ID: <20260915165652.914893-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX14tpLH+kp7dC
 2s0DfY01fgdQSBwEWqyXLm25vu1yvDClYzQ199pQ7WrHppxhmSwBNTD3mCehgOLUNzHLnNpcMx5
 0I0d7hZd8KfijN3P0P5tmVr15Vw+Fn0=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa978f1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: iS_Am0TRxcRghR9lORaTZicIh3JGmkaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX0CnxIId8tUuQ
 mZclcKqWIDExqhq8+pQBK9dg2URwOf2O77/SLEAGprrOPK15hc1CBpr+54u90PxKWg85CYP1Hjj
 e8Xx8KW7Dybbknfzfr94ScMRe+G3pfMKQSYsTaPxGrQ2zyGRIIKeRXBvSiQBNNsOpSK87D3omoP
 xBtH6V/Ww1v0zN7hGmmI5qJxtN3o/sP/wQ7Et2QTAucqjIkiY0kw4+Gp+yKlgkD5TCsrXD3QcL2
 XvhjJk7YgDtWHvCUy9u1+u59Gtwno8SZ7BNBh9RSADJK8Vx9LudDqYhdfoBzw0bxDTaBCPTEqg4
 Kn8xdRS6UORBp4djAZ0G8z0BTl6JlW4/DG5zrrK/2H6le+yxG1F4aMueX2OGAPXi1LWaORWTdqk
 J+u34m6rVZm2K1gDZnnQUVe7nb4CawpoDvo0rpXRwmUZcCi46S75WLvRp+D1nrBmzS+q6pLE2ow
 yB2E/PlGZDzra89uH8g==
X-Proofpoint-GUID: iS_Am0TRxcRghR9lORaTZicIh3JGmkaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150247

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index. ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index d83be8474e7b..328c667edfd9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

