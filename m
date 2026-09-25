Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAE4E3ECF
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352692; cv=none; b=jTfqdfLmXjA8tQMDd3pISnhnzdcZcuic+8Vi0VbD9NggH7B/k6d5B1qfhH4PtLhYWnjO8mkPOvFY6+HCY6oQCjjZpfpJzR1xUEfoGGEWt/swmzuncjiSxLU2LBJA7i9JaS/Kag27EhVL9c/lSn7aUB9HZ6jz2/Cmnxm8eYhHUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352692; c=relaxed/simple;
	bh=vIuGzcPxYqsrld5mxnneS/mXIaCfzKAeSHaYj+kN7kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umsGLuA7b4QxmFivhO5IFEuY12EBozirWS9TfNjjk/nsFa0zTOQhCeAHrww9TSbH9tWCV1IniAUkkw6GVxhqgSH5O+5mVXd0AwFC+jZM8EHn+OG41mp4C9ECbbY3g9HV9Y62XRpt6aTJylyWSFhgmfmsZWwSNCIdy7PXTHICdAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxN0L1o8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO+O1mPl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxN0L1o8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WO+O1mPl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0gwq2515750
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FbzqaEHjIBY
	8a5b/q3fmIL0Bv1LTDjqq1PsL36oFHbs=; b=pxN0L1o8UHVNPU1sVjDUVMhN5b/
	zonxjoIMOWUj4qTvQ3snNsceYhjDBYJA8agKj5HA4WPBtKb3RaKjcS8fyn/mPcgp
	dfhRpjk7crg/tzBj3ZVNFbYDyqh1HuX8ZJsMocFAlRZHFaIdFRSS/nWDhq1pDi0S
	eXQMMnRQ6JF/1sKkKOD0xG5uO1nLsC+kN3X8l0AEaJRtEuowORCSc+ElP4/vjO++
	OYSifTLPwErA/mQPye4DdL13FEWxAouwou7t2k3QufhWOSFPavOjjSVHRpv7DN7c
	8uVmP6JxrlBkakDgfeSsbAgWE37YDlsjQ1cdzxBtVtsyHLCvC4xzaF2Xi/Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b84g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-791463ed29dso866643137.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352689; x=1790957489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbzqaEHjIBY8a5b/q3fmIL0Bv1LTDjqq1PsL36oFHbs=;
        b=WO+O1mPllq+HDgxfUOSbpx8jHmYorIdiLyuJbeV/oY5SZ+A7MOkbLIsbYy33yre5xd
         BG+dgWftAhoAwG8yKIEOifTkOkzPKUvIpQOJylSxGGTMN2T01FJ/7tVCeqP3H2VIHwa7
         BNrQj9om2aYE+8KHTMgJBsyy2Yjw4jsSE0Yfhs6M3hYKX+nP3UXuPnZT41Jf/YzAzqJi
         XcFUgmJmm/mVpf1zGO6sweWjmf8P3TvJ2BQ/ZAnaQwwGd3iSYQbBZzoCxUfKV05xyBJV
         UqxR38nxINc1lfKpFkWzgRZ6l8ECIUPgEKQKo88kyVx/phyLPMwg5m1bENkdu4WjaV6/
         TlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352689; x=1790957489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbzqaEHjIBY8a5b/q3fmIL0Bv1LTDjqq1PsL36oFHbs=;
        b=Y6R1FzepWRqZZQcUSr2dRL1IUpsZOW9FA5bfFBjQGZsoZYUv9j6diYn0OqLlhNFgjN
         N4mdRdPaRDXBnJA/hQBdqdvUsfHFKl3HjJEHvqxt2V0IKrPvttSKkgaFUZkAq4hiSbgA
         klyMs4GGbrDJ+4x3OeexbFFppmPaCO6KuYxT86Jt7UYjWcUsAJvunfqRHYT9PQhdIzuS
         zZUjQFr/yhLmD/mVjeZJ42wj8Xu6s4UJ4Aer6+0BcMhPVo2Qusm5+/cNFdAIx77QOzU4
         v+xcZ/QO8dlWIMEi/OefkbCRbOTc07UTZPlpblhWP/6TO+EeEh1X3G/dOJfMr3GZWVto
         3m6Q==
