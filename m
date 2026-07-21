Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A60400981
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603084; cv=none; b=nH/ynt/rwM5nw+UnTl8VPWl2kQd8RGm/ho3iIbfy1Na+SV8kQD4OAdfH9ECfot9UoSHwRWjcvZhSc/j7SHKvlM0MSG8+PvQ0Wej9A50qudqzz2uikwFDBwXJZm5nwEn/RANcWyRI+d+Clc6OVMy3Zwn1SfmtN1A5M4g9tTvAyHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603084; c=relaxed/simple;
	bh=PZD1jXXj8xhbtpZ1FSTJ1lxCoG9qKLtN0QbemyAVFks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PtxqEJqysSuUb+A2kgB1TUX2s6eu/r0gj/uVbZFZGhOPXapOlJhyE1jx8ME5Qd2dFoJrTDrQe6qV0mJnP9KD/oDflewrrf9VkPqvLFNK/PgAFo7B0zLdEvuLPg5xXR75vRq/fY4UJNCr3Ik+kqQ3QdNwp9o9YMsFY/enDuMAA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp/4zrIF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp/4zrIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F2B1F000E9;
	Tue, 21 Jul 2026 03:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784603081;
	bh=ljWBNXClkZz9wyWElwdmidwX5szazJKeJS/Ojf+pmww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jp/4zrIFifR4jVNFIleaZqKe68EQbCCnru0UwU+wmN0mL944X17X3IEY+edEgFNxa
	 XYQv9ewfrCvON9a+ikT38NDmSJkjznPcsdiGCmAVRN1SW3N+iNW2T7rMDULtsOBgCV
	 LDb9uLCdAUKms5/wFRpJj2ZvOR/fbpURPMQIk9Cb1jjgl0Nq6fr8QaLwLpHDvuWCOr
	 1uu629Bl6M1hl+xHbjH6aHZdxcAL/TPwJVRvPqpWiFCusDfaqSCNwDrHsXoH/ySkN4
	 dwvdQ/KYoR4luoxDgFK0xTxmZ0KNm8lsgiw6RXne8764UfwBwSHhwhvecpOsVhcyUL
	 KOsW8jGAMS1xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-1-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-1-27da6848dd84@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 03:04:40 +0000
Message-Id: <20260721030441.68F2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Data race and possible list corruption because `of_device_uevent()=
` iterates over `aliases_lookup` while holding `of_mutex` instead of the ne=
wly introduced `aliases_mutex`.
- [High] Lockless iteration of `aliases->properties` in `of_alias_node_scan=
()` and `of_alias_node_forget()` can race with concurrent property updates.
- [Medium] Missing `of_node_put()` leaks target device node references on e=
rror paths in `of_alias_create()` and during overlay updates of boot-time a=
liases in `of_alias_destroy()`.
--

--- Patch [1]: [PATCH RFC 1/4] of: incrementally update /aliases lookup on =
reconfig notifications ---
commit 0e641f78493b9291f518b7ebe305e2c1cbac0e2b
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: incrementally update /aliases lookup on reconfig notifications
   =20
/aliases entries added by a device-tree overlay are stored in the live
tree but never enter the global aliases_lookup list that of_alias_scan()
builds at boot. As a result, of_alias_get_id() returns -ENODEV for
aliases declared inside overlays, and any driver that relies on
alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
pinned id and falls back to auto-assignment.

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
> index 6e7a42dedad3f..2695c5f8bb93a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1915,6 +1915,231 @@ static void of_alias_add(struct alias_prop *ap, s=
truct device_node *np,
>  		 ap->alias, ap->stem, ap->id, np);
>  }
> =20
> +/*
> + * Serializes aliases_lookup and of_aliases across boot-time scan,
> + * runtime notifier updates, and readers. of_alias_get_id() and
> + * of_alias_get_highest_id() acquire this before walking the list; the
> + * OF reconfig notifier below acquires it around each mutation.
> + * of_alias_scan() runs single-threaded from of_core_init() and skips
> + * the lock, but any code path that reads or writes aliases_lookup
> + * outside init must hold it.
> + */
> +static DEFINE_MUTEX(aliases_mutex);

[Severity: High]
Does this new mutex also need to be acquired in of_device_uevent()?

Looking at of_device_uevent() in drivers/of/device.c, it still iterates ove=
r=20
aliases_lookup using of_mutex:

drivers/of/device.c:of_device_uevent() {
    ...
	mutex_lock(&of_mutex);
	list_for_each_entry(app, &aliases_lookup, link) {
		if (dev->of_node =3D=3D app->np) {
    ...
	}
	mutex_unlock(&of_mutex);
}

Since of_aliases_reconfig_notifier() modifies the list while holding only=20
aliases_mutex, could this result in concurrent modification and list corrup=
tion=20
if a uevent is triggered during an overlay update?

[ ... ]

> +	if (kstrtoint(end, 10, &id) < 0)
> +		goto out_put;
> +
> +	ap =3D dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
> +	if (!ap)
> +		goto out_put;
> +	memset(ap, 0, sizeof(*ap) + len + 1);
> +
> +	/*
> +	 * For runtime entries, kstrdup the alias name so the alias_prop
> +	 * doesn't depend on pp->name remaining valid =E2=80=94 an overlay reve=
rt
> +	 * frees the source property. Boot-time entries point into the
> +	 * FDT, which is never freed.
> +	 */
> +	if (owned) {
> +		dup =3D kstrdup(pp->name, GFP_KERNEL);
> +		if (!dup) {
> +			kfree(ap);
> +			goto out_put;
> +		}
> +	} else {
> +		dup =3D start;
> +	}
> +	ap->alias =3D dup;
> +	ap->owned =3D owned;
> +	of_alias_add(ap, np, id, start, len);
> +	return;
> +
> +out_put:
> +	if (owned)
> +		of_node_put(np);
> +}

[Severity: Medium]
Does this leak the device node reference for boot-time aliases on error?

When of_find_node_by_path() is called earlier in this function, it acquires=
 a=20
reference to the returned node regardless of whether the alias is owned or =
not.
If an error occurs (like kstrtoint() or dt_alloc() failing) for a boot-time=
=20
alias where owned is false, the out_put label is reached but of_node_put(np=
)=20
is skipped, leaking the reference.

> +/*
> + * Reverse of of_alias_create() for owned entries: unlink and free the
> + * matching alias_prop and drop the reference it holds on the target
> + * node. For boot-time entries (owned=3Dfalse) it unlinks only =E2=80=94=
 the
> + * struct and the alias name live in memblock and are never freed =E2=80=
=94
> + * which prevents an overlay-driven UPDATE_PROPERTY against a boot-time
> + * alias from leaving stale duplicates in aliases_lookup.
> + *
> + * Callers must hold @aliases_mutex.
> + */
> +static void of_alias_destroy(const char *name)
> +{
> +	struct alias_prop *ap, *tmp;
> +
> +	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
> +		if (strcmp(ap->alias, name) !=3D 0)
> +			continue;
> +		list_del(&ap->link);
> +		if (ap->owned) {
> +			of_node_put(ap->np);
> +			kfree(ap->alias);
> +			kfree(ap);
> +		}
> +		return;
> +	}
> +}

[Severity: Medium]
Does this also leak the device node reference if a boot-time alias is updat=
ed
or removed?

If an overlay updates a boot-time alias (where ap->owned is false), the ali=
as=20
is unlinked from the list, but of_node_put(ap->np) is skipped. Since the=20
reference was acquired at boot time by of_find_node_by_path(), doesn't it=20
need to be released when the alias is destroyed?

> +static void *alias_alloc(u64 size, u64 align)
> +{
> +	return kzalloc(size, GFP_KERNEL);
> +}
> +
> +/* Scan every property of @aliases and mirror it into aliases_lookup. */
> +static void of_alias_node_scan(struct device_node *aliases)
> +{
> +	struct property *pp;
> +
> +	for_each_property_of_node(aliases, pp)
> +		of_alias_create(pp, alias_alloc, true);
> +}
> +
> +/* Reverse: destroy every alias_prop backed by a property of @aliases. */
> +static void of_alias_node_forget(struct device_node *aliases)
> +{
> +	struct property *pp;
> +
> +	for_each_property_of_node(aliases, pp)
> +		of_alias_destroy(pp->name);
> +}

[Severity: High]
Is it safe to iterate aliases->properties without holding devtree_lock?

These functions use for_each_property_of_node() to traverse the properties =
list=20
locklessly. Since of_aliases_reconfig_notifier() is called for ATTACH_NODE=
=20
and DETACH_NODE events, could a concurrent thread adding or removing proper=
ties=20
on the aliases node mutate the linked list under devtree_lock, causing a=20
race condition or traversing stale pointers here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-27da6848dd84@nexthop.ai?part=3D1
