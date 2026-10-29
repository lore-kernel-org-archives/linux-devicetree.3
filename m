Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240818;
	b=D4jilcWGK/MrmtpfvjSXlorSJVlnf44ks4PaF7MstZMvEzF5+sZcUufz0g+r/tCvR9D0
	 UC3GM3gNQ39z5F64G8wRPCr6wGMBYTE7t9nYH3AlktSivTPSAhpL2//O8+INZJRUvDJ2Y
	 eD6xiEGHn/7wf3WaEX59hvo52FPgMefdC/rH4tgGEiXeoxn2ewe5G1zuKJqBJTP+WYQ9j
	 1HI6ElQh8V2i2j6M1FzUGC0I26RPwlfYl9/h6naNe2lxx49wOlf33hR9uvGk269bK4PtN
	 CAhkNzv+m+BkPlNgA7wR6nyZKYXh/18oDpUgG4tH3t00lhpl5hQQnQA3UrU84+AfQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
	b=bpb9AlHos1dLksKZcUPLJ6SvYVmwN9bKKkPmHIiLtA9xFtkTdpKAEOhsHLiC/ZvDVIrH
	 nmC6N6goh2/XXX4TfAiIum893m5TQo7Eb44HL1qG2qOSXJmZVu3QFvlJe6vKtSUfWI4Nu
	 Cko3wyb4T91MIaznuInw74xehjGNUpHPpGgSFh/3i0Gh31uX8zMncBRd7ennETgic5x72
	 +/zIZKNRMCh4oYLjNQO7PjJ4dZQWS/aBuZivm6SAjrpzjyZOqrc6GE7L5cA4Tt5/5DaNR
	 X6bCNGZveOew+RcuaXa729vxWXgSfHgqL4wVvPzDjF7ptUcKpXAzxJdl0Uuny7UiEGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYCs5a2Q;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AACB606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AACB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYCs5a2Q
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a17a332ecso2326865eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240817; x=1793845617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
        b=hYCs5a2QpeI/JDuPb6nWYmfPm1zkKWbG5Rj+68tdSyrFPHJx8TjNgnQcQpKfJV7omu
         ALqqB9NACqE+2UR0AMlIeslx8TGv5DAQUstJ1uVkelrNmMQM3DVCnu509p8S8om70+Yq
         0LprqcsGYFmHvBro0dBFYxH2uhmt4iJrYgQEMAiqS4u51/+OM+oVwxLTZhqMQHWNvp64
         hUomdJDe5HjM1xa25hcGau5Z2LNsAcZpXmHh2Oq0vQvfk45po57TDIpPd93WIyprCN1V
         zKc0xJUk0kIFleiGdwHOB1/Y4aqjBlM8Rc/+gru4z927kmBXdf7pHe/Q2ZMBRLmJRCSD
         tKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240817; x=1793845617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AQIVWKkCVoDQO4krIZozOYGjgLAL/sNPSz96FkGeQQ=;
        b=xM4dJIRfX8eeYRDqGDoL3o6w+BmyTFmOAn1UxWL+DZmnaWETB/NO6gGX2cLy2SdWUO
         ZKmzvg01MvKeUHSRSDP4280RrWee7EpMEm7fzi2hwwQccNWsoIoU8eJjBHgrdAUcAbsQ
         ubaEVxK7JLQX3pLB58ASLID7ebpW0wBzWBDxKZAHSkJs1JHH3rSyHBo/uEx0mhbDumTG
         o708MPo96cSMUBtA4ZLmq+gwf5CeNOBSDYDKYbLqu0jjJZyUVbpdO1gYv/DuOvsnxrUR
         Rry5z4fLYs2/mKmzkIdAYwUJhZU81oSI/5ivKTpSHv2h+uOank4BQwby7kT6Y/hB07qi
         HqNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3S2WN4AwduLOfMAiijTu4PptBkZUSGT3ooSpG5kaKaGqk1yXc04VVYVJqhNDPBrI13Zc7hLNbr7dY@vger.kernel.org
X-Gm-Message-State: AFq9FYKLuCh6NN2zqAVVMFAs9iYIMR5olESLhDHhFkYkquBnbVGi/kYX
	44myyHJ65vdDx/lfNRge3ST59Wiz/U6pyb4OfQIVm7nybTsZ8SmzQeEl
