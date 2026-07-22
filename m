Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EA46D093
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763763; cv=none; b=vALExAtDeATHveXhFxKy9/djzFadZQZyq20sZTGASV9Ecl3ep3WUmBabgyUGQkAJcnHloeEaVqgVn1w8wLmNcZ4U+cN1Of1MMUtkIv0Ezr74S3Tm3Le8QR0rGf1SFCDqP6WkzL5yGPpSwhV8FdiPYs3xOj1MvFVwuQyu+jAThhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763763; c=relaxed/simple;
	bh=7rkC2k0Lo1vXVJ45Hmq7MvKzcx0DEVOuMEPgR81TGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgm3eViEHyGMugMQd9A+m77TWv/3Z4nNmS141ogYig/zESoT/baj3+xXlgGHg7A9vfRtDdq3qgOh8ff0KPaYqamW4I3PICAdZl2SiOs7QC5Y4J9sadOc+xuWq7/chUOicE13lLqKRBds1OB+oIU78dG0y5Es369+bx/F3X1eRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nv59NaIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnxWE2cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nv59NaIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnxWE2cb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnxhq2176078
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S9XQeQnGmad
	nUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=; b=nv59NaIpNut9agHnKuIk6yldifR
	+lL9Nur4YY0SjpyIAUGUriwDyXoeqrDvl6n88fzCojzc1+56bb2nYNP+uiIr6M/j
	rydnktn3uUbJ08tzhDwGZpAawcztDRUy/rAvIoTWL3rJYzhl5PtTNGsoR4oIJWcA
	YDkFRwFY6BfkJ48c4yc9tyLuug842Ege7FgE/KIIykB8baq3kLsDoRL0NUL0JAXb
	s7XYjr9GxSTw3DLmdA4j3Zt56P/fsyESM90mi/R6kfqCNcq+EULGh9bpYXhFlciu
	P6xEyBrPSePHpK0/3/9+Z5PxJW1r02tGnW1wUYKzepepuAlFvZTW/IeNPQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm12f10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso387991cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763760; x=1785368560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9XQeQnGmadnUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=;
        b=MnxWE2cbKjxcCF70RGxDhQHHNpA+XDemq9DB7tbBskDQKYfc7cbCG9ul1Mtr+tLMgq
         WfCwaZNNG/BiVTx3vYRLa7gCKguVu55bs6MIISbx09MFkmd38oPRMA6ZJfmZhdVyGLjs
         LHvWLdNlySPhHkQYLXeMSgpYBNWtM5ZPcLbeZE7AlY5EboRu3PvksGxrqW+S0F2aONqX
         QQAwKYyWJE32WDfWYj9T+sFSUNXkkvNSTDA6gxVxzsEUi1GBLPDn9IH/ioIcA9t9xQxZ
         ZnYz0k4zCmNTK0Q1ctlLInrHLpwARigfS5j/UlaPDuJlOVdSMlKd9JHxFNQNKHzRnZLh
         wfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763760; x=1785368560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9XQeQnGmadnUCXQJ+wg7LPiyIzeyxrCrD18wQUy38Q=;
        b=hmRHRiix//YKv8MdXfpfjnX+Y6QPbttnil6Ksm9JHtCGUqvLZoplfimYDfA68sjqjc
         Dms2ZBfnZO6HpnT+NLt9O0tvnpgnvz0xFb9LiiFvmxCjeS9nc2QxN8IOxptx49SyPWsB
         02xa8xeErE5R57XtmEfqxTN4vsqXiVuTd7Ch189CiWNrruZFNrO6pXDQjcfYiep3Sd9m
         68lmFn8zLVfoSROEDYJDRuwekaQIs/aPkilgZMqptlc1WrEplaOHhl6rH5+E99fUGVgQ
         S9Q8c9+dBxk4UVIPLgd5wUQzf8KD3oswQdY3evggVXzH2i+uGV910L7UL/8tcUByparf
         9N2g==
