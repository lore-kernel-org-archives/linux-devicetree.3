Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D5579816
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882965; cv=none; b=MIFO0S+2msq0p21SGGnUBh6XcxS78lGzMW8gIGqLEbecfV15W/w5TobM66jRaGVXbN9rJe65Go7Msy9ZKLYU8jSnWdjZF76GIVEiXj0bGw2ycV0ojsZSwdd6wyAsdsJguym5UlZOhthZl279tT/iuk8xHTu7ty9X/Hqkf9sd/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882965; c=relaxed/simple;
	bh=QL5L+A2yGQ34ZpBsYQOIJvzrGtfmknTxQP88+80LkUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ms6CX+mANQJKl8LPWg1ku8Jh18E//XM5FOyxTC7UYYiApT9bLLbThPcVoELI+4+KyIfkUH2FQHuGjBNHEjmbjVcWXpmL0PoQgqYazgMbO1b5KVBoZu4KegodYaifzAlUse/Cnl30D5gYN8RTWlVf+nC4SnnUsIiSLUEJrzhVGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kooBFhSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiVn2lSf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kooBFhSo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiVn2lSf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdZDn360084
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 15:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPGlSzCxvKEhEBnf+V1GdR/a
	VyM0v2zUfriGXpEq5JA=; b=kooBFhSoYPZpcd7fJTvC5LyE1Yq0K9yhJ3EDbkaF
	ptQpa7DSfHJH+NVPBV98XhdaxRYcmswEYEcODIbTFckRuqEybqDkaydgXIepNz/Y
	NGnka75NW+Gtjq5UwHbyQO4P8WQCtqqV79hw5cipPGhSsjmm72I+Y7J8mlj5ZB1U
	s6Opr1exbhdoXa308Hoyld0Yhznxl33+BlGlk2KXfOHkvohvYcp/TLG4Rc9yyuTU
	w7KMGh/aTtrddPRayMdteunf2Y7nxnRqRaHwQsF6Y79RE6IkqLsvzVb38rEjpcs+
	UTxcStMjP/Z5vMMj0FlpbtKzNMOFZ9izroRHDNhLuKobtg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pavk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 15:56:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso233488241.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882960; x=1789487760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPGlSzCxvKEhEBnf+V1GdR/aVyM0v2zUfriGXpEq5JA=;
        b=TiVn2lSfwTOqphTgTX+4QHbA3lLMaXInKdKESrw0ymNYqwGLAUU8YohiHc0ZWpSQ09
         2CnwYmoSbUVvbKON1wAKs0YuaAWOyJPgBe9uWfRwcwfrHh2cXUVgG4koBFl0/19giU/w
         h5IFJ6qxOS/Z0wmuFNeXRdDij5vyGf8a9lrt2aJyANO0Vc35ngppm1lcI7KMcRkOaH2Y
         IwZKL1NH+qGRciw5i5DyLZfdSRT/3Dq9tjIBd5+fjkkH/eHOkgT7ggUzdWD/5EQVLSD/
         znHEC4eoHxylKRkfRSzcyZx+vzC1WqeBewzEIefs/Q7RSccoqezIu/1JoMnCusHNfz00
         IJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882960; x=1789487760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPGlSzCxvKEhEBnf+V1GdR/aVyM0v2zUfriGXpEq5JA=;
        b=pgY69GWgOe8iQoUIi1Vg+k7DG+EvSOf/nzSUxoaSLlcQ08PoFYLILgxYSR2oh8ULQx
         FiGy62VnOh8x2hEhG3GuRruvOCt3T2LlIswPdqMA9jrH6p2Wrsgx1RPf4i+CP2gJUAs8
         C7GKdC3wy5ukFqWCED0U07AzIGltccbY/oLp357QY3BQPgjggdlg9yhp1Bv49PAohdKa
         I2oznVVXWIunuJQ3UxPu1mkM4bDWHxHnWLPsCwg4CMNaBoRty63+1KzmgzPlQkK4ImdW
         6Qo0H3wNpoQ9HnTt07XlTDmhviwfIoJZYME5+TL6OGk1P2G44v4PGSpwYnuN4EfFO60Q
         +gaA==
