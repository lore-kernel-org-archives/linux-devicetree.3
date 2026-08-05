Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C463F326E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920730; cv=none; b=grcXRBb+y48kl6+fApMnhzOaNwOGMAte6RrO84r3VppTZFKnemT4dYJMGchNzOuXd2OlOva8JKvdK/D0roI0+oiLe8mUMkvXrZNNX2oU903U0gETo+FnlX41kANk7RHuyBtFUKfs1g0kWyWrleCB69I8ndDXln/3X8m1NgUdQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920730; c=relaxed/simple;
	bh=04zhSZ670lYOcIV4KZHkxxs+lNy0FvVzAb9cYGTI2PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS6S8obKLU3Ze6VcsYNtutQZwuNeES5HCl7RIoI4a5NdamIQf0zVmjbUdIy33qxHsCG3fI0sv40Bo92+s3ne3qaWJ9ocXQYqoq6UiW5FcHseZ8OLRm5ADNMEuqmJkRIAbkRV+KAD7nWvzc0l01D4Yxf3ToVNaCtEbEdhzytqmog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUYWByuC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUYWByuC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc97653887so8822425ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920718; x=1786525518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpmaDgjr0urIee4VasgeTATeKfxoGE87IfxMDoS57nE=;
        b=FUYWByuCfYiQPLcAOaas+w7OYldeLeURcJmQLJuV6I3oFCjJVttVSfkmNu97TXZlEF
         N0uQ1MYs24vYQt4b/OnNSQikJm4At3ihR+ZmIhbQEou3VY6DVz05EgZ8t2EmEcQHnT7F
         rTqs+PqEY5B2KVqQZKchk05TSdmMqDQ2DI78fY1yUj7PxmpT1HYHT+SQ9EgqugkUMz/S
         h0zHqNgydsqLPAZvikOJtyrmmPs0YqlLdIrPWuXU/xcnT+7xp8rDcFT4xIYVv655uMZ+
         Vhi9gk+AZk2qToLE6c6RFEqX4whr6DOPKcpDP4yWo9MawBofj6VQTJ4UXtawoOsOy2Tw
         flvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920718; x=1786525518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpmaDgjr0urIee4VasgeTATeKfxoGE87IfxMDoS57nE=;
        b=CYBVOPg3xS341DtnNMlP9vWmT+/OhZwN+k+04tR/LypAX95HGm42k5vY7GRJvNVpb2
         MZN26nGTsbXZ5Yl64E0o6MFfCGTXlJzyxZ8ROy4GKjrL6uVY8a1kgtoysqQQ+iBlfOi3
         SqVp5SKo94a5WFa5aDmm0HZ4XPMbx53v+RnHveIBzdkJvj/8Ms1Y6al61AlJSYdzcNV1
         rrtwghKKSEVcAa5erVyfxWYMkR8nAgsGNURSrqKH39GQN+KbAcFagvyOnQS7s+K/wVhr
         v6hQRm1wYNzUfHFC3wlhY6+TYyOGi8W1713StKrTJMXaBreG+o72kkC5pBgiqe8ecj5U
         7fGg==
X-Forwarded-Encrypted: i=1; AHgh+RoViENra9/pGM4fhqQPKjvhKb4swVJffmKppxBBXn9174JyLIrDIbEP2Acv7LKmtmH4x33XzKDk5iWo@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBgmjB14mylvbjurL95H0R5cL7//X9GsENRpJo4M/1I18aoto
	wuWi52THpy5ijk5yLbde42KNvXdCBQT2RmTQuopIVzc7XJKzN/lrPqrT2mxXqQ==
X-Gm-Gg: AR+sD10UZATzqKXMcp2sLMWn1hHA4/kcNI5QYMr+VwHakpWsSBvLW9N5DM0+7GYMhVH
	ogD3DN5UcQa1D99IseN19CCJQyInJJdzzbS3YiSZFRwSZUNKrM+ro4cJVjlbqHXBDPrxwL2/tjB
	jb/qC66nA8/n9Ijqw8nbNz0o9paFQJ2Xf2YSTzMxdznWeeye3dF468AKMrLeFursBRegKIMXXqE
	+iTFHai/FxsJEbrRpKvDCpnQPAA3Um6BcHhJWDRmJkv8SOK0xgaz+imse6jAAoYPJ9GDV0tR0Sz
	AAjn5vn8HPI65wK4M0wIYynwtROHGIgopzG7ERqgAOfZsHcGBxvb2ejg0qqcnTRXDAy7F7z8Kzm
	IjHDsN+bk+u9y/wdxE3J1BCxU8AusdqZ/jApAB+RqkgfgPs8R+RuyLnHx+d90SPQQcQWXFI+vBo
	M6ZUetTbgDJzX/bbolRiXITQwNU86vHkusrGt50rfWyLWRI6c92/7LJxi4PJaKHrUC1A2IYbruE
	5tUj+rHjtNKg1dg5CKFmsM7Sz6o
