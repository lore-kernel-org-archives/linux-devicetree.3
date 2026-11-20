Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175149;
	b=Zv2xr9ceKIefI5enPi7pgNTZVGJBnuN0mpua1s+asjn20vRvHSpzcAOY5IqsFLgN2jf1
	 2GVCeS99e4nV64V8Qe4qMvR6A9/63GS7mBModndDxA0vd+yFj2ESw+FjQdNFO+3hiL3CV
	 pVg37ll8vJPxwJKCYFnoy3bnXf9POL1sbFRzuz+WS8+i4Y2vJCjK6dDgtvNeRj+KzSbsY
	 Saqjitm7IP3GVr+fGKEw+emUHPHKA1K9E7lr5+IdnGdKezz9feFG021qA0YltVTsB9yn8
	 LefawHeHJqEg5hcite1D1QJcXo6h1IOM4zxZvCPQc0yh67yaNpQyCVZJxLboX1n9LQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175149;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9TyTWbzrjP5wPhg7IrZaHlYF4gDbOOrwLw/7ODNyHIE=;
	b=SQ8LdOWDWcVr9ia67Oq5wUPOjHxRv1/2Pmj0COU70X45zKeyo01Nakgo7uh0jKaftcxf
	 dP2luEBV4ABzTN3eKmzn2PB9kcy5yTkKMhyEW8U++G1a7hErQG/SRrmKiUAnzcLXbO7Tm
	 SqwLjTAibzyHOQWBlBo4RYEOq6LxRsOaNhuU6MS00LKoDXO02x0fprr3ZnbrvUa7dS++/
	 H4T7hbxtvVT6dVKjWiGqImHVMlMMsNPJ/3VZRhwPd8vNybxYP7ZA3fd5ilY7sqq4pe6ae
	 kkAPbgmI4Gjdjj49G4q8LoyaTqtwSFItU2o1VBWFpAeL0uxo3838fpDBB/MTN8x0zdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBsq9rsO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1860A2625
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBsq9rsO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA49C1F000C4;
	Fri, 20 Nov 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175149;
	bh=9TyTWbzrjP5wPhg7IrZaHlYF4gDbOOrwLw/7ODNyHIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TBsq9rsOtwKzGbxThsYRVePySc6WHVMgOrUEz+etRyz6JeygIM0MzPXW00grxstPn
	 lid6OEJcRfkQwuvzW2soPd2kflfIIZYtjA4DpVzeRu7JMuRQ+f0ZT6nmw+mvpvQtJx
	 tnd2XXcpH08uEkbkmQLnPgc/3jYgPfzNgiLDlEgpksTfl6T5DuFUeBjnEahBY0AG+y
	 LDn1hfks1tM5sQ69daC01fP1ScF0NYBVz1GcUSXWZmHBxMm5HNxI9HwNzmzeJ83dAl
	 5UD5Jfq8Jv5TlXkH0REg/B9Xbzsju/u7X3jigsQwgrQzp6Abq0gCXYwZAugiVM5zFw
	 4jDGoZt8oGCdw==
Message-ID: <sashiko-outbox-225094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: rockchip: Add IEP2 deinterlacer driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261120-iep2-v3-2-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
 <20261120-iep2-v3-2-e94eb9f629d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:45:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: rockchip: iep2: unhandled empty_domain alloc failure
  in iep_probe()
--

commit 412e46dad64f85e912b35379802af12bdb8fee8c
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: rockchip: Add IEP2 deinterlacer driver

This commit adds a V4L2 mem2mem driver for the Rockchip IEP2 deinterlacer
on the RK3568 and RK3588 SoCs.

> diff --git a/drivers/media/platform/rockchip/iep2/iep2.c b/drivers/media/=
platform/rockchip/iep2/iep2.c
> new file mode 100644
> index 0000000000000..11b349dda7196
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2.c
> @@ -0,0 +1,1320 @@

[ ... ]

> +static int iep_iommu_restore(struct iep_dev *iep)
> +{
> +	int ret;
> +
> +	if (!iep->empty_domain)
> +		return 0;
> +
> +	/* A reset leaves the IOMMU in bypass; reattaching reprograms it */
> +	ret =3D iommu_attach_device(iep->empty_domain, iep->dev);
> +	if (!ret)
> +		iommu_detach_device(iep->empty_domain, iep->dev);
> +
> +	return ret;
> +}
> +
> +static void iep_reset(struct iep_dev *iep)
> +{
> +	u32 status;
> +	int ret;

[ ... ]

> +	ret =3D iep_iommu_restore(iep);
> +	enable_irq(iep->irq);
> +	if (ret)
> +		dev_err_ratelimited(iep->dev, "reset failed: %d\n", ret);
> +	iep->iommu_lost =3D ret;
> +}

[ ... ]

> +	if (iommu_get_domain_for_dev(dev)) {
> +		iep->empty_domain =3D iommu_paging_domain_alloc(dev);
> +		if (IS_ERR(iep->empty_domain)) {
> +			dev_warn(dev, "cannot allocate empty IOMMU domain\n");
> +			iep->empty_domain =3D NULL;
> +		}
> +	}

[Severity: Medium]
Should iep_probe() fail when iommu_paging_domain_alloc() returns an error?

Setting iep->empty_domain to NULL causes iep_iommu_restore() to return 0
after a hardware reset even though an IOMMU is attached and left in bypass
mode.  iep_reset() then clears iep->iommu_lost, skipping the synchronous
runtime PM suspend in iep_pm_put() and the iep->iommu_lost check in
iep_device_run(), so later jobs run DMA with IOVA addresses while the
IOMMU is in bypass.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-iep2-v3-0-=
e94eb9f629d2@gmail.com?part=3D2
