Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFA4B1B5E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070238; cv=none; b=A+BwjNi6BBNW7lr0jqoaXXMBvyHiI0I05ySddwUF+QVfCnQZrV0ioNC0je5a40tjOItMZRU2h124YegK7P4YiAKSgWs+oqlLHqZDtuRmfwNMOubdPTA0Dajn8C3kqqgyq9WUBihe8kDwpp2hZFjTdg0RWO1y07gM99IrlPBX9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070238; c=relaxed/simple;
	bh=q30YXBk0lp9uzvi7+IZazzmKjc+pg/0bVrW1v/54a9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjsBR7aO2hm11QjpI+HO7hUkY6CfSQXFPnsLTrsNWxfsXPH2Cec8ekUzQA6Z6REbYmySFarYuN6qur4OC9t4EXeb3QlZudBw12f/b5b9Lsg4iZhZCpdvSlH4BtCXcuZr14c1H0ECG/93zGapa5GhahqgOwdg6zDpxOSpipasWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beP9FCKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXLS+she; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beP9FCKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXLS+she"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M75auR3840516
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVjSFYzKeBmXQMgpRMoVBLzy0NQugAXndzv3lAsi6Ak=; b=beP9FCKAMZFU6ij6
	rwmN80PKdeqJ/RWUQ3RXNwSj2ndlGmDNOwi88RjxOfH6+eT2MN/LkWxi4snM+Bnj
	AT/HHFPR0UFVPI3PU5fI4yWl+San4kStEOy8rxGqrXKdotqeeXeb1FO0ZytHLIZN
	LEaQ1SDb6/8lrOs2mofE1k1N45dYJKcs/Jq6vJxQ30/h+Yo+qg2rpv7MAw/nKfY1
	l5iO649PmWaTeVBJpFGRsep0sGLmsVZy/pdJpP+hoxN4I74kvfYOLUZ9GH/CNH+T
	TxUd4TlrnIyfD1c3NIsJUNnvuNRkcO7dLdpUPwI1Z23Z7dl02if0PUFWmeJfB+9Q
	UW3Enw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v53buq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso3354086a12.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070233; x=1790675033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVjSFYzKeBmXQMgpRMoVBLzy0NQugAXndzv3lAsi6Ak=;
        b=MXLS+sheH6fV8+/EesCDGlFX/cG6v9MP6tYqEO9Evbx9hGlabKfoOO+piQxRC/4kc3
         XOVuokDyfCsJD/tPsPNnloQJDDkPcRiSROSybXV504x+wAng8xPMnN3nSgv/jW66Gmnq
         SwLaQATJ/n/jOi0MV74H4hj+hV6p5JUiJ//sRBIoaysCRl+cke1LsPhSfyR2xmmYn2ZS
         JtmzOndRENVB7ISizbuo0EbbStxWihR0pxXAs7EqXvf+wb4/UvZM8Tz6l5dc0Y2SCf1I
         dZJpEKJ1BkmwX5mBuNTN8hS1oMHVfcncSEyI/HKCn8Cbwc/5AM03wRPUU0rLknycjxtr
         vs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070233; x=1790675033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVjSFYzKeBmXQMgpRMoVBLzy0NQugAXndzv3lAsi6Ak=;
        b=DYllOvE1W3LUzPQG8p4RJ0WwLKepaAHItPMuTBeMGDOyXH6/fU9+GLrkmVcHuXIEXi
         ubGTwfdsAqAb5lGCqGjR7FD198O1VpcICYNmPf95n8nGRauu/m05BXUhYpoAmg8fbFnw
         EgWSo1aeNeoxb7+G8Awa3gKySjopQXjl7g2qfFA6bUl57XCNDGcK1XLYQwLg5FThEmDf
         W/Pl48tW/kS1UDT+Ev2iOqAqbfyNRuieTWgoAfteiZ4rLbstOOHpM2huqHzPIj1xv4Rz
         MvJd1IAXLIBFsRyYRkRUcy0w8YDmmuFexZAssr0cML1HGnXHpi2pyocIYL2Hwuqtw7dz
         1JtA==
