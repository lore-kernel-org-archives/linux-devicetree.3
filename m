Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B6370D49
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555873; cv=none; b=aIkIOTvuog9TW425muwy5bD9DTS0mhD/C86/ZN7kGwVAXO4DTID6SxykdsKi24MVtj+EsvawpfFx6bG7eUZ78fgJpaCOwiJSIckezFQh5Pv2bgemj2GlzQeUevpRehCY17fHRjsZh9v3tguMnXC3nRCunW1xx/+1WkEoxPC23IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555873; c=relaxed/simple;
	bh=0z6to0IbjYPigGIqfATFE6GKvz07Jc/apU/s8XYu9T8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f9MVRhHmbfy81Splwv8ow5ouEYd4iI2Cu2UTBCo2uld6Ln+c1xy32CjtZf0jwYOg7iwzcY+eRFwN3ZhG0GUalib+e9ZnqW8uT7z8qEkuZ0Zjg4H7MIWMPue/GD+QEyGPkWVzb7HA5e92tClmo/kShzhmXXM9WmISS4JZrN0cnb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKQIEryu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKQIEryu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF131F000E9;
	Mon, 20 Jul 2026 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555871;
	bh=m+cZk20z38gB794miPSg1/y9VNNKvzmxXEI8EGRedQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKQIEryuE5wjeJS/9D4XwHEGRE+PzqKgmO5OEBW2t7K8Y1NBjboCzxR0wirG2FNN0
	 zxZQihGlkzBp20quV1fZb9VKlu8aiDUUYylRYkbycNP0NZL947ujMFVU+Ss4XOeYan
	 nlaS1VHu+dJZap1SxIqygP9m4V3M4v6ww2DtfLHWsOTIXb/Hg/r24P7pmrsLMAcTgi
	 1Sst0380wgwqBXQAUBeti1+oO2SqsLHlEZFgEdiiu54M1DSys/FwAduHFkrADeICqo
	 uJP0DDxanCQ6t1PhHk/aadsMzSMEugACiBtfcQgCiOEcWZi/WC0Ht2x5OQ1G5LtOO8
	 mDAWaqnqcJQLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg:
 define DCFG_DCSR region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260720133642.136324-7-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-7-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:57:50 +0000
Message-Id: <20260720135750.AEF131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dereferencing NULL pointer `soc_dev_attr` on the error path.
--

--- Patch [6]: [PATCH v3 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg: d=
efine DCFG_DCSR region ---
commit 87aa71bb5ea85cc0388e2ad87f720397de246b0d
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region

This commit defines a secondary "reg" array element in the DCFG binding
for the hidden DCSR register space. Exposing this area permits operating
systems to perform Reset Configuration Word (RCW) overrides, enabling
runtime reconfiguration of networking SerDes lanes.

> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcf=
g.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> index 3fb0534ea597b..fc14fd0bf84b1 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> @@ -36,7 +36,20 @@ properties:
>            - const: simple-mfd
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1

[ ... ]

[Severity: High]
Does the error path in fsl_guts_init() cause a NULL pointer dereference?

drivers/soc/fsl/guts.c:fsl_guts_init() {
    ...
	soc.dcfg_ccsr =3D of_iomap(np, DCFG_CCSR);
	if (!soc.dcfg_ccsr) {
		of_node_put(np);
		goto err_nomem;
	}
    ...
err_nomem:
	ret =3D -ENOMEM;
err:
	kfree(soc_dev_attr->family);
	kfree(soc_dev_attr->soc_id);
    ...
}

If of_iomap() or the allocation for soc_dev_attr fails in fsl_guts_init(),
the error handling path jumps to err_nomem while soc_dev_attr is still NULL.

The cleanup code at the err label unconditionally evaluates
soc_dev_attr->family and soc_dev_attr->soc_id before passing them to
kfree(). Reading these fields dereferences the NULL soc_dev_attr pointer,
which can cause an immediate page fault during initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D6
