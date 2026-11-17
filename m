Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887135;
	b=CALp0JN5WaZgQONPRDoCx1yFYrs2szE0iPCmcSA1dx0VdZLCH6F9YtZH4RiyjW4v031H
	 SqC3EoxBsp8zYYQ7BKdsBDB9TFhaSXyPfxV9xm3PXmftPlNGzroWHqw+6uIAUjPAF2wev
	 Hb6acmRdvMnx8ucbmLNbc2CIGqaL77Qn+UkCTVKO2AcQgHejT3toK2X8NEf8S5gtC+06c
	 Ufuuoj8gAIg9dLBO8GrL7QR3U3JyRB0XOQUL7+ynJYoXuPRNVIADPtg7Azcog4UKW7toJ
	 5ujmmG7erzg0H/aXLflB/rIcEjdDJQOphBJ5M0cP+d7uwQiEnwMBlS4jNGykLsxhwjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
	b=F4dTjAiYLiIqIv/gxObbiJ6HJtzBHwHhluwGBg6qNppHwnp4AGlNrJPyXcEUgX432xyF
	 T6IV7P/kQLETRTBOsugIMO0lvE0doSP0l10rr8I2sK4wOw25BbZ63A1YFa0B6ZJRZfQVV
	 t/ZvhliRoECoaKduf1KOUf5NAOogpVPzHCdzeauR9HBGHa2OEwwwgO2AeXgm5QlMsAkmV
	 xtUpGmn9/74q2Bs355bAYMwreDASMlYy/RA1AnOziT9+l0g3Z6a9jaU4ZAkGYphfg8dTk
	 QM85yyEXMVTOeoOj1Cc5EpBrXjIik/mGiQmknN5FICMTbcfo3nfjk3FYQf7Cldef+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGUizyGi;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2E1606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGUizyGi
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b37951a397so2021058a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 19:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887134; x=1795491934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
        b=aGUizyGiGi3uLcL9QQvTy5AA2VY6Qww1sA0A4hfG4VuL3CIU9790SlCWZpqPh0I/oK
         LpJ1tBmhfFuUCQ6c/xm7YjRW1uVOYGMoJvwsDL9um2eNP0Wi+xSM7bIS0PH9rP6BhGWP
         I1VI1E2UPiBJbeF++JWJ82Ebm1q18pck+r1GrQhZp7Fdyb+QRvQhQ6E0HYfjpxuReQfE
         XrFbs/eBaTPKn/nkzsgya0Tull4U1RZ47oPCVk0skQCkkFzzx2qmROkDPf5UXmex199q
         jEH82FFZCy0c6Ys2BBfarQUYb08ijHN0Vb3oCBcFM36Vmj05KmUQN36a2gumZHN7vtAi
         zRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887134; x=1795491934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/hLof7T98UFzgwiFM30+8SkQ46zhWKH/5V6aesQdyI=;
        b=zjvjJd+JmwXNhZWL/ktTTOoM0JwBpITCr7Tc2NpYdoF/E14tGom7XUWEE7zwv1USYS
         81LoP6zqc5nGM0Zx3+UiADLPq99jen7xk9qWP8sRmRX8NZIR5P8aMQ9xyKCGLJw/G3uj
         fYupBojtDYRaH0c0gKZEupIl3vZuHEx4Rj079SBUzz4n54a+ITUsKWg+SVd84MMN1gBS
         cnqAn9kt8ZlM/xkTJ1zvAvidU78YFoPfOOKkPN8NPPXu1O6Qnelbe9cXdFr5W+s31CfO
         nxiT7omZdbaQ7nkjieq/OjRF4ADZjgvz5GlVdGuKurjYOOs8RE6S+OO1yfIiGSae2uS/
         zJKA==
X-Forwarded-Encrypted: i=1; AL+hErH48cV2nGALD/BtvEk43tHvk1K/CjbMGchG2e02UDWWUUyhtthkoyGWCLDU3oiizPOMhJHWg6kpYimX@vger.kernel.org
X-Gm-Message-State: APuU4Z9886h2SLGxrbqNSFS4cM0eXO98VRWRTUOgSBQjRC/q/Io7chNI
	yw3KN/CD1I5gsam3gIE4OMQoujrFxwNFmH+bzpnpaVXB/Qju0HrnmyXo
