Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C934CFDE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966153; cv=none; b=aglqXrzK+Envh8SulkZ750g3fZcYdFIoavmFzd6c78hJC0/SjdoBaQNZevMqG5bdbPAWydEyItx/CPtsVWVBcoCsn1RVt/Cw2CNTgade3bejbMZrUNrtggiFe3sCgmQ4+k9wyUpT9R+tS97Vy2vmdjR2kKBbbXOerZT8q2x/qws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966153; c=relaxed/simple;
	bh=sR3TCuamdru9TOPFf7S96BEvHWEQX7TE3a6fQikatRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SsobK8glJtNK5Dx8QzK5NxRgXdP9TQ1ubvRuDqL+mmwLKnSFKsaW00qQ4Oy5JaUljHlLkhV2EutIj6M9Ma0a6GYDq61R/qatkc7ug8cPzVXLioBq/UuDyYsbhifBAfqyXTwuZGbwytOvlvbrln0kRT0Eqi4GzVtRWdW9tbyMtGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=burjjJih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="burjjJih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040061F000E9;
	Thu,  2 Jul 2026 04:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782966152;
	bh=jazMLhblZTNvMjPriM3ODKY0o7ctdlkpTu6ycMdlnvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=burjjJih3kgfm9Js0OVwNMapm0JMp9mdiFnOzghmHUXzjx0m0kwvdtmmcMyE14cba
	 8dT2o94pSNnBKpURR2lgnlfUfr/vkYV0TlWuDetXojF70DKNj89398boiXsQAjXhjy
	 TspQ/bGe6nSd1wT5Ke0HRtVTL0f2yCIhN/RFInUe7iebEHrdSGvLG4pBCQ4OrAnpgB
	 izgUb1aNjgxsJ5KVJxKyZsj0tCK0uCSqmwVJyZ0ZcdEStvNy2bM5tlPG43LZ/BjfZU
	 DQgARr2IiMJoxgjhFfCCVGYWRkJIRmByYmfa62byS03q8Pd6UQ+0/Vm9FCHC9y8RCd
	 BuatrxR/bzmMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] gpu: host1x: Allow limiting usable channel and
 syncpoint ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260702-host1x-nohv-v2-4-e6d88bac0af6@nvidia.com>
References: <20260702-host1x-nohv-v2-0-e6d88bac0af6@nvidia.com>
 <20260702-host1x-nohv-v2-4-e6d88bac0af6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 04:22:31 +0000
Message-Id: <20260702042232.040061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unvalidated device tree properties `nvidia,channels` and `nvidia,s=
yncpoints` lead to out-of-bounds array accesses.
--

commit c583bec6dab6b936ed8b99cb1df24a3d2f9ac317
Author: Mikko Perttunen <mperttunen@nvidia.com>

gpu: host1x: Allow limiting usable channel and syncpoint ranges

This commit allows specifying usable channel and allocatable syncpoint
ranges through the device tree. This is necessary when Host1x resources
are shared between multiple operating systems or independent hardware units.

> diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
> index ca5d0f51cf7da..38fcdda8388ad 100644
> --- a/drivers/gpu/host1x/channel.c
> +++ b/drivers/gpu/host1x/channel.c
> @@ -121,13 +121,13 @@ EXPORT_SYMBOL(host1x_channel_put);
>  static struct host1x_channel *acquire_unused_channel(struct host1x *host)
>  {
>  	struct host1x_channel_list *chlist =3D &host->channel_list;
> -	unsigned int max_channels =3D host->info->nb_channels;
>  	unsigned int index;
> =20
>  	mutex_lock(&chlist->lock);
> =20
> -	index =3D find_first_zero_bit(chlist->allocated_channels, max_channels);
> -	if (index >=3D max_channels) {
> +	index =3D find_next_zero_bit(chlist->allocated_channels,
> +				   host->channel_end, host->channel_base);
> +	if (index >=3D host->channel_end) {

[Severity: High]
Could this result in an out-of-bounds access if the device tree specifies a
range larger than host->info->nb_channels?

The bitmap chlist->allocated_channels is sized according to the hardware
maximum, but host->channel_end is parsed directly from the device tree
without bounds checking.

[ ... ]

> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 545fa2e3f180c..7103f018cb1bf 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -331,6 +331,39 @@ static void host1x_setup_virtualization_tables(struc=
t host1x *host)
>  	}
>  }
> =20
> +static int host1x_get_assigned_resources(struct host1x *host)
> +{
> +	struct device_node *np =3D host->dev->of_node;
> +	u32 vals[2];
> +	int err;
> +
> +	err =3D of_property_read_u32_array(np, "nvidia,channels", vals, 2);
> +	if (err =3D=3D 0) {
> +		host->channel_base =3D vals[0];
> +		host->channel_end =3D vals[0] + vals[1];

[Severity: High]
Should we validate these parsed bounds against host->info->nb_channels?

Without a check, a malformed or dynamically loaded device tree with
excessively large ranges can cause out-of-bounds accesses during allocation.

> +	} else if (err =3D=3D -EINVAL) {
> +		host->channel_base =3D 0;
> +		host->channel_end =3D host->info->nb_channels;
> +	} else {
> +		dev_err(host->dev, "invalid nvidia,channels property: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D of_property_read_u32_array(np, "nvidia,syncpoints", vals, 2);
> +	if (err =3D=3D 0) {
> +		host->syncpt_base =3D vals[0];
> +		host->syncpt_end =3D vals[0] + vals[1];

[Severity: High]
Similarly, should we check host->syncpt_end against host->info->nb_pts
here to prevent out-of-bounds pointer dereferences later in
host1x_syncpt_alloc()?

[ ... ]

> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 807c74fc6a0ac..7760252b3394e 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -59,7 +59,7 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host1x=
 *host,
>  					  unsigned long flags,
>  					  const char *name)
>  {
> -	struct host1x_syncpt *sp =3D host->syncpt;
> +	struct host1x_syncpt *sp =3D host->syncpt + host->syncpt_base;
>  	char *full_name;
>  	unsigned int i;
> =20
> @@ -68,10 +68,10 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host=
1x *host,
> =20
>  	mutex_lock(&host->syncpt_mutex);
> =20
> -	for (i =3D 0; i < host->info->nb_pts && kref_read(&sp->ref); i++, sp++)
> +	for (i =3D host->syncpt_base; i < host->syncpt_end && kref_read(&sp->re=
f); i++, sp++)

[Severity: High]
Can this loop dereference sp->ref out of bounds if the device tree specifies
a syncpt_end larger than the size of the host->syncpt array?

The underlying array is allocated based on host->info->nb_pts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-host1x-noh=
v-v2-0-e6d88bac0af6@nvidia.com?part=3D4
