Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5F46D2DD
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425739; cv=none; b=bOfoY73+ZziVOJrubdCCeOUyf1+xjrQ7bLUfPKFljhV/XXN5AIsfLGQgy4B3enD6Eq91xzYdp1OygnzgRAZwU4VkyKIV9n2YYKtdjoq3PuPDZxfzrg1dT82shzQRZ88rYORB6gHIoxWF7C9mv5kuY7qrS+KOtc+ntgXVXYI+xUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425739; c=relaxed/simple;
	bh=YKJfUdy5n6ffaKk39SK9sft7LcFnAbfH3T12ej/97pA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PuyLfLhmHWOoFil3OYOpc5DLiYw1EBg23Cj89hNuVJK/BO/Lql5alc5phjjM6KBok/gCii1vkmzZ2nWmxzXRub7O+kjSy6bvpl5b8eHUbOW153zaJWHeEOecVno0tDOOmQdEYMF6cuIEdtmK8LNd/UQZJ6LUf3/JWYICQbn2/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UjRro5D9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UjRro5D9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22257145e9.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788425735; x=1789030535; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lSve4FkJxmYJyxkKw1zIr74/VC3uYwUbpdZi1aoEPL4=;
        b=UjRro5D9SFd8INEOr126MoDwl1jtOvp+E6FiNzMcrqm5KFD18HPXnw1KPYtyx4Zo1J
         H7RAAnW14vekCbko1DLx1/pxCkY7V5JW5b3CTNuFT4dAVw1SJIc+ANtdEIiqBMnUUu1F
         ah0sSHXZ0JaxB4BrFjMnoEEmek6vNAufCdwgh40/jpsJFSHQ5gT8UYEqzOMA8NAqFwDp
         oYIBEQe+gVW4zkK3PYjtfEvF/PJNhIkYCTzQnAe1y/zH2mJxbP0cR+1EnS4L+Z4M1SzA
         Vw8FkxeW2bpctaruOlBmaOIRm3NAARvaIoYzo8NvboOB4m3ubLuRedpVR9C0YimaJkhO
         ToDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425735; x=1789030535;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lSve4FkJxmYJyxkKw1zIr74/VC3uYwUbpdZi1aoEPL4=;
        b=j0W2Tsw5d3V6jKrOgL6Zy8FCISvbNDmAw2yTGTlAp1zd2n7ZDjV7mUMSDo8IoWZRqG
         bCES8N6Lx6xp5etW1ds2s5XQvObU/yeETp4emirm6WqcT38H9v4zXXj3omP7OKCEEjwY
         iSlU0M8tPtK4hYNJgQhhBt3tPWcn6xzoN8h3LTkBoR7yOykKT09r0olGrNqQ07rZP63p
         ZvRVj/wOKhm2RmZvW+GukJY9P1HzSAAJlCqxaE+Bj9A14jyAkOA5GNvrjTy4eAcS4Xt7
         QIo8+5A0lMapU9RUJ46Xts+0/vFiidtKsUhcnVp1Z+PMMYocj3ZywS9a0XPukmLwpYsn
         c+ag==
X-Forwarded-Encrypted: i=1; AKwUvBw2w31nYRSkPlLGAAwOnDvAmsLgy5H8wWXrpvVIL1Spq9CCjmkojBoQhqxbyV/hO+zwYwdpUAHZjarJ@vger.kernel.org
X-Gm-Message-State: AFuF++njYpsm2jCOZkMhC2b1kvfPJEfTHishSwmKPelSuAcEcA89VNxG
	wn/wrEjy97dg/9K/QL6XFLINyBUmqBR3N9SUqgY0kq+pc/ZxJBA5nllVacnrE+f9fgY=
X-Gm-Gg: AYBFou3IUXCip30+YWc1x73Vwz0Y9gmeXK6FDufn/QO6KNGf51S4/hlfttGaCx5MNwO
	vZYZGPFfg/iaO76I9I0LpurySl36PS1VrkF0M1qlr3Ndk+1HPjDLxOXgO3CZSbq3/KJ6rij30Y5
	PJ2QX73Na6zG6VhAR9YIFMYT7XaK/IVoZCi9mbKsJWLYRh2wFPJd04qyKX67BI80gV/csyeL6Jr
	isfgq77oojklpCny0X1RBvUKP/z2n/qeXT0jpDJpk2Z8pQHOb3hZZC/dzRWZgrt4J2A+8C1/4Hd
	r1/yo5TFf6siKo5tMeJ8w7QPfiMlzAk2Iz6PRo4MW7HUkOMzp7zIOiKD/IJMyjlI4ZjRHcaHrRz
	T65OAMeBhVAMj/Ezjf8/ua0x90bRCdRmRbmB8E0Il3ORnOhtwgi3EQHjSjTprtz8nOPdkOCEoVB
	R7RVjAFQEaHysoMxPjG5zc1V0y2K1Lw7QHKtYZVbM0x6Z9A6WfsTAZCmqa
