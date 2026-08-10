Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D42F28EA
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376052; cv=none; b=btBKMI74uw0hscuVRZ0q/MJBk8ze9Y9nK+nq5SUB7In3//GL8B4M1AUer4E0wxqbuZhaPd0B6HrmBXGp8YL98KGJvYF0oXUfFaoTeJanMMrAFp2XaDZ0GAJIHFkVGr6+7IEq2Vma+EBSkLqkGDYrnqkWeJhu2e3AxOcFH+yBkdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376052; c=relaxed/simple;
	bh=3F8m2Gzfo/h3m/XTCp6KlDy7W2A50yK3UOYiU+qbAhE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JYhK1v9nj7DJ9qR55u2ZdeqW6gLCGjmDl0bTGoiAbwtsBkNtn0hS366NXq7oywFZXJtBsbPMZzQ/5vs1jIhWlSXkgC3QqMtt0Or9DW4e8igsLTO72AsAaulEZUmDflJ2q9CZH4ZeOefWbwnkyPsuIFSV6ZLqw4VZl+rsO5Sd36g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOb0xn3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOb0xn3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2CC1F000E9;
	Mon, 10 Aug 2026 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376050;
	bh=NLlpP2wCeOmRTxoGa7DR+/yLIhmieHOiJAGfMT54FGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOb0xn3JVCjrNxIY/nMLLG/lmBFdKMwUwQKm79sTwe59GnVjwKMpFAfX5b0gYlgcs
	 ztmXqgENM/CoZhsP/ob2HTVraSkmPEJ70kSzN/Yad3zl/llbw1HkqkRWIcl0NDts7g
	 /+1lBGSvjV4tE0EeXQHYUFS5AUg9iMyOn4otViJW5tkr3EIVyLKWE8vSFCTyEs7EHD
	 9hnEbdMjgTJxKhNrf97pQ5XFowyqiL5kS6bxl18TLE7g8M0+YG/SLUGO2vQUXAaEab
	 RuWErFH6wo9xwsZ7xDaGDedD06Hse6J+ZdZL4vNwd+fWClYlZ7AaFAP9QFgCkEILfZ
	 1xZS1qWGTE0BA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/14] gtrace: Add functions to create/destroy a
 trace component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810152223.3946743-5-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-5-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:34:09 +0000
Message-Id: <20260810153410.4C2CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Asymmetric trace ID lifecycle causes `put_trace_id` to be called o=
n components that did not allocate an ID.
- [High] `gtrace_create_path` returns a path object with an empty component=
 list when the sink is unreachable, leading to out-of-bounds pointer derefe=
rences.
- [High] Missing NULL checks on component driver pointers (`gtdrv`) leads t=
o NULL pointer dereferences.
- [High] Recursive graph traversal crashes on unresolved output connections=
 where the destination component is NULL.
- [High] Unbounded recursive depth-first search (DFS) graph traversal lacks=
 cycle detection, leading to kernel stack overflow.
- [High] Lockless pointer return in `gtrace_cpu_source` leads to a Use-Afte=
r-Free.
--

