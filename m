Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96460357D17
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638065; cv=none; b=AdHDUGfVlfcb1nSjdxPXzJcEaNH/OMoZryicsFzTA2diH0/wAhWK9W4hlSELtfGqxbfTi8yfIz1M1xM7eOgdXBqjtqQCpiW4Lm9LEplDEsHa1icHmHk5YOvUEMgF8/OsJbzhhLlj1yUmeQsK9RDYL2c4/b8wIwy9suJLD4cgeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638065; c=relaxed/simple;
	bh=u4aLDj+GBei5R1aGiJbdhBkyFyuxl/5MYBHygttW+qc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ui+OPXqOO+XfiMR1vyXJToP+Ilasehpu7R1FGn5ZvskWi8u0L3xQJze3gmap2HiBctmPIIvCsuX8bpxCUEpId6Pk2eOcqHstg2uk5CbynxkgG0F7UZlmxYRYL4JUiS7+VuHmcV1UfnXvNagS2k/BwWV7BaykMEo9lJh3BrSvc9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNoKOVUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNoKOVUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBCB1F00893;
	Sat, 10 Oct 2026 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638064;
	bh=IMS+2Kpg73fIgVqzocFxPDug0kITFt3ik1ZkLcWuWgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNoKOVUyZyBoaV5AcY7XFFvsIsMQj4NDVR22VViZV0MxPerPcxTh5hX149KGUgK5z
	 T78bKvNk1J6yepS1yUBsVKCYdrzqETPnDoYBMHzYBDdMrzi4JrJW1ebnFv4GepS6lY
	 HAuTobhT6rUWh79rctrCNsoTxS+YAJ7Z21t0VQpXO/sazePJB6onywArcik2eIfneA
	 iwRyKudSncDmDyvRd67SkYwgKko2Hs/SRExNbQP4en8TT/i1919THhgUe1PVO34C3E
	 SjPfNi1tfmhSkiHFg1f4E9Ey7kgbzvMW+niwGkFYT6MeyNLyCasm0He01D1l3EVIg1
	 +QAAFPVJLUi8w==
Message-ID: <sashiko-outbox-166578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-23-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-23-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:14:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: dwc3: generic driver unconditionally disables suspend clock=
, breaking wakeup
--

commit 6d824e4ed683e8447bfbbcb4a2e9d9fcfd05236b
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

usb: dwc3: generic-plat: Add ZTE ZX279128S

Adds ZTE ZX279128S platform support to the generic DWC3 platform
driver to handle clocks and resets.

[ ... ]

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..aa838cf0676f2 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_matc=
h[] =3D {
>  	{ .compatible =3D "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>  	{ .compatible =3D "eswin,eic7700-dwc3", &eic7700_dwc3},
>  	{ .compatible =3D "starfive,jhb100-dwc3", },
> +	{ .compatible =3D "zte,zx279128s-dwc3", },

[Severity: Medium]
Will using the generic DWC3 platform driver break USB suspend and wakeup
functionality for this new ZTE platform?

The ZTE device tree defines a suspend clock alongside the regular clocks,
which get acquired in the bulk request during probe.

The generic platform driver sets probe_data.ignore_clocks_and_resets =3D tr=
ue
in dwc3_generic_probe():

drivers/usb/dwc3/dwc3-generic-plat.c:dwc3_generic_probe() {
    ...
    probe_data.ignore_clocks_and_resets =3D true;
    ...
}

This bypasses the DWC3 core's own clock management and suspend clock scalin=
g.
Then, when the system suspends, dwc3_generic_suspend() unconditionally
disables all acquired clocks:

drivers/usb/dwc3/dwc3-generic-plat.c:dwc3_generic_suspend() {
    ...
    clk_bulk_disable_unprepare(dwc3g->num_clocks, dwc3g->clks);
    ...
}

Since the suspend clock is disabled here, won't this power off the suspend
clock during system sleep and prevent wakeup?

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D22
