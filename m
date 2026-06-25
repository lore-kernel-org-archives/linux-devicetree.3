Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6423CF942
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385624; cv=none; b=KXNbIzfKngqwmrvl+yRJptIrfPZPRgM4MKpEIpFu3abshdnF1uhoUA0VBb3u4lwJ0dNt3PgbY4Ei2RVEv3Wle/fbnwN7fBDe6iUKr4iPMMzb2//apRJgBiqMT2MjW8sh6ZG2NYqODvYTDuPQxTt5X3aofRiDzu8X3iAWw1TEV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385624; c=relaxed/simple;
	bh=baMSG6M77ejdMbFah4jyL4DixpFeDx+DNnjtaNLpSK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D8+grefmXagtsUhj0hSH4hMALm2eRpTnueSndPC/1yJ4vGTnCJzEZILgBm+FsV80l5fNVqVcLW7PRHy+hTTtx+hslJj/UgOZX/1jQPbKQobVRL7LAYYnX8mCqxCFqux1J1p17E0CcAxHvDWn2jESfTMeK2S9R1ealFBtRBn3KQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMQWU1Xx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMQWU1Xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BD91F000E9;
	Thu, 25 Jun 2026 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385623;
	bh=n8ppZL44JBcBNO3uyygxHClrlJeOyuntX8SnpT8jHDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMQWU1XxoJkn6UTow5M4OxYLrNcd0cja1kUnydS2ty15+N9GwMz4NLDTYcG9ILDOw
	 xEpfto/r632BIVoPxQ9w6WWTsYx5/Qte6f9psK9ip4qnXFKLgXa3OC996tulC5VEAl
	 ebK5wkVuXtqWHMHaZterP2L/fmT2ieesbJ/poA3DcbUtEZZqfsULkGZABgoXKXmJAR
	 UxEC3c/SGHQTO83aTGbu3W9FQ2gUaqCmGRX06D90espsSVpzc34pTheURqo4tJZg+t
	 RAEAVf/bUb6P3ouxa8EjUxNj8Z69D/faV0udjWrAuOxnV/0dLHdE3dujb4w1D09r5N
	 cvZzkmK50UQMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 1/7] coresight: core: refactor ctcu_get_active_port
 and make it generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-1-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-1-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:07:02 +0000
Message-Id: <20260625110702.E6BD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Lockless iteration over `pdata->in_conns` array introduces a TOCTO=
U race condition and potential Use-After-Free.

Pre-existing issues:
- [High] Missing bounds check for Device Tree-provided `port_num` leads to =
out-of-bounds array access in CTCU trace ID configuration.
- [High] Unsafe direct dereference of sparse array elements in `tpda_get_el=
ement_size`.
--

commit f655e6df0885045f179728cb52f455717556ac67
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: core: refactor ctcu_get_active_port and make it generic

This patch removes ctcu_get_active_port from the CTCU module and adds it to
the core framework as coresight_get_in_port. It allows retrieving the active
input port number generically for a given device.

> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index 6d65c43d574fd..7a7a85acdca0d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct c=
oresight_path *path)
[ ... ]
> +int coresight_get_in_port(struct coresight_device *csdev,
> +			  struct coresight_device *remote)
> +{
> +	struct coresight_platform_data *pdata =3D remote->pdata;
> +	int i;
> +
> +	for (i =3D 0; i < pdata->nr_inconns; ++i) {
> +		if (!pdata->in_conns[i])
> +			continue;
> +
> +		if (pdata->in_conns[i]->src_dev =3D=3D csdev)

[Severity: High]
Can this sequence cause a race condition leading to a NULL pointer
dereference?

The array element is read twice. First, to check if it's NULL, and then
again to access src_dev. If a concurrent device unbind operation like
coresight_remove_conns() sets the element to NULL between these reads, the
second access might trigger a panic.

Should we use READ_ONCE() to load the pointer into a local variable first?

> +			return pdata->in_conns[i]->dest_port;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_in_port);
> +
>  u32 coresight_get_sink_id(struct coresight_device *csdev)
>  {
>  	if (!csdev->ea)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/=
hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01e..e8720026c9e3f 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
[ ... ]
> @@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_devi=
ce *csdev, struct coresight
>  		return -EINVAL;
>  	}
> =20
> -	port_num =3D ctcu_get_active_port(sink, csdev);
> +	port_num =3D coresight_get_in_port(sink, csdev);
>  	if (port_num < 0)
>  		return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but does the returned
port_num need to be bounds-checked before being used?

The port_num originates from device tree properties, and if it exceeds
ETR_MAX_NUM (2), it leads to out-of-bounds array accesses in
__ctcu_set_etr_traceid() when indexing into drvdata->atid_offset and
drvdata->traceid_refcnt:

__ctcu_set_etr_traceid()
    ...
    atid_offset =3D drvdata->atid_offset[port_num];
    ...
    refcnt =3D drvdata->traceid_refcnt[port_num][traceid];

Would it be safer to validate port_num against the array bounds after
retrieving it?

> =20
[ ... ]

[Severity: High]
This is a pre-existing issue not introduced by this patch, but while
looking at the sparse in_conns array usage, I noticed a similar issue in
tpda_get_element_size().

Does this code dereference the sparse array element before checking if it
is valid?

drivers/hwtracing/coresight/coresight-tpda.c:tpda_get_element_size() {
    ...
    for (i =3D 0; i < csdev->pdata->nr_inconns; i++) {
        in =3D csdev->pdata->in_conns[i]->src_dev;
        if (!in)
            continue;
    ...
}

If a component is unbound and the connection is removed by
coresight_remove_conns(), csdev->pdata->in_conns[i] could be NULL,
causing a panic before the check is reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-enable-byt=
e-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com?part=3D1
