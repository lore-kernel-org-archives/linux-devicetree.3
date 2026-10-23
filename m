Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775906;
	b=Ii9tMF8ycSPybsk4rHh+KuqAlxurcJO0R7/MqXxetl4PPuojmfEUH1wYvl10Cn6c8Ue2
	 8RCXqGPFoqDfyzc5WfM32+m0YZI7aDJDy41PovxolebYv973jiSqFEPb918z4B8ah7VA9
	 IaVU0svbum1dZ5rs+IsvbXcnDzvbQg+Br+QPfL1LD2GS5L8VcNRDtcS/7Qk7Lx+Iygtcd
	 QmHZ1rR1hTZPYtzbbYAWRXICMePuN0S6CAAqtKG77kDzgL4lsgJcC1bKQDy9HsHvRW4Ei
	 EDUKwxfek1tz9LG1RLghaq1K1QVuQMHJVYzycyjh1JumLipR83H9AQ0eXZyrLHMJdvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
	b=iCnbr7uVHhDH+DZl0nEMz0nYwrjXotSnI76DA3MvWJ9hWDNDTOAwU2fSEEO3xK/MY4Wb
	 bqFZ/1T5tKyizAGWb7g6KlJPJqx/6sH6FMMPzupjj4lJ3iekP/mP+AwC8WTW4xfIr0mWp
	 dXuB+gsuGTd480co55+Drxe/ou15tu3KpobJM7DA9mbiJYMZSuMiNKK7tUGLusORIKsjs
	 mxbv36xp+yQM0N83HmFWBNORbn5atwI5o43ArH1gUGII9YHepdxP/+Uwnwm4MOolyo/9T
	 aSszrSfQYcYtGtNIr4l1dBT4oenSJ6czq4xBSjXavNTinHdU/MRKbW1qEVeFuzkVa4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdJqG7ZS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4E606DC5A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B4E606DC5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdJqG7ZS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3mxd3811756
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2AxabcwP1wd
	LQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=; b=eLEwDo0Y9THbq+Cv2a8kMWTVYFZ
	ffKuUL0fxL/g4CesQIjb6FWgd8miI8Te0TYsTJAufQ75f5lxf8FB7wF2U4/XpGH5
	LIoOFKaJRz1E26vatvfUB37GUpftBICkEywphBNIjf611Z/noua54FbxeBo8hgUf
	jJpyPyqJtmv5LkfjxdMheuLowvdK0OL65eJPY81D6eJxynwxG+rQMAZw5fWHXZap
	1R0aTO/5JqGRs+lRtZtWMEpiFeCNymOjIKvTZB1N/zaipbqJRN9Q7KOol+uzUPWy
	7Tu4sRKR81Ax8k/Ii7itQavDXhZARedmb72llQE+zzGFK41OR9svCnyjqpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas8897m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso141320085a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775904; x=1793380704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=gdJqG7ZSYceemMfIKA/nzsIqeg3l/AHoKKcpfYH0Go/cX8j8ERgZkJhIw7J3GOpBnC
         r/dmcdBvimwjVsCwRs4bu+WCUo/Cbt3orRD+IpSQI4FPP4gqEuYHeOmFO+kT6PUxhCnz
         WgVgK/4V0mApU6NSq/8qDsPF+sFFT60KhKaURJNWrX5feXpygeMBorJD5McNw5HsiBj3
         g75QgpzzJiQ2KbuAJj6gsn02d3wwxDnEsI5HdHajVEqgo+PEZDSUc4V2NP6zv20St1D3
         Ebrff6NBX+Xp250Q+ecTNGRr+GX7/ZJPqJYSMsBP8PmYeGvJNkkt3wSGflz6293xK8St
         UeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775904; x=1793380704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=y5dChRhUqKcVKcOQrNk0GnjzjZRW0mKk5sqEgnDXOHJhC+GtFXsIV5b0T2HcbUzsTP
         zle6uSbyMR6wNQIhhTg3gJc46+KIrKMmavqi4wRsIInvUoJYd52TvHzZuomwnZDexVhD
         /RPjvlzzv2Vabm7m0/W9Hs2nUmPkIq2ix8ePGXYgRrUqs+dERxqfHkMYZJLS4kpbeurU
         rOspxHEOWFuRUEyEuuhUWFzYpDBU2NG7YW4aE7A63T6Ex/a1lDBxZYITU9rKA9Yp/xvd
         mhd+RxzF0BMYcRsWBoqp0JYYufNeABA1y4EYCsH3KCDR9Gl90HzKTgKUn09ou0m/NFtE
         +KrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHhNXiRkV1BPGMkeZDti9DiS96sB5X1B+if1y2WlqblP1rXX/Z5nI0ZgDiw8/pI4FyswwRqOxVEaRv@vger.kernel.org
