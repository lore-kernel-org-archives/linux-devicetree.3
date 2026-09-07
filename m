Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49B3C109E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769980; cv=none; b=UAF6wOBjJQdxJSvxlckPU43ZTd3YIA8DzQEuw2AlK0u8ZDTgrHHF3kbOxwnsFYuRo3YxrK4yAYYPm3D0Mj8O/PkqrTqAgQRsKgmeLA/0MXxCVGNQ44kAeSOBRJNsnQTiglcDaXun203kr0SSStTXyVX1u5Pc2C8+S33FTpInTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769980; c=relaxed/simple;
	bh=3vtIMbYe0dxXQg4HGTmjD4UpnxkAM1+Q1cUtKCU5Vq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4EWYMBSWpVdDAenaFb1HE8F5KIR1QtALY4KxAOryUOw5krdRhLGJAcQK7g4N8ePrdIM+OjyBVv6FbCwsVK2AovVOUPaahnSdu5CxO8cWIMlmSXt5n/0XQuJBaL4/bKDTrEY9390agpaUyIsyHBf6KfiEWCNkWgEus+6QTB5pwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOmTpjhe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOmTpjhe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3681962f8f.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769977; x=1789374777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=NOmTpjheI2TZwvavLhjXmCysXfikFgDFGVah7+rRsb2Mx8/zPGZiQnb38FAImNWhfM
         ULqvYlfvnKwGAK2IPAIL1eu7dky7lLEZRLsLFHmStAkNNSjaOXReQwWyOnH7PuRfPQ0N
         BVcUmFcY9n68CVei/cOhyraEjUCNbb4iuxi6ZCcvyVz5LKrwPB1HNIs4o/jYGB9H16aJ
         1FtTDskJZDfGXMg/J8IZa7H9VmRy2fbX3BllMNFTkMT9ICx1sWspM2mlE3OeTfqC3AJ/
         10J2BcYnqoaaSLjUwHlzMvdpHHQpZsBa2O4dRQ7s7gH88aSD9feApwtpPmDPxMdMEVBz
         CooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769977; x=1789374777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=Y4ouWWRXZR4LfglV+zzI61tOQ+cu4h6Im2T04qoxRTpNQT/EA2dQXFmUQSWkPLeXDa
         y9X3cuVGTFpsTmzFH+B5E5sFeQ0eaKTUmd67GFR0JTBZ96555xvyLI+6utXbm4NRoi55
         ZbhHyGCPcS/UAczzmcLKRgR2Ja/H09s1p3aB0YNA3OHFphVy0et1adN+1Aa5vciZ3LsQ
         wuyKWwxBDGGveoqYsNhhJbs1Imw1yTa/6GaNDOPPPCPqE7p2ZsbLSgxyB48mBOLDiKLF
         3QJutwVKyWXQyirDb8XmRSwiMmUvigUxRiDiWxogXZQKU+pNNis4DKskK6bDzW57tYS3
         XUaw==
X-Forwarded-Encrypted: i=1; AKwUvBxKEu2JQlUEzAqnrf+1AoVE+TLoFP0tvInAAE1UG/siq1CwIXAB1wpL0OZcnTQcSx+DoxueKWEZDXci@vger.kernel.org
X-Gm-Message-State: AFuF++lYQ3eqzKheYpOqgugipgdeen4ZNDmlch0KtMQhbvUD9LDxP4kn
	pgN7qXdzl3egmy/iHl1Q/e5zXbOAijLH755dTW+3Ky5DiWqHfER/yDkR/0WTJGKwbwE=
X-Gm-Gg: AYBFou3e8wGmDp0+GGaojIGZp+ZSAras4zBTlG6tU9OZx2MwJUr8bnswo6OgM3Ct9ky
	oj5IztM7SQMSrDsNohaMtMAfnDF3Nimxw24mgFr1PFsx7lRppyejlFSpUNxhMCtfs04QKhegi5k
	uOBixAg7E4JJ3lhKv312e5oe7D8ZTypz1AlHDeYA6vBs9iZdHMqtd8DP0BK8gbzrFFxevh6LYie
	p76XfNI0AFgKGESHbqPWWYNi+RpGjUeUVlrPwrYrVIcxhzHVWGuYS3Wn4njsfaxE/132JNgHDae
	nGS/GvfH45OXaCafSbaSZscXa/eajwza6cQdxY7AWvJzEkIS7qVzt3dckurRztzUuBrsWZc+ycr
	xfDwInOmmMjzT4v3qnN1BIvQXA7+KS8/DYHppa9zAO1XZsHU/Hw8RPRd8Ps7Bj024kBCTJ7sGER
	QlY8QnfEU6mYzjY0VlcjRYZKoKpvM9MQUq5Bzu4dH7PzohqK667JoktKBFTjABz+IencqHCD+hM
	6e8exGU5mUEgNxWuJ9wjTXBF17lf5cA1OK3WM8bVK4F+m6I/vs=
X-Received: by 2002:a05:6000:644:b0:485:847f:fd89 with SMTP id ffacd0b85a97d-485870506d0mr24554219f8f.9.1788769976952;
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883c6ba4sm30820390f8f.25.2026.09.07.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:32:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <ap51p16bSY1Ru9C1@monoceros>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ho4liu3hrz2gwc46"
Content-Disposition: inline
In-Reply-To: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>


--ho4liu3hrz2gwc46
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
MIME-Version: 1.0

Hello Shawn,

On Wed, Sep 02, 2026 at 12:59:38PM +0800, Shawn Guo wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide of_device_id and (see below)
i2c_device_id. Alternatively include the needed files below
include/linux/device-id/ to not introduce unneeded dependencies.

> +static const struct of_device_id fusb15201_of_match[] = {
> +	{ .compatible = "onnn,fusb15201" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> +
> +static struct i2c_driver fusb15201_driver = {
> +	.driver = {
> +		.name = "fusb15201",
> +		.of_match_table = fusb15201_of_match,
> +	},
> +	.probe = fusb15201_probe,

Don't you need an i2c_device_id table, too?

> +};
> +module_i2c_driver(fusb15201_driver);

Best regards
Uwe

--ho4liu3hrz2gwc46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedrMACgkQj4D7WH0S
/k7YgAgAs4m8lyJ4DHebmlSmZntV4mxfgROfhi7Uwq7HpI6Zvchr6fGHr2xXOV9F
nWYl8ZJ+ADjYZ7LaAHy3nSz8i8IeAQst2+FhnNS+USYuNKfo2uB7I6/I5eTWbwkq
4hYvG80vost649UpY9qeQ+V+Ya/rh7q4ipYctOqYGh/lsN3KxiWpQdX74vBbdWLF
pRygWfOFX/jY3/x1WbPTU3MaXqexQvnkTJbIH6iJI+oBMyQ/N4emnBf/RlTpB6Xr
EXY4Ctpi1sy7GcD3/MoYNESHR9+fR1GLsGNuNq4b+vS2zIY9KLAqrAIdjOZ/EqlQ
3aWssAJJQhcD2K7qbTLjoe/4CPX8QQ==
=hzRz
-----END PGP SIGNATURE-----

--ho4liu3hrz2gwc46--