X-Gm-Gg: AYBFou1+q6iL90Octlfo+1a5Yx3nlaEumkw+7cBAT5tbMjP+m4eGq71cKiF63bsOo5F
	QgwfoNrvX8Jsly53GpijK7ngPye8hHrGPGFBmH5YEk82cLuZI5BcrjMNVohGN7ZWLtdq3F7Y3wT
	bGR8Dub3cAiZUnimIjFqDozOYozVtZj4hqHLxb26eVnJ37X12dHSpPpHdKUeGRONMRMEwUsn9MX
	0ZfUdp9vXVq/BGrPPFuX9lFJ2sRuIhqrOrAqG2TTK/oA6FZUjRPGpU8C8N2zsuvBAnwuhJIgDx5
	JUTYObwPT5Ws79UVb+WGRoQQd4ODsJLWa12lLEXjSaucCu9yYXMqRQ6yzYuMXc0Mdfn4n8aPz3p
	Hduc8NfvvKHb3Zl6uo7s0IAU4nrfNHYMBtBb/ymVSP0uMUUuB2A7sWXOuMN2OFqcAtCJHIAsE0T
	Q9Nb3UyJuzMHXHSifvS1M5ZZr9RONz+l6PYvmaQnla3fLEunEfHFANOXyspGYiZRRn4dJkKjmG6
	Fpf0mc4E/orguYj6iCevTfFmG7NCoMSFNuw7Kou7iSWPG605jR0Lnq01k3hFjCWe8si8QCmU4TW
	XGSt/02MwUFk5y+onWODMpqAROE9yR1tcwmFR+dYgzegXb8K7YGlCGDB4CibZuipYGui/r6T0G8
	qOBesrRbIh/hNIQ==
X-Received: by 2002:a05:701b:2702:b0:151:ece6:b16b with SMTP id a92af1059eb24-1a6cd499c0bmr5014472c88.7.1793240817266;
        Wed, 28 Oct 2026 19:26:57 -0700 (PDT)
Received: from [172.20.10.2] (114-137-68-118.emome-ip.hinet.net. [114.137.68.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm11838778eec.5.2026.10.28.19.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 19:26:56 -0700 (PDT)
Message-ID: <0752dec9-2de8-43fa-931b-27e1cae6e1df@gmail.com>
Date: Thu, 29 Oct 2026 10:24:39 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-3-YLCHANG2@nuvoton.com>
 <179304693306.199157.5210648249546181520.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179304693306.199157.5210648249546181520.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/26 04:35, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>>   	imply SND_SOC_MT6660
>>   	imply SND_SOC_NAU8315
>>   	imply SND_SOC_NAU8325
>> +	imply SND_SOC_NAU8310
> Please keep these sorted, same in other places like Makefile.
Got it. I will fix the sorting here and in the Makefile in v2.
>
>> +static void nau8310_send_data_payload(struct snd_soc_component *cp,
>> +	unsigned short dsp_addr, const void *param_data, int param_size,
>> +	int *frag_cnt, int *padding)
>> +{
>> +	const u8 *data = (const u8 *)param_data;
>> +	u32 payload = 0;
>> +	int i, data_size = 0;
>> +
>> +	for (i = 0; i < param_size; i++) {
>> +		payload |= data[i] << (data_size * 8);
> data[i] will be promoted to int which won't DTRT for values with the top
> bit set, cast to u32 before shifting.
Thanks for catching this. I will cast it to u32 before shifting in v2.
>
>> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	int ret = 0;
>> +
>> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
>> +		ret = nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_CLK_RESTART,
> This needs to take nau8310->lock to avoid races with firmware load.
Got it. I will add the lock to protect this in v2.
>
>> +	dev_info(dev, "Algorithm of DSP is ready, status %x", status);
> dev_dbg(), this will get run a lot.
I will change this to dev_dbg() in v2.
>
>> +	dev_dbg(dev, "Request firmware and wait until finish.");
>> +	ret = request_firmware(&fw, NAU8310_DSP_FIRMWARE, dev);
> We have a firmware-name in the binding, shouldn't we use it?
I will modify it to use nau8310->dsp_firmware in v2.
>
>> +err_loaded:
>> +	regmap_update_bits(regmap, NAU8310_R13_MUTE_CTRL, NAU8310_SOFT_MUTE, 0);
> Shouldn't we leave things muted?
It's redundant here. I will remove it in v2.
>
>> +static int nau8310_clkdet_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct soc_mixer_control *mc =
>> +		(struct soc_mixer_control *)kcontrol->private_value;
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
Got it. I will remove the dapm lookup function here in v2.
> This isn't a DAPM control, we can't use this lookup.
>
>> +static int nau8310_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	unsigned int ctrl1_val = 0, ctrl2_val = 0;
>> +
>> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK.
I will change it to SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK in v2.
>
>> +static int nau8310_switch_internal_osc(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	int ret;
>> +
>> +	/* For internal Ring OSC, the default fs apply to 48kHz */
>> +	nau8310->fs = NAU8310_DEFAULT_SAMPLE_RATE;
> This will overwrite anything set_sysclk() set, since we call this from
> _shutdown() and _resume() we're relying on the machine driver
> reconfiguring the clocks when starting streams.
Regarding `switch_internal_osc()` overwriting `set_sysclk()` states 
during suspend/resume, I'm considering two fixes:

1. Add NAU8310_CLK_INTERNAL to set_sysclk(): Standardizes and unifies 
clock setting through set_sysclk().
It sets the 48kHz internal clock here, but would still temporarily 
overwrite the nau8310->fs and mclk states during _shutdown() and _resume().
2. Pass arguments to clock_config(..., mclk, fs): Configures the 48kHz 
hardware directly via arguments, leaving the nau8310->fs and mclk states 
completely untouched.
Which approach would be preferred for upstream?
>
