Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9392D9780
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985911; cv=pass; b=ILjhiiGJH2n+7G1eyg7HU6UBYbT92z3aCzDrPc5gWduWkWOuaFeyQHQFqd6P2uNEAN0P0cqEPK6tqmYE7sxCyzfv1d9drxiMuB22/oeazGVbGxf106JYae2W4JtpvN+I2QBGv194quVK1KbcRrKdMsIiAn6zCz0XzgAHcLwl/kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985911; c=relaxed/simple;
	bh=O+PLvidt4qQJi+8RWeGqsl1wZYXnZW4fi4aLhPE+zgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRxHxULaa2BH35FTmpB9LQRbvt30NyqokHwqYHEdA9qx9YFsV6xLghRxi0TBflHJYu9QiZDJ8w8uSX/lJLT8P/zXMiopOaH66ERLThZdtWg53fXT+qArr+t1jvR0roVJlwRoIn1bLyIY8SZyX15Nh3qcqcJ2h5aeR2gGZXMwrVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjxjY++2; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjxjY++2"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso973039a12.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 06:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784985909; cv=none;
        d=google.com; s=arc-20260327;
        b=e9ZDHIg14OgUG0GHQElK9n0R6v/tlH5VuVb6pIkoMt/BcS48GzPzeaSku7P5X0LMyh
         AayvWDrf+siuXiXeW6nZOcpL3M+srIP/yKZPmd9NpX2W/WibSIcga8u+PuLGdJ19Ft4V
         d/vMkrcgzlwD8b8nS6m3hHePsIHE3piXm6+TFy5stU7LezfcEVaRAnluvmdjUk7x9ZwM
         3FqSnW6ESr7b9YH2cTB1q6QfQodcoxC7Y4LpZEFAzoWn71us5TiEtnZlvQosChbFDGCA
         RXFUKjeMI5Rxp8WYrKLwXlXOwIMMbUSEoDRUmt7EQs5FrLUCawX7tHlAivXWdIRn/GvV
         bCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        fh=HfzUS2JN5iSI64pDePF0lSYzJ1SRfYmdRm4k9i9v3R8=;
        b=I3P4rNoGytcu257HioPTHu6SUwbIAyKo+wXHY2K2Z5J8wZtW9tKSKrdoHOHqRtzrAT
         t+2QqML6SGPjyFYZtBhBxVc+1tlVtFix3xckjivKdA8Bk54stcL+x1fvxY3dzIL1qGZO
         7Ir6ZYQDV2jXjuKZSPnwIelW+l9gCJQk/U2qWRc/lcPM9K9jPP92p4HTygDmkxQAXi/z
         ttlwRqMbcdsyk6I5zjpeM0TaMlpAKnYtJDC0THQf4W88EAdDz8ATwDpT5Oarx1BMWTCv
         BY+7DZGBi7Du8Tt9WFNUsDwN4SFr2xQySwhwo3JPc9HSpc9Fu9AqYQAlVHOVnLmpZRWI
         P3Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784985909; x=1785590709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        b=VjxjY++2eQWSOulzM32m3nPH5SG5ZI835qe5quWSHgIc5wpEbBT7osgsRZXpkDevqO
         lAerjlE9CwD+sVBNVLa5zTfcJZ7hpsF0iB68TfEPQxddSWosM600mzhu7zNyrVo+1M5Q
         xgvYwJHfO0CVjXFGMvKmmsGvH971LEPGxT0RxQwOrvZXk2dzCWEafib5wvHyuLgEJdQL
         jkQIkQsFz+qlzW0JPW+tmi7sW03fLmgPS9IVEj6w0/GtGs3qD9T0b0MduUG0816hXCP0
         fmhXaTuL8WOZw+CRR7voIdhtp4wg3x836U8Xi/H9vy4kPO9RjUlEP3RcwDthpbOZilzS
         oX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784985909; x=1785590709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsVrgRB1j+9eE5XFcyDuofqOTr5n/vldNF5OvYr6AZ8=;
        b=Ce55jMVbCEA5Zc7THUZYE8+xYlGBeoOHyS7NSSdx7Y2uQdM55BHMFQlEDCDSC1aHZ0
         mwNcp6ySFlq82vvzD9XV/wViuDhkazKXqTU2qihFUOIlzJvp4JvxW8ttNPK/d+NLxJLQ
         GKzJxccRAI1ZVMKpLEWYQC0apBlHBR2yyrq/U9iOBuSt9cwnDsuZIzXB2a5K51YcwF2Q
         WpSe0k72RBfBPKkFqPFsUyq/QWOGslkUyHH/bBTWjfaf7/6YtWjMZjGKxsByusrYIHyM
         1LWh/VlZDPVNk2lqE3y9JUrvwMSUDY6HPrpGwlrhyCoOlHHvVo9S7w7+uc7t39jgUUmK
         8Y7Q==
