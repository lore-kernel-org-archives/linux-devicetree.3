Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376483;
	b=TSJYxmfrqBhYXSnN2uysJcYCAkHCtGid6eL6rvcXnXBOUmWWM0Ci4EVeldVLWuUEduer
	 EIv9WA6G63fRq51kLZaQx+pnejzaXmAIbRzZkiEBcAs/aDcU9ex2pxyZBow1uOPeHpZwb
	 zQMmWsvj2jiYc6HLGDjdvfipjD29x7EpkpHd9Kc65G4WEkLgkpKRn4YGWcIZR180zCd9l
	 /NWiok/YkLLln9QU1RoEvj54DdMLIahU6l4aHuudg68lUXNIi0rykes7CEmYoCdprcImM
	 MDj5UitmtSPpWHzzu/ZXi1bfqYvTZpSDT/MtUaJaNbmIyQ39dnKVQP8/UCo4xDOpezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2fucnEILMSEo+R5EqFnm49PB1O0WC26MWgmSYiseujI=;
	b=3OPHJ90ty8KIXYHNpIGA98+OayurUuYHRlHHOTaxSsmNanGA16ndBQKawn+z90JAIUi0
	 Ow9THJLn50PTswtvcldC43D9Ps4sV8tOFDIwydhkb8Lh/IRiTEH+7c4Lrv/VdGfHpNVeJ
	 G/4RLNTrhe5i/szZi6pnsPKMetZ+/i6N1mdTFnoJJbrf/ZBQvVysdP66EJalKFJwzmOIk
	 zjdXds2H1wxxu05wBQyGzsxyfo6KR2nUjyf4NwK34QL3rwiYIT2VRQF2lr9UkPHnNfvlm
	 5ZjpDyLK1N+h228sjQSPktLJawfXVRiuBrBljiDYt/ta0mgYbiOtNnWTMukS6IZQkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckLqdVLs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OT+UGgC+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABC606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckLqdVLs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OT+UGgC+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV2IO3515715
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2fucnEILMSEo+R5EqFnm49PB1O0WC26MWgmSYiseujI=; b=ckLqdVLsX1S15rwc
	4kzcUNALzh0udQul5X/yHjUrp7cu8kPV8CVV/pN6jkbaroF32WeS8LFnRXyHumz4
	j/lKAq3g2Q8Bd66753FATpvzTHYUtuny5x/uPGyRt/DV57p1h5z5LEDE1t/QMgvP
	AdbqCBtBbu2G5Ak0iOrclvpxHRNes8nOXex9G/pH9jH2XpNXSN+FNo+x0SWqj1Iz
	3WJ7engCZn2fm07u/p7lG0UxEFfvPQitgRErSzwuEJCofxkEg9piyM63grObuc/0
	z+cYgsoMpR7JYMNqkb7Xm6k4hHP8R19xKagpWyqiicEYBEs4eu4F4PUk1O4qLchE
	ytgZzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v2ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso5019418eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376481; x=1795981281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fucnEILMSEo+R5EqFnm49PB1O0WC26MWgmSYiseujI=;
        b=OT+UGgC+f6C3785ie1XmxPsoHeTjR3UqPgGMIy5/m+7eQ7/gzEuNrWulvxsULWU3A0
         ZI+pHa9aB7V84yq2qESdKiECjeZ1HNuVwW/XMQZhE7knDeRq/WBbPzZKTQh1fBXdbH3f
         SeAcWRLzoUziezDdYTeWFOtSXXb6It4k3DzWpglvWmy6ea0TxNBJoENP9G5iaw+fj5kU
         t89gYruRGVnxja718cXYxP8iaktcRg/+hCpb7xOH+/38UujqScTyo6r3YrUCUwwhFruQ
         mtnSEy9crBTXVXOKYWAJpGrU+4TlqrSmiy+G2NpKw47jfFibNx3s2JFFRHOJnSt9k8+Q
         F/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376481; x=1795981281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fucnEILMSEo+R5EqFnm49PB1O0WC26MWgmSYiseujI=;
        b=UbgxFSGtHOS7fjuctdWcygnkdlLJtWom6hxxLdNW1D9KLBFYMF4aYNf6fCo/6UoGcQ
         9ONZmh3Rv+r+SIGfAqaHW2gt5/BEw4FFsr9VsEgI+u9k6t8L1gEP5xkjTi3GZseOoBi6
         Ad+jISiq5dq5wmZGe7ksYBFsZttwVbmR2O2bnTqvrrzbphYI9Lf9LOKye7CXJ0Fi0i+0
         Z8vE42snMUSCEcSNPgzLaC7Jow9QazNnokXAVU81sguvW5NngxR9+qBEaX2EBIvMteiu
         +hiYtfXW7CgImHM2fccI8mv04EqSeMdYx1Wcb1WlwyM18HZybCgWpOkfP7Y6ONggOtQi
         O48A==
