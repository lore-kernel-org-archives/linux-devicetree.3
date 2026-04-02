Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B73A9001
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117519; cv=none; b=tnULpVQemKRt6xCl2USJlJ99t2412H25IS9H3rSDIdyOHlAspEsBOPFOS45V5E3Bc7VdMlBMiTnonX7Gb0Cs4hdnqfG9gcdoCV77nu/L0VNRbIf0ozjP2DOaCVFk5TafkpaNoRE4UCRiaSJyTgxgkpXtHNmUzVHBavfVxL1ycDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117519; c=relaxed/simple;
	bh=DWuvTD8Cw0DUhqpHbWAOgp0+9q9ilBF02Exs71eghWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYoTGnJsuDsIbdsS2E8LjOsm1u6R+MT+uloei14/yQ39jto8Xrpvi75OCrJMSWHqmV2rqNz0ocxIe6Js/AZ/kCtLK6MHRfpF4ph0P+vx2enQY/RhIGZbaoNE8n0Ks2NMmvlA+I3+Ab5WeZIaVrmz6MCNJzs6y3Hcbmnrz0mboXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPW4Zu4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFVIBpho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPW4Zu4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFVIBpho"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327A8Ro3044878
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHHn5cWjpEy
	VxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=; b=fPW4Zu4jMGX5fSuB89qWmVplWE5
	DaZAiNL3+05mBiw/jaBxulYaeXbNgRi9unSdJol1fJeCbjF5u21KAR5kXfirWEJ4
	mCGV59PZWjxSmrL1tbnM6c6d7acV06ivM3kA6vGAfN4ck0SvZaMLWPn31rzl0z2w
	l6BwR4PuJHoK6Q02+YmnEfe1wZPltUgTosN5j7MsHu5RrP+2Amb1/BfGunKNFpYF
	iOEGXm9XQ0Hh7b80XhtgU1su3ub0A1zd1xP5f/J4PSs8hF9XvAi0CN/AMG8o6yzu
	ZtKgOIkbTf3nVINsXzNa+9bGH35kA6xEkS56PgrSw1YmeHCGnqgg27dn0aQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483uurh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so20776831cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117502; x=1775722302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=GFVIBphopyjLJHRl747FL4r2BmRz+/AAt9bjuJQ6Was7/VltlK/R3S3AWxlQqlLnVd
         xd/6hUj6PA1Kg/JpESiXWhP0w5cgCoEFiBZdaw6p5IFHhjZmRQTIpGOhShVk+sIAvOFv
         4lCNo7Mey2BW+UIwYyWMWPozYdV2YWKww4x/y3I1/RPio+Mvq6oXcloej1rGmSzoZO3g
         0brrZfkRPyWQWc2pNaEAup9+1v+3GCktv3atFNA93Se8rNAC8xAbnRa+Uy9/TgqW8AS1
         PsLJ70Nst0+inBo0NgtCi9hMXZ4y3IlXFWVmHQwQOtvu1bUg9jhQ/zjCLQZYq8RUpZhb
         1+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117502; x=1775722302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=IWv/hv3TxEejJ+Eq5s9ArU7eBstivPW22veL3A9OhSPTDzPW0vYK5U9H5USs4YYrhy
         D1Ul0KmLjUIYde2kNFHKrLIqthwlKoErvJAYzXCpk3hUwVwNkxAkKVnLlckf27O2Y/sj
         zbbXinOcl7r2/bbse+pg2PQh6oYY1dVn9YIqhvNwptIQQsZSkEOofyTOy6k4CdoTULya
         LNigi9k2hwPON6+tDuFwpo9Bn4FKgvCkNjR6C7Pb+7i6i+bhysQiGacVUVv+vcu2YCMX
         DhGSih5c4g5w6MAzbrcnCfH203bm+UFk1btSRJC71DcQLJYo0Oyysnh0u4wj0fSq3DF6
         JNGw==
X-Forwarded-Encrypted: i=1; AJvYcCWDB1Es+xwVh/GWksFI/1JDSRfGC+0xXnnxYEozF0ODWKyLooBHgdUU+flk0lrQAwsTn/3JK6c4KIce@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfyt1rDq0lo8HTrEMdgxjENL0I13uGd5Bzyw2rLSwdegq1QTu
	ljlsM0UsapXHGBURvrSQ/vmwDlYdrPL50V23iZE9lF31puH6Qmm/uR8V4leL96Uq3HGz1egr57i
	LlVIv2dcnXHaNuisGURoTtrceiqT+tkUcIyP8Y8Y/3PzfmPL01ITyV1+Zib6nIBd2
