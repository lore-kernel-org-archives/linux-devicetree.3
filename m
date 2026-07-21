Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5E415F18
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657574; cv=none; b=kLVl7g5luErYCnZ6C/f9y3WF2D6CtxP4/Fgu3w/e+b4AJJeuLjQWQ89SEtW1IAurOUNeIprFcFNqdt6HzpcJTKQsmmWeUm0Ltr1zhWIHCmAaeNLWbTSa9W1ycOgohmlwwgbgmMeDLGK0p/bxsxxtoHHCivRQT72rfUvYdyIHuxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657574; c=relaxed/simple;
	bh=MfM6R9y1EIPiqF6A/ySJpuCb/kr0iyIxe++9V4DMWwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzWgtgcbyn0sCCKIta3dwZwg0HJpm0/Wyc7Xh89fytOE7JjjZxc7VN+weM3ddPB0MwA6cAJfj0NVNWBAdZNSLqUiP+POKrzwbDTEmLzVICv36mvsfchQTV8JLPuxr/oCykHYeUkS2NWcsTw7eLrBmsnTJkT32LZE1cvikWhPfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AS9Dckqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQlPgCkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AS9Dckqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQlPgCkf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2ePd2280245
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=; b=AS9DckqskwVQglnv
	1WSduSCqSpqOmLOgTRKQ7thhc5VvhM/JXQnyBcAE7AkjK9y1kryzm5kd3dtvGRzu
	vPUQm7LoDCG+zjuWbZiignApDTC3GwWZA1tYfLxZ8rZthlzWPtsy8E9Ro329DsAp
	Med8lQDN+oyoC7/taw95pbABfdzFu4maHQCFDC1vmbDzEKZFsEeTXNHby9mswfrR
	xAsBxBzTRbvT4S8xlHNv7/z5Qv9NvGfTd9cW5pw6Kk6kN9e4tQnczRUAJ8rEfAha
	3fnBV/f0n+C37PqIp014FDysFsJZJ594rRB5W2/6DAxLe1+K9lsITxJKbo92TrXb
	ySednw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paaayx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:12:47 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so2031702241.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657567; x=1785262367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=;
        b=jQlPgCkfEMr5WhqG9fBXQ/3eFm++KWg697wVy79KxYBpl2DjAuSqsl3OFsL6wOAn3u
         EVdIZXMHf21fYkM7VR4tx5mYGsKMjnQeyPpvfyHxlqnn6/5FScjdGgtIqsr40ZRpO/9y
         MAv23XAJKrAeLUAZ/m5c/3GtQQlrlWlawRK74/Wfqi8/r574w7xoNp0ocISlaPO1pLRd
         HhR3KIl/QxCwvIAWtDftUZa7flWmOzEmQexgb00vJQy4jaUsLHpgE1UBWGFiiAUqjQzm
         ZcQSYVuQ5QfPLgVdlyulZHClg9W+tVtsd63LFHgrpcv2U7lWsqH3ShdfngGTQ3gxM5Vd
         mevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657567; x=1785262367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8OkojE2VDzFyq67u/mSLTD3XAPgG+tQihom1/t63uw=;
        b=Xeh87KkFl0xrNnoq6XoYI4eAFQqI31wSXH6JaxJJUnSce+2lO8vLA/BwrXKoh4nsDZ
         L6I7Da30mHf6WTHrMAEH60uzA5CLBVitBfEdadryjk0T6ZuH42OXH5E8dkSDsX1lfVD3
         vsu85xJmW+tEpr2hC443phrSg1I6iYCSEyG4LYITNbiFkvSuHUBGsorW0GMp+jDeu97k
         WSimtpwCtGffHgy9fg4VQQEt1fa5oFb5jhCEmmxixklbxCCj7VlxkCrg9QkBhP7Un5tK
         VJKpYn96vce4Cjx/VXWUIMddju2TZFucUVp2W/9TUp/AV3szFSa7mKuBw8a5Q1eR+AJm
         CG/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr8qEtDUo9QGxgD7K1imyvLCIJdRaufuappVikOpmUmCHwZogIsrk5UkIMvk882eL5i0wCyg2gDsgmV@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTqHtnr/90SQQif161CfEb97mKcmzBcpencTqIgfuRa7QtFfM
	ZqWhQm6beLf3yLBcLv0ajo5h9T9ZHvxM4JA2RfWpqftCBJYZ9RoTyQdYqSp4KZyJKw4uAPLwyRh
	JdioKf89Jqp7/k6eG7J499TZdTp9hqNF8evuH+qaS4XPiB16F57V1QWHPnl2XBHY3
