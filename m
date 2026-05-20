Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35634887C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247356; cv=none; b=ayf47RgQEakMzqykCA2U7FUdXmSRCiGu48OjVlOMO/e/8QikmfwmFiORfYX793raRD2TuDTIvDxTtOEwSDEt0S3S33xXq/ojuvcO7tcg/KOyDlpVSDEWgkixAva+f/xV45th99rgshj1xRg/HB9ZP4LPXwwlx2FU8s7Ab2uzoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247356; c=relaxed/simple;
	bh=ei3iX3ty2QTKGrneUh1zGDNiz5REpPaYbzRa82q2ktU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOI7S30nJmuMlzyNNrHeJQuEuE5uMZHYVfWuOtFZFlUzyDzVEf0Hvb/aPloIkshTNwGtKrM8q0qVkn+sLvCkKLaCZ3AFBmIfdglfyV620blV3vM9sgVfj6RJAp2uQPidCwyrinwJhXmZiGuB/K4VJNhQjgKExFRma0ywrXVps78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4j6okT6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4j6okT6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4650d5f5cso16753075ad.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779247354; x=1779852154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gOzexMH2hKgTQUFcH3tXXCOgRhXYCHTHpvXFLrrJNg=;
        b=n4j6okT6iZrxG5PxQSFIqhsUA+Zyt87M+xftp/4pjUAMRU2jotFvkq5d3DShCuBeyB
         jZHm7iU6cYjMPepH12ygqLjsdlT6RLFLae67iu/xdb5u6PmaCsvR71nhoy35xcEz67u8
         Nolgqd3cra4R8tqzJPsyC6U67AmVv339AENSq97jWrdhlSmC2gvX0qVgSRLBG8UKyYTs
         YFuhBClk7stFmz3AQImMx3K98t9ivx1a9GCOJvZi1c8Va0jRdPfd7y3j+AYcP56ZIbU/
         JAR3Uu0THvGiWjfYVoW2GFGENzRXrUJol47yZDWvbHkP15yLZkcSmgnKDZLyGB5hL8A3
         i1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779247354; x=1779852154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gOzexMH2hKgTQUFcH3tXXCOgRhXYCHTHpvXFLrrJNg=;
        b=tY2lDIn03qi6nFHDbvRLtIEXDXRFMwc/Y2aDNaldDNhjqkDZokpx9K3a1Wg5dqz3eV
         ewogK5Um/XRbI/cGZ9alLG0w+uhecQgAK9wEH6IFUCNPD9YDOqCGbLaiFDFe14wB8bwp
         jYE4PmY07K3pI7gBuwRJBBvE+Lny37WQ2bvC99/AkSHGl4+YUGNkCpgubxe2A9qUN5xe
         qwslweZ9+2SSsDcZZKikYbIsngJoHCNAQLQil/TsdCg5yf38W7Xnv90LZJ6aACN1/rDr
         qBYQU940B2jG1R6TrAQDzbCU0KZERJqIOZtVo6I1IEUwQXL7H1hHp+F7Dmod6KSJ12PR
         fByg==
X-Forwarded-Encrypted: i=1; AFNElJ9WyTHRHum9XmYv27geDHtU7YL3nmbHO3U249vMJF2eg00Y30ePKf0JA76qrjtlPlTHjvEPS0gZaZoW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87KfTF+TnYvLo7AT8n0Jqntf+iq9Ynsj0tC5OoE8HNyFiL9ih
	W7Cqc38eElyNru0AMKXHiSQ1qAcFy7G4JQ+ty1kCG6W5U3y8mQqFTsim
X-Gm-Gg: Acq92OFYQ154Ro0KWSIL+AkCRn3BjUD9eKoGCZxLbe2SkiyHD7WqfC940SdKfZvXopd
	q3+ntSNU8L3+cjh54g5xpl10PETXIab/F+nmdpB76B9bcX0peC2GDkLlBNOUpKsvxVfcIe0bkUL
	gmw5KNgiuNnfxLkI8UV8t0665hgfmrW3XI9hZa7hPJ+0oQSET+htRHZb4NklP7Wleh5A8l79aXZ
	79s0OaIPLxeGAe/wQl/iO0q0XLKJa4niDyiHF8ptBkX1z2G1bESYkn+O3bwCvpCRnZiZsyBmPH9
	EzQSvuWBGN/5IJmG3phJihHQmeexGz1QclpOA7Jw12ifS8VHtneAXldDaarymRIYTNMlySzcGLt
	rcr35Io0Iyfix/no8Tror47v1M9ppuc/zKL+FhUBC9S5pFJHqE1dQ3ph241SrSCvF0PuDdttaRX
	xgxQRcE1lKAepcfpad/VcnHToCGJ0M2HNiWACj9LlTECqNHFvkxu30aggpVoztwuhkdxSGHuj2f
	Q==
X-Received: by 2002:a17:902:d4c4:b0:2bd:93b0:2c18 with SMTP id d9443c01a7336-2bd93b02e88mr213130625ad.9.1779247354150;
        Tue, 19 May 2026 20:22:34 -0700 (PDT)
