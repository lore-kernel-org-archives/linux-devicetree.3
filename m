Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636276;
	b=EYohsa0cUNwujYr/BTQVuwI8hGFghD8dQIZn7BOeyqtmFkh3bQlVObGdq2pyinIzooMf
	 /xXfte1ZbTBCnmbENVLFH4oC3CDR7559GtC2YE7V3V55jRjxJV2oZvtia3V2mz5tGjUvD
	 SpoE0fVlNvIQRt8TP8mfK2EvRkHoQkaw3eT6xxIoeKGuboJpWRY/dT2+JCVmOvuUgPOZ4
	 E1tzHmLqM0KdZ0oncQRptYmIEKh5K29zPbP5MK2ROzn1Fb1n+82/+jOzZjr/h4CeH27dm
	 Eh6wiHPTlNKfrpdRJUnUtf1+REs+dIK/3O79geKhoyUMyiSTCDj4oWyMp5epocTLqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636276;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=XAdfmQDvmV/inPL+xb8NfptV6+ro1er5rqGPf4oZUUE=;
	b=2JctSjKQXwZUgKf9aTeOz8nL8++nVl1FWVNC9o+1UiisKd88LKK7htwS8m6I08covQce
	 dr7lixdf3gyIEaB18ojzPTC/hhStqewpzXJ0AFYAbrc14D83cAiHwQ1y68mJ9RfacxOE4
	 /QSKDn5nfbt4khyuvnEyUf/j0wsUnMPuZisMhJXzuIZaFQtqW+yZDsP9am+lqxRMsdLgB
	 GHz8Sy3uDPhq54Luz6nXzO2jL0LMneQ/0dffCdmwAD/bsLoov0+pyRh1655fhZ69J5iH4
	 JnqXsh0Q6QmDEuRKlw4LDP12z31FAza+2kPFlTlLhbsYRbMZDK5Q3QIXyt9PlNO9+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HlOOvPT3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256A6096233
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C256A6096233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HlOOvPT3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0F72EC4FECD;
	Mon,  2 Nov 2026 16:18:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4AD3603D7;
	Mon,  2 Nov 2026 16:17:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07DA910329123;
	Mon,  2 Nov 2026 17:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793636266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XAdfmQDvmV/inPL+xb8NfptV6+ro1er5rqGPf4oZUUE=;
	b=HlOOvPT3mAL1W0Dk7BKEQFSgkq4AxLs+RwoZIWI3CLWT8KzOcEERN5C+2BffrtcOUtb4MD
	PYGOnh94Rcocnrm6+y66uEtzCWIpEABzxjqdd8RQagMFYHeFaQIuVyc22R5hoFKYWrDJJc
	OZfyS+eFC+twNuXWYvjSO/4F04dyrCXJdkG3xrs6+MY2AXORL9nS4u54Zy6qD8utDBuB6P
	5losyQ+nmW2P8gDRq+f55l7p7m51a5/0iNaZm/xIRxMuG5OHSm06o/j7IoDlOZejOInpjl
	k6p6Uk619rrWK2lZ0Fnbk1LgRgZMqYHbUL6dwSPs9/dscX/cFm3FPZX4dK02Nw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Gleixner <tglx@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Radu
 Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <87v76ly4jy.ffs@fw13>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-2-c464752fb55f@bootlin.com> <87v76ly4jy.ffs@fw13>
Date: Mon, 02 Nov 2026 17:17:43 +0100
Message-ID: <875wyf2ons.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Thomas,

> On Wed, Oct 28 2026 at 16:58, Gregory CLEMENT wrote:
>> +/*
>> + * The caller must hold msi->lock.
>
> Instead of a non-enforcable comment can you please put a
> lockdep_assert_held() into the code.

OK
>
>> + */
>> +static void __eyeq_msi_mask_irq(struct eyeq_msi *msi, unsigned int bit)
>> +{
>> +	u16 value;
>> +
>> +	value =3D readw(msi->gcsr_base + GCSR_IRQMASK);
>> +	value &=3D ~FIELD_PREP(GCSR_IRQMASK_MASK, BIT(bit));
>> +	writew(value, msi->gcsr_base + GCSR_IRQMASK);
>> +}
>
>> +static struct irq_chip eyeq_msi_irq_chip =3D {
>> +	.name			=3D "EyeQ5-MSI",
>> +	.irq_mask		=3D eyeq_msi_mask_irq,
>> +	.irq_unmask		=3D eyeq_msi_unmask_irq,
>> +	.irq_compose_msi_msg	=3D eyeq_msi_compose_msg,
>> +};
>> +
>> +static void eyeq_msi_isr(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *parent_chip =3D irq_desc_get_chip(desc);
>> +	struct eyeq_msi *msi =3D irq_desc_get_handler_data(desc);
>> +	void __iomem *status_reg;
>> +	unsigned long pending;
>> +	unsigned int bit;
>> +	int ret;
>> +
>> +	chained_irq_enter(parent_chip, desc);
>> +
>> +	status_reg =3D msi->gcsr_base + GCSR_IRQSTATUS;
>> +
>> +	while (true) {
>> +		pending =3D FIELD_GET(GCSR_IRQSTATUS_MASK,
>> +				    readw(status_reg));
>> +		if (!pending)
>> +			break;
>> +
>> +		/*
>> +		 * Write-one-to-clear status register.
>> +		 */
>> +		writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, pending),
>> +		       status_reg);
>> +
>> +		for_each_set_bit(bit, &pending, msi->num_vectors) {
>> +			ret =3D generic_handle_domain_irq(msi->msi_domain, bit);
>
> You want to look at generic_handle_demux_domain_irq() and related
> functionality so you can actually provide a irq_set_affinity() callback
> for these demultiplexed interrupts.

Thanks for the pointer! Indeed, once I used
generic_handle_demux_domain_irq(), it was possible to use affinity, I
managed to test it on the hardware.


>
>> +			if (ret)
>> +				pr_err_ratelimited("unmapped MSI interrupt %u\n",
>> +						   bit);
>
> No line break required. You have 100 characters. Otherwise this needs
> curly brackets around the "two-liner".
>

I took into account this remarks and all the other ones about style and
formatting.

Thanks,

Gregory


--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
