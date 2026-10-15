Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7BE5304C3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074355; cv=none; b=OFeGFG5X3AxOKd8F5YXDyAiGExr6JnWMrCm9C4swExVopbExrGl0sN5gkuXZFxo4PwlO3vZdwfnH3xBy3gpSwRMjuyuiVYA5iH7QU3t/L5Q4bY/PXU0qFkJ/CAl2ctFZc8htXSv9HdFjYhnZSxnKFE8+UDMR74hVorHJCu7DXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074355; c=relaxed/simple;
	bh=/xp3LvPEYCezVmGtk/s3sJSi4IN0OhjcZLMV7Cr6m7s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Yxnp1u9jh+PdLLlAFtzqKJ82ZzwIvOCQkQ3yVlpUk7de1IJdUuX+Atu9ySyIHEdAenKTqeGXBw658LAhf4ms3PQeI+zp0CU+6bYnw5HtEQXvhSTe1Nk34PM7kEt698WnEymv9/f5C6qXutUFPxpaloLe3vRazRX+LIPN4uq//d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA+6wOkC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA+6wOkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A1A1F000C4;
	Thu, 15 Oct 2026 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074353;
	bh=FANekc83Zqw9lR8sDtjDHADOQMotDGPpLgd//iEH55Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jA+6wOkClmHEjp7C+T/9/TBQIuH3QHNM3F5ah1LCSc0tBn7L/Lhx+wlLBOWjaVp+m
	 PjZgvg63U4SIXEDX5vQ+VhtI6Nf7I+d9pLbBB/SNdpTwBQ00pZqjbtmO2I1T8Xl/1Z
	 8a1gW7sbpAmDRy91rFMzS7h9yqflbw94PSQGI9R04t0wYAbtEFc7tDVEarVEONmkvm
	 97RS/lhjVLV7a+M4skBVLTaqivyFYMb9HWJAqyGcfZNgf/qeEPRCoUfhpkRLCgx62s
	 26FZEWX+T+v8R/gNQdhJxy/jn271fCxO2CvH6FY5s0yMQZQsZRxq5BGyq4fIl/Ffe6
	 sLgRqv5cJlw5g==
Message-ID: <sashiko-outbox-172957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:25:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: pm4125: data races in micbias control from MBHC workqueues
--

commit 8af5811d67f1f26cf2cd472e51e4bbe2a10e4f6f
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codecs: pm4125: Keep the micbias reference count balanced

This patch updates the pm4125 microphone bias handling to prevent
unbalanced reference drops from the MBHC framework. It changes the global
bias disable to use atomic_dec_if_positive() and ignores micbias releases
that do not have matching requests.

> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> --- a/sound/soc/codecs/pm4125.c
> +++ b/sound/soc/codecs/pm4125.c
> @@ -229,7 +229,7 @@ static int pm4125_global_mbias_disable(struct snd_soc=
_component *component)
>  {
>  	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component);
> =20
> -	if (atomic_dec_and_test(&pm4125->gloal_mbias_cnt)) {
> +	if (atomic_dec_if_positive(&pm4125->gloal_mbias_cnt) =3D=3D 0) {
> =20
>  		snd_soc_component_write_field(component, PM4125_ANA_MBIAS_EN,
>  					      PM4125_ANA_MBIAS_EN_V2I_MASK,

[Severity: Medium]
Is there a race condition here in pm4125_global_mbias_disable() between the
atomic decrement and the hardware register updates?

If a racing enable thread increments gloal_mbias_cnt to 1 and enables the
hardware between this thread's atomic_dec_if_positive() and the subsequent
snd_soc_component_write_field() calls, could the hardware bias be left
disabled while the count is 1?=20

This sequence might silently break the active audio path by tearing down
the mic bias underneath it.

[ ... ]

> @@ -772,8 +772,18 @@ static int pm4125_micbias_control(struct snd_soc_com=
ponent *component, int micb_
>  		}
>  		break;
>  	case MICB_DISABLE:
> -		if (pm4125->micb_ref[micb_index] > 0)
> -			pm4125->micb_ref[micb_index]--;
> +		/*
> +		 * Ignore a release that has no matching request. The MBHC
> +		 * framework releases MIC_BIAS_2 once when the plug type
> +		 * correction work ends and again when it turns the bias off,
> +		 * and honouring the second one would drop a reference on the
> +		 * shared global mbias that was never taken, switching the
> +		 * analog master bias off under an active stream.
> +		 */
> +		if (!pm4125->micb_ref[micb_index])
> +			break;
> +
> +		pm4125->micb_ref[micb_index]--;

[Severity: Medium]
Could this lead to data corruption of the reference tracking arrays?

The micb_ref array is evaluated and decremented non-atomically without a
local lock in pm4125_micbias_control(). Because the MBHC framework executes
from asynchronous workqueues (like mbhc_plug_detect_fn), and DAPM widget
events can run concurrently, inserting a jack during stream playback might
cause these threads to race on the micb_ref array updates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-pm4125_mbh=
c_support-v1-0-8bc1212db6f7@oss.qualcomm.com?part=3D3
