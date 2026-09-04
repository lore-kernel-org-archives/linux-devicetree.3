Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6638B7DB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532523; cv=none; b=BmcwqyYKqIpc+Sy/eqilNeA62PZ98g9ueVi4x1GIt3HbSIFimrs+LzARVQxKBYLQJziKM7CSqJ+mcTFGaPlddy07mj/+CZ2RrklUpY1az6mXXmr2CCqfRkn7bWpnoMfOuv5p/C/w6YvdUtV52HZ5el2n+rT+31JYgFbPauuY2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532523; c=relaxed/simple;
	bh=pZKTVhTO93s4fP8/iVQrlhUlfkTSYeUnRbwVzDjw/80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHb7F69FvIQX2p4xi05Wfdm584eZOP72JNQZzE/D9MkgTzUWHvLwJap+0tceIa4WI6H6u4AiIIzsaeUlMOJxrJGWSsyzYNyLEXXrBHhzqWsxCqF8/7dg+MOKiPPibyfjEVwU4D+mcey7pvNK2JjE+sEa6C6dzZqhCkpix3oJXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7RgH7tY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thti4ZZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7RgH7tY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Thti4ZZJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgrGj3057536
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 14:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWwUUTVbhJgNNGfDPzA8/VcC
	f/cj3xiJQEj61y8nqeQ=; b=Y7RgH7tY1fnJXfokcyRO8TfKGpA7XpNETPsPiZNS
	EeMakQl6WruaUpXgK2spSsSWTDdaVOWzujzSRbvls2HHXYa89k7cEE5v8ARpzLUb
	fI5ggBAGLbMKzUDXDGg0n9aMIFsQnHhJpfC77BWjgSZY9CSxNNHvREH71k+IdljT
	3oYwRmFV9xwmnShn7wFFNPg/amWW5r0nZs/taAa2AuUOUFEuLbQ6fKCrWI7GyZBA
	pbqYNGxElvbI3ojADYEPcy8r99BPJw6EO1fNPmPpBXcTZ2I4eoVcQeF9/6vOdicy
	8OY/xhPjt1oRxcDITswFrxLYJFbuFT57qKQH9KZ+1MQI9g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp40j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:35:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-756261d422dso767187137.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788532519; x=1789137319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWwUUTVbhJgNNGfDPzA8/VcCf/cj3xiJQEj61y8nqeQ=;
        b=Thti4ZZJPTD7WKyGgrGhAx7qUoT3k3atf9tr1f0HqA2nGbKrF7oHWiO/ln8qXVnPsv
         UjzNLK2iWCy4eZV/3pW81C4cPGNzaYB+86nsOVQATB8EVtTjIDYEMsUb+PzOoKIRLEzE
         ic8AnmvjodgQb7YA2YRgU021CugajVnLupjAy0ZCtnrl+iEkdmDixfSYvCSn8jNocGbQ
         BbI1eL4sjuNs1n4qIzIKP2a2guMU0QtsVNez/VqqmacLaxngyheBxRmofKk/UvesvYTg
         7cG/NFWF4Nt64yZdL5EJJ7fpFURRjQHxnNMv09OquBBBYPqrXJ81UQzNS92jRs06ctlm
         LMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532519; x=1789137319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWwUUTVbhJgNNGfDPzA8/VcCf/cj3xiJQEj61y8nqeQ=;
        b=MonE8THEyYCu5x+0H4PZJj/t5zMHWNxmdaDmb+Fa45bNm9iiaUKXEKMkc7hEfBB/X0
         4tgWg9n1nT8HXsh5NjgvdcM1wkeh2VAauqlX5KP0qop5Kp9jMN2VViLwOzkRHMbwxMTU
         l9dn5h5ubCftLnWjQ2Pd5UhHYt2j8CMntq/YiDcEnpKMWetQ6aDLeztV4KLmGax9au+3
         g83n9sqxZTZ1jPTzb3QtDI5uw2r+ZkYwM6UhxK9SZAZyHjm5ekVOIFh6MxUwBEvlxYAD
         dgbB++MzexoXqNb+zYyPyZy+8GaF3BfcBzcwMAA4Ed9TuCqf05AheeQ+TgochZvibpzW
         V7Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzW9Vs+RkOuF8fcx76nyUjTLlURxzYh6X4zgP5gtKTGsqBs1ePQzPDjek5qsQrkrQuLC+/US0INRS3m@vger.kernel.org