X-Forwarded-Encrypted: i=1; AHgh+RqSPf9lVvxL+htg8qOm7FWANgOUYzcJzHTKWD5wJCFrk9jEY4nNsQ134R3/g+XQEqNh0T+WSs5ptSTI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FkWLR+Tpp9ibazCWBFBaacACUJ8QUMMyqFm/eV+cJGsjVq03
	Vy8dWvHRSwYM4/tYMoF+flDkpw8R8br42coo4L/r2IZd9nm5nIEGOPF33BvDJPTANPdI+oBMlEM
	D6oSSI3JGOZw5SxrtuRp4oAeKAfIuVgp0Z7ivTrXeohpMhLqJZvsrRUNyQEYqB8JT
X-Gm-Gg: AR+sD128WPcPjub6Ayy+MS7bmCXttVpXVM065U/kMUnXVPC7+7scPAbS3ULB6FbtzYO
	/TzUih0CWVzgXkvJ9+vC0Y8IZ9nbkaVnd8oP772uQR01SSWYdVKBjaF5CS3GXr3Wt6FshcsiW52
	Pfxg3/GgudauWCfX/bslPxtIRF9qNY8XT0ZS0U2e4rFL09UXirIlAx199IHQH+tFSCTXQ8iPw9D
	I68ZgJs6Ovh54SzZpotPAyZOe0btcEPXWW4VrCwz5vhJ6XCJ6p+FCcM3JAT6oHI+LoRUY6H/8JB
	w3mNvzHbz7C/LR/Xq5MO0136Geckt0rFz4rBsUl5E3E86TIM19aLRG9N+m+kBmv19QJ4PCmdpX+
	W8mXoyAKkK1ylcQ==
X-Received: by 2002:a05:622a:64d:b0:51a:8c97:938e with SMTP id d75a77b69052e-5283df680bamr6734981cf.69.1784763760210;
        Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
X-Received: by 2002:a05:622a:64d:b0:51a:8c97:938e with SMTP id d75a77b69052e-5283df680bamr6734631cf.69.1784763759798;
        Wed, 22 Jul 2026 16:42:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 6/8] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Thu, 23 Jul 2026 00:42:16 +0100
Message-ID: <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX463hKVIXxBJI
 oW65pGpZ94tXTdgkNltdz7pPL9Pws8zNQ2agDuQyYj072TWEqqlNUBcdcLzrQxBdC6kOQrs+TH3
 MwZtGtU2fJq849xfRpxpsCThF7/fex4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX+TjUnZr5arRJ
 0nRwLRAgbF7/vAwSHpwC05fvDpbAwc6SZqrGNz1DiWDTn7XTBoxrcPNRkafpSN62fGkX9oeVbWK
 1+WeIvrivTiaMD2nmHy4ueys57h/g1xdSdLPZV4YVq09I1pk6RE+33V8D2aQVKzoRbVyUl85ytm
 PbzeQogOtii06lks+KVMLByK14ZD8wZWUMW3z5r4ofg6G5/21jLJAtSIOHC+RsTixjLrn9qDlUJ
 Pxc6vbSiLBxVmDEOVX/mOpgc8+pWuM2Vmc2QTVTsAuCItl9pmB0idepdA4sCPE5aJYc8KjjmC2R
 Rr1J+fYhVGUMuakAzqkPrfvpDP0j6Ml2V+pKHM2yp2ErRU9dtgME1u5y1yrKlNX6XvSPkMT9N4T
 awykq7Yez9r1PyeCvOgVsKjuqpY/IVBno8Y9Sr6hNFpg1eZvp9Ppotsb+nOd7B86GvXTieJw2Ic
 NYGsVP9uqm4Vy6kkFQw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a615570 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_VQL4OnVw18WlseRxScA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QfI8snIg_UxO4rabrP3jGgBXSAn-3wAB
X-Proofpoint-ORIG-GUID: QfI8snIg_UxO4rabrP3jGgBXSAn-3wAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index b0fbe243d732..ed00bc1eeafa 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -436,6 +436,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -621,6 +622,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
-- 
2.53.0

