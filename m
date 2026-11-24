Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541558;
	b=IpimkH44xBLLzrdTXeschL61lAPLyKWw3gcrUYUvrYrCO8foqsZRBwaErWE0tAJJgHbx
	 wMX5j+7lvVMeKY17rNQbB3G6Gk8ubQR5fA63ekEM19Zx0mGCIXgzGv9ujE885L52k/3oH
	 GLBJwhSjW5gjuuP95hX9DrWiLhW4ZtgEskWInT8cJjG03blr4wx708Rp+mN0I9lkdGBb8
	 V8RBw/U0UXwKF3HGJq8qMHdnDbMkTxLRuUBvKC9KwOFNk7Gvw0HMXyWEWirx1Fx0fVPQl
	 eFRY0/5ByGAAfPw6dWH6rV/rtKkShlz1cOrydIk62XFdx/aCeQs4Daawd9EJ1xqs4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
	b=4DgkdIallJkX+XJwR1W94HZkYpIDflM6P/qJm4qgY+b/H2kyX6J6dmxf1AGSTVbn5rmK
	 /av1mZfY+E47KEoMhHpt35YBqJE2nKVgzNThTWXJ9JofXiN4Lb6FYDZzvBl2K7qIcUt5/
	 3t6bhrV80GrySKhc0Q5f0bzVTZpev5/m4LbWiQIch0D98ymcpQu+8KDjk9oK6wQBCWEwz
	 Qaq/xkvmEc6xQPEcVLAHd6NyI1InrrDwEUBeZMpu++qsQmJa7ZK1WsWvmmlACR6yHyvoC
	 EvNeTEwAzFNDKlEUtKHaicQTlcSap4QBS4+VogAo9Riz9cYQ4enwkGG0Uqio8DyYLPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pU2zelue;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DC606E1B1
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82DC606E1B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pU2zelue
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so41581015e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541556; x=1796146356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
        b=pU2zelueugtiJV4x+NfDMs+21apnmPRZnouT5PiCVJszVI+tmNnfn8xhBnPbyQl1Kl
         VYBrVsF616QQFz6LyoYKecXfMAKvP04/qQ9r7m8k5fwXqZ/FJzj63DwKo4xmxTG5084r
         O/QyfD2sWI/rYUEHCVaAR9tkYYGb0O8sPtbmFx4ozv5Juld0vf6ylLo/As3in4SSDxZ1
         a6dfb08ECjmFmMXSG8Uz29PHRPP+XTXJYwVAIL3EdUkLXs+O3vr4DbEx6uDG8aNLNYFD
         lkbug9eLhuPyhoFtO/YMCRpfFZz+HfVI6SymN1URkgjthZrguRGlG9Kuq5aD7b8iwEDm
         ziiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541556; x=1796146356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
        b=entG8nU1dKnlQX6To6J5S61WkS2JVFYI79cG3moTSqrwhry9AqIkZV8xnrQXoXTrPl
         iar6AMdmjtdzArb1+CKzgxSuHWhlDe5a3epRgiOxBgnU+mq17YTIxzra898UaJmwIqRJ
         n5kPO53srbtdT67u1RKgSwTTDolkP0iSRjj+EqaEyquFN5s9fHxbJyS3zkxgNq9EWLPk
         Tmun3RDYDaiC72iAsYqF+2MpKvcpFz6eKFcfag0XqVUQa//3j6omFKYeSbM6Eq+Ukqda
         1XGBZmC8etFSynNFwJ7lY5HDUbm2gQyL7eGGl+yEg7+hWnjlDlLPmccuMTJMKCmyazgd
         g9CA==
X-Forwarded-Encrypted: i=1; AL+hErGb//6C9hDfDTvdVWf3vCDjEp1Y6Cp0C2d2slfoVNPQbRa74SnbhQMdizsN1wn3gZzo8LWk4J29lPNu@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZjMIA0P4r4zrNjCE3ikMCrTA0bNPpTUML1FPknopUZxQ4iIEj
	/witBIEThqpz0UWvrx3djq4HOkjXRBevb7fxriiR4+uHEgRDa8WMh1r7JP7zqPv1vsk=