X-Gm-Gg: AR+sD12284JnLBlKY7fttWPwoBcc4W2kkDFJeo4Kuw4tRp8xrZu2orRwKFFJzyTBt8z
	WMuh+/Ht/0fgGBlEsuJx6au455csQK4Qq32u8YY50aSrP7QHHwR9JYkHITGHUG/TupLEdTD4qH4
	q/5ZNcOZ32eI5Zn2tU6agKA48yoKRRGS2Ph6o83QmWyT0B8LA5KzPmkrBZGh+nk6X6J6+Ujj1Fn
	lRvYcRzxIpyV11DnniHc/fnKYTcJO8mXW+4/24heqyWcgE/aouBq+e7ay0fQ6MVpUCu+wEbuenW
	7UXibbZPpGEUVlKkldr8uOJKaBZgIvXGtEY3pPZJSedMjCbpnrQnxBtsksuUYrQA8POsFfdcUpV
	O6bw81KwI6sE818vwRq0cRMSKxTZDfpL/Vy4Qgl4GoLoE3NS7pHtPNAzIiTmaPxB4VSIC1HhYQK
	klFl6pYm08J55iQg==
X-Received: by 2002:a05:6102:5a88:b0:739:97bf:9189 with SMTP id ada2fe7eead31-747536ede8amr5645171137.19.1784657567111;
        Tue, 21 Jul 2026 11:12:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5a88:b0:739:97bf:9189 with SMTP id ada2fe7eead31-747536ede8amr5645130137.19.1784657566175;
        Tue, 21 Jul 2026 11:12:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41c9bsm596921fa.19.2026.07.21.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:12:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:12:41 +0300
Subject: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MfM6R9y1EIPiqF6A/ySJpuCb/kr0iyIxe++9V4DMWwk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpftpmhNY2N+aJ+1uuE7V3N+SPgMEt6Zd1Y0Zy36kTjNNt4b
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqX7aZAAoJEIs8ij4CKSjV78IH/05x
 0FcSSGg/e7pKmqGxKPG17riWXusaGv6lSrYy0sTDDqsa1ZT4DZ5jYW7BEvp62Bk031fBRumpfkQ
 XmRtzPer8H329JDkYp3zYNm9mVdIIgcy6wwVaGuNEscJKe9IM0EI4ib8FaUCL85Ho03TlmLQ35y
 gM60XP8Ljht/+anbISJd4kS7nXKqpuif2t55r8qHIPBFiNaxRCSkayNCltdEJAfeeV/cukAdPs6
 f1xoO2dPgfKav0KOBeytvKGoJC9Tr/3X6ui2JHi83j7Vt1bdCYkHW2WLG1J4A4zqMQuRfzustxs
 6H7nfkgskArtJsfU5n/Jun5M+3KJDoaOSKbxOes=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cHECaoM53XzpdqEcTGDFIOXnd_80wbza
X-Proofpoint-ORIG-GUID: cHECaoM53XzpdqEcTGDFIOXnd_80wbza
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fb69f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Pz9WbiNhJHYEZtGnJ8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfXz3HmC4NkDvf2
 4vaCMajDXJ/HOLB+BSMCcr7yA6CE9nL3eKG6D0QuSVK8FDeW3stm/ytPmhSqHOxPwQNkO+8cc3B
 Kcuupc+wSXlnIfqCw4gseSYOyapf1gWOuB7tuz19hS6ucLCxjSp77ofBPj62dNSlR3V6xMqtLeo
 NuQEtwwTLjUGg4TxRxYG7Bv1OOIp9l9lyLRLROugeWE9BhWnpAZe4XLpDAFvBGiEyLtdGazGz+s
 lPfp87k44OjlximoSenZrfXxeTbAROYyOemVeNc8mj7OW9eQvMZsHq1C9HUorsJwIKWm3eQG+Pf
 o3nFK2pEkwGiwWz3SLCpvTqz4AxJ+ANb1uLbC2GyzuIhWbCgxc6YmhLwrxeUxnCvXybu5jfdVyB
 5E4ZICBNWzCG18F0RSEWSFebN2z6PUK5xpGOuCCY9NXB7AnEKwo/3mgB/92zMigc2RzY8NG1/rd
 PHnFk0D5J68RxyYTn1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfXxWkcsr3PU52H
 GLtrLv2ssjrSRPyOUGyyzls8SnfWZnX1EfalOZ5JQc40rT4kp/sX00MsMHxOXHlzACPFzNuyNO6
 Zu4rkCFry5PH6tBEDl2P1flDmaG/PhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210191

The Storm board machine driver targets Google's IPQ806x-based Storm
reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
has no upstream device tree, no active users and has seen no functional
changes in years, so the driver is dead weight.

