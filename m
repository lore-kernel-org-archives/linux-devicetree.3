Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08989569F39
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968547; cv=none; b=qjsJpqje0wTzzXbMCm4qVY1M+AQQdzK1/qnO6941x7cgWFCmjCcjvWwRLsJlIokjTwc63biz1OUlTOoXf2pJV+QdKYec7OH8mjOre0cQiN0mgm+IsztI/NerR3PdMpFRArPlNzz+3cIAswE0TX4c7Xgas1hZd3SrSWvEu7BIlpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968547; c=relaxed/simple;
	bh=a64GDqnqJM5Gcxb2TXIlPcd98cEhnNLarprMbWo/s1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzJ8jtKb7QA3VuBXjePPKTp15gJHCPCh5ab5qDkkabdciMNsqokfHpxczD+xVCwszndkkrDrJCjgEYITikJRrPemTyAwZBO+/XB9Flh1kVil2ULPSQBiM4VcnbY1mf9OlpUm4/l2O03AD+/fIIsKZboHuX4aD+j6JcPZjffacKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+9hzrD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ci1wDz/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+9hzrD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ci1wDz/X"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFKQ2171930
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 15:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6xzuTsxy6Ya0ZQsG74zmxLXv
	e+omDninFQp6NvwxOLM=; b=j+9hzrD6omM2dcqkJYGS/06kGJdbLNA7gIF03v65
	NJ0Ybgr2c2XeVK6+ahLFI8aKvPcTgKEd4V+uzxUeDDZhIrgcAq/lMuuzBs8Xj/14
	OYppU/shGuPV8l4mYCGdyLl3DcGScFDLbkSWOHK9SrCGnjZV5JMPmaIeMNorp/ue
	hvchFKECrB83rUiLVsHTJ7sMsMSwv46MKHPki5PrCRb8XfjrL1ck3IMgnUkKukuR
	6It1xIHlMQ5uABYr5Pr+f41+gdOkEjrzgOzYFJ6ZdHC6z9RqKDOUtkDoSdG57+Lx
	lEnszGkss+LOkGcwhTUs4tIjzsc+8Ky3BYOMpcDFDDkYig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgh9b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 15:42:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d34a0dc8so4582566137.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788968544; x=1789573344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6xzuTsxy6Ya0ZQsG74zmxLXve+omDninFQp6NvwxOLM=;
        b=ci1wDz/XVpbFNic7XkpnJa9Hu/S24772eO52jwC4D0TDb2K+eogAni4QViZBp9zOQS
         b+w1VE4V0KnQcIZpV5NNBF2DWLCN2smQbEvZQFzNjZQQxkBwslhtm7yViqyEnHeQLTjV
         vAWRf5kFxZC9EoAt4ykQe8L2et2uJLmg3fcEAqLyzTom8vmr88pnkAzYj0yZWhbU1ev5
         y+OlMFSNqLWOCyai/M9OGcovSpZ6Sb0ymoVKaJOEJyTnze0XBnTYily2O4RA8L9V1umu
         YLhrPIaiCkiBOmdXnVwr5VRc6HeFPC/S5VU9RAO1MJb7EtdIwiBsVoV3BQcAMXXyRBfJ
         y+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968544; x=1789573344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xzuTsxy6Ya0ZQsG74zmxLXve+omDninFQp6NvwxOLM=;
        b=fWwdQjUzth9o3Uvu34LUy7jkCsGLwwapdIFbF079q2VEiXiyyUeIcLvwI400w5DaXF
         ksTfEx5/aYweXQdGvbMR05YHufrt8OP7efSIpHFl1FdxdeQ3EiFxkEdlYATkBUM2FoFF
         RhhBcyPCJLfdg84mGBq8qSWilJdmmPHrKYuYKpRPLOnKLxHIn/2lY9UTNPF1Vakw6GqO
         do+KIGM7ZIvV/PpFMnaDnPsGMBVyRiZGCHZbqvEvlQ7f064TxvjnmVb/LFHsdeWaljh+
         GyYSxuNZZqfKMubeZlARuppqFSKP0gPd5+2tHuRcX8OMFDiyJ0F2U68DAZ04bh6+zKF6
         sSAg==
X-Forwarded-Encrypted: i=1; AKwUvBzwhlUYnnEikVhbo2tTt3aFmzGvSfdtAkucEJ2N0H6alapIOEOt4SCQRtBBBgC5R/FzvHcwwb1Y9MH3@vger.kernel.org
X-Gm-Message-State: AFuF++nc6aNoG+uWPdSxjCOxU/zuRBHrjy/xobcXWLIdpFVCk5KB0CEW
	hhKGeu5SjRx0XzLqF805sI/iYTavjnL/C6ca/fTwAyi9L2ngLQBw9Wt2A3OO5/VLKgzCxI94car
	abuh9JcsxWBgUHm513rQYUxj0xCgSoqI4YoSeGIbocnZmunqrkwTEBBcpIU+sRGirkK5OcFXt
