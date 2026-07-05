Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093E360ECD
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282798; cv=none; b=T/KQqR6RjafQWvF1Orua8KR0aN5cDbrm2JbDxyWMK6lyKVZy23SQb0EnU6Y9gcmk9bJNJzBTbwcEiUyU83Kyw5saZHar5JHlj9oeMFjWsD8jRSjjJhK9QXT78xdGkj/9LcqYV3njG9e7l5FfscT3k4itnOMYv2JwE1wXHmNghtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282798; c=relaxed/simple;
	bh=UN33R1RVhFSEKk1t6gRjLHtNaR6S8w/tUUJVc2fLkFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9D2aU6BIN1s4BgBYb3PxZTKfLo23VRdR8kOyOVk7g23D0m02faWsSDygoUZvyHozQj6tFkvHjDAt75AJykkrCHrgrlfXb9TU7XiaFgrKFKYkbhkOrbVoCzxU4/oa8N7t8sSf5oo7qj2ZXXJdkNZKGYQeMW+ylm4SL/U+wR/DI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVzX2F5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVzX2F5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F541F000E9;
	Sun,  5 Jul 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282796;
	bh=OSUo7TUJOdd2IsP90iCL3fUuMzRszxxifdum8ZkWU68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OVzX2F5/SVIbVpRknPoNgWwHaYS8HuI8myGO5cYBm1nCF5Bu7RNSVysR1gADxdOjw
	 R9x5rDyj5LdnCTxV+p6T5f5NzV57SUlQ0VDLkJii/zlf0Jhw7AjRqyU+UFxqVU5zhd
	 20jPWRH3uYRg/pWp2feHTUsuGZ4swyBo5Dy/sEVHvwmmjMbumSPUPYuuMX6KBKQQrB
	 Gsb182g/xspX0UKu9xrAm+7P51ifH7g+Sy9dH6wNfc+zWL0meRkppBY91B6FPdbztA
	 D39pQSp3ND0OFFGQPD+WvccMIQu2RcQIcLYD5eyu2UYh6cCmpqRisNg7eXeUs/RHxK
	 8dJpQg1iBxxgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/6] ASoC: qcom: sdm845: Demystify TDM masks a bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-pixel3-audio-v1-1-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-1-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:19:56 +0000
Message-Id: <20260705201956.74F541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The CPU DAI's capture mask is incorrectly configured to 0x0F (slot=
s 0-3) instead of 0xF0 (slots 4-7), breaking the V/I sense capture path. Th=
e patch exacerbates this by using the playback macro `SPK_TDM_RX_MASK` to c=
onstruct the capture mask, which creates a false semantic link and obfuscat=
es the underlying bug.
--

commit 7636e0a7627a4449334c3af3eda079faca90b76e
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Demystify TDM masks a bit

This commit updates the hardcoded TDM masks in the sdm845 machine driver
by defining them as bitmasks and utilizing them in the hw_params function.
It aims to describe which bits are used for each RX/TX slot.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce9dff4dc525..edd2cc7a1c74f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
[ ... ]
> @@ -129,8 +131,10 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_s=
ubstream *substream,
>  			goto end;
>  		}
>  	} else {
> -		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK | BIT(2) |
> +					       BIT(3), 0,
> +					       NUM_TDM_SLOTS, slot_width);

[Severity: High]
This is a pre-existing issue, but does using SPK_TDM_RX_MASK here conflate
the CPU DAI capture mask with the playback RX macros?

Looking at the capture path in sdm845_tdm_snd_hw_params(), the CPU DAI's
capture mask is currently configured to 0x0F (slots 0-3), but the codecs
are configured to transmit on slots 4-7 (mask 0xF0). This mismatch causes
the V/I sense capture path to receive silence.

Since the DSP channel mapping maps channels to slots 0, 4, 8, and 12, an
active mask of 0x0F completely disables slots 4 and 8 on the TDM port.

Could the capture mask be updated to use LEFT_SPK_TDM_TX_MASK and
RIGHT_SPK_TDM_TX_MASK to correctly configure 0xF0, rather than building
0x0F out of the playback mask?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-pixel3-aud=
io-v1-0-3b66f33859f1@ixit.cz?part=3D1