X-Forwarded-Encrypted: i=1; AKwUvByRmlNeF9nXbudBEK59Pcl+Rm2f4H0KH+gqKVb0wUViASLPWRIlkkTsmfQK04iR+Xt7WYIhk9UiJt4O@vger.kernel.org
X-Gm-Message-State: AFuF++lWI0jnJ43kqTzatklLVDq1QeJ8kP//hofbQQZNRB6ss3tZ/Duv
	0SC6LIQ74/DsbJ47kVJM+0kcMPOwFA2Ml7sus2tpLuQiD1oFm5PvT6yacZ987TLJkO4CZDR+hbG
	ufe1nYbuukRBPP0WGfOqseJLrJUic4OZukQfCAmHq+hc5cP9BO5p3+5fgS0Z0d4xq
X-Gm-Gg: AYBFou05u6d9/OfEDd7OaAltNkOBROsL0chTt00L/srR++XiyEIatibRPW+f7wI0Ung
	lnFeJZIFySwulqI2ZVIdJQQC+XJMAokYFt5h7JxrRIZVwh6d/wADG2S34AKPvzuRAiTGWalOqDK
	WzSsJ4y4UXAM1R/qSmgU9L2yNTyUveF6Kurwyvuw424kJ2F9wFMUubtBee0qdn13YIXj1+h46FH
	CeTGsEXGgyP2Y9u5MZH6g390OOkhe/P/9EXAA8A6fo6wRGCcUTzxY4iB7ePMgBDSrOUWRavI8CK
	3bY+wIV1p4r9EWTMPr7xGJ+/sJEW1c+Iy6PAjsNrSw6hCFz/faEOlDRY124TMyusqWw+8UPbm5A
	G9dXBqYbWpyuHOjmMt18M6a7jU7LzXZJgkYM=
X-Received: by 2002:a05:6a20:d707:b0:3dd:a00a:c5b6 with SMTP id adf61e73a8af0-3ddec7c6914mr717711637.41.1790070232167;
        Tue, 22 Sep 2026 02:43:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d707:b0:3dd:a00a:c5b6 with SMTP id adf61e73a8af0-3ddec7c6914mr717669637.41.1790070231481;
        Tue, 22 Sep 2026 02:43:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:36 +0530
Subject: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070193; l=26121;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=+9+bFWLIOOCezffGo7T1QA40VZCeGk/KylWPF/irggk=;
 b=GlaPaGTgRGRVJHhNTXS0WYI9X2MLHz00osUM7hblXuTCikevR9PS+sbnLmPet+VFEc1XqfKTI
 nMVXAUeWhbFCtrR3MP99xilfzNQls2zJF/Z3kcZyb0+aLKJi9hMdPQp
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: E87GmA2aA9nGhcgKVITDLIMbYfWS0Kev
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab24dd9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zEmg9XRQkxXp2VZXiF0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX7Q2AOFS3o3EN
 rntpDZaDwuu2VoW43khQAYGOZxTqHQD0crNb0ARhV6GNcTs769NbmKIKdbLgjbDxohF97HlvsLJ
 hqD04vfleNmCELNe2kidNcBNo6P1Flg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXwKqLqoezTN8i
 +gw41UNFh+L6ZLpu7USZBwLjcjvYlF5aVdMLw+mR1tMvB5tbMNQTj7mi8xmJE9x6gTbqApj9wN8
 7F/M8JM6oJKaOxWZQG/nRjAz8/XRPFgKRZbRTeYx+6wXdzru2VQpEurmmbc+l2BnaCaOpz4+UzV
 H2GPYhSfeAoi8JYtAR70Lial1tLkGvcjq2TfbZyu/gZ9fuy1mFHclqqZhHnkX5h4WRfASWZH1Sb
 IQ5tJX0kPw3xhBTLBmxFpGiGuQsIharhRK7CCqCsCRfapmQMXfQJXl82hW4TKU2TBncGWYcjbY2
 RPer8mGoAgssWNzqtsbCaYeRA8LgC2EIMcpYD4UFmjix8t7S4GdF4WAAUp+gS6GDV2pfnRWfBA+
 8Ze9M2+XiyaP7cFjzPHSY8OXh5uPbKUhJJXbGoG5aZIkDR+dxgjVGjPJaDvNT+PaQUSiz/GYAKW
 L6p6QnMLpyC7pbZrjFw==
