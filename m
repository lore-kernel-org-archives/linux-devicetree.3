Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD7383C65
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305544; cv=none; b=BH2OYn7h4/CV4dEvhp8qH3sahe2M2PcvcrrSvdN0W3TP9BemMK1r3w4I9/gJrqzzCLvg/DsYaFdEe9/oLd/cYGq6y2rFuRO/keDNoWIy6e94by9Mvd8f647bzdvuOyxBlMWAaWAbeR1xwwcCj3TDQ0iHjQ9RALp26fG8PoHe/wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305544; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uagnJXtyOf1JtFs94MT+e31zIwNr/7TiWvugogJHBAieqTFhdISWd1VDJR/F8g7zd1g4N2oEMyuaPsRLC8DyKQVNneiLKR6alQZ2nl20Z92imb7y/NWxiBVs1T06/rYDBNePCiftEwEI1sHA6dOqEs7yFbIO7KIJBtBkXDOAqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPNH7VQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hap2eZjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPNH7VQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hap2eZjr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZGL362527
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=FPNH7VQ4erEtxC/8Mwb9Y3Nnj8l
	i1ArmT01rOSlVdzYTbM5M6OWLFeaFg8Ggw5QfvHa8l1H6EkePTMuRKoBhs7H0wwH
	G4PxmzgO6RLe4n/LTDf2B6cz7nLfUOXsy3rOZOcwihssgxCXJAjRHaeBSLFWLRtI
	zW1zDsJdcMo+x7nORRXlFhS3yDUjYzjrk0HBOKASRppW4A3xI6nXGRLqCmxgu6C8
	D+gktW00VUTxY3rcY0B0xFQaorr5gbsTTFaDoH/xXICbExT+lxLzkpSYODVj9rL7
	UlqAPY9Mj42OpfptyXXLiVQ5Ghy7Dr4hb50iBtSai+01SF17L8Yvm5ZVU7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32eaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso10162831cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305540; x=1774910340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=Hap2eZjr9fptovNS3B6uIFH2F/ZQOv2pdHfMf4JAmXGxJU1o59kHLCG5M9Aqt5H7hV
         Ie8o3BeExlozARIuAdCA5zf8+XFvmQs1/Au09JnXJEpXxxDCsUef5U3sRYLnvO3K5D6X
         BSID7eKUMoFBXYV5zfe24ik+FyDzvToJXcCBSzVmmdjyQGMjBlIQpUf7ZUA+oFYY6w2L
         Gq7d+yB9e+jBricWlakCvzzPcl3plKhBrWIZ2Z47i0uCdHPhzWUez/NG3AhsIzulL/ed
         NFt94wUfuPtUojJPPQqxRxr5qPcDBN/aaVhSHxUpoHkjH6pQ4iBzLHnvoEqp5ceNN7fd
         cRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305540; x=1774910340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=OJ/ORfdQEPQy+MZ30qeHywGAKQQJflmSu2m184g7Y+k7A1kVO4F79aGnXHFw5iv86N
         Z6Bky/0xOroQ1mxG+JKHeu6MPfgXioNJbRjhNFN1CddzoSsg2hcu5QCQEuXuZKOPdRna
         xj3ZNEr0ma1mTyfyht019QAhrj/ARPeAu3QR3ABYEjgk8QHmHiFLhYUrR36APmAB9oIx
         LOo5Oz+sPIAbpb60b0ePU0B1KJ6LJe92D3NoVebY2G9+rel9jSB9eM+++U8NVBMjGSGC
         kT1q8ZIwOKZDeB6GWw9QTlcuwhu3X1UXhPnYPXx51Jgj0BUBCHuOxooILFd92uzNy7jg
         9xtA==
X-Forwarded-Encrypted: i=1; AJvYcCVoCGf9YnAaD1rSWtJGcj5zQiyd63ocx4NggmU/B8PhYMwvUxH30nmuMTxBCPTJ24zFzgOVbo+thIAv@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFBvwoH0d+05rsQliDygCjWjV3mVupH6Tx23uIs7NPV0oNm+D
	DRbwUef4tWrjpR9Ma6DhdrQgQrCHXqSwFTANzW8tvPmTze/Tjb1pf+g+uYvBhOAfvAHRxACVhB4
	OWrXJC/+uDphDK/Dr9Fu1wRG84uE+9ptHevYuR/h9+GF73T5JlXoi7Tomi/9IVS70
X-Gm-Gg: ATEYQzxNAuY1wkeAsLGMrovlVfHVYSRlZoVpHNGq8nmiw4PGy6KB05JyjBJySBsJHue
	3iD0GXFXofxq5HNX737siUi5Rz/H9FvBAe2zIJJbD86VGT0WhLTTxeGoB9tFFk1G3N6N8bLcDim
	Zfmma8bqDM8opEC9vhLwJRh/RNEl1MuX+HkimBwkI5jh24kiTRfPb4xLRanTQ1uh4u8MNaESppm
	QabuMYjCmeh9g2HPqyypODqkdvPDU0m+fTkHsFCntQio9zUf4oo2iX0wLNIhi4uxNfZx2sT4vZT
	BjbT7Nz7mVM9wTQVn7zo108QJU9f3DYvyUfer4/ra4MDb5h/+PmZ5lHjCrz6AvQRCsXHB0G2r2g
	FzKVuhprmYp9mVqQbgVY3GeKMWVV6Qtw7cgU4qhh10xbeaFrm7a0MycQ=
X-Received: by 2002:a05:622a:6116:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50b373d08b8mr192255211cf.8.1774305540082;
        Mon, 23 Mar 2026 15:39:00 -0700 (PDT)
X-Received: by 2002:a05:622a:6116:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50b373d08b8mr192254861cf.8.1774305539641;
        Mon, 23 Mar 2026 15:38:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:57 -0700 (PDT)
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
Subject: [PATCH v7 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 23 Mar 2026 22:38:35 +0000
Message-ID: <20260323223845.2126142-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c104 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfXwMzmu9HPNulG
 jvj+PHkE9vhZ9wWPugk8FENJbRSiTBd6IayB30ENjLIINprvUBz1IfCowLrm9ORrAZ0QFOjajeD
 ubcx1FP/wxIw5BNueyA1rUhcNPa2boG0xWcw6rktfM4TN9Zqs8RXhCLYTGHhBMoGjOZX/5oWrSA
 CWorWkaaxx67fbDBI4usyqryha1qZeYzzNMkiHz9pXdr0iumhX1Bexa2/4pAvppUaGCR2Jr8MAc
 caB2IulLTNE2zrAOSLC7dLDCI3Pbz5ZYjzi2uLLGZRad3k7y8zB8tiVGDBrRf+9N2EZRb1fY0cu
 DFPFB6mY27pgr0oUP8KzKkqPMB1ygro+C7Bo4V5C/WkAOzh9IDxz3FUq4hUHN/QQMEmgfIkjdPH
 G5AlKw+jIdjzroWxztfPYzWKrEl0PelhU05KygFQbGdyBXTWFKJtY+UWYjZn6keoXtF61h3l54F
 X0T3BVj/bDWBh149sYw==
X-Proofpoint-GUID: UTRwd_Nn3Puuby0BeRN2OyVZ3I0iiPbh
X-Proofpoint-ORIG-GUID: UTRwd_Nn3Puuby0BeRN2OyVZ3I0iiPbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
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