X-Forwarded-Encrypted: i=1; AKwUvBzf/p/Mi/mCJxbfZdojtDI+i4ygqfhgCnbJU8FCa2Hy8zPTya4hXrqXRPKuEjABPh+idoEeWEM/uHdt@vger.kernel.org
X-Gm-Message-State: AFuF++n9p//gJCtwkNlHe7YN4lDqySOqrjK0e+gvjdjuq0y9xhmcIlLM
	eL+F04KB5Qyw0coFYikybLIfjGK91AXNEqdWL21EzIC7jOMYB7nNGldy5iKeRSmfXAvVcCHsvX/
	TQ+D65Am0G9eQAfLQXPTdh5/wmxrdtkft+AS0IDD8Ks2KXDFv16qf4LCpkrV2ojeU
X-Gm-Gg: AYBFou0gdCJfH+4AdpuzhiEEnBMOLvdep66EHzHeuOOjf+dwbmehhGMyhPf02BXRnAg
	sgfhYcnqQmLNFBfImyyq72d6kkOJ2uuqh5oVLS4s7SjyLMGD+qVxuOiXmLDxCgI05ZnGJuAnbj0
	AHM4XpLYSLb/lvIuiD8LH7bCvOJpEpLkJblOCxVTrwo6z7AAFHI6XPO/nxPux1ol3w19XrdLV+Q
	xUJrWU1uuXAi7cdlCnv/FOC++kgmd54UvF/BKhkVbHinFY3EBEZfLmQ3gNnBhMGDZ4nSzd0XhNC
	1K2LsljIvGF3B+4jvIM5mTNwE/uW3bJ1m5Pkn+/a9TkToJcfw+3jD4gYEgpoXNKuoOODPQeVs5d
	CEEC287SxLtC5UA==
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr11120378137.1.1788882959812;
        Tue, 08 Sep 2026 08:55:59 -0700 (PDT)
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr11120128137.1.1788882954099;
        Tue, 08 Sep 2026 08:55:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm31793932f8f.5.2026.09.08.08.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:55:53 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:55:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Message-ID: <aqAwCH5XoNaUymVG@lore-desk>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
 <20260908-pci-tc9563-aux-v4-3-c7fc7778292b@oss.qualcomm.com>
 <20260908154519.4C63C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zgcgrj2tDjCexuVQ"
Content-Disposition: inline
In-Reply-To: <20260908154519.4C63C1F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 4jxgI4snaGHld6mREY6vdD3Nc_Bu2OWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MSBTYWx0ZWRfX/9gVV0UJeSTq
 OMI2DoTmoKify94EfHvGpkUEVkLXjN7npA1UNC6defTRfE+II+SeM+4oKo+QBLR58IxEk1S4wOI
 uUtopw3DC1/YXxvn1o7n7+BYv2NrJJM=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa03010 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=v4o4Xi0_14dk3J3qoC8A:9 a=wPNLvfGTeEIA:10
 a=GrwQZHf9fWOBeuU64NYA:9 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 4jxgI4snaGHld6mREY6vdD3Nc_Bu2OWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MSBTYWx0ZWRfXzEboiZr/nm1w
 Kttsp9gZgL8TGUN5C6ddfJCu9CXcvQUrud/Aq4twuJ+/b45O5YnSoCEgm9Io8wtkUpQ39yxE6lE
 5wruK39vHzZf+B1WXVCgzuG5djDS6fzxqV44LNH9YAvUCEr+awE8+RTkfdOTiusynKaIpZg5VVs
 foxWNkjMeXS4DLS8kY16JuLmk40RO5x7kSlnQ2dsXwRaef926J1qj7Ko8ziHFGaL0TvEA9a0OPi
 MJQJRHNxXapXQHSBLsW6Mh0FauimO+UNbLcvOtX0KDp6gnLhcLflEAsHRO1OjmBXGNS5CXIb+Js
 itZrrXCbbU0ucyY/0A3RKietQId5a4DwB6h2S5G7HKiJ8xPx4IQ046yAgP3zl0bQW6Kd6Gl29qb
 R6b2v9AcZZ7CtR98nBH3Y0QmHB0bIjNsL6gxdh0yocxh5pkAqjY1JtypNBLoglhER/zMTpuC8SR
 FPRLHIDZ9ipo2I3cU2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080171

