Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A43A4DBD8E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451682; cv=none; b=QIGq5k/9UHeAFeWTb0pUhyVsHnD64xDGc9bzZmANrZUiwEvPFeWuUOybqeoG+LoVYDAAOAr4Jm2VWS5Mjr6CEaT/6Yj6PsUmdohUfYAzYXLRxhpo3ef970DdXDkPc2TzbZyvVrC/ppB7aOonUriutw/UwKAem27Yx9XOeD5y/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451682; c=relaxed/simple;
	bh=7457WoBY3j2VtPi+Ir8UhCOAuW9PoWhZZArOhddfvMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pTHOG8dscNwhcTEJ0z1E5nsgSWnFqkfZuCbZ5U/Z9uMKI9/RXGxOcCIDLSQLho92U99XMFhOoRFyRd1pct3MJmXYnpdkZ+iJZz6b26kV2RVYGGgG95q/9QfsJZ6pIyJvtjFj7Jm4mTDYrFKVhv5wBQJYwAFi0tDFMYDcoOtw+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy4FN2gR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy4FN2gR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B946B1F00A3D;
	Thu,  3 Sep 2026 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451681;
	bh=eCexCTPYVtdFNiacZFIDISRNcl5Z98LDcQPbRok9R3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gy4FN2gRYl+NMl/2IRXzwc8/C+4gHCH0tkSxHXLOFXYK5n+tS82YPH9rdeGw/3Mwk
	 3r1haF2oC0WpEvNwwSzX0LzPxQNNWGWrQnNcb4wHHSedgFJHW4q7rWkZOOkdY4MFHb
	 7ACSrGl4FWJtb8kbVJLw7XvXK+73bSFDdN6phUb9JGGGrHNJqgC+cXUQuIwgW0KJ1J
	 wd9dJAil0nsgnvj5cNpnFwjmCrmDNh7oF/uOvuBweM5sT54hd6q+SOJQlEIh4+d98y
	 7gIFMDnMfWsHOCUdaYT2Rg/snDI+unE2sOCqQTnvsoLHcexk1UrIlA3BeobKMXOBCS
	 DXNmNh0T+IaDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:08:00 +0000
Message-Id: <20260903160800.B946B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds stack read in dwc3_host_init due to missing NULL ter=
minator in props array
- [High] Use-After-Free due to dangling pointer when xHCI initialization fa=
ils
--

commit a0d50bed63a440d17232b616205b33080bdd0057
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

usb: dwc3: add xhci-reset-on-resume property for power-loss resume

This commit adds a new device property "xhci-reset-on-resume" that enables
the XHCI_RESET_ON_RESUME quirk for controllers needing complete
reinitialization after power loss during system suspend. It also updates
the dwc3 core to manage this quirk via software properties.

> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b08..1402520140862 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
> =20
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -	struct property_entry	props[6];
> +	struct property_entry	props[7];

[Severity: High]
This is a pre-existing issue, but does this array need an extra element for
a NULL terminator?

If all the conditional properties evaluate to true (usb3-lpm-capable,
usb2-lpm-disable, xhci-reset-on-resume-quirk, and quirk-broken-port-ped),
prop_idx reaches 7 and all 7 elements are populated.

When device_create_managed_software_node() copies the properties, it iterat=
es
until it encounters a NULL name field.

Since there is no zero-initialized sentinel element at the end of the array,
could this lead to an out-of-bounds read on the stack?

>  	struct platform_device	*xhci;
>  	int			ret, irq;
>  	int			prop_idx =3D 0;

[ ... ]

> @@ -174,6 +174,9 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	if (dwc->usb2_lpm_disable)
>  		props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
> =20
> +	if (dwc->xhci_reset_on_resume)
> +		props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk"=
);
> +

[Severity: High]
This isn't a bug introduced by this patch, but does the error handling in
dwc3_host_init() leave a dangling pointer?

Earlier in dwc3_host_init(), the allocated device is assigned to dwc->xhci:

	dwc->xhci =3D xhci;

If a subsequent initialization step fails, the error path frees the device:

err:
	platform_device_put(xhci);
	return ret;

However, dwc->xhci is never cleared to NULL. When a subsequent role switch =
or
teardown occurs, dwc3_host_exit() dereferences this freed pointer and calls
platform_device_unregister(dwc->xhci).

Could this lead to a use-after-free if memory allocation or initialization
fails during a USB role switch?

>  	/**
>  	 * WORKAROUND: dwc3 revisions <=3D3.00a have a limitation
>  	 * where Port Disable command doesn't work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153827.3463=
313-1-faisal.hassan@oss.qualcomm.com?part=3D5
