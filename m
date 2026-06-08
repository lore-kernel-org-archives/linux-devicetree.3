Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD73A16BD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907021; cv=none; b=ghzsjs9F1A1bbkxT7g2Quh9ev7XtEY9IJ2w8BmaoKTsDd75o+1kWedin7s03rSzRM24jqVptbJRBngDVV9fOb8b+bVLxybeIjheKDVgeg69woMJA0PiRPAqWlQ2bmtlQTnOAsPIxSBjjn3/OYcQJFoW4QHGy8az+64x7ahCZQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907021; c=relaxed/simple;
	bh=r0GWKbt0KfiG2UapGCknRA/prOE3vHCrcNgeNB8htCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGn7trJP9brzOvV4Nxp4rMGk4J2+uybQ1doaKDBSdUjZ1Zw0Hc++LxRQ1QcWWuAxWttAhYP2E6hbiQVjCAa94vGcDqydnd1iE2txPreQqKHjS28xZo6QtLRN9vzmYnN7wrh6jqjQWL5+CUY+a7HJ5dokXCi0kaoQDDGCvSo847E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPZrtNq6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPZrtNq6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4908b92904fso45828255e9.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780907018; x=1781511818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGQ/7zWk9AsykTIEFhta6IENd1hVluGDPOK1Lw9aOrg=;
        b=xPZrtNq6igA76wAUFGVkzmp1lZJPKb62AmN4E9sGSawqKpWwEaRcBvaxfx5fLF2/BL
         m2ibcIWhEUfoH14JsghB3f1bDgw8A7aarz336NQ+GkH1Uw0cY4fvnH47HpfkKOlbNVrj
         J8T7oDkRrfXdWxoLM7HPFkJ6LkDKovgMUfUJXCwEWhhSgeKurlBkZVbRNnSnfrpgnTXZ
         AhYZN5x0Lxtl4efHHZQioGKgPVT51oSmcMH39R48hNzg92xEMzwCN4oB+JbW9fOQeoXp
         jgF4KRbUVLTlcwmJBg0KkMgnCvOqMsnbNRhUVMo5GtYXkicZ7Fd+2f6/7RDt0MvqMptW
         PMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907018; x=1781511818;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGQ/7zWk9AsykTIEFhta6IENd1hVluGDPOK1Lw9aOrg=;
        b=geQpKcyryjuu7THIRwi0JYJwMD/RpCVcpdB0OnyXOk/nEstqiYAGirIqmj63xL72go
         YqJFe4J5N1qUgFMOI7mdq/5AaFPAwXKMXJ3ffED0uYzoXAc/jATYgvR1MyrdMcJHR17X
         wP/8l8+LwnvMjOwwZnaxTLn8S4Xs0XJGhBYt2I1RvlWTGc2u2Xzk7jbayukup/A/gvOE
         aQ28ytjzaqpwHY7rogGVV4BsxrqTRhVK9reEC1dOEQ6TjBcpbJQpNL55wH1YNVcQEc/6
         MdLKszVBtH+ks/Van/d6pd4foneXsZIjb1T2QdX3rESa5OMqNLaN1yv6FsjqaIwh7Fg3
         kzzA==
X-Forwarded-Encrypted: i=1; AFNElJ9XoyS7NNBdxGT9K6OKAGKxhnt2m0V8gBEGEc59i5Uilv4363GA1fDq0ECmfrEV6MZn3zgJmpmr9Op/@vger.kernel.org
X-Gm-Message-State: AOJu0YzgP5Y3w9fNtSRnZwmZjzzB+1GTA5Vey3xF9eKEa/NjFTYXJmMa
	OnP0fA1cUwBmLedDzk2hRMelwJ6iMhFxGtuPxZir1n0Iqf/VDMZFkqQAsx+z4tgVSWA=
