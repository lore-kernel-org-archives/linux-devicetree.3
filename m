Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603293E51D2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141411; cv=none; b=eQ4S/cXbfguAd0c3rmyZVwnXo5ICJf+3F+rB5za6ovizJPG/piS4ZdLNYXWqms3itgK/V9uO14auUUqQT8ouWnzfvK5zUkpC3j/I1cHFarOvaFr2CkneuZIwbCyj5c7H+YtCwOnGwVdRoAC1XPNtQ/M8iAFzSjJl/wKgFL3sLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141411; c=relaxed/simple;
	bh=Yf7/+dKt8M+bpZW9CQCMFZb9p5k0MWHwBjcjM990fAo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JG81uIpXxi7woNNXBOIf6NbQR87QC2udGnJ3f4ayMvjaIXg0wl6FG2kqcMipYdA6yw4gCz8Sjjw/MFzmezoFP/Tt7M4tFVxkm6rsTeOwNFOQbjsoeeY1uB/E+Pc5TI6bY/L3YeZq6GM7z0Vae0S2iYTqwbFVHvSgbr3/QCLZp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNZO5DvA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJ1VtWb+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNZO5DvA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJ1VtWb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785141408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZdiZBoqFn/hxpWjCyLxrSstC8LKbjuTaY79saxzxis=;
	b=KNZO5DvAFCRxFLTW92N7IDY7g06iHCQJrZwEGSNeE3wZC5wu59EAtaJHGJyuWTE7rCwP48
	jIXoR5pTP4bfv3UcC3wEpYORbZdZbnwESHhamCqPQcR1AxAyorSzu8L9ZzQ52+2ok2EeSQ
	+IOuptwK6lUqZwU+J2FKSXhbc8zTqhs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-aRvQGOvnNpSTVj6_JVgF2Q-1; Mon, 27 Jul 2026 04:36:46 -0400
X-MC-Unique: aRvQGOvnNpSTVj6_JVgF2Q-1
X-Mimecast-MFC-AGG-ID: aRvQGOvnNpSTVj6_JVgF2Q_1785141406
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-472a798fc7cso1882716f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785141405; x=1785746205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZdiZBoqFn/hxpWjCyLxrSstC8LKbjuTaY79saxzxis=;
        b=gJ1VtWb+nadk9TDA0iv/SCnxadaJ9XRaldWek/ToPRaa/Mp/pKydZUBdjurssC/QpB
         Uxu2vy4yl6NCsR4doqyz1vRRzZab+G4e3Dth/j4erQ0DgHVc8CSnyLxFZC0FyYU+MaKk
         vqEOZWMprID5TbHCf8HpMNV2hXxpc8e5NBr7nbbhID9x5sBodj+mf3nPEMOScoj6c35S
         XfsXDvKFPW5/G3hRK6zRPmSzWgJDN8r4YsMSsqu1uX0wl1sYKZhgwBHoNTZWCCuc7IkD
         /rXXQQ9VGaTG2mploIZeUJ6wudJzYNRaldC7KX2WUPCluuD2tovcs3wDzwr5GdOy7fTd
         hXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141405; x=1785746205;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZdiZBoqFn/hxpWjCyLxrSstC8LKbjuTaY79saxzxis=;
        b=d3KySap1fZEOASqrBCJDsaL7AFXASdmGGcqpTFK1gEi3xwCBn9stTENVIfiPu4GC9X
         YMIMYUlaRlcHmEWzdPpL5NwkoL8uUeYkZcuIdytipnnbSiq84F+U//8NRXnpkhGnlP7z
         r5ovu/++Ebe2esJyIUsdnDVsh30/NjzgcBkDkBj+wg8MdeisxHewXPbWfi6aPpwLeHcn
         eiNT7MJZPqHjl+2ZdeeCkY6m6G9o5yfL5B+mGl/yN/P4EENKIu8lUWSaMkBGnqQ2r4po
         B+MrgIXzwBLcXFOJAK1Zz5wq7As0CF16mzTl+Joo5Ise8ACW7VrlfNV+F9AuqUH1SQjd
         47aw==
