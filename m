Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704223BED55
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376197; cv=none; b=Irv3/o2bF7uSENuHA16E/bM2+5KeW4HWGMsIo449Wpgqw0ZyMwHXuHomSmxr3g15rBd3Umafrrb7GAQLUOr925uuUcTfAdrXs89+9JxlmmX3ONqe4WajR17aroiQyQfX6AOtP3lpi7o/vey4O69i+sKnKfNxv4QdToa5OtVt0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376197; c=relaxed/simple;
	bh=TRJjLHtCsToVd/QCNMxQHbYB/WrztedBDXxNeI7F9xU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XKpOZd8WLCdXkSWCEaptoA78fmNvT+5303qs0i6A8XrkfUgGW7BS9OBprVSb/qNUqsSsZia5Fwki1HmfK7LEQV7KegYwsil+HMB8rZu2v3Bhtjx5D9bSRBPnZPZdXMto5HFSCXcHqRWnyviZbAi8uGSSiWrpJPZluE6RR/v0jgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWT63DcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWT63DcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61331F000E9;
	Mon, 10 Aug 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376196;
	bh=ywTqWnGkBqubfedqdTjVX/LIapym0F6hzKGgsb5cRRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWT63DcSIOAlZR6udCiPwI963h84jMHNfI370N7HoDvxrmqUhJz+76Ga6HoJ2r8wh
	 VpDk/lGaa0D4GyDoV3Gs41fFE9BoGWafV48oVg6mwRBHxpLNgxvyFU4aHBBCWuACHx
	 os+ECMW0imnzcoyVGZjpDwSzRE+AFOlFv+3VnWDImVQYdv+/6JPHrSUl9Pm4lwW8Sc
	 4xLaVK+Do2Zl5o+1o10IQxvY2HAwk6R5ElVShC+VwsohfsyiG02TQU/mrHZCrpGsju
	 lDGI8vGN27rZ3ScDa8nafyvyVcGLqXxVIEsgCYsW6z4LxSY1UuDn6lMPfS4opC9sLN
	 GO3SuY9w+QfYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/14] hwtracing: gtrace: Initial implementation of
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810152223.3946743-3-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-3-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:36:35 +0000
Message-Id: <20260810153635.D61331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Use-After-Free due to missing cleanup of upstream connections upon=
 component unregistration.
- [High] Topology validation failure and missing `dest_comp` assignment lea=
d to registration rejection and NULL pointer dereferences.
- [High] Exported lookup APIs return unreferenced device pointers, causing =
Use-After-Free risks.
- [High] Unbalanced refcounts and memory leak when multiple components bind=
 to the same CPU.
- [High] Strict probe order dependency silently breaks topology building.
- [High] Infinite recursion during graph traversal leads to kernel stack ov=
erflow.
- [High] ID matching logic ignores version comparisons and terminates prema=
turely.
- [High] Unconditional NULL pointer dereference if driver lacks `id_table`.
- [Medium] Deadlock risk by holding subsystem mutex during device_register.
--

--- Patch [2]: [PATCH v5 02/14] hwtracing: gtrace: Initial implementation o=
f gtrace framework ---
commit 9dea7b9c99e06842582e974d2b7070319605798a
Author: Anup Patel <anup.patel@oss.qualcomm.com>

hwtracing: gtrace: Initial implementation of gtrace framework

This patch introduces a generic hardware trace framework (gtrace). It provi=
des
a bus and topology management helpers for trace components to interact acro=
ss
different architectures.

> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c

[ ... ]

> +const struct gtrace_component_id *gtrace_match_id(struct gtrace_componen=
t *comp,
> +                                               const struct gtrace_compo=
nent_id *ids)
> +{
> +     const struct gtrace_component_id *id;
> +
> +     for (id =3D ids; id->version; id++) {
> +             if (comp->id.type !=3D id->type)
> +                     continue;
> +
> +             return id;
> +     }
> +
> +     return NULL;
> +}

[Severity: High]
Does this loop use the version field as a termination sentinel instead of
evaluating it? If a driver defines a component with version 0, it appears
the loop will terminate prematurely.=20

Also, it looks like a version comparison against comp->id.version is missin=
g=20
entirely, which might cause it to match any version of a given type.

[ ... ]

> +static int gtrace_match_device(struct device *dev, const struct device_d=
river *drv)
> +{
> +     const struct gtrace_driver *gtdrv =3D to_gtrace_driver(drv);
> +     struct gtrace_component *comp =3D to_gtrace_component(dev);
> +
> +     return gtrace_match_id(comp, gtdrv->id_table) ? 1 : 0;
> +}

[Severity: High]
If a driver is registered on this bus without an id_table (for example, mat=
ching
solely by ACPI or OF tables), will passing a NULL id_table here lead to a
NULL pointer dereference when gtrace_match_id() evaluates its loop conditio=
n?

[ ... ]

> +struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwn=
ode)
> +{
> +     struct gtrace_fwnode_match_data d =3D { .fwnode =3D fwnode, .match =
=3D NULL };
> +     int ret;
> +
> +     ret =3D bus_for_each_dev(&gtrace_bustype, NULL, &d, gtrace_match_fw=
node);
> +     if (ret < 0)
> +             return ERR_PTR(ret);
> +
> +     return d.match;
> +}

[Severity: High]
Since bus_for_each_dev() drops its temporary reference upon returning, does
returning d.match directly leave the caller with an unreferenced raw pointe=
r?
Could this lead to a use-after-free if the component is unregistered
concurrently?

