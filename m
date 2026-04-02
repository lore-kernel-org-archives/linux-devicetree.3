Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B83A1E80
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117509; cv=none; b=mrYEDlcKZSbKUR1kfEAnzSEVn7euXuwfx3lJZo2XX4Oo3002mCvRQURA6QE24e61NhHZDPOABwEW7diOv/2DjyLgCTmkf7luzxzORKLGtGyyGgLKVXrjKjRnyQFLIn7zXdyEacS29BRsZIB/wnqLqgxCgkMZJmFlqX32ffCWljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117509; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unxzegNt9nZehSeG5DuA/+WJjUvUNMSjDOE5jGYMX89RL7IVrfdzjig86RccEZrO2bnJqrHVJppU4snippOgQHmY7PAx7yGhLsXqKBJGrTSRpz6EtOvgSUtoIF2P1a46bDU1NIkdqEWDRxhf82bP7qq4zkP+sJph6WaYcSHJulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VunrPcgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax1EiWH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VunrPcgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax1EiWH7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Qxl31551728
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=VunrPcgzCR4Khhq5LSz9P3y5QWz
	rd3i7ujxBJdTYvcqnClTpViVW2hCkxj0siCNTQmKHHrJiMNo86Att8TNMcEMV9KY
	8oNUeU6gaxrC+uq3T+Wo56M4427r45hc2qLxYjK4WWYgpbmgNarClxWyQfeJHFV0
	LBVpODUNzfsA/qekN0Ti4c2YE3E4Yn+EFOg/2v8VuLE+dBfVJKAW7Jyi72OQmo0b
	AmtdYp9wjFCTQBNiBQlyUUQ3tqds/b4Zsr79+hdimJdY+wXayXiEujNRJKlY8Rry
	EOBh2O26HPZffO6iy71w9w+mRz1rzdk/2Qb1D5bq9Ci4MrAt3/aqQgBsUcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerwcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so16339541cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117494; x=1775722294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=ax1EiWH7sS+miN0M3o/OGtuXIKfiJrkJPHNejtx56wmvOv8ZP9EGs0IyqgCWGAUsbw
         kcD4pXhDAE2/jZMbX4HzO3SYW4OZn+adGyo+YC/CdynJoSZ01/MIYKMIlmtY0a9tc5Vb
         ApX909+XWEmiaxywD/GmrB0b7W+4OMFlrmrcv6+uJrSGycKs1YvqA8ZHxBfvb9ergjq9
         3owJEckXynyL/gWDwpHu2oJUgZ/vT3ictMWgLmtd4bJ0seHfzmzZs8QoVG+6+8RighFd
         UMGmtnQcVAXTJOgkaOMkkKKIq1ZCCLEIdfV3v1PsaFJvWHQerBqXgSAnpKqKZuP2S4A5
         TgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117494; x=1775722294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=nh8Ce+FNFdENQFQ3mmsjhvWBp1NvMAqjs1z/SxUlch8aGP66KbjdXKiu4N2ypULC0/
         Xfjt/WM5Nb3SiwjsRumtPh4QOa1yHkYPjBleRKoT2JuJoz9rWBVOBLe3tNPiU0M94OWN
         LMNulxowQJ/I+g/OU81WHYOoJv1lnQjlRKXqwwV0tpjXU1y5gLuNiHyOu9X90Xc5DDIJ
         Jd2r/XdPybsHYWqWtPboW0wvi/3jHCki5hP2MhrdfHcaAZTR1EtfAmZWJx/3SgYJfSAc
         /nWZFwyCbMHuKAOFuh09FMTDDKU1qGtnz+zzNmxzXSobvXKAQrGLWjCm3FE0cpRJmoYn
         NHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4G7DTQdgAsEe2pgAvxEq5R6IAsiwLsn0kEqFO9TutQ6zFtIOgqZwSIAejm4BVLWzNQKeyy97KMj0n@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0gKrmz2FAUcn4XXsqVN74/LahdwcVvoL7y77D96UDViIcYl8
	yyrsiBSMoFX/d19Mfkojv3em+EQtLDIHSKFSu6d7MTTXlXlTmiIrkMcb0YHaXnDhQVharIYKvSh
	tYCDF7nS4wwRJQdXcUpa4x+vkU7k+Q295jPQB7Lgw/V486uCV1x7OZ1zf3p8WfVAM
X-Gm-Gg: ATEYQzxL+i/981mV7UrZBgU/ud2WpR/KBJDSJgje1FytinXdv5SjnT/MaXsYynpIi1N
	bkPq/2yEsLDpjge/Hat9t1MHq5l9qVmBR3xlMRogPxgpsT0GNjCi0EybE9fNhxnKcfii0QDF3/E
	/W46MYhvTOgL81o7uD6LRrEj9MuApvabd8G87PELfI5qvCTG5F+DxmEejLQyWgFoATLfzJ2yvw+
	DrCzgI0r8XIolRun8R1ukxGvtCOJvoxhH2sjEmUV+3wRuS95luigpxiweU/STOzh/TnpK7QWohN
	keLFZ3PvAvuAbXSn7Z4xn3S1oILzF6/8s3qgweDQ9eJ/6/C8ZBcztk4ApFSjuX0e9U+PW9ID0Op
	7qkhKoBb2l4D/l4arKjsbawubzOF/1jLTBGQk35iXV1dtrftIGhwVG4Q=
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34007001cf.67.1775117494372;
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34006791cf.67.1775117493979;
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
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
Subject: [PATCH v9 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Thu,  2 Apr 2026 08:11:09 +0000
Message-ID: <20260402081118.348071-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RIyQE-qzTcFf1FSYw4-BWeVl_qANadg6
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce24b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: RIyQE-qzTcFf1FSYw4-BWeVl_qANadg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX9sg/4cNDXT1W
 7yNBiAfRd28SaDkzQHFYhjibdpFTJxmfuCh4/32dp6o3hg+/eHVdJJ1lXalynhSMPII25GeK6SY
 C4rEsSaO1YD4uZie1JlhwXlbVl9bc8cjGRimLE7Kjrn6Vb8MnSmlbdWNPXmlvHH5vLOJQfPr9NL
 2QYrU9G5kfSVcCnR0pTivorkdQxnYTllknOwgHpzkzEVnxYSjeUMXH9/eni38m1q4PZnP0I+fQ1
 ub+Kh+mRwIsLrdmbZAQuBk2zivnCRY7VDUocaDLB5WrZd21CrREwrLTh79c7qpiY0xekmTMlT2W
 NYbeB5ObAK25CUBy7E8T7aJduxD/uH7R8t2c/LpzXhuKBI5hv7Odj+FuPuLTtnQ+G4KWzcy/2i1
 Q46bq3ryoikrxaySE4vMpWyPJYDFzu0wiBvvzK+UwvpPVp1fwcou2P1QeP62l92nWsdpiq+9yqG
 /B4gkGAA+3w2XAM7DxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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