X-Proofpoint-ORIG-GUID: E87GmA2aA9nGhcgKVITDLIMbYfWS0Kev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220139

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
macro with a port-select stage in the SWR microphone input path and an
adaptive filter (ADPT) block.

Add the additional CFG2 mux registers and per-path CFG2 registers to the
register map, extend the maximum register offset to cover the new ADPT
control register, and describe the new v4.0 decimator, SWR microphone,
WSA and port-select mux widgets and their routes.

The ADPT block has to be disabled before a decimator is enabled. This
register only exists on v4.0, so gate the write on a has_adpt flag set
from the match data rather than issuing it unconditionally.

Add the "qcom,hawi-lpass-tx-macro" compatible and its match data to
select the new widgets and routes.

Co-developed-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |   1 +
 sound/soc/codecs/lpass-tx-macro.c     | 442 +++++++++++++++++++++++++++++++++-
 2 files changed, 442 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index b52665b11e35..707b22a6bda6 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -16,6 +16,7 @@ enum lpass_version {
 	LPASS_VER_9_2_0,
 	LPASS_VER_10_0_0,
 	LPASS_VER_11_0_0,
+	LPASS_VER_15_0_0,
 };
 
 enum lpass_codec_version {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 6deaaabe43af..b1eee16e968c 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -67,6 +67,14 @@
 #define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
 #define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
 #define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
+#define CDC_TX_INP_MUX_ADC_MUX0_CFG2	(0x0140)
+#define CDC_TX_INP_MUX_ADC_MUX1_CFG2	(0x0144)
+#define CDC_TX_INP_MUX_ADC_MUX2_CFG2	(0x0148)
+#define CDC_TX_INP_MUX_ADC_MUX3_CFG2	(0x014C)
+#define CDC_TX_INP_MUX_ADC_MUX4_CFG2	(0x0150)
+#define CDC_TX_INP_MUX_ADC_MUX5_CFG2	(0x0154)
+#define CDC_TX_INP_MUX_ADC_MUX6_CFG2	(0x0158)
+#define CDC_TX_INP_MUX_ADC_MUX7_CFG2	(0x015C)
 #define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
 #define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
 #define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
@@ -108,6 +116,16 @@
 #define CDC_TX0_TX_PATH_SEC5		(0x0424)
 #define CDC_TX0_TX_PATH_SEC6		(0x0428)
 #define CDC_TX0_TX_PATH_SEC7		(0x042C)
+#define CDC_TX0_TX_PATH_CFG2		(0x0430)
+#define CDC_TX1_TX_PATH_CFG2		(0x04B0)
+#define CDC_TX2_TX_PATH_CFG2		(0x0530)
+#define CDC_TX3_TX_PATH_CFG2		(0x05B0)
+#define CDC_TX4_TX_PATH_CFG2		(0x0630)
+#define CDC_TX5_TX_PATH_CFG2		(0x06B0)
+#define CDC_TX6_TX_PATH_CFG2		(0x0730)
+#define CDC_TX7_TX_PATH_CFG2		(0x07B0)
+#define CDC_ADPT0_ADPT_CTRL		(0x0800)
+
 #define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
 #define CDC_TX1_TX_PATH_CTL		(0x0480)
 #define CDC_TX1_TX_PATH_CFG0		(0x0484)
@@ -186,7 +204,7 @@
 #define CDC_TX7_TX_PATH_SEC4		(0x07A0)
 #define CDC_TX7_TX_PATH_SEC5		(0x07A4)
 #define CDC_TX7_TX_PATH_SEC6		(0x07A8)
-#define TX_MAX_OFFSET			(0x07A8)
+#define TX_MAX_OFFSET			(CDC_ADPT0_ADPT_CTRL)
 
 #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -258,6 +276,7 @@ struct hpf_work {
 struct tx_macro_data {
 	unsigned int flags;
 	unsigned int ver;
+	bool has_adpt;
 	const struct snd_soc_dapm_widget *extra_widgets;
 	size_t extra_widgets_num;
 	const struct snd_soc_dapm_route *extra_routes;
@@ -327,6 +346,14 @@ static struct reg_default tx_defaults[] = {
 	{ CDC_TX_INP_MUX_ADC_MUX6_CFG1, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX7_CFG0, 0x00},
 	{ CDC_TX_INP_MUX_ADC_MUX7_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX0_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX1_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX2_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX3_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX4_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX5_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX6_CFG2, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX7_CFG2, 0x00},
 	{ CDC_TX_ANC0_CLK_RESET_CTL, 0x00},
 	{ CDC_TX_ANC0_MODE_1_CTL, 0x00},
 	{ CDC_TX_ANC0_MODE_2_CTL, 0x00},
@@ -432,6 +459,15 @@ static struct reg_default tx_defaults[] = {
 	{ CDC_TX7_TX_PATH_SEC4, 0x20},
 	{ CDC_TX7_TX_PATH_SEC5, 0x00},
 	{ CDC_TX7_TX_PATH_SEC6, 0x00},
+	{ CDC_TX0_TX_PATH_CFG2, 0x03},
+	{ CDC_TX1_TX_PATH_CFG2, 0x03},
+	{ CDC_TX2_TX_PATH_CFG2, 0x03},
+	{ CDC_TX3_TX_PATH_CFG2, 0x03},
+	{ CDC_TX4_TX_PATH_CFG2, 0x03},
+	{ CDC_TX5_TX_PATH_CFG2, 0x03},
+	{ CDC_TX6_TX_PATH_CFG2, 0x03},
+	{ CDC_TX7_TX_PATH_CFG2, 0x03},
+	{ CDC_ADPT0_ADPT_CTRL, 0x00},
 };
 
 static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
@@ -502,6 +538,14 @@ static bool tx_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_TX_INP_MUX_ADC_MUX6_CFG1:
 	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
 	case CDC_TX_INP_MUX_ADC_MUX7_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX0_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX1_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX2_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX3_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX4_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX5_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX6_CFG2:
+	case CDC_TX_INP_MUX_ADC_MUX7_CFG2:
 	case CDC_TX0_TX_PATH_CTL:
 	case CDC_TX0_TX_PATH_CFG0:
 	case CDC_TX0_TX_PATH_CFG1:
@@ -591,6 +635,15 @@ static bool tx_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_TX7_TX_PATH_SEC4:
 	case CDC_TX7_TX_PATH_SEC5:
 	case CDC_TX7_TX_PATH_SEC6:
+	case CDC_TX0_TX_PATH_CFG2:
+	case CDC_TX1_TX_PATH_CFG2:
+	case CDC_TX2_TX_PATH_CFG2:
+	case CDC_TX3_TX_PATH_CFG2:
+	case CDC_TX4_TX_PATH_CFG2:
+	case CDC_TX5_TX_PATH_CFG2:
+	case CDC_TX6_TX_PATH_CFG2:
+	case CDC_TX7_TX_PATH_CFG2:
+	case CDC_ADPT0_ADPT_CTRL:
 		return true;
 	}
 
@@ -929,6 +982,9 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable the ADPT block before enabling the decimator */
+		if (tx->data->has_adpt)
+			snd_soc_component_write_field(component, CDC_ADPT0_ADPT_CTRL, 0xFF, 0x0);
 		adc_mux_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
 		if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
 			adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(decimator);
@@ -2027,6 +2083,377 @@ static const struct snd_soc_dapm_route tx_audio_map_v9_2[] = {
 	{"TX SMIC MUX7", "SWR_MIC11", "TX SWR_INPUT11"},
 };
 
+static const char * const adc_mux_text_v9_3[] = {
+	"MSM_DMIC", "SWR_MIC", "ANC_FB_TUNE1", "RX_SWR_MIC"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_dec0_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX0_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec1_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX1_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec2_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX2_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec3_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX3_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec4_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX4_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec5_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX5_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec6_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX6_CFG1,
+			0, adc_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_dec7_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX7_CFG1,
+			0, adc_mux_text_v9_3);
+
+static const struct snd_kcontrol_new tx_dec0_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec0", tx_dec0_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec1_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec1", tx_dec1_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec2_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec2", tx_dec2_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec3_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec3", tx_dec3_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec4_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec4", tx_dec4_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec5_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec5", tx_dec5_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec6_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec6", tx_dec6_enum_v9_3);
+static const struct snd_kcontrol_new tx_dec7_mux_v9_3 =
+	SOC_DAPM_ENUM("tx_dec7", tx_dec7_enum_v9_3);
+
+static const char * const smic_mux_text_v9_3[] = {
+	"ZERO", "SWR_MIC0", "SWR_MIC1", "SWR_MIC2", "SWR_MIC3",
+	"SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7",
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_smic0_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic1_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic2_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic3_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic4_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic5_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic6_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
+			0, smic_mux_text_v9_3);
+static SOC_ENUM_SINGLE_DECL(tx_smic7_enum_v9_3, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
+			0, smic_mux_text_v9_3);
+
+static const struct snd_kcontrol_new tx_smic0_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic0",
+			tx_smic0_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic1_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic1",
+			tx_smic1_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic2_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic2",
+			tx_smic2_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic3_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic3",
+			tx_smic3_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic4_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic4",
+			tx_smic4_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic5_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic5",
+			tx_smic5_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic6_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic6",
+			tx_smic6_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic7_mux_v9_3 = SOC_DAPM_ENUM_EXT("tx_smic7",
+			tx_smic7_enum_v9_3, snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+
+static const char * const tx_wsa_mux_text[] = {
+	"NO_WSA", "WSA1", "WSA2", "WSA3", "WSA4"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG1,
+			4, tx_wsa_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_wsa_mux7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG1,
+			4, tx_wsa_mux_text);
+
+static const struct snd_kcontrol_new tx_wsa_mux0_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux0", tx_wsa_mux0_enum);
+static const struct snd_kcontrol_new tx_wsa_mux1_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux1", tx_wsa_mux1_enum);
+static const struct snd_kcontrol_new tx_wsa_mux2_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux2", tx_wsa_mux2_enum);
+static const struct snd_kcontrol_new tx_wsa_mux3_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux3", tx_wsa_mux3_enum);
+static const struct snd_kcontrol_new tx_wsa_mux4_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux4", tx_wsa_mux4_enum);
+static const struct snd_kcontrol_new tx_wsa_mux5_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux5", tx_wsa_mux5_enum);
+static const struct snd_kcontrol_new tx_wsa_mux6_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux6", tx_wsa_mux6_enum);
+static const struct snd_kcontrol_new tx_wsa_mux7_mux =
+	SOC_DAPM_ENUM("tx_wsa_mux7", tx_wsa_mux7_enum);
+
+static const char * const tx_psel_mux_text[] = {
+	"PORT0", "PORT1", "PORT2", "PORT3", "PORT4"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG2,
+			0, tx_psel_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_psel_mux7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG2,
+			0, tx_psel_mux_text);
+
+static const struct snd_kcontrol_new tx_psel_mux0_mux =
+	SOC_DAPM_ENUM("tx_psel_mux0", tx_psel_mux0_enum);
+static const struct snd_kcontrol_new tx_psel_mux1_mux =
+	SOC_DAPM_ENUM("tx_psel_mux1", tx_psel_mux1_enum);
+static const struct snd_kcontrol_new tx_psel_mux2_mux =
+	SOC_DAPM_ENUM("tx_psel_mux2", tx_psel_mux2_enum);
+static const struct snd_kcontrol_new tx_psel_mux3_mux =
+	SOC_DAPM_ENUM("tx_psel_mux3", tx_psel_mux3_enum);
+static const struct snd_kcontrol_new tx_psel_mux4_mux =
+	SOC_DAPM_ENUM("tx_psel_mux4", tx_psel_mux4_enum);
+static const struct snd_kcontrol_new tx_psel_mux5_mux =
+	SOC_DAPM_ENUM("tx_psel_mux5", tx_psel_mux5_enum);
+static const struct snd_kcontrol_new tx_psel_mux6_mux =
+	SOC_DAPM_ENUM("tx_psel_mux6", tx_psel_mux6_enum);
+static const struct snd_kcontrol_new tx_psel_mux7_mux =
+	SOC_DAPM_ENUM("tx_psel_mux7", tx_psel_mux7_enum);
+
+static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] = {
+	SND_SOC_DAPM_MUX("TX DEC0 MUX", SND_SOC_NOPM, 0, 0, &tx_dec0_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC1 MUX", SND_SOC_NOPM, 0, 0, &tx_dec1_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC2 MUX", SND_SOC_NOPM, 0, 0, &tx_dec2_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC3 MUX", SND_SOC_NOPM, 0, 0, &tx_dec3_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC4 MUX", SND_SOC_NOPM, 0, 0, &tx_dec4_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC5 MUX", SND_SOC_NOPM, 0, 0, &tx_dec5_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC6 MUX", SND_SOC_NOPM, 0, 0, &tx_dec6_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX DEC7 MUX", SND_SOC_NOPM, 0, 0, &tx_dec7_mux_v9_3),
+
+	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux_v9_3),
+	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux_v9_3),
+
+	SND_SOC_DAPM_MUX("TX WSA MUX0", SND_SOC_NOPM, 0, 0, &tx_wsa_mux0_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX1", SND_SOC_NOPM, 0, 0, &tx_wsa_mux1_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX2", SND_SOC_NOPM, 0, 0, &tx_wsa_mux2_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX3", SND_SOC_NOPM, 0, 0, &tx_wsa_mux3_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX4", SND_SOC_NOPM, 0, 0, &tx_wsa_mux4_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX5", SND_SOC_NOPM, 0, 0, &tx_wsa_mux5_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX6", SND_SOC_NOPM, 0, 0, &tx_wsa_mux6_mux),
+	SND_SOC_DAPM_MUX("TX WSA MUX7", SND_SOC_NOPM, 0, 0, &tx_wsa_mux7_mux),
+
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX0", SND_SOC_NOPM, 0, 0, &tx_psel_mux0_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX1", SND_SOC_NOPM, 0, 0, &tx_psel_mux1_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX2", SND_SOC_NOPM, 0, 0, &tx_psel_mux2_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX3", SND_SOC_NOPM, 0, 0, &tx_psel_mux3_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX4", SND_SOC_NOPM, 0, 0, &tx_psel_mux4_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX5", SND_SOC_NOPM, 0, 0, &tx_psel_mux5_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX6", SND_SOC_NOPM, 0, 0, &tx_psel_mux6_mux),
+	SND_SOC_DAPM_MUX("TX PORT SEL MUX7", SND_SOC_NOPM, 0, 0, &tx_psel_mux7_mux),
+
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT"),
+};
+
+static const struct snd_soc_dapm_route tx_audio_map_v15[] = {
+	/* DEC0 */
+	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},
+	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX0", "SWR_MIC0", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC1", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC2", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC3", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC4", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC5", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC6", "TX WSA MUX0"},
+	{"TX SMIC MUX0", "SWR_MIC7", "TX WSA MUX0"},
+	{"TX WSA MUX0", "NO_WSA", "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA1",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA2",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA3",   "TX PORT SEL MUX0"},
+	{"TX WSA MUX0", "WSA4",   "TX PORT SEL MUX0"},
+	{"TX PORT SEL MUX0", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX0", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC1 */
+	{"TX DEC1 MUX", "SWR_MIC", "TX SMIC MUX1"},
+	{"TX SMIC MUX1", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX1", "SWR_MIC0", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC1", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC2", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC3", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC4", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC5", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC6", "TX WSA MUX1"},
+	{"TX SMIC MUX1", "SWR_MIC7", "TX WSA MUX1"},
+	{"TX WSA MUX1", "NO_WSA", "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA1",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA2",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA3",   "TX PORT SEL MUX1"},
+	{"TX WSA MUX1", "WSA4",   "TX PORT SEL MUX1"},
+	{"TX PORT SEL MUX1", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX1", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC2 */
+	{"TX DEC2 MUX", "SWR_MIC", "TX SMIC MUX2"},
+	{"TX SMIC MUX2", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX2", "SWR_MIC0", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC1", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC2", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC3", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC4", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC5", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC6", "TX WSA MUX2"},
+	{"TX SMIC MUX2", "SWR_MIC7", "TX WSA MUX2"},
+	{"TX WSA MUX2", "NO_WSA", "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA1",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA2",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA3",   "TX PORT SEL MUX2"},
+	{"TX WSA MUX2", "WSA4",   "TX PORT SEL MUX2"},
+	{"TX PORT SEL MUX2", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX2", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC3 */
+	{"TX DEC3 MUX", "SWR_MIC", "TX SMIC MUX3"},
+	{"TX SMIC MUX3", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX3", "SWR_MIC0", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC1", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC2", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC3", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC4", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC5", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC6", "TX WSA MUX3"},
+	{"TX SMIC MUX3", "SWR_MIC7", "TX WSA MUX3"},
+	{"TX WSA MUX3", "NO_WSA", "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA1",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA2",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA3",   "TX PORT SEL MUX3"},
+	{"TX WSA MUX3", "WSA4",   "TX PORT SEL MUX3"},
+	{"TX PORT SEL MUX3", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX3", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC4 */
+	{"TX DEC4 MUX", "SWR_MIC", "TX SMIC MUX4"},
+	{"TX SMIC MUX4", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX4", "SWR_MIC0", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC1", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC2", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC3", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC4", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC5", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC6", "TX WSA MUX4"},
+	{"TX SMIC MUX4", "SWR_MIC7", "TX WSA MUX4"},
+	{"TX WSA MUX4", "NO_WSA", "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA1",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA2",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA3",   "TX PORT SEL MUX4"},
+	{"TX WSA MUX4", "WSA4",   "TX PORT SEL MUX4"},
+	{"TX PORT SEL MUX4", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX4", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC5 */
+	{"TX DEC5 MUX", "SWR_MIC", "TX SMIC MUX5"},
+	{"TX SMIC MUX5", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX5", "SWR_MIC0", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC1", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC2", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC3", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC4", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC5", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC6", "TX WSA MUX5"},
+	{"TX SMIC MUX5", "SWR_MIC7", "TX WSA MUX5"},
+	{"TX WSA MUX5", "NO_WSA", "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA1",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA2",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA3",   "TX PORT SEL MUX5"},
+	{"TX WSA MUX5", "WSA4",   "TX PORT SEL MUX5"},
+	{"TX PORT SEL MUX5", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX5", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC6 */
+	{"TX DEC6 MUX", "SWR_MIC", "TX SMIC MUX6"},
+	{"TX SMIC MUX6", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX6", "SWR_MIC0", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC1", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC2", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC3", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC4", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC5", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC6", "TX WSA MUX6"},
+	{"TX SMIC MUX6", "SWR_MIC7", "TX WSA MUX6"},
+	{"TX WSA MUX6", "NO_WSA", "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA1",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA2",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA3",   "TX PORT SEL MUX6"},
+	{"TX WSA MUX6", "WSA4",   "TX PORT SEL MUX6"},
+	{"TX PORT SEL MUX6", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX6", "PORT4", "TX SWR_INPUT"},
+
+	/* DEC7 */
+	{"TX DEC7 MUX", "SWR_MIC", "TX SMIC MUX7"},
+	{"TX SMIC MUX7", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX7", "SWR_MIC0", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC1", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC2", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC3", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC4", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC5", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC6", "TX WSA MUX7"},
+	{"TX SMIC MUX7", "SWR_MIC7", "TX WSA MUX7"},
+	{"TX WSA MUX7", "NO_WSA", "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA1",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA2",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA3",   "TX PORT SEL MUX7"},
+	{"TX WSA MUX7", "WSA4",   "TX PORT SEL MUX7"},
+	{"TX PORT SEL MUX7", "PORT0", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT1", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT2", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT3", "TX SWR_INPUT"},
+	{"TX PORT SEL MUX7", "PORT4", "TX SWR_INPUT"},
+};
+
 static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
 			  CDC_TX0_TX_VOL_CTL,
@@ -2477,6 +2904,16 @@ static const struct tx_macro_data lpass_ver_11 = {
 	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
+static const struct tx_macro_data lpass_ver_15 = {
+	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
+	.ver			= LPASS_VER_15_0_0,
+	.has_adpt		= true,
+	.extra_widgets		= tx_macro_dapm_widgets_v15,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v15),
+	.extra_routes		= tx_audio_map_v15,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v15),
+};
+
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
 		/*
@@ -2499,6 +2936,9 @@ static const struct of_device_id tx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sm8550-lpass-tx-macro",
 		.data = &lpass_ver_11,
+	}, {
+		.compatible = "qcom,hawi-lpass-tx-macro",
+		.data = &lpass_ver_15,
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-tx-macro",
 		/*

-- 
2.34.1