X-Gm-Message-State: AFuF++kd7ur5KYe1rOJT7XDIoQ7k73DCw+EOShhyo8dy3v9DpoymT9F5
	KcAtb9e5BM5N/BnGiytwwptel1sGPk2s9f9BAz2c+cEmu879D/bew5SlvMm+qIVofPqSOhDp47u
	EpmBLTLsfehi4ImkyTCBALiw426t79m8uaVroquVx6uukFW37XbFsuTF/P95xsYI2
X-Gm-Gg: AYBFou2UJzpwopoTp34EVOftAaLnTSBcrNSPG7MbxPLmoMb2hF1tWYLhm6KdoWyXxWM
	+BJa+UKOrM1S/BO/gLAkrsOw0LE77YUw+JKzOLYqTK7mEl7Hawn818buRxPssxtxed6IsodnmBc
	CvloDldvajP7TPK3pzgHjHfX2MSirsy7XS9D4+7Fbgrst7ZIelva2fefznLytBn9GoruXSop+cL
	bmkMHrNNlo2gB4lgDkG4RisZ8BP44VFjlHM+nzeff+XKDjn/IgAbwXaALgvAAotYsvc5hlx4Q+J
	vljWPDngNPd+eAPh3doidFLb16oZFoIIJDwXMGG89iUw8KfqmMopoJaBRaRjApD+BAyrMmPTHYR
	RfYVCvwG/D2m8Hg==
X-Received: by 2002:a05:6102:f9b:b0:786:8a7:92e3 with SMTP id ada2fe7eead31-78a4a72db1emr2699109137.2.1788532519077;
        Fri, 04 Sep 2026 07:35:19 -0700 (PDT)
X-Received: by 2002:a05:6102:f9b:b0:786:8a7:92e3 with SMTP id ada2fe7eead31-78a4a72db1emr2699029137.2.1788532517344;
        Fri, 04 Sep 2026 07:35:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm117302366b.36.2026.09.04.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:35:16 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:35:15 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI/pwrctrl: tc9563: switch per-port reset to
 GPIO descriptor API
Message-ID: <aprXI4UUaIk_bMFc@lore-desk>
References: <20260903-pci-tc9563-aux-v2-4-34c625b542c1@oss.qualcomm.com>
 <20260903220311.GA2250435@bhelgaas>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lE5DYGO/JfD+FQa1"
Content-Disposition: inline
In-Reply-To: <20260903220311.GA2250435@bhelgaas>
X-Proofpoint-ORIG-GUID: 7xLRMDiCouxxKcdkOiXsgqqzf9ZSe41P
X-Proofpoint-GUID: 7xLRMDiCouxxKcdkOiXsgqqzf9ZSe41P
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9ad728 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=OhhHAVtvP0aG5I1CcfYA:9 a=CjuIK1q_8ugA:10 a=wkYq-V80zuO17UhYMvoA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEzMiBTYWx0ZWRfX1xdGKbgnZ0Jc
 For+lxah9P/fwDxc12fLm4/bEpS5ADi+5kvo0w1yeJlOK76OqukfevAvZQDGLmOCgNjt+WteJv0
 s+wYVi3h9tvxHi5yyi+YudF4rw68lIBYhXweGcBQ0IPSKqCxu6eOycfP3ZFIhfrNn3j4UqhjFUC
 2zTPf1CgOtwGgtWskSmaWcZmZ5HTnUPeRKzwGPKpaDpEDTHbZOjHQ5GAgVigwgK/jO9lw4ZFJ2m
 Wgfjt35k9Ye06vbmWnyYITncsbE/Q1rxjCGYLiSMczIm+MvpFxap2bnPFfdK0XcfQKt8xcw5F93
 gW5WKGl0E3igd4BeaGK+IcbxX9ioCSOl7V84rqcPw/2NMVp4FF1W1RG7QUW2IvV2W+SJUz1kqwA
 g/PXtzAvNBaaMK8rPxXpPOvdYkzy1Wo1OKPnAc+NZ/6TRQ/HmbYZhwqw8s4RCXABK87YI7NVH7O
 ASsqsy2cmVkpPIPuWEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEzMiBTYWx0ZWRfXw6fyBZh1j8mU
 SiNhE1qgJeBHnQbdFHILZahyVeHRx7dt7uvfZgKgaebM+VLWDwOrXiiNGmacGgKNqe12LwTADlf
 UZWr0P8ZnRMi+FkfapucwvuvHzCNyi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040132

