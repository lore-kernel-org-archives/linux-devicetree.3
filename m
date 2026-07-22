Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B1444718;
	Wed, 22 Jul 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705761; cv=none; b=GLXzB1d8GnHYFUuorkcj70zxyBy2wV4cdPJSDPd9Ii4GEnrRR601Ay9tSxNqoQgS22g4TJuxa1CMIXT6/poMpw6jJQIfvdWIYhlZN67y3lfvZudVr8FmPW2IBkLZhavGva5/I7zeRCkt9HpQESBo3W8zJu9JxzAyu7JUFRv9phg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705761; c=relaxed/simple;
	bh=zHpgMBWcsHZFXm0qcNsJnognV8qmmXXd5x5uD8XiXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flSmLH3SoAzGD8GioYBiKfM3XKpZKjoDzNaX8PALfUsRqsswhJFdRq65BFvpda5Ktm9AYUH8wqMzbEUYbyH0yNwYCG23l9pr8uc5cwdOuVbxre+VPQETbAs2/lcKbdT75C1XO/BZCWWNEhicOWqlRSFpUqIL6jZWBioGrTm4Kgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vpegefgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vpegefgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F201F000E9;
	Wed, 22 Jul 2026 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705760;
	bh=5yzsPKyS46OJqka9Jg8kQrE4QHNoZoIqblZL6pnF1EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vpegefgkth/baFBFqbeT6MukOarPFqKB2Bl5YeY7GKXwex2xsBUgoKR8QCYoF6pzU
	 CKS629A14EZPMblespLeSaRP3Ho8UyfZjISfghsPpu5RVAMA0Mbo2f6c6MhGKsosiq
	 fx76ElxD2XulaiasG7DlAqSae3jqwvabOmyLcSFGWp0IkIVfIRECr18lpM65Yi6WIM
	 vSCnwNPJsOtDxG4WEvd4beP0r1G7G20XnZkRrJR9rpOrxw3DC0IkPu0BJYR3VPCNA0
	 2CmxxuVjUnYufkepCb6IjQrokN63TXI311G0TDkcK/+ZdLxgE0iWjKwUNuZXsZE2zw
	 Khk4TIS6FaMmA==
Date: Wed, 22 Jul 2026 09:35:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] of: incrementally update /aliases lookup on
 reconfig notifications
Message-ID: <20260722-light-modest-mosquito-cd4f0a@quoll>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-2-8ad097e31e36@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260721-nh-of-alias-overlay-v4-2-8ad097e31e36@nexthop.ai>

