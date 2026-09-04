Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153748820A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529874; cv=none; b=NcmoD1VvTBzM0KNOjvxzWcalAGP3wBCcCvCJq1+tFRlddHCIu5nDsAI8EbtJysvFBBLLwAbNJ8ARmonVrgZv0ThSwQTNL6mgKF6hr4HMwSF4YV8Rl4PYHxI5tvBwg9DtUrCwDW6Wq5izFHHxCiI9DEHfMJvuWGGjL7JPfeoYUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529874; c=relaxed/simple;
	bh=z2esHt+ejmv7OQKxSE8vdxsoJaGIju5rEtZi2+jIiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocE/CUSseymWTIexsWbUWLXqrqXyEgPophf4AMRC01zp2ZgHlMqUDK7U3Jjpv8yZ02M31teJ+jd3uMvIBX48hLUIF69MEXtveYNJvPvAe8l9cnpu3pwINSBNfHvS/h84vVjxK8VXwLBQ6b6JreQPfYHAoH8kB5Foh5nmij8g0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+uxlH62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xtl7R6p4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+uxlH62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xtl7R6p4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgvL33121431
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 13:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz2jp8UAvQVC0hixBLaMAu6N
	bc13o3wiA7v7hXxixzI=; b=F+uxlH620Zn2HECmGPW1OIbHYSjiHPyMxqjOuLC5
	FN6YSOubq4VyBqDAXNcrJVeNLNkGFS7dC8jzgE3aiEXnGbA2Nwy8Th2WAk2Otv8y
	nlBWVWJLejPoHjs5EJgmzgvF195gUlC1sHojuguG8tP8FDa0gWdVOjMJbjXXksnA
	isndiEMVLv+4od8mDkDAnBXsY/hLrmckzIwUW7KYePANDHt7UGB0VG9wg8TQerP2
	hCnIg7dfayZDwu9zRzWmp654snjYsdVECMYoHA+7CHpxMYvWNXgNkW1gItJt/35q
	2h7IZWDl6Yy8IV3vb+vhQCSrITOBq4tIMIqYlNm47W3nZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fj4qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 13:51:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so209622985a.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788529870; x=1789134670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz2jp8UAvQVC0hixBLaMAu6Nbc13o3wiA7v7hXxixzI=;
        b=Xtl7R6p4V3f0L9ZSi4PHjsm0IQU8hIsBirXNKtKh+jCSFSUyXGCV37x2GS+lB9ceLj
         9O1Xeb/NV+0e3PRQnmBm/n5paB1XAKp41swDFENPvw4HcjUmIReUByfVkVF4bte9+MgC
         5e8uRMPdYbfvs5J0uCf/d6TzypiqgS2x0nKRYscbcpnQhleVpslDC2F+mwQ60SdqJb1Q
         qB5jLqjZANtvyW+7YpfuHqx7Gu60SkJ2E71ubcoQWYKRjP6nHNG5pauJhQSIyu7kJNVa
         K6uR35f3+2Rivc2BpNbVIQakHP1gGhMDShMAFVJfa9uKL+rMu/APov5/WA4NzOHwwpNf
         Qm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529870; x=1789134670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz2jp8UAvQVC0hixBLaMAu6Nbc13o3wiA7v7hXxixzI=;
        b=nwwQux02c1/FtmIDh6If9lPEcIuIgIN/1F3TGtpyVOF14+6LGCz0tnJqgEa+8eNewP
         j3cBVAg4O5d24Ts/zzpeOZnPl6zPJw26EGAFTU0vfIx+BIQ0+SWAy0dQWNsVR2ivkZsB
         wpJ0PrN9xdp76TG2FmmuK1PAz3ikKof642o6Dz1TlZzKDOiB2+VHOgm9FkloYhOeFa+C
         iiMwe+wvxFL4gZ+h2vVcrzhgqxQ5D1P2KZtBquNxC/WwhYUmDsBFk4LH3tF1CuVami4A
         8c7yW3zLgAWf95UA5QtjPqqMwupeYaj+bKN4xY0FnHibXQeG1jIsMR9rpFDRBccvxxwY
         GaLg==
X-Forwarded-Encrypted: i=1; AKwUvBymediH0W5fz+sa9SEvBjnxK1flNv8W0CJgYZGHgE/h+PzP1GZ4ekFSQ6lMYMwq7S1iz5DleumjZLHE@vger.kernel.org
X-Gm-Message-State: AFuF++m8EhV98iaP4ENR3Fd5EBP7HG8X5zujYgag/LHrSM3LoQQObShU
	xQqRU2ggrT/OotmUqTF+rFMdCCb3QWDuLRRf4XJflrdSBHj9ia7gIRzq5SiiljjxkFlkknwH9Lm
	4W/IsyfivHmEDVeZ0wcxTDkhRQvafpDH6aIM4dfFMzyQ/V4RReg5W7VCZ407qn17B
