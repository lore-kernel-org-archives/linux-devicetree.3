Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775876;
	b=jOXCIyhtw/JquKznwZZagknz1UMkyenKh9EGqQ6x19+TMDWzH2XBVspnfKrleQaJoOq1
	 45/CGhBupkVlIYUrtP/YArrUryIlXucXFOzAG2oIRGmuD8ewNLR1wT5DQzO0csDFoq15S
	 xdIaoQPAauT+8gVE6nTdGcyasTwUKdHoZ9wzoSC8HNuBZmVz+24DmaG4CuYMwhdK+kpZi
	 XJZL+v1yq9S7bXrhOB+d6p1q5H5q33sBmhHxrHD96YZVMOdsfJD2ZVQwDXgHDEfmnXTe5
	 rNJEy9wlu4QxlsNriNhh62Y1M6xzkFr9ueGGlllcgUMhhFUUds8CdioLJUxIhHOlLmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
	b=D0Js/cWlgN9oIhvPMRuhPHEdM1b2due5QXtho55UPT3g97fAD4A0MOcEVSXzt30vq0OJ
	 YPzObDuyJTaR7/Vn3fIKHQ+E9R5bq73KH1q++ohfBjBoTtlvLPmClt8ETXsan7YjweePH
	 DkCn5ZVmlLRNURJlIoiVEjuWeqmr//sT+p1/8dhgjBqhY0//tU2/10b/Qgkea+tcQ8bmu
	 vE1xd2RY07fgUAVoP0rS+j863wfgbM3yseNjHcWXxhBESnB0wKbRDfVqKDo94pt6fMQAu
	 sp7Fhhs3EbfUTmQ78z/ojD8PP9OAzHblsKBlZjA/LTh933bmg8rgzMtUVQmo9dVc7DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29960A2628
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE29960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wGR2109267
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y96nUAhjj5t
	w9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=; b=MYtFqQgIRtsZ0dkJlz26pnr2M3N
	WkEJI+rVKFuTa9hN/JI76SlNG2Eo5cSKmLuRlMop/O+4mD8w25ClYTwrrAOzuTPM
	+2ztBDL1gcrm2PCL0zmBy525SEXZ2v1VLCSbmsYykeCgEQ7us50gSt4o4l5/aDPE
	aVZLGCjjtFHSXwpwD5479O+yz0i6wfyAzWOSUZSylccNNlsDDt7J97Kt6TsewMMo
	3QvrI5G4oxnKmxGVWqdUz/7pmmMSnLMXDT1JvXbPedcM0I+aI8W5dEj6YzY+oPlO
	0M6Ckid6xaWnCgdX2QDSD3JXTp9KUwXLyV/L/K2VhAXF8Uq11UmTm/qO8ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4quw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so255409485a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775874; x=1793380674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=aCKEpEInDZPh4M3t+WJ/sUdbK8puztE3Aut2QY6pJDfdpEcAu6zKyB8nr6YUP0MtHw
         Jn8Z9oddus9TI07UgKy9gLqtE230uSzTRUP5TwJA4T8i1QkSkCBPh8zYmIkyfMKyDmy/
         uyR70CsUhe9uLT7v2FpUJPKnwRTYBqYAPFpXpYEkIpxXjNVF3qGUPW++5cvpuNwGXLh2
         2D19NFrnuw6Y18LJwV4iQgALxdm/pwYEiQJL3txx6oMylrLWUqX0i28YrbxI3KByxoEz
         I5awWQVcfFXAH8hpHS6jt1Xxv+04M8ZgHEttnklRl6KdtPTIVm7SCSYOs0VJH5YDRrYN
         9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775874; x=1793380674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=t7Btp0SdWY27f2jkQrShsGdtC2DYc5Z2JSvLICB5cibKwNFff7X9sAQiR/t8MM809e
         uh28qz0tAwrMa54AZVFCOS1kN6n3wMBzrkSntJuFfyI3f8lZxtkIAOJUMg9xg4RFERMv
         3NGUbRBerw/pdGkMrigw+DvitA7gdo0rM379uFqxrappF3bKxZGVUTuhcxqGaZ5WhAsh
         VY+NilPK/UF63T/1KZq2UfgaXag7oYYpRwNdODJ0bY2mW8QzfW6kh0ZOiXcY+FwGnxlR
         wbTBWkelj3FxljRXApOO+0HedFjaTmEurPuus9kMJk+qozMzFD0L/gnm3ogxlnKSbZYz
         71hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGApH8/zu5SIUNdKu7CabKiSWrDF1qgrdRCQ0dOkSYOn/IgmcHNqTGtj6i56AkFgNpcppmF9dlQssc@vger.kernel.org
