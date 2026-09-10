Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745C48F846
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056263; cv=none; b=oHj9gmDcgxX+PXCKbAd1EfkAdiHMLLnFIDxAbkcaRNpHzumJHu65DR6XkWptQ/BG/TxTDmVNKlwtWRSDg+Kw95NvGbtTWGeyIihS7/xsT+06o8oob1J3NEUCvmpE3kmgbLB66hN1ldva8j/tpaFvPNt0kpNexq8GJJHiqmVTZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056263; c=relaxed/simple;
	bh=244UXMfH3OJvwIastRBQtBBJEMliJaD5gYDdmn6i5bI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tN8vHmLTFhzSLVAqDWW+N+/fndqIeIrRwWKYR7wSadU4MXZkxtj4oLFlXAbhjUAQ6wrHVwcnFLw7ePe1DP9w2KXSPt405gjfcVPZhijjySxmw66h2OzfQK47AtnklUaSWT+CJOy84oyAnIu3UIq7dOIWVpOVo8JBpSuXNZzY9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGQEap4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGQEap4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0121F000FF;
	Thu, 10 Sep 2026 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789056262;
	bh=G0lVgRIXnFsIhtGHQWgNWxDZ+UdCA2sy3bdV9SdU6kM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGQEap4/8HVmpun+a5O/6Pk0R4dlAdLSVQBtOQGBpJaFUXeXDTUCoWkmBUsw8DE1j
	 2ubYsXUZGnhUDfquQ8EQF65qlxf0/SbmRt6i73fXVOn8XFXQHCbXodcL80Z+B7l8fM
	 wqyZX+RasdiWF24oKndvp4hKHhnwuyN8Fi8OwBMvnAg7QwO5lBkZ6N2ar3O9iGyzm3
	 UTofDUgmhxc4iTd+GNkTQwX57I8SV99dmOOapT9Ov3JDOghzqqKLAkFqJ9AINQy4m1
	 7+qnF/LhxTi42Hj2r1zdn7vW/bUTbrB7/k3BtQJVqSvIvxpQU1gjWPSbxQZXwEr53n
	 WfqpeeVk3OxUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910155509.1425682-4-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 16:04:21 +0000
Message-Id: <20260910160421.BD0121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inappropriate reuse of a vendor-specific driver and redundant OF ma=
tch entry for TI AM62p
--

commit 614c65812039ca53f1d8ede20ca79f433983e7a7
Author: Judith Mendez <jm@ti.com>

nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

This commit adds the ti,am62p-efuse compatible string to the uniphier-efuse
driver to supply silicon revision information for AM62p devices.

> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efus=
e.c
> index 6ad3295d31951..35977e1864135 100644
> --- a/drivers/nvmem/uniphier-efuse.c
> +++ b/drivers/nvmem/uniphier-efuse.c
> @@ -60,6 +60,7 @@ static int uniphier_efuse_probe(struct platform_device =
*pdev)
> =20
>  static const struct of_device_id uniphier_efuse_of_match[] =3D {
>  	{ .compatible =3D "socionext,uniphier-efuse",},
> +	{ .compatible =3D "ti,am62p-efuse",},

[Severity: Low]
Is this explicit match entry redundant?

The DT bindings require socionext,uniphier-efuse as a fallback for
ti,am62p-efuse. Because of this mandatory fallback, the Linux OF matching
algorithm will already match the device using the existing entry without
needing the TI compatible string in uniphier_efuse_of_match.

Also, does piggybacking onto another vendor's driver create confusing Kconf=
ig
dependencies?=20

TI platforms would now need to enable NVMEM_UNIPHIER_EFUSE (prompted as
UniPhier SoCs eFuse support), which couples their maintenance and could be
problematic if either vendor IP diverges in the future.

>  	{/* sentinel */},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910155509.1425=
682-1-jm@ti.com?part=3D3
