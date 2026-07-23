Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA835C1B2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777756; cv=none; b=kuYXj2EEwogoke7Il8rxGNQr0q3CdTBweOIkpvd3sqDnYqbU+doSoD903FfEG3FKSQcCa3Kww2l2STDCBO/NAqLZcOXHk70sPV4+JonNtZDCJpTO9ab0Nk0TNJznf5Zwi+CFjY9wrEuWcssIE+evvCQ0/UeGvwxnRc7X4b8Va5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777756; c=relaxed/simple;
	bh=dYqLkE4aMGl16rsYWJwe0Hsq/msjxJg+0yb8oGprE/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o9lxhf5nCxd5fKlEPz24irW4BKaYnYtoJPTauXpBw+ZN5WsTJQLfyKPvdow5UvESOZrrtllxWMOkcr1RSgtGVhQsq27Nxy/zfgI+CAGL7s8P4FuZRh5vcdV2qb54KKZS8Gx2hdoIrYpL4Wm3KwIi0cFC7Yp8h+IukxwciU1awIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5hRg/ws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5hRg/ws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1261D1F000E9;
	Thu, 23 Jul 2026 03:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784777753;
	bh=FFFtl2cQUQqnbjMoD3c5LJPxEQ81QZPph0ICPVRNIlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5hRg/wsVRg5Gk0/ETZYx7hRdxnpGk+VnpiP7Jr5BAvbBK9oLkKvixqD6CgnGy3F7
	 mur3pv9VNUwjYWRRmXqDsqKmhP6J+bkYrPup7znx/6pmUGiIVTRWr7/cvQ623/Llxq
	 eWJT9Fmte/eZgYGmFQmzqCriVm84YGvoxp0+SDI5ehpq/G+aodPugM5Z5NpGGcEqvG
	 pzGtbLxQ1WDuh9n5X/SFP+En3nwje1vYVEg2vconqVfD4pKExPzI+mID2rYNUl8mju
	 JApcElL9rULs6T69Ow9Pa+jh7x09Ql7/tc2nvc3ilPQ5FJgu2d20qUMllTomL15WdN
	 Qss/5hk5vRMzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] of/overlay: don't create "//" paths for
 fragments targeting the root
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v5-6-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
 <20260722-nh-of-alias-overlay-v5-6-2abe2bb9cdbc@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 03:35:52 +0000
Message-Id: <20260723033553.1261D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditionally dropping the "/" target path generates an invali=
d empty string "" for symbols referencing the root of a root-targeted overl=
ay fragment.

Pre-existing issues:
- [Medium] Device node reference count leak in init_overlay_changeset() on =
error path.
- [Medium] Memory and reference count leak of duplicated device node in add=
_changeset_node().
--

--- Patch [6]: [PATCH v5 6/9] of/overlay: don't create "//" paths for fragm=
ents targeting the root ---
commit aa0fca741484513e2136984fcef43c90b2ab9e9a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: don't create "//" paths for fragments targeting the root

dup_and_fixup_symbol_prop() rewrites a symbol value by replacing its
"/fragment/__overlay__" prefix with the fragment's target path. When
the fragment targets the root node the target path is "/" and the
result starts with "//", which __of_find_node_by_full_path() cannot
resolve: symbols pointing into such fragments silently stop
resolving.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index f1aa8574069a6..c6962e9948cc9 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -256,6 +256,9 @@ static struct property *dup_and_fixup_symbol_prop(
>  	if (!target_path)
>  		return NULL;
>  	target_path_len =3D strlen(target_path);
> +	/* a root target renders as "/"; drop it to avoid "//" results */
> +	if (target_path_len =3D=3D 1 && target_path[0] =3D=3D '/')
> +		target_path_len =3D 0;
> =20
>  	new_prop =3D kzalloc_obj(*new_prop);
>  	if (!new_prop)

[Severity: Medium]
When path_tail_len is 0 (i.e. a symbol referencing the root of a root-targe=
ted
overlay fragment), wouldn't unconditionally clearing target_path_len result=
 in
an empty string "" instead of a valid path?

If path_tail is empty, should we preserve the root "/" target?

[Severity: Medium]
This is a pre-existing issue, but does this error path in
init_overlay_changeset() leak the successfully initialized fragment referen=
ces?

drivers/of/overlay.c:init_overlay_changeset() {
    ...
		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(fragment->overlay);
			ret =3D -EINVAL;
			of_node_put(node);
			goto err_out;
		}
    ...
}

If a later fragment fails to find its target, the function jumps to err_out
without saving the processed fragment count to ovcs->count. As a result,
free_overlay_changeset() will skip cleaning up the leaked nodes.

[Severity: Medium]
This is a pre-existing issue, but is it possible for add_changeset_node() to
leak the dynamically allocated tchild device node on attachment failure?

drivers/of/overlay.c:add_changeset_node() {
    ...
	if (!tchild) {
		tchild =3D __of_node_dup(NULL, node_kbasename);
        ...
		ret =3D of_changeset_attach_node(&ovcs->cset, tchild);
		if (ret)
			return ret;
    ...
}

When of_changeset_attach_node() fails, it returns directly, skipping the
necessary of_node_put(tchild) call and leaking the node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v5-0-2abe2bb9cdbc@nexthop.ai?part=3D6
