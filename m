Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13F42E41B
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363577; cv=pass; b=JBTBhhK8pTcrm5e6245GmvrwsYV2UO9Y4C8Aa8HnL5d7VbdrTkqyktTXQk4POvFMYt7xyM5nGE3ydC1vv1FS+BHEhzMX6qL1++zMh2UQY2qhU+msyu2tfrkvKuftVNL39qSWoqOtCUqdMV9qcaTqrH0NDpbl3UF2N/7O56zadDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363577; c=relaxed/simple;
	bh=EAMjyOpIadbTNwO/tz13iEMNLmVb+GEL9o+oPDkJh1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4qkTTYEl3PBNiZadH6ITt6h4QtUsJrUBr4+ghFNeCfDNhPN6zxamVj1T0S/pgP4YzhuMQHtA44fzsMBlB5+Ei20onfjzifkBWDTV5iK7m0S3dxRG0rDYQiD1QepzMKzNR3rrsCEKfUIGkDa9IUT9MrDuKvoIoEAZapjbfS5ChM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0H+8yxc; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0H+8yxc"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ceab2900eso2535219eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791363575; cv=none;
        d=google.com; s=arc-20260327;
        b=P9cp8O05+LgXaEIUAg60/j5LeXe4+nlrTyl04GcDdMUrfHAq7q4hQNRTG/0IQiGVDs
         uI8KW01kMO9k6v1udaC/V4KcC+JDltAsPbG6GvxC0PR/BnOFTOljDVKGbuufz4R525T5
         tiytJwi/d7OSWPX9YurUKMBMaSNB8OD/Ee97qjs+0bi3rN96ta9oEy8onGaAG8U8wUY5
         x5dfs1kyEjXxPDTYYDIQFkHfFtvJIvWWMkmHcHjyS6Wq1PDPa7WGDjDD7Blj+jiB5WIV
         WPLH7bSpKaKQzkYD3Oeg9PJNdt1ckJbcBauHmwV4YwWEkgm972Ea0Dpu0LWGYgqPBvii
         QFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        fh=3RrLaL6umyh4HWhR8MjTo+Az9NFxTdGp8aLuoadY5Ms=;
        b=enO395qMA5sQMJkCwRedS7+iR+xeA+E2MVwByFTDBuL8y8kmt0/C08nV7Gmh+LEiGd
         ysgX0PbinVCBLgg09bNJUMzeqReM4Sk9S+FdoLTmxDraSQ88GvXafeeT9ipcewtgTALr
         W7blTaqx8NonUlSWkJUVdbfSX28alCsu7KcBHflZIAy5X/9spi77lbs7FETMhNY0VPul
         iXbOt6TwOsH5x7H0kvA3FdDvnaNPKaOkCe9aSU9cqBcAijDrCnKbov7eRMFDIiWGIVNv
         FUwnDk1AxBztFMWSL2H3Bb5nEPxoR2MgHHyWhOK0un4h+0M+GhL83phHwhOCK8S958WV
         xTLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363575; x=1791968375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        b=W0H+8yxcCqvlfzG+2rrdd+ixkCz99e2hB10zGcJk76XjsDI5KpY23vDmlYfWxAKMDJ
         DkJexEIED3B5zJTd3cBj3d7YPVvxVV1bIWTyY3v7MncAFNyhHsyFEFvH962KMMSWjyyq
         n1sYXN9RQ79+vPoPSGS/0V+4gYvxD9E//RQt6N1za86QKTZQzV5b4QcIlct7p3S2b9ZN
         c0vkrqZ42YhtecPer6MiKnnwfCO+OA6h5SqtFxmMMXDEQgs7rfaAbKPqZ2+VhfERRM1/
         M4QcjJS0G8ePSG08BaE/XE5nY79Q7lX1/ZknVHygppJiD4SqdqiCjRaKp3zS1wlR6Mnr
         JaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363575; x=1791968375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        b=r0Tw2cXKAZ5jVYByRexOqq1ze1X0rGSGsWgZERrXst1NqK1mZbP9fGFWenZwMrf1O5
         0w7ajJoDu07uF7uDcjr3KfQ4/URqO9yuwnU+lPFU+l4HDRSeBo0i/MddfJXwOylBN1sV
         Ogd762NskqSt2ThFfl+s9CzUjvqllfiFJAkvcrFGFvaWavr+4H/oKh9Va8kcRjPoG/1E
         kFxvImp7KjQPLIDWfcrbbjR/Id7rf60iFuLTHrfagU/T9trkfpESGnb+kor/7GhS2VeG
         MHG9878W+O6pq9eNQH2U7ans5sHx67a/LE+c25FNv8i8brf3PIBMFbgpxDG2gofubNsZ
         1K+A==
