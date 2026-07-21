Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D4235C6B3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670524; cv=none; b=uvnmG64Uk2kYiIFAS/bCvfhq9KzuX/orGooKcpmoFCgQ6jOmHPPLOn0tqg+IJ7xjZ+/yk1N2wGBpkNT530sZfzZMgkeWG+Nn2KEXvUTS/boXz+vp2CVFTZa6RaA7nAOVhSXig2OaHYqfY40KdQBBakpVaqE2SgcmHFGxz6locgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670524; c=relaxed/simple;
	bh=onz/BlE3oe/RdcPYsBj42gIKSQ0jD91b288D/O5xJJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bFCmLj3gIVeJoMCaLCk0iwF39pPd9+Jk3XLvi7lIxahGwoCl3MZ2WRVQ+M767NJ7ecuS2T0OsZ1kv3LUftaPKpjiyPqe+rUm8y6B+Ot7sDyX1ChbMDBw1vCNKikLycUvEVohLpwvVtgs2vQj3CR9NbAaIG8WiJIv+zcu0xrIVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Imy0L8xy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Imy0L8xy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8881F000E9;
	Tue, 21 Jul 2026 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784670523;
	bh=T0OMMmkwzWbfbUST8+qimocoMOhzAQvkQpSoT2B3jyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Imy0L8xyzZy23Vf13Q5z+kpEdy69n+NwbNjIEFpkwvLGXZd0i3mJkl/84BFbVpWBz
	 SdRpyXv6YxGaC1JfFb+g+QjjNYuy9vhw7pR+oNHS/UZ7EUR2vWVUeKy8+rQysUuJiU
	 mH/8gjUTjKSvRGMXZs6Gar9GrCnIYtX8QhI7U/Ts3XPrFkyurLmd8DS5ll8EgERL4M
	 xxW7pCmYiiQPuT8xcpX127rGIaJgLGvA9/zxjqrp7+E8y42eHVTyfy2aaB+qmzc6eJ
	 gBmnRcZ9doLwnh7zulbk+GZZIz/VXgSAX4swONlCNDFmQjRc1ZqFFBfEIKtPqkaZGA
	 +0LJPRVfDpuaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v3-1-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
 <20260721-nh-of-alias-overlay-v3-1-7001028fe2f5@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:48:42 +0000
Message-Id: <20260721214842.CC8881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The deliberate memory leak of the `/aliases` node reference during=
 `OF_RECONFIG_DETACH_NODE` breaks overlay revert and causes an unbounded me=
mory leak.
--

--- Patch [1]: [PATCH v3 1/4] of: incrementally update /aliases lookup on r=
econfig notifications ---
commit a185916382b462aafe7d63399b28b61ce3a88e5b
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: incrementally update /aliases lookup on reconfig notifications

This commit adds an OF reconfig notifier to dynamically update the
/aliases lookup list when nodes or properties change. It handles both
direct devicetree modifications and overlay apply/revert paths, protecting
access to the list with a dedicated aliases_mutex.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+r=
enesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secret=
lab.ca/ [2]
Link: https://lore.kernel.org/lkml/1435675876-2159-2-git-send-email-geert+r=
enesas@glider.be/ [3]
Link: https://lore.kernel.org/lkml/1435675876-2159-3-git-send-email-geert+r=
enesas@glider.be/ [4]
Link: https://lore.kernel.org/lkml/1435675876-2159-4-git-send-email-geert+r=
enesas@glider.be/ [5]

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3f..4e34c65a8f9f0 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

[ ... ]

> +static int of_aliases_reconfig_notifier(struct notifier_block *nb,
> +					unsigned long action, void *arg)
> +{
> +	struct of_reconfig_data *rd =3D arg;
> +
> +	/* of_aliases may still be NULL when an overlay creates the node */
> +	if (!rd->dn || !rd->dn->parent ||
> +	    !of_node_is_root(rd->dn->parent) ||
> +	    !of_node_name_eq(rd->dn, "aliases"))
> +		return NOTIFY_DONE;
> +
> +	mutex_lock(&aliases_mutex);
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		if (!of_aliases)
> +			of_aliases =3D of_node_get(rd->dn);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		of_aliases_forget_all();
> +		/* keep the ATTACH reference: lockless readers may hold the node */
> +		if (of_aliases =3D=3D rd->dn)
> +			of_aliases =3D NULL;

[Severity: High]
Does skipping of_node_put() here cause a memory leak of the device node
and its properties when reverting overlays?

During the ATTACH_NODE notification, the notifier takes a reference on the
node using of_node_get(). When the overlay is later reverted, the DETACH_NO=
DE
handler clears the pointer but intentionally omits of_node_put().

When the overlay changeset is subsequently destroyed,
__of_changeset_entry_destroy() checks the node's reference count. Because t=
his
notifier leaked a reference, the count remains elevated.=20

This elevated count causes the destruction process to print a memory leak e=
rror
and skip setting the OF_OVERLAY_FREE_CSET flag.

Consequently, of_node_release() will refuse to free the node's memory, leak=
ing
the node on every overlay apply/revert cycle.

> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		of_alias_create(rd->prop, alias_alloc, true);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v3-0-7001028fe2f5@nexthop.ai?part=3D1
