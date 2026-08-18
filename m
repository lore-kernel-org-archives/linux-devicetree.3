Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CBEED8
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066014; cv=none; b=sJ6uAl7J2gqttcH0mn32zirwrG50AWEfdziPfv5s8hDulVk7O4APM339cQ1RqDWCzKfYpMHgI/nvxPL7w5NXhmiXWEnqhr2EJwdiwdjJGN9z1rLPxgLMJl3tdtbDWaqHIcxE3Ugqo6Bbqvk7/aO2U3xkeG9pHJ+P67U5uUHIA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066014; c=relaxed/simple;
	bh=8b2Iwb8tv1h5+pC5nxEK2sQBcz28Miwyh5uuPfO4Ujw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDQ87jTbH6lM2aNYCFgv6/wJrd8rkvia7g23l3i3mILd/Nh5XtveGCv4E4TaV7Q22DBIEFSoeT3tQMuZEyBd22eQ4ZX8WaH4/93oaVqKLPwLZn1X8kheKcv1tnyGtv17J5vMj3PVJ2sJmvCHOu73b4RRG6jc52b4ebhzv6Ypl2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfy48k8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfy48k8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C891F000E9;
	Tue, 18 Aug 2026 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787066013;
	bh=hYWPIKJ/MBMGhvrH9EYtG4KllVWA9gJ9sxf2dd+vCIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfy48k8Tc4/6rh+bmT5+7/NhIv/BlAZO20AepqvQf41I4EgSyj4WYwH8TNolaMVpc
	 6mJRHn9RfkuHVeOvvIUFjjbee/S0X7mjFZVpnZnm5muK8ESqPkzEysgX3+1y219+6u
	 xneFbsjYN/nEYVlBPPtR55r9xkX+vV6tK7njpwRSRajvyeNI733WUTF/A42/T1Ufyu
	 +V1QEgsaW9eV3Uh+XjqqOnHlAaJKDs/I/36qca1ljAQx6imx5CQ4cMi4IC5ZJNVUYv
	 N8s4CvaVFBfeRbZxigvejgrM7eA2RW3YMOYRhHhw68ppVLhtXBM6p/TElaF1+BUBXN
	 B+qzocBthuxPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Exynos5515 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-1-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
 <20260818-for-next-lucky7-chipid-v2-1-28ae49f5c349@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 15:13:32 +0000
Message-Id: <20260818151332.A8C891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds the `samsung,exynos5515-chipid` compatible string=
 with a fallback to `samsung,exynos850-chipid`, but omits the necessary dri=
ver update to support the new SoC. The `exynos-chipid` driver enforces a st=
rict hardware whitelist based on the product ID and will return `-ENODEV` d=
uring probe when it encounters the unknown Exynos 5515 ID, rendering the fa=
llback useless.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: A=
dd Exynos5515 compatible ---
commit c6d7dc985bd68c7bd5ad1ca061556d7ae1c7ee31
Author: Aiden Isik <aidenisik@member.fsf.org>
Subject: dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compati=
ble

This commit adds the samsung,exynos5515-chipid compatible string to the
exynos-chipid device tree bindings documentation.

> diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chip=
id.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.ya=
ml
> index b9cdfe52b62ff..619faf33214bd 100644
> --- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> +++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> @@ -25,6 +25,7 @@ properties:
>        - items:
>            - enum:
>                - samsung,exynos2200-chipid
> +              - samsung,exynos5515-chipid

[Severity: Medium]
Will this compatible string actually allow the driver to probe on Exynos 55=
15
hardware?

Even with a fallback to samsung,exynos850-chipid, the exynos-chipid driver
enforces a strict hardware whitelist based on the product ID:

drivers/soc/samsung/exynos-chipid.c:exynos_chipid_probe() {
    ...
    soc_dev_attr->soc_id =3D exynos_product_id_to_name(soc_info.product_id);
    if (!soc_dev_attr->soc_id)
        return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
    ...
}

Does this require a corresponding driver update to add the Exynos 5515 prod=
uct
ID to the whitelist so the probe does not fail with -ENODEV?

>                - samsung,exynos7885-chipid
>                - samsung,exynos8895-chipid
>                - samsung,exynos9610-chipid

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-for-next-l=
ucky7-chipid-v2-0-28ae49f5c349@member.fsf.org?part=3D1
