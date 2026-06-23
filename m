Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18333B6ED
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199202; cv=none; b=NHtaP7HvBXOfWWvn1XS8heuTT4jUruvnVAM4tFJrjIU5K3VScA0HsBOKEXkX1US273n9dRE3cWtlACuKojA4TpYc6v3NuJijP3NVcIChqrIJmUSaLoZZ0JUUy6NMuRxDjB2wRltcz5zOAQpDmmynlZ3LLZ/Z0jrg0lwjD6oZJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199202; c=relaxed/simple;
	bh=Jv50Kx9GhGw41m3OImTRci3d3sIpvAT9Auwoxe52Bsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EcOOQyKYKrjrIZzMlrRJeprbwNo5eDJ7Mvf9Q4BAqOWjMpczkBVjQ7qUq5ipX8dT+6xikiI3Lo+8Ja5OJi0ov3td8YefNvU5d8TA1s/+6Ym466NVKCchjEQQ7ov9DoK8ZYQ20igLwKEYsTD9/5zmCYLJMHL4XR11GY/zzAVSNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltMLI6dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltMLI6dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB5E1F000E9;
	Tue, 23 Jun 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782199201;
	bh=Sq/p59OX6mtZcWts6k4FZREfqlvDZ5gmNchxS8DYlHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ltMLI6dq/o4urA3T1qd/fS7pkdrKO9/KD2Ior0ldSPRru+5b6B8De7TyTRw0GGbyV
	 VgSu3Ulhfvk3lzqxRgYyLsCFO4QvoaMptT0z0RSqadiFIwm0Rcq6mqYvgcqAlpYJpK
	 ejzwEzCkZKpbNgfwaLxm30N9rqIUg+ZdW+PCR3Nu+0R8F88HmspfASuuLt8Fr83Oa6
	 YLEMTHTIPJntuaOmd3Bac5xgBxledLBQs9xPCVccGk/C7Kv7xIl+3chtzOLUvdwN4S
	 3185Fd2Orn7j4yZE8uY9NqZ47+mUbGa4KzBxeXUqrEE0bd0MnJlblaBSFJmaJtnkV6
	 JQO5RPjASxBUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623070805.211019-4-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
 <20260623070805.211019-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:20:00 +0000
Message-Id: <20260623072000.DAB5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `sky1_audss_reset_status()` incorrectly reports the reset state du=
e to an inverted active-low logic check, violating the reset controller API.
--

commit 432f7b3656f374ab11511fbdd94e2169a520d3bc
Author: Joakim Zhang <joakim.zhang@cixtech.com>

reset: cix: add sky1 audss auxiliary reset driver

This patch adds an auxiliary reset controller driver for the Cix Sky1 AUDSS
CRU. It registers 16 software reset lines for audio peripherals that are
controlled through a single register.

> diff --git a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..20870f37d7d73
> --- /dev/null
> +++ b/drivers/reset/reset-sky1-audss.c

[ ... ]

> +static int sky1_audss_reset_set(struct reset_controller_dev *rcdev,
> +				unsigned long id, bool assert)
> +{
> +	struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> +	const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> +	unsigned int value =3D assert ? 0 : signal->mask;
> +
> +	return regmap_update_bits(priv->regmap, signal->offset, signal->mask, v=
alue);
> +}

[ ... ]

> +static int sky1_audss_reset_status(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> +	const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> +	unsigned int value;
> +
> +	regmap_read(priv->regmap, signal->offset, &value);
> +	return !!(value & signal->mask);

[Severity: High]
Since sky1_audss_reset_set() establishes that the hardware uses active-low
logic by writing 0 when assert is true, does this status function return an
inverted result?

The reset controller API requires returning a positive value when the line
is asserted and zero when deasserted. Should the return statement be invert=
ed
to !(value & signal->mask) to correctly report the asserted state?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623070805.2110=
19-1-joakim.zhang@cixtech.com?part=3D3
