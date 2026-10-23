Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775878;
	b=WQ4tKFDSTLi9RkojSQeCefhr2fLX1dVnKT06L4axh8Rt8Aym9QJGwtiUWF7zDFhR/GS0
	 8POOmIbHLPlngQaphNUyCyCmRwbFeVBCSPC2kHtB8E/NDna72ZNxhF5RQNbuOpvvEwE/b
	 rCG5jyH4z1ERNTkKcVJFs8mi1PiYoT1NN5bvBbzU78IWS1co7mwhPUYzntTvY0JaopnRN
	 uUOMS/CUsL9ebtghTwbN2iXyPInzDErkpOWIVap8ApSofHmS6Lmu7vjK+e87BTjrpPLCn
	 fK6epZGDN/fL7QTK/fFCBhd7Mk7qFqYvOHVHJR7CjPjvIW7S2zf2sGhl4gzU7pTYcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
	b=JkcoHtODXEi/glXte5z87XIPSDOgREU6bp8U34sdFd9jorM9KvLnIh9PJU9VP6HcZFNo
	 im4gp++vj0M54ewpgrxjoSTt3EL6vx55lJRIdw8n7FuASBM3CHOJy0uocmkVLDyig1GVU
	 vnxZGIeG1bWYFZh4p0aLIybcTLB+vHVKMeAvYgTaSOp8RJVSUdBIpyOCxKthDPQ7aOwGl
	 1pA8OtvAdeKdWHCdCwrQz1VeDLEtq9nNcoVwGOolVnFn+EdDxYeb3+XF3ZUlOKVQsZaZc
	 3MX0U5X1kYX9SIyv250gFFXbaZVfUB7cqv19rxH9VPU3VvVPeprLE1H0GGEw68mdXCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjcSC9pM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb1w0+UQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615CE60A3809
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 615CE60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjcSC9pM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb1w0+UQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6BPn2999842
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mc65MQMw4xr
	GXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=; b=GjcSC9pMDmucMIlDQm4CwLvI/Im
	9Ruv90rqtgyPeAFpwO2CYepNJ05iPqgj6FPPbX8BukZ54UV7brYQV2nn6ggQqJc7
	eDjOefjfrzlRTPSzKjQrAr8YtzZlatWLQ3dYgfpf3YOVHWwDt4tdg5XnrhOD9WuW
	PluH4WCzm3CAkvjC65gzl2O2l4bXYIJ48oBuxgWvUISAA111x9HZaZmAwq09rOBj
	jA/Rud5DgDnw5W7cifRug9ziN7+ef3/ygYwBDaI1+XikwHIFI6tVAKO09d2xJBc5
	PNP8kWJbUJVribEgxYctNQRqyZatdwSrgm82cnNz85H4w9SC/esuvzmLRPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f568dee56so228742985a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775877; x=1793380677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
        b=hb1w0+UQ4dW0dCltJwkBtRTRmZZO/+EALSzK0FF7kIoRxeKv5mrbVDkQr2bJ9OKwou
         IRNB4M5LJ9k4Th/jscBldPVivobZZJf2ZMXzuonBz1BXqJhhign1QIHhrNhXjvg4PDqF
         zL8nd480dMSshJSic2fX5SzQy8ftg+e0ILo4v2ys4CMVLR8Cayo7GHMDkOGCoW17eCgh
         dBXdbLsYQ+YyHwc3430PZl+BxKO53SZ+eZR5I9X4EYuvdBTImp3lFqN8VCf4NRAqAksU
         umlesJisvhh3zZ4IXFylOHN2E3VH2APemZrY24pDx/3/v3QUSDQsknDOLzqE900E82WF
         UbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775877; x=1793380677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mc65MQMw4xrGXO5XzDfRluJTZ+SQtyxul39YVr3Kh6o=;
        b=fLFBqmXlZbBMUUsY+xqReYx0+YRwlqJD/1y5S3vhLD69B0NvsKyvyZSLsjpANWQ+bi
         ENn2tJ+ei4YcImRPRS8DoPCUUKnhNHvXAcvDX3cGLaYo8YlbQfX/SJ0WqJzSjPgVXwB3
         AzY5ViipMa3SHlz49dhFetvnNple7mr5Xlb4762Kmmtx0GMq0snhLaQ+ag//NI6Qoys3
         hd8pBCUnzZwoIKesXnBkc4cqSexIbOmr2EZUBk3s2Y1YwWcBSQ0d3ldpZ4Yt9To+Uk/w
         IJ266mox7PDYa2jLXKbuDur9/oja2hmtjZqnxt5n2Zv0zQhk9hd2A/NPhIvi0rD1Emhf
         rDzg==