X-Forwarded-Encrypted: i=1; AHgh+RomMCLBCq7p4VfuR3wNGhbvrw75PfK8cm7taASOGNDlHNFHW4ygmj5jqWYtfXiVKRHxJlmU7VUJxo8B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+l6NOpjdJD6dHbteFEzZPSB86B8yDCjGgnoL0qIFelSYCZvYT
	+3v2qQ8NyDG6zvyYp4QgRK8QNemwC2b68i+/LcPihtZvv0rvVCb2cHvLyZN7P400Gj7Lr1fHu5+
	ldfE4ZUBgbmuGmVOjUecARkJ6bCbQHnU=
X-Gm-Gg: AR+sD10yh31Ag2QxAtzCsjJNnUXAfKeP7AFgF3ywhYRpB6sqbeIj4VsZeeuYQnqAqKM
	w4nKjrEaxyYATnZR5s789ghE74vDXbunLFhZk0OIHkK6YwlYDW3oWIiy+qcFwyjbtRxFe2aogfz
	nHp+YhgzsI7C1wCDxy7YMTWNu1+VQLTJ4D3XcWl9XRrBLIQ28wsFNDt07hXr2ZPH5y6+uuDZP1q
	I4FWOPma+wq+7aSCKo/Sc98u/dd1tR8AZoLIKRrvrh3eMYJII6wSLnnE45dHdP/Ngln4awCl9XW
	vyFP+mQGdU/7poBzcYg=
X-Received: by 2002:a05:6a20:2d11:b0:3bf:d487:4b38 with SMTP id
 adf61e73a8af0-3c67dd8a2dbmr2233399637.23.1784985909177; Sat, 25 Jul 2026
 06:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095935.439174-1-clamor95@gmail.com> <20260721095935.439174-3-clamor95@gmail.com>
 <amGz2YZogakb5XAv@monoceros>
In-Reply-To: <amGz2YZogakb5XAv@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 25 Jul 2026 16:24:57 +0300
X-Gm-Features: AUfX_mwi2WZv66EGYRzBQrw-ixRBZCIhNyd1PMWCLX6j69ZyCS0eS-15Y1-6-Ng
Message-ID: <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:28 Uwe =
Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> > From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >
> > Add OF match compatible table to be able to use this driver with Device
> > Trees.
> >
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Please put your S-o-b line last.
>

If S-o-b's should be chronological, then this order is correct.
Guenter added his reviewed-by after I have added my signed-off-by.

> > ---
> >  drivers/hwmon/emc1403.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> > index cd753b38709f2..b7ab6069ec7b1 100644
> > --- a/drivers/hwmon/emc1403.c
> > +++ b/drivers/hwmon/emc1403.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/err.h>
> > +#include <linux/mod_devicetable.h>
>
> Don't add <linux/mod_devicetable.h> please. struct of_device_id is also
> provided by <linux/i2c.h> so adding <linux/mod_devicetable.h> isn't
> needed.
>
> >  #include <linux/sysfs.h>
> >  #include <linux/regmap.h>
> >  #include <linux/util_macros.h>
> > [...]
> > @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[=
] =3D {
> >       0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
> >  };
> >
> > +static const struct of_device_id emc1403_of_match[] =3D {
> > +     { .compatible =3D "smsc,emc1402", .data =3D (void *)emc1402 },
> > +     { .compatible =3D "smsc,emc1403", .data =3D (void *)emc1403 },
> > +     { .compatible =3D "smsc,emc1404", .data =3D (void *)emc1404 },
> > +     { .compatible =3D "smsc,emc1428", .data =3D (void *)emc1428 },
> > +     { }
> > +
>
> Unusual empty line here.
>
> > +};
> > +MODULE_DEVICE_TABLE(of, emc1403_of_match);
> > +
>
> Best regards
> Uwe