X-Gm-Gg: AYBFou13m2bb05R8yEcRTmeXUk+TE8uHRBFkOwHXoOWi+Cz3Xq7HYkWOkCBnsD5EhsQ
	y4f8a+HbAX4n+kGTkP7vzNdoPGnOeHPVbs9HaazWUhMavrP13XSQt1Nx7EYnVzLxzb1U5JIBT+X
	Q9kva+I0qgJphZn7LyrBH7pOd//hI3E1sN3x2hnBop1lUrINZAg/x3swpJsmMw6ZlZOIPIKhfHi
	tJr44bLA+Nd368JlwvPp1/TsFwJCgYpHbWsnFPADMR8xWB2g5bOLrXpMqjx6io8cuIUo0ed/1wN
	QAVCuls5IdIbaqQ5+2ZAlEUCnm3RszB6Tr0gCsy9EC/w1pUhuHUTcB8bLWuugQFMxfc8rNwKHS6
	qtjN7qGS9uIxE+g==
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr562397885a.0.1788529869736;
        Fri, 04 Sep 2026 06:51:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:939:31b5:4e08 with SMTP id af79cd13be357-939800fc582mr562389585a.0.1788529869081;
        Fri, 04 Sep 2026 06:51:09 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm6437481f8f.18.2026.09.04.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:51:07 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:51:06 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 3/5] PCI/pwrctrl: tc9563: add GPIO auxiliary device
 support
Message-ID: <aprMyjZs3Re9UCQS@lore-desk>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-3-34c625b542c1@oss.qualcomm.com>
 <3nlsilckqt673fs2qikpnniius7gxwxfit2xbwldp5ac74objo@yr5yhp267f3r>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgq1jszOkLu1v/d0"
Content-Disposition: inline
In-Reply-To: <3nlsilckqt673fs2qikpnniius7gxwxfit2xbwldp5ac74objo@yr5yhp267f3r>
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9accce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Pk19pllHZqhTeWfk69IA:9 a=QEXdDO2ut3YA:10 a=p8WpEMGEU3HvF4N80_gA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: he8zm_7Mod6uEpdjl0UhM3qDfba7C3T9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNiBTYWx0ZWRfX2xrys3FcrnWd
 6POiBKzhbh2G0R4G4dioMe7STY7E5aWND4D8DwJlFEd6tUS5GaV1bCd7pUJNVXG3rvWNqIL34h0
 w5cFPZuV6B8qdD+y0r0lnn2CvEgM7sM=
X-Proofpoint-GUID: he8zm_7Mod6uEpdjl0UhM3qDfba7C3T9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNiBTYWx0ZWRfXwgry8GBg+vDn
 Zt887RwiUZkvicz6ALRkitWPqQrePoXVUhyHWAhQCvDOUS9C9QQuygj0nq2wEurJ0sN3z2omxWX
 L2ujRrMP2i6K9Sr+ZrkWO/kBWj5nJ56O2y8cGkpsPVZlXHTy99UJuqE+3L319JDAHcUqIDS37sQ
 9TmBHN7uDdpfpz+qieEvM6toSSlqWU6rwbXTXuHYwFR0Yb8kU/tuMjF6FIPb8YH1111J3S7zPGW
 XG6lMBBBbP6qifBXXgVGiC+VPviaDL2iCyWCxbh28+DLaahix1HlzswLtCDDhMZ3jPwSp0upGID
 wprJ5vX54pITGL9XtcGw+outsnQpUzi2itk5paDIN4oVOLcUUQdY4i1cT1UIejmqjusBuKuPhuz
 rnmf5Ctmo9uhxo6GIWEMc4w7ORnj1gyXFxDzulNARU4f0lbt+oZkd/DGhnzUqqI3bdGAN6Tl4Fr
 2cg31JS0EHJlSaSXeYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040126

--vgq1jszOkLu1v/d0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 03, 2026 at 09:52:59AM +0200, Lorenzo Bianconi wrote:
> > The TC9563 embeds a GPIO controller used for per-port reset signals.
> > Create an auxiliary device for it so the gpio-tc9563 driver can
> > register the GPIO chip and enable DT-based GPIO lookups. Pass the
> > tc9563 regmap to the auxiliary device as its platform data.
> >=20
> > The downstream port DT parsing loop gains an of_node_is_type() filter
> > to skip non-PCI child nodes such as the GPIO controller node.
> >=20
> > The pwrctrl driver does not wait for the GPIO chip to be probed. The
> > per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> > registered, is added in the next patch.
> >=20
> > Select AUXILIARY_BUS and GPIO_TC9563 in Kconfig.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> One comment below. With that addressed,
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
>=20
> > ---
> >  drivers/pci/pwrctrl/Kconfig              |  1 +
> >  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 80 ++++++++++++++++++++++++=
++++++--
> >  2 files changed, 78 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 1952ab4f29b6..38aab596aa04 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
> >  	select PCI_PWRCTRL
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> > +	depends on GPIO_TC9563
> >  	select REGMAP_I2C
> >  	help
> >  	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index b0d8912690a2..6df512d78b54 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -4,11 +4,13 @@
> >   */
> > =20
> >  #include <linux/array_size.h>
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -20,12 +22,10 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> > +#include <linux/soc/qcom/tc9563.h>
> > =20
> >  #include "../pci.h"
> > =20
> > -#define TC9563_GPIO_CONFIG		0x801208
> > -#define TC9563_RESET_GPIO		0x801210
>=20
> These definitions are still used in this patch and only removed in 4/5.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> - Mani
>=20
> --=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--vgq1jszOkLu1v/d0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaprMygAKCRA6cBh0uS2t
rIcGAP9zc3Ril3L9NF5G0q0LUKY8UyK71zNC8Zp1ulXf2XCNHwEAule4t5jrNiNI
0qW3qeVwe8KvQMl3ZvwIJZSfsBr5nAM=
=5qQo
-----END PGP SIGNATURE-----

--vgq1jszOkLu1v/d0--
