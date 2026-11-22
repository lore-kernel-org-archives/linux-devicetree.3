Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364109;
	b=4w0GgnyaF3gUpiNLcpC5pYT/Wo0CI7x/0ZsaC67/Z8WMSk87hwr2XAvWBvRdwqnpSFFV
	 icR127+59hyMaKzAuB1idhRHX3O+r6tEsgozaQGUj6kaMZm/BOhywrgc7nQomBFGeHVLK
	 x/r6AoRRrejE9rt5XlzxwrGXpMkwLurpdxXzclcx772T+A6p4JEMRs+VHG1wpDITkhNNT
	 AJHblrd4XrtDQC1WFXAV3N7Hjqp0V23Nj08SQgrX3jUH0QhZOfpM8JOI6Eaia0i1s3GcV
	 MBsf/L3LcYvLXuiuFLjF/tkfVJIkpopj6OE/iQgQ7ebhe0F8o0tnI0gFEAavtpkI4Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
	b=Xu2l0aN7kA6pFIqeXLIzng5UuTsu/aMPjiwgEh5pgnDT72aWI9CZZVcQuVC87hpUSFnM
	 bi3s3fm0STUkhqDVg/jXOwlBnv6v5b/JTsYdTM7+EeWYgIvNenqpK9veEGIzUZ9P1qdXV
	 1Rrmla1V2SC7Heb9gS32k4nngyiCs2kpBLP4BHl/rTELKduYZJJzSumlw0dU+PjyHkB/b
	 Cz9DKVhUfwqtlz0cbGnn2xYPn2KA0l/bPIvba8lmYPn8ucdhIFCNtV2I3Ji2ifuEgdFtD
	 GVoA29x1FgunikgUIGFgsAhvtsdFUYVzXRm68GHaVOM14+w9Y+lPP6DQiI+GObPutKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB060A383A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AB060A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQFLX3382268
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7yG2kXY4Jn
	+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=; b=Xi9h5i9bgGoE4JL5X8INRZkm2m8
	RnEGRn3wCA8EYxnsv6G26qZ4nHkFtowVLEEyeJqOHYMjyIB6AECNbsyVrldAshwJ
	3dRjCnmSGFQzENLynWfWK85ZpzWUNYzMeZSLVPWGBvd9N3fteopX7+sW0Uu6oNXG
	St/T3tX302/jQIA1Ij59xF9tUEXiuDDlD+E7e5JtTCvVvnV/2+OYKBSYjj+LfMth
	7YtyZISbGmhxMqkWqSJTsovTPutdD3sNOqjy8py14gvXoFAZN/u4qFob5OsESlHO
	bE6S57ruJAT3faqtq93hX7IWhBydWEQLOwXRm/OWaE0s1no+jgZYaK7R5rQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7updy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso500804885a.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364107; x=1795968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=LLDu41YZ5P7YFZzHnNeGbdTg4ztt8cJ7KSa8Qz3RCbSEQq9pb0ap///GcKmGnn02FP
         ej/je7EaUOuEe4AXS2Y/0hIuqSkVjaJuJ0k1KSm26zfgMCNQH9BzgHTZsNXhywHLXABP
         DLfU2D2+lvMXLhpXn05wt8i721rUVdZTN5OGHh650GpF/fABJ8tneObrJJChxtneZkuA
         VyxziWipfeFjBvww1Qquacg9n+aRnb89fUP3/oZm3gTcVUykMmlv2C3eQMAdOVJJzCVt
         ralzTEGc7/z1GbF4pA9UdPedhZZBLbUAvMP+BvYTMTTKejIKu5JRIaaJiRg66afmdhyv
         Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364107; x=1795968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=n3dG5BiXiatVCoUWi8P9G+yIiadM2CMvaV7GXQ0Wq2lF7h4gZLFWMy3zjIaFM07XAQ
         nvEx0ildpO1j8cDo/bKWoNqMppCJUu7mWRhNAzfMKdwgd/Vts/5QmjA1d0Ei/Hk2LX48
         Qe2uJ3PIBcySwqkP4mquaPLAddM/KH1bkB5j3iNrPEWgJNIkbundJQTJgOSWgvjgw7NF
         ofQfDTiqHoXiwqm1ExmpIKdv+33ZRYqAeymD/eGYBgvngGt5mdLrrIwrLg30GPGhOz82
         gOA58iukA0FZQRDSeDWBm7JSSl4Q4vmOIMYjeYCeNwfiCmPLytDbF9GFdwWbKtyXj774
         Tf3A==
