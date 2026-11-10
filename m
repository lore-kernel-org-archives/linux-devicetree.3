Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297020;
	b=gmDrXCc2+1x/oR/xAI/QtC9stLtZQoX6Ph46TgaJ3KR3KBuI4/x1CFN1DAGbZv/5NaVE
	 mmAUkt+h8oKYm+gGQI/zyXfNGF1p7tPR2IsIAJVsrNuR6Szfr2ax0iOJJM7XNXhrPzm1C
	 eiV6wwbuV6o4rb14f+bsG6sevhigQFr03zFWKPPTMuzU1NnJ5tsLbdqvU9wq1QyYh7OF/
	 pKxp0K+cDl+DFAMDhCo7OM3+a7KA4zMrK4ZfEl7UQsqprXTBnmEeelflQGLNSA0Y/tVGl
	 jdovanPaXK8yePflRbeHYEicjS17T/I7o/yb+g/NGQGMuqy/VYqWhFCrtY/Aje+JnaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TJku+c8t4bTpn2fY+P+fG+gIMWMUc/Q8CL46TPcoVoY=;
	b=nwmy5JpbZoDjB3Gxs7J3bPk+bZ5nCjBFO0VtY8jDXHi2XWogsTRS71khWgxCecpRQtF4
	 ACY12cTp5LniMye+86jlhqeg4z0UBsQvuRHBWipSD++Ze32xDEmtY4otUhEmbvfYJiEy8
	 yI+g7xa0X1eLI0TidXvF92bQHSfgqWDXCprK5lZ93Yp+vyYMRHdX+k/5885NTjCNjGY2W
	 6s0E/j8C8Tp6yFWGbqj/tyb4HHSWQ5HibV0CuqiUUJDca8nhM6LuZ689a3Y7O6b1ySr2K
	 b0jgHfy/R+6yasWtEXbwUHtNGHk+RkEgP12/fflJs52WQqG3/2j3aPGGfhgAYsKeuYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h21YCkb4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C560606C637
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h21YCkb4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0231F008AB;
	Tue, 10 Nov 2026 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297020;
	bh=TJku+c8t4bTpn2fY+P+fG+gIMWMUc/Q8CL46TPcoVoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h21YCkb4QVb7MQp9jMOVDEVGG12UZwhgSOHDIjGf3CwZjpqLgNrPKS1yOTx9rFZZR
	 IWtTlt4iWBkLLwoKhUWqhXdy/ZekWaG5NV3jD5rUQjWAQhkCAmj87WL47RoEbamdRE
	 hBjeFQ1/bNUaiI0neztpzpJzju4xZk3DnagOmM6B2G2iF+GD4G16YITrEUgYZWDJ35
	 SY2yNQMbF34OjRm3hzdTjBQnCWI5dpGbqDGR1mNC2V2BXnA9x/A8mmm3/zvwjv+pOy
	 1XU1A2iwK8qM+5nrkbJvGalbgMKDEgj2iLrXT7utg9USALOgF66wCrffkhsy3r05h+
	 rgl3HJT7ayRkA==
Message-ID: <sashiko-outbox-206534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] media: verisilicon: Don't hold a VPU behind an
 IOMMU in reset after remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261110-hantro-robust-v1-2-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
 <20261110-hantro-robust-v1-2-6b6269c05bfa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:50:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] media: verisilicon: null pointer dereference in hantro_probe()
  [1]
--

commit 4e4d9ad2d3b9dfeb29c03b860ceeca44937863cf
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: verisilicon: Don't hold a VPU behind an IOMMU in reset after remove

This commit leaves the resets of a VPU behind an IOMMU deasserted during
probe error cleanup and driver removal so the IOMMU can access its
registers when it subsequently runtime suspends.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 26e5d5547466e..702d878c7b509 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1069,6 +1069,22 @@ static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_de=
v(struct hantro_dev *vpu)
>  	return v4l2_m2m_init(&vpu_m2m_ops);
>  }
> =20
> +/*
> + * The resets may also cover the bus interface that the IOMMU of the VPU=
 is
> + * accessed through, e.g. on the RK3588 AV1 decoder. The IOMMU is a sepa=
rate
> + * device which is runtime resumed with the VPU while it is unbound, and
> + * accesses its registers again when it runtime suspends afterwards. Hol=
ding
> + * the VPU in reset at that point causes an asynchronous external abort,=
 so
> + * leave the resets deasserted for a VPU behind an IOMMU.
> + */
> +static void hantro_reset_assert(struct hantro_dev *vpu)
> +{
> +	if (device_iommu_mapped(vpu->dev))
> +		return;
> +
> +	reset_control_assert(vpu->resets);
> +}
> +
>  static int hantro_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;

[Severity: High]
This problem wasn't introduced by this patch, but can hantro_probe() hit a
NULL pointer dereference [1] when dereferencing match->data?

drivers/media/platform/verisilicon/hantro_drv.c:hantro_probe() {
	...
	match =3D of_match_node(of_hantro_match, pdev->dev.of_node);
	vpu->variant =3D match->data;
	...
}

If a probe is forced via sysfs bind on a device without a matching OF node,
of_match_node() returns NULL and match->data is dereferenced
unconditionally.

[1] https://sashiko.dev/#/bug/linux-4e7cd977-2daf-4048-ad53-7801b4bba80e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-hantro-rob=
ust-v1-0-6b6269c05bfa@gmail.com?part=3D2
