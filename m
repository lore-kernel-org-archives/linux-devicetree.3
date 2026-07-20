Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD32137EFFB
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531864; cv=none; b=MheJkIFMiOIVO8pKSsB2kaMARWJcWNZmgqbRgSxxA8Va4nmvNctvqAl2I8VoXjnKw5SgMEoFud7D1CRUr4/Cl6Q1fyufKN/HuBg7HmL7TsVrLKDlZQZx0IXSw68PX2iJVr6vq761jxBCFH2Cp7jlQIr257W6G+48v9nh4ypdT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531864; c=relaxed/simple;
	bh=UZD8jbcGSljDtyJAaHHI1DGZMLnlegR6eoxt1KS/kbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6bFU7r1aMcyPqrCh2uqsnkSayc4IB+jL2oqXasJsRUFYWfyDF7J48JvdUORrH6svrd6ZtTeYgiLm2HNurApT40q+bz3XdKuZvjdSbGgKh5h/3DZlFqVL1zHLPKmdBDmqytv68IeCuEpJJyLuB8pFecBomYIhIK2rFsbj+kcS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLoNPdiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLoNPdiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3D11F00A3A;
	Mon, 20 Jul 2026 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784531862;
	bh=9PLtuwyPZBsOCZdWiaVjsi1bwTdLQVUN/hNi14h0Efc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLoNPdiElZG9jYsUxtpFRiQi2XH7oGBDMhlyYx1tKJEwNGi5UcojDSFi+qdw3D0VQ
	 i60X6MXn2hufxe+Z3vCAZiXZkew0p9M7Ix5k0MeUuYJLMc34yG/Q/hOpA9gG/8S/7K
	 wwMfuGkaa0Gf/y1TW8I03+UapndALFbODup9OtFt1H+M/8AZgHwuAmXyAj7XMcrmQh
	 FqYhczItfiQ5TqN9tb+daJFVWA7qoennlgKn2KVwJeQLYsC2JiXGAdx97C9m/ixD/7
	 bDulHb8T6jviA0BjPJBGQA0ChOyQE/hxuAvFKV/lfDJoVT++WrPDciec0/ZErSVplY
	 LdUw+QxpUnf9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-1-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-1-f1e5d9889b30@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:17:41 +0000
Message-Id: <20260720071742.3F3D11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [Critical] Unconditional dereference of `rd->old_prop` on OF_RECONFIG_UPD=
ATE_PROPERTY causes a NULL pointer panic.
- [Critical] OF_RECONFIG_DETACH_NODE fails to remove dynamically allocated =
aliases, leading to a Memory Leak and Use-After-Free.
- [High] Lockless modification of the global `aliases_lookup` list causes d=
ata races and memory corruption.
- [High] Updating a boot-time alias creates duplicate entries mapping to th=
e same ID, causing driver resource conflicts.
- [Medium] OF_RECONFIG_ATTACH_NODE fails to scan the node's properties, sil=
ently ignoring aliases added in a newly attached /aliases node.
- [Medium] The global `of_aliases` pointer mismanages node reference counti=
ng, causing leaks and weak references.
- [Low] The struct alias_prop::owned documentation contains factually incor=
rect and misleading claims regarding memory ownership.

Pre-existing issues:
- [Critical] Creating an alias from an empty property causes a NULL pointer=
 dereference in of_find_node_by_path().
- [High] The alias parsing loop contains a 1-byte out-of-bounds read if the=
 property name is an empty string.
--

--- Patch [1]: [PATCH RFC 1/4] of: incrementally update /aliases lookup on =
reconfig notifications ---
commit 172d1d81baebcd7bb4e961520fc11e6b4eadbc38
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: incrementally update /aliases lookup on reconfig notifications

This commit registers an OF reconfig notifier to mirror changes in the
/aliases node into the global aliases_lookup list. It extracts the alias
parsing logic into a common function and tracks whether entries are statica=
lly
or dynamically allocated. This ensures aliases defined in overlays are
correctly resolved by drivers.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+r=
enesas@glider.be/
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secret=
lab.ca/
Link: https://lore.kernel.org/lkml/1435675876-2159-2-git-send-email-geert+r=
enesas@glider.be/
Link: https://lore.kernel.org/lkml/1435675876-2159-3-git-send-email-geert+r=
enesas@glider.be/
Link: https://lore.kernel.org/lkml/1435675876-2159-4-git-send-email-geert+r=
enesas@glider.be/

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3f..d516523a71d5e 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

[ ... ]

