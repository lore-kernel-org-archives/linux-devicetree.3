Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1D49DB90
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052598; cv=none; b=khNKsU9qxGG/tjc1zUQLdyBvPTD9XWIdTyTtHRmy5kX8COBqyvirFj7OZaHwNA1xaS14NKMQm6HvlbLrQCrQBMLe1O/kz3T53qaFMmJLpc6mSZXdHjwAFH2eBjtvtJgx93MmQB+rMuEDLUasE10zupB+o0S++zm30Du3dXXQCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052598; c=relaxed/simple;
	bh=fa/y86gJb3ZXbdqQ9LLgPTjgpebbvibPtDfTyIpyeRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiizDQapF/a8BmcsUzwMrwPqkG68HaVbJ1z3buFaHjJzXL5TXWntMqpQOALGwah9XoihACpFE+RzdCpAhJgWN5OKTGOlc16w+0g2B8mGdcb9MkzIhFtkQoifIkUpTmlWwkpagleY/0UT2yc7lNVxK+8GH0pfZBSR2xPkk0OAaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnIdsC2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yl1NYCvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnIdsC2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yl1NYCvL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADc8iT1068020
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=; b=UnIdsC2IuGeC9kAJ
	JIuaj8rteAfoZ0MIO5uEVBDVJn4mD/EDQBnegLS+ewJJNwYFYek7DMS1M9ZSbTgp
	zWiO1iPt3UiQB4hR9BpMRbOSV/D4B/mR51MGzCHWPjrLoZk08hlGh+I6rSHEnwvB
	A0MaqpB9eK+5vpNhppFU1eOBEj6OOQ5sQl3YKXK1wBd3Ct9S6ZQkY7RWGMg41zxp
	hhvELklPWaqxs/Ye09ja7m6BVNnOW24VCSnu6cljObMYeP9c8T3m5XYLOfpkSnFI
	QtUYKTG0syF6pPQcXVQBzpmwoZb5XeFv0oNTrm6zze54C6oDO23nkwnvD60yKS/m
	IlRwhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8hh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86ab8302b54so250922b3a.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052595; x=1789657395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=Yl1NYCvLrL6FliwlzA+RtyQDu4u2TMSU/qrQvXnmJo3DYQo9LNw01zOg3wp1yOFCy3
         XG0wZgEGP6REq+HHmQD6AjUM/wZPGF2jFSFXbSGvhsVzTvL1cyYdYqwSWfuuFoVXbaNm
         3WJ+8FagGL/jcLMvvJ0E1EMRLzsJU5MY88mGs90X1nbCGnYp9J1byL5FzE0MwimazyGE
         Lvdkk0ooX2j0ErBhkL5zS/0MGkpx9SLef3WQ+FPevbtuM6o9B9F5FE8BUsspNIBq5iKD
         RwI0TChXXDWrf6k2HwhxPnOBkxT/CtkmMBnohmt97XMptdrozAo07JPCEDu/4gL3INxC
         mDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052595; x=1789657395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=WpHmArmbIYtu+8YD16c+KmG4HLTfuLDz0OJonUmuGHQksrkTndnbNEFAgSV3tpvabW
         dBA1F2Z2GrYb3eROwrbAVlqJBHtNeByI78x7yc6lNeK5oViLMOXXJrVOAcDjWiyouoLC
         DhEmX7UdZbhfRufsu/sMcD3LJOtN6GLzmLy4PZoFRofujy3300ohB1U6uhP9zFrSi+RM
         g98HWACjet2h15Ej3dBm+HTiLRQSBIlQPly5IsJhy++gAtkvcGAK2Tp+PlqBTe1LYW3d
         EtDrwQD9/LB5tsFXZ3HHmI2y8na+9m7VBXds7K7HZvXUMXxl/uj3nqTTk/bV3D4PxB6D
         7zcw==
X-Forwarded-Encrypted: i=1; AKwUvByrY9F0I9QAS+2sk+85aW64Uw25No5RwV0kFW85h4YZwB1stvV5mqCaLC/wFNABPYFWP90d31HfkpCP@vger.kernel.org
X-Gm-Message-State: AFuF++lKkItMF3bvnmAcB7MyiVkI1TfSCK7xWJNad9NRPQUqtUVzapbl
	WspDqXvmiKd0vRXEQHXYxwslbPtZ/hgduBz/TOfMjPWk1xxL96p2bmnUKC7ujEUPDxxrRv6oJKd
	XLO4Lu1R5+tiuSIcVSqb7eA6O9a54tMWm3jgVeZe/afDtnumafcDi85GaHElLRExv
