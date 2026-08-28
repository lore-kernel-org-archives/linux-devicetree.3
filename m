Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472DB354AE3
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943115; cv=none; b=E8svo3n19wD6vKkn/CLODS+a8UOfJUk/lPOi//N573vopgWA//oUPMPaMC/rKJ2FhNtOzdNOFItqAuQMkHxUVKjSf1Tejx7JRJK7P4hGADn5EiBorCF2a2iilgdKbZX215JYMhDce0Gwqqnfbq4fnS1k575BTapC6uU9LXTHEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943115; c=relaxed/simple;
	bh=2x3x/AWXofFz6gmqTfYL/E4l4AWlk2LVYD50VsGNO+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V5UOZ+wYMuLZn71fBq4dVYWDJvnkinUDPUxlb9U25DYBtpeEk4M8tycesDLPg0tEIg2pTCkoXgCPixBHN/zQLdJSCwhL85Avycz01BbrrfiyQetBcpyo+Za+hQNjgCTW23/1QI49LJt6oBX8fx4ILYzkrIm3TJWIgsTQuh/p4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld9j6o7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld9j6o7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821D31F000E9;
	Fri, 28 Aug 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787943113;
	bh=zdUSXYYuI+TDh4s5nXb7Ip+Fid9dY5ty4iM1ORpcpuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ld9j6o7eLWiKzANTrPDrw6ToYMdtkC0ZEAVjxqzWUJD1kT72RrNu7ik65Vo+dwi7H
	 3g3hS4pSdn92d0KHI3+IOSMvI0zjgd8W0qk26gInrDne8EA/YVhRK2IYSDH0Ttjeyh
	 oTVMpcsLMtrc3Nuw89EK6g+vyQzuSljPqkyuUoR2sGm2IhVPd3O02SAU+vpQBjqJjB
	 cQlY7ehUyKOJV5dIo1rI0pnfmBi+70HG8c3eQynvjx/P4DMrpuvroP9ipKbj8AzLUq
	 uKZ2XQdbsskb1vt8BmVD5B970huUU1tok9MKAmiill8snhBYzahl1sDyaEp5EvVL1U
	 DbPxaiUrGdbRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
 <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 18:51:53 +0000
Message-Id: <20260828185153.821D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The Renesas R-Car Gen5 glue register initialization is lost during=
 system suspend and is never restored upon resume.
--

commit 83607f1b223c5287acdc795a68974bae2662c342
Author: Thanh Quan <thanh.quan.xn@renesas.com>

usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controll=
er glue

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Extend the generic
DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..e8586c40d5006 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{

[ ... ]

> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);

[Severity: High]
Are these glue register settings preserved during a system suspend/resume c=
ycle?

On resume, dwc3_generic_resume() restarts the DWC3 core and reenables clock=
s,
but it does not provide a mechanism to invoke a platform-specific callback =
to
restore custom wrapper register writes:

	ret =3D clk_bulk_prepare_enable(dwc3g->num_clocks, dwc3g->clks);
	if (ret)
		return ret;

	ret =3D dwc3_pm_resume(dwc);

If the SoC's power domains are powered down during suspend, could the USB
controller operate with uninitialized glue logic after waking up?

Is there a need to add a suspend or resume callback to
struct dwc3_generic_config to ensure the platform-specific initialization
is re-applied?

> +
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828184212.3950=
82-1-marek.vasut+renesas@mailbox.org?part=3D2
