Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2D569F2E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882473; cv=none; b=rcKPaHbAfa1l7IZFFUVz0/T+xPgyT8Rc1zZkYEVDCpXoRXYqcxwDdyq1YgZWxvJKX00c7G3ap8N4I7FfE/6MUZaTpI+/S8JI9IhCDlAVnbA2XZwysC/9HOQNabv5ArFYNV4lk9WsdZNbjfodvAHfxvPC1KegzS8O2RPo+m6LQcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882473; c=relaxed/simple;
	bh=JruwBrg6ocqnRLATYSQdb1hBUBob8s3+lpsva/v10iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5s45SJpgPmNcfz8MCtDCGoDbqfXQ8rYC6e6vL3kyYeb29o8jpYf9Hl5sEA3B3zzNtBg0l0qD5hVAH0ni1msPW5OVYeezbBoSJ3+KWhKYx4FcjevZ1OzbfBwz2n6UoIMzbnH6TrMCanef44pJKLIyN+Y/WlCIWemCOKkr5Rc06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bux6qWQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnWjdsxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bux6qWQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnWjdsxN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdXLg3322614
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j22ngAJ415M/98LZb5I3VVp0
	EfCLQZR6WUczjgnvxYk=; b=bux6qWQuAxpFlbA4sTnkkUBs2c8uqI7YPXBXTdJP
	uExI9E2yvmJ5fHxqZcX/GNkn28WhWTV17qFddeAwNh3nslKyEZqA7ZfWZViy8/YD
	a97KnYEQjY6aIgnS+nvhc3Jw51kbkKWsqANICIEEwvArCfcLzaQyUOkN1vYYPmeL
	eqAKb4RbBz0v2iCrFze7Oy3Ktiz50rq8DlXsQdu+gXxNbJdWmTl10rveH7c+UpXK
	AKHzOC3gvJP5Ql04u6vGtDDt3h+PsFuejj0ULIxHvQF73ifAW8aGO7QAhHISoOti
	jUN/+eJtAc9XsZcgxhkObJ8KYkM0z6K+2Qo0y65Y9K/PeA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chtnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 15:47:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7819910f8adso4102448137.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882469; x=1789487269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j22ngAJ415M/98LZb5I3VVp0EfCLQZR6WUczjgnvxYk=;
        b=dnWjdsxNcevHILxJWHWKcCVBfVgpcRrIZ4cwARnJgq1yBONAZCtDoEL8EsD37Zy3lx
         1TZejPqBCYRuopGMrk6CXpN1ULCAS3MaCPxHp+cABNiKI3wiJ4Z4k+n0UemRgXOGIke5
         vY5NGGhIYuGVTGbPOGrd6wRT/L6+USRno52ae79+2WJm9xoCOkoXkWwkXY2HUD5CvXKp
         spWaKtZiwkbGxJCoDjNF1fmMiMg4u3ThNbmfOsk0LgfW6mT8zNyVE88afqIMov/yuw2g
         ewwUrJG6EMOJqBcGc5ts6+erBeySVhohaAzerylfAb9EFtjbMm/90m4MRCy626DMwgmF
         lnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882469; x=1789487269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j22ngAJ415M/98LZb5I3VVp0EfCLQZR6WUczjgnvxYk=;
        b=d1+qMlHT1dYeQS4EZ8H5sZVNXSFRBebaZgrIf8LgpsWyqY5gKGlD/4pytTqQnF3ONH
         6sJP6Mi/ww+vkEHGZLO35+Ge6GN1z4g0+RaVu5pjXLls1IJ4sKFbJvHiaansRoIAFV+2
         DPYwIe2Hzq58BXHplmJ2IWG3VRWKJD7/fVhb9fdwmAlf5f+fYMIF4Sg6njlm1+/TkNGx
         sY9m2W8jcGLEPWYeNMYlIrT8o6H5QdDhUZB3i7fZBoN5ZD+yPH4zKzUiiG6nPgs1RF3v
         5YkjfQbkZA2hO1zSyRwggxSFh2oiDvXOq5UOKmJJuhajFS3HLnM7ZvjW3/C5Erz3M8+N
         CMHQ==
X-Gm-Message-State: AFuF++mRPUXVrK+z6J8oXQqD01ISoGLxykBTbI5G8ecjw0+SOB9M8sJe
	iN3gwgBWKjwO5ZQ1JyhvJY9vh8M9UDQnWn4KxkJrMEl79QOec7cs8B5HjE0+Az74WPcBMhDXdVb
	Kryauu1Gl7c094JvFCPJggewXONFqcncpVZ4wBa4hsON+rsy28pNhLuMJ1Gbx7kvi
