Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687657;
	b=s/xybsXDZn6QDU/6czhR4P7hfg4lWRg7b0QgUaWzfWgSGccZw7x8FGTiS615WOWYvRX6
	 4LnB6NzH6GyicOi6LnHW07zgNdxPqbDYq53k5WbhNwxDAFRycMVu3wptlsSMxUiCsUtLK
	 v/UioRt4BRYZmHslnY68H62CQKQnsbZeBWAMZWL9DcBdCdXEh8NEy0v6ukIfaOvtP5wly
	 pmSd+TOLugOfQGah6YYaMqfJf9K2/Li2DgTz1pKtChiESpvuKdhTgt3BGQ5JiKI36JlZi
	 fRMmmrsWhgjlbPAjNovFBec31pOEatBppvKBwhra30x0cI6obvmiGc1LlMYEa4v8jmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687657;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oAs+gRj6Zbso5PXK+Lo4dvb+7fLv8CNNi28OdgBHI1c=;
	b=nKU/LT7vrZJcmotydv080gD3n9IT7oM8CzWzX7QHsGoGnzUEE8T3zcv/V1PsC2wz+cYK
	 cfAkY6Y2nCvd8mELzKmeNa+ePVB8HKmvuL779wz9P4axc1e3jQwbhNGI4Wtot8cH5qnZM
	 lLEYLoiIPhPt73X/ImIMxMTzgKNx5PVsMurvrVQltFafT4T7JYxubyqEwA12Mk72DZM6c
	 KGvc4noJBbKE19+TfN7Lm2clbfWdWsXwFJjrmF5eNOI+dcsmKlHVo1hphk333gHyyNrUu
	 UUyhAv2SEOA3LrrIfFeveMzfy/t6xnw/64PyN0ASqF4FihdzBvIROJtmsud9qWJUrKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6adipTs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9FD606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6adipTs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E1E1F000C6;
	Thu, 26 Nov 2026 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687656;
	bh=oAs+gRj6Zbso5PXK+Lo4dvb+7fLv8CNNi28OdgBHI1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q6adipTsTHeLWl2+wzk+w6QRxfRvB8npPmCti+G+ZqKwWi0OSxCIi/D167nFoD7tm
	 ZYm4xMoycxs1i5zI/nGlzPFY4Gwn8YKAcbYlblKLnTXEHiJ9iAQZ2B9ETUBWW/AnFr
	 qEiQnNcVNa2ORq2SkkZ3XNnXIdAsqwFG0e15wZsxVP9OYLipzs/gnRc66T1htnrgaU
	 qJ/cJWLWiGPUG+gBeCPXIaOi2cGhgkvNINYRofslZbgduV+2+4h0DKvtPdOKsvWc5c
	 PhrpTKyFBaVguCjZTbvGJIP5T2dxgs1Yv/dGPbN6KUZacVa1J5sjxgngVbGEOoMxq8
	 inpVK/EkEJMfA==
Message-ID: <sashiko-outbox-235241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/14] gtrace: Add functions to create/destroy a
 trace component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7647f6d7e4435523423e5e392131f102da8ca56d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <7647f6d7e4435523423e5e392131f102da8ca56d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:07:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] gtrace: NULL pointer dereference in
  __gtrace_walk_output_components()
- [Medium] gtrace: unpaired put_trace_id() calls in
  gtrace_unassign_trace_id()
- [Medium] gtrace: unpinned component driver across gtrace_create_path()
  and path lifetime
--

commit c1254df0912d56d211b33f383984d030e23fab3a
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add functions to create/destroy a trace component path

This commit adds functions to walk output components and create or destroy
a trace component path from a source to a sink, including trace ID
assignment.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index 57554d5eb98d3..728235fc9bfe2 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c

[ ... ]

