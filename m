Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26173C76BB
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153438; cv=none; b=hMWY+SU1zKAFi0sw3ftBaHbynTphpJQerDENG4FULQPEwza2yZ88pZVF6zlpr9ObW99HMqrh/oK1CxYcDtDkiqmNnrHFFMdlZd5SGmRncpHCudCpJtCiMnd53cOX/Dk8DwYOSqcrevsv5XDA901MG1eg5iQHaDtj8WbTDdLWnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153438; c=relaxed/simple;
	bh=ZraNc3cCxgM1rGMkkflk24Xaj8/vrXASegymgOYW/uI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=McDIKYOrZsHVnAUkHVEFcPLa9AJYxzz89AgTf8paNS6h5gbIjUJHjbYQv+mv06xBtZaVgYg6S9Xp/pWXQj8IpCCEXANFr5EGwtilpJ69Z2avquhLF1JdzxGh1n3tf7EG5d79c9n3RyUA/CiB75lDZSsaH7Jn+mufzyOJz2NE9X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP3/h2wj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP3/h2wj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7801F000FF;
	Wed, 23 Sep 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153436;
	bh=v5dJ9RUYLeLnoQosiUt/T+w42OmPSw8eE6fcWkD+BYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kP3/h2wjOAu4sXISElKgRinD3OuCeywngOEH4HvxWflnkLNsfvD8+PbOwoOg0flD+
	 aWJTI690Eiuo0n+JWVGx1iqUtxKgX4oH2ZN8afM9jDf10sg6w1QzXKW8nA5zjptC1b
	 LmBmdrKXnrMZfcQ2XypGmm0Lb9DyEHNy3k86BtNQkWHD7Ui/1ze29DJF11hobzLK4e
	 PuC0oPuZULlx59YQJR+iZGCrdnDaPplmTdajXhnixKo6Ly0GCJBt+tvPRhTRguRvN3
	 K/i1bBJGc+yutlAeVVS3jOlDIjMGpnhMrTvjEQT/XDQEpbyrJ0SAos6+Ys7aho3fqX
	 Vkk8AJgWym1cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] misc: fastrpc: iterate CB nodes manually instead
 of of_platform_populate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260923-dup-sessions-v5-1-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-1-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:50:35 +0000
Message-Id: <20260923085036.1F7801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] of: double-free of device_node references in OF iterator loops
- [Medium] driver-core: memory leak of platform_device in fastrpc_cb_device=
s_destroy
--

commit 0cd61e434e0b0defac9c431333bfa40bb39df800
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

misc: fastrpc: iterate CB nodes manually instead of of_platform_populate

This commit replaces of_platform_populate() with direct iteration over chil=
d=20
context bank nodes to ensure synchronous initialization via fastrpc_cb_init=
().
It also introduces fastrpc_cb_devices_destroy() to manually clean up platfo=
rm=20
devices during teardown and removes the standalone platform driver.

> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index af18ff1992eed..f20d3e5ecc81f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
[ ... ]
> @@ -2389,37 +2389,63 @@ static int fastrpc_cb_probe(struct platform_devic=
e *pdev)
> -static void fastrpc_cb_remove(struct platform_device *pdev)
> +static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
>  {
[ ... ]
> +	for_each_available_child_of_node(rdev->of_node, np) {
> +		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
> +			of_node_put(np);
> +			continue;
>  		}

[Severity: High]
Does explicitly dropping the reference before continue result in a double-f=
ree
when the loop macro advances? The for_each_available_child_of_node() iterat=
or
inherently calls of_node_put() on the previous node when advancing. This
occurs here during device destruction in fastrpc_cb_devices_destroy().

> +
> +		pdev =3D of_find_device_by_node(np);
> +		of_node_put(np);

[Severity: High]
Does explicitly dropping the reference at the end of the loop body result i=
n a
double-free when the loop macro advances to the next iteration?

> +		if (pdev)
> +			of_platform_device_destroy(&pdev->dev, NULL);
>  	}

[Severity: Medium]
Does this leak the platform_device reference acquired by
of_find_device_by_node() in fastrpc_cb_devices_destroy()? The reference
returned by of_find_device_by_node() has an incremented reference count, wh=
ich
doesn't appear to be released via put_device() or platform_device_put() aft=
er
unregistering the device.

> -	spin_unlock_irqrestore(&cctx->lock, flags);
>  }
> =20
[ ... ]
> +static int fastrpc_cb_devices_create(struct rpmsg_device *rpdev)
> +{
> +	struct device *rdev =3D &rpdev->dev;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	int err;
> =20
> +	for_each_available_child_of_node(rdev->of_node, np) {
> +		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
> +			of_node_put(np);
> +			continue;
> +		}

[Severity: High]
Does explicitly dropping the reference before continue result in a double-f=
ree
when the loop macro advances? The for_each_available_child_of_node() iterat=
or
inherently calls of_node_put() on the previous node when advancing. This
occurs during driver initialization in fastrpc_cb_devices_create().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dup-sessio=
ns-v5-0-e953133a1827@oss.qualcomm.com?part=3D1
