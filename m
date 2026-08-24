Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5903A1D01
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559991; cv=none; b=ZP+UO/cfGvCzh9dOelXNU/jitck4hQevmYs9gIrQPXzwL8F1UdXoVAx51BebtxZUP6oqulmqFdgaxbNykvCQMDl/pYSdQ+M39cxKlBQ0nyTm6SwDjwj1ByHw0+SpndcksxDB3afGy/h+upLr3+zqq3aech/Bw8WywH/LNnuRFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559991; c=relaxed/simple;
	bh=IcAntOh7IHjex268kpIeIclWRWwYpWZIiIuBC8ontzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwdeGVCh4tgoxA+f+DN7NwJORQsfldWz0Zf+DbW+dyXlzmNYg6akE0K/7OWzsN7mDxzQmCU3SVkBHTRRzx9hsEmyMCNcoERqTUDDUdqPuXJUUSAopYTBabel7b2ZTjx/4A8hPkCFl2Rbj1Vbs9bzaVgZ/+IgCjmpHCSG37EI3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc90ZIBa; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc90ZIBa"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2980754a91.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787559989; x=1788164789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpKY1Gh5ZlUDMT2T5S01JZglILnkty62PxyLVIepUZg=;
        b=Jc90ZIBascInOvgPMJzHBEOPVB4fxX+yb9iDP12frlj8BxM8i0Ii/oXH2P5293/z97
         lvAaeqxMDd64MWMfs7vS9L50mJJVwMjFrbkrtyOhF2a2BCXDXhSXE0XwXiSB00y958Ui
         vBQdVsNjbpGZweoi1aJjVnz/OzcBoBxr9iIG1GkeUU+eBGr8GlsNaYSevrquAjYJSKi/
         ozOvrkkKdVvTnaAdFOX6cIPNp95WEqtcswxDZ4RLCsVGzsumH8KqBza60H9bUnG60bBV
         +JF/oKh6qJnvDthOH6rpuQ7o6n8tQEEyATaiNgPF79YO/gUfTd/i9+MI+CDt7ZZzv/cm
         gSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559989; x=1788164789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpKY1Gh5ZlUDMT2T5S01JZglILnkty62PxyLVIepUZg=;
        b=ioSdmnoorZZfV9tzFZt/M6IS6yGbzhr3DMEFM/TBt3zikWo0x+6zNe5fRpOnP8A5oj
         LdwGS/bOV5pf/KkVw/LWaDsMEz+DNnUgr9rD4a/iCWgKmqb6PHjTD61N+JiLseLAjiUp
         ExJNkr04Y0rLDUNb4ae6sVdOJvL4YXEx4fJDiMmwNkuwVwk1VJf7MfBiAO/DMVAcZHd8
         BFeGkcdut/Cy61YMq5SzVjSV+32FlPKZh3NzJ8OcZ20XkBIowHCRirLsOFvgY/DC2PZW
         80wXGqHTyX9E1iX0QpNKRKVMkrNeWFCPBy0qiHRhf6HQQUrKq7lrcHlZ3NoDYkLm3mGc
         ePcw==
X-Forwarded-Encrypted: i=1; AHgh+RqMaqQiV54kAAypTy/bir42PMSTm3kWTxg1TH08Nx+xzf5oquMKwuAD2OQ7EqNbUtozj9b82HWIZhnj@vger.kernel.org
X-Gm-Message-State: AFuF++kCj+tH4LpY1PCreFhQscdxmiWTQislCRL2tInQml5pWxQOlnzO
	oTTM6t5ndMUyelfCQUD1H0IdEnhjphfVaDYSOIWo78q23y18ibu3WSJ9
