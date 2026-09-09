Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF3563FB5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968311; cv=none; b=qf+UDNzA/zED6ihSqiSbXuI5qy+LQ/ZcVokpD+9c5zWHBXF1nKw59/xlBhceYmzgiC1XJ5J1pxbhtCdARSvHN3ZqQUHbnfc2mdlCnXOmmEZX9okEsBH3A2F1C0Fz/dUVDr8hosbeGJzrXAjFOnXlgoeEbzTSjDpMvWp3F4qFjTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968311; c=relaxed/simple;
	bh=rTjQD0AWXvJKBlAO6G8aQGljW+/ivZFhpjJrPWqIlqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8Q4PwrakFwS4hZSdEbaWNKPWTzB1IM/pA/OY0nQJgpIY9BUcRa32o7UotFfNdetX7FO6d4ACToR7wEDypoCyen5KfNFc5T8Nhd+bK62WzJwAehG6/tcdB8KxbmV2cL4gtHcAUTfNlmAMT5FPucrSvNWPa8x5/2a8OmGcqA7Jus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQRvUREd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5Espijx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQRvUREd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5Espijx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU26q2019009
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 15:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIrVvX335LUhs5A+Yn7aX2BB
	Y+6j0On/IVOblwEFVk4=; b=jQRvUREdk1xS2Lx4iYJfUiiZn/b0gjtXmFZErRNs
	4TwmeHc58s67Q7do9hwxyDMvcuSNiprHsf556ELDPnKSqHPQzheHWV2UXrlMCMkd
	7CGva87UV5fPGO+64vSFrBeeVwK9aN6sVD1IKOo4xyA1ZyFpo7G/j06S2X+nL9Cu
	EFcJfuiRVBtmxjwdZm/eJha4k7RIZwY8e5eT7j96oiSt4R601+iUaXjkrQeQrQ02
	UI8MvvE5joFfMyIvmakT7LHoHWu09Lnu7xIQonf5V7Il8n5j+dBnnSu6TkX0oX2I
	Au1GoU25EYBTxOWtoBYYMHx4SIcR0+5XGinX4Yyy3Nwspg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x95xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 15:38:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7847917c402so4138838137.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788968308; x=1789573108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIrVvX335LUhs5A+Yn7aX2BBY+6j0On/IVOblwEFVk4=;
        b=j5EspijxangH5xYX5mECZ8Jo8GBXHk7VaTJMw03wR+cGjWeNLNL/sAtEaEK+q0/RvU
         KAkelkCbkTAe/ygb6xPBAuWMpCHQaOOBiSz4R3fLvMsNGuNqth/ij3boLuaQ3aHOrZBr
         2ALPF2UQ4h5bVDY0icCVk0tQBCklzzA3rbt5m2Ytas133JoNBrNg1FaOZgLRGFwhTNLq
         2tZGYYnaFc3xm68mivOXYBQgcenbyAW8MoIaWkNc4x8z393rC9e3tbX1rgAl6abP3ALm
         TJ/rHDrEWUJHSj9NozgzEtrLxnteMoRnx0xUx3JQ2x+p7vAfL9Q9D6oMyIQjiGJt3FGj
         K++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968308; x=1789573108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIrVvX335LUhs5A+Yn7aX2BBY+6j0On/IVOblwEFVk4=;
        b=cjI+8gqOhrhko7zTUPNJVpKlLysHgr/UcRD+MoCLcFTjpxfOxuNiLSS+AcCXK3EGnp
         7eOOD8BwQVfJTRE/rniAVGNLCeKjWAqjfpsx9f3+TWmBvnSLcZoc1V2QZVkefBtLQ0sY
         i/eVXeWFskindIijY6jsSqASJh/Ur0cU0ZGRh0Dr0iL186EVIokjpzOGpnUVmztB7u06
         gcZatzXN7MjP2Z6ZegTD7pfRzKQbXNjzExKgBSoa9SktU+K1w4GUFGhzTbDx8/psuN2z
         prb3gANiKtbkojrlJc2PHH30k1ToDKckCQ/7VABuEt0ElRsKjbNUGvk6RV91gEvGUGs3
         W6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzJLsOSlURbdT/j6BfiWfannKMolQAn3GSQMENErulMmnNcDY2+PCv60IHpjac9SrF/L/ugQyHL84ze@vger.kernel.org
X-Gm-Message-State: AFuF++nDIphntMBsnfdxG/U6Jo7KO2BRS/q/+I9OHt9appwqnh04rsfA
	lbJ8h/XXSWBA4pEMFH/HOT+CQl6l+PNWr+tpUuTNys+BxZcj9Jps0MmILMCIY8rbcMEGS9Kg1qn
	0+NaWx7f4DjjzvCmoQuWYlPHtbY7m7WDk5KRArgDEzLmLRwymljJLwdGW8/KAjWXN
