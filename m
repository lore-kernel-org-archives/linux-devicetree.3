Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50368442391
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543163; cv=none; b=gMOA62pHWK4fsjc2e6AEmETOLfn1zZKzNDbq10+BWbG+8KsURmz6/g0tz0jfFpHpvjnnSg/7fyc6KNncSRjjh5U918ZWtyuatdiGAX4G9LE5PsWR4T8dJUReDFA211vlhd68ExsjRaqbjwJomCQApO5NTzHpji0hDeekW2UWSe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543163; c=relaxed/simple;
	bh=tilXyEfjKX7qcprBsO0gsR5w3+JkENZ9mONk2BqKV0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uqODwbOtj4zIGwjaqfsG7rtFix4IWG4/ghPa/+6jqwMBAxXFCKDsrKZbINby18Ascxn3gkAzFBslbZuntVGG7jVP9HwYHtKvMfIYuh3syfS/iBDMMH0QO5XXwKG7PhSLMXt6/IVlh4j1QhzX399Dj6t98P80Y4L+td+ZivYPa7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqF760Pj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqF760Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026271F000FF;
	Wed, 16 Sep 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543151;
	bh=QccWB28oDNQfYwFucGmmMeuyUkJzgIMhsdJ212o+VdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqF760PjB1YUxwt7bBlapvCWu1TeUsbKIa5O6TIxa+BFUa3J1fQYPKY/qAg7oBMn+
	 SzRxUnpb9ulFWdxOzUjpAN5FjQQr13j6va2VaZTRIDOgab2ljMQOBjxJlzldOK228b
	 gH3knfpw0pWsSLkmSfsNFJxx1QSiCZJ7tYb50ps7VM9VoTIK8naXU/bSJ/aibIqbvX
	 hSKS7cT7jeHBj6uYVmZEsoRPBYXq/2MHtjOGHvk+iTTOib0+zuT0tMarI5jdiVsL9x
	 Ocjxq9zu+UXGtK8YNutfLkH2FeG3Ka2So8kMciK+2uovWahLXA87mfZ3Xvw9T7AKm1
	 vzFwCqCpr1Y3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260916070728.1088801-5-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:19:10 +0000
Message-Id: <20260916071911.026271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: driver-specific header placed in global include/linux/mfd/ dir=
ectory
--

commit a438f0b95d49f5ecec43cd168683969eca161362
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
family of multiport I3C hub devices. These devices connect to a host via
I3C/I2C/SMBus and expose multiple downstream target ports.

> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..eb4792de5440e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,41 @@
[ ... ]
> +struct p3h2x4x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	/* Number of downstream target ports (4 or 8). */
> +	u8 num_target_ports;
> +	/* Serializes protected register unlock/lock sequences across MFD child=
ren. */
> +	struct mutex protected_reg_lock;
> +	/* Hub context for the IBI handler to reach hub state via the parent i3=
cdev. */
> +	struct p3h2x4x_i3c_hub_dev *i3c_hub_priv;
> +};
> +#endif /* _LINUX_MFD_P3H2840_H */

[Severity: Low]
Should this driver-specific header be moved to drivers/mfd/ rather than bei=
ng
placed in the global include/linux/mfd/ directory?

The MFD subsystem guidelines state that driver-specific headers should not =
be
placed in the global include directory if they are only used by the parent =
and
its immediate children. Since struct p3h2x4x is only shared between the par=
ent
and its regulator/i3c-hub children, does it belong in the local drivers/mfd/
directory instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D4