X-Gm-Gg: ATEYQzxjGCkWH+6nFEm13m+6uSkecCZkWD8F0yh5nVx3/RZS8/3S0rrYi9S8Lba1IAa
	aWU9ViezB8VoeiWfkUhp2dG4ZLeaMmTOy1vf+eG5Tyd5awTlCkmOyVfTby1iS9R1OXCt+Lvg1sl
	Yc5IDrUEqmiJpvfHDs2C3lipVSqdpj2AJb69p+aKQArdsAbNNkKw+I7mSLl9pieAU/PHbJpOlUd
	TteZ2K1GoSQUstieOCF82hEYu1oK00qfEVXzWhvEZohx+3Qs/30FYN3cFzKTdJbtlAZ1pmDmqdR
	gcCf4Qx2SLv7B8jy1eZie6xv2uetbmXO6JEJHxA/0W1XJuhXN0HPhQ+2yGuSXCHNwVL7k/zBk85
	5RY5Vthd+5sUv9Ps/05pmy/dh8sju67PxG10NqxTUBmMSLI2R/vaedC4=
X-Received: by 2002:a05:622a:835b:b0:50b:3128:9916 with SMTP id d75a77b69052e-50d4fac4c65mr12622701cf.18.1775117502112;
        Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
X-Received: by 2002:a05:622a:835b:b0:50b:3128:9916 with SMTP id d75a77b69052e-50d4fac4c65mr12622571cf.18.1775117501684;
        Thu, 02 Apr 2026 01:11:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:40 -0700 (PDT)
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
Subject: [PATCH v9 09/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Thu,  2 Apr 2026 08:11:14 +0000
Message-ID: <20260402081118.348071-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce24bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yvctMs8w4tAFySAdhFMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXzMEQkKf7Uvu6
 MSuZi3vntekOV9YaPZtm89hnuMMWOwCoUsRzCZOGqqNep2mOLeO7x4wRUgJBnRt5k2yucHsjDUu
 mQnWfslBRWNgWMMxB9Iw2go70KQNCdJLJXqa0PedABkZ2xT0XMxObXLpaAcJDzS5zuUJwaGr5Cp
 evqDNzgF5UjoUNwnV5Vf3exQ5vWULwSXMywDQGSqzQcI8JS3RQclLTdOyoqwhqABaMcsNTza52I
 v6AxqpeFViHTUaE/Aqfj9aiENe2ORQv1Eh89F26wcIap37WobHVJXvjsRN+6w5jDQuOAwo63gl0
 tTRle+5qdr5YT7va8LpU3kCUSeob8bekcjEPI3Yg16A4YB5hRBYjWS9gQaZf0Xytk1ujHJ+NGGh
 PjlqunToz5Tkc/xh/rcvDZb7CBytcaGmz3RhxoCXPvdddytG/uwB3ehp7vz3AuTdgp9z0xPI3Pf
 cx8oVR7aiXCcYdePN5A==
X-Proofpoint-ORIG-GUID: fIhTWWMhYR2ctB_0l80sMyWuENrzI6Vs
X-Proofpoint-GUID: fIhTWWMhYR2ctB_0l80sMyWuENrzI6Vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  8 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..a0d21034a626 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -409,6 +409,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_slim_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].slim);
 		break;
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
@@ -540,6 +541,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
 	{"Quinary MI2S Playback", NULL, "QUIN_MI2S_RX"},
+	{"Senary MI2S Playback", NULL, "SEN_MI2S_RX"},
 
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
@@ -636,6 +638,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
 	{"QUIN_MI2S_TX", NULL, "Quinary MI2S Capture"},
+	{"SEN_MI2S_TX", NULL, "Senary MI2S Capture"},
 
 	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
 	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
@@ -770,6 +773,8 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SEN_MI2S_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SEN_MI2S_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_MI2S_RX", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_MI2S_TX", NULL,
@@ -1037,6 +1042,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 
 		switch (id) {
 		/* MI2S specific properties */
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 			priv = &data->priv[id];
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 43d877322bae..40237267fda0 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,8 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
+#define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
+#define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -718,6 +720,10 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUINARY_MI2S_RX, 1, 1},
 	[QUINARY_MI2S_TX] =   { AFE_PORT_ID_QUINARY_MI2S_TX,
 				QUINARY_MI2S_TX, 0, 1},
+	[SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
+				SENARY_MI2S_RX, 1, 1},
+	[SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
+				SENARY_MI2S_TX, 0, 1},
 	[PRIMARY_TDM_RX_0] =  { AFE_PORT_ID_PRIMARY_TDM_RX,
 				PRIMARY_TDM_RX_0, 1, 1},
 	[PRIMARY_TDM_TX_0] =  { AFE_PORT_ID_PRIMARY_TDM_TX,
@@ -1777,6 +1783,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
 	case AFE_PORT_ID_QUINARY_MI2S_RX:
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
+	case AFE_PORT_ID_SENARY_MI2S_RX:
+	case AFE_PORT_ID_SENARY_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index d31388ed3ccf..e5cd82f77b55 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -519,6 +519,34 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "Senary MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_RX,
+		.name = "SEN_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "Senary MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_TX,
+		.name = "SEN_MI2S_TX",
 	},
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
@@ -680,6 +708,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case SLIMBUS_0_RX ... SLIMBUS_6_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6slim_ops;
 			break;
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-- 
2.47.3