X-Gm-Gg: AZFdTZdznNKXQLsjMWOAbsqBdNalPAdCcZrbEPD/+KVKCIGAUGUsjACRIZsrwQfxZmG
	fqmztPEj9JtFVpaKTfgxtiBD76mkU+XQUFD1V0ay4nIQzCLPgbRsXuCLwmpkcAsZfT7gyGeWVxw
	bhldIi5c0F70S3QiQKFazZiAnqTgj7lrSt9sNnIYDflRugbnEBYYys3zgvuFC6eoXtTm6KqGk1K
	RyTAAFI5xvBF8yErh02ZYD277dVFMopiTJcacotKzMOGpQ9I24V4mfKQjWK9s6e5YOKmvoLhrc8
	hbfARZXhNplh90ZNvD/1jl/GJdyBBZlFKS/g0M/VbNVug1FqZLG4JoPoKCl11TvVp51Ea2hLJSb
	xIseRHr958C7+zai/lIgNyqEbUV8fK04PjS9aCcSZFgz0UJlN8aC2HMeSXqZocMaggU2skt4YSF
	BijnSPG/dFu9XT06jtEBYwSCEvm3Xd6sqABcBJpLIZV9Cj0E0g2PD0dwS4/QVu1ZO3586fNvwbK
	Fwsw5Wqt/fJDYh31kH79YF0Yv0gwsqK/cTf/6iHbw9FkX5QdZG1Rea1TY/DJcN8IlAsSDkCgN8W
	BIX+blUG+szoakgPPJaCxPb22h+oCSEiS4HHMPb1MKPWsrtwHQ==
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr294089525e9.24.1795541556121;
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:25 +0100
Subject: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O/F6X827vmeWFUDFxdC8UAbpZvNVpTpLrLIF5/O087g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcojgMzsCA387B8/ryOOczJYFfBSuSxtDFUlRNIs
 YsLBkLKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIwAKCRB33NvayMhJ0Z88D/
 9vYLjUuqfzBx8dj63qy+v+m947tJ1gy2kkA7u3l9/YwA+F1BWU8jqXz9AfzeQ8uV1ngHodUxCxWIQZ
 HcBSsELEOnjCiu52F+XY2T9iACI/Z5xfxA2E9kvXLywkCYp52UbZ8vhR8y9l6S6yJGmW19zdeK+BPR
 klMNviSrCf8RjA1hr6t/yXm8V3ngePpVa1miVBjxIpZBDOJ8rmueld12NvfjnE6RS5sZY8rMaoTlFH
 F2CIINBEEH4QBT1XJ0pOD4Yav34QiWhsubbhd8UkDFUMjlyUjCV7GSMfLzcli9IZRaP5lS7PyJpB/D
 H0VrH4bicUiRFt6UbkdYaR3JdsFIdKv1s8+2IuqmZQqPfS5lWYAb6o7l4vvfGw8VbKvlW3Keu55/fl
 ilkkooR3INhZfVDOm3Z/gJ7H/F8Cff76+xmbmUTod9FcXk6TElBm9LhxZNBCaJwjEMEr3NXBfHAN/O
 IbK5vdZ+2WZEWgLEHTt3YGApWDJTQfWxqeQlFxfYr2HureJdED8YZRMRpM0Qw5FUiCcS5nQBaqZH0n
 CzMCF6TWw5S2sZaAFq/trgA3Z2sWvMKiL+2lDlpDjRlZlIPDefK9+p7J3RqNw7P7w6TQNpN8/AS6Ih
 C4vCIFQ1eKJWKwX2evU0eaT7bTdiRFZMDBJzSN81Rrz5+5pCcqQGRqX6Depg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

The LPASS CPU dai ids from qcom,lpass.h overlap with the DSP dai ids
from qcom,q6dsp-lpass-ports.h, so only match the LPASS CPU dai ids on
the DSP Bypass links, which are neither DPCM frontends nor backends,
instead of matching them on all the links, adding an helper to
identify those links.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/common.h |  9 +++++++++
 sound/soc/qcom/sdw.c    | 42 +++++++++++++++++++++---------------------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 37b185a4968f..1af9c32505e6 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -32,5 +32,14 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
 
+/*
+ * DSP Bypass links (lpass-cpu) are neither DPCM frontends nor backends,
+ * their cpu dai ids overlap with the DSP dai ids.
+ */
+static inline bool qcom_snd_is_dsp_bypass_link(struct snd_soc_pcm_runtime *rtd)
+{
+	return !rtd->dai_link->no_pcm && !rtd->dai_link->dynamic;
+}
+
 
 #endif
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..669fb63207c9 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -6,10 +6,25 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
+#include "common.h"
 #include "sdw.h"
 
-static bool qcom_snd_is_sdw_dai(int id)
+static bool qcom_snd_is_sdw_dai(struct snd_soc_pcm_runtime *rtd)
 {
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
+
+	/* DSP Bypass usecase, cpu dai ids overlap with DSP dai ids */
+	if (qcom_snd_is_dsp_bypass_link(rtd)) {
+		switch (id) {
+		case LPASS_CDC_DMA_TX3:
+		case LPASS_CDC_DMA_RX0:
+		case LPASS_CDC_DMA_WSA_RX0:
+			return true;
+		default:
+			return false;
+		}
+	}
+
 	switch (id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_TX_0:
@@ -33,20 +48,8 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		return true;
 	default:
-		break;
-	}
-
-	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
-	 * DO NOT MERGE into top switch case */
-	switch (id) {
-	case LPASS_CDC_DMA_TX3:
-	case LPASS_CDC_DMA_RX0:
-		return true;
-	default:
-		break;
+		return false;
 	}
-
-	return false;
 }
 
 /**
@@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
@@ -127,12 +130,11 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int ret;
 
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = qcom_snd_sdw_get_stream(substream);
@@ -169,11 +171,10 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return NULL;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -196,10 +197,9 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = qcom_snd_sdw_get_stream(substream);

-- 
2.34.1