> @@ -230,6 +231,62 @@ int gtrace_reset_component(struct gtrace_component *=
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
> +	struct gtrace_comp_priv *cpriv =3D to_gtrace_comp_priv(comp);
> +	struct gtrace_connection *conn, *stop_conn =3D NULL;
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	int i, ret;
> +
> +	if (cpriv->visited) {
> +		dev_err(&comp->dev, "loop detected, please fix the firmware\n");
> +		return -ELOOP;
> +	}
> +	cpriv->visited =3D true;
> +
> +	for (i =3D 0; i < pdata->nr_outconns; i++) {
> +		conn =3D pdata->outconns[i];
> +		ret =3D __gtrace_walk_output_components(conn->dest_comp, stop, priv, f=
n);

[Severity: High]
Can conn->dest_comp be NULL here, leading to a NULL pointer dereference of
comp->pdata and cpriv->visited on the recursive call?

When a downstream component is unregistered, gtrace_cleanup_inconns() sets
conn->dest_comp =3D NULL on the shared connection entry that stays in the
upstream component's pdata->outconns[] array:

drivers/hwtracing/gtrace/gtrace-core.c:gtrace_cleanup_inconns() {
	...
		pdata->inconns[i] =3D NULL;
		conn->dest_comp =3D NULL;
		gtrace_put_component(comp);
	...
}

[ ... ]

> @@ -496,6 +553,206 @@ void gtrace_unregister_component(struct gtrace_comp=
onent *comp)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_unregister_component);

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
> +		device_lock(&comp->dev);
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +
> +		if (!gtdrv || !gtdrv->get_trace_id) {
> +			device_unlock(&comp->dev);
> +			continue;
> +		}
> +
> +		trace_id =3D gtdrv->get_trace_id(comp, path->mode);
> +		device_unlock(&comp->dev);
> +		if (trace_id =3D=3D -ENODATA)
> +			continue;
> +		if (trace_id < 0)
> +			return trace_id;
> +
> +		path->trace_id =3D trace_id;
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static void gtrace_unassign_trace_id(struct gtrace_path *path)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +
> +	if (path->trace_id =3D=3D GTRACE_INVALID_TRACE_ID)
> +		return;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp =3D node->comp;\
> +		device_lock(&comp->dev);
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +
> +		if (!gtdrv || !gtdrv->put_trace_id) {
> +			device_unlock(&comp->dev);
> +			continue;
> +		}
> +
> +		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
> +		device_unlock(&comp->dev);
> +	}
> +}

[Severity: Medium]
Can gtrace_unassign_trace_id() call put_trace_id() on components that never
allocated path->trace_id?

gtrace_assign_trace_id() skips components whose get_trace_id() returns
-ENODATA and stops at the first component that returns a valid ID, whereas
gtrace_unassign_trace_id() calls put_trace_id() on every component in
path->comp_list that defines the callback.  Any component in the path that
returned -ENODATA or sat after the supplier will receive an unpaired
put_trace_id() call, corrupting its trace ID accounting.

> +
> +static bool gtrace_path_ready(struct gtrace_path *path)
> +{
> +	struct gtrace_comp_priv *cpriv;
> +	struct gtrace_path_node *node;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		device_lock(&node->comp->dev);
> +		cpriv =3D to_gtrace_comp_priv(node->comp);
> +		if (!cpriv->ready) {
> +			device_unlock(&node->comp->dev);
> +			return false;
> +		}
> +		device_unlock(&node->comp->dev);
> +	}
> +
> +	return true;
> +}

[ ... ]

> +	if (!gtrace_path_ready(path)) {
> +		ret =3D -EOPNOTSUPP;
> +		goto err_release_path_nodes;
> +	}
> +
> +	ret =3D gtrace_assign_trace_id(path);

[Severity: Medium]
What prevents a component driver from being unbound after
gtrace_path_ready() drops device_lock(&node->comp->dev)?

CPU0                              CPU1
gtrace_create_path()
  gtrace_path_ready()
    device_lock(&comp->dev)
    cpriv->ready =3D=3D true
    device_unlock(&comp->dev)
                                  device_release_driver(&comp->dev)
                                    gtrace_remove()
                                      cpriv->ready =3D false
                                    comp->dev.driver =3D NULL
  gtrace_assign_trace_id()
    gtdrv =3D=3D NULL -> continue

Because build_path_walk_fn() only takes a struct device reference via
gtrace_get_component() without pinning the bound driver, an unbind after
gtrace_path_ready() causes gtrace_assign_trace_id() to see !gtdrv and
silently skip the component, allowing gtrace_create_path() to succeed with
an unbound component (or skip put_trace_id() if the driver is unbound
before gtrace_destroy_path()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D4