--lE5DYGO/JfD+FQa1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 03, 2026 at 09:53:00AM +0200, Lorenzo Bianconi wrote:
> > Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
> > definitions, which are no longer used after switching to the GPIO
> > descriptor API.
> >=20
> > Replace the direct regmap-based per-port reset logic in
> > assert_deassert_reset() with gpiod_direction_output() calls, falling
> > back to the legacy regmap approach only when no reset-gpios DT
> > property is present for a given port.
> >=20
> > Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
> > tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
> > PCI downstream port child node. The lookup is done lazily at the
> > beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
> > is registered.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> Capitalize "Switch per-port ..." in subject.

ack, I will fix it in v2.

>=20
> Question below.
>=20
> > ---
> >  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++=
+++-----
> >  1 file changed, 73 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index 6df512d78b54..09ab4718db8a 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -57,9 +57,6 @@
> >  #define TC9563_POWER_CONTROL		0x82b09c
> >  #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
> > =20
> > -#define TC9563_GPIO_MASK		0xfffffff3
> > -#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
> > -
> >  #define TC9563_TX_MARGIN_MIN_UA		400000
> > =20
> >  /*
> > @@ -85,6 +82,7 @@ struct tc9563_pwrctrl_cfg {
> >  	u8 nfts[2]; /* GEN1 & GEN2 */
> >  	bool disable_dfe;
> >  	bool disable_port;
> > +	struct gpio_desc *reset;
> >  };
> > =20
> >  #define TC9563_PWRCTL_MAX_SUPPLY	6
> > @@ -349,16 +347,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_=
pwrctrl *tc9563,
> >  static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl =
*tc9563,
> >  						bool deassert)
> >  {
> > -	int ret, val;
> > -
> > -	ret =3D regmap_write(tc9563->regmap, TC9563_GPIO_CONFIG,
> > -			   TC9563_GPIO_MASK);
> > -	if (ret)
> > -		return ret;
> > -
> > -	val =3D deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(tc9563->cfg); i++) {
> > +		int err;
> > +
> > +		if (tc9563->cfg[i].reset) {
> > +			err =3D gpiod_direction_output(tc9563->cfg[i].reset,
> > +						     !deassert);
> > +			if (err)
> > +				return err;
> > +		} else {
> > +			/* Fallback: legacy DTS without reset-gpios */
> > +			switch (i) {
> > +			case TC9563_DSP1:
> > +			case TC9563_DSP2:
> > +				err =3D regmap_clear_bits(tc9563->regmap,
> > +							TC9563_GPIO_CONFIG,
> > +							BIT(i + 1));
> > +				if (err)
> > +					return err;
> > +
> > +				err =3D regmap_assign_bits(tc9563->regmap,
> > +							 TC9563_RESET_GPIO,
> > +							 BIT(i + 1), deassert);
> > +				if (err)
> > +					return err;
> > +				break;
> > +			default:
> > +				break;
> > +			}
> > +		}
> > +	}
> > =20
> > -	return regmap_write(tc9563->regmap, TC9563_RESET_GPIO, val);
> > +	return 0;
> >  }
> > =20
> >  static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
> > @@ -393,6 +415,41 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> >  	return 0;
> >  }
> > =20
> > +static int tc9563_pwrctrl_parse_reset_line(struct tc9563_pwrctrl *tc95=
63)
> > +{
> > +	enum tc9563_pwrctrl_ports port =3D TC9563_USP;
> > +	struct device *dev =3D tc9563->pwrctrl.dev;
> > +	struct device_node *node =3D dev->of_node;
> > +
> > +	for_each_child_of_node_scoped(node, child) {
> > +		struct tc9563_pwrctrl_cfg *cfg;
> > +
> > +		if (!of_node_is_type(child, "pci"))
> > +			continue;
> > +
> > +		if (++port >=3D TC9563_MAX)
> > +			break;
> > +
> > +		cfg =3D &tc9563->cfg[port];
> > +		if (cfg->reset) /* Already discovered */
> > +			continue;
> > +
> > +		cfg->reset =3D devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
> > +						   "reset", GPIOD_ASIS,
> > +						   NULL);
> > +		if (IS_ERR(cfg->reset)) {
> > +			int err =3D PTR_ERR(cfg->reset);
> > +
> > +			cfg->reset =3D NULL;
> > +			if (err !=3D -ENOENT)
> > +				return dev_err_probe(dev, err,
> > +						     "failed to get reset\n");
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void tc9563_pwrctrl_adev_release(struct device *dev)
> >  {
> >  	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > @@ -480,6 +537,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrc=
trl *pwrctrl)
> >  	struct tc9563_pwrctrl_cfg *cfg;
> >  	int ret, i;
> > =20
> > +	ret =3D tc9563_pwrctrl_parse_reset_line(tc9563);
> > +	if (ret)
> > +		return ret;
>=20
> Seems like this call would fit better in
> tc9563_pwrctrl_parse_device_dt() since it already handles similar
> properties and nothing in DT is changing.
>=20
> But I guess this is because the GPIO chip may not be registered at
> tc9563_pwrctrl_probe() time.  Could tc9563_pwrctrl_probe() itself
> return -EPROBE_DEFER?  Returning it from tc9563_pwrctrl_power_on()
> seems a little weird.

Correct, I am not running tc9563_pwrctrl_parse_reset_line() in
tc9563_pwrctrl_parse_device_dt() since GPIO chip may not be registered at
moment (we need to run tc9563_pwrctrl_add_gpio_adev() first).
Moreover, pwrctrl power_on() callback is running during PCI host bridge
driver probe:

	qcom_pcie_probe()
	-> dw_pcie_host_init()
	   -> qcom_pcie_host_init()
	      -> pci_pwrctrl_power_on_devices()
	         -> tc9563_pwrctrl_power_on()

But this approach will allow us to avoid running pci_pwrctrl_destroy_device=
s()
in qcom_pcie_host_init() if tc9563_pwrctrl_power_on() returns -EPROBE_DEFER
(e.g. if the GPIO controller has not fully probed yet).
If we return -EPROBE_DEFER in tc9563_pwrctrl_probe() this kernel will destr=
oy
even the GPIO aux device and we need to create it again during the next
attempt.

Regards,
Lorenzo

>=20
> >  	ret =3D regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
> >  				    tc9563->supplies);
> >  	if (ret < 0)
> >=20
> > --=20
> > 2.55.0
> >=20

--lE5DYGO/JfD+FQa1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaprXIwAKCRA6cBh0uS2t
rLQRAP9h8FPk+nSsMHWkRCkWQxLxy19w/oaZm98nYS2DUsfO8gEAihDrXGRAJoSr
716TKsf6Kj3T47+gwSkA8yhu9t+pOAg=
=zJQP
-----END PGP SIGNATURE-----

--lE5DYGO/JfD+FQa1--