> @@ -1915,6 +1915,152 @@ static void of_alias_add(struct alias_prop *ap, s=
truct device_node *np,
> +/*
> + * Build an alias_prop for @pp using @dt_alloc as the storage allocator
> + * and add it to aliases_lookup. @owned is stored on the entry so the
> + * matching destroy path knows whether the alias_prop is a kmalloc'd
> + * struct that must be kfree()d (with a paired of_node_put on the
> + * target) or a memblock/dt_alloc'd struct that must be left alone.
> + *
> + * Pseudo-properties (name, phandle, ...) and alias names not ending in
> + * a numeric id are silently skipped.
> + */
> +static void of_alias_create(const struct property *pp,
> +			    void *(*dt_alloc)(u64 size, u64 align),
> +			    bool owned)
> +{
> +	const char *start =3D pp->name;
> +	const char *end =3D start + strlen(start);
> +	struct device_node *np;
> +	struct alias_prop *ap;
> +	int id, len;
> +
> +	if (is_pseudo_property(pp->name))
> +		return;
> +
> +	np =3D of_find_node_by_path(pp->value);

[Severity: Critical]
This is a pre-existing issue, but does this cause a NULL pointer
dereference if the property is empty?

If an overlay or boot DT defines a property in /aliases with no value,
pp->value is NULL. Since of_alias_create() passes pp->value directly to
of_find_node_by_path(), which passes it to strchr(), will this crash?

> +	if (!np)
> +		return;
> +
> +	while (isdigit(*(end - 1)) && end > start)
> +		end--;

[Severity: High]
This isn't a bug introduced by this patch, but does the loop condition
cause an out-of-bounds read if the property name is an empty string?

If start is empty, end equals start. The loop evaluates isdigit(*(end - 1))
before verifying end > start, causing an immediate read of the memory byte
preceding the buffer.

> +	len =3D end - start;

[ ... ]

> +static void of_alias_destroy(const char *name)
> +{
> +	struct alias_prop *ap, *tmp;
> +
> +	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
> +		if (!ap->owned || strcmp(ap->alias, name) !=3D 0)
> +			continue;

[Severity: High]
If an overlay modifies the target of an existing boot-time alias, will
skipping the destruction of boot-time entries leave duplicate entries in
the list?

Since this skips entries where owned is false, the old boot-time alias
remains in aliases_lookup alongside the newly created overlay alias.
When of_alias_get_id() searches the list, could it return the same ID for
both devices?

> +		list_del(&ap->link);
> +		of_node_put(ap->np);
> +		kfree(ap);
> +		return;
> +	}
> +}

[ ... ]

> +static int of_aliases_reconfig_notifier(struct notifier_block *nb,
> +					unsigned long action, void *arg)
> +{
> +	struct of_reconfig_data *rd =3D arg;
> +
> +	/*
> +	 * Match /aliases structurally (name + root-parent) rather than by
> +	 * pointer against the of_aliases global =E2=80=94 a system with no
> +	 * boot-time /aliases (of_aliases =3D=3D NULL) can still acquire one
> +	 * from an overlay, and we must track its properties from the
> +	 * first ATTACH_NODE onward.
> +	 */
> +	if (!rd->dn || !rd->dn->parent ||
> +	    !of_node_is_root(rd->dn->parent) ||
> +	    !of_node_name_eq(rd->dn, "aliases"))
> +		return NOTIFY_DONE;
> +
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		if (!of_aliases)
> +			of_aliases =3D rd->dn;

[Severity: Medium]
Does assigning of_aliases here create a weak reference?

During boot-time scanning, of_alias_scan() acquires of_aliases with an
incremented reference count. Here, it is assigned without calling
of_node_get().

[Severity: Medium]
Also, if the system started without a boot-time /aliases node, does
attaching one fail to parse its properties?

Since this handler updates the of_aliases pointer but misses the
for_each_property_of_node() loop to actually create the aliases, it seems
the aliases in a newly attached node are silently ignored.

> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		if (of_aliases =3D=3D rd->dn)
> +			of_aliases =3D NULL;

[Severity: Medium]
Does clearing the pointer here cause a reference leak since of_node_put()
is omitted?

[Severity: Critical]
Additionally, does skipping the removal of the dynamic aliases cause a
memory leak and use-after-free?

The DETACH_NODE handler clears the of_aliases pointer but skips removing
the corresponding alias_prop entries from aliases_lookup. When the detached
node and its properties are later freed, dangling entries will remain in
the global list. A subsequent alias update could iterate the list and call
strcmp() on freed pointer strings.

> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		of_alias_create(rd->prop, alias_alloc, true);

[Severity: High]
Is it safe to modify aliases_lookup locklessly here?

The notifier processes dynamic changes and calls into of_alias_create()
which uses list_add_tail() on the global aliases_lookup list. OF reconfig
notifiers are intentionally executed after of_mutex has been unlocked, such
as in __of_changeset_apply_notify().

Could this race against other writers, or against driver probes calling
of_alias_get_id() which iterates the list expecting it to be protected by
of_mutex?

> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		of_alias_destroy(rd->prop->name);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		of_alias_destroy(rd->old_prop->name);

[Severity: Critical]
Can rd->old_prop be NULL here?

The of_update_property() API allows adding a property if it does not
already exist, and emits an OF_RECONFIG_UPDATE_PROPERTY event with
old_prop set to NULL. Would unconditionally dereferencing
rd->old_prop->name cause a panic in this scenario?

> +		of_alias_create(rd->prop, alias_alloc, true);
> +		break;
> +	default:
> +		break;
> +	}
> +	return NOTIFY_OK;
> +}

[ ... ]

> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 0ae16da066e2c..9d16765ae2c3f 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -17,6 +17,12 @@
>   * @alias:	Alias property name
>   * @np:		Pointer to device_node that the alias stands for
>   * @id:		Index value from end of alias name
> + * @owned:	True if @alias was kstrdup'd and @np was of_node_get'd on
> + *		insertion (overlay-time entries). False for entries built
> + *		by of_alias_scan() at boot, where @alias points into the
> + *		FDT and @np is an unreferenced pointer. The removal path
> + *		uses this flag to decide whether it must kfree(@alias),
> + *		of_node_put(@np), and kfree(the struct itself).

[Severity: Low]
Does this documentation accurately reflect the implementation?

The comment claims @alias is kstrdup'd on insertion and kfree'd on
removal. However, the code merely stores the pp->name pointer directly
and never calls kfree() on the alias string. It also mentions np is
unreferenced at boot time, but of_find_node_by_path() does take a
reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-f1e5d9889b30@nexthop.ai?part=3D1