X-Gm-Message-State: AFq9FYLFFcUy2oVgV74QJZuXDvLWJQzRZZtBaYY0LzCvmNJEmWiwXVDN
	fziOBo+fgiGHS5DsVgWViqzeD40RFRf7uILHC2xRysgOd2//NEbgPcg5A/p+O+NRaDL3LLzLBXx
	Mx5RmerM8EA3Gp2LUtX9r5ET+0tl52xEwFKfy0ZnGRDU6ovWZpMlkiGsHu0EI9Ejk
X-Gm-Gg: AYBFou0JOkSbiMaqBEoFXX2FYIg44Dql6EBTthHyguHV2dJtyR3jJTlC2tapA5/n+Bd
	xKHm1didvW3K1xdiUsedPUd6VA2Lzt+hGLh3hFCjWvbZwZYAgLfJ/WUK8pgO02rC2uwqL/XXGsS
	rEgWrPg72A0uU0/jqmtv40OERdbhHzzpQ9ib9Potql6j7zfF6FiYpFvU8u1Q+9VSz5UWaHhF/wf
	3OnLMO037icxJnlXeodWvu/7OM/8KBvij06kELLoh6pG0uhhfGeJqPjZUJnpGmdbYV4MFxfxRUS
	3aFuW2SG/+ua5z2nBO/AnI2jLekSqZoXTpSrJm17eGywCVsi1aY3F3Yh8LZ/rieHKtgjdYPWDS+
	eJ8IgphOf2Gy6
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520783485a.34.1792775903411;
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520777785a.34.1792775902790;
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
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
Subject: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Fri, 23 Oct 2026 18:14:30 +0100
Message-ID: <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+p1nFpmcQPTZ
 dC0iv29bqTTZ7VIygw6Twgpf2vGWAtCdud2TTG17La08P3QJT70zp4c24nvuGinf3VxvoQk8/F+
 BYzgGFMhihbUd6SWJcDiQWFkZGb1jhs=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb96e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=UI3T6_Nygtay_5UDmqkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6yKyBkcyzX/2
 E7ZlZm0A1I5bFpGqC56BC1BpIBakJKn7Nv81CHi4GDmY63d+a5BfT1GnhIqKyb3u+e6z7XqRyoV
 JT2rP2LVwgaORVk8LASrpo5WNAH+rcdWZUMc5UmXLoPxBgvZaspl9EjeJ9YL28KEcqDHRvkfzuW
 tHjV4CCFA4ndTCmap/uQmYSMkilKEi1vzclmcSZnxpZvUHjxqa7Kuj10QNdwEsNRY+lDRsoeNdi
 moM45vMmr00M83AogL2usV+S1fa3kRhxK9ZYo8tJGawaNxvqOujB6DSSm6vFW/AJjqdzDy6iY6A
 mGLmB19chYdsf+Q4uM21kfFgx/ImNZRN7fZqr3Ect02jgYsRsiBDEvnYbZ8rUhVRcMYGmxTc1xq
 d5yoO+OQmGS7ftfDK59qpmMhbAr6+oR62aH6lLNh34RDZboL+mQVvon6jzn6sToFeqrdlHCa9yd
 wVrnErb85Avy78peRHw==
X-Proofpoint-GUID: 8jTCrPzb_4e7NpK5mJ2aa6Y3VEkJoUHs
X-Proofpoint-ORIG-GUID: 8jTCrPzb_4e7NpK5mJ2aa6Y3VEkJoUHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..23a28c60bfb7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -68,6 +69,25 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -175,6 +195,13 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/* The WSA playback link also carries the VI codec DAIs */
+		if (link->id == WSA_CODEC_DMA_RX_0) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.47.3

