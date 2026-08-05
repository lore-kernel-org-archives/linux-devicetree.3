Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9673CB8EB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962715; cv=none; b=E4gvzISc4KEeQCAwq4JCcdOGXi0LI9FZKXQuQpK8TbYf+3aWEX2EFL7b32qiNTcT7D2bMfHp7uHOZ6bV7ROfjXqZpdtCOfQmctcqYmQrwUjQg7P6BREeOEaN0oiz21nt8wcQdGlaRsPJdtyagUUnobxG3nbFMnSE+xtgpccZcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962715; c=relaxed/simple;
	bh=n8ld5uiSzbtsvs45ITOwOU5mUL2CxBz+g4zAakf4+UE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tO1dJsiKDaiGIs0NhYLT/RApGkNjr3I2SRWE9+dUZ1LLM82whSh1iTnMs8sIAMdwnZQ4OB/aiNwH9+0I8BOGZrAalL5R2GJKG5O9GHk60ix94kwTozHwAm+Ugyg6NGta5+wOEPWqfSSIeBi2hHstF0K39cXMptQ3ioM8rtfIfco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jalORIp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jalORIp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C41F000E9;
	Wed,  5 Aug 2026 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962713;
	bh=4apzi1KeK31rE+ZtWr1cEn85LZ7jsAnG5wlrWaZ5H9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jalORIp4v7fK1Wb17fGdXFlajZjE0eRh6g1R4fTI011eCJiGP/pcO8LOSuLDECcpx
	 ipgSYBNSnMx+Tx/ZW8IQrIir632j/VG1vkXRLNchLTLsWNm/MtnWiEDKzdCJxg6GFk
	 9XlNKfwNEdoaltzelvOf8XC+waTPbVw/2RxOfMoF2i14W+C43OXzKdtYqh408VspCJ
	 KNGLAgGPa2zWPIu5Wi0x8juiyZYSS30tmft8Ctx1cAoppaWuZWfhRtsjsV3vJeQLcT
	 fNRkI/uQXCeZ+HJUgKxPFJpwT4OBfXBTfsWcItuUslj2cnxDkz3LcV7yqe5t3MVQf7
	 3C/eGHOgQX84g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/10] of/overlay: don't create "//" paths for
 fragments targeting the root
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-nh-of-alias-overlay-v6-7-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-7-74f21d440819@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:45:12 +0000
Message-Id: <20260805204513.806C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Node reference leak for initialized fragments if find_target() fai=
ls in init_overlay_changeset().
--

--- Patch [7]: [PATCH v6 07/10] of/overlay: don't create "//" paths for fra=
gments targeting the root ---
commit 160c0459de49f61664940cc0b23bceacbf1b3082
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: don't create "//" paths for fragments targeting the root
   =20
dup_and_fixup_symbol_prop() rewrites a symbol value by replacing its
"/fragment/__overlay__" prefix with the fragment's target path. When
the fragment targets the root node the target path is "/" and the
result starts with "//", which __of_find_node_by_full_path() cannot
resolve.
   =20
Drop the target path when it is the root and the tail is non-empty. A
value naming the fragment root itself (empty tail) keeps the "/".

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 9b9f198a1d70a..89a9fe6d6e786 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -256,6 +256,9 @@ static struct property *dup_and_fixup_symbol_prop(
>  	if (!target_path)
>  		return NULL;
>  	target_path_len =3D strlen(target_path);
> +	/* a root target renders as "/"; drop it to avoid "//" results */
> +	if (target_path_len =3D=3D 1 && target_path[0] =3D=3D '/' && path_tail_=
len)
> +		target_path_len =3D 0;
> =20
>  	new_prop =3D kzalloc_obj(*new_prop);
>  	if (!new_prop)

[ ... ]

> @@ -804,13 +804,13 @@ static int init_overlay_changeset(struct overlay_ch=
angeset *ovcs,
>  	cnt =3D 0;
>  	for_each_child_of_node(ovcs->overlay_root, node) {
>  		overlay_node =3D of_get_child_by_name(node, "__overlay__");
>  		if (!overlay_node)
>  			continue;
> =20
>  		fragment =3D &fragments[cnt];
>  		fragment->overlay =3D overlay_node;
>  		fragment->target =3D find_target(node, target_base);
>  		if (!fragment->target) {
>  			of_node_put(fragment->overlay);
>  			ret =3D -EINVAL;
>  			of_node_put(node);
>  			goto err_out;
>  		}

[Severity: High]
This is a pre-existing issue, but does this jump to err_out leak device
node references if previous fragments were already successfully populated?

If a subsequent fragment's find_target() fails (e.g., due to an invalid tar=
get
path in the overlay), the function jumps to err_out without updating
ovcs->count.

Because ovcs->count remains 0, the cleanup function free_overlay_changeset()
will skip its loop and fail to call of_node_put() for the previously
successfully resolved fragment nodes.

Could ovcs->count be updated to cnt before jumping to err_out so that
free_overlay_changeset() can clean up the previously populated elements?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-nh-of-alia=
s-overlay-v6-0-74f21d440819@nexthop.ai?part=3D7
