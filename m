Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B60433E66
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832962; cv=none; b=bcfZYcrhczm26BNb7TM6KToeJ5j1VRz/8GvZGc+g5Qv3VLUE7C70p/vrrfBf1AM3Da9avPkcRhBH4GKjwyyKz3j3LuwilXtQ7YPydvBcwSL7ZAsujHZayBSV9tfLnA/lyd7coIB7/mEaG02C5FJRH6KryBzPn9PusQrzw/X/SdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832962; c=relaxed/simple;
	bh=hmwzJx+wgzQQTWzVMecEyFS35BkE/K8pxHoyWpSx9Dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZI0dhOQIVkYz9N0CR5fopOnro7d2BI/QdFychIgU+Ih+oGrbNrxJnEM+dfCU4QWschLkkISG1n/teSJ7cbPgSlQn1asbFWqAJKeMmthVmnGrEfpiydefQMfmxMO3ELjMb57qKTyV8/vg6OzonA5rJjAlLfzmKc6ah/kiOAW1lgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cb1iDv/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb1iDv/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C121F000FF;
	Thu,  1 Oct 2026 05:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832961;
	bh=aeG7X3j9A7fqCMj3yS9EgVt8B8NaRU4LfFQT4HuGe2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cb1iDv/ciCJu3kNXotJl97oZ1n90XCvM4k/ZFIjBpaPHfgTM641qLZYT+N1Q43nOF
	 3r5eFYRD2iXLRBVUsm0t9T3Jr1Qe2nnZs9a09ldHOWffrsqXyz/BraFdMrIYZ1dVQ+
	 SLQd7M0+NIqXROQ773gw5c/F8f7ol86CmvYXYgdDvNxfEXFOqE009FbAro1R79Iu5N
	 w2waGKeFgaxd5/tov0twYZCkaU8tQ/JN8c6O3QvH9sTOSe51Ah0s2YSVj5rWoU5gLk
	 ZBAC4q2Gz14hH/72jAJkVBidh8VuSYyrpy+fNN1s06SjHHF6875KjFZR7UJkTYx1Ua
	 1wGaj9tvfcENA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/14] gtrace: Add functions to create/destroy a
 trace component path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001052243.3042627-5-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-5-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:36:00 +0000
Message-Id: <20261001053601.12C121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gtrace: lockless driver callbacks lead to unmapped memory execution
- [High] gtrace: gtrace_cpu_source returns component without holding refere=
nce
--

commit aae09d737c66acc0654dfd58c7118f63245ce4b1
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add functions to create/destroy a trace component path

This patch adds functions to create and destroy a trace component path.
A trace component path represents a chain of trace components connected
to each other, which will be used by gtrace perf support.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index d374c679a6498..f750025104ec9 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c

[ ... ]

>  struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
>  {
>  	if (!cpu_present(cpu))
>  		return NULL;
> =20
>  	return per_cpu(gtrace_cpu_source_comp, cpu);
>  }

[Severity: High]
Does this return the component without holding a reference to it?

If a caller operates on this pointer without pinning it, and the component =
is
concurrently unregistered via gtrace_unregister_component(), could this lead
to a use-after-free? When the caller later passes this pointer to
gtrace_create_path(), it would be dereferenced during the walk of output
components.

Should this hold gtrace_mutex or take a reference via get_device() before
returning the component?

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
> +		if (!gtdrv || !gtdrv->get_trace_id)
> +			continue;
> +
> +		trace_id =3D gtdrv->get_trace_id(comp, path->mode);

[Severity: High]
Can this locklessly access the driver and execute unmapped memory?

Taking a device reference during path creation prevents the device memory f=
rom
being freed, but does it prevent the module from unloading? If the component
module is unloaded concurrently, comp->dev.driver is cleared and the module
code is freed.

If a racing thread fetches the driver pointer just prior to unbind, could it
subsequently invoke gtdrv->get_trace_id() after the function has been unmap=
ped,
resulting in a kernel panic?

> +		if (trace_id > 0) {
> +			path->trace_id =3D trace_id;
> +			return 0;
> +		} else if (trace_id < 0) {

[ ... ]

> +static bool gtrace_path_ready(struct gtrace_path *path)
> +{
> +	struct gtrace_comp_priv *cpriv;
> +	struct gtrace_path_node *node;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		cpriv =3D to_gtrace_comp_priv(node->comp);
> +		if (!cpriv->ready)
> +			return false;

[Severity: High]
Is it safe to read cpriv->ready here without holding the device_lock?

If the driver is concurrently unbound, could this be reading a value that is
no longer protected against modification?

> +	}
> +
> +	return true;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D4
