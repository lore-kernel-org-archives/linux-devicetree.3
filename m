Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E21A6803
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094942; cv=none; b=U2JjrruWLtI1GvT98u1MMM2IW3gc0IUDcnIszbu0gEDLPkZWlNLJzQznnuE06XBbrZqRTu5oz2yKjfhOCHjB2YYWbUY+2bNVORTH9J4Lweank7PFXJLCGSpP8e3HyrCeQJ/iikhpUsqJCctnHDwtfs5iRK+fT14NYPYnvlugp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094942; c=relaxed/simple;
	bh=k4QTiAoAAvUM0RnpEVZ8ps6p7RBfvvDC4EoOpy+0iCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfD3q3eRC1TcO46hhWray17M+eKqjR7JuMmzDp+lHQUkr2kryHdVB4gPtnhCrZV9m5uBFX75H3qj2zGQQb9aWzHkxQmomouh9S7mihhG6zAG0umwnbPtc2t8lfJN7ArC4ePQt4M6l5C0Mxre328CErOmk7olXB2MSHfMYJJI2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoNZQ+/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoNZQ+/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014BD1F000FF;
	Sun,  4 Oct 2026 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094939;
	bh=kFrF/veYXkHndKKPaTkldPF9jtqr0Zcp+em315wETUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IoNZQ+/NlWWnP7MzkeeTQDxnQPE14McTbPSoHBM2z7xwau5GebY7ZitrCEtwY/ACJ
	 in3il376vd1hvlobkTNcmTAxym0UY7UY0L8LNOnwddLQvd9mK0VYTD0B9gsomG5eRP
	 lqb4Jh/EKYdPDw7hKE8KHpk6rEdLn+SLsVTo629oYxwT79uoLnPyHGElHk7sWAqoBq
	 Cm5AyHczFK9SAGJWK0m2BMZ+LpS5soAtBWT4O4sAa7NsEE3rPPhnhJGgf69GWRizex
	 mVeM6ECAhKGBPw8R4Wb3PjFcxpgEzD6+VVtoXNzNCzA4TcdoWsJ53GeX7Oig3e47b3
	 3UfGiXIWgGYIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:22:18 +0000
Message-Id: <20261004062219.014BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: snd_soc_set_enum_kctl passes uninitialized control ID to cal=
lbacks
- [Low] ASoC: soc_set_enum_kctl allocates massive ALSA structures on kernel=
 stack
--

commit e3f835f860aa8d0eaf39868ba9b6ebbdc3975a2c
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: ops: Introduce 'soc_set_enum_kctl'

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 4d799c5e44f1b..b1eb74e241932 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c

[ ... ]

> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *car=
d,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
> =20
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *valu=
e)
> +{
> +	struct snd_ctl_elem_value evalue =3D { 0 };
> +	struct snd_ctl_elem_info info =3D { 0 };

[Severity: Low]
Are these ALSA structures too large to be allocated on the stack here?

struct snd_ctl_elem_value is typically around 1220 bytes on 64-bit
architectures since it contains unions with large fixed-size arrays. With
struct snd_ctl_elem_info adding another 272 bytes, allocating both on the
stack consumes approximately 1.5 KB of stack space.

Could this exceed the 1024-byte FRAME_WARN threshold on some architectures
and increase the risk of a kernel stack overflow?

The ALSA core usually relies on heap allocation for these large structures
to avoid exhausting the stack.

> +	int sel, i, ret;
> +
> +	ret =3D kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;

[ ... ]

> +	for (i =3D 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] =3D sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);

[Severity: High]
Does this pass an uninitialized control ID to the put callback?

The evalue and info structures are zero-initialized above, which leaves
their id fields completely empty. The kctl->id is never copied into them
before being passed to kctl->info() or kctl->put().

The core ALSA API guarantees that ucontrol->id is fully populated before
invoking control callbacks. Some drivers rely on this contract. For example,
rt700_mux_put() uses the control name to identify which specific control
is being accessed:

sound/soc/codecs/rt700.c:rt700_mux_put() {
    ...
    if (strstr(ucontrol->id.name, "HPO Mux"))
        ...
}

Because evalue.id.name is an empty string here, will such callbacks fail
or execute incorrect logic?

> +	else
> +		return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D7