X-Forwarded-Encrypted: i=1; AKwUvBxtpFYeRcjJfDKXPbuCWa/oGYRB8q9Vi36rlrILxD3gKkO9OQclbZUjQ0rSakQ1MAyoF1ls4bg5rZ20@vger.kernel.org
X-Gm-Message-State: AFq9FYKWJ/jnfTx43TwhRW4qNHKyHFxunSMB4tMi8SZArnnFwHyhR4w1
	Pm6PrQzVi7MOmvfKHjUqBtH+FRtsjEjAAGQdZyrRgnBJpoO3AmztQQr1Z9DGFuT+e41bEIMaTrs
	4AtIM6p8ejwOimUmyHAMGJTPS4JU0roTCDMXlCdke09kvMy0DDW1+o4An6EntURnz
X-Gm-Gg: AYBFou0GjK+/WSbUtOjA4jQiQoPHZ7z1/ULUtfHhWnL/F72UapjS2otm/IBsOPa3/o5
	SiwcqAQ70Ixk52r+j+SsuIO298QKxpR5nUWz1q32Panc1VA28/1paPiYDTu80Q7QVs9UUk/0BYD
	I5c5aja5vazMvPaa5VGaiqKuSUbzjAfisUnkPCWHiUj6YhMVMO8kzLUL3SnzjkLe33lFhnCdR7i
	5VLMV38dbaVkSrh1rFiF/m6TcUamBOMvDkXuZaDhY0ucXN0XX3z9CDu6r/XS8TQzB6//AqwFdbN
	zYPLMexE44AHPVmiloCiT4k75FomgmP77xv0DL0Jp5tKoeV14etmFzms3NAfZCPfcvK3LpYlEeY
	aOhDLBXjLYljB
X-Received: by 2002:a05:620a:4542:b0:93d:e031:5ad with SMTP id af79cd13be357-93f6f91e7cfmr459108885a.17.1792775876645;
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93d:e031:5ad with SMTP id af79cd13be357-93f6f91e7cfmr459105885a.17.1792775876111;
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
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
Subject: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
Date: Fri, 23 Oct 2026 18:14:15 +0100
Message-ID: <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzCAHmGQETQo7
 cNLpmketxdyrTgb8l3mpS1DXDJuMVi1P8KX8Hv0cGJskvAMLE8OMX9MvsuyG6u7A6YCnqokuD+I
 tQCnGESx4Zrt1cnFLxkvu5epnVcHKzHYM4TSRvRFpKFK/N/GPLGaWznMURrF5WBABmyjKWGhVhs
 RgqmT14mV2LdmdRkiSfXsSO1IaGie6VjZrtoagtkN/jx9QNly+EOEg4AdH4T/VVg/MLSEnwMOIy
 27YscvYrcrFhI2Eza+bcidlrADa6Zr2PTXmAaZ1wa9qoBf06SrcIc3bUWZcK2wX3m9Q6cUgb6nv
 Qje6yA1lQT26svLn1uv2eVzd1e9bkl08ghOdN5aWfy89qoDjG9ganfRSvoiwkQNe+V/RHFOXXkL
 pf7pp9gsHY/NgZzsuDxLKEthzducI/KgtdEnZzH+spN1CkwJfLluaQWwb+g9g84ONXegzVJdWeG
 XpMcC1PM6hEfoXvhY9Q==
