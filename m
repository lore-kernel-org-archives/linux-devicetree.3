Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8B47D922
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628445; cv=none; b=U9fwXGRF2CKVqn8PoBT8NovHb5KJlkamVanoala5Eut7sKqxixewkNDkJQVmqFvrLKKYo5ng5ejNt/bINr/dW2Ok5CCx1Aup3ZJzc/15qgcl6dr78FFqeOAa5FM9+1m/QuAHu0Lm+SLZSQ12rzsOtEUWXvat9jQ/bPL6e6b6F4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628445; c=relaxed/simple;
	bh=jIlVfbz0mvrGrFjO5Ek8ENdNUZeyPNgTFQ9J1GhDPsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJ9tJX23rd0gr9lWY8MaRJOb6COXr03qE9AISltUP9YvneVWqIZlShQMuyknEG4HLEM4mJK+X5cUONFs0xRi+pn7OhmM8eKFgjPDpMRSz/Mr8loD54b9yCtjODSNnsfnqn53v6aWMY28YfnydURQtGmRBjiutiae3EgI7W4qdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFvlTuqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFvlTuqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18F51F00A3A;
	Thu, 13 Aug 2026 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628444;
	bh=PPo/mxS5sn6EFnDcWrkuFrUPGoLpwxD7+MuFGb1+RHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VFvlTuqmzDsYBP0INsOkoLYBo1FWL+0fDmt53V4FnUy6odYiuV+XRbnEtkvnjwBSN
	 7xxusCzt1a9RFvWvuuNakBlZCXEGKnvPOBrj0uUF58CmSza1x+LvPOoj9lOpkI/rC2
	 QozIpc0qyUn/M00RtZmukJ9zDiwV0hSmLwllKhXwq7f+1H8O/8w6GnmyxFNQoaQKNf
	 AGRpj6zI17Xq75O35D4VFPGN8lAYsu5ssGrNgh8ozvEuHwFtJTnrM3uT8LjJQjU8p1
	 Zg8ELco3urbgJXmakQkP3eq7N+5TTIz5RTLamG88o8zx5fAYxMUounQhpASB7tiCsE
	 oHtANET0+WJkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/4 net-next?] net: dsa: b53: prefer CPU port 8 for
 Northstar devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812132755.32585-2-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
 <20260812132755.32585-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 13:40:43 +0000
Message-Id: <20260813134043.F18F51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing NULL pointer check on the result of `dsa_to_port()` before=
 passing it to `dsa_port_is_cpu()`, leading to a potential NULL pointer der=
eference.
--

--- Patch [2]: [PATCH V3 2/4 net-next?] net: dsa: b53: prefer CPU port 8 fo=
r Northstar devices ---
commit 2ae0d011f243e38dabfab275559b868d62bf66f6
Author: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

net: dsa: b53: prefer CPU port 8 for Northstar devices

This patch prefers CPU port 8 if available for Northstar devices. Ports
5 and 7 have limitations with CPU trapping features compared to port 8.

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 5fd8362d04304..052812d2faa93 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c

[ ... ]

> +static struct dsa_port *b53_preferred_default_local_cpu_port(struct dsa_=
switch *ds)
> +{
> +	struct b53_device *dev =3D ds->priv;
> +	struct dsa_port *cpu_dp;

[ ... ]

> +	if (is5301x(dev)) {
> +		cpu_dp =3D dsa_to_port(ds, B53_CPU_PORT);
> +
> +		if (dsa_port_is_cpu(cpu_dp))

[Severity: High]
Does this code risk a NULL pointer dereference during device probe?

If a Northstar SoC is configured without port 8 (for example, in setups
using only port 5 or 7 as the CPU port), dsa_to_port() will return NULL.
The dsa_port_is_cpu() function dereferences the passed port pointer directl=
y:

include/net/dsa.h:dsa_port_is_cpu() {
	return port->type =3D=3D DSA_PORT_TYPE_CPU;
}

Passing NULL to dsa_port_is_cpu() would cause a panic. Could cpu_dp be
checked for NULL before calling dsa_port_is_cpu()?

> +			return cpu_dp;
> +	}
> +
> +	return NULL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812132755.3258=
5-1-zajec5@gmail.com?part=3D2
