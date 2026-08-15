Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA824A05D
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786801017; cv=none; b=NNwIsx2gsVL3wArn+q+g0YFYFOUK8bEdf8DsW4R5r32Ou/mhvWZ5NSNnti9zTvcKWvyBszc/ojZhRpLoG6ncMCW7GM5p3nmokM/ZcfASxpuR9SsYamQths6d56SrpiQ/uXEDBEo51vyTYJSCdIHKnBcbu6mWz3rjiOzf66LD8IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786801017; c=relaxed/simple;
	bh=MgTZciCU0PC54mh8kz+UWnQG5x3EYOu+qUolCRHI+7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lUm0qmFf+X1EDgLyjpPsMlS7AwkP0JMUiPZZnvsQWPjdegZqFGd5NzYBqLQMlk0CUAem3uJOVKiX3qrcyn4JUfMovDqi3GHN9p7bXRqFhIfRmAccZc3slQDr7DHB4jwFTaJIAo1MvueZzRJr4H1N+t3DMObk2b5gWUVJrBMCo6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8pHORhI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8pHORhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D001F000E9;
	Sat, 15 Aug 2026 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786801015;
	bh=ZMw8INUTQMuMcdjbOvMmRGwvymO7NQQ0mqQ96E7oXtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g8pHORhIptCs3eZrcoSlo+HwuBM244YwbCSfV5WOP8h+Ws5VVZLv1dpGREfXU2m9/
	 GCDedlOlBqm2FSOGOR6htwDl3SQBn8GT6oFWdF+OgwnxyjxkThgLjblOmsypvfYbb1
	 Z4S5tEbRugjA5fyMVGJOKBnplOprG0PY6kIO2ENX+X+hSj9k29kcNkEAYuqSLHADYB
	 sQ+8X/QPGa6tR7Tigk1h2xpGfJispx3dDKXygZA2Pfgw/j0rRe0JWv+XA/SzwK2OMN
	 ReuCntKbt1hFFCwAUew2GzlC6cUBlvXzuGEF6Nzhtg+TZFAmmnsCOFPDUQYs06ooDV
	 mCz1YO3+EP2cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] rpmsg: qcom_glink_ssr: Suppress cleanup notify
 between cluster siblings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815132541.1575121-5-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 13:36:54 +0000
Message-Id: <20260815133655.11D001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Type confusion and out-of-bounds read when `qcom_glink_ept_cluster=
()` downcasts a generic `rpmsg_endpoint` without checking its transport bac=
kend.
--

--- Patch [4]: [PATCH 4/8] rpmsg: qcom_glink_ssr: Suppress cleanup notify b=
etween cluster siblings ---
commit c10027dd4bbd2c7fac42077955228324a4275d43
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

rpmsg: qcom_glink_ssr: Suppress cleanup notify between cluster siblings

This commit passes the remote processor's cluster identifier down to the
GLINK edges and uses it to skip sending cleanup broadcast messages to other
members of the same cluster during start/stop events.

> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink=
_native.c
> index d9d4468e4cbdf..a15d7e6a52423 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
[ ... ]
> @@ -1940,6 +1944,20 @@ struct qcom_glink *qcom_glink_native_probe(struct =
device *dev,
>  }
>  EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
> =20
> +/**
> + * qcom_glink_ept_cluster() - cluster identifier of an endpoint's edge
> + * @ept:	endpoint to query
> + *
> + * Return: the opaque cluster identifier of the remote processor @ept ta=
lks to,
> + * or NULL if it is not part of a cluster.
> + */
> +void *qcom_glink_ept_cluster(struct rpmsg_endpoint *ept)
> +{
> +	struct glink_channel *channel =3D to_glink_channel(ept);
> +
> +	return channel->glink->cluster;
> +}

[Severity: High]
Does this downcast assume that the endpoint is always backed by the GLINK
transport without verifying it?

If a remote processor on a different bus (such as virtio_rpmsg_bus) sends a
Name Service announcement for a channel named glink_ssr, the rpmsg core
could probe the qcom_glink_ssr_driver and store a non-GLINK endpoint.

Later, when a remoteproc stops, qcom_glink_ssr_notifier_call() would pass
this non-GLINK endpoint to qcom_glink_ept_cluster():

qcom_glink_ssr_notifier_call()
  cluster =3D qcom_glink_ept_cluster(ssr->ept);

Could this blind cast to struct glink_channel and subsequent dereference
of channel->glink->cluster cause a kernel panic or out-of-bounds read?

> diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ss=
r.c
> index e71d3716c55c5..74c671a19af03 100644
> --- a/drivers/rpmsg/qcom_glink_ssr.c
> +++ b/drivers/rpmsg/qcom_glink_ssr.c
[ ... ]
> @@ -100,18 +120,24 @@ static int qcom_glink_ssr_notifier_call(struct noti=
fier_block *nb,
>  					void *data)
>  {
>  	struct glink_ssr *ssr =3D container_of(nb, struct glink_ssr, nb);
> +	struct glink_ssr_notify_data *notify_data =3D data;
>  	struct do_cleanup_msg msg;
> -	char *ssr_name =3D data;
> +	void *cluster;
>  	int ret;
> =20
> +	/* Cluster siblings' firmware can't handle peer SSR notify; skip it */
> +	cluster =3D qcom_glink_ept_cluster(ssr->ept);
> +	if (cluster && cluster =3D=3D notify_data->cluster)
> +		return NOTIFY_DONE;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815132541.1575=
121-1-shengchao.guo@oss.qualcomm.com?part=3D4