X-Gm-Gg: AYBFou0+BR+LYGwXQtHGhvew3sarjFUAQr4+k/FBR8eI4N1saQt9IBzmICdDfHGdQ0B
	bY5/T/fSPNSGUDs/OMzf1NhJoe5e5yZcTjwpStFueyJzPPguUYoEMvGYtoPgUJppdDUm3MpE3l3
	tje0g5bS/Ne8OVfa6F+qSibshH/PUR+QY+jTfrjsGExY5CmroohdMBbJN7dbQ08n6pzqSLXOg5o
	ndOSlI1HlxEvw+pzPbuU+fnpXzLFPMbFZ93OF3pB3SDUPEj/Ne2H49zjL8zkfukllaNjQr3SZ+J
	zNyvO/6hnAuz0pwQyAfDioSSG/Frd6pDMLCKBsvicczkW5dGdLT6tI5g3l3uQJZMndF9YHg72Nn
	NA0bjYlUrzccYxA==
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr16962570137.5.1788968538792;
        Wed, 09 Sep 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr16962525137.5.1788968538064;
        Wed, 09 Sep 2026 08:42:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43767403f8f.23.2026.09.09.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:42:17 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:42:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v5 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Message-ID: <aqF-WDtoSEbsstzW@lore-desk>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
 <20260909-pci-tc9563-aux-v5-3-c9b33f56c8d3@oss.qualcomm.com>
 <20260909151551.2DA281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIEZH1p0DJS2V+dF"
Content-Disposition: inline
In-Reply-To: <20260909151551.2DA281F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3NSBTYWx0ZWRfX2uNzGcOSFlpR
 3jLuaSht0uKxqbIbIO/kAHMjNFtTz7yUBr9NTr+WhaFBmuBfrLgK9GaYwTqx4TQZ2wKeuEumtfU
 T2DX8VG+sy+Kss2FK5iymcg5th3rgqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3NSBTYWx0ZWRfX3JCXKhYIWkjV
 ltTw1HS0qJGocwPTs83pvV4cs1hQLNs0y6aYjdeBnOoMwobj32q7nQ/mPNkPh649MuzpF/bOWeK
 hVMaaQmwWbh8ixuMBnt5MVt59gctyieiKRgVY/u6V1BaxGwbDMeC2YG55yASisKpR5YjIqQVch6
 9FQmTyhmO0cR22iLM7C8WQdelbtqQClVeoKsks0o8czobVCYlYBSx2MD/VyKU7usWYoz4m945YE
 ipliy0Fk5rCA3nvB30wdZHFK3puxBIN6JM/W5+ZliTivNmAbPb7W7UgPFzJC0O5KaALgyP8X9hY
 j1/bwj6hurOCuk0uS6XJXqIhsS3czDnZIwcxhpoYt1gTpvVrRqQVf+eWeA/Yd2z7TXY8jxJOO6J
 Q6TrX5EoWznJxK1zcrTX2+JgzirL+rYgrMqTM6yGZTg79v3nVlxKaBK7qavSmqCU0lf8iOS1OWK
 rBxjmUlqzILPIFKCt+g==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa17e60 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=W8DIBEWQemVwItpymzoA:9 a=wPNLvfGTeEIA:10
 a=bTiFXxHaIdIL6kvNrrEA:9 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: T_9ycbj-umt_uthyNLCah0WesmTUpPcq
X-Proofpoint-ORIG-GUID: T_9ycbj-umt_uthyNLCah0WesmTUpPcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090175

--JIEZH1p0DJS2V+dF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Auxiliary device teardown via devres races with manual power off=
 in remove(), allowing I/O to powered-down hardware.
> - [Low] Missing explicit `select AUXILIARY_BUS` in Kconfig for PCI_PWRCTR=
L_TC9563.
> --
>=20
> commit 6f8a88de67f080d18050c0ce0599dc8854f71eab
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>    =20
> This commit adds an auxiliary device to represent the GPIO controller
> embedded in the TC9563. It passes the regmap via platform data to enable
> the gpio-tc9563 driver to register the GPIO chip.
>=20
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
> >  	select PCI_PWRCTRL
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> > +	depends on GPIO_TC9563
> >  	select REGMAP_I2C
>=20
> [Severity: Low]
> Since the driver now directly calls auxiliary bus symbols, should this co=
nfig
> explicitly select AUXILIARY_BUS to prevent potential build failures if
> transitive dependencies change?

AUXILIARY_BUS is selected by GPIO_TC9563

>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> [ ... ]
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
> > +}
>=20
> [Severity: High]
> Because the auxiliary device is queued for removal via devres, won't it be
> destroyed after the driver's manual remove function executes?
>=20
> If the hardware is shut down and the adapter reference is dropped in the=
=20
> driver's manual remove path before the devres callbacks run, couldn't this
> allow I/O to powered-down hardware if another process accesses the GPIO
> sysfs interface during this teardown window?

During driver teardown phase, the aux device is destroyed first and then tc=
9563
device is released.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260909-pci-tc9563-=
aux-v5-0-c9b33f56c8d3@oss.qualcomm.com?part=3D3

--JIEZH1p0DJS2V+dF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqF+WAAKCRA6cBh0uS2t
rD1LAP9wbNdf1zUKYUrlR+yjRDTb9C3QrQZjvlyjjMPSUa49NwEAmE9UamdiPov1
1gWNEXt0HAz/GYW+07qobLMLmRHQrgQ=
=nasC
-----END PGP SIGNATURE-----

--JIEZH1p0DJS2V+dF--