X-Gm-Gg: Acq92OHlOVJOs0ossowF18xyzVF6nKK0Q7RKG1nCShtS79hGr+6Rp9COskSd5TRLsf4
	R0HRkJvl18ecrL+JCPT0jKdnO/T6X8xzHQd4ONlHR1fqt9UZL1JCXLkCw/9b96e1ZRLK4CSNLMt
	8PsPjEl0PA3EA6rHSfpyBt5kTL9WUMOCH6NCzwkTE7nVcVb2hRzcIVMmIxBnfUmZV8TuhzVXczj
	67z8sTBHu2VDy/ZX4DDYfRiQqQ52sOp3w6UZE0rX5rfTImnVNkBqNnvQZuooAncWos0zPaikOO7
	LTlBhK1f1spiJjP02Ym49FqctdGaEk7jAoCcR0GaWo3z+SJLSTTQutW/mWCqrQmXpKrYsZ4QN4H
	tSSvTIsqAIbJW1+rFS6utOynJ//Qa87x9ihcWyu+XW1Ckk6s9vhyuy/Vl0T5d4E/a1usxGRmnfr
	0W/kNQHwHAeQpqCzgFjfmcnq+HbXOQKVuT7b3hcf3qpuz25Wg0XrEp515pK/at/v1DdJfd44veR
	3b5CplkscUZof8=
X-Received: by 2002:a05:600c:8a0c:10b0:490:c682:e37d with SMTP id 5b1f17b1804b1-490c682e39dmr105477495e9.32.1780907018172;
        Mon, 08 Jun 2026 01:23:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aa0b:c7d:a032:4c3a? ([2a01:e0a:106d:1080:aa0b:c7d:a032:4c3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm379335455e9.6.2026.06.08.01.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:23:37 -0700 (PDT)
Message-ID: <dd20a233-4c42-4eee-b856-a6a988892ee2@linaro.org>
Date: Mon, 8 Jun 2026 10:23:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/8/26 04:30, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> Each MI2S port now retrieves its clock handles from the device tree,
> allowing per-port clock configuration and proper enable/disable during
> startup and shutdown.
> 
> On platforms such as Monaco and Lemans, third-party codecs are
> hardware-wired to the SoC and do not always have an in-tree codec
> driver to manage their clocks. For these designs, clock line
> enablement must be driven from the platform side, and this
> series provides the necessary support for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility
> for voting I2S MCLK and bit-clock has moved from the DSP to the
> kernel. This series introduces the required device tree binding
> support to represent and vote for these clocks from the kernel.
> 
> Enhances the sc8280xp machine driver to set the boards spacific
> configurations.
> 
> This series depends on:
> - https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/
> 
> ---
> Changes in v3:
> - Added a detailed commit description to clearly explain the need for this change.
> - Improved the machine driver based on Neil’s feedback.
> - Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
> Mohammad Rafi Shaik (3):
>    ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
>    ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
>    ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
>      board-specific config
> 
>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  57 +++++
>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++-
>   sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
>   sound/soc/qcom/sc8280xp.c                     | 213 ++++++++++++++++--
>   4 files changed, 391 insertions(+), 20 deletions(-)
> 
> 
> base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
> prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

With:
```
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..69327c4857e1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
  				sound-dai = <&q6apm>;
  			};
  		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
  	};

  	vph_pwr: regulator-vph-pwr {
@@ -853,6 +869,7 @@ &i2c6 {
  	lt9611_codec: hdmi-bridge@2b {
  		compatible = "lontium,lt9611uxc";
  		reg = <0x2b>;
+		#sound-dai-cells = <1>;

  		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;

@@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
  		vdd-supply = <&lt9611_1v2>;
  		vcc-supply = <&lt9611_3v3>;

-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
  		pinctrl-names = "default";

  		ports {
@@ -1072,6 +1092,19 @@ &pon_resin {
  	status = "okay";
  };

+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk",
+			      "bclk";
+	};
+};
+
  &qup_i2c3_data_clk {
  	/* Use internal I2C pull-up */
  	bias-pull-up = <2200>;
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1f3afc6d015c..7b34ff533e0d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -320,18 +320,36 @@ static struct snd_soc_common sm8450_priv_data = {
  	.driver_name = "sm8450",
  	.dapm_widgets = sc8280xp_dapm_widgets,
  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
  };

  static struct snd_soc_common sm8550_priv_data = {
  	.driver_name = "sm8550",
  	.dapm_widgets = sc8280xp_dapm_widgets,
  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
  };

  static struct snd_soc_common sm8650_priv_data = {
  	.driver_name = "sm8650",
  	.dapm_widgets = sc8280xp_dapm_widgets,
  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
  };

  static struct snd_soc_common sm8750_priv_data = {
```

Thanks,
Neil
