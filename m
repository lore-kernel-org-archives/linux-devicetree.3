Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FE43BDA1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788416; cv=none; b=ttREI00ZLY//fR33Oq+hiP0gimZ8ATLSKZYXCvrtT/6n7Oth0TtSZLXJieFsExbBOfvS9oN9/UdP4ngEqaKUPbnNPXPGISa2K378NHbxX4dd0cXKgIfFfQHp3EZQp7Br6JB9REWI8rXjEBapgho+bVNlgusGFZG2Iz+/47ijBKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788416; c=relaxed/simple;
	bh=Eu7v/dZsoWKFOY3ySzLPyfAI1R0xjizrbaVxK8LZi/c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cWZIzPcvGha5ApFGCu41qE0O3V0bXw5YSlzjg+HVlzte/ulWRp7mGAvquQ4+Mv4U96lBrcpj/6Pk+CEGGV73fQh27jg9hA6lIcaKwe+aS2+8Jj7BWUicu0WlSnCB7MWYCW7e68TZ+Y/uyOdGfrdkpF+nR7PUdyhhhtiiIBc/ZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJV2BjhM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJV2BjhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEF21F0089B;
	Mon, 12 Oct 2026 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788407;
	bh=MGy7PaJF7SUEz4M/idLMzz3p50/rc2J4LyMnYkTv8Y4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kJV2BjhMrXNjlXERpTtZceDD3YSOemuQPIP5phwOziaRso43zCCYPXTSDqaiLapjT
	 xcLHqEWZ13UX0oe7DWy836j0aT9wMpM7HGHFlZZ6Kda0O+/AE7ylZixIjKD9CY9qps
	 49GUfGWwb8muHrz8bK5Ima3s89PCkkRaPnI+tcJh4id/8NUMqU3JTHihX/zBZL7rH5
	 jAuvqLC364xhtWTXTmAusdPn7nBJRGzo1Ey+JIRUjSqqUGlcSUIs73Dh/jQadb36Fq
	 6whSg7p2vq+o9yQ8ZykZVfo7aXbBFLBqn65A+GdU2fiDtJExbgbjXwkJytJ4UfS0Ps
	 uZVgtPucLqpeQ==
Message-ID: <sashiko-outbox-167761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 06/14] media: qcom: camss: Add Kaanapali compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20261011-kaanapali-camss-v21-6-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-6-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:00:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: missing DT port bounds check causes OOB array access=
 on csiphy
- [High] media: camss: dev_pm_domain_detach() NULL pointer dereference on c=
leanup
--

commit 226a568dbea1991f8bda4c0b73de0c31f612545e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add Kaanapali compatible

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..fca3de214a922 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);
>  }
> =20
> +static const struct camss_resources kaanapali_resources =3D {
> +	.version =3D CAMSS_KAANAPALI,
> +	.pd_name =3D "top",
> +	.icc_res =3D icc_res_kaanapali,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +

[Severity: High]
Can this empty csiphy configuration lead to an out-of-bounds array access on
the csiphy array?

In camss_parse_endpoint_node(), the device tree port number is assigned
directly to the interface ID without bounds checking against
camss->res->csiphy_num:

	csd->interface.csiphy_id =3D vep.base.port;

Since kaanapali_resources omits csiphy_num, it defaults to 0. This causes
the camss->csiphy array to be dynamically allocated as a ZERO_SIZE_PTR.

If a device tree specifies an endpoint (even port =3D <0>), it evaluates to=
 an
out-of-bounds access when the async subdevice binds in
camss_subdev_notifier_bound():

	u8 id =3D csd->interface.csiphy_id;
	struct csiphy_device *csiphy =3D &camss->csiphy[id];

	csiphy->cfg.csi2 =3D &csd->interface.csi2;

Could this cause a regression leading to a kernel panic if the driver
processes a device tree containing endpoints for this compatible?

[Severity: High]
Can omitting vfe_num here lead to a NULL pointer dereference during power
domain cleanup?

During probe failure or driver removal, camss_genpd_cleanup() handles power
domain cleanup:

	if (camss->genpd_num =3D=3D 1)
		return;

	...
	dev_pm_domain_detach(camss->genpd, true);

If the driver is booted with a device tree lacking PM domains, genpd_num
could be 0. This means camss_genpd_cleanup() will not exit early.

If camss->genpd was never successfully attached (for example, due to having
zero VFEs or no PM domains configured), it remains NULL.

Because dev_pm_domain_detach() lacks a check for a NULL dev pointer before
dereferencing dev->pm_domain, could this unconditional call cause a regress=
ion
when cleaning up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D6
