Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D927FB18
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108183; cv=none; b=BcBZlw1OUP4ZG5HlCAdoFLcMo7kbr0kbferva0Kj4YSGii9NQbPQZxxtHS4utvofWcNQrKV7xkjPTCQwnIy3+kOr4wzTRuuiSTpxiXdFAynTiyMElxP+n3wkcBVoFVc3P3GaDHR2Iv+RhbsqN5R/w4KGi82EIng9I37SSJp/PdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108183; c=relaxed/simple;
	bh=ZH/91dkW7y8eeyTjRqYaCdAS3SAz/n4756oLP0Rlpc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXQpGe3xVNtf2PmAfsPYO+TWEylKpkH8tehlPBf/Akjy+sg2FUlOK8XGdcbshANwTuA1t7Ch9PYKM4kICt1/wAER4aI+TonHr/P2xux+FjRPQayV+01/pMUZXXQ1QBvtd5/yVZnSY2nfbyuvOAOeoe3erGDddgD2eE0yFVFUYoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP5+KbUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP5+KbUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B621F00898;
	Wed, 10 Jun 2026 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108182;
	bh=kGH3cwv7upz5+K9uWUWPjrvy4z1QNLpvVc1BzDMDup4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jP5+KbUtUYuEcfuF1p+9SaHMP6iGm6C5LKVKA3tOGD+61fx2a51ZjK3h6NucsSxoF
	 3OWfq1IznWXTzu/eLllE7M8tCtd3eS+obX0fY4E+XChzIx71qKV+pndGbXKFPlPciE
	 wNqfs+RgcKx6OCumx54lBvgWrTgBlRFJrafxQ8LBOPoPZu3xqWNqPKcKRxXNhQVx/Y
	 hoaqxqYDIPzl2b3yNIkTEZvRSiFzs0XW3a0gVQ5L7aCKrvy3WAMWIhWct+jBErSfX2
	 C7UqTCH0m6VkkmRlzFNgLXwi4wD1bL+pJzYUJQM/DPWU4MKVVtHkxoK/cVjGTRKI6t
	 JwLsNJoeV31oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 06/12] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609151212.29469-7-ansuelsmth@gmail.com>
References: <20260609151212.29469-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:16:21 +0000
Message-Id: <20260610161621.E3B621F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Late PCS registration handling is structurally broken and causes `=
phylink_create` to fail permanently.
- [Low] Multiple grammatical and spelling errors in the PCS subsystem docum=
entation.
--

commit 84279427a07ae5692e53d4ed76f418a074b2aea9
Author: Christian Marangi <ansuelsmth@gmail.com>

net: Document PCS subsystem
   =20
This commit adds extensive documentation of the new PCS subsystem and the
fwnode implementation with producer/consumer API.

> diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/=
pcs.rst
> new file mode 100644
> index 0000000000000..9436ba43cebdf
> --- /dev/null
> +++ b/Documentation/networking/pcs.rst

[ ... ]

> +Looking up PCS Devices (fwnode implementation)
> +-----------------------------------------------
> +
> +The lookup of a PCS device follows the common producer/consumer implemen=
tation
> +used by similar subsystem with a ``#pcs-cells`` on the producer and a
> +``pcs-handle`` property on the consumer::

[Severity: Low]
This isn't a bug, but there are a few minor grammatical and spelling errors=
 in
the newly added documentation. Should "subsystem" be "subsystems" here?

Additionally, a few other minor typos are present in this document:
- "The fwnode implementation expose" -> "exposes"
- "should be used to relase them" -> "release"
- "takes three arg" -> "takes three arguments"

[ ... ]

> +Late PCS registration handling
> +------------------------------
> +
> +It's possible that a PCS becomes available after the MAC finished probin=
g.
> +Contrary to the usual producer/consumer implementation, when a PCS is not
> +registered and can't be found, the fwnode parser helper returns ``-EINVA=
L``
> +instead of ``-EPROBE_DEFER``.
> +
> +This is to prevent race condition with particular devices that register
> +MAC and PCS with USB or PCIe and require the MAC to be registered before
> +the PCS.
> +
> +The phylink logic correctly handle this special case and keep the phylink
> +instance in a fail condition.

[Severity: High]
Is this description of the failure state accurate with the current
implementation?

Looking at phylink_create() in drivers/net/phy/phylink.c, if a PCS is
missing, it appears to abort the creation entirely:

phylink_create() {
    ...
    ret =3D phylink_fill_available_pcs(pl, config);
    if (ret) {
        kfree(pl);
        return ERR_PTR(ret);
    }
    ...
}

Similarly, if fwnode_phylink_pcs_parse() in drivers/net/pcs/pcs.c cannot
find a PCS, it returns an error:

fwnode_phylink_pcs_parse() {
    ...
    pcs =3D fwnode_pcs_get(fwnode, i);
    if (IS_ERR(pcs))
        return PTR_ERR(pcs);
    ...
}

If this error propagates up through the MAC driver's fill_available_pcs()
callback to phylink_fill_available_pcs(), wouldn't phylink_create()
immediately free the phylink instance and return the error before the late
registration notifier is ever registered?

Could you clarify how the instance is kept in a fail condition if it gets
freed during phylink_create()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609151212.2946=
9-1-ansuelsmth@gmail.com?part=3D6
