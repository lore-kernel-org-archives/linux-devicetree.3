Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879A3C9EC2
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774686; cv=none; b=SmkLcq9dVIa5VvSgq8FVs4/17DHfZOJQ63Bw8AxYeZ+wHRIWppDWDvevVxfrpN/MiWWYi+YLZxm2VDgFn29zPYXMrQzg9tbkAxrNuh2vleyXeWn/eF4V82bFS+9NldrBM9bsYdXpL7m9/veUIZhL5gdiEXKgefrbrF2CXAr7sfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774686; c=relaxed/simple;
	bh=KvUpskzBVPV/7vEKPv+bmGdVgAMdsRKyxfmvYIT20aI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSsteoxp3wP7ClMY6AzT5Ex1ch8HG5MKgTNFcS1dsKyE7XRaEhle8/nN+X/29BvnXuCc9flwh51fV/PlN9Qm7GbTiZf220M8oQHm0Yp+a7HEXH35g9LmaPlbnVvmhJk4cgavVNIt1VnWT64VrFrORNXJQcEhC/iBYF0pLfKrzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IocvDBy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9TivhG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IocvDBy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9TivhG/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAn5vs3667063
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D06ra01IvSd
	Mxz5XPt8RV1cHrQG6Bm8TGeQ7EiZzeXY=; b=IocvDBy4WMk/cbBa1L6HUeMTg2Z
	omMx4SZRk6fI7YyhmiKzLvMBq7BmnwPvnQUYQluG3FySyMUMuJgKQxxzw+quCMjh
	7RODtPmjlEMBUIJsIbiooHo652Q9DiQqGB87ag4VylGwiXxL9buNYBLiN5830MBh
	AGF1ihxqr6e4FPEF2NL2AzRoOpts+n4imyxaX9PPEsFTf5gapfDaeQow70NLctSZ
	3WwXaesDljIGl/V1AnhNDdwfe20OOwha73OysjlTS5PffMvWeens5bMXnR6w6ET1
	XUJrKVDP8YBh4VGqAaMzUD8Whb7sJd/zWtX07xorscH+A7h3rKypIERzUPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v8sus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:58:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso29061095ad.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774683; x=1784379483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D06ra01IvSdMxz5XPt8RV1cHrQG6Bm8TGeQ7EiZzeXY=;
        b=G9TivhG/+v69QI47HQGPAqc19QJy/MOuPoDIR8e7mw65rvbzFRw7gkFbgtHtvV/YfY
         6+QWgI4LH81vAhs9cU4wpunfVRXd8d1LikA+LGD9o6RINDwSR4TMP3OMBk+O5H90rf4I
         TYTPoyO4KcZTr5aCN94dIUEu8hUY5VW+BcnOUyhSryrL/z+3LvGU/JRdihOkBRGJpOD/
         vCPVm3yv0x6e+q8N6oa3iAlT+jhn2CxWHwo/IO7o5E5YkhjfcyqpuDWioVmXz7eBZ5+k
         aAE1rGVO3IRyo77Z1ltOr5/VFfGK7yXqFCQvhT0fT+NWIuClmSCOG84J4YBm0RFlbSHb
         KcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774683; x=1784379483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D06ra01IvSdMxz5XPt8RV1cHrQG6Bm8TGeQ7EiZzeXY=;
        b=I/0igGFsIPLc0LFeSRmykUw1wZLYdF0OTW9plyzFw1S4XcTRgSuIrZYMqTvk8jJQy9
         yYeZU0MgdFxeer2Tk2pWlZJMpgw9xMf2xBKIthBb/TqvVK+Jy99EO6T9B1mAiq/wfWrE
         tPK0TWSueP/TS82+Zi9Gq41XZHGGaiwT1T1axtNS5rb1kyAzkgAwsBqB0KfzB6f0MOKU
         gmOuo1tvWtdTWmn8shJkvYCl9emliLSS9QuVv1vVhHtcmtdUcmPnDlPwZVfcsP8Rjlw5
         RAkBjtkxxnOzDDR7gg1W+Ccn855Eg8xdisQmgw2bK1Jri35sk8H82Ifm24detKv3MsrS
         BFuA==
X-Forwarded-Encrypted: i=1; AHgh+RpsOtAfejZXMQxld+d9UBYZ82Uvks/gxiLEuGYeP9Lx3ulLwi3z1xCUL60Bv96ZFWKzVoodPQlaS0px@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Xf1j9CZexrGz2zDQgnpMOqu484gL+GNS21WynXfgbk5vo8Mc
	3D5DdItmMyXFnE3VCmK6vhAwQ6SQpLBQ/8LFk4fJr8V1Fxn33oi5RtyuX5sJ3UU8BCJqU1wvKZl
	RylCDrhYjkGuqKK1bhYgnT18Qw7w3/irN2wxmMYFVVufnakcDE8f9qycesF2oxG5Y
