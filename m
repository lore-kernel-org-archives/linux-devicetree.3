Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D91422E2A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153427; cv=none; b=W1ZbMQjcqyxUmd48GDgHAcwt0VBOroCscOa+zRHXR11gNngRWVmJ1phNPaFkHBq5qqgfYfE7NsBnNq94H04CMaC06uIW3NdgJAARDtrM3ulESxnhqrf2dzYm+hw8FmI2Xuar+gctoFQpeHbyNQdoNyMeFspA6/ZuyP8mhNJVT+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153427; c=relaxed/simple;
	bh=GPYCPJ5Kt9gTdNhFQ0OYR+ybiW9sXAcSOG3R/VY2qvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZC1AesI+LYtXBPFHcSTj8sfAGZtItXzJlbaHRJdaBOl6NdXIWYa/OruBk33eVS1ZpT4Vp4oZRsT4Xbx1TWA4hzZZrUWBd1xiIQK91AeiKVlI/hSlB1d/t9xH05Cl+KT63Cdfdiv7qlbQN8vDRxb6aaVb8YPm85M9nYZPeTlUlhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2O0ZBf3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2O0ZBf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4446A1F000FF;
	Wed, 23 Sep 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153425;
	bh=xA07KeWlMncODmg6c/1oJfrpHso4ZLALk+Af06e0HMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2O0ZBf3Y2DOyTKvFac5c7zDFB036mNL+aKoVutjJD3lCIWIB8JjtCS+tyA1bw2Nh
	 NxT4X2n/1WDmlwQLBYsWCpZuzDMZ7HY7hi47zDYK3SuakUK5dKxvqGQ9bHD21zMhrK
	 1cg44JA8mQcxQVpE29eBsGGBB2PC5Oq677V0zjjX+jD+p5ieFW6jmOjm9QZK0KUedi
	 1ZXCN67GwNGtahOlOUtAGq2Am6E4EJd6n+RJdbel1g3eej8X7rqWho1y9ej3JtqvJD
	 7cVuACjGnY+c9qEdSz8AcM1DbpUP3NR6nYJGTn8rdXqb+1WE2v41+fsO9X+xhLz1JZ
	 +5isfauztQCVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session
 creation to the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:50:24 +0000
Message-Id: <20260923085025.4446A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] misc: fastrpc: duplicated ADSP sessions leak due to probe race c=
ondition
--

commit 6af4cd918024ca72389e7e81cea29baaabd3588c
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

misc: fastrpc: move ADSP duplicate session creation to the driver

This commit removes the qcom,nsessions DT property read from
fastrpc_cb_init() and stops duplicating sessions at the context bank level.
Instead, it adds a fixed loop in fastrpc_rpmsg_probe() that duplicates the
last ADSP session FASTRPC_DUP_SESSIONS times.

> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f20d3e5ecc81f..b29c1fd00de28 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c

> [ ... ]

> @@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device=
 *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
> =20
> +	if (data->domain_id =3D=3D ADSP_DOMAIN_ID && data->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess =3D &data->session[data->sesscount - 1];
> +		for (i =3D 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >=3D FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess =3D &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));

[Severity: Medium]
Can this sequence result in leaked duplicate sessions?

Looking at fastrpc_rpmsg_probe(), the misc device is registered via
fastrpc_device_register() and exposed to userspace before we reach this loo=
p.

If a concurrent userspace application calls open() and triggers
fastrpc_session_alloc(), it could mark the last session's used flag as true.

Since this loop uses memcpy() to duplicate last_sess, wouldn't it blindly
copy the used =3D true state into all the newly created duplicate sessions?

If so, these duplicates would be permanently marked as in-use without being
assigned to an active user context, causing them to leak and remain
permanently unavailable.

> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
> =20
>  err_deregister_fdev:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dup-sessio=
ns-v5-0-e953133a1827@oss.qualcomm.com?part=3D2
