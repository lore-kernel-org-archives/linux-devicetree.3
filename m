Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757147;
	b=KawdknoewoiqHdy9Famwee7mHcu2Tj2XrEqI7/LsS+bxQEL/pnp+mi7GrYje3BJx512J
	 Kj6+GNn03mxLg1JayorsxLTKwGsZX3XizWEUpBeaIZKmhjq5TCKgl9xgk4gmNU7xwWiBt
	 c4CAFamb8AoTia7OUV/T8/AA0xHEeP7FCrGqhUtDAXfeAMSDHz6PbnEUpQmEFcG5VsuZK
	 ZYULLkLXKg9Z855kEZaV4ZBOgvPbUCNQzNxPpUYcYizx/yUIMI8LzmAx+LLhAJc/YgR6e
	 Am18OkhJNSOeaEke4QIPhIQ1mSd1DNMqfW2ccS8tLnAOrPLKVUFa+xIBwKIfE3+maag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
	b=S/Qw3cPw24i6NSNKokFXOxe+mntuEE+8kwH4lxOrDRkLfYsts5Zop6mzq8cIIr3JPkwn
	 O34LjIcrthSGSVA96TiLUBt5vuHuUguIM2WQuNFdWInMivnqcFbbqAyk0/eW63N3HMKQs
	 GtmKSLzDdBiYVsR1FSn6GS9Bdii/vzz2wjosmAd18xGD3J7mrWtR0oqU6uYeSgyT0fNyP
	 be5cPawNA4imcSuw5wMo3I049PQny+G93JEnyZm/YuK03/zE3gy2OaEC41cAcb3L8PicT
	 Sar1MzGjQBMTCP09osubMTd4/cWF4PJ+gtxjX2G5wpA3rdxlvW1AMw/r/F5oCMH8dWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM8x5WjK;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14C606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D14C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM8x5WjK
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04e3bf46dso56697455ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757146; x=1796361946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
        b=JM8x5WjKEBMgLMs4j3PbFIYKP6179Sx9QiLdLKSsBKIxCvRNNjtOj3w3d4hMKnkuGK
         5z8fmxfq5hIVPDYhLB/kcMpZ6uo8QUo/CYsTVFLNwMlchR4qHXmpHJC4mYKiZJRi9wkA
         prQDZs5ZWz8jf3FZ0HbzxoxDsfBcs3ijj/r60jzXf/ms1qNZyPuVbVwF/P74A3UGnUZw
         mIUc8aTncPV0gAkVkx2lwHF62zpAht/1SKCV6fNqeyPj1Kyti5N0DRgAg00zV3nsy4lP
         JMsBe6YLo0EPmMNxhRnRmftjAHFifWgWgFanXvoC2kOdp7TDyNRbxDF1Qr73k+FADjqz
         JFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757146; x=1796361946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA6QiuILmzYuZAEVobBo2J+8o+30ookoao4wSAO7N8E=;
        b=gHeXNRhaZobj2JAkVl09PNkbtt2FfKI1EHouK84YxkrQ9naobes5i/iP5NIuUCxwKD
         qLydFqTrog0F/gnvqa23/XA5wzs+Y79scy8P2rGrDQahL9aOljxkj42bEV49/j6V+gf9
         v6f675KIroSnjrlmYivnDOcEEH0vaPash2MEU/cNiZ09+gp19kZbgEA4uLocsfkMlv4J
         v5rJucTcWecYOQ9VZkaHaTesTJF93B1hKYwZCNyBxZRUHKaTGV5r3GhVhYAYwbUdU/w9
         qUqW+M5V/nmfxRR5spaBwJhM9gdvfXiOMwoPVB0Q5gKE8y2eFyQffti6k9J2uMsey5mo
         4mFQ==
X-Forwarded-Encrypted: i=1; AL+hErFxT6o4mP/VN69/0CrQwzHO/GonRJ5XYGLUlTdUDAhvcKclwueC0YaeZuDiTKMS9wR0FfKuZ1iSixPK@vger.kernel.org
X-Gm-Message-State: APuU4Z+mDzsw+snohQTgGfwQzCndOAtf8Z22npmSmfQ/yMp2RKAbK/RU
	bhcyvYhGbC4PdUdsfeBk+9wOkQIoYj5uxRBvsDOHfIuBH6sw3NNWdC26
