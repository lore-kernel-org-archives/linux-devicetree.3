Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B073B2FD0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858913; cv=none; b=sKtYy5Rc52Ng5I4iaEKPGWoI33cFyI3e1gPufW6uSYqiGtY5VeydIGvLrJQX86G6NMMU3u2+bLpwF8MCYmzlZjQDlCcZDCgpqmyJtu1F+TrxZnqoTVJ/TLVVI4uprE34EQbvT3742wF0Vqa3QZaLsOYbtP6RooyhyRbmdiPPSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858913; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIeTTZGOK54iKZt42Q/J/4wjcj29tLljfJh5XhRgAornZHkLx2wXlMOvL/TPdpLh+PXhorGz7oz9Y0H/MXw5ZiA3QLYHbQF9K3q3GmTYyd0yxQPHxVH1RnYKg6bqd2uq/FebOHiCZ9bmneT1Yb0bnTBIEf38GX5FkpF9F9SsgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgpXg1/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3HymKQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgpXg1/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3HymKQh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7XH8D3164030
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=NgpXg1/IkQtlUVvVJV2usXrnLZg
	vAnlUIbsLPW0T+za0MzY4z50hv7bvd2pQm+kgena4BJJp/LLKda7hrOnO9w2vTlD
	ajG37vOR8nrDuvOoIM8D4W3Dm5Xnpal2j9RJPXwojFoP/rZ/kRkP7c7df+bjuwZ6
	tBEmdg3W6sxSMIG00W+FT6SIaDUysNiLUZLLRANA2VEVaVV6FCeCm32P9JPyAVFv
	eEd2Y7iePrAJjnE77YoJvc/hZk6z+WFr3nt3fL/h0uSz27TibcF6DIIPKkAmKDUM
	5WejlukzlZJ+CQN6d3LNnPGPIeGmZ5+RmKmzzy3AwYlZ5IhpLBcOzaXTb+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk8s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so138856651cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858910; x=1775463710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=M3HymKQhLgIjrfXK63ttmbk2TerakC+HhPnW+ExehTVDFKSrxRkz/qqqCvRB6YTDnq
         4zkklLOCvDfta1mGiskae+oF7/sqY2wbilin3N6QYMXcIGLdQ0tR1KXtjyniXIG+MJ8p
         zjg5OFXju/Sn+ndWfuqza2O8dW7xWGPlLCCtt7mKNs9fUiorHPUV+6nKQOJgKCEgp1E6
         BzC4s1HU5sY02R8mEcp8Ec7FySZ5CN6koLRO5tDJmx+Dilr9pOjCsH99PlmIiN3gnSgd
         5Fj9b+pO2xh5PDLPbxTP0Ayg8+UT3dTwZy0Aj81QPAjF11dK8PNyc3XXdH+ucpou7RZc
         LEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858910; x=1775463710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=S2kKWbT1IhaXfvQt1z25DxvzKQhir7xvSCzfgcgUG+XfiO/K7BXrv9pTov13XG/hd/
         HwMk2YBtRF9cVJpPEKhq5wELn88JpxEFUEFPm4zYzIVyiFcmn1MO85R7SYRxxL+NFUHf
         R67A1gZ2qiuSO4o0o7x85rTE4jqVKNUVTScji+Xnq46of/vqfUuTI5DRp2xSak4CrizX
         CkJBjXggJZh0QiRorVaUrZl419VjSVtlTLrSCj88JcUMaJmBV/8aci7zzusbrLCyHm8P
         G6TG1QUi3XZBoCeX8WernouwgCIdQzWl+hRVCWSMGos7z4rmv58HpbC0GpHSj/2JRDhH
         ST+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDUwDRrIOQJ/U9HaR+rs+tUTuVG4lnnGZhLdI5dQA1Y7PTTuwRz8Qr/PBrtMKc5vz95aGFqpbkGyBP@vger.kernel.org
X-Gm-Message-State: AOJu0YzgO4qzYtWx4mwbrnL3g5/F9L4R0AAuMY04riHfDI007xFVHMqW
	kkOba5MtB1iw0+KonaHOQn/Lpu7Yy2nbqFLql6RHrRqkrJy4UsriyLkIDarZRMpa+4Cu3TuKbBV
	DRW3om1v+i14sI7e6pf3G/1XjdOgTthTR8mgBHRjqyQ0e500W+z4zw01E1F0FuI0n
X-Gm-Gg: ATEYQzxXd6VrzBw3VdRy6mKgW3voKs7MyW8Wu7UMQzwkkTLgKB2bPmUbXhTne9GqHDl
	6/Th5u7SYc1r7QwLccN+mg6CakX564R1c8wpMA8F+VqZ2yq3h3ARDMi0Owy3GHJONF9Xgw4TaS+
	KaMrXfR4ZvAQtQrIMFM/fLRcP/G9vO2i+iS7xF785Rx9dpWPR8nmqEFoZi/zrX6i5X/CXqSoCPY
	iLcANWBDKa2d//NZuenfhfS60i7y4pKKXmi9v/Dkg+5mK6nVpjK83O9qVKeAVfZRdPnkih0MnVW
	QmLTSKs0TodZ5LatWXMqnZ//oexZHRK77/jIIy6cV0UN+eoWtUtQlGVj+1V26E4EkRjgf8pmlJV
	NElMVfT8EHj4vILe0ztY+xm4I0+t4NgrgCz//TL0YGQgihaREssGaYqA=
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748871cf.56.1774858910507;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748671cf.56.1774858910050;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:49 -0700 (PDT)
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
Subject: [PATCH v8 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 30 Mar 2026 08:21:02 +0000
Message-ID: <20260330082105.278055-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXxwjfmCDK8OIm
 J92gZhqV3VbV66WAnFjr2TeyvuueigedjAq57Eo79eciuSnDAY6b6yOEBi7FY7V0KrETSXoGRlQ
 xXZ7AsEa3uim4/t0tw3CgnrFO9ELzXmkKl0T0ExxxiQLfL8BTrALkhEkU9bFkLVaLZHUn3B9WhP
 jzEawefLt4Twfaq7qyiCDaWMgRW3dFvQXpJ2TTR9LfvUxgcE8ZY9W3t8W/vX42vGZsUyExERU6g
 lhcFBQajRJjLNcki4hTkJfE3nw+t/VlQjOJNorNRM58z1Ss5NgayDAkXh4XFKI8clZF0Tm7z4eV
 ElBSJ5Dk/6ts5Bj1K3ybsL98azrpIE1jA1aV1uRfCUNvOtZSh8aYEwhtQvlujjUvnAmTCEygeKw
 q0JmFGpXlI35Ej0SSbUZBf7SSmIndF2vzckdga84ksN8IF7XGF7pDM/JmkbnB5AmYoP6DbGYPw9
 6QuHWPtJDxlGnbd61VQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca329f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RIvaY5pOSk_97-mrfGB28KAfIaQL7V4G
X-Proofpoint-GUID: RIvaY5pOSk_97-mrfGB28KAfIaQL7V4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

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

