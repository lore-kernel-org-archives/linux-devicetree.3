Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392639A079;
	Mon, 23 Mar 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268099; cv=none; b=cARhQCfcBEvbDRDdRIArcqPuKeL/QolUTO8oxy4fCAHczPI5Y9gPaM+9VzKirNkXRY6kOyZhC/tNcRprlKeuz1AYeApDJ1RVInfLjSl/Q/JQD9joMQi1/pzxURKOi49M158VjGqf7mA+bPWLzK+p/45FFxTqZrYiULAqZ93GLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268099; c=relaxed/simple;
	bh=tCMVzHjBQ3Ad0Da/qPpglq3ZQQzha3DEVdZwI80uroM=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=Kqc0N4izn06hN464xofGj89oeM1x8T/V+mD01HgPlkCaUi3Sv7ypPh6UyZddwPlgEdtStifsoNbVI/r8P5jqQzt1Ej8C/nj0P0umIxYGbKp1F+v0D5RwXvG+tWGgLuFLYWGNh6C4kgPqjWgxH+yoaRMa1ZZifwbK3ejDQj37iE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b=FPmPMjx9; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b="FPmPMjx9"
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=65562eabd4=fe@dev.tdt.de>)
	id 1w4eB9-00Bfla-IT; Mon, 23 Mar 2026 13:14:43 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1w4eB8-0051jN-CG; Mon, 23 Mar 2026 13:14:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1774268081;
	bh=VKDmsUAkSZI72746rUwuZ3ojotQOL7/KJYjbQxL3osE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FPmPMjx990tGLp4DDmimGJY2MiCbqGpTYU8F6DAoBnOLKaWDBF5dkROv4NUeMxav5
	 8zEUzfrW/knARqKJp9HnYYSgm4B1o9eJZjswETIzr3JC/P/MZFkLMRQQmTPft3Vwux
	 He3uLMfiuWEf7JnNhedMpc5ut4ENURmA3mRH4HYXhEW6o8t+BF187Mrjj1o4hoC0Ou
	 qqEGCQzgGmwCWGddHwHi147NjDF7K+eOzq2fZCfUM4UnT7NYXzK+9z0uw/GYDEnGmQ
	 R13EebsJk5xgYOfoTMOYeIb3SJFXVT/UDZTFG2/t4NBThKeRmrsaU9ljUcw9hnP98N
	 G7hQjhiy/4A7A==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id CDC5D240040;
	Mon, 23 Mar 2026 13:14:41 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id BCDBA240036;
	Mon, 23 Mar 2026 13:14:41 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 78F5323789;
	Mon, 23 Mar 2026 13:14:41 +0100 (CET)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 23 Mar 2026 13:14:41 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Eckert.Florian@googlemail.com,
	ms@dev.tdt.de, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
In-Reply-To: <87v7eqk8pv.ffs@tglx>
References: <20260318-irq-intel-soc-msi-v1-0-0e8cdf844fa8@dev.tdt.de>
 <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
 <87v7eqk8pv.ffs@tglx>
Message-ID: <6b059429a3db61dffd53a280dc2d6278@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-ID: 151534::1774268083-D5E525F5-83EE0CF3/0/0
X-purgate-type: clean

Hello Thomas,

>> +
>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -EINVAL;
>> +
>> +	mdev->base =3D devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(mdev->base)) {
>> +		dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
>> +		return PTR_ERR(mdev->base);
>> +	}
>> +
>> +	domain =3D irq_domain_create_hierarchy(x86_vector_domain, 0,
>=20
> So this is hardwired to the vector domain and does not allow the
> interrupts to be remapped? Those SoCs have VT-x which implies interrupt
> remapping support. But what do I know about the infinite wisdom of
> hardware designers.
>=20
> TBH, if they decided to hardwire it to the vector domain, then they are
> begging for a cluebat treatment.

Unfortunately, I don=E2=80=99t have a detailed hardware description for t=
his
IP block. All I have from the Maxlinear is this driver [1] from
their SDK.

> Let me summarize what I can crystal-ball out of your comprehensive
> change log and the insane amount of comments in the code:
>=20
>     1) The IP block converts 'wired' interrupts to MSI messages
>=20
>     2) It needs to route four interrupts as NMI
>=20
> Right?

It has a total of 64 IRQs. Four of these are connected to the
individual CPU cores as NMIs.

> #1 The implementation gets the MSI interrupt domain concept completely
>    wrong
>=20
>    X86 uses the MSI parent domain concept.
>=20
>    [vector domain] -- [remap domain] -- [ device domain]
>=20
>    The remap domain is optional, but both the vector domain and the
>    remap domain act as MSI parent domains.
>=20
>    So what you want to create for that chip is a MSI device domain and
>    that domain needs to set the bus token to DOMAIN_BUS_WIRED_TO_MSI.
>=20
>    See drivers/irqchip/irq-mbigen.c mbigen_create_device_domain() and
>    related code as an example for a proper wired to MSI implementation.

Thanks for pointing that out. I=E2=80=99ll take a closer look at it this.

> #2 NMI routing
>=20
>    There has been attempts to implement that before in a clean way. The
>    patch set dried out, but the underlying changes for NMI support are
>    still valid and Ricardo (CC'ed) is working on them again, IIRC. See:
>=20
>=20
> https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-calder=
on@linux.intel.com/

The v7 is already about two years old =E2=80=93 let=E2=80=99s see if ther=
e=E2=80=99s anything
else coming.

All in all, thank you for taking the time to look at this. I=E2=80=99ll g=
o back
to the drawing board and have another closer look at it.

Thanks *all* for your feedback.

Best regards

Florian

[1]=20
https://github.com/maxlinear/linux/blob/updk_9.1.90/drivers/irqchip/irq-i=
ntel-soc-msi.c
