Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775885;
	b=XG/wxemzGaqJ3ffvuM/yB0/wujUedIDIxpLO4sP0bN98gAwTdwKuKzuv5e4FAORIgk35
	 wkvPbZvEfWlerCfdXmVhFVjr9K+16bNGk+Eta9pYE20x/kkjtZIVo/IvceyoERDXsif5Z
	 e6nERNxF8BBEIgkgl/5hyJwABtIOm2WZbr7vfz7xhhv7B9zTK6R0YJLJMUBiejTbdKfUM
	 SYhC3mtJhlxme87xCzKMrRwcBSifZyyqauV8/d6s0cEUkyZ059RW1ER6tUjOgCF54g0Zr
	 mcFpIj/9vRDl1BwFs6vQs7qg1YnQixcReSeKzR9j9cLZGzbUtw682PMBncqFALvKDQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
	b=lJxkwan5TnatkWBhUlIxj/a/RN41yFQx1zZ/yieV4oxSOCuGUrQdZsoD/raVChOKNWAF
	 GiqNxsGrF0ZHMXV2dj8g2qg7T/dPraAg/lZ7VI+2Z6GqBb/gOTV0QV93cA2jMXqKnu+68
	 BtZFQczlqsZwiPQkVFhxXNAlbCS2XJ/SXlJu4ZrRLhMF1LGd1zkzVuV7NjVyVvTaiwWTL
	 c4/APkI1A9DSjAQzzYeNNvmyEEam/wEYCT7LRuXucP2f8U2RP4xDi1wmZm4rIQIkJgZXh
	 R5kqFVYOTqzkvnCBZ2HR96Ls5Ay0N0yFn2w4H9p8GulKyoGCn0xrA0HIMqd3T4VbQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yvstzu/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693C60A5BCA
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B693C60A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvstzu/p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6NSu3000254
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q/+cvFopqQv
	28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=; b=Yvstzu/pqS6uvyJ8PgFi+yd3AqI
	oHEjJwvjti+d+C/OTu9fcHwsIOxBK0U2viS0KmJL0xaXFhovRwCU2w0mTi/J5dN1
	O6sNIDsQAjB2ZX/FxqErUVFgBS2Kr/n7Y4mdzS50Gtk+4iC+hZ+DWXIjX0kGRMKk
	QONX7Mw7yI1vOu7b/QyMRgk5EAnIGI6JPhaYSZJIBvBjLasmLa+XZFKz8j3q81b2
	TgkSvgCwqL3wMT8oS5W2J36CDeYM34nTmPRKJebcdY+RZaMweLLQjhhNfuBVsBFl
	17HxkNFF/+e1qn+rnHu29CUdP1aCX9nsK5uG1h8BMT/dCFD4F/MifQsiKQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so213657885a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775883; x=1793380683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=SjqJq5lfTS/Srt505f3ZfyPSqDR7WSW77k2dFjdOup4Vv2ghDfXcSK6eEUjelIEXVL
         urEVd86oJGxqj8TG0fBiAPr4C4JturZ/+wxoul8YEVR5f5VWswFTfLRIELYGVfoGapHs
         FYOesTEprzyl+SVcO1DAnOfpIhrCx4xWjCujfAZPRI+2U+PzHpXKFEV2uQPUIO1+bTkX
         k2izfHjBM8W4lpGxhDfQrhN/Z+FSHz4GjBy/fh3EM7k5r4E++jCR1Qtq3/kg2M1ZzU4O
         GuXObV/L/N4tVsGvtCX42LZRFWMA+CBLmva4cmahJCh86WUhDGb0JoHH1is8XwiPUyXk
         oyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775883; x=1793380683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=1BTaCU2uXtEy0YPtEbtzTSRsrXcC4DU41sHtDLbrORZj+BatshBxj1Z7cCdUtKp8Al
         03z+wAND4AjPBvnrwy4579ry4e9HU00ZMIHGJRoqKTK8qh1sgdeyg/wOq1QTeJOP2+e+
         pzWVzdiID41vrfrSMossbVuWwlCb8Hfj+EfcX7tbGjBIu5F9vLGWNcTQPm7WPdqK7gnR
         cR24PU7wISviYxkYgkhliEunqepJlZSl8vKXz+UERwJUFHElWYsRK22N1Gubz+n6TwLJ
         mzQgyuIYmPgee1L3gdyhs6f1cPK1qeselpFMNKgO9346G1Wyydtk1Ia2asAj0NLXOUNy
         affg==
