Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FA383C81
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305558; cv=none; b=DcTTfi4DvQb1IN5cLs/dN3OprJEKM/byfRoZ0gIyaD9HKtdJNUfw/J4wP+FKK6DINwRgt1eWB1aDIPB4jHh4D0FFaF/+JTVF8mN1+ERbArHUYc3ZN8YTfprd8CoiFdZfnbNexxqRJsEZ9K/XQQYyNgmDOwy9a7O+ZEotMwmTH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305558; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qrb3mDQ95zAymxLidQ/zILkmspF0bBk45Lwo4mICoB3+GPAm5d3k/9lKKyUu7lQEsZ1ZJUXstYgay6WpoQ5Fb67vAuX8JM5FI81joI2XK2jrPL4rjw8pCBEXLCE8NAh4JeAKc7BLOQI8HQiaLmR0N7a44GMFwSbxFy6Wp4AWH6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9ZXlE/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ND4auYep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9ZXlE/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ND4auYep"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqduQ2831926
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=l9ZXlE/ktkebioi4FzAUZ02ej34
	pgAeldTbg2NoSIWwvGTH5otD3KdRozbqoZYzulw6KTsX2GlWc/ef4DkOMW+gHqgk
	RLPZDEib9+8twMergcK/ESCfG3iOs2HIuPNCJDTKI9sug0Z1uEq3U0NUrXsM7sO/
	hVgxxVDMH1TVFt3FvRgttsvPgd+2JDRBplnezT7w+JaHOol3ALsb8zw/SVJxKRW3
	mqRHdkMO2JkJe6mw4GpaapCL6kYGUbriosAcuxf/0JazNNSO1GuX/ErbXcrbaTyz
	dIfeKZN7cdeiB1MVgrBC61tzagHCKvMQCyUc3Q7VjwAHs4LLtq+xpuq14zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsvgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso156654601cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305553; x=1774910353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=ND4auYepQkmMZJbjA3zjL75Ogk0hcZyeqXmyyQ7oGABy4vEmfmF9K9lKkp0vFnFgLD
         gmc2l0ySavG7nNC2xtos4gTO2jbxeO9BWfLTxtfEYUbYdfoaGgn1mmlthDts4DaBg+0p
         z3HEYwVNqL1SShRzhbCjeZ201Mx1NVIFk+bY0MU/c/VIMdQRrBuTXU5IMhDXkA9eijPg
         FYqIm3pRLCATJeCmCAvy7vNt8QzgRCdMNa5GmJesn5F5bP1JOiTHvnXhpBeez7+qhdCb
         K9gKh7QG6xPbxUNX98kKpq4jLQnvDRqsSbEbT6iAK5slx7608XtvIDIGKXBZ+sCazg+P
         vstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305553; x=1774910353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=QCNwY3I7gPeRtz7Oa3k1Ld/RWH0HVjebJx/hTe7iBT+BhtTKKmgsfFowh9LAt1xeNJ
         0hPbNbUARvqU8p503gQPu/le5o3n5IaO1cxIwNv5UJIxdGp4M+ZQVBi7EyFlRxyXU5Tn
         SDWkeEexEfJxo7RlFWeZ20NX6HDTggDS0IyJQDIJWJwyIQrdRbh7Zd2ZvFzAZZU8aKSt
         iIMiWbRf/JObhpY4aVnloWy7EYLhjoHeqfyQ5PEHhFUaxh4BL8nkY3pA35alOdCggNiT
         gVA9eu7NsbC71QKd5bOoGnvGkPt4tNK8mFKc3ZZxddQzH6cDccx10cJMwMOnJ1k8dFso
         XOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgBGjnwC93MsSHCeymr73aXx4SRWr/6jPMRzQVNQ+St78h7Qf+UUguGO/UpNYRDa/6bX5rUze3oZAb@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIZHvnoQtJ2QpxvE2IyN8/QvYznCJL8M8klP/shvGQ1pMEPbN
	IMlNaWPPd0FGnSTGTJRNIUE77sSJLEgqflFzNEQJqDmlRYLZbCwDTJR6E1oTagN2whyz6/tRfFp
	cVOha88gF1UMUzATdhhyHRm9L+gYhEB3Oc6827Vz/1Lck18nv0XemSxoL5kZGlzni
X-Gm-Gg: ATEYQzw+Qv93vmPQA0ob4wh1jQ+V95X4hSeGWCTKVwhigLgE3jS1yRW1nVloPSI2JyK
	ZfFBtH+JtsoUkyZ5rQi8mfQA/ma3M8H4O8tDucV6QFMrljzj7eaMbAe066gTHwd5iSQmMoSFno8
	S4U1rL9jzGH5AX3oLsnZeqlVEbGX01i3EZBWDx5gdyyz5cWEFouc79mcYEfS4DPRbx4aIzhh6Fm
	1GFtu/GpsRAtZONQhhacegj794joFHscLHuD4uBzTVApRKuCWbYm5bOcV2+ZpucYXvXNhm0vyRA
	UOZrtmxyk50j7Ve7mdNlpvl3FQTZYxo+K2fDQiV/MDQSDGYkZy9Ex8263KGqicr+QibRcfTcc+W
	oyenBYS+v6R1Aro+PW594kAM6IpN5iQjBD5VfQRMna8eIKJPMF1EzOPc=
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377341cf.57.1774305552892;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377131cf.57.1774305552516;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:11 -0700 (PDT)
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
Subject: [PATCH v7 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 23 Mar 2026 22:38:42 +0000
Message-ID: <20260323223845.2126142-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: DQJJaLy3VL3CAJk5O5ad5L_AEdRC2bIH
X-Proofpoint-ORIG-GUID: DQJJaLy3VL3CAJk5O5ad5L_AEdRC2bIH
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1c111 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX5L67OkPQyxr+
 C/v8UPRuPOS2ATOoBbPaVE3b7sV9vlXvbYuDmIkooQCfQF8OtRn1+O5K+yiOBhiv4NqqVytbyPA
 QSKc8EzsvrBaY3zH9S2N/gZaWinvaLVwUygqmZ4H+OxLDYx1qjLwdeIIh3TrMF2VOrC69Oo64y1
 0oaATPwgsIkOct6Y3gr3ZIqkrlMl5aPHMXe0HeJtyjIZ3uziex2sWdUnKtInLy/qk7T+hT3525q
 I8B5IBiERk93jaJMaY2y7setOiZIfmZjFmNVNrhIsRNxHSkPt4mAwjEic9ep+IzXCv7+8+GgVqd
 sVGFT17ZQwwGMcbTPbXxZWgbCqBwfC5X0Kmy+WaMqrOyN1FFCzabhaNBO8qZkJ31CAz9MPEA9dR
 s0Vl5DBuj5fvuH0dfFPoPJ2Tbi1951kgRD9KBs12vEqGFMDyzjwlZa7V1GR7RTduM+MZ1Ukkxlz
 FLRW2AV1K6+YkTJy3pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