X-Forwarded-Encrypted: i=1; AHgh+RpNUuCt1Rtf3GDkj2lw4minS3q0LHKxy3v2zZlA38Vv6rN7Y/jeU/xFXlKfCH5Ce24/i5bqg+dGppON@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsyl40AYBvfA9sHPguT/vOSLER1hTr1AtAY+UD+Bo5Dy6G3XY
	tVDJHNiHbpHX/RH0Eq8sL4SJf8s2epmvohp7/Rt8CK5Gyxo40PYm0OveewMiNipoeORq02MyXPi
	XBblDXBiBQqPCdkX+uhTuCZUd9feb9iBBcdSQfs82l2CjbQH6iJvfNEOFL/LGTjY=
X-Gm-Gg: AR+sD13nr/igEcu2QDofnrocOIF4p1d37ZmdnaReH+VdsQDJSx7NjLJI6YnSSvgm2Xh
	KurqPoFMJsn7+eHkpW02vD0vQTWjyuJLcrkKPYAeZVPLs/tcCvUxwgthF8UJ77Du3qB497HGL+B
	qGtcHiM6yVNBxEeDucRfEFIECLatr/lKZPjT6WFUM9xzypYNykXI+iTCxWJLKJvJJ6PAZ7CTE0X
	8gQdAS3rfJ0brfOmVdgbNUdYSR8XzL4ORqqtmx3FaLeggrfItuYRI4/BrkeMbs+Xrck4+1EfAfe
	XVa+jh5WDXdHTG5oGNZTTREV1nunv86YOyvbgIya7PM5SW+d+oJFLLjrMDMwjSRpsR6DJviVRlM
	v8kRhbWLsr5PNkDSyzZv854j5ATQGklWRYzjnUQQcIkiWy5b1plNaYTrYd2asg46eCa5pCJN3CU
	+g9o+nuQ==
X-Received: by 2002:a05:6000:2503:b0:47f:947f:9311 with SMTP id ffacd0b85a97d-47f9fc901bamr9518100f8f.21.1785141405579;
        Mon, 27 Jul 2026 01:36:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2503:b0:47f:947f:9311 with SMTP id ffacd0b85a97d-47f9fc901bamr9518061f8f.21.1785141405104;
        Mon, 27 Jul 2026 01:36:45 -0700 (PDT)