--Zgcgrj2tDjCexuVQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Devm vs manual cleanup ordering bug: Auxiliary device is unregis=
tered via devres after the hardware is manually powered off and the I2C ada=
pter reference is dropped.
> --
>=20
> commit ee51cc5ce17159f5e9569310449014a414a8580e
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>    =20
> The commit adds GPIO auxiliary device support to the TC9563 PCI power con=
trol
> driver, allowing a companion GPIO driver to handle per-port reset signals.
> It passes the tc9563 regmap to the auxiliary device and uses devres to
> manage unregistration.
>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index 59ad219c26c02..3fb862105fa58 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > @@ -393,6 +398,77 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> >  	return 0;
> >  }
> > =20
> > +static void tc9563_pwrctrl_adev_release(struct device *dev)
> [ ... ]
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> > +	struct auxiliary_device *adev;
> [ ... ]
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
>=20
> [Severity: High]
> Does registering the auxiliary device unregistration to the devm cleanup =
phase
> cause a teardown ordering issue?
>=20
> Because devm actions execute after .remove() returns, tc9563_pwrctrl_remo=
ve()
> will execute first:
>=20
> static void tc9563_pwrctrl_remove(struct platform_device *pdev)
> {
> 	...
> 	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> 	i2c_put_adapter(tc9563->adapter);
> }
>=20
> Will this cause the hardware to be manually powered off and the I2C adapt=
er
> reference dropped before the child device is unregistered?
>=20
> Could this lead to I2C transactions on a powered-off device if the GPIO
> controller is accessed during the unbind window, and a potential use-afte=
r-free
> if the adapter module is unloaded while the dummy client and regmap are s=
till
> active?

I think this is the issue already reported in v3.
I guess this can't really occur since i2c_adapter refcount is 2 after probe
(of_get_i2c_adapter_by_node()) and devm_i2c_new_dummy_device()). During
teardown phase, the first reference is released (i2c_put_adapter()) but the
second one is released just after aux device is destroyed.

>=20
> > +}
> [ ... ]
> > @@ -596,6 +672,10 @@ static int tc9563_pwrctrl_probe(struct platform_de=
vice *pdev)
> >  	tc9563->pwrctrl.power_on =3D tc9563_pwrctrl_power_on;
> >  	tc9563->pwrctrl.power_off =3D tc9563_pwrctrl_power_off;
> > =20
> > +	ret =3D tc9563_pwrctrl_add_gpio_adev(tc9563);
> > +	if (ret)
> > +		goto remove_i2c;
> > +
> >  	ret =3D devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
> >  	if (ret)
> >  		goto power_off;
> > =20
> >  	return 0;
> > =20
> >  power_off:
> >  	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> >  remove_i2c:
> >  	i2c_put_adapter(tc9563->adapter);
> >  	return ret;
>=20
> [Severity: High]
> Is the same teardown ordering regression reproduced in this error path?
>=20
> If devm_pci_pwrctrl_device_set_ready() fails, the code jumps to power_off,
> which manually powers off the hardware and drops the I2C adapter referenc=
e.
> Then probe returns the error, and devres will clean up the auxiliary devi=
ce
> afterward.
>=20
> Could this create a race window where the child device is fully bound
> and accessible to userspace or other subsystems while the underlying hard=
ware is
> already powered off?

For the above reason I guess this issue can't occur.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260908-pci-tc9563-=
aux-v4-0-c7fc7778292b@oss.qualcomm.com?part=3D3

--Zgcgrj2tDjCexuVQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqAwCAAKCRA6cBh0uS2t
rP9GAP4gXjDD7f/hxcb9iAM4lkRxXhVRhZccxzCkY6SztZ+KAQD/fuC9rwFcruAK
yL/xrSa6laWDpjRGCRds20UbNEM81g4=
=Gg8o
-----END PGP SIGNATURE-----

--Zgcgrj2tDjCexuVQ--