Received: from [172.20.10.2] (114-137-66-169.emome-ip.hinet.net. [114.137.66.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f8efesm208043135ad.55.2026.05.19.20.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:22:33 -0700 (PDT)
Message-ID: <8ae73a03-fd23-307f-8e0b-7145f2090151@gmail.com>
Date: Wed, 20 May 2026 11:22:29 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-3-YLCHANG2@nuvoton.com>
 <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <ce8d5ba7-22aa-47ac-90ab-026ed1ee3928@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/18/26 19:35, Mark Brown wrote:
> On Mon, May 18, 2026 at 10:47:04AM +0800, Neo Chang wrote:
>
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> ---
>>   sound/soc/codecs/nau8360-dsp.c |  704 ++++++++++
>>   sound/soc/codecs/nau8360-dsp.h |  117 ++
>>   sound/soc/codecs/nau8360.c     | 2334 ++++++++++++++++++++++++++++++++
>>   sound/soc/codecs/nau8360.h     |  904 +++++++++++++
>>   4 files changed, 4059 insertions(+)
> There's no update to the build system, this can't have been tested.
Thanks for catching this. I will update the Kconfig and Makefile in v3.
>
>> --- /dev/null
>> +++ b/sound/soc/codecs/nau8360-dsp.c
>> @@ -0,0 +1,704 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * The NAU83G60 Stereo Class-D Amplifier with DSP and I/V-sense driver.
> Please make the entire comment a C++ one so things look more
> intentional.
Got it. I will change it in v3.
>
>> +static int nau8360_reply_from_dsp(struct snd_soc_component *component,
>> +	const struct nau8360_cmd_info *cmd_info, int data_size,
>> +	void *data, unsigned short dsp_addr)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct device *dev = component->dev;
>> +	unsigned int payload, *data_buf;
>> +	int i, j, ret, frag_len, frag_payload_len, data_count, len_pos, pad_len,
>> +		pad_len_exp;
>> +	frag_payload_len = frag_len - 1;
>> +	if (cmd_info->msg_param)
>> +		data_count = data_size;
> This is the only place where we initialise data_count.
Got it. I will initialize data_count to 0 here in v3.
>
>> +	/* check the reply length same as request */
>> +	if (data_count && (cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_RSLTS ||
>> +			cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_SETUP)) {
>> +		dev_warn(dev, "payload_len %d, expected %d",
>> +			data_size - data_count, data_size);
>> +	}
> but we use it unconditionally here.
>
>> +static bool nau8360_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case NAU8360_R00_SOFTWARE_RST ... NAU8360_R02_I2C_ADDR:
>> +	case NAU8360_R06_INT_CLR_STATUS:
>> +	case NAU8360_R21_VBAT_READOUT ... NAU8360_R22_TEMP_READOUT:
>> +	case NAU8360_R41_CLK_CTL2:
>> +	case NAU8360_R46_I2C_DEVICE_ID:
> Are the I2C addresss and device ID volatile or do they just not have
> defaults?
For NAU8360_R02_I2C_ADDR, it requires a write operation to latch the I2C 
device address.
For NAU8360_R46_I2C_DEVICE_ID, although it is read-only, its value is 
determined by the hardware configuration
of the GPIO1 and GPIO2 pins at boot (e.g., 0x1a, 0x1b, 0x4a, or 0x4b).
>
>> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +	unsigned int rx_mask, int slots, int slot_width)
>> +{
>> +	struct snd_soc_component *cp = dai->component;
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	unsigned int tx_slot_used = 0, rx_slot_used = 0;
>> +	int i, func_slot;
>> +
>> +	if (!rx_mask)
>> +		return -EINVAL;
> Specifying no slots should really be accepted as disabling TDM.
Since our TDM and standard I2S share the same hardware enable/disable 
registers,
we cannot completely disable the interface here.
I will change this to bypass the TDM slot configuration and simply 
return 0 when rx_mask is 0.
>
>> +	if (source == NAU8360_CLK_SRC_MCLK)
>> +		value = NAU8360_MCLK_SEL_MCLK;
>> +	else if (source == NAU8360_CLK_SRC_PLL)
>> +		value = NAU8360_MCLK_SEL_PLL;
>> +	else
>> +		goto err;
> This should be a switch statement rather than a cascade of if
> statements.  Thre's a number of other examples of this.
Got it. I will fix it in v3.
>
>> +	/* defalut disable Sense signal after booting */
> Typo of default.
I will fix it in v3.
>
>> +	/* Set HW2 default volume */
>> +	regmap_write(regmap, NAU8360_R97_HW2_CTL7, 0xbf66);
>> +	regmap_write(regmap, NAU8360_R98_HW2_CTL8, 0xbf66);
> Most user visible controls like volumes should be left at the hardware
> defaults, that avoids encoding some specific use case into the driver.
The user volume is adjusted via the DSP firmware.
However, HW2 is a separate hardware gain stage that
we intentionally do not expose to user space as an ALSA control.
We have to write 0xbf66 here to set its required default value.
>
>> +	/* set GPIO3 MUX as Clock output */
>> +	regmap_write(regmap, NAU8360_R09_GP_CTRL1, 0x1e9e);
> This feels very platform specific and should be configured via DT or
> quirks.
This was only used for internal debugging of the codec chip. I will 
remove it in v3.