X-Gm-Message-State: AFq9FYLl2gWPefJyFD5rn+PNYUfOKvRzOkIfYm3y1jaU7GMqdGzxDxvH
	fpEx0mBOVYo+30lkaMIxwc44XPYSvYh39JEeQ8sNEzw098v1AY3J4HTtJXXEo7gdq2XFzN7o1VW
	Q0rDNzVnHxTITKRSHvjRoczkNXnbiAbO57To4IZUoqi2xCX3OWP4cVRF26mocJO6P
X-Gm-Gg: AYBFou1Q878KU3PwjMA7sXjajdF4L98uDJWGWPM6YEVSGTOFH2R7T41b9dZ6aaINJ4p
	m6TS4/CBdlGBXGszfXor2jaYQAAMjIcMIyDXKkIS17j2Mz1kp8m9jyRTQvtco4UlOqnlvUB8+Sj
	02vF+P6ix6WNMVgyShTHLARAQUfVgQ6fTPCRjbO0pD6Bhlx3xV3QMKX8sO4ZPjn813GCF1Eov2j
	cL+CmhilxpF2yz033qK+UkNEWO5BPJxaYy/9Oco0yxpghdBzpWFGuupkTyZdY4gMyWKkrQiYhvu
	01+06aSUJkbXvuFf3k/VLOTFun7QTOXYMon7llwkkKVse0wJbaX5Sr7nmCTevp/cM/zBBwl8WMT
	7BuQaAwRcWVA4
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506243285a.10.1792775873642;
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506235785a.10.1792775872870;
        Fri, 23 Oct 2026 10:17:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:51 -0700 (PDT)
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
Subject: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Fri, 23 Oct 2026 18:14:13 +0100
Message-ID: <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3cdGcrCo5FLS
 gZPZ3ZkE706joujJ7mcS8y86Jod22cs/3ASrXZCsLZIXevSGvy6UywWi7/ziAAs2wFEfwrYd0Yw
 Tzz0O/KQIe14VCO4K9ds3KckGhD8S6raeC7aKELW4wMCM9WxB2OyRRFtQ4nooWRF+7HTFfk5gtk
 XnUDACQDDtJCJ8sE6iUXoEXV51NlWsGwKHe3odv9SoV34rVoPrjTLfXYYlaxsK30AhV/VJW15IU
 V+6c/oBFhYhhrSSKbM4U7hN2ElGisVJUEueSvVtLWb+6YhfYV1cAZfR6HYEAvHD9ZLQeSpPL3h9
 cOpsISQoBYBqJ+205bA7sM09tKEdeP1qqUTtVGjy/H6Rad0vo4AMIfLXQf+EZ33wR0AUIFgxUO9
 QD42hsKcMDJ2EMoZnS8NADKOhiqVSi1MEdPo7y74Tfqclx/TsJllR8a5+pVewk+aic8R1GEsHhD
 c5xVG6TSohAhhsTL8XA==
X-Proofpoint-GUID: DjKuoLONieCX-003ni6VNbnggCO3CARg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0qytMetNVV9Y
 /zfsx4Z3CVRLEkjhoh3to3XNFZ0RPH6+H3XHc0p31y2BWfZ+R1ScOyVzsnRXYoUx1f1i35lSq8c
 bMnUN/N9zx0mF4IL14a8m3Z0pjgIq/o=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb96c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3gksVG7zvlp-C0s-nSsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DjKuoLONieCX-003ni6VNbnggCO3CARg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 236 +++++++++++++++++++++++++++++++++----------
 1 file changed, 183 insertions(+), 53 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e72424ce5cb0 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -8,6 +8,15 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/*
+ * Inline direction check that doesn't require snd_soc_dai_stream_valid
+ * to be exported for module use.
+ */
+static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
+{
+	return snd_soc_dai_pcm_stream_get_i(dai, dir)->channels_min != 0;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +58,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
+				  int dir, const char *cpu_name)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (sdw_dai_has_dir(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +101,125 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!sdw_dai_has_dir(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
+err:
 	sdw_release_stream(sruntime);
-
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream, cpu_dai->name);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1,
+					     cpu_dai->name);
+		if (ret) {
+			struct sdw_stream_runtime *sr;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR_OR_NULL(sr)) {
+					sdw_release_stream(sr);
+					break;
+				}
+			}
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime = NULL;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sruntime = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sruntime) && sruntime)
+			break;
+	}
+	if (!sruntime || IS_ERR(sruntime))
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +227,34 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr = NULL;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR(sr) && sr)
+					break;
+			}
+			if (sr && !IS_ERR(sr)) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -185,11 +278,37 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sr;
 
-	sdw_release_stream(sruntime);
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr)
+		sdw_release_stream(sr);
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr)
+			sdw_release_stream(sr);
+	}
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +316,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.47.3