X-Gm-Gg: AYBFou0J3eNCsauB3qB5cFW5OHRJxDbzpGKihoXnCLziZ1skuaE+A+NqNNCYy3tBuke
	3tq2LasDM7YTjperDm2uf6FA9edwUWKwZyiMsOZ0IHX2nxtVPMAFJRMGiJybOVesVAlTXqBb+55
	aYnOpWogONP9CX9zB9yoQsLL1wnnnU5PJAdqBt2IyoQ6yLiR/YGhb6RUOk+qOJtRh/hles4KnAA
	MWtdgnYrrcbriwerHdIWBYsK6mXMRCsB1y562B0ZSHjyeIfeHF8GEux5sXq4H7V7Dy1nDXliUtd
	z36/fapBPJ76aQjUMdLfHj03QLZLfuT8MqO4Alztj+JJMy9JrZ9+ETnsU1isxNvaCfBnKUgAl95
	8N8XbT0xJ9rz+EQ==
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr12518788137.9.1788882469404;
        Tue, 08 Sep 2026 08:47:49 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr12518759137.9.1788882468775;
        Tue, 08 Sep 2026 08:47:48 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm500620805e9.4.2026.09.08.08.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:47:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:47:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
Message-ID: <aqAuIjzyZDqatLEf@lore-desk>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
 <20260908-pci-tc9563-aux-v4-1-c7fc7778292b@oss.qualcomm.com>
 <20260908153429.F3BD21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4rhpS0uzaH8VFat"
Content-Disposition: inline
In-Reply-To: <20260908153429.F3BD21F00A3D@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa02e26 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VabS-W3W6dOqDnpvnaEA:9 a=wPNLvfGTeEIA:10
 a=cCukBUQwQ2FYGauE-EYA:9 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: SfwNjgwDQnnhjvJADfhiUH5eKAPbhmIG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX36HdYfO+U1g+
 Mr0qG8jFDvkH+kxaWxQgmVy3Q/euXMRnw8vbGL6mk6OAl/PPR+3V1GkrvehYvmYn7R7GDc3RTLs
 vHTYkHBq1D0uFkNv8sjCglCKEbPzvRg=
X-Proofpoint-GUID: SfwNjgwDQnnhjvJADfhiUH5eKAPbhmIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX6VyQvWWQ09m8
 sHE+qyssqglAYkYVIduLpbbTT1tnMjpZCUx/9yRiAqt544dzwbUkgTrED770nAYNOWVTjSEWbPE
 4GJNwEGKG6+9E5MviDeeQqNnx9E24yPLFzpCJT2Hu62y4QV/GKR8zbovQGeRRvXzBpo3s/3GDYT
 irFXmqr3Pc1ZH+jXnpKkwfYgGXI7YHyLesv92OruIzg6gtFqBUo2SKScYNqvknG+WNo+caf/h4e
 Q/slgJlNzbw/d6e7iFYvER99P6857KVfzjK07sOhPmWHMa7WJvtWNrEjxs9r5OLMxd0Ue6Lhwbc
 hNuzbSZJ7tmCQ/fLTVg1NadSRxAEifH1pqJ7Ds6PtdGRRFxRn5H2KkBR4iDEfpEn7u07vJ7/vJ9
 jZ9wJuqvjEelDsJbaDBmL2bBrijMuRi/543F8hOr0/JTbywtRHcB2MJ+gRni3sLjxG0JfEWLwIV
 K8YiXrIjahpjSf5wTEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080170

--v4rhpS0uzaH8VFat
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The newly added GPIO provider capabilities 'gpio-controller' a=
nd '#gpio-cells' are missing from the schema's 'required' list.
> --
>=20
> commit 6d6cb30a1eb86b847e98eea66d5ba6cc77a091a7
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>=20
> The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. Describe the switch node itself as the embedded GPIO controller
> and document the per-port reset-gpios property.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml =
b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > index f084830c6d0cb..2f03e4e45114d 100644
> > --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > @@ -31,6 +31,11 @@ properties:
> >      description:
> >        GPIO controlling the RESX# pin.
> > =20
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
>=20
> [Severity: Medium]
> Should these newly added GPIO provider capabilities be included in the
> schema's required properties list?
>=20
> Looking at the required list in
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:
>=20
> required:
>   - resx-gpios
>   - vdd18-supply
>   - vdd09-supply
>   - vddc-supply
>   - vddio1-supply
>   - vddio2-supply
>   - vddio18-supply
>   - i2c-parent
>=20
> If the new capabilities are omitted from this list, device tree nodes mis=
sing
> gpio-controller and #gpio-cells will silently pass schema validation,
> allowing incomplete configurations to enter the device tree.
>=20
> At runtime, dependent nodes (such as the downstream ports attempting to u=
se
> reset-gpios) could fail when the provider is misconfigured.

In order to introduce any ABI change, we decided to not define 'gpio-contro=
ller'
and '#gpio-cells' properties as required.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260908-pci-tc9563-=
aux-v4-0-c7fc7778292b@oss.qualcomm.com?part=3D1

--v4rhpS0uzaH8VFat
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqAuIgAKCRA6cBh0uS2t
rDE2AQD/3FoEIT8ZWA+nmc7XAWg/ismfF4qC4W/Q8+Dw8L8L+gD/SkTTEEhXw39X
eGdtUcoL9OEBrhsJtZRU6OiiAGwr7wY=
=HGTa
-----END PGP SIGNATURE-----

--v4rhpS0uzaH8VFat--
