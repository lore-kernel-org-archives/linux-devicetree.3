Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5223A3E6F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117520; cv=none; b=BXX2M13tnCb2dz4xcXTEZDSlDooO9Xk34k2NStjAoUd5KJhRoyGN29tRfYmMorvSsm0d9iff//8PYbB+LdPErhlP2nebma2EXJXQguEakf/LwMAfn5RYWBVSveVXQt6UpSzaa557JsGSKSSoZCz8dgugDx6W0R85BY0clenrbSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117520; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+h7ZlZvA6bL1smFso6WVt9VWnunJg+fgVgoCsteSeBWtjJRs6Kb/vokWJUhNcTxlvQMjUjtOuJOeV1hbmjFzUwA7QehK6SCyGbVMjG3yVixU+zJTtmhrkdP9suz311XT2kiV795W9fNnxLDOp2gCjplWnoJYIRdZKA/b8DkOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2CJgvEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnUwAMFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2CJgvEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnUwAMFG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QwZn1551693
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=o2CJgvEXFlDAM78P3JlO5bj6CSZ
	JGVyZPVgT0KM8TRI3yramwtPzr/PeboGhBO8Xt+HgJqCL9pNP+TbZYsNNlwH8V1+
	ooPQNWINa0QJiyQqYnSPPI+PWspiEgco8V5W0uP5prAMy9PiESWJcbHTnmlnZnpP
	TbwBeFphZ4qEoNvZOMmvI3gfmTBk8QVoJyT1F6xRZIp1dmhWBTtlJ1cj7DxfBWA7
	cQOJtKImTNA2419MkOckvkcJQ0z1xhgwBq6oAMjvfEJVE3KsYb3PWRJqynHNxnGW
	3CogiXB3haozVtW6AE9ByGTKGXyn04EUrMkcIS3N5UIXTj4SngSbg66kh/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerwdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd827a356aso171659985a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117504; x=1775722304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=GnUwAMFG60Deb4W8zk1nOZTQPmtoAPMfjwmboTeniOuCUCB7MhBbn/2z9uPafbRDuM
         mPwbo1/To1qEukqNqa7lhjbygaoM8c9BNyHPSV1uZLQDS2ca4NknNcJlXYqUjuYws89g
         PpoEmXLj8kwgDPQqyL57J1rK8JFuOlJyWU0JSqakM4Oux9nX/3ti2noHZgVRa9BsZEKr
         o55BYgZpwV2khYiNULxM0N2AAY9A+miYPXTZXK7ghcksnGE3eReXB36UyeC9DR85llvv
         ZpSZeHN4ZXwWOnm6P6ecAFtfYrYvvJhEWESTkydHbkZai3l9oGdMJIIkhTUt6GTgtU7x
         LDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117504; x=1775722304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=BVSlE1+VhprWIv4cyb6S+euBU/7D6u5bItHkPQFAZ5GgeExrE1HbiSUY+MOIBsDRp1
         NVv9zJnrozOwAENYzu1+KKs7K5Veji4khkxHNbjSlmLAFDlruR/vbO/NfH0aMzCutH5v
         P6+MTWJwhBgPU2c14255N2ywP4rxdKACJEriPj8XztgcVLKTE/wc43kW7sRsReTNgpfl
         /24r/u2IARrtQvCs0KWxfxBkPigL+5gIULC0xslBvOgl9WdmLPWy6LaBjL4xRRZ1paig
         ceBwdbHodLw/Qt/uUghwHd3RWsG35YthrgOCkD6w0yPHMDPsPjanxDH2ydsSDhigCaDj
         7k4g==
X-Forwarded-Encrypted: i=1; AJvYcCUK44AqzM3PL4+ndtfnjkrvFfGJC/bi9CenqM2T7gLPiqsQub1pduQnvFfkp/XzCV+fyL1F7XPqcK2A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CgTSOrK6Rj3asdiKhFYaZHG8ILzbYXKS90G3YbXXQhosuXwg
	wsU+Y+ucNvn6p6aFi2mF8KCP+PYMfu+IfiPMdCFRljJFxlTaAIdbH2yf1WuraocM28NnquQYIZq
	9HsSwRocK+xG4XFuML8dL8wCgx0PU8lWxL5N/je2bVc+QsovhXza0tA/fMS6dLaoY
X-Gm-Gg: ATEYQzx8PpGUf+8Uq0eR91dd0lfqoriWLkwq5F5BT+fW36Mkx691XkyBIxg7Az2WNrn
	WQPkmBkPq8cfCAt+MA3TQZ26RRo/ZEmuykUYq6MEl+j95GtulEx5TZr/30AyOBijznQ5HTeXKt+
	i3fF+GHDxjzD/6G3sNQFRzIOcHG/MQrnHIBuWlxkv981kmCe0CgonTShbjEkUUkcartW8GTO2ug
	3v4lRVoGXUd0ROLDl9iyF+1nE1oqZRo6Y2B5vX1XevOMcyfcMQ9Eb+1nfkszxxMS9aHAVD5sP9A
	bWVvKsOm/nYPj8DpwwPBChkw5KWWE+v1oe7BvevJ8D1x3h8uPCGV+qhBG+wSIiKYzBy2jP++O3a
	y+//FFALYIzd3fDCqyLpykOR5yIhj5C/HS3xVz1oZ5bIC4vZLdUHRewI=
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996184585a.52.1775117503640;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996181585a.52.1775117503217;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
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
Subject: [PATCH v9 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Thu,  2 Apr 2026 08:11:15 +0000
Message-ID: <20260402081118.348071-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7kiUlFMvn1dbFgONLD_WUEdhM3f8oC0d
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce24c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7kiUlFMvn1dbFgONLD_WUEdhM3f8oC0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX1Zzv+sIdB+Hg
 D+TPI2ldGgFnjhmQdtgKK8Z0CqrafAaEmlUixssMZXdxlmg8oJJhxXGwnYVLOc5UoXGmrPEY1Vf
 kEskTyirSNX5ZK8LnMtjf6vJKZJNDBX6VJwcwALWo/ZcYnUp4BK6t/00YXaENrfGNJFAbel+2UT
 bRYCX+eoiAEoShGQpbPnQL6SY3xzr06T4MEr06PplqBZU62ALYurlHiZiw35IfRQaB5wkkePq7v
 8q/2IJI1zFb9hBbk32xKRGHtnFgYEs9EmcS7p8wBxaIs6B+7aGBAJ4aCElDGJB8CFfNEMdyKBof
 V2vG0JBOLWU/e0mG5C4euy1g5MDPkp3yRa17O2cFRf27suo2DOVMog5OcqcmdiLy9PArxbuXmqk
 TFZG+h9bdgnXzVVTDt4b55DobQyvJT/1b8wahBqQF8AiJxQL/gKGYyW5svXpUkh1OZ0B8D/fNfG
 StC/CZDgIePrg8mcu9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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