X-Gm-Gg: AZFdTZflzJDiwQ3t+qoZg4GUv0xXzVnK2WV43VZ/I1XK4+opx87lNtXXdVGXX7wRi46
	JSvbgOqvjI+TpoGUxnW0vFzjmYPoSgE4y8GrEzbg6HKTjFBGJtNaIR86XvnIEs1VlbYckes25J+
	JmUtEf6/RtJ3hlUUVtYp0Wo1gu62iW2jfPH1jzCUfLTCovRtm3m+3poyKMUj+on8ZQoV4W2zot2
	v+27KVJc/6/8DlxEyfddXouT7D6n/WGvcSy3s6twCyLICgNZI8CYNCBZKG672lflyKgGZAD4CL4
	PdnMfkdEOs9WOC4yAOrqX0kMl8iFuNsYR5jlfpy/jzJ9OgLjmla6rG245bMIo/+QiWwsWPu38Rt
	lbLaVKYKkMvQPKVFsMtH6ihg/0bFSrmze2mYTaHuEsoWi+f1f+8VkXd1n3OcgRf6SFecz2HKQQC
	OIv/R+HJo497yD2pesw/VdNUnoiKx5iGZ8fQS8/L9z6ySST85mebOxgGoUkt8lcyUiQ3UJWcCmP
	kcW4g+tckzhm0M0Q60C4fn338ygROaA9ZpZJcnCxlxPxZDQ8vmWddUsSBHx9n1kmFlnPAE4fcHo
	xv7o4M2MOEmAMGPYImktsb7UgTYX3YhNA9YAVmgdXutt9kwjEULJUbCxEFDThywwbtOjAlo=
X-Received: by 2002:a17:902:e88d:b0:2ed:916:2a98 with SMTP id d9443c01a7336-2f03f23e4bcmr265847965ad.45.1795757146399;
        Thu, 26 Nov 2026 21:25:46 -0800 (PST)
Received: from [172.20.10.2] (114-137-215-192.emome-ip.hinet.net. [114.137.215.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm115245545ad.5.2026.11.26.21.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:25:45 -0800 (PST)
Message-ID: <9814e94e-539b-4729-9cbf-4642ea15e64d@gmail.com>
Date: Fri, 27 Nov 2026 13:23:25 +0800
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
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
 <20261118084214.527804-3-YLCHANG2@nuvoton.com>
 <179518986191.6016.16828944387493140658.b4-review@b4>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <179518986191.6016.16828944387493140658.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 23:51, Mark Brown wrote:
>> Add support for the Nuvoton NAU83G10/20 audio amplifier.
>> The NAU83G10 is a mono boost Class-D audio amplifier with
>> integrated DSP and I/V-sense support.
>> +static int nau8310_hw_params(struct snd_pcm_substream *substream,
>> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>> +{
>> +	struct snd_soc_component *cp = dai->component;
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	unsigned int val_len = 0;
>> +	int fs, ret;
>> +
>> +	fs = params_rate(params);
>> +	if (nau8310_dsp_active(cp) && fs != NAU8310_DEFAULT_FS) {
>> +		dev_err(nau8310->dev,
>> +			"For ROM Code revision 00, DSP only run at 48kHz.");
>> +		return -EINVAL;
>> +	}
>> +	ret = nau8310_clock_config(nau8310, fs, nau8310->mclk);
>> +	if (ret)
>> +		return -EINVAL;
> As previously noted this hosld return ret, not overwrite the value.
Got it, I will fix this in the next version.
>
>> +static int __maybe_unused nau8310_resume(struct snd_soc_component *cp)
>> +{
>> +	struct nau8310 *nau8310 = snd_soc_component_get_drvdata(cp);
>> +	struct regmap *regmap = nau8310->regmap;
>> +	int ret = 0;
>> +
>> +	regcache_cache_only(regmap, false);
>> +	ret = regcache_sync(regmap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = nau8310_dsp_fw_load(nau8310);
> This will set the clock back to the internal clock and if we had an
> active stream nothing restores it so the audio will be broken.
I will save fs in nau8310_hw_params() and restore the previous clock
settings in nau8310_clock_event() (PRE_PMU) when a stream is active:

     case SND_SOC_DAPM_PRE_PMU:
         flush_work(&nau8310->load_fw_work);
         mutex_lock(&nau8310->lock);
         if (snd_soc_component_active(cp) && nau8310->fs && nau8310->mclk) {
             ret = nau8310_clock_config(nau8310, nau8310->fs,
                            nau8310->mclk);
             if (ret) {
                 mutex_unlock(&nau8310->lock);
                 return ret;
             }
         }
         /* Switch the clock source of DSP to MCLK. */
         regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
             NAU8310_DSP_SEL_OSC, 0);
         mutex_unlock(&nau8310->lock);
         break;
>
>> +static const struct regmap_config nau8310_regmap_config = {
>> +	.reg_bits = NAU8310_REG_ADDR_LEN,
>> +	.val_bits = NAU8310_REG_DATA_LEN,
>> +
>> +	.max_register = NAU8310_REG_MAX,
>> +	.readable_reg = nau8310_readable_reg,
>> +	.writeable_reg = nau8310_writeable_reg,
>> +	.volatile_reg = nau8310_volatile_reg,
> Does NAU8310_RF000_DSP_COMM not need to be marked as previous?
Do you mean marking it as precious using .precious_reg?
>
