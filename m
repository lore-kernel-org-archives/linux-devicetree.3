Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F963CEB99
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880716; cv=none; b=AwVLDqnl0SPuJCCCcDvLBlz23Xf7adajvkjMZ+6KCvrxJWODPsQFOEXAfz4vpC5SAo9jO5vnJ12RuMJ39y/6AVxIvYGQe8rmMj4WDk2ASITtiVkT9OjMzMXhgINp4inMzAR9gXgtdLAxLUgqKceoCcguuToB/mDvcNwvCmNlUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880716; c=relaxed/simple;
	bh=PjDl/t3vZljUsQ3noZ/lu3AG36SIETGDG0qFdadyPM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCbCqnMPRfF7z4jMaAwQ+13dFPSsC3b/a9Ng5tfkKQVkETIpCdFNomazfjT8tsl0nh6B/QpeeHv1A3S6SPrazbt5HSNhZnE2xWJqGGPuXzTJRr1IRH20PyYvzWZSGly9XZTsUADR+EGEonxjS2JbQzMplki5qJoxb7Ji+bbvP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSdWzGtf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSdWzGtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5891F000FF;
	Sun, 20 Sep 2026 05:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789880703;
	bh=01M9qPkd7KV7fp32A3B0FaADseP/YgFKaPcmIfHRdNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CSdWzGtfTGX+SP/Vp8Qg4o8c9uCmqbEsEqat2RONv5DJd+0wV7BO4Mjxe1y/MwhDD
	 26FZAxUHhK2TJ2IoKPWbG1lyWicO4wZbvKdOmi/aWxDiz4RfxFOpZkbgSsTzHcxzzz
	 Wx8iK7pQl84wv/ltnvry9ra1+7NZ5vSPVEwqUQQMTReDqHZFFmeZXIGvxEV3eQO8b7
	 KrpZAq9KlCfxZ1UoTIYgjf4jeL1UsoP9MvU18xlVJQ7ky2FNpRDrCrrYIVxUemlbid
	 IfoZnWMlP5LHRfOUtpfvn4FpuCuVMXsbKk/JBjiDeDq4HyHRcGvG3kWdpp8rjJdGSr
	 QIRmHz4Q5JIAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM
 is closed
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:05:02 +0000
Message-Id: <20260920050503.4E5891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ALSA: dmaengine: double-termination and dead code in __snd_dmaen=
gine_pcm_close()
--

commit 6131d1de92af956678d470a7a7f214c9985a5ad4
Author: Hector Martin <marcan@marcan.st>

ALSA: dmaengine: Always terminate DMA when a PCM is closed

This commit updates __snd_dmaengine_pcm_close() to ensure that the DMA
channel is properly terminated even if the PCM is closed while suspended.

> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..e59b561b849d2 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
[ ... ]
> @@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm=
_substream *substream,
>  	if (status =3D=3D DMA_PAUSED)
>  		dmaengine_terminate_async(prtd->dma_chan);
> =20
> +	/*
> +	 * The PCM might have been closed while suspended, which would
> +	 * skip the STOP trigger. Make sure we terminate.
> +	 */
> +	dmaengine_terminate_async(prtd->dma_chan);

[Severity: Medium]
Does this result in a double-termination when the DMA status is DMA_PAUSED?

Since dmaengine_terminate_async(prtd->dma_chan) is now called
unconditionally, the preceding dmaengine_tx_status() check and the initial
termination call appear to be redundant.

Could this double-termination sequence cause unexpected behavior in DMA
drivers that do not handle consecutive termination calls gracefully?

>  	dmaengine_synchronize(prtd->dma_chan);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D6
