Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308293793B6
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238180; cv=none; b=ivlmQEFMhnhRIxGw0H85Sa//n6sEe576BLw+edAYEu/ZhkzKczKyak2NfMisCcgSIadJUCZAT7QcOnp5Uo9QQiEC/04a02RjvNnQCDcdSF5Jk2tjs9YaPc1ZmCpznFKPLRHbc0v5VRZaUH0UeEJni9yXwlXMsGfkoNtN7WZP0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238180; c=relaxed/simple;
	bh=reMvP84HquDzDOiNLGd3t3q2bcuVXXcuea0GAHVxOns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iz9cGVgUdB9gFK33SYZ65KSyKkj/yqPxWqiFpW6sftfQQgXSv0FQ2yLMFGbfY2uSqbD7LNrVz955XBee1mTD3YbvV5GTr5zGNFwcEXj4QxB5TTOG1Wqskt9Z6iHYuhvooaKN8W90I26ZeR3F17Pdg8asXY6kutHBpMc9oo0z8S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AO8MhvFx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AO8MhvFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C89D1F000E9;
	Tue,  1 Sep 2026 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238178;
	bh=gedbjL5ZRSpkCmo+vwdKTpAObmwB9brIXNP0tpyUb9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AO8MhvFxqNyd+nMPGmSOrogKWk+eQ+kaki0uZsYSPAs/YIZW1DnZXD/pAApiDfUxs
	 lJgDJQ2LUZDtfPeFzebUEkH74utHLVwsZFd+8ooEMsPRJ4vWl834kwmtbzOo/JRSMa
	 IW/tv+w3g5wtMBILUfxwAKhIdPriPxH0qG+aAD1MfspU8p+ZKvGbWMzOE0SpDEQkwQ
	 9FEfj14Bpyhs+uEhk8QBE7PWo+TbagCZ5N96nIj5ehjlxqSoJ9jJ6gzdJoZ/F82KrT
	 BR68ZrdSda2wkq17U7DhXzyXTFgVQrbY/dMHffzDAaXHEE3FUCjyQ8bFhGFbg/CXZv
	 sFA/461vAFI8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 4/5] net: dsa: motorcomm: Add LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831044818.4103477-5-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
 <20260831044818.4103477-5-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 04:49:37 +0000
Message-Id: <20260901044938.6C89D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Lockless Time-of-Check to Time-of-Use (TOCTOU) race when accessing=
 `dp->user` and `dp->conduit` leads to garbage pointers and Use-After-Free =
(UAF).
- [Medium] Flawed register state restoration in `yt921x_led_setup()` error =
path clobbers concurrent modifications and conflates valid register states =
with sentinels.
--

commit 47253868ab0bfc21ecc3dfb700f5599e47b8967c
Author: David Yang <mmyangfl@gmail.com>
Date:   Mon Aug 31 04:38:57 2026 +0000

    net: dsa: motorcomm: Add LED support

    This patch adds LED support for the Motorcomm YT9215 ethernet switch ch=
ip,
    allowing each port to declare up to 3 LEDs using the standard LEDs
    structure. Currently, only parallel mode and strict 1:1 mapping are
    supported.

> diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm=
/leds.c
> new file mode 100644
> index 0000000000000..7d3c0f68d8ffb
> --- /dev/null
> +++ b/drivers/net/dsa/motorcomm/leds.c
[ ... ]
> +static struct device * __maybe_unused
> +yt921x_cled_hw_control_get_device(struct led_classdev *led_cdev)
> +{
> +	struct yt921x_led *led =3D to_yt921x_led(led_cdev);
> +	struct yt921x_port *pp =3D to_yt921x_port(led);
> +	struct yt921x_priv *priv =3D to_yt921x_priv(pp);
> +	struct dsa_port *dp;
> +
> +	dp =3D dsa_to_port(&priv->ds, pp->index);
> +	if (!dp)
> +		return NULL;
> +
> +	if (dsa_port_is_user(dp))
> +		return !dp->user ? NULL : &dp->user->dev;
> +	if (dsa_port_is_cpu(dp))
> +		return !dp->conduit ? NULL : &dp->conduit->dev;

[Severity: High]
Can accessing dp->user and dp->conduit twice without READ_ONCE() or lock
protection lead to a lockless Time-of-Check to Time-of-Use (TOCTOU) race?

If dp->user is concurrently set to NULL by the DSA core during teardown,
the compiler can emit two separate loads. The second load could evaluate
as NULL, yielding an invalid offset pointer (&NULL->dev) and potentially
causing a kernel crash or Use-After-Free.

During the teardown window, dsa_port_teardown() destroys and frees the user
netdev before dsa_switch_teardown() invokes yt921x_dsa_teardown() to
unregister the LEDs.

Would it be safer to read these pointers into local variables once or use
READ_ONCE()?

[ ... ]
> +static int
> +yt921x_led_setup(struct yt921x_priv *priv, int port,
> +		 struct fwnode_handle *fwnode)
> +{
[ ... ]
> +	led2_val =3D U32_MAX;
> +	res =3D yt921x_reg_read(priv, YT921X_LED2_PORTn(port), &led2_val);
> +	if (res)
> +		goto revoke_led2;
> +	mask =3D YT921X_LED2_PORT_FORCEn_M(group);

[Severity: Medium]
Does using U32_MAX as a sentinel here prevent restoration if the hardware
register was legitimately set to 0xFFFFFFFF (all mask bits set)?

[ ... ]
> +revoke:
> +	mutex_lock(&priv->reg_lock);
> +revoke_led2:
> +	if (led2_val !=3D U32_MAX) {
> +		ret =3D yt921x_reg_write(priv, YT921X_LED2_PORTn(port), led2_val);

[Severity: Medium]
When restoring the register state here, the lock priv->reg_lock was
previously released prior to calling devm_led_classdev_register_ext().

Does the unconditional write-back of led2_val overwrite the entire register,
potentially destroying concurrent sysfs changes made to sibling LED groups
on the same port during the unlocked window?

Could we use yt921x_reg_update_bits() instead of a full register write to
only restore the specific mask bits modified by the failed initialization?

> +		if (ret)
> +			dev_err(dev,
> +				"Failed to restore %s for LED %02d:%02u: %d\n",
> +				"LED2_PORT", port, group, ret);
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831044818.4103=
477-1-mmyangfl@gmail.com?part=3D4