X-Received: by 2002:a05:600c:a00a:b0:49c:f4e1:3135 with SMTP id 5b1f17b1804b1-49cf4e13cb7mr4646545e9.14.1788425734899;
        Thu, 03 Sep 2026 01:55:34 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm65075855e9.12.2026.09.03.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 10:55:27 +0200
Message-Id: <DL5K0CZS9PDB.1HD8YBEQOUABU@baylibre.com>
Cc: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
 <vishalm@ti.com>, <linux-can@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] can: m_can: add ti,am62-m_can compatible with
 out-of-band wakeup support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260902-temp-v4-0-3896f7d16ce8@ti.com>
 <20260902-temp-v4-2-3896f7d16ce8@ti.com>
In-Reply-To: <20260902-temp-v4-2-3896f7d16ce8@ti.com>

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 2, 2026 at 11:03 PM CEST, Kendall Willis wrote:
> In TI AM62X, AM62A, and AM62P SoCs, the M_CAN controller is a part of
> the MCU power domain which is OFF in the deepest low power states.
> However, the m_can pins are able to wakeup the system from states where
> the MCU domain is OFF through its out-of-band wakeup functionality.

There are m_can devices in the main domain as well. Does this apply to
these as well?

>
> Introduce the ti,am62-m_can compatible with match data to identify the
> out-of-band wakeup capability for TI AM62 SoCs. During suspend, set the
> out-of-band wakeup flag when the device is configured as a wakeup
> source, the "wakeup" pinctrl state is present, and the match data
> indicates out-of-band wakeup support.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/net/can/m_can/m_can.c          | 7 ++++++-
>  drivers/net/can/m_can/m_can.h          | 4 ++++
>  drivers/net/can/m_can/m_can_platform.c | 5 +++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 16f80607e150e2ca2950616ff2c39b7aa13710b4..0788816d881ef8ba84ad5a84a=
6d2d3e60517ea7a 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2598,6 +2598,7 @@ int m_can_class_suspend(struct device *dev)
>  {
>  	struct m_can_classdev *cdev =3D dev_get_drvdata(dev);
>  	struct net_device *ndev =3D cdev->net;
> +	const struct m_can_pdata *pdata =3D of_device_get_match_data(dev);

The core m_can driver works for all m_can forms, tcan, platform and pci.
I think it would be cleaner if you parse this in the platform driver and
set it in m_can_classdev instead. Otherwise of_match_data has to be the
same for all drivers which is not obvious when you are editing tcan for
example.

>  	int ret =3D 0;
> =20
>  	if (netif_running(ndev)) {
> @@ -2622,8 +2623,12 @@ int m_can_class_suspend(struct device *dev)
>  		cdev->can.state =3D CAN_STATE_SLEEPING;
>  	}
> =20
> -	if (!m_can_class_wakeup_pinctrl_enabled(cdev))
> +	if (m_can_class_wakeup_pinctrl_enabled(cdev)) {
> +		if (pdata && pdata->out_band_wakeup)
> +			device_set_out_band_wakeup(dev);
> +	} else {
>  		pinctrl_pm_select_sleep_state(dev);
> +	}

I just noticed these are called even if ret is not 0, so suspend failed.
This shouldn't happen, but not a problem of your patch. But you could
add a fix for that.

> =20
>  	return ret;
>  }
> diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.=
h
> index 4743342b2fba3823819b9e2bc5b085cc0fe6d1e2..486d808bc677482acf446b145=
0c3a9b6b7405178 100644
> --- a/drivers/net/can/m_can/m_can.h
> +++ b/drivers/net/can/m_can/m_can.h
> @@ -134,6 +134,10 @@ struct m_can_classdev {
>  	struct pinctrl_state *pinctrl_state_wakeup;
>  };
> =20
> +struct m_can_pdata {
> +	bool out_band_wakeup;
> +};
> +
>  struct m_can_classdev *m_can_class_allocate_dev(struct device *dev, int =
sizeof_priv);
>  void m_can_class_free_dev(struct net_device *net);
>  int m_can_class_register(struct m_can_classdev *cdev);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 56da411878af0185ff9cc512e325137428a68255..ae2d89b65fe8da65b1ca73cbf=
80cd8ee8483e2e8 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -218,8 +218,13 @@ static const struct dev_pm_ops m_can_pmops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(m_can_suspend, m_can_resume)
>  };
> =20
> +static const struct m_can_pdata m_can_plat_am62 =3D {

I don't like the pdata name here, this suggests to be platform data, but
this is of match data instead. Maybe of_data?

Best
Markus

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapk1/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOE
MgEA8suKsDAHr3gSYHcmzdKhgj4B1EP8BSKlE5dnGrdEz5IBAPey/srPEYR3ifbs
3kCo0FftLDoUSFKkYXGhEArbs10O
=uRnq
-----END PGP SIGNATURE-----

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b--
