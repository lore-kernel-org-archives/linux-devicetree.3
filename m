Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E44F7CD9
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737582; cv=none; b=CAj9ELQNIsKh5+zJ5101swUwKt/Jj1gqOs7Bf72isMzntZxcPKD/tdNLv/Bi9MovRAbiCLse5TrY7IDLpDmTjUiSnDX/7D5MwV50RoTjf58504vnSETgwKChZwuYWjTrngH/u8ctt3oeH9lOfDZeq3fCwj7e929ccq9CMAfZCGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737582; c=relaxed/simple;
	bh=3JoZslnkrMsaU3dbbMDWnwmTMC8zQq0qdN+qFoCdvA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHgxxmDzL8vncWybttomJWEoTOhn5KHCNLVA2pZR7zETD2wmjGE0p2Mj2EZ+91ywozqb93ukZG3QlyCew5zlKMMDSaJjrSsdJEcTEmWlSpnwCA9zEz5b3DytRjbtRDcSVpk/wdZRLi/gDJkftXPIWCguCLOPwQo+PS3jO+qpP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfZEpdQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDLQStil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfZEpdQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDLQStil"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuHJY4177490
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fN1FhCnQZY6
	7jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=; b=ZfZEpdQqJikAZ6BqmlDvdUPdZul
	MgfFTTjKzfv3F5S4cQ89zFtyNK7+kXjI9UXwX8MeHXk08vEweXaaEM5L2YvfRjEr
	Q35joJOQuO46MQ7E3rsE7fQ65tc1HZUpsoO3KMgyyYYPf0SbC5hFs8MO+gKLCpyu
	6cvMMlHJu/kwU4t1eBKzaXan+14NLl5vaXUaiEUNwZCt5KDMBwg9DldK/5SGpQMg
	XRRYUi5gmdEGW0I95gP7zDdzAvpPvJIpvaasxsdrRfdbrWBIkN2IvenexRBPkBMF
	mU4wwccoUS1Vvx5UqXNIpv15tU9jmRsnA4QbaX+P5LsNK9Ndm09U1XtqF/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5majq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so141559085a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737579; x=1790342379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=KDLQStilkHTYuu/6+0m5Gi8ULUInDlMMtWAtw8bXubCAj2rdQQ6ii2F5o+C+BJbrsi
         6GeY1mwEv6g92VTeZlZ07M8vPImO7Q6B4HMe53Tzh59SuT3Z1BZhHU3H93KYl3gQh3xT
         QU/M8jl3rfv8ov/AC5aHwNMXMbdoAVyqsAenXsSpSFqjqo1KmSIAvaAupkBL3m0yfrK6
         /NZSbkydQ+mubouh/Ww1vQ1MaujdHKBbkF1G7ySlzJDVZ3o8LrkwMFRX44QASAQUJ03n
         /uYLehA9Gj/WseS72uuZHWS8JLDpjifhZ0QEoxAH+cbQHuv9ISW2BbWnxcOWC1MyC1Nj
         ddKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737579; x=1790342379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=xF0BMgnmh48xAIi+chO0YmiFRNSw3OL9KLAx6ZpipJl3C07iL/QMzFjuhPHUwIdhJB
         HWRV4dW4GkL6inOoYPajPj3AJK+6iCnSyoMucCThOB158ckSYL/PqpkW2bnz5WuFz+nM
         GqN6vixrIUOjXtYYcoB9oIw/n7jHRoDtW6tptIdjy/35F/FQtWeGwDDpa7OxTFu4P6Kv
         UQsKXxhZxMYmUlI4bK/TJuhaeWkWtjTopkWPHomjU32DrGwT6Rd8+BQjfA/Nf8gIblJQ
         2oU/CTKMHS71N3CxFKJao093YSPun2ikx4QPeg5tioyV11GVfihffumoe1te31RyfceE
         0COg==
