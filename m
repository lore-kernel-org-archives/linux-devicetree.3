Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC593B6C00
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595064; cv=none; b=Ks5MQppUMCCgi7CVfYojttMbeWfocuS1awfb8/djJxLoHPg31xpz8IRD+QZAnlq3YzxOfBvPprvmbuKs9+KJ8A8qJ6eEN9xVO0oU4p6qfTWjkRQhcVQWV0t78BZjnpyKHL3/fDcVT6OP6K25dr9hxrEYGvjR+aijX9Ayp8gdBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595064; c=relaxed/simple;
	bh=lYIZPAneforc/+FhEppyPLe+gLpXFWWqfaQ1nbbXeck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3kQipMVHDT/hLp28605tyvgjmFnzpB2u0Z2gTY+fjGU9oRkhOSddLVqkJW3iQNnkGmSJjaqNAj+FWfmK1Do0gBbiGJ78L2i4MLNPPGabUI245b8350Rl6cRhXrE87LBWMzz5knVNMAOLL8km/OxrV6XLsPQkzVHtJbEFpduAng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYPY7EUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYPY7EUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3181F00A3A;
	Thu,  9 Jul 2026 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783595063;
	bh=0lX36Qbq55rPcd5gGKXGQt3WU7gllQhUsAzYwim5mKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYPY7EUrCPVeLI6JduM6UnanWDH7bQntRwomq1UjER1h6mZL8pAWkKPk1CYcYry3J
	 cboAs3HKEOemUeC5Qzjn/kvrsbkrAiiIHvvSiVv00ql4dVxraheE4Aah550hV6gtyn
	 U7JjMBD/nxgo/C4e8NbCRfpfR3/tn+9xPcER/6gR5optpeKdWLHiDXmff2cVAYx4yS
	 HEVmRaWTNrQ/gNFP4fJLxik9WNnQh+gwalGn/FZ5fUsChNZ5lbT4iQwlqkmhQbejs/
	 X041D+SbuBqxiTy7adwIJauesodX3qVdg0gK0s97A10FrBTZdzmPDdeQAhWeFATYSN
	 IhQGucyQO7ShA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709095726.704448-6-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-6-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:04:22 +0000
Message-Id: <20260709110423.2C3181F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces an unused local variable `hdev` in `usb_hub_re=
move_port_device`.
--

--- Patch [5]: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB p=
ort device ---
commit 99d7e99ad957a10ca942a12622a4b31eeee25785
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Associate port@ fwnode with USB port device

This commit associates a USB port's firmware node with the USB port device
unless the hub's firmware node is an ACPI node. This supports matching the
requesting port in later changes for the M.2 slot power sequencing provider.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384ce..e8fb2acd77bef 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c

[ ... ]

> @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
> =20
>  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
>  {
> +	struct usb_device *hdev =3D hub->hdev;

[Severity: Low]
Is hdev used anywhere else in usb_hub_remove_port_device()? It appears to be
declared and initialized here but never referenced, which might trigger a
compiler warning for an unused variable when building with CONFIG_WERROR.

>  	struct usb_port *port_dev =3D hub->ports[port1 - 1];
>  	struct usb_port *peer;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D5
