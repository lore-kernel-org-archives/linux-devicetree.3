Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429E3D411D
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263344; cv=none; b=DYGMxx9VFEHzlECvk5igQ3Wkg7yhDXHLHed4i7lX5E1nRl3b5a97RhEolvLipEQi5LOTHvUjq/TNg3uulHZVzsDBtvL2zdpTUr6HNzPv+qmrMlhN2ylIX2/l1P+/wMXrf1e29PVXQyuL6mwMhP8lbY+Jm8tGg0X+ue1lsCuSAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263344; c=relaxed/simple;
	bh=fm9sJOxvII+3C6MXKq99rd446vFociX32pC4pCbh1EE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iete4daYw0MSdqsDEbfGbt5bTD/6O4rolRjbdwhqkyTkwK9mUWol43SfBye5BuZkUdYfy1+fmJ/RVSIaADq8WIEhigZCwoDZ9EjmTSQSJdOtgL+8oqPMxJwjm/BuOpFxDY7btWIUDxqm1ZSCvwiNj4w2FMXssTfht7VpyQI+KcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=YnWxpLt7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="YnWxpLt7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so4818925f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776263341; x=1776868141; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=YnWxpLt7Q0NsVJjT7UyHIxpa3DfMML4YBraELqNBVC91IcUthdphgvvbjSNXhnnc2l
         R+4uC6kXcD1ZF/t1FHxMghCXoYqswWqylU+QhAuRziCUuLbTTRJ8wZHw/Cuz/yiOeyQn
         BU2TTPxJgqY/twRxySBfrLoCa2whTGX1gYOcuzA7FjkFWg+8mDsaL3V+PgMwBahlKsBZ
         ygpsS4Cfq6JydF75UE9J5RFWm8TQPPAzTDVuhbl+nUswc/oInqlJXAWY3TQBq40jTc+E
         WgoPCjhnVCFzs1spQRlKOkD0m2RymjtXwTikZjWAbwMau6yJeHe7rtuZ9gU0Db0QdPke
         Pp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263341; x=1776868141;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=mqrosJnCGi2XPGtZV+lH4igUa72gpQKIR6aMvseLKxpM2tKK9aRPHEHWAJbVLCpA/A
         RKDN4t5TClgiS0l7KouDjgIMziXWfvtX9WJHA2qOxVzQyB91prQptjJ6zGRReesVAkDM
         lMmqXeX61ksfpZvRfb7+9AWkEZ86Bbr8XqNiFUytSrgse9kXiQCkKLEGamxEzGs6DhU2
         yS9kbBHdLVE1XvAKH3Hyi9WDIDSyT6PBZjCFyiQ7Nw+Bmf13dMVTAnpklbA1ogvtpIwo
         rSriJyUbPgaFAlAwb9huL3joYUdpj6qG3UYJ7U+B07Luv4k7AWdOZd1NCNQ4UFPt5yUE
         vjSw==
X-Forwarded-Encrypted: i=1; AFNElJ8O7/4cBpN8jZXWxO6Ta+vrvxpcNwQgYzfqMuBQoHMowxYe2R2dn/sx2aFJLRzpaDfFEYD72uVcwdGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7nti2YQnTercUj6MGDYC03t18NhUOu0uLTmsXMdCsntnUlde5
	h5Jv2pO2YvRft1BmsX4uKQVi3/2VrS5bZQ9bYKzp6KoepsGn3P+TFyMenMnYKwO+16I=
X-Gm-Gg: AeBDieutzzXNuKXRIYwMOreDguBcBArg08+aZBmmEoNe3etJ6ReG5QaCsgCJDqAN/Lx
	MCPC2LvQzu3jTMpSzATcsdJGTBvixgFr/Ugpy6N3xAXWIo922RMB+FZFYPOWuygrR9Ryr83DGWy
	bB1Gmp2TKNqJcHfRln6kB0YTcnvVkuTNSDT4XKBR8j0VTDg2zpbXHk2AEcnwEEDjenOXZMBtg53
	bEbxCPqEye1A0USUUNtdQvdnFFw92NExj0ZPCKtNnA6/KdlPijI+nhcmuqZoUnQ2apwGpupVM5G
	aGHioQqnrhvJliaM7mbAAhkI/EQTtdSIfO/zErn7EFbgOz96HR7R1QrwUe6EcNPYsFpklqzUEVA
	9Cc/0HEZvow1/AszDGQCFI9wdml51BMOjoPZodeXBad+1PWW2aDD18hnlYuhZFGEqiEAuvRieKK
	HM+3erVDuUKldxoTVGL+1plh1x1T/N4z8p
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr284525805e9.1.1776263341086;
        Wed, 15 Apr 2026 07:29:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f096d110sm28244435e9.11.2026.04.15.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:29:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Valerio Setti <vsetti@baylibre.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
In-Reply-To: <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk> (Mark
	Brown's message of "Tue, 14 Apr 2026 17:13:48 +0100")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
	<20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
	<58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:28:58 +0200
Message-ID: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 14 avril 2026 at 17:13, Mark Brown <broonie@kernel.org> wrote:

> On Sat, Apr 11, 2026 at 04:57:27PM +0200, Valerio Setti wrote:
>
>> @@ -200,13 +200,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>
>> -	aiu_encoder_i2s_divider_enable(component, true);
>> +	ret = gx_stream_set_cont_clocks(ts, iface->fmt);
>> +	if (ret)
>> +		dev_err(dai->dev, "failed to apply continuous clock setting\n");
>> +
>> +	aiu_encoder_i2s_divider_enable(component, 1);
>
> If we're checking the error here we should probably return it as well.
> Including the error code in the log message is also generally helpful.
>
>> @@ -214,16 +218,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>  				   struct snd_soc_dai *dai)
>>  {
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct snd_soc_component *component = dai->component;
>>  
>> -	aiu_encoder_i2s_divider_enable(component, false);
>> -
>> -	return 0;
>> +	/* This is the last substream open and that is going to be closed. */
>> +	if (snd_soc_dai_active(dai) <= 1)
>> +		aiu_encoder_i2s_divider_enable(component, 0);
>> +	return gx_stream_set_cont_clocks(ts, 0);
>>  }
>
> Note that we only hw_free() if we preprared, but we enable in
> hw_params().

Huh interresting, I had not thought of that. Valerio and I discussed the
clock part a lot for this rework. It is the crux since since the
interface and clock setting lives in the AIU subsys but serves both the
AIU and AUDIN subsys.

Valerio maybe you could keep function above just to set the rate, but
enabling the clocks through a DAPM supply widget ? This is kind of what
the AXG is doing.

what do you think ?

(actually in the AXG the each formatter widget call CCF
clk_prepare_enable() but a supply widget poking the register would do
the same thing)

>
>> @@ -284,6 +295,8 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>>  	if (ret)
>>  		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
>>  
>> +	aiu->i2s.iface.mclk_rate = freq;
>> +
>>  	return ret;
>>  }
>
> This means we store the new rate even if the set above failed.

-- 
Jerome