X-Forwarded-Encrypted: i=1; AKwUvByd2ePmvxbAqLaeWHUYV3/seMiP+ohFvw2uYwiOFd1dEpTxk3ISKTZmSDFPwJI3eL1pa+1cwOuhhoK4@vger.kernel.org
X-Gm-Message-State: AFuF++lDkMVf1gCt7jynidjffOl3+2znpmdfZenfXjEofVGS6otnNkAR
	Aq51k5Ux9kLwMfdy/bslrY1rhwIIooa5qVwaoKTCOYetWy6xoLbR21uY3qo9y+fCqwMpeJi1Hdg
	AmkX6ghglryQNYzOspFHbl1N0054yPBLLysPHrVfucxtpcQAmmTXFAIVkDEw0DgZI
X-Gm-Gg: AYBFou1QU3NNDBqkjL1l/dL4e+B0I2XDkQdUN5J3vmkpZKVOA2B/iSviCLWUkbAF0bU
	mPjbNo6M+OnhS+65QaCyv1kk/JIvBRGQhFAWqmRntZBGLFjzA4XQknGmRVwQnDIX/7TN3FFB85d
	KRar6V+dZWLEaVmXX9iu3qi6DTBx6VFk8jv5i+LZM3bmLuVsYS/HgIa11nWWjqpklEVJFXFwMQE
	3ettaD+5mXfh45a21jmGFFGDXXjmf2Ky2NCUZxqn9RT20+uUoT06ktD1P+ORBtiIekYLuKXNhtC
	7kr0zwAICAt7dtBzJzEbwY3ltB03dBHMkuxiuSmzCA03TVDsst0mN3MgRU2+oeY2owEOOoetgTR
	vQe2Att2OLmJZ
X-Received: by 2002:a05:6102:4b0f:b0:79f:3bbd:aa3f with SMTP id ada2fe7eead31-7af1b96bb76mr3336805137.6.1790352688754;
        Fri, 25 Sep 2026 09:11:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4b0f:b0:79f:3bbd:aa3f with SMTP id ada2fe7eead31-7af1b96bb76mr3336786137.6.1790352688301;
        Fri, 25 Sep 2026 09:11:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 5/7] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Fri, 25 Sep 2026 17:10:46 +0100
Message-ID: <20260925161049.758913-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P17OWZ-pgxqSDvolMX4xz9z59DH-0KO3
X-Proofpoint-ORIG-GUID: P17OWZ-pgxqSDvolMX4xz9z59DH-0KO3
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69d31 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TGH9F-UXikuL71NMKIsA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX0xmlSvZ9LAj/
 NanKz1AhZMEyEpY9QCW32SXYHM7dbPApoNdDDbM4WlmqdXobhhsIWWCIvAmtrEu1VMN2/PSMPt/
 TLqpAe8HrfS2UcZRraSOVsV2bRtmZivASk0TvIbXL8yAgSU7UjAvAhKufbuRjpR7BOKCZsm51S9
 e+CKM9s0QYZ2bDF6KL/KKF762fs2c0geiNngMbtPbM2sc+fn9WMgezWIALzYL7Yg/vRm7Xv9lZP
 9dbJVVbpNaKEBlSUOkDbcGPST0Q0Gfg0EK8fcD08mx8mzpATPgNWK5Je+2BMKuZJJFO+8rEVK/f
 a0U+Pp2R6VLhMdAgfu6OfRXonP60ufJggR7n3vyRG+Q5kQ+0W5lovWfBWNV5TBy653ERLbuVYsa
 CRrxV8BniIe202EYgyiydVBQNCKeT+o84zdPIdbXtgTlS8NT3K5o2Pc1s9XjDRdjaxIId+F7KZ0
 xMiazBkcJwXpx2LmDpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX/Oznvuf44aGR
 9qtWuOoLE0BQDiaYltspg0tyle6VodMqUuOG69hdzFyZ1HOIz7vcda/YeYfSjNXVjxHFFI7vbvY
 8GW0lVEV0YgSTCZHCz9MgZqJXTySxqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index.  ASoC's default of_xlate_dai_name treats the
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
index c49afa2e626d..c716e28e5ddc 100644
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

