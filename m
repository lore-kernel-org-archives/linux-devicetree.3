Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=aogqiVmArRGEZEyEwtHDcgDTbfo+OpI4RDbz1NF1tJ4v5IgyaYV5DnOPMT0yYxJxk+G5
	 qZ0hDZYYrIOd1YrF4HMv36A9Jk1kiHZIjRC6hm8GKfdVFGlmuthMn1LMJQh5hAC7FYHWG
	 4vw881OvV8G9lOsit3mqFFB/QMkEBRa5EyqYuvYlfcqpz0VYDvOTnDmb/HmqxkvtHalHW
	 HFldAHrT8ofbJSOAzMQ8qcgHO1IB4fjL/WtZ4z4V1KD2ly6U7avWij+CcaxZiCtLNOSAl
	 eVCZRSKx+R5GYKvOMTR0BejdA1TDs6iy0AH/fj2tWa35fkm+nS0dFLE8qzQ78wjfa0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
	b=FDfH+EpIXy+Nh0SRBcg6ohOmMxEoZnta/+hdiHC4hlDQbdd1gGNvzYQZIv7XBj9LoNwA
	 57pWlEKH+fDHB/PA/EMqlevYKLQADx3RBp24Hzqz0OOBT30x97lMgPzwZk4oh8taNxY+C
	 AlxBAo+ZqSCoUqmTQOpfClufOSBtH/5FBCV/77TBLefvkx8BSw842Q4vgeKDA2kgWSarP
	 dCL+4a2XR0Ra49psnDSP/q9QUE1mTAuRgzdhJ32lbsOOE4ixYLCzlvow/a6cwDQ/cAggQ
	 giD+Q5GmVu3qKi8WaR+lTTI6BPAK2bdi8ayH6jHrO4uOZbTvJ1TjnRohgmhv61unf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6260A5BE2
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E6260A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67Gu3019035
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5T+eklRSuPX
	OFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=; b=CHBfgWfYo193RQkrldZ8J0KogoN
	ppn3J4x+BoXgvo6Ii7dPPtTab9kJlel/eIEE3Ed4Yw5Gn5UH1K7296cuSUfGjMoF
	5FqcMZPKI1ZjQr/CrVJdnjfn9c3w+agHBix8+6C9hfSe2TNEdFc//hPs4ZI3g7Lz
	GruvMK/PUYuQcKTpkhyte4Et8bY3H2va6T8bEJQRPQcsYyosF4jiapUgwYBbNnkn
	dbk+79V0OCQAsjEPsWsXUc1yPrr2A3DBTqBccndaaII8kugvthM+40TQB1uZCC3M
	y0M2d+sgDmbSe4552H1MiZF2YG9l81R7luns2EHgwUjN8gZFtGBWBzFxe2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc5w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso141277685a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775885; x=1793380685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=JlF5tTdToMf1M8+qngUfLf4dSVnbTeDbH1qstrEDxu32HlUsDBNjqDidKGJvKgGtzZ
         B9UGPi4rPk9XwIByN3B4JoArAbOlx/14pl23T8aMlRtA+ZRIomrOUY3Z0+wU1qEF7dxs
         CnhzVSz7tl2rodGPYDBvOxz8jCCogqlN7DZPwivOnvAM5yGu2X8FXFjuvaoiEOJi01sU
         /620IM9o4qk2SJ+rxCO87/1/iWrJr1QpJ4GxBHy30hm/Y3TTotHfxC7qyARBaqSab/l7
         dg4tatfmnuUGIUW2V0ZFK6RXlpP+f98LCjovVJvsvne6VyPR17KZyvoMm58ZCH9qu8BJ
         trdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775885; x=1793380685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=s3ioguY/3v8xP17EkNXRu4QJ10O6XRzubLyFlnZjFFauwJLbWnERc7f014/2RNfFHp
         Ac1sOl7etbrxiusfj3VC8TuRocYsAs7p9/5fhL0LwXuelAGutdY1qDQhX24c0wQ4n0vV
         fifs9Vy32sa7CnRorObujz9BMKWtRtYhbhvOmz8h8RYEc4kl92eMRes5eWqQVeoxSUiB
         xK62nlhHfiDkrrxfv6dcHPUvzgxj3sDAyMSFmBm6n4B9ef6Y3k3M+jn7pHjwXZSdhoUF
         Ehl4OdYJKt83Qwwu1yF4ndikChIf15v/Be/Zg6VjFVoPcaqMoF+t0EztH1ZqoJ/iSQCz
         OoSw==