X-Gm-Gg: AfdE7cknvd3GVTgj/dIaqnfn6db25JisgdMAcmp6Ig9rnb2t5z62GWMQJbNH/ofS6kB
	VEkopo+RQVV1EfM6/ODgU9dmLJaQ8FQUCWNzZxAEFoXY83hKecpNGVA5q0NeRhg2iDdjscg20bE
	5z6hqtyL1OIFxMcuC7jCNrR9RsOQ/+RRmmgIa9ruRy5LOaKUeFBA2A5I8yUYddnxWd0/SEUFBak
	feJLFf5C0ef8+oKM8ovndsHJiGncFKO620rswoPeBFmosPobNjfyQvo/gOmAGRT6RLqEQnU+WCw
	gOHCXNZcK7IqRvSUnkMixVRbo3/heTpIuppPaIv2rY111nIP5713Te+/o1epzP7YzzhImAT6P3k
	WexE3ZPykm0SoENU3gEIqHdyooD3rUaIBUIeR6Wq+nLGdy/w=
X-Received: by 2002:a17:90b:57ef:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-38dc74c4a24mr2634303a91.2.1783774683328;
        Sat, 11 Jul 2026 05:58:03 -0700 (PDT)
X-Received: by 2002:a17:90b:57ef:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-38dc74c4a24mr2634282a91.2.1783774682795;
        Sat, 11 Jul 2026 05:58:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:58:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Sat, 11 Jul 2026 18:27:39 +0530
Message-Id: <20260711125740.3083236-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D6Ike36oeuV7gIXH5e1KlVapponBpFtI
X-Proofpoint-GUID: D6Ike36oeuV7gIXH5e1KlVapponBpFtI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX6NG5bctk9UBF
 /DuXk/GPwwczWoBvquCjaoNF3duorCHy3Ogt9WqhfceAXHPpFX2YXjv4+HUOHrZJ2A24BkdXK77
 jJmASYL99pIyA8jNgcXLQTsCMuGawqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX9v9NHUxVsJFZ
 Oa7uyccFJY3WNBRR1sBmKTRZW+WPWldkpLOiaOWSG6bupNXg/f888YZNHSugvydCpHVRK8hosmx
 zz7aM9s16TF+PdNzItC1XG3EycZBgwLx0dkpRmAi2qemmltRSUhBhMG7VjxuKfkq4pT+Vak/zkD
 /8j81pT9Axk0Avy1C5rjSpzb7L8Ssiam99wwSBHUnNCUOlkqmgssaYMqbTVNLPOM5VPQEfyUhXh
 pPT4/mt4FPUWpjua1BiVx9J9W7DXmYXbNZoMiXFOhugmVXD0GILuWtLt2UnK8HCtvNivOVqWjXs
 FZU8288pvGi+Ylx5NmP9XWwLLpV+3XNwCrcw3MFwRtdUxRsEaWjvIibywxOyex1nsR33koxFqAB
 CysnbdIgTs2tlmv45Uwh7M/sfwTU6WEf2e6Q6QPbLkH+pXJ6Ty0UVEjM4wvIUYZiP8VoLv3Mn+p
 Hk4ffpYVPt0QK4Bdxog==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a523ddc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Aj7a1bfOtWJOebrZNk4A:9 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110128

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 193 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 194 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b283484d9..5743586ffda1 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -2,10 +2,12 @@
 // Copyright (c) 2021, Linaro Limited
 
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -15,15 +17,64 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	struct clk *eclk;
+	bool mclk_enabled, bclk_enabled, eclk_enabled;
+};
+
 struct q6apm_lpass_dai_data {
 	struct q6apm_graph *graph[APM_PORT_MAX];
 	bool is_port_started[APM_PORT_MAX];
 	struct audioreach_module_config module_config[APM_PORT_MAX];
+	struct q6apm_dai_priv_data priv[APM_PORT_MAX];
 };
 
