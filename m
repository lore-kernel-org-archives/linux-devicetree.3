Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD7392822
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077316; cv=none; b=lwA/TtSTSwuvqzLAWupsZ60s2r4ie7tC2Qj/k+/fOY8IjK0y3Afxr0kTB+0obf74iaOOG/1NVEIX4vb6YFits4wDOZTmLqRYK2y6YGzDlNmU7TrYQhaBCSgoQ4K4igCt3l+OBJ0d7fTBAs3yqCifl6ky0lIk3OLCyifmCdpZlyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077316; c=relaxed/simple;
	bh=SvKkKRkBVznFX5q5yYncMOx4jq7itvGv8CTS4i7bRXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pT4pQeO+6TaumpaH6JtsWgV/G7z+lb6gMnPPYwE5Wu+fZgXFtIWC8nS7041uFdeDq7ZpNE8BjrCOG911YTrnHEl4Gg2OqpmXmugOfoObrAx9klcDqtt5ZYwyCzJ1ZlJnxtnrf+Pvw4Rkp2b1PkATVazyJ6u27niiyAInXBjMJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqqbogcS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqqbogcS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so52390925e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077312; x=1781682112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHrjnAwx7+YbLQYR6LVWQgpOuTbHf+pvHyBwE/dQZyY=;
        b=CqqbogcS78HMUcP0shJdNF3iiAHe6IZHILrz188QsGbjDlTrYv9E5PHB4BllL/Rls9
         nnanvw0eyJnEDVXjtbaYSE+Z1zdlRNExjhk6GXA+2kh7jl+H0FYsZ4DWTliY6MeFSkY+
         vXqFLM3frMhKeBp7GEGOYE0S6iwE2pqKMVqb/tFJG1fDzG3NdmYU7KA53GvJNIgGHn+k
         mU6Nc8+oLAHVQVBxqou8NThCGA8QgCwRp+5hR4lIyhL0LhJ6fyj76yW5ey1mcZ6Yq1vX
         U4aiJ526NkDWqmue5XR2qniR/dRupVR4us22Qrq7vfVdkWOlXb63QOLaK25jN/a0EKXS
         qF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077312; x=1781682112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DHrjnAwx7+YbLQYR6LVWQgpOuTbHf+pvHyBwE/dQZyY=;
        b=pLQbg0T8q0WVvKt6aZVF8nsVmqEHH2DdPbb8B2t9VyKhNFLRc3kcml4mdEKXvHONR5
         ivV06ff2Dt1xPp1EwDL8U7qZOREBcWBDHen/h8z+PsS8K/KOTVc+iI2AqF3CvuvnYiPS
         uGN2QUxHIW5hdyJvf3eiKYQDgiUVyv1Dwt04pnQumDV6LxCVvq9aUVimw1xvFHBbd59K
         laV4tUQRd+/ukh9gmrrSUZoUhedUjzNVuahIC/VB8n/i28ESDqTsrg3tYn3BMST332Im
         xQU2hl3AX4/wyN8DB+zpSSf8Dzp9cG1v1CBQWJE+GWmc2WutVHqGe1OBB5ns/9gKnXBq
         6ZWA==
X-Forwarded-Encrypted: i=1; AFNElJ+nwcxAHQnpoPOAzaezMh9jTI2A2ytlckQHZ1DU6Kui32uUhPISeeiDthNiFWao+sq5UBXlly7a4h4f@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbLwFsedVyc38MLrmkavIT8PlBJA9p/wcT9HVYAYeX7rsiDFY
	oPYQllypG4PqPle3+F1CL7z7mXlmMO0Ogzq5ghwd+44k0Zl01L923Y0h9DV84+FMHeI=
X-Gm-Gg: Acq92OFMAJTX4sudTAtSaRB2VZOshgnt4doDB74j8Q2cowkssFb4WI9W33vYXIAh4DP
	5N3W8DWOf7NPG6m+rnmaKh7JxFCT+daA8mT4oCjzeM7zTk/+4U52/18j/ST5WgUN4tVV3TbjIpg
	g6YlIgjAkN37wb9lwIb0pY1dsgYoU9LGicO7Eb4h242jwudV+dHdWmTsZG3tFY4cfjEeVvS5wvp
	KeHl94bTXrxtmfRA8YFufh2K/WwisB+22gdStkDOt6ynBrs1PeefxvM7oOk6dZu3vaBOPlHtq8q
	7uTqthyyK4NSfGctBleMlcC+9UCBqosHqApRg6Vt+c+24WJsZsE4yiBCMVY5TaohVQhO3QCe9av
	+bPzBsfwfKIjZWq9AaRta917Jppzfo6tXx3jLF/fP1u2EN09VozPEs0eZDHpDUN+mceZUvO45tJ
	7mnfRKSUmXUxyhvAz9M6vGTMhYBJOdRv5iYXRTsqUrRSxbApwsbKr0as8=