X-Forwarded-Encrypted: i=1; AKwUvByjka48oHGhCR+pLWIDuAt55DRKo94OxRISAIVBQrfhIoVJZO5Ub47+fO7UI4ZOi/NUOhYWUZvn9dqL@vger.kernel.org
X-Gm-Message-State: AFq9FYIhot4cfyzfclU8YwmUb5vKwXEVQOIQfaVAhDffKEe9uaeoWaqu
	tmXHNCK5ld+xnEip4uttjt37Zq2bOobn8bVyjZVojLGSKQz9gKqyWe7TNqEjCtatSKZQDis14Fk
	hsjqGcG0VRH/DhB2QkGJdtGQdbI4Gwa4=
X-Gm-Gg: AYBFou2lgc/F4HUXsqpnusaRvnblh/4kAYqgjYXlBGV3H3nTCLY632ws9+e/WNFszfP
	C2CII6zl7EXonxKZsiBK7W87Q0PFMrs9gLQgQ5Vx2HJGxm37ovQcoywkrBbGVbd4ogrHM8inIPL
	P1hibSOoPJW5eIH//LlawKdFXGnSTFwkRtuW27q7gn2hxs86P0fsSLhLF3irdc1WFJpKzUTA3+/
	ArEK1TAhUHDXYkiyUU6e7Ia1qpHnBQF0nkm6/vH8hfgfDrRVdYNCBWuzLjk6yEFUy5kBGUHS4gZ
	om3mS1MnHxrekBUGMKT2oOfl3QO9vhBV77m7cmFStc74Xcn9WDgbPhF7c+v9oBXN83GstWox6tx
	CewemPZV/M2EH
X-Received: by 2002:a05:7300:f792:b0:34c:d55e:a752 with SMTP id
 5a478bee46e88-3515ddb78edmr1522796eec.8.1791363574792; Wed, 07 Oct 2026
 01:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006154431.318936-1-clamor95@gmail.com> <20261006154431.318936-6-clamor95@gmail.com>
 <asYFNNwVRAcX1V9o@sirena.co.uk>
In-Reply-To: <asYFNNwVRAcX1V9o@sirena.co.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 7 Oct 2026 11:59:22 +0300
X-Gm-Features: AclHuK9aXt9IRdQT6nESmarE1wVeJx-V2PAtwKk3EA3FnuACDsVmbpc4zTjEbXk
Message-ID: <CAPVz0n1LidN0MZFbgG6GoX2wea9R8Ga7=Z_S99bTR2j7me6zgg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] regulator: lp872x: Remove platform_data based probing
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:39=
 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 06, 2026 at 06:44:29PM +0300, Svyatoslav Ryhel wrote:
>
> > The platform_data-based probing is tightly integrated into the lp872x
> > driver structure itself; removing just the platform data support is
> > impossible without remodeling major parts of the probe sequence.
>
> >  static int lp872x_init_dvs(struct lp872x *lp)
> >  {
> > -     struct lp872x_dvs *dvs =3D lp->pdata ? lp->pdata->dvs : NULL;
> > -     enum gpiod_flags pinstate;
> > +     struct device *dev =3D lp->dev;
> >       u32 mask[] =3D { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M =
};
> >       u32 default_dvs_mode[] =3D { LP8720_DEFAULT_DVS, LP8725_DEFAULT_D=
VS };
> > +     u8 dvs_state;
>
> > +     device_property_read_u8(dev, "ti,dvs-vsel", (u8 *)&lp->vsel);
>
> Since you're updating this we should fix to read into a local u8 and
> assign the value - the cast won't work on big endian.
>

Noted

> > +     device_property_read_u8(dev, "ti,dvs-state", &dvs_state);
>
> If these properties are absent then dvs_state won't be updated...
>

I will init dvs_state above then.

> > +     lp->dvs_pin =3D dvs_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>
> ...so this will be random.
>
> > +     lp->dvs_gpio =3D devm_gpiod_get_optional(dev, "dvs", lp->dvs_pin)=
;
> > +     if (IS_ERR(lp->dvs_gpio)) {
> > +             dev_err(dev, "gpio request err: %ld\n", PTR_ERR(lp->dvs_g=
pio));
> > +             return PTR_ERR(lp->dvs_gpio);
> >       }
>
> dev_err_probe()
>

Noted

> >  static int lp872x_probe(struct i2c_client *cl)
> >  {
> > -     const struct i2c_device_id *id =3D i2c_client_get_device_id(cl);
> > +     struct device *dev =3D &cl->dev;
> >       struct lp872x *lp;
> > -     struct lp872x_platform_data *pdata;
> > +     u8 general_config;
>
> > +     device_property_read_u8(dev, "ti,general-config", &general_config=
);
> > +     if (device_property_read_bool(dev, "ti,update-config")) {
> > +             ret =3D regmap_write(lp->regmap, LP872X_GENERAL_CFG, gene=
ral_config);
>
> Same issue here with general_config being uninitialised if absent; this
> is a buggy DT but we should still handle it better.

Noted, I will check default values in datasheet then, thanks.