X-Gm-Gg: AYBFou1Yf3xxZdJbSTDdUcBFDaHrNV+P/T/3wK840b84CarjD/8f0Tj8LZ/XxPYfPQn
	3rJAmwpkvK5uKeEfbdGkFDqLyrKGBN5Y81q/ZWhEj6QgKUyCamSSrmbi/egT+tx6mGXBqQRXqbe
	Ob1NgvS0OBt+5p//EGkaa4zA0RjxtGqjJRuiQTGyT/MJXknUBVDdgYjUuUS90Kc1Ht0aDFHIjsi
	zryMAckQr9OK1o7LLpO/KVZrwjRWHPZ8L4yVyY0hDp80fo9Ofd5eBqq0HUlGX0B8ozGBZceJDjj
	F9MM/HKjuAWwD5zK95aiOcFKV2gQEs0CqLq2UXJrZOVdyWTVO9yqc822aG6ytuuK74sCZvlo87+
	+aNpum0wiA7svwzuj+KWrlJlc7XCj
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320330b3a.4.1789052594060;
        Thu, 10 Sep 2026 08:03:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320019b3a.4.1789052592419;
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:39 +0530
Subject: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c6b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y6OeQYGgH-sQqnr-fK4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX87pCvKNmknEw
 hVsoRhVZ01wSwVoENhEGA1QxvP0+ZNZ/E/IJjDFVpkOCxHExX4OnKBgTViCO0y700YzowrCxj61
 x+swXiXZfAIieW1iySg/bSdJiQ3Mwpg=
X-Proofpoint-ORIG-GUID: w1sNgWZunmdgdfXektbPkUA-DDF402QO
X-Proofpoint-GUID: w1sNgWZunmdgdfXektbPkUA-DDF402QO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX4YitGhf9xqqj
 UiLXuTcrvgFadrygu3ZgqA8dTp+E0bfQuD+a3uco7nfxIKwX3Cpm0bsJN/eE7LMBqdYSFXM/5ym
 e7suQ3QsHiUOZTLaW7Qb1kfhyb6KQxBDY8/xxNzOoggpKWZBRPZGm2YlYG+wRiVjqEXWZmN/V+k
 wpUiKqzHraYFxcx5/tOrgF4jdMjur10vXe0SOBQm/0mo90FRPM2c6S05uJKExpV8AYUSMytTk3/
 4PUiPogGFJaUgXVYxlIYQbjy4wnwhokLhLxxscHTmE1uNa7kg9UERMFAxvZZYd3NGA0jybdnTZQ
 Z/el/5bah9stxd8KRO08v5nLkxhBboy86wYd+EcluimNy5ncdEt4HZmHoypTXVsIUmWjwatThvd
 D0MNQoVLZ3rRZJcIeVW9BL1NGzIf1U28oTcoOFXx1bP45GjacszZ8NSXzSEEv6onmDrCDc/LxBT
 BXm+WOkzKDa8yq+LhEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Prepare the sc8280xp machine driver for Shikra EVK variants that use
Audio-IF (QAIF) based backends:

- Add a `cpu_dai_fmt` field in qcom_snd_soc_common so that boards can
  override the default SND_SOC_DAIFMT_BP_FP for MI2S and TDM paths.

- Handle the QAIF MI2S (AIF_MI2S_RX_0 ... AIF_MI2S_TX_12) and QAIF TDM
  (AIF_TDM_RX_0 ... AIF_TDM_TX_12) DAI ID ranges in
  sc8280xp_snd_hw_params() so that format and clock setup applies to
  QAIF backends.

- Add VA_CODEC_DMA_TX_1 to qcom_snd_is_sdw_dai() and
  sc8280xp_be_hw_params_fixup() so that the VA codec DMA path is
  recognised as a SoundWire DAI.

- Widen the sc8280xp_add_be_ops() link filter to also cover links
  with codecs (num_codecs > 0), since QAIF FE+BE links are not
  marked with no_pcm = 1.

No functional change for existing platforms.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 30 +++++++++++++++++++++++-------
 sound/soc/qcom/sdw.c      |  1 +
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..452296a9e67d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
 	const struct snd_kcontrol_new *controls;
 	int num_controls;
 	unsigned int codec_dai_fmt;
+	unsigned int cpu_dai_fmt;
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
@@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_cfg.slots)
 		return 0;
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-	if (ret && ret != -ENOTSUPP)
-		return ret;
+	if (data->priv->cpu_dai_fmt) {
+		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	} else {
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	}
 
 	if (data->priv->codec_dai_fmt) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_1:
 		channels->min = 1;
 		break;
 	default:
@@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		if (ret && ret != -ENOTSUPP)
-			return ret;
+	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
+		if (data->priv->cpu_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		} else {
+			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
 
 		if (data->priv->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
@@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
@@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
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

