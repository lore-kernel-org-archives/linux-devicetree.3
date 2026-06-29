Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492922D8378
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726380; cv=none; b=YSpOFJzLo9z3CODAz0dJ1k3brm3hb1CC9qnHsRxLcXqhUVFI3QHXy+K2dpLe/6Cx9bdE1dfvNe1+HctZlvDiVXEV/Hrh2dUOYcwp8NLmV9UyNrh8mfzhj1V4jOZi79HKXzgTtQj583JhyDChp/D2idhOBSaWgrMsZ2acGyhgio8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726380; c=relaxed/simple;
	bh=VUJY0F6TEfvmEj7MhniAxOzSwvm6T9J5HPtogoNxxAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpOLVI8DqDZ4p1GRVyce+dv7xpbCP/mjjzjOfmaGd5BDMTL7gtflNE+7pCSPOowCBG5DLp/iUhDRYi96aSj3BvVEGx/Am1LHzOFZnGKUVe8WIZmpYM8REurdDMLvd8fiRBPQrAr6QE2TZspuKsU0gv1VOn8oD+tlFTlg5QWT6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnbyMC97; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnbyMC97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346761F000E9;
	Mon, 29 Jun 2026 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726378;
	bh=/qZVJxS1xQI1ZixOWHXjPSV0uCJAmkBjvOvupXcfOT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VnbyMC97iiQkdkMMu4WNeYpUDPsCFGe3tEXqVsEjNTf7dGn7RtgoRPRgvgivrJYTd
	 8Q9JymjfduVp/VnaDmlEGLOCuuTQEAUA/cA5HfsiiQPq4bDW6nOEXRcsp9f7vxME6O
	 rGe8yjQ3i89dMXIkLeb7r8KLeD2Aw0FXkeNBqtbepoCXAZov8/LB+0QEw9TnOeqSOL
	 PbMvkJCRdEiZtjHsREPbls8L9czqxJ1/PsRwv4JYbp5w9PFKcKlF2Ne77EqkmW5uN/
	 dwNrxhdIw4pj4ZwbwRgeBSEtc4igPxLYuqGmSjjaMYH39917wtTpOUFTMG591TIBjA
	 lAvJKHfwl1W+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629091500.52540-4-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
 <20260629091500.52540-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:46:17 +0000
Message-Id: <20260629094618.346761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing PM runtime management causes system hangs or failures when=
 accessing reset registers while the parent CRU is suspended.
--

commit 9e37ffe1b0a7e10201a5f5d87d450b05d374b858
Author: Joakim Zhang <joakim.zhang@cixtech.com>

reset: cix: add sky1 audss auxiliary reset driver

This commit adds an auxiliary reset controller driver for the AUDSS CRU. It
manages sixteen software reset lines for audio subsystem peripherals via a
single register in the CRU register map.

> diff --git a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..d31d80e1251a8
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

[Severity: High]
Can this cause a synchronous external abort or bus hang if the parent CRU is
currently suspended?

It appears sky1_audss_reset_set() accesses the parent's regmap without
acquiring a PM runtime reference to ensure the CRU is awake. If a consumer
device calls reset_control_assert() or reset_control_deassert() while the
CRU is in runtime suspend, this MMIO access will hit a powered-down block.

> +}

[ ... ]

> +static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D sky1_audss_reset_set(rcdev, id, false);

[Severity: High]
Because the driver does not keep a PM runtime reference while the line is
deasserted, could the parent CRU suspend and lose the deasserted state?

If a consumer deasserts its reset and then allows the subsystem to idle, the
CRU could suspend. This would reset the block and silently lose the state of
the AUDSS_SW_RST register when the CRU wakes back up.

> +	if (ret)
> +		return ret;
> +
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091500.5254=
0-1-joakim.zhang@cixtech.com?part=3D3
