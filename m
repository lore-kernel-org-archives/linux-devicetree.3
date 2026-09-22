Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F93BBA05
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074205; cv=none; b=r3WBHrCsOmFtBvP7QsQUCKyzv+qZDeX/vuyPB1PfGjdwoe3IbCB6a7U3QTCFeeoO1JRfe24tJpL42c1g4sKOHFbsnAFhzcQfjc1+3vfWlIsLSBft50sxs/ZsEuNCrrnW6Urx2sES53bim21EIEn7yVelk+vErsu9HlbehYFwnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074205; c=relaxed/simple;
	bh=ZKymurpSO5NMsoo40LaCoidOjdwZMz0dmFI6ePj5M5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j9hsU84+36NmsPvElUjYfglP36yYssByoOYaD5M3l5nX3yJaRm9lAE3CewSSi1fhVx396w08wpmNaQo/aMa7H3byuWSc8b4x2t/EFjKH+zZEsajWRr+2ViAsH82YJI75iMVZOGFFMvUkPbfCwoGMGwflGOcX6oymZZWKN8knm3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIOE8SYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIOE8SYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C4C1F000FF;
	Tue, 22 Sep 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074203;
	bh=llhR4Z2ehPlYyJPIU8kUmd1XlojEmc99b86mrM5aAsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BIOE8SYp3OQsYnATwK7qdorwJhUWYoFHJmo1xXmY9e6LQD2cXXRWYcWWfVU+uG4Yg
	 2BQoc0eM0Yzc+yBCLdwlTB+Td+fc/mEMUEyC3XEMs0PBPuHamtyAY1BRbtatTu08ii
	 z7/K78FxlBO4vrGy/PEgi4RxCNpbvhJChjqUMYOd7J+h+jxcYZGloJTAwFYSo5UK7K
	 OKXwJDdXTkgbXVYBJmrc460kKCW77W5Iu7t9n8+fqHOIY9kuMdCX9nISnA6EaQ2iBo
	 j8yo1K/l/782D9aeDJ4Sw69rqMUmQMM7T10vx3EdANxn2UAJ/qmBApTarHj3j81PuE
	 xhcB3zrLdqfXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: mtu3: add mt6595 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:50:03 +0000
Message-Id: <20260922105003.98C4C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: mtu3: missing NULL check for device_get_match_data result
--

commit d5e4ea09babd67818d32de7a95b82922101210c1
Author: Roman Vivchar <rva333@protonmail.com>

usb: mtu3: add mt6595 support

This commit adds platform data for the MediaTek mt6595 SoC to the MTU3 USB
driver. It introduces a quirk to enable single FIFO slot mode for this
specific platform.

> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index bb67da4704b29..9d633695a9bed 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops =3D {
> =20
>  #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
> =20
> +static const struct mtu3_platform_data mt6595_platform_data =3D {
> +	.fifo_single_slot =3D true,
> +};
> +
>  static const struct mtu3_platform_data mt8173_platform_data =3D {
>  	.fifo_single_slot =3D false,
>  };
> =20
>  static const struct of_device_id mtu3_of_match[] =3D {
> +	{ .compatible =3D "mediatek,mt6595-mtu3", .data =3D &mt6595_platform_da=
ta },

[Severity: High]
Does this code allow an unprotected dereference of pdata if matched without
OF data?

The mtu3 platform driver allows matching by name (via .driver.name =3D "mtu=
3"),
in which case device_get_match_data() returns NULL because there is no
corresponding id_table with driver_data.

The mtu3_probe() function gracefully tolerates a missing of_node, allowing
execution to reach ssusb_gadget_init(), where pdata->fifo_single_slot is
unconditionally dereferenced:

drivers/usb/mtu3/mtu3_core.c:ssusb_gadget_init() {
    ...
    mtu->fifo_single_slot =3D pdata->fifo_single_slot;
    ...
}

While typically bound via device tree, manual binding via sysfs or missing
.data in future OF match entries will trigger a kernel panic (Oops) here.

>  	{ .compatible =3D "mediatek,mt8173-mtu3", .data =3D &mt8173_platform_da=
ta },
>  	{ .compatible =3D "mediatek,mtu3", .data =3D &mt8173_platform_data },
>  	{},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-6595-mtu3-=
v2-0-71203a362b36@protonmail.com?part=3D3
