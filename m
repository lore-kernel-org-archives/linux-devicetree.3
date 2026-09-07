Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531603F0749
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 03:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752847; cv=none; b=TTyqp3GpUoVncsr4veR3y0v0ssb8hz1fVynZ4KlkDSU633hHjYW28C/zN+Rky7QnroEx+NbEtqwC3ay6JLCA+vAiThuTbe+WI7lq+9BgliK27O+GEk7pIat/kAP7o/QeYoKWauaV2PvQ0hIArRW+nYHFeVZ31cUanvo+QxYOouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752847; c=relaxed/simple;
	bh=6jmWJK61/SjCyFrb3g0NExISI2RjY7LO/yDYliJAQ/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTf9sj+hBX8iNdm/18TAftG/15X+bOFXmWRQgstB0H+6PZcl2rQl88EaisSVhrjErmNLAmN2tOoSMCN21n8p4y+0wjPmO/Zv7ZqFJYNGUH83qgeFz9gHIlTn/IT2SLf+d3tTKLOiy0/PgQ0SPBrUcqig1DodCWLOiHlL3OkMGk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiPYKts5; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiPYKts5"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3809493b3a.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 20:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788752844; x=1789357644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vljcaDx2KvDeXjmIWLAHTkvLtKLMiyvxJX3Uoaq3r8g=;
        b=CiPYKts5sIwcOvA1sXwYuITRHwEY/9tkjxmgcjhEe+QCf+DbbVTuEqt40NlgYq7EOX
         7Iu0wNGzWjJiK1K20QqeMr5Yq9ND9xY5HUTKCixQ7iWVP0VsHpUjhJwtLDHCJ6Yz8pJu
         In4y84MNgaEDCSBjNa4vmv7DhTUAVNfsZgZm93m6t8a+DuW+aidqEJYMXSFgTvLxv4wu
         GfS79BnklAzVllHGrUs47bs6xzkokydxJxkqRjLD718lheWxy6Kt2ryVn8685TWkrmWl
         ZE0jq3y6fHx3DxVCRwSCI1mo35xAlune0fK2ylTwxrsBhJq2H5kJqoyjb8J+eiHVT4NP
         0KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788752844; x=1789357644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vljcaDx2KvDeXjmIWLAHTkvLtKLMiyvxJX3Uoaq3r8g=;
        b=cY02Cmuhb1GzcsVCGj2Pr9rDfP6iTqWZKrnEADmQCvu3lrAXGlhKQhr9P03k9ECmhO
         kOCF3eKJG2wlomyxLdp9CPDRgZaoDHsULTKXRA1GIjltNaiTSFio7i+zj9RcsNP1Uhlf
         lbptLvZxnEKD8BUsYlHlPzVdbZwraXPf0MXNOoDuQJFP9o0s4TXfZg7QeOQRWpPUccUH
         vRvvmqe64H1mUpo7pjSmWajCmuG8HxocCr6thtRP5WHD1zlSfbGojQAvbE1f3cJqnMQi
         EYxSElGK+fC+T9sgjIXw0Ew3w/Xk61c0kMIepy2ENI2rciW5cSrxqXq8jU94rdz5CY/N
         A0yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN9OHzgGBOYZzIHyTrZ8IvgJ9LafNFyLu1GqmBHLAdsQjtLwaVmBjBxMEjvORx9ZsR49LYxMTpwcba@vger.kernel.org
X-Gm-Message-State: AFuF++ku4XT4ZfEENCG4PJwNCbH7wRsaeYujuGpuy9r+8Djdpv/41PHZ
	AZUk4h9WSZpQpdIk2JVCJTKR6TuJ+Q5AMa8ZdjCb0f3QgerwH9tkvPRM
X-Gm-Gg: AYBFou3eYOToojWMP+CuMpZP0VBxjTjLJzNths/GyN9JhapdN823d+6RFnaXnF5xOF3
	q3Yaz9hXwmNebRymF+GaNF+IxB5ASs83JJo70IQuaT3coKqYSFsa1rmlIZMNzX6SK4KF3A1aNL6
	c2hEeL1ID/0xi2Ie0En/UwUGxWGTJb3w4g3RmpXMrotU7itiQl1Q7HjThH5X9FsKN4GsocPO3yP
	livlQY1kC45ZjQIebYCKx+LQlnWxjLmrV2pynci8OP96eXPQJMyqkcdKMDwtTPM3wyme5rg1B2N
	sGdG6bjgS670gsvIoKfkQzoQp8sm5TRqzFK5AahGSu6LfBzJm0Nh/T2p2Nk/kNZUIJrXYjfVVSt
	Qj9OJfG8AYrs8Y93jMH+Z7UqGwFanu+b2uMcMrVnWScyQnhOQycomBhGs4FmSwrTJmWUNMaavoP
	KeH8T+tqBHlPPBZiKHj+ABwdiIXJiMYMaKkfB1kZFpHFPPGgKFbjFviMjl5jEH95UA/0/EniTWs
	cQm8fbMtZFjpYiiF2BST8OLVx8=
X-Received: by 2002:aa7:888b:0:b0:84f:dfce:966b with SMTP id d2e1a72fcca58-8616a06b9eamr25052174b3a.8.1788752844486;
        Sun, 06 Sep 2026 20:47:24 -0700 (PDT)
Received: from [172.20.10.2] (114-137-107-99.emome-ip.hinet.net. [114.137.107.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm3690281b3a.29.2026.09.06.20.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 20:47:23 -0700 (PDT)
Message-ID: <a5a983de-44f2-45ed-9a71-0839f5349d46@gmail.com>
Date: Mon, 7 Sep 2026 11:45:10 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8360: Set DAC path to bypass mode
 when DSP firmware load fails
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
 <20260904060035.196399-2-YLCHANG2@nuvoton.com>
 <apsEO6K6Qo1ADH-y@sirena.co.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <apsEO6K6Qo1ADH-y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/26 01:47, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 02:00:34PM +0800, Neo Chang wrote:
>> Automatically route the DAC path to bypass mode if DSP firmware fails
>> to load, ensuring basic audio playback remains functional.
>> @@ -1702,6 +1702,8 @@ static void nau8360_load_fw_work(struct work_struct *work)
>>   	if (ret) {
>>   		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
>>   		nau8360_dsp_enable(nau8360->regmap, false);
>> +		snd_soc_component_update_bits(cp, NAU8360_R12_PATH_CTRL,
>> +			NAU8360_DAC_SEL_MASK, NAU8360_DAC_SEL_BYP);
>>   		return;
> We don't generally do things like this, we rely on the user to fix up
> their configuration, but equally we don't have a good mechanism to flag
> problems with firmware download to the user.  It's not something we
> really expect to go wrong.
>
> Since the register being updated here is a user visible control if this
> does kick in we should also generate an event on the DAC Source control
> so userspace knows something happened.
Hi Mark,
Thank you for your review and suggestion.
I will remove the register update (NAU8360_DAC_SEL_BYP) during firmware 
loading.
Instead, I will add the following check in nau8360_dac_mux_put_enum() to 
warn the user and block the path switch
if the DSP firmware is not ready:

int ret = 0;
//....
mutex_lock(&nau8360->lock);

if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
     dev_warn(nau8360->dev, "Cannot enable DSP: Firmware not ready or 
disabled\n");
     mutex_unlock(&nau8360->lock);
     return ret;
}