X-Received: by 2002:a17:90b:2745:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3903c535d84mr6018465a91.1.1785920717467;
        Wed, 05 Aug 2026 02:05:17 -0700 (PDT)
Received: from [172.20.10.2] (114-137-35-218.emome-ip.hinet.net. [114.137.35.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903927dddbsm2516074a91.9.2026.08.05.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:05:16 -0700 (PDT)
Message-ID: <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
Date: Wed, 5 Aug 2026 17:03:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/4/26 23:58, Mark Brown wrote:
> On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <sound/soc.h>
>> +
>> +#include "nau8360-dsp.h"
>> +#include "nau8360.h"
> You use bitfield.h so a direct include would be safer.
Got it. I will add #include <linux/bitfield.h>.
>
>> +static int nau8360_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>> +{
>> +		break;
>> +	case SND_SOC_DAIFMT_LEFT_J:
>> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_LEFT;
>> +		ctrl1_val = NAU8360_TX_OFFSET_LEFT;
>> +		break;
>> +	case SND_SOC_DAIFMT_RIGHT_J:
>> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_RIGHT;
>> +		ctrl1_val = NAU8360_TX_OFFSET_RIGHT;
>> +		break;
> NAU8360_RX_OFFSET_LEFT and NAU8360_RX_OFFSET_RIGHT are defined
> identically, presumably at least one of them is wrong and certainly one
> of the above cases is.

Thank you for pointing out the problem. There is indeed a mistake here.

The configuration missed the left/right justify settings. I will correct 
both the register definitions and the case logic in the v8 patch.

>
>> +static int nau8360_set_sysclk(struct snd_soc_component *cp,
>> +	int clk_id, int source, unsigned int freq, int dir)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	struct device *dev = nau8360->dev;
>> +	static const char * const idtab[] = { "DIG", "ANA", "Internal" };
>> +	static const char * const srctab[] = { "MCLK", "PLL", "HIRC48M", "BCLK" };
>> +	int ret;
>> +
>> +	if (dir == SND_SOC_CLOCK_OUT) {
>> +		dev_dbg(dev, "sysclk: freq %d (out)", freq);
>> +		return nau8360_set_sysclk_output(nau8360, freq);
>> +	}
>> +
>> +	switch (clk_id) {
>> +	case NAU8360_CLK_ID_INT:
> Usually we don't have a lot of fine grained control of the internal
> clock dividers of the device, things are a lot easier when the device
> just figures out what it needs based on it's input clocks.
Thanks for the feedback.

To make sure I understand: Should we remove the internal clock IDs from 
set_sysclk and handle clock configurations automatically inside the 
codec driver?

Does this mean we should avoid configuring them via the machine driver 
entirely? If so, what is the preferred way to handle clock fallback when 
playback stops or MCLK is absent

(e.g., via PCM shutdown hooks or DAPM events)?

>
>> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8360->regmap;
>> +	int ret;
>> +
>> +	/* disable Sense at standby */
>> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
>> +	snd_soc_dapm_sync(nau8360->dapm);
>> +
>> +	ret = nau8360_dsp_setup(component);
>> +
>> +	regcache_cache_only(regmap, false);
> We start the DSP with the device in cache only mode - that seems odd?
Got it. I will fix this in the v8 patch by disabling cache-only mode 
before DSP setup.
>
>> +static struct snd_soc_dai_driver nau8360_dai = {
>> +	.name = NAU8360_CODEC_DAI,
>> +	.playback = {
>> +		.stream_name = "Playback",
>> +		.channels_min = 1,
>> +		.channels_max = 4,
>> +		.rates = NAU8360_RATES,
>> +		.formats = NAU8360_FORMATS,
>> +	},
>> +	.capture = {
>> +		.stream_name = "Capture",
>> +		.channels_min = 1,
>> +		.channels_max = 8,
>> +		.rates = NAU8360_RATES,
>> +		.formats = NAU8360_FORMATS,
>> +	},
>> +	.ops = &nau8360_dai_ops,
>> +};
> Do you need symmetric_rates, the hw_params looks to program the same
> registers for both direction?
  Yes. Since playback and capture share the same configuration 
registers, I will add symmetric_rates in the v8 version.
