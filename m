Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB345D5E2
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457648; cv=none; b=Cwmn+rv3MuDi2RCITQNKxDngxegzdWUWvTP+7c9037FliMUBHck7L/NtClxS4Qso2SM8KmPNgS0jJT+hRgV4pAvBbzwEweSq8Oiw3495KTHeY62QgDMrMAhNcfzpv1kA1uxaqAo0U8VUL5L7fHtd5n+FCW5fVaLrs6iVjt0CV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457648; c=relaxed/simple;
	bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQ2sbpSf2F9/9OPStaMjVnzhSDbiWzlV+BAjOxRbKXGwS9kRtj3gS+Q5/83A2k6SsujIgxfmXx+qPoYO6uNJW+vfSpNhyehL34MxvhrfGTp3Uc3O57SZWus1nLyR35WUk6ALisFpVgZ2zn0HyPORovGRT4wI5DYE3Z3alBvomuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L39oroOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMsBU0+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L39oroOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMsBU0+f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbW6A2290300
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=; b=L39oroOV3fiiXpLt
	oJrqarwUlMfh14BYmWiruPvD6MU0kz9SV7uJozWJP2m9L+kNnLQhbHVQ+c8766sI
	lNR8fiYhzHqFDw9RMDG4BZc6VADlIRfPlHHJcbJq/41myFDaQF+zUtPpmuyQSb5s
	mzK/zoqZumQlv3gyjlP49RddLk0EE7nFCh3kluZeVgjj7eQSTkhZTQsAD+tQuieC
	lslBV8H2g/S3/4hFjf4AgBWAzHqjgzwEMg3y48yY2alIpJjHeunIAQsHyj2vpfIF
	LKiMUcKDSc/uVk4Y08FismhGqEcgy9Mf0+1aSlabA4OD9lwBILUsQCssamguh+4a
	TuZfjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jpkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:07:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868db1b2c64so4320561b3a.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457641; x=1792062441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=gMsBU0+fjGPOXXjV5yy94S4U1mpx/mD2FmPHRNYi6R2guAEPbUVuTn9VLQPIv8SEyX
         cif5QdYnrTDoXOnwqXyaJVPk9gqhiKSGcVhcZYUZeEI/s5GsVEGeJ+OJWCwsj2o34F/I
         FWngY02oPkxo7HAX0eKAVsJ38Q1S9yD8QRoPWU60eZwqZtY/bo9Pt3fFCZcCx9exdeSS
         Nlo7zONe8JpcsgiCCPMIloFxGXu9bl1/Ld9oVKI1cLyyENJv+v/ego424lCT3YvtvKFF
         rP9mHIBI0JI5tas6ZMolfpZVT4QptUsJITUy6eGADg5I3+jmtV6je+cr5Bc8FKdsJypk
         CRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457641; x=1792062441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=G4heT7Vs3nRbeqbJKyqcmQdJ8sZfiIKK/CRJmjQIKhSM2Lh+jj+lRmT1dFoS4ENSlW
         IppFqzBJkYYCwC5o6/Au5wFPX48uMK8zh3vLoUvjZ6uwxCQDaBaYpVc0lzcdRdm+0qyH
         Vw5kMpD9wCSwRkdNvL2QWayEx7JWzoHQkiHiHspqzdJ498vUZQ2FymsS9rS/Aa0AjgTZ
         4Y340BMoGideo4D1zIqaJRG3SJncQq9vu/0Hb1gFDvfr2L0lRjL5pUdh46JjlTqdtZmH
         /C5onqaqYvgV7NnbG9oUVkpl+jMo1nERwwFLB/9fmxy17Gh7ic1vlY2Zdht/eZdc9nwE
         fidw==
X-Forwarded-Encrypted: i=1; AKwUvByiw+dkufJrLBdz0ACA3W591uaM5LEn79oTrtWTQcHibM5OBdTpcvr7lAdL++tQdnK6GOZwVQo6Wjwc@vger.kernel.org
X-Gm-Message-State: AFuF++maHUaPmq/BXbt6ada0w7dtwc1sknyNb0B21P6Krj5QSt0iZwrN
	OFA2S5Tn2cS0R8vPy+z+zDqBuVXYgUXfwO/87BGidlqJ5C/pB7jdvr+qqWJUuMuvw3TpZdfUXxZ
	yoXHqA1t3rtkXIht9wQeqruqJufvv1jHmzd4ZtawIYOdTEl8uVs4rJ31u6fzJ2ZcldEdbKerD