X-Gm-Gg: AYBFou39BUs8Rjgf19UE5woS/tnxHMNqi11dAlkcF4g1etuBIUnt5uf4JLh4ZDXwNUM
	YoBFh8qYFBR4K64i2VuaQUmnuc5qDrM1hbcsL6nUYXPSBnGHCHGqMbxh8f+4gp0Qd4CpOd78fSJ
	ZZdC9M2OsOIrqSVxaZfVJUDfE1v11wmkw6fnW8fe8wdkuLVNS8vBRJSRaoWTaV9ORNqQBvoW7ux
	FzxUxsGic+9f8jecI/T7/miG9zioEM3PCcwqDjuq+Y3yv5lpUDpQKgBY7lSsPr3llMQhUDnh78r
	0Y/Jj/lYi3XCkHJSdgK18LR7mWeU2nxEDgTaNRmcMgjaxYQSmjLvAKr+4Un1mYZzn2zf8fBCL3O
	BdMZBywK/EfJDig==
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr21279649137.2.1788968307836;
        Wed, 09 Sep 2026 08:38:27 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr21279354137.2.1788968301950;
        Wed, 09 Sep 2026 08:38:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fd532dcsm61690985e9.1.2026.09.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:38:21 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:38:20 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
Message-ID: <aqF9bHTBBMmRhmn9@lore-desk>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
 <20260909-pci-tc9563-aux-v5-1-c9b33f56c8d3@oss.qualcomm.com>
 <20260909150403.A5C511F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekoMoU4jMT3u/jKP"
Content-Disposition: inline
In-Reply-To: <20260909150403.A5C511F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3NCBTYWx0ZWRfX3YmCoOACDjTV
 zQPYdcCXfi+j6nkj45V+YDBZOdr8y/hrDIPklwCYxEqCSmicGVZPcwH0yh/vYB4HlEEkFnDibUc
 kL5/JptpIUttxdZx0Dwqq4iTPd3wlqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3NCBTYWx0ZWRfX8W81fjt7arGn
 tkzex+D+d2C7OVD+dRglnB1RuGrSSsni3zbS02FNpZs1p8IUA/+4q8hDzUVoR+DZU1luXvfOL6n
 +UuY2ZN7/mcTJQ2zP65Uu46GUdVvdLRybQLVZZDqHFZCsWIUXleDgWBFH52CBxP99qCtRSelmwI
 t2WsLpi3TX2lGmgEedku2eaw+Utjb3TeQudXjUY0rgQQS/LW2HBHjHjeKZKlLAm8/t+wTrnyoSX
 WbT3t6LgQIEzJFkHbckwRHYC/jxf8IcwyT2gv+gKwzudylMTpi5JqRT7Fzbp9S1bRCgpCmgLHnj
 GGwl6fOb41/8QY27it5EKHciuI6KrraYk4Eq6TOez5EOi9KRA4m2pDJTjPC7Y211p51ooCzpWOg
 +20C1U5rJuE2pPIdgCc5NQGdbDsPNJgSwAp7egW7emzaN7ilibWR9YflCFYOmyVAcY+2tCJ4uuo
 Xw+Qzfhg/icAfKHpkfA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa17d74 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=UfEYJwnE5WuK08dpBrEA:9 a=wPNLvfGTeEIA:10
 a=6NAFynQPVF88eBM1lewA:9 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: LPwgw1VlUp0mrJ6IwZhL4PYWKG47iePg
X-Proofpoint-GUID: LPwgw1VlUp0mrJ6IwZhL4PYWKG47iePg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090174

--ekoMoU4jMT3u/jKP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing Required Properties for new GPIO provider capabilities
> --
>=20
> commit 384b355928f0212bcff0ab6c4447b15d28dc4109
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>=20
> This commit documents the embedded GPIO controller within the TC9563 PCIe
> switch. It exposes the controller by adding the gpio-controller and
> #gpio-cells properties to the switch node, and updates the example to
> demonstrate downstream ports utilizing these lines.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml =
b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > index f084830c6d0cb..c4ebb99f50c37 100644
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
> >    vdd18-supply: true
> > =20
> >    vdd09-supply: true
>=20
> [Severity: Medium]
> Does this binding need to include the newly added GPIO provider capabilit=
ies
> in the required properties list?

In order to introduce any ABI change, we decided to not define 'gpio-contro=
ller'
and '#gpio-cells' properties as required.

Regards,
Lorenzo

>=20
> When hardware gains new provider capabilities, the subsystem guidelines
> stipulate that the corresponding standard properties (gpio-controller and
> #gpio-cells) must be added to the required properties list.
>=20
> Looking at the required properties block further down in this file:
>=20
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:
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
> If gpio-controller and #gpio-cells are omitted from this list, device tre=
es
> created with the pci1179,0623 compatible string but lacking these propert=
ies
> could silently pass dt_binding_check validation but fail at runtime when
> dependent subsystems attempt to use the GPIO functionality.
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260909-pci-tc9563-=
aux-v5-0-c9b33f56c8d3@oss.qualcomm.com?part=3D1

--ekoMoU4jMT3u/jKP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqF9bAAKCRA6cBh0uS2t
rAobAQCReUFtc/l5ysciS8O9zot3R4eXhbP7ioeZnrBFv/9JbAEApyvA9fzzEwQ4
qK2BvU7gi3eJOwKs6zm0MmTSKXF2eAg=
=OpeS
-----END PGP SIGNATURE-----

--ekoMoU4jMT3u/jKP--