X-Forwarded-Encrypted: i=1; AKwUvBxhyeimVBJNJ6bz4IDBhF1QzM3ROtEAil+A80OhemXX5vAKUtGXtBZ+ui9iUrjUjqYxI7yRKW3xDB0Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJKLk/8vXOBzFlmk4S64uTK7rMmj13YlniCcLx+otYZThcvgXLk
	OMxNNNoOzEWZEAnWeyk6uRXr6BCHYS7x8/JRnfNrv1ZGJy5stQWGUJcqgwYS2H3dNc5X0c7R7Q5
	tynvJJHC9MTzg1Xl26PXl6qHwYQevFjfTcYUVwMBPpU3K9oe61QYGGPvGaCTw9cwV
X-Gm-Gg: AYBFou3vd2vOOoQR7OO2Q56Kh8wVwwzGP/00pn3X/VpeP1Z01td3/Z85sTJvMwG4n5k
	x4JYXR1Xy/Sr0uMEp8O37wkW+NHdhqbk9Y2UZ+Hwtm+VCMcKFgZdQL5VMpOShQQI0ST790HlBGW
	uILO+3tob9yo8YSwvj9c/SkJX2BVpXTtG9PxwsKU08f9U88Qq8N+/oFQONwhFOcdYwgAzSvKjYt
	2PWJOjSX49RU1i98LZbDHnwDxgvx2ZOUuM4/q00kto+uJGvzGwfpUCPDmhY2fvjGyv3MJpvthGC
	fppbEuA6Hf2g2JiW7ZAP7p1LG51cRRgaWUoUR3axatXCKuJ0ZikA0GPYY9WXuDPEjtg4xstiCuj
	OZubgEF67ymuv
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502264685a.26.1792775884620;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502259185a.26.1792775884048;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 10/23] ASoC: qcom: audioreach: support up to four speakers in VI feedback
Date: Fri, 23 Oct 2026 18:14:20 +0100
Message-ID: <20261023171433.820092-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2fszbOejgber
 xJBpu9Min3ZE+dUcbW6kNxKuycRlrFQPjbiKAcxfR4i7Y0aFyDxexNR+ysWGSR+LulvJN/wwEnX
 EXJjNm6AcKGg7jutinwOFMynE+wg02uRgPthSppSj0EHIkOuJY931yj8LfyLB7gVZ9hhNGAofz3
 1y2SxiHv4O6FL4EBGuPXg9xtXATlqfI08wGzEMWXZHPz/l9XCYb2SacigkI5Lwz7pofCblrca05
 CXtbgihZl1I34n5DVNP3vsjZVuEaPQgZPOYRLBGxkRrq8BLBzKy0aulHFsAQL8eCSQyhx5nSgTE
 OHX/PJUgHhWcUVEsT3LAlj9+QqpqkMIjbKPr4rbpMkpUcK5zP4gwMAF/mTubvMnntyNn2sx4C0Q
 tHYsarGjafcjuBXYLXRC55YiMOtwAFNFFs/fy7Cey3X2ogL0vzxDezNIhCIkcSPyvGjKE0aZ2az
 haUgK1c+uLOLysYYFzQ==
X-Proofpoint-ORIG-GUID: 6EEn1uJGvYJkEfMCtI1aPX-4AT2XAlgQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxElgrnKOfBM2
 3XP7fcaQYvq+q9bRC+iOfJh8sGwwYO+O/wni6TL4Tzc++JrQRuFKRKL7N5rnocOOMxCEK5rjVQP
 tkuOrzpT2kHqLjcijvNdTUmP9RhZJGY=
X-Proofpoint-GUID: 6EEn1uJGvYJkEfMCtI1aPX-4AT2XAlgQ
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0B2h0znxLllEwdGFOn4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_speaker_protection_vi() rejects more than two channels,
although the rest of the function scales with the channel count.
Laptops with four speakers need four.

Raise the limit to MAX_SP_VI_SPEAKERS (4).

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/audioreach.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 75995426b9f6..24198cde8158 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1508,7 +1508,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4744d3117010..c8c7fa4f6f70 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
-- 
2.47.3

