Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3E56C63B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969450; cv=none; b=qbAKbf/Bpd8zkbiXg05sZy9+YRhZfM/tcqhKL6b6znktoaIwRS0IUBPcrXWjY5K/aOn+azFrzpCRYt45eRYCIZO3tqrdk1fdNMOBXV/lzRwP2fVm3ZMawWrwlVgs964UdycgCumHjVhlVh4i3RXwv4bj71sAp5/qJnfjJTL1ZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969450; c=relaxed/simple;
	bh=zqOSWqDxtLKtahcBuNJJ7RWJoLR6Ukzt5/jWJaTXFnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tEmYECxSaIQWL2CIg65UoGzCIkjDwyJYAG/Trc/em5IcCvv+Xs0zn15HR9Z6JlH1JoHYmUBrRAVybVaCgeFjevU2LlanreJGyMYaWDJ/R/BRPI9Y6rmMwKaHBW9xHnfzfwkq5arI0R0M9aMLf8l+Tw9Vg/M3kgCIaE+/TfXwqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQJc6xFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQJc6xFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2524B1F00A3A;
	Wed,  9 Sep 2026 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969449;
	bh=gzotJtRomkwUZ2OswHoazMkXTP+DigIzGir6CLG+Frc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQJc6xFqtt3qsz1dCXAmfvXctYVP4YM4yeAuYJc+dSboGwMjnJEAy9Mb/3biQzAS5
	 O/BL97+ERUnhOZV1rZxLXpR1kvBIJYNbJwI1Tu+pWDtRuQAlhNiUqE78fSTAReMNlz
	 x5jOIAQbSr/zWWsXBTzHQ9W0GHdmGn+gUbXmGiM+SKP+7jLc+QBx4wD3NIK8rWq39z
	 GE1j2GtKosi5eNCHeAnZ7nqMfX9wOVO0px2ZZEob6yTnZ3mYQBPzC+R0Nb4I73h9JC
	 onJTP3xVXVv11NIh/4QwAYcvAoKWt6ovfJQrMeI7NiGCDls8GXHyWU2qhneUNvNcN/
	 RuQvpVN1PDUaQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v2 7/7] net: mdio: en8811h: add the nested
 bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908155707.4164559-8-f@lex.la>
References: <20260908155707.4164559-1-f@lex.la>
 <20260908155707.4164559-8-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:57:28 +0000
Message-Id: <20260909155729.2524B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using queue_delayed_work with 0 delay fails to execute an alread=
y-pending work immediately on resume.
--

commit e2ee026254e8a2afcaea891df04e388738201fc8
Author: Aleksei Sviridkin <f@lex.la>

net: mdio: en8811h: add the nested bus

This commit registers the PHY on a child bus so that the device tree can
describe it normally and the MCU can keep ownership of the reset line. It
introduces a two-phase download mechanism to allow retrying firmware loads.

> diff --git a/drivers/net/mdio/mdio-airoha-en8811h.c b/drivers/net/mdio/md=
io-airoha-en8811h.c
> index d94d74d85f10d..7224558914727 100644
> --- a/drivers/net/mdio/mdio-airoha-en8811h.c
> +++ b/drivers/net/mdio/mdio-airoha-en8811h.c
[ ... ]
> @@ -150,23 +309,43 @@ static void en8811h_mcu_remove(struct mdio_device *=
mdiodev)
[ ... ]
>  static int en8811h_mcu_resume(struct device *dev)
>  {
>  	struct en8811h_mcu *mcu =3D dev_get_drvdata(dev);
[ ... ]
> +	if (ret < 0) {
> +		/* The reload restores this chip, not the PHY below it: its
> +		 * own resume has already failed by then and nothing calls
> +		 * phy_init_hw() twice.
> +		 */
> +		dev_err(dev, "firmware not restored, reloading: %pe\n",
> +			ERR_PTR(ret));
> +		mcu->fw_running =3D false;
> +		mcu->poll_ms =3D EN8811H_FW_POLL_MIN_MS;
> +		mcu->waited_ms =3D 0;
> +		mcu->warned =3D false;
> +		queue_delayed_work(system_freezable_wq, &mcu->fw_poll, 0);

[Severity: Medium]
Since queue_delayed_work() won't change the timeout of an already pending w=
ork,
does this leave the work scheduled with its previous timeout (which can be =
up to
30 seconds due to the exponential backoff) instead of executing immediately?

If the firmware load fails on resume while fw_poll was already pending (e.g=
.,
bus registration is deferring and in its backoff cycle), the retry poll mig=
ht
be delayed significantly instead of executing immediately.

Should this use mod_delayed_work() instead to force the immediate execution=
 of
a pending timer?

> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908155707.4164=
559-1-f@lex.la?part=3D7
