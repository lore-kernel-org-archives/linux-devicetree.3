Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECAF357D11
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880996; cv=none; b=pPM7NCS5O2VS6YDguF6qnyqiA05N1YD8oLQt3EQAxTzJCxzgE9kMJ6ZGQ6zJhJ8Red2CDJsdb4qRuEbEe/T/I9UsEcE5lV6/8+7TeuGER4ffE5k2XrGMqoxiBY6BjrXhfwe1qMbXk2QENHa8MKeD3TxnZNbGjngQ85Fb5nKGye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880996; c=relaxed/simple;
	bh=9WT9enKknd8Y+t6uIgpK04lYNAXwWvxGinOn/X9k0zQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ACG2V338mH8/EbvC+/R2uwYJbyHGGMRvdNfzX/C4ESyQSnqIiCzZTkn9rV7nVL9/IbN0OvMzFQLXVdo5BIy9lTBDE8Pe/kNheQ0NZMz/iANqYl/vk+kqKEeHRBOp3Jv1eJttZKMN0V0La3TBFifcuMqOf/9aD5fBeRZKGK37xiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WovVRKVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WovVRKVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AE01F000FF;
	Sun, 20 Sep 2026 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789880986;
	bh=YVIYb5/pduV2VDMITtvKhLMlh34Ar1csnDqGS7p9RU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WovVRKVMCL1Idhs7Wgnl8QC6DETIQrFU7On2weks4Tcnh/f0DUa2yKLepiZIUDuci
	 cGM9KnHbasKWzlrytR47lhrgPMdQewNo5Bew9ZrwO4D1+NqWExoGgr3qJK25M51cCa
	 Azl5iud36NNsC6n7CHZ8pcDNSVn9p/CtN4mrrXuKcWbvgcLPHWnePpVbt2nWYOrGrh
	 apFhQuY7ZTLnQkCCNH/AE+wJ3XzcV847BgcSLnNTnRq6tzRouh6rtL+e1rp1eTihcP
	 t9w2/TJjZnfQzEe8uirMCvS4Ca4MnD1h/+e7vJMfMtcasPKmKYFvEyWpa3bZDbmg19
	 mGdNyV16dNPOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/28] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-11-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:09:45 +0000
Message-Id: <20260920050946.49AE01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: ops: snd_soc_deactivate_kctl() API contract violation when=
 no controls match
--

commit 5406f895c4457827c28646b6821be67f779d1939
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: ops: Introduce 'snd_soc_deactivate_kctl'

This commit introduces snd_soc_deactivate_kctl() which allows machine drive=
rs
to activate or deactivate controls singly or by pattern. It is intended to =
be
useful for driver fixups.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 2f91ee7946bb1..d35e24df891b6 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c

[ ... ]

> +/**
> + * snd_soc_deactivate_kctl - Activate/deactivate controls matching a pat=
tern
> + *
> + * @card: where to look for the controls
> + * @name: name pattern
> + * @active: non-zero to activate, zero to deactivate
> + *
> + * Return number of matching controls on success, else error.
> + * No controls need to match.
> + */

[Severity: Medium]
The kernel-doc explicitly states that no controls need to match, which impl=
ies
calling this for an optional control shouldn't result in an error.

> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,
> +	const char *name, int active)
> +{
> +	struct snd_kcontrol *kctl;
> +	int hits =3D 0;
> +	int ret;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	list_for_each_entry(kctl, &card->snd_card->controls, list) {
> +		if (!soc_control_matches(kctl, name))
> +			continue;
> +
> +		ret =3D snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)
> +			return ret;
> +		hits++;
> +	}
> +
> +	if (!hits)
> +		return -EINVAL;

[Severity: Medium]
Does returning -EINVAL here violate the documentation above?

If a machine driver relies on the documentation to perform best-effort
deactivation of optional hardware-variant controls, its initialization
sequence could unexpectedly fail and abort the probe.

Should this return 0 instead when there are no matches?

> +
> +	return hits;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D11
