Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A3734CFD7
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256467; cv=none; b=d5iAwT7+mzG4q30Zdui8tsHotOFQeF5aKMhqqX0i/uI4kqCa09hPWwUKTqOTzgLTsuDan1qjtyLPVjodTY2Y83ck4TZrIo2cLrfW8U/IHhNOOYLVvvpqZMZ/rmDrrBbktVHGW845M+yf+A/beoHa5qKKMEhTm6PT1msH9VYJ1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256467; c=relaxed/simple;
	bh=23jZLb1BbMRl4vVbPZVhrG0tF5G2ahmVNt+nZWQBrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMwLII6ZCgnaaogiUnMPsO7ynMbi7t1jni/ucGX+lrjy0roevxhMZK3hjbSwMJOAcS67CUJf0WNeASNHKcNMj7462oAwxqUr4hTc0aD9KPJIotQT0ZENwi/PAxjDi8otfGAToSRWvFNnDP4akMMwzlQbm1WrM6TRx2o78zQso9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpdsOvAb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpdsOvAb"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so1143053b3a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256464; x=1775861264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=qpdsOvAb9prwkBf8sHnfkAfPCbqeS5S68zMQvfzvQfqx32SdxDgNyV1YkdSDMzre2Y
         0hRlRlVQykT+rOwtTlNRTFI7Hn8M4nMKmn6eo7nvhbnTkmpKWn6L5F/o9n7z0cl2Ia3G
         jAUlrvc78fcTR834FewogEyRfdCKBu3f1iu/lYG0F0Re/kxdqM8EcqlXAPZMIhaTOd6A
         9OW032fC5iifd675TW0F3A4pjBMM85gRtAzcBpjsa/IOAq0zip1Zd4znb/u+et0VMpjM
         eW4PD5cKn+DdX8raFSKhZ4GYeLHIcv0OXScoqi9WZH/5Ad8bprk8KOfvVI3yQ/JkZHD3
         VFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256464; x=1775861264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=bi7tH12/NdFsG5ZdpaV6wrZJDd2ibjKjKdJdke8Me24mETQh6oLYF3gE5+xkSUk6z1
         EpB3XmRb75irEezqAVujilWYWXij7brQ2JBXmuJ00L9EGHN+xKW62ro+I2I4evELSFYn
         z6+4wy5LdViGqZtNT8t1/4x3M7bN5X6nAkwqBxmA57g5bKSFVYnU8MNlh3pDnFEp6Cua
         WQscrldFJxrNrnXkCRdpx7bMWnMUP23Kt1/LeVo1sRPZ54y3YJ0Omg/Jv4gzdlhrXciE
         D7cKA+H0iQhmxQjQTZEndUHzIoScLK1d6YuO6R6c4s26OKnYz98GZdbh+Fwr+5Xrv0C5
         sOtg==
X-Forwarded-Encrypted: i=1; AJvYcCX6xBPggUfoSp885ihk3FrmDTUL4DbqAb0KXftDSmyrG056rDeRjNW7D0V+8rQAuJh+llqXvsg1pkWX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOk+s5HPr8kQPokiocm7S72N8NsbQMECQoQyUPRJNezEAz3qG
	k6fWwG6e4Xe7F6hXnQJTYk7DpFjsFLVgfpf/HFcioJBMY+DQG7xxHa9zLpoR8RC4xA==
X-Gm-Gg: AeBDiet9+Yl6woTb3vTP6qc8L9bhhJlOGbI9BKuQDI3rQfo6iC53KK/KzlTAUJ3cIhv
	ohL3wvs5StgSW78oA/zSQc9RHbnYV1Gpxh97EBJUtRnX8iig2by6n1BEOROjNtonRNv8hB8QisB
	wPSakFLoax4SZwC/zxIgH04DPXwrhfq9oP4y3NsPHgC51qVJtT81EfKxKaUfIrWZ8HFBpMcit4u
	vui0X2K4onlflJ2qmUS2XmrPeF+mG5b1PLVXAjzA49GPmCbDZNyNB/35HEis3p60SscVg40kn+f
	UXo35Ylk8ypchhjE8jgab04e4okjbab5vpmEaTAhRNgYVEmYLKm0TbgnPMF4a1de77Uuw/H3uFL
	7jZ532bAXytO8UiXIZ39i6Q5zmlfkYKP2PHakxYwiABMEuyBTaxCC8/6AZbM3z3OxTCGCTnqsXs
	k26efOWqCDbqQuOhXoktkqq+91f6Kx30SVItkDz//kVbFCHixTKh6ww17jZxPQrcF8/hU=
X-Received: by 2002:a05:6a00:27a4:b0:82c:ebbd:9eca with SMTP id d2e1a72fcca58-82d0da3d529mr3892740b3a.11.1775256463733;
        Fri, 03 Apr 2026 15:47:43 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm6887661b3a.0.2026.04.03.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:47:42 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:47:39 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <adBDi6Yk8ebiGwPF@google.com>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0BQnNgQsp6LXI7n"
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-3-jthies@google.com>


--g0BQnNgQsp6LXI7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:33:27PM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index 6bca2dce211c..251aa7251ce6 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  	if (!udata)
>  		return -ENOMEM;
> =20
> +	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS E=
C. If the
> +	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the Chr=
omeOS EC device.
> +	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevi=
ce of cros_ec_dev.
> +	 */
>  	udata->dev =3D dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +		udata->ec =3D dev_get_drvdata(dev->parent);
> +	else
> +		udata->ec =3D ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec=
_dev;
> =20
> -	udata->ec =3D ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
> =20
> @@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> =20
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] =3D {
> +	{ "GOOG0021", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] =3D {
> +	{ .compatible =3D "google,cros-ec-ucsi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver =3D {
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  		.pm =3D &cros_ucsi_pm_ops,
> +		.acpi_match_table =3D cros_ec_ucsi_acpi_device_ids,
> +		.of_match_table =3D cros_ucsi_of_match,
>  	},
>  	.id_table =3D cros_ucsi_id,
>  	.probe =3D cros_ucsi_probe,
> --=20
> 2.53.0.1213.gd9a14994de-goog
>=20

--g0BQnNgQsp6LXI7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadBDiwAKCRBzbaomhzOw
woFGAQCVsZvOh86t3yXOAhw5d8edARY9zTI1JOnJ37uMGnJSaQEAiaxqyGhDdjUP
8/3JD9T1+a3vPCb+6DOOeB4GNbHyrAw=
=rXtP
-----END PGP SIGNATURE-----

--g0BQnNgQsp6LXI7n--