X-Forwarded-Encrypted: i=1; AL+hErFLP1kDug1vpxI+pFjNF5WWmYkUeyIBxDxZAINyxlvo6b8DmK67PJZM2v5+9jYGf0XEQ1hI5vp6HW9L@vger.kernel.org
X-Gm-Message-State: APuU4Z+c8XhRicRLGz4rkDwvTZrk6ojWPGKQq3yzoC2JAy3+Wrybnmw7
	LRjPW0uDnh3+BvMQL6X2vdLryzSPns8KrFEgdfk/cTjUxqdaf7cEErydUNF4l7LJaUg7sq6aHLQ
	SSexS0gAt/2WkbHMB1cj9CnoA8yiKE+oQTgXXYx/VD+3W/7PhQPX3jjR+mIyoOVzq
X-Gm-Gg: AZFdTZfK0WC0vM6s8T6ASvVk+q9P63aYfRFO3Se+lCs/pqaBW9G8FxM3wiNJb+DBrXr
	hourwrY1gw4EiHC8WShszK8mwC4G1a6WFEoFKp6Hlhw8oKdjjVwnS2iniQuUgD5tsIcxYhvLvF0
	vSrsttLXqX/DXJIDy5Y+g9CLlPcyg3OmotgXnHMeeX32aZ+t/GkZzbmSukZH0HpRFGtwTzwF3c0
	wbTck0VTHHH2+rwju2pXWb9SCs8srdZIWnKuW98dGkh4fc1ZacaRIDDkg5ugCvA6HsnS9TqzBiQ
	vILnyh7StwxA6WdPkXCPeWC1yxiBhkJ8zpKMLJ5cT9n0EX5Mq2Hw0iNR01WNPfvH9gqs+c3MJ3d
	jueDi7yhOsSh9U16rtqdYRbwrT7kHxx8jXmePN+RiPSwA6iTgqdOiZIiSDrCnnSUUP9UI1fnCtM
	OFmfrZBZUgGQ==
X-Received: by 2002:a05:693c:8211:b0:36f:202c:48 with SMTP id 5a478bee46e88-3857045092emr10449064eec.14.1795376480676;
        Sun, 22 Nov 2026 11:41:20 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:36f:202c:48 with SMTP id 5a478bee46e88-3857045092emr10449034eec.14.1795376480118;
        Sun, 22 Nov 2026 11:41:20 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:19 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:47 +0530
Subject: [PATCH v3 2/5] ASoC: qcom: sc8280xp: add Shikra backend handling
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-shikra-machine-v3-2-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=5347;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=obUsikwJyqhFV7LPD3l0k/H+M5PR6NG+LvOdLQKrmPs=;
 b=Hg6NiIwLjdsbNJKK5ix3TAeDvinG5f5UPM5F2RDEQbaFfkMFAMO8eSmedhqnwHGmB5pETs3ut
 eY6nc8n3lx6BBO1l+/b+cfhIs8OQ3OBBfbObCs1Nx/QJM5V7XH20tQr
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b034561 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oxr950IO28AxyMdDNDgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX4AF8fBHWjaA0
 4w4SwMZ8yBulemVoRskcBYJcHxEC32IAfNMWWY0w26A/thJO83ILSrXNmqFYGz4l+xTvz6+Dn3Q
 ZqRihA7wDrihS04YG3/kSX2ssyDq9Jc=
X-Proofpoint-GUID: cop6jqR10TBo_RVSgLiUal8VFFNvn07C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX+kAq/azS27h6
 3pW5GxmxCAJ3h726KYy+YpekzbyTQHmot9A84u+TWWhxIxxBopmgr0p/YRLI95gN6azQlhUbomh
 VSDWTkTQ2kG/R/0Oav5zwKeUH028OIR8UUdFKbxB1+it4buVk0HyR+KaIZr9doLw+w/Zpws0cgn
 bjpImuwgqq3WQAL0yyBGZKGYXe8gGQDRNAWdl33haosE7+M68NeSaV+nAnUHEBgKFmVn7Sqr5tF
 wYqNvWzZlcsNm5shtlgR7A8dvugA9ILt45spEpXpO74zSffgFgPgTyoqD6IaQQnxd9PLkUmRmDb
 zfWd1KwgQA0EMOcaYJ084mHRV0jcVA89tr/270VHoSCUjXqu0n0O7OqJ2K5LDVAsdXWFeJw95mb
 4Z2qzajugqMwzcyHb7xqZtBax2CI8ff1SBHnlAvuJCPoCDUZgftxsu8dIMcmc+DIV7/Il2yCXfE
 YbJUSVhkf0oWdj3mtwQ==