X-Received: by 2002:a05:600c:3e0f:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490d72058b7mr76953735e9.15.1781077312102;
        Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:46 +0200
Subject: [PATCH 2/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with
 special WSA channel mapping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4056;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SvKkKRkBVznFX5q5yYncMOx4jq7itvGv8CTS4i7bRXk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU7trukKWsuWU99FY5/kOINnb84bqIzktsxOyWc
 owTA91qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVOwAKCRB33NvayMhJ0dxGEA
 DPOGiBlp0eanc0REwv/nEzbL79LfQJwJySMwpxZtifWxQhtl20eAarosxgogWuRx3oOE/q8cjg96o8
 Dhu1SMsOXbviJkX4pr7CUsQbDi4T3VgZG9zFhxq7bk/Tk8g/yJSowVPJ3G1oyUIwkSNkRa1WWXa+Fb
 t2Tu0yapZ0lEYms9hquU6m+jVFTBy9XQLFJofwoCWPMXyUOkDCokqvZo6JAFl91HgkK1Bv1YA4g0Mk
 agazqHFC2BWdpyDLRo6NtVliIBVe0Y7inxTkJJNz1GRoXzbnC+Vx7oe6rpFLdgsSIvTwv/wfEEQvKW
 jTf3kfA+5L3siZDB+xtFLPh/RE73uyHUfJrImGcF9zOBznB1q3RIVfPY54iLDTSadvD+zzdFPZAp9C
 O0Ouj9k9c0DkKojJ6kEFVZqUJm9ao1sK0/ny4BgIWIektzXDfut3WXymBSwLVE2+JEpvdwv6U7mubp
 p9wiGxZdM5kD6IsA49tr8nO6APtRgbNDVsGJ6A+j53yzi5wYAcmATsFMDO++Ltr1AYOWEDUcJe+tjf
 RIVkHFM8MipDgEQx6QLBwJ1/bAxdOcMujVMY0W0N4tx0Nu2ZiFs+p5uTtF1bpmUR1Dsh9E7eIz7EOz
 JEWQG75htPkHWkSpPqlekDzfwJoAiRzxaCAuYCerY/Y/st7ibyb5JFoXxjew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The WSA Speakers are connected on the WSA2 interface, but the
WSA and WSA2 links are handled as a single dai and DSP interface, so
we need to specify the channel mapping of the Ayaneo Pocket S2 for the
WSA dai in order to have functional playback and avoid DSP errors.

Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
callback in order to set the proper channel mapping.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1f3afc6d015c..2f1688c9f317 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,6 +14,7 @@
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6apm.h"
 #include "qdsp6/q6prm.h"
+#include "qdsp6/q6dsp-common.h"
 #include "common.h"
 #include "sdw.h"
 
@@ -49,6 +50,7 @@ struct snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
 struct sc8280xp_snd_data {
@@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * WSA and WSA2 are handled as a single interface with the
+ * following channels mask:
+ *  __________________________________________________
+ *  | Bits  |     3    |     2    |   1     |     0   |
+ *  ---------------------------------------------------
+ *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
+ *  ---------------------------------------------------
+ *
+ * The Ayaneo Pocket S2 speakers are connected only to
+ * the WSA2 interface and the WSA interface is not enabled.
+ *
+ * Set the channel mapping on the WSA2 channels only.
+ */
+static const unsigned int ayaneo_ps2_channels_mapping[] = {
+	0,			/* WSA Ch1 */
+	0,			/* WSA Ch2 */
+	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
+	PCM_CHANNEL_FR		/* WSA2 Ch2 */
+};
+
+static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	unsigned int channels = substream->runtime->channels;
+
+	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
+		return 0;
+
+	if (channels != 2)
+		return -EINVAL;
+
+	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
+					   ayaneo_ps2_channels_mapping);
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 
+	if (data->snd_soc_common_priv->snd_prepare) {
+		int ret;
+
+		ret = data->snd_soc_common_priv->snd_prepare(substream);
+		if (ret)
+			return ret;
+	}
+
 	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
@@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static struct snd_soc_common ayaneo_ps2_priv_data = {
+	.driver_name = "ayaneo-ps2",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.snd_prepare = ayaneo_ps2_snd_prepare,
+};
+
 static struct snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
 };
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
 	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
 	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
 	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},

-- 
2.34.1