--- Patch [4]: [PATCH v5 04/14] gtrace: Add functions to create/destroy a t=
race component path ---
commit a8e1889600bd5a16b5c7f9f06b462a376b8f943f
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add functions to create/destroy a trace component path
   =20
Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -210,6 +210,53 @@ int gtrace_reset_component(struct gtrace_component *=
comp)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_reset_component);
> =20
> +static int __gtrace_walk_output_components(struct gtrace_component *comp,
> +					   bool *stop, void *priv,
> +					   int (*fn)(struct gtrace_component *comp, bool *stop,
> +						     struct gtrace_connection *stop_conn,
> +						     void *priv))
> +{
> +	struct gtrace_connection *conn, *stop_conn =3D NULL;
> +	struct gtrace_platform_data *pdata =3D comp->pdata;

[Severity: High]
Does this crash if comp is NULL?

If a destination component is missing or unregistered, conn->dest_comp will=
 be
NULL. When the recursive call is made, comp->pdata is evaluated immediately
without verifying comp, which would cause a NULL pointer dereference.

> +	int i, ret;
> +
> +	for (i =3D 0; i < pdata->nr_outconns; i++) {
> +		conn =3D pdata->outconns[i];
> +		ret =3D __gtrace_walk_output_components(conn->dest_comp, stop, priv, f=
n);

[Severity: High]
Is there any cycle detection in this graph traversal?

If a misconfigured Device Tree provides a cyclical graph layout
(e.g., A -> B -> A), wouldn't this DFS recurse indefinitely and exhaust the
kernel stack?

[ ... ]

>  struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
>  {
>  	if (!cpu_present(cpu))
>  		return NULL;
> =20
>  	return per_cpu(gtrace_cpu_source_comp, cpu);
>  }

[Severity: High]
Is it safe to return this pointer without taking a reference?

If a caller obtains the component pointer while gtrace_unregister_component=
()
is invoked concurrently, the entry could be cleared and the component freed.
This would leave the caller with a dangling pointer.

Should this use gtrace_get_component() or RCU read locks before returning?

[ ... ]

> +struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
> +{
> +	struct gtrace_path_node *node;
> +
> +	node =3D list_first_entry(&path->comp_list, struct gtrace_path_node, he=
ad);
> +	return node->comp;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_path_source);

[Severity: High]
Does list_first_entry() resolve to an invalid offset if the list is empty?

If gtrace_create_path() successfully returns a path with an empty list,
calling gtrace_path_source() maps the pointer over the list head itself,
causing node->comp to read garbage memory.

[ ... ]

> +static int gtrace_assign_trace_id(struct gtrace_path *path)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +	int trace_id;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +
> +		if (!gtdrv->get_trace_id)

[Severity: High]
What happens if the component device lacks a bound driver?

The to_gtrace_driver() macro handles NULL inputs by returning NULL. If gtdrv
is NULL, evaluating !gtdrv->get_trace_id will dereference a NULL pointer.

> +			continue;
> +
> +		trace_id =3D gtdrv->get_trace_id(comp, path->mode);
> +		if (trace_id > 0) {
> +			path->trace_id =3D trace_id;
> +			return 0;

[Severity: High]
This function stops and returns at the first component that successfully
allocates a trace ID.

[ ... ]

> +static void gtrace_unassign_trace_id(struct gtrace_path *path)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +
> +		if (!gtdrv->put_trace_id)
> +			continue;
> +
> +		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
> +	}
> +}

[Severity: High]
Since gtrace_assign_trace_id() only allocates an ID from the first capable
component, wouldn't this loop unconditionally call put_trace_id() for every
component in the path?

This could ask components to free a trace ID they never allocated,
potentially corrupting their allocation bitmaps or driver state.

[ ... ]

> +struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
> +				       struct gtrace_component *sink,
> +				       enum gtrace_component_mode mode)
> +{
> +	struct build_path_walk_priv priv;
> +	struct gtrace_path *path;
> +	int ret =3D 0;
> +
> +	if (!source || mode >=3D GTRACE_COMPONENT_MODE_MAX) {
> +		ret =3D -EINVAL;
> +		goto err_out;
> +	}
> +
> +	path =3D kzalloc(sizeof(*path), GFP_KERNEL);
> +	if (!path) {
> +		ret =3D -ENOMEM;
> +		goto err_out;
> +	}
> +	INIT_LIST_HEAD(&path->comp_list);
> +	path->mode =3D mode;
> +	path->trace_id =3D GTRACE_INVALID_TRACE_ID;
> +
> +	priv.path =3D path;
> +	priv.sink =3D sink;
> +	ret =3D gtrace_walk_output_components(source, &priv, build_path_walk_fn=
);
> +	if (ret < 0)
> +		goto err_release_path_nodes;

[Severity: High]
If the destination sink is unreachable, gtrace_walk_output_components()
completes without adding any nodes to path->comp_list and returns 0.

Since gtrace_path_ready() and gtrace_assign_trace_id() will vacuously pass
for an empty list, won't this return a successful path object with an empty
component list?

This leads to the invalid list head dereferences mentioned earlier in
gtrace_path_source() and gtrace_path_sink().

> +
> +	if (!gtrace_path_ready(path)) {
> +		ret =3D -EOPNOTSUPP;
> +		goto err_release_path_nodes;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D4