Received: from ehlo.thunderbird.net (host-87-6-90-116.retail.telecomitalia.it. [87.6.90.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm45984768f8f.33.2026.07.27.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:36:44 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:36:42 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: vjardin@free.fr,
 Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>
CC: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
Subject: Re: [PATCH 2/2] dpll: zl3073x: add ZL30643 chip support
User-Agent: Thunderbird for Android
In-Reply-To: <20260724-for-upstream-zl30643-v1-2-ea93ba4d85c8@free.fr>
References: <20260724-for-upstream-zl30643-v1-0-ea93ba4d85c8@free.fr> <20260724-for-upstream-zl30643-v1-2-ea93ba4d85c8@free.fr>
Message-ID: <4CCA3CCC-C687-4658-8ACD-BC0CB3294A39@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



24=2E =C4=8Dervence 2026 1:09:13 SEL=C4=8C, Vincent Jardin via B4 Relay <d=
evnull+vjardin=2Efree=2Efr@kernel=2Eorg> napsal:
>From: Vincent Jardin <vjardin@free=2Efr>
>
>Register the Microchip ZL30643 (chip ID 0x0E3B), it is a 3 DPLL channel
>of the ZL3073x family=2E
>
>Once register, for instance, we get:
>
>  devlink dev param set spi/spi0=2E0 name clock_id value 3733 cmode drive=
rinit
>  devlink dev reload spi/spi0=2E0
>  devlink dev param set spi/spi2=2E1 name clock_id value 3643 cmode drive=
rinit
>  devlink dev reload spi/spi2=2E1
>
>  dpll device show | grep clock-id
>    clock-id: 3733
>    clock-id: 3733
>    clock-id: 3733
>    clock-id: 3643
>    clock-id: 3643
>    clock-id: 3643
>
>Signed-off-by: Vincent Jardin <vjardin@free=2Efr>
>---
> drivers/dpll/zl3073x/core=2Ec | 1 +
> drivers/dpll/zl3073x/i2c=2Ec  | 2 ++
> drivers/dpll/zl3073x/spi=2Ec  | 2 ++
> 3 files changed, 5 insertions(+)
>

Hi Vincent,
I'm not sure that all driver's functionality is supported by ZL3064x=2E Di=
d you test everything?

I need to check datasheets for this chip models, maybe some device flags w=
ill be needed=2E

Thanks
Ivan

>diff --git a/drivers/dpll/zl3073x/core=2Ec b/drivers/dpll/zl3073x/core=2E=
c
>index 8e6416a4741d=2E=2E4d07f69efb44 100644
>--- a/drivers/dpll/zl3073x/core=2Ec
>+++ b/drivers/dpll/zl3073x/core=2Ec
>@@ -25,6 +25,7 @@
>=20
> static const struct zl3073x_chip_info zl3073x_chip_ids[] =3D {
> 	ZL_CHIP_INFO(0x0E30, 2, ZL3073X_FLAG_REF_PHASE_COMP_32),
>+	ZL_CHIP_INFO(0x0E3B, 3, ZL3073X_FLAG_REF_PHASE_COMP_32),
> 	ZL_CHIP_INFO(0x0E93, 1, ZL3073X_FLAG_REF_PHASE_COMP_32),
> 	ZL_CHIP_INFO(0x0E94, 2, ZL3073X_FLAG_REF_PHASE_COMP_32),
> 	ZL_CHIP_INFO(0x0E95, 3, ZL3073X_FLAG_REF_PHASE_COMP_32),
>diff --git a/drivers/dpll/zl3073x/i2c=2Ec b/drivers/dpll/zl3073x/i2c=2Ec
>index 4a23340e29d0=2E=2Ef12c6306a85b 100644
>--- a/drivers/dpll/zl3073x/i2c=2Ec
>+++ b/drivers/dpll/zl3073x/i2c=2Ec
>@@ -26,6 +26,7 @@ static int zl3073x_i2c_probe(struct i2c_client *client)
> }
>=20
> static const struct i2c_device_id zl3073x_i2c_id[] =3D {
>+	{ =2Ename =3D "zl30643" },
> 	{ =2Ename =3D "zl30731" },
> 	{ =2Ename =3D "zl30732" },
> 	{ =2Ename =3D "zl30733" },
>@@ -36,6 +37,7 @@ static const struct i2c_device_id zl3073x_i2c_id[] =3D =
{
> MODULE_DEVICE_TABLE(i2c, zl3073x_i2c_id);
>=20
> static const struct of_device_id zl3073x_i2c_of_match[] =3D {
>+	{ =2Ecompatible =3D "microchip,zl30643" },
> 	{ =2Ecompatible =3D "microchip,zl30731" },
> 	{ =2Ecompatible =3D "microchip,zl30732" },
> 	{ =2Ecompatible =3D "microchip,zl30733" },
>diff --git a/drivers/dpll/zl3073x/spi=2Ec b/drivers/dpll/zl3073x/spi=2Ec
>index f024f42b78d0=2E=2Ed56c8d8ecc28 100644
>--- a/drivers/dpll/zl3073x/spi=2Ec
>+++ b/drivers/dpll/zl3073x/spi=2Ec
>@@ -26,6 +26,7 @@ static int zl3073x_spi_probe(struct spi_device *spi)
> }
>=20
> static const struct spi_device_id zl3073x_spi_id[] =3D {
>+	{ "zl30643" },
> 	{ "zl30731" },
> 	{ "zl30732" },
> 	{ "zl30733" },
>@@ -36,6 +37,7 @@ static const struct spi_device_id zl3073x_spi_id[] =3D =
{
> MODULE_DEVICE_TABLE(spi, zl3073x_spi_id);
>=20
> static const struct of_device_id zl3073x_spi_of_match[] =3D {
>+	{ =2Ecompatible =3D "microchip,zl30643" },
> 	{ =2Ecompatible =3D "microchip,zl30731" },
> 	{ =2Ecompatible =3D "microchip,zl30732" },
> 	{ =2Ecompatible =3D "microchip,zl30733" },
>

