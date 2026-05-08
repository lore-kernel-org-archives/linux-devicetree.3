Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20CB3242D8
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266221; cv=none; b=un6JEJRlBhjbjhhj6RdTlJz8I4zm5j8nVLtz2IBl+FjcUU1a6iuEWUZy5MQD82HDTXFMdzPGDLmngutRmO6FGW2YlwxS+pTe8LFU9kapcWab4o01l39sKMntEIy2dqPEA5ABR1ZTLXkUS1ThqhfJsmyBD4WXs+Ztr0d5jREXL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266221; c=relaxed/simple;
	bh=k9g6czpTMAQBkdxM3irMve1cQTLzPh3ekKO3bhweQ2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tsuPkUvLEobbN8T4WC1bszYGIvbqHfx1cUgFt3pl3px8F2iwAWpo6zPqV8v4jF4eafV/B+4FndWiPgbKJyb4m2y/zAJt8yTHo0slcGvqfcW19E0hWysoMaY3gDMNsc+JQhsDmHqDnhW/+8QWtRYoPq8m8/jxtnS3tqt95MbYZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ka2sQJ4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ka2sQJ4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB40C2BCB0;
	Fri,  8 May 2026 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778266221;
	bh=k9g6czpTMAQBkdxM3irMve1cQTLzPh3ekKO3bhweQ2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ka2sQJ4W7KbElwQ/q1PmRhO/6AsTg6uDBWPzEo/K01WFu2nXULHbVDWnOAtW6l6sl
	 ImqkGXjQwmClnAiyCESsXSD4r2Xfj4n6FGTCSeyCfYxUdy8tYlfCSRJ1pynBrfyZqA
	 NETYeAlYCINt5b+YIQrmF0uqKESwZz1UkbLQWmplTYAgx1esCDIxyQ9DDimdELVf36
	 wMCI2QojG5HRr1q4JQSEceqD1GqW/WpbqzjMi/nwQgZWseT6Amw0b2xU5vm6QsZKre
	 HMm88M2t9AT0njM8C0MN5Qe+7RFuXuNtLXrIghTtBPMmYZOlJjSZJBaQTS0Ul1W1C1
	 KfhOKL+7kisVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/15] can: grcan: Add clock handling
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508070121.6918-5-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-5-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 18:50:20 +0000
Message-Id: <20260508185021.1DB40C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The fallback clock is acquired with `devm_clk_get()` but is never =
prepared or enabled.
- [Low] The deferred probe log suppression provided by `dev_err_probe()` is=
 defeated by an unconditional `dev_err()` at the `exit_error` label.
--

commit e67893a17ab7e0f12006c5fe41c33d231ab03961
Author: Daniel Hellstrom <daniel@gaisler.com>

can: grcan: Add clock handling

This commit adds clock handling and error messages to provide a fallback
for when the freq device tree property is missing.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
[ ... ]
> @@ -1662,8 +1663,19 @@ static int grcan_probe(struct platform_device *ofd=
ev)
> =20
>  	err =3D of_property_read_u32(np, "freq", &ambafreq);
>  	if (err) {
> -		dev_err(&ofdev->dev, "unable to fetch \"freq\" property\n");
> -		goto exit_error;
> +		clk =3D devm_clk_get(&ofdev->dev, NULL);

Does this code need to prepare and enable the clock?

When acquired via the Common Clock Framework, merely reading the rate
with clk_get_rate() does not increment the enable count. If the clock is
gateable, the late initcall clk_disable_unused might disable it, which
can lead to a system crash or bus lockup when accessing the CAN controller
registers.

Would devm_clk_get_enabled() be more appropriate here?

> +		if (IS_ERR(clk)) {
> +			dev_err_probe(&ofdev->dev, PTR_ERR(clk),
> +				      "Failed both to get \"freq\" property and clock for fallback\n=
");
> +			err =3D PTR_ERR(clk);
> +			goto exit_error;

Does this goto defeat the deferred probe log suppression?

If devm_clk_get returns -EPROBE_DEFER, dev_err_probe() correctly suppresses
its own log message. However, jumping to the exit_error label unconditional=
ly
calls dev_err(), which will log the probe deferral anyway:

exit_error:
	dev_err(&ofdev->dev,
		"%s socket CAN driver initialization failed with error %d\n",
		DRV_NAME, err);
	return err;

Since no manual resource cleanup is required at this stage of the probe
function, could the driver directly return the result of dev_err_probe()
instead?

> +		}
> +
> +		ambafreq =3D clk_get_rate(clk);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D4