[ ... ]

> +struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
> +{
> +     if (!cpu_present(cpu))
> +             return NULL;
> +
> +     return per_cpu(gtrace_cpu_source_comp, cpu);
> +}

[Severity: High]
Similar to the fwnode lookup above, should this function return a referenced
device pointer? Exposing the unreferenced component might cause a
use-after-free if the component is suddenly unregistered by another thread.

[ ... ]

> +static int gtrace_setup_inconn(struct device *dev, void *data)
> +{
> +     struct gtrace_component *comp =3D to_gtrace_component(dev);
> +     struct gtrace_platform_data *pdata =3D comp->pdata;
> +     struct gtrace_connection *conn =3D data;
> +     int i;
> +
> +     if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
> +             for (i =3D 0; i < pdata->nr_inconns; i++) {
> +                     if (pdata->inconns[i])
> +                             continue;
> +                     pdata->inconns[i] =3D conn;
> +                     return 1;
> +             }
> +     }

[Severity: High]
While this properly links the connection into the destination's inconns arr=
ay,
should it also assign conn->dest_comp =3D comp? If conn->dest_comp remains
unassigned (NULL), won't later graph traversals encounter a NULL pointer
dereference?

[ ... ]

> +static int gtrace_setup_inconns_from_outconns(struct gtrace_component *c=
omp)
> +{
> +     struct gtrace_platform_data *pdata =3D comp->pdata;
> +     struct gtrace_connection *conn;
> +     int i, ret;
> +
> +     lockdep_assert_held(&gtrace_mutex);
> +
> +     for (i =3D 0; i < pdata->nr_outconns; i++) {
> +             conn =3D pdata->outconns[i];
> +             ret =3D bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrac=
e_setup_inconn);
> +             if (ret < 0) {
> +                     gtrace_cleanup_inconns_from_outconns(comp);
> +                     return ret;
> +             }
> +     }

[Severity: High]
If a destination component has not probed yet, bus_for_each_dev() will retu=
rn 0.
Will treating 0 as a success leave this connection permanently incomplete,
since the framework does not appear to re-evaluate bidirectional matches or
request probe deferrals?

[ ... ]

> +struct gtrace_component *gtrace_register_component(struct gtrace_compone=
nt_id *id,
> +                                                const char *name,
> +                                                struct gtrace_platform_d=
ata *pdata)
> +{
> +     struct gtrace_connection *conn;
> +     struct gtrace_component *comp;
> +     int i, ret =3D 0;
> +
> +     if (!id || id->type >=3D GTRACE_COMPONENT_TYPE_MAX) {
> +             ret =3D -EINVAL;
> +             goto err_out;
> +     }
> +
> +     if (!pdata || !pdata->dev) {
> +             ret =3D -EINVAL;
> +             goto err_out;
> +     }
> +
> +     for (i =3D 0; i < pdata->nr_inconns; i++) {
> +             if (pdata->inconns[i]) {
> +                     ret =3D -EINVAL;
> +                     goto err_out;
> +             }
> +     }
> +
> +     for (i =3D 0; i < pdata->nr_outconns; i++) {
> +             conn =3D pdata->outconns[i];
> +             if (!conn || conn->src_port < 0 || conn->src_comp ||
> +                 !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
> +                 conn->dest_port < 0 || !conn->dest_fwnode || !conn->des=
t_comp) {
> +                     ret =3D -EINVAL;
> +                     goto err_out;
> +             }
> +     }

[Severity: High]
During component registration, won't the !conn->dest_comp check always fail
here since the dynamic discovery hasn't had a chance to run yet? This appea=
rs
to reject registration for any component that has output connections.

[ ... ]

> +     mutex_lock(&gtrace_mutex);
> +
> +     ret =3D device_register(&comp->dev);

[Severity: Medium]
Calling device_register() triggers a synchronous driver probe. If the drive=
r's
probe routine calls back into an exported framework API that also attempts =
to
acquire gtrace_mutex, could this result in a deadlock?

[ ... ]

> +     if (comp->pdata->bound_cpu >=3D 0) {
> +             gtrace_get_component(comp);
> +             per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) =3D=
 comp;
> +     }

[Severity: High]
If multiple components bind to the same CPU, does blindly overwriting this
per-CPU pointer without releasing the previously bound component lead to a
memory leak?

[ ... ]

> +void gtrace_unregister_component(struct gtrace_component *comp)
> +{
> +     struct gtrace_component *c;
> +
> +     mutex_lock(&gtrace_mutex);
> +
> +     if (comp->pdata->bound_cpu >=3D 0) {
> +             c =3D per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cp=
u);
> +             per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) =3D=
 NULL;
> +             gtrace_put_component(c);
> +     }

[Severity: High]
If an old component's CPU slot was overwritten by a newer component (leaking
the original reference as mentioned above), could putting the current occup=
ant
here cause us to prematurely free the newer component?

> +
> +     gtrace_cleanup_inconns_from_outconns(comp);
> +     device_unregister(&comp->dev);

[Severity: High]
This cleans up downstream outconns, but what about upstream components that
connect to this component? If upstream nodes retain dangling pointers to th=
is
freed component, could it cause a use-after-free during graph traversal?

One additional question regarding graph traversals: when recursively walkin=
g the
graph topology across connections, it doesn't appear that visited nodes are
tracked. If hardware topology tables are misconfigured with a cycle
(e.g., A -> B -> A), could this trigger infinite recursion and overflow the
kernel stack?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D2
