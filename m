Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A693B992E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903249; cv=none; b=jujiS1Nz61xRUFfHgg4d/2HhqJgdJJ0M6AeVVLZleHHxtpPmVhz/CnUYtGIX2dbj0MOMpwFxOS2CnFCPi4wzBVqu3HjlDHlIE8+dUQ3GRLkKqm/sCr+SXvSDOSF4BUXkdXMLzbidMHfILxwd03FYF39naQJN5TPS5msQ6N0g3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903249; c=relaxed/simple;
	bh=KfPLUHbv6VqfMJCkJoMTAP4YFtOSL1LJmXwMk+chWo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=migJdd35yAVuXK5oeYXpe2ncfxfgDzTl0EynkBtiPcuyJWuQt/bXPEv1jINqf0n1jmqjpmsDj/5pUZ5K3BoR92IdYkyle1fxc8YCeZFPrleqDOrTn/ai/j3xtoLktaM7tThcbJ5zo64yYU3EiwPw+M+RGfuWpGGk3uBzHEOrcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jj9yNpcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jj9yNpcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E56A1F00ADE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903244;
	bh=3dFhZqVXlPw7AKqdGyCXcF9/T5J+z7jeRJ0PFE89kgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jj9yNpcE4V6NcdQD4g05CJvWOH6GRskIlx3Mmm69xy5BxwxpnrT5BqC0gHnRaUFyt
	 O23edhYADsdZPU+HZKUrz/oCTTvue+X/Sp2hJmpFu2roFbszryTFSeR5HMka7v15M0
	 piz/7BCnE+I5rarI7mx8TRbeX572MZy+4DIlZ/RUU66TBUrN+Iq/kEMOXU8miLkKR/
	 QaT0LjyVP4y6A2O8sI1q6SOw1xZHoV69d7p4H5xqnwLeHBVh4QgicvGaOohR+OLjXv
	 72+VPyRgVlGIGtnMYgbqhMcUS4kG1TMB0E3Vyt8d/L1Qp43iVzWVF/2cfTSmxugvBM
	 17ZM8I8DSAy/A==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39af87c4589so5496891fa.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrpi+YEILgVLRUjhhak0GBy+Z552iq59X9336p13ay7+Yy2yi5quLtZxaWqfriLbmDF45/ma7KP5uMT@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYXOt+Lc4N6nQNzSJ8g5kz7mwYbxHIF4JsjwUVFiaYDN7QgCE
	6NMQYgr1aG6IUyIlJI7iqUMQGzhM25iQgl7nH1ihHuLUcFvOWGSoyMEpVXnsLDgbXmteARj74Zy
	23+y5WCxh5UFQCOSmyoPtgJvn7NgkM0U=
X-Received: by 2002:a05:6512:1043:b0:5ad:67d6:a2d9 with SMTP id
 2adb3069b0e04-5aec68b453fmr281719e87.39.1782903242946; Wed, 01 Jul 2026
 03:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com> <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
 <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
In-Reply-To: <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:53:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
X-Gm-Features: AVVi8Ce_77SqNNQU5uO1pZpVOGBbpgsRt39tcDkp1nPUZH97o9So0gRgVCLSXDs
Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Michael Walle <michael@walle.cc>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, 
	takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 10:34=E2=80=AFAM Michael Walle <michael@walle.cc> wr=
ote:

> If I'm correct, this is the old style, see commit bd912c991d2e
> ("dt-bindings: nvmem: layouts: add fixed-layout"). So it should
> eventually look like:
>
> sfdp {
>      compatible =3D "jedec,sfdp";
(...)
> Also I'm not sure if we really need to add the "nvmem-cells" here.
> IIRC in MTD it was there to tell a driver to add an nvmem device to
> an already existing compatible/node.
>
> Apart from the MTD case, I've just found qcom,smem-part,yaml which
> has compatible =3D "nvmem-cells".

You're right, I was using old information, discard my comments...
Reviewed-by: Linus Walleij <linusw@kernel.org>

I think my comment in the driver to check for the compatible
instead of the node name is still valid though.

Yours,
Linus Walleij
