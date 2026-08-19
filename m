Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71F3C81B5
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122761; cv=none; b=MfGPhW4WwURpGNw0+ievwxvy2ReNcEnJlydklzwyZSiV3pSkjC+PjbDuFZfx3bkoFdZdaY9jfOVYfkeWFdaRO/WfVq4vMyfB5Np+FuF4Xa5CayPZfmE4ums/efo5rUsgNdT/yBF74R+MY2Ftw35Kwmj4NPZEYiks64OVcw+kGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122761; c=relaxed/simple;
	bh=yGfqj3HYy3rGPOcxX42OxEYVtaKXqUNAxt8inXmCzd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qvg5pZTLfrVQfhxOanzmkU4cfLXTWcckiUJWy28iafmNqGkl9w8wQ1TDAtcErAW9LvsAi8RUkOFZO7so8h5ipNqAzA+r7DIsXp4R/eO4dkUI59j4bIWEUjhnRoWEZpGUROBy1vteySk38Vo4hoT0RUzrchpcY+KtjWH+MX6j194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACxDVoUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACxDVoUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A231F000E9;
	Wed, 19 Aug 2026 06:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787122760;
	bh=aitLPMqRbgvgOWfO1ikM8TCgMh7n30GArIuAOmKCkC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ACxDVoUfNI+AtVZLgi90x+4l8n8HTmRMlBrO6cBSNYJuIce90ehEEi5BqyoAS7Jyu
	 QQvsPvL0N57Hxs3EMbytYgKoIcNt+WLQfUK2GroiN5/wZ/DCTRwDEqlHUobF3ojDLy
	 A5T/GDHxYfpMTNZmwGHjXu4YyVuJCk+0cZzk0XVufj41o65UHc4kDmEiRP+v8KBb/R
	 wWKt7wQc10OkLNhGWZwPlgGiB3760+Xyhi5ZoMfTwnWhW6AobZhln/2ZrGugWm2GSW
	 p4qgjclQd/XS2Pk3ZjdBrC58WtMnN7JQhXSQEaFaJa/E05LH0co9FMq4dn8j0mo35s
	 GORvRokJqsegw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/4] driver core: add fw_devlink
 supplier-copy helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-submit-phy-package-fwdevlink-v1-v3-1-40a905ea16b6@gmail.com>
References: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
 <20260818-submit-phy-package-fwdevlink-v1-v3-1-40a905ea16b6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 06:59:19 +0000
Message-Id: <20260819065919.C3A231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mixing goto-based error handling with guard() cleanup in fw_devl=
ink_copy_suppliers().
--

--- Patch [1]: [PATCH net-next v3 1/4] driver core: add fw_devlink supplier=
-copy helper ---
commit 143585594c89c21bf4350877fc73c0e66d637db3
Author: James Hilliard <james.hilliard1@gmail.com>

driver core: add fw_devlink supplier-copy helper

This commit adds fw_devlink_copy_suppliers() to allow frameworks to copy
direct supplier links from a container firmware node to a real consumer
firmware node before the consumer is registered. It leaves source links
intact, skips ignored links, and clears cycle flags for newly copied links.

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4d026682944f2..cf3f4133391d0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
[ ... ]
> @@ -2394,6 +2394,66 @@ static void fw_devlink_link_device(struct device *=
dev)
[ ... ]
> +int fw_devlink_copy_suppliers(struct fwnode_handle *to,
> +			      struct fwnode_handle *from)
> +{
> +	struct list_head *first;
> +	struct fwnode_link *link;
> +	int ret;
> +
> +	if (!to || !from)
> +		return -EINVAL;
> +	if (!fw_devlink_flags || to =3D=3D from)
> +		return 0;
> +	fw_devlink_parse_fwnode(from);
> +
> +	guard(mutex)(&fwnode_link_lock);
> +	if (READ_ONCE(to->dev))
> +		return -EBUSY;
> +
> +	first =3D to->suppliers.next;
> +	list_for_each_entry(link, &from->suppliers, c_hook) {
> +		u8 flags =3D link->flags & ~FWLINK_FLAG_CYCLE;
> +
> +		if (flags & FWLINK_FLAG_IGNORE)
> +			continue;
> +
> +		ret =3D __fwnode_link_add(to, link->supplier, flags);
> +		if (ret)
> +			goto rollback;

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup here?

According to the cleanup subsystem guidelines in include/linux/cleanup.h,
usage of goto and cleanup helpers like guard() should never be mixed in the
same function to avoid confusing ownership semantics.=20

Could this rollback logic be converted to use scope-based cleanup, or could
the guard() be replaced with traditional mutex_lock and mutex_unlock calls?

> +	}
> +
> +	return 0;
> +
> +rollback:
> +	while (to->suppliers.next !=3D first) {
> +		link =3D list_first_entry(&to->suppliers, struct fwnode_link,
> +					c_hook);
> +		__fwnode_link_del(link);
> +	}
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-submit-phy=
-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com?part=3D1
