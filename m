Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044763AE6E1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858906; cv=none; b=RtaBI4WK/tFPq4RS41zoFpgG6M2BAbz2zELYssZ7WFYYGEnP5vhGwWtVE0HW9moh5fdyAgkwaxfYEgCTLXO/aWiGc6Tle9cDEKDlTNW+9wBg/CQMM5oZouZ2i19iLInO+Gekq+J+PHFq98fplzZhGC6RdoealGLNe21aF9rHALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858906; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSdDDhx6GjdLGLwhubA76Kflo7CGkoGOQgWKQuEm+x5eWp584o6cwle1phhl0jLDuaueuvlFHhaBqKZIoPr+jFsMkk/jGakIkq99wYu5IuHIIIdPlEWsWQ3ZnzqRluBqo6AajSqM0wmJ1tJxlxhl+XCm4LvqN2sk4sTH+uySGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODVRXoP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLhORz3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODVRXoP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLhORz3T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7oIYq3424452
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=ODVRXoP5DPzAOpeIcW0XRex9b9l
	CrEkwyNYBrFqKot1f6vuXl18YEpNr9OsG3mGouk+4ukkEjxlGVP0R6WSZLR5NSiT
	X2Q4yVm1Ewgj++zto+b0rLONXRoud0rVDYMwJ/65t+IHZ6XJzZrL2Cot8+Jt4W/8
	iriy+Qp52rESuU1nxHZ/PiAcuOq4gMARmx4AqX74edlPxp9EmEEZwJtvHZTeCa4g
	FYRgAOmqgSaiWhhvZPBWE+8lQLHQ7V/0U5GHATajY+uzBTIX2MqGA9pzsYMfIjGp
	nKn2mUFy1IbGxOIGL0PBrAM7wWqVi4wmW5qRgWuhyZT0qa3txTrSk96AUpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk8r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso50842061cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858902; x=1775463702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=TLhORz3Te5ybLPk6+CW3DHK5CPoJZyeARZpyGTgeP+2hcStx0t/1QSZ+7qHMnZadaq
         PkRkL/2tfqIbCULRcvdjZfDlKay8AT7VTgnews4BWJjPw1XDCoWYCJaP7yt6XIfhCGuP
         i8Qa9guY0VlEASaIJUDXjnnopmdrq+YC7ZTMZFi4R0uZNiZ3EdAKdd/xq2tcJfr6uQxQ
         EhpWuE8uAH2bqnqwKAz/VUpNDvJq1cFPb6EAMmi1dZih2qvKBfayi3AMfaRkIpDKQu7S
         wtr6/9HwlitQAV5IPi7PKi+R3oTGT6AMduPu2i7VTxME1LEnjN+nF54Pj1kNW0BM4KQi
         3BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858902; x=1775463702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=e+E8zwcWFv8tA2/bCYdfLeuWZ3aCjJiSV66gK/tAcQ4c/P5qpUOtKiy0EqV+HZSffu
         isZRNmFiaGYoq94krOnVktcfEsoVQAtK7mVb1MhReMQ34b1z+3aXzH3JZ2dH5wLXac9R
         vXSQgdGsBv8KWM6XY5ikLyQr6a9cpajpbqEpqPBuDrC/VSyRt7L8m0odz98AfVAejQaA
         vE56egkQc8lPZBsjOBOreg+G5DdyuO7tnrdGgfQypuslU6IftpUkR3gL/LQ/R4PTe/9p
         GxDddQdpgDesvqm/RomkwiVWQU1aL+69mhtP0PsILJ+MJ8I8sTFTHYf3StYz7eiVoPmA
         rzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXZzarOCROiwaOthzCcPu8P9w1RfGx9Kecm21bBZmdSodXMuvdFH3KRYrCyNRUgBf++kXmwIfZ28xQ1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2J4qr/noxF2Hc3NNcIv3tDUH2lsVtkZZwJvtCocaabBedeXuN
	yr0itaat5pKdhrIlM/bQwuV4IqYBdcxHFY1I6cjq9gPVftX6dcOXbRgGu0nxanWmVa2o3opddkn
	DYJUMZ45vq2aU1nK3P2fZM96A/cgqu3dphf4nST740/XooACAUv5IYGyY6X7Vp6GJ
X-Gm-Gg: ATEYQzxngDhtyZOe7Zy6gR+NCQ3tqe0ItJMXrlcnMmVVkMKB3s5Ek3JEoU9Qb761MUi
	yKcaUeMTOvAsMO1H0xcBzez3imbB+ta4FyZZSGS2SI1C9qR5FJqxBrl7/mLUbH1p9AcIyoVyyMw
	f67XZXTZ+jJiOJkgCz0xseQOdweTQr48hPqf9SZevK+PnFjG+Ui+sr7OArqtNDZ/SHeY2bg5q5Z
	LJ8kZ+1gPrO4BKv5GZPbFW4A7lvfuxoWB/RWKyuNdrZAg1oFmDMJVEg+Uws3CcV3gitbsj89Lwm
	otb0Y1i7TKmsvXG8pMtf/dIFh+gt/tEXp6rx2I4c/Q4YbXQO54+WBwtGNiM6xf1VB4J5gSTjLr1
	fQ3Eyg2TPzNbLacIFaOWQNDfbKN+nJmsII6vzI/z34o7X5PBpobQkSnM=
X-Received: by 2002:a05:622a:5a87:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50ba39186acmr156494431cf.42.1774858901757;
        Mon, 30 Mar 2026 01:21:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5a87:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50ba39186acmr156494201cf.42.1774858901294;
        Mon, 30 Mar 2026 01:21:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
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
Subject: [PATCH v8 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 30 Mar 2026 08:20:56 +0000
Message-ID: <20260330082105.278055-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXwxIyri39yIqr
 Dingppvt7XG5KRbUE6MFeFXEe7sr92pZs/REG5uHsDmwFGkgCRs3OlWf88/AYO3vsFQHorshfwP
 BzIR+JLRyksWbEisVBjT/pcrKbV7Wev3UbtpYXhG7sOUSnWXyoI1KJR/U9oT0X5AoJI9wGgRnLm
 6yIhVaG3oK9yoV2d0OIHRy2xFxym2SyKFkKKxLdusjGWcjtTUwnFvJ7VGhcwRhY84JJ7KM+xH8b
 D1ir8SXb0aKWv1SfznVRfaTnac/QmOR2H7LPUlO1nVDQ0IPSpLqXAzW/Xg8oiq2nOdpNSHtbN6C
 H3xaCZdghWGF9LL5+sIJZUSEt7RyLrjuNxrrn2xY3xHJSnbD1+L29tpieJe2EYBhbPRc8WB8Anh
 3mHbnshszThm8L3ZdEwy16YBlPRo/u4/WKMkfFTDfGC1vC+fjhFq5U3+aBedkH8ZcZDprfwiywe
 5WPdxTfjT6vGJUpuTOw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca3296 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: n48rcv_uKqZxJv9MqomkRKKTT6TqHJkv
X-Proofpoint-GUID: n48rcv_uKqZxJv9MqomkRKKTT6TqHJkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 5be37eeea329..ba64117b8cfe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

