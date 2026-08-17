Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7C3E63B0
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995600; cv=none; b=BEA5e+kUEINMCLLG7ISolcs+2fGgyPmcSfC9SFya4cIAu7aKHikK/k15dpzKQaQ3fL7Mc7r4+Xg0bezZ+kXYZhvyVV0qQqmmelL4X4LlL0pLCQsZo7LrEhzlnNNUB5TfnIJoLnwL1TZBQgqvh6FJmH3WH6yZ4oyFJYjbQpO2juY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995600; c=relaxed/simple;
	bh=zZ4hYJe87nz/rCzbp8PxTBM6sLDrfoaj1vRD3/L8Emw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aU0WG49iZl7/iM86Hr9m4ryUOn++pAQ3lThNPVOp1pXvcNj+T7Vv+QC/ca9Ni+sLU4UV7Mks3D9XAwbQg7PGuoIuqmBOhOGJrViv9iwBiNWuIJACcTXn2mScB54SztYbv9vpGvwoiVKX7/vUshmwPQ3RQvF6JSOC3MSSr+9yLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsiL/E6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsiL/E6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06111F000E9;
	Mon, 17 Aug 2026 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995599;
	bh=tfofchdZvnUpacIIGFv0iVI4o4/ifXM0HTqkS1Wrb48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsiL/E6c6OFCyJVERfPHPo81+JS3HyBc3f/rH2j7C+bHMwLl5f8HNqBhInVKfz57g
	 ILSKv8ep08Wwqq9KsSQ6D+yGb+wyvkht4jQkH7MsnprWfaE6TZ90mc8N6CRrEwmVCm
	 x35vnigOr+6rHmTzo+Iv9q9iGoLXBxKXGTN9a/qSRpL3Z9l014Eb4v+jItktsaC2E6
	 3JC3Z93mz7GN7K86yl1hUgX8t0Oq1k9MjZeyXsymmNO194oIp/T0jKAFGi7E21Adp5
	 sK6qHd5jobrHeV4SaE4T26v7+nbrTpl0DtusPx/IYGaYY9bNiM9Rug+snf29u9QQey
	 otgALxvC2pgZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 3/4] net: dsa: motorcomm: Add LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260816193905.218112-4-mmyangfl@gmail.com>
References: <20260816193905.218112-1-mmyangfl@gmail.com>
 <20260816193905.218112-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 19:39:58 +0000
Message-Id: <20260817193958.E06111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Unconditional kernel panic during probe due to pointer arithme=
tic on NULL net_device pointers in yt921x_cled_hw_control_get_device().
--

--- Patch [3]: [PATCH net-next v10 3/4] net: dsa: motorcomm: Add LED suppor=
t ---
commit 25a5fb03fc03b52bd3ea80525b1fd57bd6de812d
Author: David Yang <mmyangfl@gmail.com>

net: dsa: motorcomm: Add LED support

This commit adds support for controlling the LEDs attached to the
Motorcomm YT9215 switch chips via the standard LEDs subsystem. It
currently supports parallel mode and strict 1:1 mapping.

> diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm=
/leds.c
> new file mode 100644
> index 0000000000000..e7ef0ef80a266
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
> +		return &dp->user->dev;
> +	if (dsa_port_is_cpu(dp))
> +		return &dp->conduit->dev;

[Severity: Critical]
Could this cause a kernel panic during probe if dp->user or dp->conduit is
NULL?

When the hw_control_trigger is set to netdev during driver setup, the LED
core immediately activates the netdev trigger, which in turn calls
yt921x_cled_hw_control_get_device().

At this point during probe, the user ports are not fully instantiated yet,
meaning dp->user is NULL. Unconditionally returning &dp->user->dev performs
pointer arithmetic on the NULL pointer, yielding a non-zero invalid pointer
because dev is located at an offset within struct net_device.

The netdev trigger core evaluates this pointer as true and calls to_net_dev=
()
on it, which subtracts the offset and yields exactly NULL. It then attempts
to dereference the network device name, crashing the kernel.

Does this need an explicit check to verify dp->user and dp->conduit are val=
id
pointers before accessing their dev members?

> +
> +	return NULL;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816193905.2181=
12-1-mmyangfl@gmail.com?part=3D3
