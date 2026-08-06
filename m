Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E26314A65
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978362; cv=none; b=MgSutcZdhnyiWe3AT7fZK+qwpZ03Zolk0YGOFgipzPvfSOYZ9NrHDnKo2n+6y+9j9X1B9yDC8plB0dX8z8gJSQxd5OOC7Am8NwHU7LrMt1mOhzi9NtGXqbte4LpgGen6zzADTO4qvd2f+JpwbdhZTqwVct+s72Enoij2A94Z8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978362; c=relaxed/simple;
	bh=7WFS8ZT8uOj1K1OZ/p7ZOzvlUTIQXllnK6dSgbBGQjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eaEb2R5n7LIYaq7EKDqvzUY9C6zbMkO0A1zPaurFBw+mTP4x/9Qry/9+i6K4MstWZPn/2pa4SFmJCZCi9QkbJQXIkSHo/VpXJuxkpUpSwm09dOV8ZknES1ymoSfDDwgBQwlAH26+lhOwAv15nhfBmc84sShpXUXNZb7QRhNupM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgmFSPGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgmFSPGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA19D1F000E9;
	Thu,  6 Aug 2026 01:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978360;
	bh=9hOzuGjjGGWMSmGlEJAsyhIpMd/6qMyXfSD9Z2Q/CNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EgmFSPGu8hbbG13qmFJnPBI6/4SPmXBfoOiIHu4fHbecSaZ4MPJ5JFrzPOd26uym7
	 7IZqZhMaZxsuRB900v2upO65M36KVSrplC0eahjE7KMZ2NIA27J1BKy9OCNQku52cK
	 DK2dWHacRMkapkpCUfiN6Ce8z7p4ifWRy4dWQUTGY+EqMMQBm1TFnHaPbIEZV/ZRMZ
	 dV+h7+hZuksTcYHXtX9E1j8UgaPX/ArB70Xf4tF3V3Rq0lz++Fqs0TUZYZW1lkXXOg
	 IW1YITIFM58K7yhMPdMFk6AYWnZXQ27jzvO7WSJgdIGX2dIPTuac9ZQSoQB5oV1+fH
	 hw4YuDAxdAHTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-6-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-6-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 01:05:59 +0000
Message-Id: <20260806010559.DA19D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Introduction of sleeping functions in an atomic context path.
--

--- Patch [6]: [PATCH v10 06/21] drm/bridge: synopsys: dw-dp: Fix AUX trans=
fer timeout race condition ---
commit d9773e559779aae316ddae4c1be0ff35a50eceda
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix AUX transfer timeout race condition

This commit fixes a potential race condition when an AUX transfer times
out and the interrupt fires immediately after. It re-initializes the
completion before sending the AUX command and handles pending interrupts
and timeouts by resetting the AUX controller.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 535af11e617c4..a7830e178f4e1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -1492,6 +1494,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_au=
x *aux,
>  	status =3D wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
> +		usleep_range(10, 20);
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
> +		synchronize_irq(dp->irq);

[Severity: Medium]
Does this introduce sleeping functions into an atomic context path?

The dw_dp_aux_transfer() function is called during DPCD read operations,
which can be reached from the bridge's atomic enable callback:

dw_dp_bridge_atomic_enable()
  dw_dp_link_enable()
    dw_dp_link_train()
      drm_dp_dpcd_read()
        dw_dp_aux_transfer()

Encoder and bridge atomic enable/disable callbacks execute in an atomic
context where sleeping is forbidden. While wait_for_completion_timeout()
was already present in this path, calling usleep_range() and
synchronize_irq() introduces additional sleeping functions into a path
that may be executed during atomic commits.

>  		return -ETIMEDOUT;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D6