X-Gm-Gg: AZFdTZdq3Q5vFUjF6jDqwjM0EYDTtIuFwaslqtm2lr3uYxycU24pg3+hwkFiwzbn62Z
	8CXFRqYmKku5UoMLg1YDFIZysqnRSoWs2DmpM75YdoHj1oigYPc+VycGa3ogtq5vaN2VQ0Qaldv
	kScSrTVTrBn5B0sK2LX3c48qx//aRaZ1Ux6aKbch+FpuGT9B13woTfZdkERhdfdivSmpr2XPHmf
	IusRfZ1UKWvddPn6ImmuBmQzzmpppOXYynMFI90O7yVUNiRV7Ymvb5WLO5ZMYj+u4sdUEsmXHen
	dJ5xkOXZe4gDc40yad07bLHet9ca0kr2FLtm3eWSenwEbq3sp9v2Dck4q2vwxiymqUeYSgc7Yzf
	oV+PmrlamYJX+qIhVcmOqDcNrHLcfsp7qqmyFm7l0T2/qvTFLodHIaDlSLCNVmdJO2l32EokFuA
	eDywEvBu6YlZDrdCaq5AA5G/GNPg6Yoqb7ZbxyWzWceTuFYQEqHMUHpBfp60IBmn7rgNhWh/nvh
	fWBdiPEi7kZJdhTD8WkHH9n9B+aMniGuXVSt4EDoHcuONWGj6HEpBqjCA5/eIhSNUEKwY0o+cU9
	mR/2QCCGkA2F+xte8yrHvkNOCBLvLVleTjgGDE8xtrdzA3kbT5bOSbxF882d
X-Received: by 2002:a17:90b:5105:b0:3b0:d0c5:c10e with SMTP id 98e67ed59e1d1-3b1b0b546f7mr12821409a91.17.1794887134435;
        Mon, 16 Nov 2026 19:45:34 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm1720814a91.17.2026.11.16.19.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:45:33 -0800 (PST)
Message-ID: <e87bc85d-c9e3-44b5-99e6-007944d75200@gmail.com>
Date: Tue, 17 Nov 2026 11:39:57 +0800
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
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
 <179425369963.3711751.8538085283431158098.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179425369963.3711751.8538085283431158098.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/26 03:48, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>> +config SND_SOC_NAU8310
>> +	tristate "Nuvoton Technology Corporation NAU83G10 Mono Boosted Amplifier"
> This handles NAU83G20 as well.
Got it. I will update the config description to include NAU83G20 in the 
next version.
>
>> +static int nau8310_dsp_idle(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	unsigned int idle_pattern, timeout = NAU8310_DSP_IDLE_RETRY * USEC_PER_MSEC;
>> +	int ret = 0;
>> +
>> +	ret = regmap_read_poll_timeout(regmap,
>> +		NAU8310_RF000_DSP_COMM, idle_pattern,
>> +		idle_pattern == NAU8310_DSP_COMM_IDLE_WORD, USEC_PER_MSEC, timeout);
>> +	if (ret) {
>> +		dev_err(nau8310->dev, "Timeout waiting for DSP idle state: %d", ret);
>> +		nau8310_sw_reset_chip(regmap);
> If you need to reset the chip you should probably also resync the cache,
> and there's some redundancy here with nau8310_software_reset().
This reset function only resets the internal state machines without 
clearing the register values, so a cache resync is not necessary.
I will remove the redundant function in the next version.
>
>> +int nau8310_dsp_init(struct snd_soc_component *cp)
>> +{
>> +	struct regmap *regmap = cp->regmap;
>> +
>> +	nau8310_sw_reset_chip(regmap);
>> +
>> +	/* wait for the power ready */
>> +	msleep(120);
>> +
>> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
>> +		NAU8310_DSP_RUNSTALL | NAU8310_DAC_SEL_DSP_OUT, NAU8310_DAC_SEL_DSP_OUT);
> NAU8310_DAC_SEL_DSP_OUT is used by DAPM, you might want to solve this
> the way nau8360 does.
Got it. I will remove NAU8310_DAC_SEL_DSP_OUT from here in the next version.
>
>> +static int nau8310_biq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
>> +	struct snd_soc_component *cp = snd_soc_dapm_to_component(dapm);
> This is the same issue as was fixed in nau8310_clkdet_put() in this
> version.
Got it. I will fix it in the next version.
>
>> +	/* Boost Control Target Value Limit. 0.16 V per step. */
>> +	SOC_SINGLE("Boost Target Limit", NAU8310_R17_BOOST_CTRL1,
>> +		NAU8310_BSTLIMIT_SFT, NAU8310_BSTLIMIT_MAX, 0),
> The binding describes nuvoton,boost-target-limit/-margin as having
> 0.19V steps - either that or the comment here is wrong.
Got it. I will fix the comment/binding to match the correct value in the 
next version.
>
>> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
>> +	if (ret)
>> +		return -EINVAL;
> Just return ret in case it's more descriptive.
Got it. I will return 'ret' directly instead of -EINVAL in the next version.
>
>> +static struct i2c_driver nau8310_i2c_driver = {
>> +	.driver = {
>> +		.name = "nau8310",
>> +		.of_match_table = of_match_ptr(nau8310_of_ids),
>> +		.acpi_match_table = ACPI_PTR(nau8310_acpi_match),
> We don't need the wrappers for these pointers these days.
Got it. I will remove the wrappers (of_match_ptr and ACPI_PTR) in the 
next version.
>
