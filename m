Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC7A3242BE
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857584; cv=none; b=H4NIAR8MOGqdD1N8jQON57riRhM9eWhhAc2tKKGNS/96lC3WffnaUq4LSXlQjsb+GCDPGVMoJLqlzOzTiSvht1LhyoNoQjbTd0p3HNIsgFSqTI5iFIGLm+he1rHh1DNL2cSX8+The+81mTGwzx2rfaP1Gt+KYZURz5hSZHqda/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857584; c=relaxed/simple;
	bh=a/lxtTDTDg9qHZ1XxJGp6GALUnxVcyilFnlyp8deNr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu/9rL1xAsajUlWpIGGUy7EdCt7b6IOL5KCnGMxlwnitSmA2AeO0Zv2WpqhyB/zaWAo0N0lvlluX7cKrFnGUJvG6sxfS4Ab31ViLug8S4bHXFTyK5bDYMN3C0bqmz5AdmbsVWlLW8Hia4w7dVKahQUsoUj+iZFhFxyQf8oRPQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJgsHN6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJgsHN6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E591F01558
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782857583;
	bh=HM1j74yODPhJMYhAe8Gysw58b33HB8UlPnD7jYgM3wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PJgsHN6yFCy6uM8OzJ5er++rKVozMaAHvyDqrhtYfMPCCxrpB8AXLUA6uGg+5VklC
	 9duGS1uMgl4p3p5uoQL7TK9MhvxKTa2dKSCMTkS2w2VwjlYEbiWAkQa2L67HL5VVVd
	 9uvKdyQ3g4QVOBg20tia94Xcv+JC3R0uEMn+QJKcGoYACQdi1ovvRcZqMegBGiFT4p
	 hLtNn0IurWdCmVibLCpjZx2NvYHdoGJBdwYHxHXG+WkxypEPGGiZsPFfWJoND2Kal+
	 98zSH13AxZSGRmzDL3hBFy5vxpfe1HN4oOXaZk4ptIHXrsgqLoTMTFxyer7juhoAp7
	 7YulToC5Pm34w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso3721530e87.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeZaxFoqKG1uDQYLBtTADouCciVWtG60ewWZG7YDd31XDA8n3Lykht+mXtnTrg66VGY++pdTkOeT9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8i8cxyiRN8bq6Iroont7rpdCy/h+z4U3n9nd6fpwh536JpIY
	lzB1RQhwhNbROQMTPnGC+ne5/bE2jRky+so/NAU9Ytnb6SdyOloHAfWIl9UvURp8PLV7lbfA9h0
	a9IF+ZGeSNOVSQJ007kGDRwGhS2xJ/TE=
X-Received: by 2002:a05:6512:1248:b0:5ae:b2cf:8204 with SMTP id
 2adb3069b0e04-5aec10a3841mr657448e87.2.1782857582274; Tue, 30 Jun 2026
 15:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-2-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-2-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:12:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
X-Gm-Features: AVVi8CcLJOfvOFl8jmVmAP_uzLY_UWoBigmB1_kTp6EN1gm7rCEox0bV8PbTeSw
Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manikandan,

thanks for your patch!

On Tue, Jun 30, 2026 at 11:24=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
> contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

I would expect it to follow nvmem conventions like this, notice
compatibles specific-to-general with sfdp first:

sfdp {
    /* NVMEM provided by SFDP */
    compatible =3D "jedec,sfdp", "nvmem-cells";
    label =3D "SFDP";
    read-only;
    #address-cells =3D <1>;
    #size-cells =3D <1>;

    mac0: macaddr@0x00 {
        reg =3D <0x00 0x06>;
    };
    mac1: macaddr@0x06 {
        reg =3D <0x06 0x06>;
    };
};

Your example should definitely be more elaborate like this,
just an opaque sfdp node will not suffice. Maybe a separate
example?

Yours,
Linus Walleij