On Tue, Jul 21, 2026 at 06:01:47PM -0700, Abdurrahman Hussain wrote:
> /aliases entries added by a device-tree overlay are stored in the live
> tree but never enter the global aliases_lookup list that of_alias_scan()
> builds at boot. As a result, of_alias_get_id() returns -ENODEV for
> aliases declared inside overlays, and any driver that relies on
> alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
> pinned id and falls back to auto-assignment.
>=20
> Fix by registering an internal OF reconfig notifier that mirrors
> /aliases changes into aliases_lookup. Registration happens at
> core_initcall_sync time, safely after the boot-time of_alias_scan(),
> which runs pre-initcall from unflatten_device_tree() (or
> of_pdt_build_devicetree() on OF-real platforms):
>=20
>   OF_RECONFIG_ADD_PROPERTY    -> of_alias_create()
>   OF_RECONFIG_REMOVE_PROPERTY -> of_alias_destroy()
>   OF_RECONFIG_UPDATE_PROPERTY -> destroy + create
>   OF_RECONFIG_ATTACH_NODE     -> adopt the node as of_aliases
>   OF_RECONFIG_DETACH_NODE     -> drop every aliases_lookup entry
>=20
> The reconfig notifier chain fires from both direct changesets and
> overlay apply/revert, so the same code path covers runtime dt
> modifications and overlay-declared aliases without any overlay-
> specific hook in drivers/of/overlay.c. Grant Likely suggested this
> shape on Geert Uytterhoeven's 2015 RFC [1]; Geert's original hook was
> in dynamic.c directly.
>=20
> Match the /aliases target node structurally (exact name "aliases",
> parent =3D=3D root, via the shared of_node_is_aliases()) rather than by
> pointer against the of_aliases global. A system with no boot-time
> /aliases has of_aliases =3D=3D NULL, so an overlay that creates /aliases
> from scratch would otherwise be missed from the first ATTACH_NODE
> onward. The name compare is exact rather than of_node_name_eq():
> the latter ignores unit addresses and would also match a root node
> named "aliases@1", which neither path lookup nor the DT spec treats
> as the aliases node. ATTACH publishes the adopted node
> in of_aliases with a reference held; DETACH clears the pointer and
> drops that reference again. Both pointer updates happen under
> devtree_lock, pairing with the locked reader in
> of_find_node_opts_by_path() from the previous patch =E2=80=94 a reader ei=
ther
> observes NULL or takes its own reference before the notifier's put
> can be the last one. Dropping the reference at DETACH also keeps the
> node at refcount 1 by the time an overlay changeset that created
> /aliases is destroyed, which __of_changeset_entry_destroy() insists
> on before it lets the node be freed.
>=20
> Only per-property notifications populate aliases_lookup =E2=80=94
> the notifier does not walk the attached node's property list, which
> would race with devtree_lock-protected property mutations. A direct
> of_attach_node() caller that pre-populates /aliases is not tracked,
> matching pre-series behavior.
>=20
> DETACH_NODE conversely drops every aliases_lookup entry =E2=80=94 but only
> when the detached node is the tracked of_aliases. __of_attach_node()
> has no duplicate-name check, so a stray second root node named
> "aliases" can exist; detaching it must not wipe entries backed by the
> real node. Walking aliases_lookup itself (under aliases_mutex) avoids
> the same property-list race. Overlay revert additionally emits per-
> property REMOVE events beforehand; the sweep catches direct
> of_detach_node() callers that don't. The per-entry teardown is
> factored into __of_alias_del(), shared by the single-name destroy and
> the detach-time sweep.
>=20
> One ordering caveat is inherent to the notification architecture:
> within a single changeset, a device created by an earlier ATTACH
> entry can be probed by of_platform_notify() before a later /aliases
> ADD_PROPERTY entry reaches this notifier. Overlays that declare an
> alias for a node they also create should order the /aliases fragment
> first if the target bus is populated with a bound driver at apply
> time.
>=20
> The notifier machinery is built only for CONFIG_OF_DYNAMIC kernels:
> without it no reconfig notifications exist and
> of_reconfig_notifier_register() is a stub returning -EINVAL, so an
> unconditional registration would fail the initcall on every
> non-dynamic DT kernel.
>=20
> Factor the per-property loop body of of_alias_scan() into
> of_alias_create() so the boot-time scan and the runtime notifier
> share one code path. Owned (runtime) entries kstrdup the alias name
> so the alias_prop survives the property that spawned it =E2=80=94 required
> for the overlay revert path where the source property is freed. A
> one-bit @owned flag on struct alias_prop distinguishes kmalloc'd
> entries from memblock-backed ones so the destroy path kfree()s the
> right ones. Every entry, boot-time or runtime, holds the target-node
> reference that of_find_node_by_path() returned at create time;
> destroy drops it symmetrically.
>=20
> The destroy path unlinks matching entries regardless of ownership
> (freeing storage only for owned ones) so an overlay UPDATE against a
> boot-time alias leaves at most one entry per stem+id. This addresses
> the allocator-mismatch worry Grant flagged on the 2015 series [2] and
> the duplicate-mapping side effect that would otherwise leak through.
>=20
> Serialize aliases_lookup on a dedicated aliases_mutex: readers
> (of_alias_get_id, of_alias_get_highest_id, of_device_uevent) and the
> reconfig notifier hold it around every access. Boot-time
> of_alias_scan() runs single-threaded during init and stays lockless.
> This is preferable to piggy-backing on of_mutex because the reconfig
> notifier is called both under of_mutex (overlay apply path) and
> outside of it (direct of_add_property() path from dynamic.c), so a
> nested acquisition would deadlock on some callers.
>=20
> Validate the property value before feeding it to of_find_node_by_path():
> pp->value must be non-empty and null-terminated within pp->length. An
> overlay that hasn't been through /aliases fixup can otherwise present
> a fragment-internal string that isn't a valid live-tree path or a
> malformed non-terminated value, and of_find_node_by_path() derefs it
> as a C string =E2=80=94 an OOB read on the malformed case.
>=20
> The refactor also fixes a pre-existing one-byte out-of-bounds read in
> the stem parser: the old loop tested isdigit(*(end - 1)) before
> checking end > start, reading one byte before the property name when
> the name is empty or all digits. of_alias_create() checks the bound
> first and rejects a zero-length stem.
>=20
> Naming builds on Geert's original series:
>   - "of: Extract of_alias_create()"                     [3]
>   - "of: Add of_alias_destroy()"                        [4]
>   - "of/dynamic: Update list of aliases on aliases changes" [5]

This is not a contest who can ask AI to create the longest commit msg
ever.

You need to configure your LLM properly to Linux kernel coding style.

Best regards,
Krzysztof

