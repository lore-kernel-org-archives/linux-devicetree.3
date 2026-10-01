Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C704D37AF
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848335; cv=none; b=YAxROuIInQAIA6b8hmuvYY8jpNIn54oHwpeCoTxpUh3nzGURxUrNA3kUXbcDX3qGwNkBOMgIWeaGvVCGzTkkTRyfzhj+Cob3vB8Rjz3SvkYiWdc12mwPSZuxB6P8e2FMbtWPSQr4CCHe9yXYgkTx7F3GvNDBO2nGhNFzoWZ24+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848335; c=relaxed/simple;
	bh=NlI9989RJXkcIj5gybAsIHSJgxn0PED+5Q3UHV8axL0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KcJ/OjaL1Ts9v3Zn6kFWO8iZ0wCU6JxG2+5KJzGFYSzEnXIYOOAzEletEmZ+TqMByYM5WMFQFHUxuALYWg8+oL3/Izlb6aBZrJqSJKwoQcWmhnNgFM9XeJw7kvw029qmuSisCvnfnOCQHTgC6ICfbNHYJ9w0WUOeRkKOYzO4cek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QMA0lxTM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QMA0lxTM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso48406095e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790848328; x=1791453128; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IP3AWrdgyhsi4gEriAWOsCBAC915a9ZMRefWSKzbTns=;
        b=QMA0lxTMQtqa5MKJHAwd5BzXesbqPXjU/DP8I22JOJpfLDQhPjMpGXKn/Shg9d/sOb
         OAyKgOhDYqodmK6UVFET/PGtcGSeY9o33gRTo/FcB3Nms2oamoTBA645qpOr8CkFFoQU
         8Xom2A6SnT2NMW/Dr8fmclsmZRZRR6UdStbxdDrD3einu6PdlSOdje6n+efH4EO2dPx+
         lLK806WHYjS3vcdqkl7DwAyQDcQcKNzakKCdIn4kE2BxL3+4a2DY6tUNCizMkATh5oH0
         kLBXUFRAc9tTsaXs/+V0HvqRp2gJprQfHIbauNbvBa2bgZSEJ8fCY2CMX4E7nNP+7r7u
         PTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848328; x=1791453128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IP3AWrdgyhsi4gEriAWOsCBAC915a9ZMRefWSKzbTns=;
        b=NVBizXAacoUfhfCMsnq13TYEbBtvoj2DJMPstYDM8ynFSSS/lcDSFr77NtbpIN2Qp6
         Xo8KbKuiszhXMa6bS9SlTBVhaPp/+CpCZVQ/xtTSdUDWT+Qmk5PokvcQanJlDFnXL76p
         auVhivE03NMqtOQNsGcUJw5Q74Dg6EoReSKFyNfV7eVaL+ChnXIQvTGNPgRDkBKRIf/7
         Qkw5Fcwrwa97fzjdp2vyslkoy+8p6xj42P0gExgTiSNJmarW8JQsfodIuxhCU/OfQzHG
         /UuCVIodW+nadOTvv5+XkHkUDZDNw77KAWOypiGJYgikRy3KGMjNivSMusmlHUZbRfIy
         pDgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2bbzp6rBPv7Uga18fxQCdkCotYV+jDoTrt3YQws3giDfGxt3RTbEMjF7Xas8MRCmUXAM3DJsGMhNf@vger.kernel.org
X-Gm-Message-State: AFuF++m1MHhVtcdEemcB4wpgbZB/N2bPwnEmEd0dVQPiN7QrNiQ8VCv+
	QImpKxBKTridP2NNW9ttOetUjfqcO5qsaFEjY7uJOy+suBGih0ZcsMnWAYYp0ddw8ls=
X-Gm-Gg: AYBFou0eiw6PY0JUViYoFT58Lw9U4FhU9gJYPmt0FNw/25xF7GsT8xjeS0JU23e+qf/
	RdVhoyS1/ZI5nMf5mNqkQxCQqWtx3SPnDdTZxWQ+8JF1xr6hmI44hM50Hc5PtrQcDhiuuI4c+E3
	A6FNHOuv7AROQ6TjbsNv8i251Y4br/t8LDWctFIALsxV6Ch9f7O0lstBpASBWf0f5fcwTvjzbN+
	R3c9miVHeIPi1zWEPnSNDfa6dgH97vYYSh9d+1hywZU176EhwwsZ14K065m7iUiXUt4y15InoXc
	32sMJ5L7a+o24EAd0Y9fnPVXZsAGN98p/TkhpmXp88zm4RyUHW14/FOpic3XgdCXtbxGVv/Dd/s
	txIL/prGVFrz8InVcf/j2sZXxfVlwem1h3LMJleOTxW/8eYLQS3JrFYwe4BaZ5AfQYsFTkM/9EJ
	9xhXcUVTLqlD5M0juYUiE7KxgEpddOYa5mkmS4Jqh9BFVFFM0Xk1d2kCkwrnTAufDrQA==
X-Received: by 2002:a05:600c:4e42:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a01aff3a44mr69865245e9.10.1790848328129;
        Thu, 01 Oct 2026 02:52:08 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:c4e6:4d28:61c:74bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f938f89sm49777045e9.9.2026.10.01.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7a6e549848da0d50090fdccd7284ba463193af1978db53d9875c8a734ada;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 01 Oct 2026 11:51:59 +0200
