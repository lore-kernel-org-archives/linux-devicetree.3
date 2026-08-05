Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7FF47CA90
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962572; cv=none; b=pvuvx5q4fFq7Ei5lXnWdm/zy5UEnK5psOaYxw0r3TvrvLzGENOLJy8Z5dvaU+M624yZvyINDnIXXOyO5NKeZVOktlU/RVDk8RoQNWngDXNZydfdtvsuqHzumslEwU0Q0HR7RvFdyO2TiYnd6fRGuxR+ABrQXWC5Lk0fIQ+TMXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962572; c=relaxed/simple;
	bh=UXZ708xC+A/JaTs19c8OS74Hc/lxQT2XbGbcxP15ZBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jZ59faaTnuQ75fjFYDCVa3xNyQE6WQiRJB6XkJ07miWpO0TI+xQtdgGiwWXlX2MnCfVUZrpayzyBRvX21BSYqwMyg/9m1od1yFXzZyuueUwmlWpAvokABL5R6dNjbwKwYco+CwdUbCKY8mJqTO3yOm8eWkrf3KLtlR5OsbRB+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPT/c86d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPT/c86d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F85A1F000E9;
	Wed,  5 Aug 2026 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962565;
	bh=KNLMg1rk0VnwOCNJk9fcoAkPLWYEwv+L5MtK7/eXH/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DPT/c86dIj0lFv4LxZq3mXJzVZNV/kp5/feJSOb/fcvbO86GRPYgFEcvW5xcE0wwC
	 aRHRP3oDOd9v9UMuj6qysWDj5pr8juiokky/hB6Gc+OxCzz+LRK9hYnlAldhHScII5
	 zBan9Ti5nRWHgERlm28ASs3U/gTZCp8t5ga2t96h8grhnOkOnuq9M0fj/LnFMJnQ5v
	 ZsGsZbvccMzMK2AZGXMDKDdDb9zhZ7CbJQkhRaL/ZcsXBbZr8ZOh9RdkP4vJ3h2OiI
	 sZRqP9W6U7d92wMcJBSpqcIAyuIo+7fYlvzAnwYDkAA3HJr13mOAING9iBn8ChgJTd
	 wIJHQS/4wXjmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/10] of/overlay: only treat a positive changeset id
 as registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-nh-of-alias-overlay-v6-6-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-6-74f21d440819@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:42:44 +0000
Message-Id: <20260805204245.3F85A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but lockless travers=
al of a shared list `ovcs_list` in `of_overlay_remove_all()` leads to a dat=
a race and potential Use-After-Free.
--

--- Patch [6]: [PATCH v6 06/10] of/overlay: only treat a positive changeset=
 id as registered ---
commit ff7e3da3be86949a404438d74d2cffe93f4a4cba
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: only treat a positive changeset id as registered

of_overlay_fdt_apply() stores the idr_alloc() return value in
ovcs->id before checking it. On failure the stored id is negative,
free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
is called with a negative id and list_del() runs on ovcs->ovcs_list,
which is not initialized until after the id allocation. An allocation
failure at that point dereferences NULL.

Make free_overlay_changeset() treat only a strict-positive id as
registered. The rest of the function already copes with a
partially-initialized ovcs, so the error path stays a plain
goto err_free_ovcs.

Cc: stable@vger.kernel.org

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 284c9bc6c9cfc..9b9f198a1d70a 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_cha=
ngeset *ovcs)
>  	if (ovcs->cset.entries.next)
>  		of_changeset_destroy(&ovcs->cset);
> =20
> -	if (ovcs->id) {
> +	/* a failed idr_alloc() leaves its negative error in ovcs->id */
> +	if (ovcs->id > 0) {
>  		idr_remove(&ovcs_idr, ovcs->id);
>  		list_del(&ovcs->ovcs_list);

[Severity: High]
This problem wasn't introduced by this patch, but lockless traversal of a
shared list ovcs_list in of_overlay_remove_all() leads to a data race.

Is it safe to iterate ovcs_list without holding of_mutex?

drivers/of/overlay.c:of_overlay_remove_all() {
	...
	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
		ret =3D of_overlay_remove(&ovcs->id);
	...
}

The list_for_each_entry_safe_reverse() iterator only protects against
the deletion of the current entry being processed.

If another thread concurrently modifies the list (e.g., via
of_overlay_fdt_apply() or of_overlay_remove()), could this corrupt the
list pointers or remove the cached next entry, leading to a Use-After-Free?

>  		ovcs->id =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-nh-of-alia=
s-overlay-v6-0-74f21d440819@nexthop.ai?part=3D6