X-Forwarded-Encrypted: i=1; AKwUvBwpqpEzvUqWoMVGLM60cW2RgOTYKJ+I5rc95qrBldQTGUvXYJ9MFhwWtatoBLZ5MFgov1ihHxmoHBzU@vger.kernel.org
X-Gm-Message-State: AFuF++kNK8YhKLq4sWU9EzDDltoDb1woaH3PihIKkYr5gc3gpnsh3yFl
	CW7uYPISsPixDg/a+VAKmiBGuaC0nE2D6pdhjCPPsSeuzk/OTV9Jsl15V5a02hAPIPUOTqVyQd3
	XeTsYnZvr8fEJJqitqCCeJp02iLVsMkrxtzxoossaKeh+i2aq4G7GZW2upYUHf16P
X-Gm-Gg: AYBFou11kMhHRQRVhWyl1GlCYEKxa3qYOpYN867/UoSWfnk+vnh3bKVVq+mWM9cUiyl
	6/OmP29LcnXVZ5YlUjWusHfFKcR8CIK5v251ACAH01emsy0mfV3Ur2nFzQ3jY/R+UT30cqsKxBl
	Ak7nukMVIR6GE/MzWJ5d/UNce/iuVXss7F3yshVaikk1e/SEifEVVUl/Newaufbvu5S5WeeSZc0
	wQwo2PKnYHTdQEH4Xf+kMQYKQEnw5Uf25h6fd/QXrGn0Oa4xp+RU3eT1zw4Q9wU348QbMQZPqHh
	ZMhCvDmUUjvHmCH446Hhc2Xud3Lz7zIjCFAA5MJvWdnZRQt0jHuxrVC2pLIGZyjQ73WCsvFFqJa
	M0e6yMPbYDN1pgA==
X-Received: by 2002:a05:620a:439e:b0:93b:d7b3:3bdc with SMTP id af79cd13be357-93bdca3e1damr311782385a.85.1789737578708;
        Fri, 18 Sep 2026 06:19:38 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93b:d7b3:3bdc with SMTP id af79cd13be357-93bdca3e1damr311776085a.85.1789737578062;
        Fri, 18 Sep 2026 06:19:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 5/8] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Fri, 18 Sep 2026 14:19:10 +0100
Message-ID: <20260918131914.681588-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX7X/IyiI9OYuZ
 7tvTXefsh/dI/XnaTf+Kp3OZewu6fXPMzx++eZkIMXet1mcbebxVmyZvmvsRh+9M9k0xBPWzRC7
 qSwiEMjmXHqgKt/HtjZvpGLWWevk7+wgRC1VDHXWOuz32y2b9bIlLWIzVtAD8ibm2Jy+huhzteJ
 V/soTyWhLxEe4iFxI8Kp2rW+cVWtnGAzhLEBkl2Qfq+2AkTmk3n1zp5/yJPeTODeXlee66T0Oof
 t6JSPMWxu+Pn4nxpqDIB6xJxtLOvPwXgxI00/qwVVzNjxzEdufZeiNT7LxjRcTyJfnIOEoqowV4
 U3wPlts0E7WDjGi9+xmUwgqudsvJsXiP7PdOtCqEBgdGiC42UTKkYF0tVB71DRJJ7CdklQFOjn9
 DVAp3Sm54LZi3CiQ1g3y7peQn75yAqGZwbpbltcL/Ws9tQazPl9NJbvjiycT0F+vluezDuYx7b0
 NPjpauWi1U5ftJz2wtA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad3a6b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: P6fgHzxEE3j8qiygacTHmSk2gL5QOkrP
X-Proofpoint-GUID: P6fgHzxEE3j8qiygacTHmSk2gL5QOkrP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX67dF2vtJFTiK
 qyqO0v9Dwn1GBC6QvDZO4T3bAPtTH8odwDLgUNmvtKSUKLIk9KoHy54+hpr1zd2s6zS1RXbOsNk
 LzR+mw0HTnGUmKFCzVzazXfS9azu/2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180189

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

