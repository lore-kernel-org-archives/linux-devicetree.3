Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA13A874F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742469; cv=none; b=SBTTBmTOkyWwkj99iIr+uArz+sm1d5GpmqBm3chEOJtEXYLR81+QypTwuxxSrifyR/W+d6CNHNtQ8OUKc26v/xNT1m7lbdQh9vv6YNYig05K3NfVRtNqOdTzDSyCddtVvVBiawofZxhWOUEs+ngSybLwBSk9B5cHFwfsUbmAkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742469; c=relaxed/simple;
	bh=33s6yhLucYMAE2N9t0wyfYGQKp5Yx+BMQFGHVkoLSOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlhixHlRtfxi/+N9gLlXuQD4+8pnwjVUWIthL8PrwXu1ahtk+rfrP97XKOpoDRNJwy2oTHRUInnCbqkWMp23MF0wpCjd6pct2B4xaTzLQUaJ8HHTdipvS6GmdvIuDl6rbqu1GE4lwRQCJBscF8773p9IP8tMCLte7mSMdCQ/VfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtcFcAQL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtcFcAQL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e507b079dso2062210b3a.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785742468; x=1786347268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS4teYo3wuHiEoDKbPYxioZSZwZYOwoqE7Pv/fw4Cwo=;
        b=QtcFcAQLs18zwgQqesPPG6aQcmqHILj1shl/v19RIsEPEag4/eFjG9lZ66C86AMWO9
         oHDdl2j5IGq62NY4mbBKxp1ZjNHcKjFG6jHzmatemZoVUEvBUmh4F14BjzaY/RWR03ti
         AHl40qOYsF96iRftdRtcTTcGH7UjnZ3+W/cet4wzf5h3P+KQ3k6K5hYfn3/uusZuWzIH
         lIvfMo4xdvH8KnqraHifU78by2x+SaGzdiffO0Qwh0dbkr2/dTN2mwJzAajVqJ7JazeH
         3PckZDHlTnsdIUTI+PElhw9J/CyLP5DLkL+RhzClt7gwPjNnFJzfiFrIrHv/FzWAhHyN
         BPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742468; x=1786347268;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS4teYo3wuHiEoDKbPYxioZSZwZYOwoqE7Pv/fw4Cwo=;
        b=F6hVUaFkquKOInRhKrp3aA9qGKSuMEuHxDmKkvbqJyQgkorJ/PBM8UWW4EBHg67R2U
         gYBFKrmNFHfqSVQqzdxvnX6ekfFStP9kBI+8O46kmuxTAntY5QsRxLfx7zpKTLdiLaYf
         DAzhKZmOmUso4d5Xt+ehed1uRTc5IDuprMyQ/6Eyz0OZvJO1eMziYlbXbU2Mu5mJJid0
         FnRemfkNNSXiZsUdYEoXDqrEaj1laprC70Ieth+aloeZN89j7NfHoGGSS5l5MO9UL4Ii
         Jg4xDWWGUjK/r+9jMDSBFaBF+WM/vZywfUYqbu+TNbHofEqMuwFP9tWKUWNGGfMpcGAU
         y15g==
X-Forwarded-Encrypted: i=1; AHgh+Rr31ZN39V9VjzOyQ+KfrODUB5ZlvItp3pNU/G/qz1jm8m9kP/sSrwKCmmc4aba4Ce4C6kUOgaAapBp5@vger.kernel.org
X-Gm-Message-State: AOJu0YztuMmThrcnAr3jaLY1UmQ60KjM8FBmTsf+Rba8FHkLio2hEXPd
	J0a3QnN1hl6/yaY+gwOSm6xVmtCufNndjSYjBtntwxrwa06PJz6QZu+N
X-Gm-Gg: AR+sD12wawoppb7kPR7qbarkhd0N50vJrF4q5zfe4vGTWJmGPFvx5vZgK7sQ+Rzn7l0
	vGPhb0aPB9DtrRjf8bvvUypXOrzOZqWhbf0Ccp55HjGH4SL5ZqThv59uPWkCMNoG+AScd/rW+Z/
	5NjWiErnuRQfz/QK1xuUDSgRr8oPcEpt6Dkkew9e3NnqC+2gGdXBFwEo8WSakIfy8sUBRXcb4+b
	tx9Gzs+n9yugDipPpEK4jfROLOFepZOna/NL7Qxz1wiJ1rd7IKoV9wTcywNLvWLscXzYOfdOfHR
	gGeoLILktJySbZnm2tFeseATnG+x/qdMEQQKV3kQ+6CgDLSvQ3kOyGpV471dHNxPjYK8pYUFKRw
	np6XdbE1QY+dRp4J1NgNfA/xs+RIYip0K7bzhaDQDsXmSFzk/RXJmH8I+7ZpG+FaFYx6TNO2Trf
	MBcGvxRmEcXZFeXokeybApIyoY3EyySjKB+n9504jTmdMZVBPKyo9ZMG1l5KxSEEkp5933/RbVm
	7c3ek3GBvedvabgSlKRVi0RJZIv
X-Received: by 2002:a05:6a00:328c:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84ee479afbamr7756583b3a.10.1785742467630;
        Mon, 03 Aug 2026 00:34:27 -0700 (PDT)
Received: from [172.20.10.2] (114-137-58-248.emome-ip.hinet.net. [114.137.58.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31639sm3320470b3a.9.2026.08.03.00.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 00:34:27 -0700 (PDT)
Message-ID: <8af09a82-3d0f-bdf7-5a78-32e2de53c108@gmail.com>
Date: Mon, 3 Aug 2026 15:34:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260708093506.895481-1-YLCHANG2@nuvoton.com>
 <20260708093506.895481-3-YLCHANG2@nuvoton.com>
 <a5139285-2017-4c94-92f2-f87fbef6fa6a@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <a5139285-2017-4c94-92f2-f87fbef6fa6a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/26 03:11, Mark Brown wrote:
> On Wed, Jul 08, 2026 at 05:35:06PM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
>> +       const char *fw_name, int dsp_addr)
>> +       ret = request_firmware_nowait(THIS_MODULE, true,
>> +               fw_name, dev, GFP_KERNEL, ctx, nau8360_dsp_fw_cb);
> This gets run every resume but there's no cleanup so if for some reason
> we get suspend/resumes running back to back and the firmware load
> doesn't complete, or the driver gets removed while the firmware loads
> are pending during normal probe, nothing cancels the firmware loads and
> they might end up completing.  Both suspend and remove should clean up
> anything that's pending.
Got it. We will add a completion mechanism in v7 to ensure the firmware 
load finishes.
>
> There's a bunch of issues reported by Sashiko:
>
>     https://sashiko.dev/#/patchset/20260708093506.895481-1-YLCHANG2%40nuvoton.com
>
> some of which looked valid.
We will review the report from Sashiko and fix the issues in v7 as well.