X-Proofpoint-GUID: XHXdquTRU-1ttsuWVMWVLC_h_J7PKw9W
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mD6ITISG3cOiDhduhQgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XHXdquTRU-1ttsuWVMWVLC_h_J7PKw9W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+uH/gBeovUJo
 i9DxtarG4gwbHEW1FzarGPY7gexXAKfh/kPzfIPuxmHvkxuePSaONAmvX8TW8l9xONOYoKWR9U+
 H6OVQ5AbdbBLf766Ne6duvFKLGFhJFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries the voltage and current sense data that DSP
speaker protection needs, but it is described as a sink port next to
the playback ports and has no DAI, so nothing can capture from it.

Make it a source port with its own capture DAI, ops and stream runtime,
and leave it out of the playback port list. sdw_get_slave_dpn_prop()
searches the sink port properties by count, so pack that array densely
now that VI sense is no longer in it.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 90 +++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index acf32af5aae3..fbb9c5773aa5 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -732,8 +732,11 @@ struct wsa884x_priv {
 	struct regulator_bulk_data supplies[WSA884X_SUPPLIES_NUM];
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
@@ -822,8 +825,8 @@ enum wsa884x_mode {
 static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
-static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	[WSA884X_PORT_DAC] = {
+static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS - 1] = {
+	{
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -831,7 +834,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_COMP] = {
+	{
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -839,7 +842,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_BOOST] = {
+	{
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -847,7 +850,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_PBR] = {
+	{
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -855,22 +858,25 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_VISENSE] = {
-		.num = WSA884X_PORT_VISENSE + 1,
+	{
+		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 2,
+		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	},
-	[WSA884X_PORT_CPS] = {
-		.num = WSA884X_PORT_CPS + 1,
+	}
+};
+
+static struct sdw_dpn_prop wsa884x_src_dpn_prop[] = {
+	{
+		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
@@ -892,6 +898,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
+		/* V and I sense pair */
 		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
@@ -1767,6 +1774,27 @@ static const struct snd_soc_component_driver wsa884x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa884x_audio_map),
 };
 
+static int wsa884x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	if (!wsa884x->port_enable[WSA884X_PORT_VISENSE])
+		return 0;
+
+	wsa884x->vi_port_config = wsa884x_pconfig[WSA884X_PORT_VISENSE];
+	wsa884x->vi_sconfig.frame_rate = params_rate(params);
+	wsa884x->vi_sconfig.ch_count = 2;
+	wsa884x->vi_sconfig.bps = 1;
+	wsa884x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa884x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa884x->slave, &wsa884x->vi_sconfig,
+				    &wsa884x->vi_port_config, 1,
+				    wsa884x->vi_sruntime);
+}
+
 static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1776,6 +1804,9 @@ static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa884x->active_ports = 0;
 	for (i = 0; i < WSA884X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA884X_PORT_VISENSE)
+			continue;
 		if (!wsa884x->port_enable[i])
 			continue;
 
@@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		sdw_stream_remove_slave(wsa884x->slave, wsa884x->vi_sruntime);
+	else
+		sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
 
 	return 0;
 }
@@ -1829,11 +1863,20 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	wsa884x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa884x->vi_sruntime = stream;
+	else
+		wsa884x->sruntime = stream;
 
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa884x_vi_dai_ops = {
+	.hw_params = wsa884x_vi_hw_params,
+	.hw_free = wsa884x_hw_free,
+	.set_stream = wsa884x_set_stream,
+};
+
 static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_params = wsa884x_hw_params,
 	.hw_free = wsa884x_hw_free,
@@ -1856,6 +1899,19 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 		},
 		.ops = &wsa884x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA884X_RATES | WSA884X_FRAC_RATES,
+			.formats = WSA884X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa884x_vi_dai_ops,
+	},
 };
 
 static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
@@ -2091,9 +2147,11 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0) & ~BIT(WSA884X_PORT_VISENSE);
+	pdev->prop.source_ports = BIT(WSA884X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa884x_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa884x_reset_deassert(wsa884x);
-- 
2.47.3

