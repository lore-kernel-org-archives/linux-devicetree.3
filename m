Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693222E266C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881022; cv=none; b=o3pgH6u0y2ReQKxiQhLAyncJl5odjRjfDVed2LTYe4qoF3o4tgSDhLY/7Wul3+H9/yXyYjDZk5twEXRTvYlswPZ1nioHoUifQMpyL5NilqKwFxle1eE/6RWd3671MgrQFHPyek9ABAJs5yDyaQ1hL4rcS4fFV6G21nwwVw5Og4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881022; c=relaxed/simple;
	bh=Ut0SMd/6z9jEOp3KFth9BIrR41yUq3QulZL0kogPOzw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jlk7ieyzlcOk2L71/oYFOYbVN++/sV0SFIjAtghQ+P3gKR/gEC64WNZpORgKDJHW9LctCVQGJcHSUPXk1tRHeLw4C/+yQBK8E73eJnZVPjmfD4YnHf1PbzXVK8VTiHXveOjXc3XhqLsuFhHtWH35OHI338guzcAmsTG6tQJOrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnhVpPQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnhVpPQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC05D1F000FF;
	Sun, 20 Sep 2026 05:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881008;
	bh=/iSLFqde+1cvhGwiMjAkDC+daeWZJf3Bxf0d+hZYCfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TnhVpPQHdOO1LLujMSHUjtAKCtlnYEdb/9GSKyDwKLKyXcbL8jZDJn77pFPhI7skZ
	 GYThFUyrruJDUEv953FZbEIrEGwCKe8ZvitpiquYjIZMk+RbGFJQOM3Lm061m5jRqL
	 WD5wwtwBpQA8yL2T7UGv6hUaenCt+wW2ekr4ZCe1IsIMW2CkV1m5i1yY+bMv7VHZ7j
	 VfJWCGPK0pTmfyxfzBXNAa+3QyqtzlB8HntOJziiG0lr2c0Y5OuPB5gQpKPNbWgKmJ
	 3k+ts5yaVuJWa52hTNcGx6zQBvIyRvvhV+2PggRRHR7Lp8VZbViBIeQostMIkC37EL
	 4qGZVGOXq/yjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:10:07 +0000
Message-Id: <20260920051007.EC05D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ALSA: uninitialized struct snd_ctl_elem_value exposes stack memory=
 and triggers OOB access
--

commit 39b7a1686876eb2be8da2cbd7401a6040c476ac1
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: ops: Introduce 'soc_set_enum_kctl'

This commit introduces a new function to set enumerated controls to desired
values. It allows setting either a single control or many controls in bulk =
by
pattern, and is intended for use by machine drivers during fixup_controls.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index d35e24df891b6..dc27d1c409abb 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c

[ ... ]

> @@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *car=
d,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
> =20
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strv=
al)
> +{
> +	struct snd_ctl_elem_value value;
> +	struct snd_ctl_elem_info info;

[Severity: High]
Is it safe to allocate these structures on the stack without
zero-initialization?

The value and info structures are roughly 1.5KB in total. While info is
typically overwritten by the kctl->info() call below, fields like value.id
(which includes numid, index, and name) are left containing uninitialized
stack memory.

> +	int sel, i, ret;
> +
> +	ret =3D kctl->info(kctl, &info);

[ ... ]

> +	if (sel =3D=3D info.value.enumerated.items)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < info.count; i++)
> +		value.value.enumerated.item[i] =3D sel;
> +
> +	return kctl->put(kctl, &value);

[Severity: High]
Could passing this uninitialized value structure to the put callback cause
out-of-bounds memory accesses?

When kctl->put() is invoked, drivers using ALSA helper macros like
snd_ctl_get_ioffidx() or reading id.name via strstr() will use this garbage
data as array indices or string matches.

This could directly lead to out-of-bounds memory accesses and kernel panics
when machine drivers use this exported API to set enumerated control values
during initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D12