X-Forwarded-Encrypted: i=1; AKwUvByeUNbAt/S5Nd6c556t89K6HPfQnTfNWKHmf+W44y3KC00OnVq1JvPSJEXj5nPcL1GnPdyCqJPx3iOd@vger.kernel.org
X-Gm-Message-State: AFq9FYLCMJzSlYVfA6NkBuI2eGNNpmYSSKCnIochoK+AyfQPq704vx00
	LwCDJ9FTu+x1zRDEnXhpnK+VqdfluvdFipMm9ZD4GzBZGHlNW0ytO/qTrDXUTpwcvmkSkX1sb2+
	DKG0z4ddZ+5Gww/FNCzBliQLDQ+1adyn3+Scz4qWAaxOoJ8GE1N/b01+aUhchXpJq
X-Gm-Gg: AYBFou2GwiBm9JYiSCnudm09a5PjGvhjH+5eOa34zG4IJItbZ6wkNgqL2QqdYrz+NMy
	yhUW4jZeOrgYLEKTdBiX0/VuXfNa+jwFBg25QG+E/OVJAcV+eJyNMLSaLmaNepsbRfTyu+H2cSy
	J7tMe07DMIlC2i7BbzemOZU7V9z1bE7ZEFUZ2GoZChBu0CgEJ+i/LKr2H+hPLACJvbdD8nP5/ih
	GVoY5zQvD5BZJcX+vEy2B8bqr+Gnri4oTaRwl2r6PmgqX+mUnmJ0R56hkB9moDjlSyoHQtiQkWz
	ARTumfBxSPwG2cfDIk6llVQ0fR/bbXlouZ2RdmK1v+iKuWfyxtNaPSEzW89qWeHkdPtx+ApBMNH
	nk1AA0BWy23bS
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554390085a.23.1792775883169;
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554386285a.23.1792775882595;
        Fri, 23 Oct 2026 10:18:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
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
Subject: [RFC PATCH 09/23] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Fri, 23 Oct 2026 18:14:19 +0100
Message-ID: <20261023171433.820092-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwmzkDNqnSNQC
 Kl/ufXoNGqobKcXGyJLTuG7Ly+Q0iZIuvtGEEBtWD5LJxnuuxSuC2X/HDGiZYGm6CPHvfCxwc99
 b6EdL6yOpsOBztDBPL9bx8ckHWiULOGrREXNrqqn+DHpszKC+WsmW1dGGccJ5AmhLCcP5TiDyeW
 oJu02MevDsUk1E3QSjnp4TnLHdUwiq9U7MZ4bkkDhaYMCL6ONBQzCbE20fPazGou4afDUlvlj9F
 F1cO/q/rxLmvx7/hXhdHCrNGKYrZOKHYwEGzzygZ6iW/9Xf32gCMWatku5YOnaNe0lb1v0nstAY
 ME0++jPQjgjHBk1ZU2RMbVWxJVmZtnJFXnSHGp4rqw37gCGAXXn1Ya3nLHXBrBB7jHpm8OdtOJB
 V98vtMPBq0zZ1M7tj9w2xhqtoRitM6uLrdo2SGy7usbVZq/VUMp82rk7chGxqu3aCpRVdAAnk7U
 51BkrN8+n8nlZ/g6NIA==
X-Proofpoint-GUID: NOkMBy5AadVuq2N1U7Z5PNrU71DYP4Nw
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NOkMBy5AadVuq2N1U7Z5PNrU71DYP4Nw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1HmelmLShJ/t
 qkEXOCS734awoDI0aDkx0MDFMNRw0IRs/p6yzfhBfmvXjdC73X6iHnlA7/nnWq/nINinvPZjF4C
 kaQ+N8DQzP3sigcgHSCx3QQ402/ZGgo=
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

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..9002acf0e0cd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -641,6 +643,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.47.3

