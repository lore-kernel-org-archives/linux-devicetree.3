Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0E360EC5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020573; cv=none; b=uigCCvshtlCHYBI2L/bJKyq2Fb4+NDBnZaITk4KAmcTKbmi8wm4DBlj4mTQlj1DPlEOhnh129pe+y040/z8eTQIwwL2FNDtJR+1oo0Qw5JtPCLxpWjnej4+AvOm7gQq09/6sGLbqEPgbmRE/pT4P3nTnjxvEs7e5OvjHqP9RMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020573; c=relaxed/simple;
	bh=xYiHiwDx+mdKo2Nh+pM+F7K4gRKI0lIhN4Hqp3UpL3I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QED82COjbdup2hSgSPGuocX18geJmZnLc+O8ldLm9Rao8H/Mym8Aos1moAsUDYRmCt8Jr35M/o3149PSZ0zzXlhj6ALmMjq9kkKTV7QCz5E7jZny0++EdbagLVEoSHmNZSxNGdfXWyxGj0ocqB9yl6nmpYwj2wr+OWrGy9Z2lpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1iS9YLv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1iS9YLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AEB1F000C4;
	Wed, 14 Oct 2026 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792020571;
	bh=XaVzdBXSu2sn0O3ZvG1wZeBkDUi/+eXeFc139l5OxwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i1iS9YLvbuXUi7M7drut6SU674jSLeenuM4a9XfEuhOQ5lt2rvOMff1AdbPwMR64E
	 hkfVS87hr+ZgUZmZ9Gr58v0bp687LgEBUCsJofqNDYBQIQO6vm75yuLz1T36XMay/J
	 4Okete7DNkcwS7RJ7LGYXgmymNHcX+8Tz5nYIJkOm9iZjQRiKL8FOv7T2IZ4rFRhcU
	 6No6u0PcsioKn5qei7an0JmDDFuSOo5OKbi3pf+2Vu9IC2rbEejZR0wk3MIlBD7eix
	 Op2HGIEYhiqbU9ypUTttwhxiXlz8V+I51aks0zD9BuZ9IWLJqXo3JSHu5gM5QojF1A
	 iKKp188wqXpvw==
Message-ID: <sashiko-outbox-172020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] of: update /aliases lookup on reconfig
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-nh-of-alias-overlay-v8-4-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261014-nh-of-alias-overlay-v8-4-0f74f05ac762@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 23:29:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: UAF in of_find_node_opts_by_path() due to lockless read of of_=
aliases
--

commit b06b8f06ef78bdf618e4aa0aefa4a93a890ea63d
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: update /aliases lookup on reconfig notifications

This commit introduces a reconfig notifier to dynamically update the /alias=
es
lookup table when device tree overlays add or remove aliases. It mirrors
property changes into aliases_lookup and manages entries added at runtime
versus boot time. An aliases_mutex is added to protect the lookup list.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+r=
enesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secret=
lab.ca/ [2]

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6a6d9f8439dd1..b70dedce06fe4 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[ ... ]
> @@ -1934,6 +1934,159 @@ static void of_alias_add(struct alias_prop *ap, s=
truct device_node *np,
>  		 ap->alias, ap->stem, ap->id, np);
>  }
> =20
[ ... ]
> +static int of_aliases_reconfig_notifier(struct notifier_block *nb,
> +					unsigned long action, void *arg)
> +{
> +	struct of_reconfig_data *rd =3D arg;
> +
> +	/* of_aliases may still be NULL when an overlay creates the node */
> +	if (!rd->dn || !of_node_is_aliases(rd->dn))
> +		return NOTIFY_DONE;
> +
> +	mutex_lock(&aliases_mutex);
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		if (!of_aliases)
> +			of_aliases =3D of_node_get(rd->dn);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		if (of_aliases =3D=3D rd->dn) {
> +			of_aliases =3D NULL;
> +			of_aliases_forget_all();
> +			of_node_put(rd->dn);
> +		}
> +		break;

[Severity: High]
Does this lockless read of of_aliases in of_find_node_opts_by_path() introd=
uce
a Use-After-Free race?

The commit message states: "on DETACH the changeset holds its own references
across the notifier so the put here cannot be the final one while readers
still walk the node."

While the changeset holds a reference during the notifier, a reader in
of_find_node_opts_by_path() in drivers/of/base.c reading of_aliases is
completely lockless and not in an RCU read-side critical section. If the
reader thread is preempted immediately after loading the of_aliases pointer
but before calling of_node_get():

CPU1 (Reader)
of_find_node_opts_by_path()
   // Starts executing: aliases =3D of_node_get(of_aliases);
   // Reads global of_aliases pointer
   <preempted>

CPU2 (Changeset detach)
of_aliases_reconfig_notifier()
   of_aliases =3D NULL;
   of_node_put(rd->dn);
<changeset completes detachment, drops its final reference>
<node is freed>

CPU1 (Reader resumes)
   // Calls of_node_get() with the stale pointer
   of_node_get(stale_pointer); // Use-After-Free

Can the reader be preempted long enough for the changeset detach to fully
complete and free the node before the reader increments the refcount?

> +	case OF_RECONFIG_ADD_PROPERTY:
> +		of_alias_create(rd->prop, alias_alloc, true);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-nh-of-alia=
s-overlay-v8-0-0f74f05ac762@nexthop.ai?part=3D4
