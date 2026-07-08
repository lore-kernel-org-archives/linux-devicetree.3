Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3463D9695
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493006; cv=none; b=dSuSXq0zJBQOP1VVt4Z6VJUQdOnZ5zNC3WZ4u5YHLw8QI1el1MKsaEGGsKgbsMMjpuB2xvkixgqrgTGYg48Y8fNY7wZ4xZs6kPOQnxaMImg6rn5mB+h3PhM572t37djAfN+0MYde9otANTEn1VdbS54n7g2tNvc2e9Frhp5qUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493006; c=relaxed/simple;
	bh=za4/XoQPjNURV71y+gKtOYeMJDAyZk+EnYp336xgbp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YZ/zOnpO149P3T1M1Hv6NQCs8Pq9tzhEFBy/tGase6PNVcashK5sYVYIuhuw9M4qTSuvm8hwrfLnSOuL/IVHh10tii5+B24e5toL8RR99OEtYyyFe32yY30kpK8RwYH1FO3Uvry/QI3t0ALK6JwvkE93QXVwGOEeKUOSMCi9Y5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gk6xRoAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gk6xRoAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A661F00A3A;
	Wed,  8 Jul 2026 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493003;
	bh=WZ7nblhfyF573k+uxYzwqqyJQUKiVzBuwPiQ2pOlUsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gk6xRoAgti7IdRVn2pYkTEqvOthR5XJFi8mE6ECcQMjD25ggCQ6+I9PVZZdeNpWKQ
	 FQaqsfFr/jrplDcrhVVluijFE8IumelE06aOJ2XBr25x/7IXpJzYOM+NUhUJSHV3w/
	 HuYbJhIg75uA58CrxK/1S6MCAQ+pAeEe3w54xAm3NKT3Ii5+LWZ4pcHbBuc9t2TZ6U
	 M/9n/XQz6u6m1aurkTkK8SKtcG2nd6YIS3E5MI56qZcYI0KCckrYGMEFf6EQsqxSTc
	 0TLvo8tqxnhCAv5xBJ/VlcIfphHqyU5wR23MqQ62QwTlli6qvTCrJ3tkvt4f77ZNTm
	 VrjN2kzS2G0MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: ethernet: eswin: relax
 internal delay model to range-based constraints
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707064131.1282-1-lizhi2@eswincomputing.com>
References: <20260707064033.1265-1-lizhi2@eswincomputing.com>
 <20260707064131.1282-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 06:43:22 +0000
Message-Id: <20260708064323.73A661F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DT Binding and Driver mismatch: relaxed delay properties cause pro=
be failure.
--

--- Patch [1]: [PATCH net-next v10 1/4] dt-bindings: ethernet: eswin: relax=
 internal delay model to range-based constraints ---
commit 3dceaf931915c24887e11e00c0d85cb45cef4d39
Author: Zhi Li <lizhi2@eswincomputing.com>

dt-bindings: ethernet: eswin: relax internal delay model to range-based con=
straints

This commit relaxes internal delay constraints for the EIC7700 Ethernet
binding, replacing fixed enumerations with range-based definitions. It also
makes the rx-internal-delay-ps and tx-internal-delay-ps properties optional.

> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 65882ff79d8d7..4e02fedae5c67 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
[ ... ]
> @@ -105,8 +109,6 @@ required:
>    - phy-mode
>    - resets
>    - reset-names
> -  - rx-internal-delay-ps
> -  - tx-internal-delay-ps

[Severity: High]
With this change, the DT schema makes these properties optional. However, d=
oes
the eic7700-qos-eth driver still require them?

Looking at eic7700_dwmac_probe(), it appears to return an error if these
properties are missing:

drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:eic7700_dwmac_probe() {
    ...
	} else {
		return dev_err_probe(&pdev->dev, -EINVAL,
			"missing required property rx-internal-delay-ps\n");
	}
    ...
	} else {
		return dev_err_probe(&pdev->dev, -EINVAL,
			"missing required property tx-internal-delay-ps\n");
	}
    ...
}

Will this cause the probe to fail if a device tree omits these properties,
as permitted by the updated schema?

>    - eswin,hsp-sp-csr
> =20
>  unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707064033.1265=
-1-lizhi2@eswincomputing.com?part=3D1
