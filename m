Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041B3ACA57
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858903; cv=none; b=eMFpGZrlJiJCGiBVFa5dlsj7DCocsFpnZB42g06PU9M7VdDmPcKr2j12NdRCNa5wao+VkAkF+QsGeFc9fI0xeps1cHlUlaLFoGQGeucIiWLQ+KER9zie/PmLzE3Id26wk4DXCnAOUVEr8sss6sDRwm7G3Y7oNGJOQCVXuI1baZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858903; c=relaxed/simple;
	bh=Y2gMg9r9rY5Id6C816eYq1RewX5CB2zXG/L5mc3pjP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikBs3NBNsbYEvbBroes7Iw8WRVazLVyZtV1QUgjRQk8wpZM+ZcT3wGmR6/+Ue5LIw3gIlhwe2TtjJ2cyvLFNRNm3Sz7vJ+DRsn6uEZEulAwLx0skQ4FY5c4EsExBw5x+uDuX3KM3+HnfajF6YdyOzNeRy597uJ5GVBcBih9QqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jzn6VMyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnIZJKFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jzn6VMyD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnIZJKFN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4BFTl581063
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7B75lNNFNuA
	Ypi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=; b=Jzn6VMyD/t72QhmbJmpDDhXFs48
	Yh5GEsd+nAQ4nhJGc6i1wIlee03pm2x7L/BlTw4SPEDFdlmAdB2T5QsmFYccbL9v
	O1Zw4jG6vCr5GAZJqkx/OLjOel1RF3ZZQNwlKY469bh6twYAP4cguBXHoD0ZOKBV
	86eoPuQd11CioifkD7zgu1MqOTXHYNNEVTFuUjd1/0YOiku3gaxu4mkHS9KtcG5c
	YKenPo5iBglxk/SRkJAmDLEb8/jhHoyTqoLIRpXDUw5T9IHGNgpvzU/PxFb+pw9C
	PD1wbskWyea6glHxsz+U31iHECwwpxaF6xPCVXgAKjhGiccnTf2RHGlkUuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cc5305180so71777966d6.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858900; x=1775463700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=NnIZJKFN2UK1MgoNG1UBIhSWAiBvBiutW3sohhdWihKdA1uEcjAufvjQhTA9j6Y95K
         1LKd4ruHNqytfQHa+4OdMyxxAD3kcR+ljUe1mI4yIfiFsC1gjSPCgaqnwEDZBKn6kjwn
         DogMssGEMjO4Rpn/KkePvOxeNmHjvzFP+/yI7CuRJQvIwsgDNY7YY5CnIYC/GDkYS63d
         JE8y+GAg3BgWSU3F44QwfYjhEBdzYv4Sxa1Vo3vsRo01G+TQYYdh6v3D3pHTiCiozQ+d
         R3PvvhzMxGoguLbsJsSYqyjp5SKZGhn2WdavGZadP/AzqDzEDy8CDV6qQfeCPTqr01IJ
         U7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858900; x=1775463700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=U3/pS8JcJPM6g6gj138rDv4J5bFClQpcPhbBDCKoD2W2RGj/cPKxiprf05M5Kzsw0b
         bUWMCk0jwHiSdKemKr3ZfXY5XB34VVUKIAfdz1vVMnllB54eujRrKn6zT9R1Z40sKJJb
         naT6D1jTkixXrz5TAHdXMl/vmrXZiKz+3PywYpgFUQKtO11kgJpjMr5WH0rvmQfvCk2k
         +gpD9A9gpUCnNjGF15QdhkpQ3+27M4k8izF5TQXtCviPBnw4gmUsM7wE0juX5oxcYeuc
         D7Xvv1mqGzGhnuPScEr4a6gbcFwPMe7pFgXTOBogebsezaZms5GY0paS3fIr1dXfMKcW
         +hzw==
X-Forwarded-Encrypted: i=1; AJvYcCXWUfWBIwKRi3aPcv1PWgrt0DJmUzZMz5L4Jj4exxfIKP6x7vJN4IcPSo3p7Dvv9zuiFrjIfwszyRRc@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ5cE0C2D+lr+/kMO/AQHvF0S0QGt+XY9IvNujYoB1RS0P6DKM
	LHkLEDyjoUqXoWxzH/LliNnwJs73Tp2vQxBxh3YeTbGloyPDOjFAF+wqKZqyKYOQuC7xUuybQyu
	pBmYaLWPrpXKi8YYD7v/JmaLairnK7lYWGJPZgyn736Bob3FRsYjfm4gwePJihRbb
X-Gm-Gg: ATEYQzzYERWoWvZrPhfMx7ygnlfRTotRKsUkk/r9zm6RePv8/VkuUHSWXCLk32g7BWQ
	yWslLZH1CXT611f75My5hVSbl4X4SLOfjVlMbL+8sLA/sdg3FATrxW56r7ZaYGso0jioH417t0/
	Q7DjB2FVF9VMVt7Z7V5vKf539JcWn0jurDlQseRN2dKgAxHyQoaldxnal4wEqQeyxmmkyN+X2yQ
	oabnrNMu4uh/KdkFDbxFUmVrfcZG8DDj9+ocxZSHkX8GfyaN9PbzPKmQ5F9gVqKoH0j2Af4GeWJ
	WROXUoJQ+WwIQ0R9YR7BZBvpppB2AZ9NcN5cVZIIKuyP56nOWfIfwLwYgjOVL19UWVOZLbt+s9S
	j2qE9M47JUln198+BGjxxfegSS+665aioxmbfD80EgaU8oBWzuQ22FP8=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155380311cf.17.1774858900199;
        Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155379951cf.17.1774858899803;
        Mon, 30 Mar 2026 01:21:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
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
Subject: [PATCH v8 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 30 Mar 2026 08:20:55 +0000
Message-ID: <20260330082105.278055-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4pz64F1-TN8TEVxCkVRQZR12ulvfmW8a
X-Proofpoint-GUID: 4pz64F1-TN8TEVxCkVRQZR12ulvfmW8a
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca3295 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5HTw2GpdgXbBP0wXRk4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXxcQ1apCSxXND
 xYlxQTAmg3iELmNCohcmd9Vcmes163HdUojS3SlnJpGJttHqUHZon5Y60Spamj64fKhb00arYPB
 nXRsx3Ol5fLXM/8mjE2Z53+TDWyNYnBNiqJhmiCt+IIurcqWecyp/gHTh5UOU+rvbVHCNJ7ixsz
 XRDRwrUCaYBfwzEkLvLL52/r3uTJuZVvX5lBUQrP8MwvHIb/VhP7yhI0HkHg1iTjEFhMMCDLEWG
 FHzXQuy8hvPOOPygR2bTRko037CZGT8VqEbY+TJXh3mt7jsdmSzGhtdEbnEjlVAhTlP3DQmjMyF
 XxaEXT6ou42Zuztz78jpbAtTDQGi7VIZGrs/N1HJ7DOQy53otSQTbFLXxXP9uvz3ePcf9svDckU
 H7qKeN9AiXLNuFs3sMeZgip3uXEYkMKj+kkV6j+EipKoEnd7/g+KgvVWoT4+y0ZZ1UPze32pFeo
 RsGjMO5dykW0rasYgoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