+static void q6apm_lpass_dai_disable_clocks(struct q6apm_lpass_dai_data *dai_data, int id)
+{
+	if (dai_data->priv[id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].mclk);
+		dai_data->priv[id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].bclk);
+		dai_data->priv[id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].eclk);
+		dai_data->priv[id].eclk_enabled = false;
+	}
+}
+
+static void q6apm_lpass_dai_put_clocks(struct q6apm_lpass_dai_data *dai_data)
+{
+	int i;
+
+	for (i = 0; i < APM_PORT_MAX; i++) {
+		q6apm_lpass_dai_disable_clocks(dai_data, i);
+
+		if (dai_data->priv[i].mclk) {
+			clk_put(dai_data->priv[i].mclk);
+			dai_data->priv[i].mclk = NULL;
+		}
+		if (dai_data->priv[i].bclk) {
+			clk_put(dai_data->priv[i].bclk);
+			dai_data->priv[i].bclk = NULL;
+		}
+		if (dai_data->priv[i].eclk) {
+			clk_put(dai_data->priv[i].eclk);
+			dai_data->priv[i].eclk = NULL;
+		}
+	}
+}
+
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				 unsigned int tx_num,
 				 const unsigned int *tx_ch_mask,
@@ -251,6 +302,66 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
+static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return q6apm_lpass_dai_startup(substream, dai);
+}
+
+static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+
+	q6apm_lpass_dai_shutdown(substream, dai);
+	q6apm_lpass_dai_disable_clocks(dai_data, dai->id);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk = NULL;
+	bool *enabled = NULL;
+	int ret = 0;
+
+	switch (clk_id) {
+	case LPAIF_MI2S_MCLK:
+		sysclk = dai_data->priv[dai->id].mclk;
+		enabled = &dai_data->priv[dai->id].mclk_enabled;
+		break;
+	case LPAIF_MI2S_BCLK:
+		sysclk = dai_data->priv[dai->id].bclk;
+		enabled = &dai_data->priv[dai->id].bclk_enabled;
+		break;
+	case LPAIF_MI2S_ECLK:
+		sysclk = dai_data->priv[dai->id].eclk;
+		enabled = &dai_data->priv[dai->id].eclk_enabled;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sysclk) {
+		ret = clk_set_rate(sysclk, freq);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to set rate (%d) for sysclk %d\n",
+				freq, clk_id);
+			return ret;
+		}
+
+		if (*enabled)
+			return 0;
+
+		ret = clk_prepare_enable(sysclk);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
+			return ret;
+		}
+
+		*enabled = true;
+	}
+
+	return ret;
+}
+
 static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -272,11 +383,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
-	.startup	= q6apm_lpass_dai_startup,
-	.shutdown	= q6apm_lpass_dai_shutdown,
+	.startup	= q6i2s_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
@@ -297,6 +409,65 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, node) {
+		struct q6apm_dai_priv_data *priv;
+		int id;
+
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= APM_PORT_MAX) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		switch (id) {
+		/* MI2S specific properties */
+		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+			priv = &data->priv[id];
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, PTR_ERR(priv->mclk),
+							     "unable to get mi2s mclk\n");
+				}
+				priv->mclk = NULL;
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				if (PTR_ERR(priv->bclk) == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, PTR_ERR(priv->bclk),
+							     "unable to get mi2s bclk\n");
+				}
+				priv->bclk = NULL;
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				if (PTR_ERR(priv->eclk) == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, PTR_ERR(priv->eclk),
+							     "unable to get mi2s eclk\n");
+				}
+				priv->eclk = NULL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +475,16 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_driver *dais;
 	struct device *dev = &pdev->dev;
 	int num_dais;
+	int ret;
 
 	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
 	if (!dai_data)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, dai_data);
+	ret = of_q6apm_parse_dai_data(dev, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
@@ -317,7 +492,18 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	cfg.q6hdmi_ops = &q6hdmi_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
-	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
+	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
+	if (ret)
+		q6apm_lpass_dai_put_clocks(dai_data);
+
+	return ret;
+}
+
+static void q6apm_lpass_dai_dev_remove(struct platform_device *pdev)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(&pdev->dev);
+
+	q6apm_lpass_dai_put_clocks(dai_data);
 }
 
 #ifdef CONFIG_OF
@@ -334,6 +520,7 @@ static struct platform_driver q6apm_lpass_dai_platform_driver = {
 		.of_match_table = of_match_ptr(q6apm_lpass_dai_device_id),
 	},
 	.probe = q6apm_lpass_dai_dev_probe,
+	.remove = q6apm_lpass_dai_dev_remove,
 };
 module_platform_driver(q6apm_lpass_dai_platform_driver);
 
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a32086fe..bbbe6d368a41 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,10 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+#define LPAIF_MI2S_ECLK 3
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1

