Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCA31E832
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796663; cv=none; b=HLE8PIgimQY9AWmYQkloBggV4Mfy24c2suSX/1f1ZKA2BC0QgywZ5p7jNCiuku7XTHvHCMeLJ4kPjAvdymYEu6o9yqRm41DMeMTrhBLmtyANNdwyIgwVQLlZ+6Bnp/40JlX/jAZ/XExsoN6yw8yrjJzaomOvDwLcbuMEhfaQoBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796663; c=relaxed/simple;
	bh=8xC/jaj0eNGIB+Ze8C2A1T4OMRw4qVLIYVGp9J3auYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P7Sj6TgCrRkZM9u0mMOBGDk7gwRM7mtUimw6dR+35Zi//M2FOP59FNDZ2M8hwbkLASnHcadQxZ4z2GiaKJytPZdqRdUD+f9cWHsW49XJiKBPk8/+fdhA5SmMBcaQizz75H6xXS8Li1L95zZcTC2eElmE5v/wOVHu/UeBCPbSJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj4KxGg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj4KxGg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D76E1F000E9;
	Thu, 18 Jun 2026 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781796662;
	bh=/loCxJA9RKmjFK/eYnIH9YltXzyng79iaXz9sPi6hvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oj4KxGg8+2/kiFCBB+2TBZXM/NS8jUJGsDEGZuAF2bzxpwv1kOeFlmAoeIkGGSWJ7
	 0WD5UX0Zjgi/+rXFBNC7TMW9m/jgCRu7M/AMzFFK2BEgO0V8PQM28gBYTBoMLPlc0V
	 DrrZUQ7+HWM+Lvks96lz0QYG0M78R1hLGT73egCBfIOpPGbV9p4LdBR7UytGtvnfd/
	 7ZMEjl7f5I27XpEH5IXzNVsQBbSW4MkXZBXECmuScLHFe95VZuM9r4uOoeCDhCW/tO
	 tvQnPpBDUSGze4DImIQsn3Y3j2jQGGSW86AClLEGwBCJrkW2jJJbGI9D1fvLdXKjBP
	 EztshCmg4haug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alban Bedel" <alban.bedel@lht.dlh.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 15:31:02 +0000
Message-Id: <20260618153102.5D76E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free vulnerability in software node reference resolution.
- [High] Data race and linked list corruption in software node children man=
agement.
--

commit 3b564802f7102505002d84b52abe9e6a26646a5d
Author: Alban Bedel <alban.bedel@lht.dlh.de>

software node: Fix software_node_get_reference_args() with index -1

This patch corrects an out-of-bounds access check in
software_node_get_reference_args() by ensuring the bounds check correctly
handles UINT_MAX as an index.

Closes: https://lore.kernel.org/linux-devicetree/20260611103904.7CB131F0089=
3@smtp.kernel.org/

> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index a19f8f722bc8e..e76f7c36f19e6 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -529,7 +529,7 @@ software_node_get_reference_args(const struct fwnode_=
handle *fwnode,
>  	if (prop->is_inline)
>  		return -EINVAL;
> =20
> -	if ((index + 1) * sizeof(*ref) > prop->length)
> +	if (index >=3D prop->length / sizeof(*ref))
>  		return -ENOENT;
> =20
>  	ref_array =3D prop->pointer;

[Severity: High]
This isn't a bug introduced by this patch, but it looks like there's a
pre-existing use-after-free risk later in this function.

When we resolve the reference here:

	if (ref->swnode)
		refnode =3D software_node_fwnode(ref->swnode);
	...
	args->fwnode =3D fwnode_handle_get(refnode);

software_node_fwnode() calls software_node_to_swnode(), which drops the
swnode_kset->list_lock and returns the swnode pointer without elevating its
reference count via kobject_get():

drivers/base/swnode.c:software_node_to_swnode() {
    ...
    list_for_each_entry(k, &swnode_kset->list, entry) {
        swnode =3D kobj_to_swnode(k);
        if (swnode->node =3D=3D node)
            break;
        swnode =3D NULL;
    }
    spin_unlock(&swnode_kset->list_lock);
    return swnode;
}

Since the pointer is unreferenced, could it be concurrently unregistered
and freed (e.g., by software_node_unregister()) before we call
fwnode_handle_get() on it?

[Severity: High]
This is also a pre-existing issue, but I noticed a potential data race and
linked list corruption in the software node children management in
drivers/base/swnode.c.

In swnode_register(), child nodes are added to the parent's list without
a lock:

drivers/base/swnode.c:swnode_register() {
    ...
    if (parent)
        list_add_tail(&swnode->entry, &parent->children);
    ...
}

And in software_node_release(), they are removed without synchronization:

drivers/base/swnode.c:software_node_release() {
    ...
    if (swnode->parent) {
        ida_free(&swnode->parent->child_ids, swnode->id);
        list_del(&swnode->entry);
    }
    ...
}

If multiple child nodes are concurrently registered or unregistered under t=
he
same parent (e.g., dynamically by drivers calling
fwnode_create_software_node()), could this corrupt the doubly linked list a=
nd
crash the kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618152035.1600=
436-1-alban.bedel@lht.dlh.de?part=3D2