X-Gm-Gg: AYBFou2VFWYA909nItByRqkNgSljOcyY625CzFJhT25l5P/XKm7W2Y9Az9Q4DJvzC8T
	ZPfGhqw2e9l1NebV93lL6z56r5VeqBVG2TjtJNZAK5inwnL5uFu9jC6t1CsSMRFJMevKoZLfpJ3
	4hyRGxYsHQY/THDbt8tx7dYRw4y7ERvXR2SX9pm5W+w/ZMZ1yrF3gW2sqlHOsIrHdYGUQcjzzIy
	fpRV8+BY4zQUoPUbBTiYiDz8qx/qc0sn1dAhE3nqfHaExl02IYcQS8szP9FUPo2/VwQrLi5F/96
	GieHKcxA1h+0Om2Y8oGIOaHBE3wcWlWNSLgyI1ewImgGLgzLOj+K221NvM5w5KE/IhC/FBVvf9T
	vXUuw4ViKelOR28ZwLA7cOIChnpt9XnN+KYVL
X-Received: by 2002:a05:6a00:9517:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-891aeae219fmr3870065b3a.5.1791457641096;
        Thu, 08 Oct 2026 04:07:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:9517:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-891aeae219fmr3870018b3a.5.1791457640446;
        Thu, 08 Oct 2026 04:07:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:43 +0530
Subject: [PATCH v2 3/5] ASoC: codec: pcm1681: Add TDM support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-3-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=2096;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
 b=pVluH5t7fOJysKzFV/BfZMMiCjgvQoXJfeudEri1OwaUMjhw9SnEmGHhDX5VSLOIl5v+wKNSp
 3Yd5szAGEP+BnXGZRoHoB8i/aG0xohGHLMojaXw6fWS64AphQNh7Glt
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX+xC5RGlvhMaO
 Eo9vGOEChk3CzfDRjmOkKEQ9tKUjk1Qy6lcyOlFeG5BdhadtvI4na10A42V7BxfZSHsZ3LMPrjT
 Zavl4W7d5SutfKzmjgPlUpAgnEMyAt0=
X-Proofpoint-ORIG-GUID: eISJ64Qce5J1HnJz-e94rJ50IFGeleIV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX8wP26vYuIhL6
 bYggWbxgTylYbNFWIz2A2JPJOEr2fYrfuHb9eD8ZDdK+hVpEGJB99gsCu3DhlS3iWmaaaEmn0A0
 3EwkcuCGihf98ZROxWDx2uyqwLwhy4jZr0h+bp3u9wL0mo7lC38wLR3sbpYSDU74NLpyP/cV8Zm
 FXAygGsyGORPfmDObWnmj8fmub76dJB3gPBhBE2sU1MrgY5taWZGzvso0ZcQfQ0NazXObtEQ2x/
 /WyXYglwSy899btfWBGqOWHIqzvAFkq2lOwKWO+4Y416KWAxwpdYCAkQy4ygbavf2hVkxO+E7Ts
 MhyJNrnUuIgMwKlggeb4zOXbvlL8oXLvPTIhIUD4eoD0vmKJckRwvtvB9whp8OrkWr3NC1zSDUO
 csurThI5Jfk+VRpX7RbsdQuPIJf/WJDHnY25h1OQddWwk+Gsf2tn6aTq/ojHUqqWoj905PusRSH
 eTqI7t3iYpl6wsI3DNQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7796a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4Rug7fo5hNcZ0wX2R6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: eISJ64Qce5J1HnJz-e94rJ50IFGeleIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

The PCM1681 selects the audio interface format using FMT[3:0] in the
format register. The driver currently supports only I2S, left-justified,
and right-justified formats, preventing a machine driver from selecting
TDM mode.
 
Add support for SND_SOC_DAIFMT_DSP_A and program the PCM1681 I2S TDM
format when it is selected. Also advertise DSP_A in the selectable DAI
formats.
 
While adding TDM support, correct the reset default for the format
register from 0x06 to 0x05. The current default does not match the
hardware reset value. Although this has no effect while regmap caching
is disabled, it could cause the TDM format write to be skipped if
regmap caching is enabled in the future.
 
The existing I2S, left-justified, and right-justified formats remain
unchanged.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index a1ccf1edf..3675b2236 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -53,7 +53,7 @@ static const struct reg_default pcm1681_reg_defaults[] = {
 	{ 0x06,	0xff },
 	{ 0x07,	0x00 },
 	{ 0x08,	0x00 },
-	{ 0x09,	0x06 },
+	{ 0x09,	0x05 },
 	{ 0x0A,	0x00 },
 	{ 0x0B,	0xff },
 	{ 0x0C,	0x0f },
@@ -217,6 +217,9 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	case SND_SOC_DAIFMT_LEFT_J:
 		val = 0x05;
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		val = 0x06;
+		break;
 	default:
 		dev_err(component->dev, "Invalid DAI format\n");
 		return -EINVAL;
@@ -232,7 +235,8 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 static const u64 pcm1681_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
-	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J |
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
 
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,

-- 
2.34.1