X-Proofpoint-ORIG-GUID: cop6jqR10TBo_RVSgLiUal8VFFNvn07C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add the remaining sc8280xp machine-driver support needed by Shikra
audio links now that the generic QAIF DAI ID support is upstream.

Allow board data to override the CPU DAI format per DAI, so Shikra CQM
can use DSP_A only for the QAIF TDM speaker backend without changing
the default format for other boards.

Also handle VA_CODEC_DMA_TX_1 as a SoundWire-style capture DAI and
allow Shikra cards to attach BE ops to codec-backed links which are not
described as no_pcm backends.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/common.c   |  1 +
 sound/soc/qcom/sc8280xp.c | 17 ++++++++++++++---
 sound/soc/qcom/sdw.c      |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index af5cacddf67d..77845d43c219 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -426,6 +426,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_1:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			rval = snd_soc_component_set_jack(codec_dai->component,
 							  jack, NULL);
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ac4dfb2c2182..ff8ccd3065eb 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -71,6 +71,7 @@ enum sc8280xp_jack_setup {
 struct sc8280xp_dai_data {
 	unsigned int id;
 	unsigned int mclk_rate;
+	unsigned int cpu_dai_fmt;
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
@@ -91,6 +92,7 @@ struct qcom_snd_soc_common {
 	int num_controls;
 	unsigned int codec_dai_fmt;
 	bool codec_sysclk_set;
+	bool codec_link_be_ops;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
 	bool mi2s_32bit;
@@ -159,6 +161,7 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	struct qcom_snd_tdm_slot_cfg codec_cfg;
 	bool codec_sysclk_set = data->priv->codec_sysclk_set;
 	bool mi2s_bclk_enable = data->priv->mi2s_bclk_enable;
+	unsigned int cpu_dai_fmt = SND_SOC_DAIFMT_BP_FP;
 	int bclk_freq;
 	int ret;
 	int i;
@@ -167,6 +170,8 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (dai_data) {
 		codec_sysclk_set = dai_data->codec_sysclk_set;
 		mi2s_bclk_enable = dai_data->mi2s_bclk_enable;
+		if (dai_data->cpu_dai_fmt)
+			cpu_dai_fmt = dai_data->cpu_dai_fmt;
 	}
 
 	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
@@ -176,7 +181,7 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_cfg.slots)
 		return 0;
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+	ret = snd_soc_dai_set_fmt(cpu_dai, cpu_dai_fmt);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
 
@@ -329,6 +334,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_1:
 		channels->min = 1;
 		break;
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
@@ -388,6 +394,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	bool codec_sysclk_set = data->priv->codec_sysclk_set;
 	bool mi2s_mclk_enable = data->priv->mi2s_mclk_enable;
 	bool mi2s_bclk_enable = data->priv->mi2s_bclk_enable;
+	unsigned int cpu_dai_fmt = SND_SOC_DAIFMT_BP_FP;
 	int mclk_freq;
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 	int ret;
@@ -398,6 +405,8 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		codec_sysclk_set = dai_data->codec_sysclk_set;
 		mi2s_mclk_enable = dai_data->mi2s_mclk_enable;
 		mi2s_bclk_enable = dai_data->mi2s_bclk_enable;
+		if (dai_data->cpu_dai_fmt)
+			cpu_dai_fmt = dai_data->cpu_dai_fmt;
 		if (dai_data->mclk_rate)
 			mclk_freq = dai_data->mclk_rate;
 	}
@@ -408,7 +417,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
-		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		ret = snd_soc_dai_set_fmt(cpu_dai, cpu_dai_fmt);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
 
@@ -540,11 +549,13 @@ static const struct snd_soc_ops sc8280xp_be_ops = {
 
 static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 {
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link;
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 ||
+		    (data->priv->codec_link_be_ops && link->num_codecs > 0)) {
 			link->init = sc8280xp_snd_init;
 			link->exit = sc8280xp_snd_exit;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e19adb7c750b 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -30,6 +30,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case TX_CODEC_DMA_TX_5:
 	case RX_CODEC_DMA_RX_6:
 	case RX_CODEC_DMA_RX_7:
+	case VA_CODEC_DMA_TX_1:
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		return true;
 	default:

-- 
2.34.1