X-Forwarded-Encrypted: i=1; AL+hErHJM3s+zSCwnMIrbojTxEPBy5C6pivsKVsRMRsfHQ2WQp1Epd9kMBZgtf2WvCOeTshAp+gtc2XVGOiZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9TYLn9qWUJP4wBXTSwfsM+M2rl/C+mVjqpX/9rzTwoiQ2/VkP+
	EhhBuLuiFpjFKJVmkK0eKoNaehw0YKRT1BLsl1tG+jhd23U6mJB943yQQAztBZyOOvvsusIMBfP
	7O46Je+t/PBupFDDF73JESdYJmxq5UFsppdsvXTrH8/pYd0w2oUSIfcCM2bj5zayC
X-Gm-Gg: AZFdTZdeSlhp6iFadeTHRgg7Nvy/sAifNs5q5kh1J/kezhBuGswZlCuv7gu2t0Sh0wR
	Z6BE3nliS7YUgDEM2SPVXgiNz2KNFfQg5lCod6dz7T3uLOqtoiLONtUt8Iz2VhR/pW+rkvaSakb
	R9zbhdJajmZMXua28PNBSeYf6Ikk1bfd+XYj/MJeGR6GDYJwQ5Ttu/SczhrUNobFI7AUlu+URPd
	nHIs41V1RZVx6kIfxAR8xITGn5f5bI1G2m9Z+2iz9e/7QWSbfnLpqPbWAgjz8It9Gn9/xcX0BvD
	+5BlF/An1/EsfsD4QIgvNEblPevBnxNwOYJCv5miDva/19T0CLi1ZdP/A41H+CDB5ZvpjHUtmTg
	0lFwY+MHDk+t89x7cQPYHe0AJKlSwOzNx1StmuuHzS8CE3VF/CxFtbnm4GQIZ1Fde
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581393785a.46.1795364106981;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581389385a.46.1795364106613;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/24] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Sun, 22 Nov 2026 16:14:24 +0000
Message-ID: <20261122161437.5994-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03150b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9xP6WaV8JFNr
 DOs8ai3d4Ubu559w9l54rtULbmPhkXDPc3bo2lPTF7pySGotXXoOD/afzZUdhhTdTmMiNJoVNDc
 0OblCuE8YuYjPovyiyfuOlMTgBdou3E=
X-Proofpoint-GUID: O2G1cBG7DHU3owwI3OqCdv_HqLueSY67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9ik6AxCMksPv
 HtdJ7tjrHGLqBIwUTFKQvwDDE/tQeJoLMn9pcSZoeANEeuuWhkxbpgaXzXl6qOPDzQqCmIQtTCW
 xnsaFUxcUfqrinw0Zv0bgccfdl5cd7uqDT/p+ccU//DrSrvCz71k7NzRdzlHf7XH/zWt+30YK6T
 H4b1SSaW1jq3jQL1ALoI4npCQVk/Sk124wwovB1xWIL4JCWcIIYrn6T4zB3cKa/x/8vjL8hYSYZ
 j6+2v+tmcdSMcqLPn8189EAzsmVG+SrY97i2oh1GFjjZ2nxZTTSpqlLkCUhg+Xe7Hhb+PhWeejr
 0C+11PjL0bRgd2p5kPY+GtfC3M1VKdK1dWbvU72TUjIllHSgkLLs8wUxOpwissc9JVwcGr80jz2
 1qM4hIpij9b0B5Jg2R6yiggfChbdEQI/CdCHdZyWyW0k1I55FSHsdpxnYgL5bqOSIiA6+gx9K1k
 RnjpGmt21b7ZQcWgyJg==
X-Proofpoint-ORIG-GUID: O2G1cBG7DHU3owwI3OqCdv_HqLueSY67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..4a86e7dd48e8 100644
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
@@ -643,6 +645,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
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
2.53.0