Message-Id: <DLTEQW8XYO30.3684CENKEUSOQ@baylibre.com>
Cc: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
 <vishalm@ti.com>, <linux-can@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] can: m_can: add ti,am62-mcan compatible with
 out-of-band wakeup support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260924-temp-v7-0-f40defe5957f@ti.com>
 <20260924-temp-v7-2-f40defe5957f@ti.com>
In-Reply-To: <20260924-temp-v7-2-f40defe5957f@ti.com>

--7a6e549848da0d50090fdccd7284ba463193af1978db53d9875c8a734ada
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Thu Sep 24, 2026 at 11:54 PM CEST, Kendall Willis wrote:
> In TI K3 AM62 SoCs, the M_CAN controllers are in power domains which are
> OFF in the deepest low power states. However, the m_can pins are able to
> wakeup the system from states where the power domain is OFF through its
> out-of-band wakeup functionality.
>
> Introduce the ti,am62-mcan compatible with match data to identify the
> out-of-band wakeup capability for TI AM62 SoCs. During suspend, set the
> out-of-band wakeup flag when the device is configured as a wakeup
> source, the "wakeup" pinctrl state is present, and the match data
> indicates out-of-band wakeup support.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/net/can/m_can/m_can.c          | 10 ++++++++--
>  drivers/net/can/m_can/m_can.h          |  6 ++++++
>  drivers/net/can/m_can/m_can_platform.c |  9 +++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 91a0c5eca260c19fa97c6f5724341cad0c1c95b8..815a11531ff47b8460aa3efa3=
075804b4f769848 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2628,8 +2628,14 @@ int m_can_class_suspend(struct device *dev)
>  		cdev->can.state =3D CAN_STATE_SLEEPING;
>  	}
> =20
> -	if (!m_can_class_wakeup_pinctrl_enabled(cdev))
> -		pinctrl_pm_select_sleep_state(dev);
> +	if (!ret) {

I guess this !ret is from an earlier iteration? Code at this point is
only executed if everything was successful so far. So I think you can
drop this outer if.

> +		if (m_can_class_wakeup_pinctrl_enabled(cdev)) {
> +			if (cdev->out_band_wakeup)
> +				device_set_out_band_wakeup(dev);
> +		} else {
> +			pinctrl_pm_select_sleep_state(dev);
> +		}
> +	}
> =20
>  	return 0;
> =20
> diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.=
h
> index 4743342b2fba3823819b9e2bc5b085cc0fe6d1e2..da64e6bbcef2a721a330e67fd=
852ca4a703c5794 100644
> --- a/drivers/net/can/m_can/m_can.h
> +++ b/drivers/net/can/m_can/m_can.h
> @@ -132,6 +132,12 @@ struct m_can_classdev {
> =20
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pinctrl_state_wakeup;
> +
> +	bool out_band_wakeup;
> +};
> +
> +struct m_can_of_data {
> +	bool out_band_wakeup;

Can you please move struct m_can_of_data to the top of m_can_platform.c
to keep it local to where it is used?

The rest looks good to me.

Best
Markus

>  };
> =20
>  struct m_can_classdev *m_can_class_allocate_dev(struct device *dev, int =
sizeof_priv);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 51dd41dbf2c9a971295994946e190ec0187addd5..dbd59730c0bc16f519cb2c40b=
cd8093ca1bcb369 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -83,6 +83,7 @@ static int m_can_plat_probe(struct platform_device *pde=
v)
>  	void __iomem *addr;
>  	void __iomem *mram_addr;
>  	struct phy *transceiver;
> +	const struct m_can_of_data *of_data;
>  	int irq =3D 0, ret =3D 0;
> =20
>  	mcan_class =3D m_can_class_allocate_dev(&pdev->dev,
> @@ -148,6 +149,9 @@ static int m_can_plat_probe(struct platform_device *p=
dev)
> =20
>  	mcan_class->is_peripheral =3D false;
> =20
> +	of_data =3D of_device_get_match_data(&pdev->dev);
> +	mcan_class->out_band_wakeup =3D of_data && of_data->out_band_wakeup;
> +
>  	platform_set_drvdata(pdev, mcan_class);
> =20
>  	pm_runtime_enable(mcan_class->dev);
> @@ -218,8 +222,13 @@ static const struct dev_pm_ops m_can_pmops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(m_can_suspend, m_can_resume)
>  };
> =20
> +static const struct m_can_of_data m_can_plat_am62 =3D {
> +	.out_band_wakeup =3D true,
> +};
> +
>  static const struct of_device_id m_can_of_table[] =3D {
>  	{ .compatible =3D "bosch,m_can", .data =3D NULL },
> +	{ .compatible =3D "ti,am62-mcan", .data =3D &m_can_plat_am62 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, m_can_of_table);



--7a6e549848da0d50090fdccd7284ba463193af1978db53d9875c8a734ada
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCar4tPxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMI
1AD/TxuXMsKLyW4KCUwc3mc0dQc0TCA0biVWcg29YQByTWQBAM7eBZmnjxysyq/q
gPgVihQ96Rf4bG6qcyGfwHY2EWcM
=S4Wj
-----END PGP SIGNATURE-----

--7a6e549848da0d50090fdccd7284ba463193af1978db53d9875c8a734ada--