X-Gm-Gg: AR+sD118NXDl38XRK870rWvsTWZfin49/0NDnWWRBmSisXwdCQfjM/eJzXj/V/jY7fT
	7IAOJlqYVM1an2yoes7K64lcmc1jZTL23f6qPIgNRsfXm/sTnAWg91Sg23NK78z22SxBpG1q4pI
	OfFvWvdYIu+utCEdZDhIaZoUnPA5ryoa4pXMfpFKezSvQnziqJu6OnlOorImVJvRiLIWObFqA+C
	Bi40lK+DZ/UV166cCrwJ4/yzyT8UHZYHNV0EOvexbEdm7is9SnX7YofwVA/AYKUxHlJRyhF0lX2
	yseONi68WXurwRDxSKSyBidjB4A04pJSImQxG+0xVfAmT21WWEV1IyauSlmOtDhewtYeSPPnhm5
	Af8lxV2+l7i/HjrLbyuY2Te7LxIJS3KNJBUiwq1ZfiNVeiP2ZpYfQ/CkxscyOQ1+3n3oEz3M33c
	15cZpQHdo9PoT/cBnahTLmSKBPC2JawNPPWdO0poLXfyaLIqdI5IOAI6T1bQJpOHsYFNojB35Uf
	DTNCu4l9StKLooW857N5r5kyWVM/3aHY5A3NSEWB+KWHi+Tl5sJOm2k5YKhyldAmin9G+UKBu8m
	jA7cIoz4luUU8p4QN630a5sYIvHjHw==
X-Received: by 2002:a17:90b:2cc3:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395df29666cmr31573039a91.13.1787559989298;
        Mon, 24 Aug 2026 01:26:29 -0700 (PDT)
Received: from ?IPV6:2001:b400:e3ee:1d2:6c98:a08:2638:bfd9? (2001-b400-e3ee-01d2-6c98-0a08-2638-bfd9.emome-ip6.hinet.net. [2001:b400:e3ee:1d2:6c98:a08:2638:bfd9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b4060sm9164143a91.6.2026.08.24.01.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:26:26 -0700 (PDT)
Message-ID: <ad5e618f-eff6-4b28-8c9c-456531e6632b@gmail.com>
Date: Mon, 24 Aug 2026 16:26:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
 <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
 <7e7b8329-23d3-495d-ad48-9ea70189c46c@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <7e7b8329-23d3-495d-ad48-9ea70189c46c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/26 23:24, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 10:29:25AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
> A couple of issues here, mostly this looks fine.
Hi Mark, Thanks for the review.
>
>> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
>> +	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cp);
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
>> +	int i, reg, ret = 0;
>> +	__be16 *data = NULL;
>> +	bool changed = false;
>> +
>> +	/* Use the DAPM lock to prevent race conditions during DAPM power-up
>> +	 * state transitions, and check component active status to prohibit
>> +	 * PEQ access during active audio streams (playback and capture).
>> +	 */
>> +	snd_soc_dapm_mutex_lock(dapm);
>> +	if (snd_soc_component_active(cp)) {
>> +		dev_dbg(nau8360->dev,
>> +			"PEQ coefficient access is ignored during audio is active");
>> +		goto unlock_dapm;
> This should probably be -EBUSY or something, though that will upset
> mixer-test.  As things stand since the values change when a stream
> starts and stops there should be an event when that happens, and since
> we report success some value ought to be filled in for the read.
I will change the return value to -EBUSY in v10
>
>> +static void nau8360_dsp_fw_load(struct nau8360 *nau8360)
>> +{
>> +	nau8360->load_fw_done = false;
>> +	schedule_work(&nau8360->load_fw_work);
>> +}
>> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8360->regmap;
>> +	nau8360_dsp_fw_load(nau8360);
> This only kicks off the firmware load, it doesn't wait for it to
> complete.  That means that if a stream restarts quickly after resume we
> will run into issues - I see that the normal playback path just errors
> if we try to start without the firmware.  We should wait, either here or
> in the startup path.
I will add flush_work() in startup() to ensure the firmware loading is 
complete before the stream starts.
>
>> +	if (NAU8360_IS_DSP_REG(reg))
>> +		*value = nau8360->i2c_read_buf[0] |
>> +			(nau8360->i2c_read_buf[1] << 8) |
>> +			(nau8360->i2c_read_buf[2] << 16) |
>> +			(nau8360->i2c_read_buf[3] << 24);
> get_unaligned_le32()?
I will replace the manual bit shifts with the unaligned function in v10.