Remove the driver together with its Kconfig entry and Makefile rule.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig  |   9 ---
 sound/soc/qcom/Makefile |   2 -
 sound/soc/qcom/storm.c  | 142 ------------------------------------------------
 3 files changed, 153 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..68e3146bf230 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -47,15 +47,6 @@ config SND_SOC_LPASS_SC7280
 	select SND_SOC_LPASS_HDMI
 	select SND_SOC_LPASS_CDC_DMA
 
-config SND_SOC_STORM
-	tristate "ASoC I2S support for Storm boards"
-	depends on GPIOLIB
-	select SND_SOC_LPASS_IPQ806X
-	select SND_SOC_MAX98357A
-	help
-	  Say Y or M if you want add support for SoC audio on the
-	  Qualcomm Technologies IPQ806X-based Storm board.
-
 config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
 	select SND_SOC_LPASS_APQ8016
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..bcbb44d17303 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
 
 # Machine
-snd-soc-storm-y := storm.o
 snd-soc-apq8016-sbc-y := apq8016_sbc.o
 snd-soc-apq8096-y := apq8096.o
 snd-soc-sc7180-y := sc7180.o
@@ -32,7 +31,6 @@ snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
 snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
-obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
deleted file mode 100644
index 1e0eda8c24c4..000000000000
--- a/sound/soc/qcom/storm.c
+++ /dev/null
@@ -1,142 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2010-2011,2013-2015 The Linux Foundation. All rights reserved.
- *
- * storm.c -- ALSA SoC machine driver for QTi ipq806x-based Storm board
- */
-
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#define STORM_SYSCLK_MULT			4
-
-static int storm_ops_hw_params(struct snd_pcm_substream *substream,
-		struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_card *card = soc_runtime->card;
-	snd_pcm_format_t format = params_format(params);
-	unsigned int rate = params_rate(params);
-	unsigned int sysclk_freq;
-	int bitwidth, ret;
-
-	bitwidth = snd_pcm_format_width(format);
-	if (bitwidth < 0) {
-		dev_err(card->dev, "invalid bit width given: %d\n", bitwidth);
-		return bitwidth;
-	}
-
-	/*
-	 * as the CPU DAI is the I2S bus master and no system clock is needed by
-	 * the MAX98357a DAC, simply set the system clock to be a constant
-	 * multiple of the bit clock for the clock divider
-	 */
-	sysclk_freq = rate * bitwidth * 2 * STORM_SYSCLK_MULT;
-
-	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
-	if (ret) {
-		dev_err(card->dev, "error setting sysclk to %u: %d\n",
-			sysclk_freq, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops storm_soc_ops = {
-	.hw_params	= storm_ops_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link storm_dai_link = {
-	.name		= "Primary",
-	.stream_name	= "Primary",
-	.ops		= &storm_soc_ops,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static int storm_parse_of(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *dai_link = card->dai_link;
-	struct device_node *np = card->dev->of_node;
-
-	dai_link->cpus->of_node = of_parse_phandle(np, "cpu", 0);
-	if (!dai_link->cpus->of_node) {
-		dev_err(card->dev, "error getting cpu phandle\n");
-		return -EINVAL;
-	}
-	dai_link->platforms->of_node = dai_link->cpus->of_node;
-
-	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
-	if (!dai_link->codecs->of_node) {
-		dev_err(card->dev, "error getting codec phandle\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int storm_platform_probe(struct platform_device *pdev)
-{
-	struct snd_soc_card *card;
-	int ret;
-
-	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
-	if (!card)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	card->owner = THIS_MODULE;
-
-	ret = snd_soc_of_parse_card_name(card, "qcom,model");
-	if (ret) {
-		dev_err(&pdev->dev, "error parsing card name: %d\n", ret);
-		return ret;
-	}
-
-	card->dai_link	= &storm_dai_link;
-	card->num_links	= 1;
-
-	ret = storm_parse_of(card);
-	if (ret) {
-		dev_err(&pdev->dev, "error resolving dai links: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "error registering soundcard: %d\n", ret);
-
-	return ret;
-
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id storm_device_id[]  = {
-	{ .compatible = "google,storm-audio" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, storm_device_id);
-#endif
-
-static struct platform_driver storm_platform_driver = {
-	.driver = {
-		.name = "storm-audio",
-		.of_match_table =
-			of_match_ptr(storm_device_id),
-	},
-	.probe = storm_platform_probe,
-};
-module_platform_driver(storm_platform_driver);
-
-MODULE_DESCRIPTION("QTi IPQ806x-based Storm Machine Driver");
-MODULE_LICENSE("GPL");

-- 
2.47.3

