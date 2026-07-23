Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E62DC350
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777757; cv=none; b=DIwJ47NwdBmgXz6Sf8GgOkbn/FX4Ww1ku02UuZhGO/9NHaYftdP1f4ElpRiU+uMsT4JanOJz80NYZMImz4DlX9wsb2Mbh3EWhGFVH26ZMUftSsdWLkweUESwZ1KiZfOsHbbnN3KMrlj8DoV9VASakpXGCn/8JTGALQhFvCw22aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777757; c=relaxed/simple;
	bh=V6I3dOmXcTXauh2W8DLKiekwTTiPSfqP+9pHhzOGyQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hfc5+V1W/+YIs7QeQaq0B/9ugABkYj/fBhrLKdOTmF3W3kw49GKaKJOBj3dOwP6TvVenSmLhO1xnvU/JNeWI85HH4ZiDJf4rinL1jWWYZXo01G5a49ZEmFNwEfO5y6whCY3jUfE0ceiCrV+iQs+4s/kynXMsQjq0XOWse5ZaTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huX9nf6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huX9nf6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022251F00A3A;
	Thu, 23 Jul 2026 03:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784777754;
	bh=NWo6aqvLn4oI/Iq5guapRYXAkRhi8+3hwLPbN7vzA/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huX9nf6y02a7UsqF5S76Mnz/IayZCsUc4GUtkmZ9umgK5CDazKU/i5KKov3iVz97h
	 OkbDy+6oQQiTjkRpjYNUiRTE0H9o2arbjaqZwXYO7LA/tZxRywX/D5MBolYE3rm75U
	 0SSoAS/Z7j9Pdxepo8fnXwur+hHNQtuXD3hCbakB7TRh+9EoBn7tQG9A7D+Fq7xpO5
	 02aNxLa1HXs4p3GYc5u0i1BBXwreHRC40emGZd/WJsVWu11k61hXXFzOR3rajeTkBm
	 caX/oZQD7ryBtoFOBEN+Lx9kC5sADekZXseJ+8rRW4qtraalWWAebkEOVSLfdG4wxK
	 mgxuYKnJzXuog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] of: hold a reference on of_aliases during alias
 path resolution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v5-1-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
 <20260722-nh-of-alias-overlay-v5-1-2abe2bb9cdbc@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 03:35:53 +0000
Message-Id: <20260723033554.022251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling of_node_put() while holding a raw spinlock causes a sleep-=
in-atomic bug if it drops the last reference to a dynamic node.
- [High] Lockless iteration of device tree properties is unsafe because upd=
ated or removed properties have their `next` pointer modified, which derail=
s concurrent readers.
--

--- Patch [1]: [PATCH v5 1/9] of: hold a reference on of_aliases during ali=
as path resolution ---
commit aa90279de0a9f76f84e2b40b29743f11984c3ffb
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: of: hold a reference on of_aliases during alias path resolution

This patch modifies of_find_node_opts_by_path to hold a reference to
of_aliases during alias path resolution. It also validates the alias value
to prevent crashes or infinite recursion with malformed device trees.

> Take a reference across the walk. The walk itself stays lock-free
> like every other property iteration: removed properties keep their
> ->next and are only freed when the node is released, so the node
> reference is sufficient.

[Severity: High]
This isn't a bug introduced by this patch, but is the description of the
lock-free walk accurate?

Looking at __of_remove_property() and __of_update_property(), when a
property is removed, it is moved to the node's deadprops list:

drivers/of/base.c:__of_remove_property() {
    ...
    /* Found the property, add it to deadprops list */
    prop->next =3D np->deadprops;
    np->deadprops =3D prop;
    ...
}

If a concurrent writer (e.g., overlay application) removes a property while
for_each_property_of_node() is iterating over it, won't the reader's next
access of pp->next follow the pointer into the deadprops list?=20

This would cause the reader to traverse the dead properties and skip the
remaining valid properties in np->properties, potentially causing spurious
lookup failures.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3f..6f79f593fc779 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

[ ... ]

> @@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(con=
st char *path, const char **opt
>  			p =3D separator;
>  		len =3D p - path;
> =20
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> +		/* the load pairs with writers that retire the node */
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
> +		aliases =3D of_node_get(of_aliases);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +		if (!aliases)
>  			return NULL;
> =20
> -		for_each_property_of_node(of_aliases, pp) {
> -			if (strlen(pp->name) =3D=3D len && !strncmp(pp->name, path, len)) {
> -				np =3D of_find_node_by_path(pp->value);
> +		for_each_property_of_node(aliases, pp) {
> +			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
> +				if (of_alias_value_ok(pp))
> +					value =3D pp->value;
>  				break;
>  			}
>  		}
> +		/* the reference on @aliases keeps @value alive */
> +		if (value)
> +			np =3D of_find_node_by_path(value);
> +		of_node_put(aliases);
>  		if (!np)
>  			return NULL;
>  		path =3D p;

[Severity: High]
This is a pre-existing issue, but does calling __of_find_node_by_full_path()
while holding devtree_lock further down in this function risk a
sleep-in-atomic bug?

Right after this block in of_find_node_opts_by_path(), devtree_lock (which =
is
a raw spinlock) is acquired around __of_find_node_by_full_path():

drivers/of/base.c:of_find_node_opts_by_path() {
    ...
    /* Step down the tree matching path components */
    raw_spin_lock_irqsave(&devtree_lock, flags);
    if (!np)
        np =3D of_node_get(of_root);
    np =3D __of_find_node_by_full_path(np, path);
    raw_spin_unlock_irqrestore(&devtree_lock, flags);
    ...
}

Inside __of_find_node_by_full_path(), it iteratively drops node references:

drivers/of/base.c:__of_find_node_by_full_path() {
    ...
    node =3D __of_find_node_by_path(node, path);
    of_node_put(tmp);
    ...
}

If a parallel thread (such as an overlay removal) detaches a dynamic node,
its primary tree reference is dropped.

If of_node_put() drops the last reference to that node while held under the
raw spinlock, won't it synchronously invoke of_node_release()?

For dynamic nodes, of_node_release() calls fwnode_links_purge(), which
acquires fwnode_link_lock (a sleeping mutex), resulting in a sleep-in-atomic
scenario.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v5-0-2abe2bb9cdbc@nexthop.ai?part=3D1
