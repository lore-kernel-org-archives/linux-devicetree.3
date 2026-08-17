Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394113F8EA2
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963863; cv=none; b=VV+YPfe3b5f5pZb0T7TkdQhqPzW+knWIjT4EQCrxbCSUBTI9GhSFzmIkgxRIJi6zLZiJanVHLNPfsxXppKFGA2qVsWyzU+nI/yGwiw7ucgNIo6VT64dKaEir2VERQvY2LptzoxJsmzsJLsLxG6tXPQLNaSdh/DEfbRSqy4ac42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963863; c=relaxed/simple;
	bh=MtHVmwcqikwrOdLMx/o3EJMejIeaPG4iyeC8g9py5PU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G2Ccx5CyLkJFo3SdwAHfxsm3dV+5rZkjZK+F25bphn2Qnv/Cnx+yDh3hNVAhHAgiNauHUe6IKGbn/xpw2uudY81eL+KWn0nC60oi3QtIyy7M3TDzz1NC3rEHoNE935y/ziucWz1sWCJTJroNnBv331wvzhTXk6DlEn7XpmJXGUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM+4iRT1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM+4iRT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ADB1F000E9;
	Mon, 17 Aug 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963858;
	bh=vnDLG0mfJEppZrZicV1DslhaRLjy4ccwi4GYTtqGfHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NM+4iRT1T73LyBOXguxHVV4wbDHIrE/6TPon3aHVZI0zTRtejyWitWIZ+wyzNFptI
	 nSDwll7UtHKBsTrXSniepTWsT8vFt1mfnTut+bE//3K92nQg6uJZvgxdmozpfoe2l1
	 Ozx1LW4oeAPO2bo09J1JLIeT40okaGH4XYiz1FHsHk2PfQc6e4BqtbN7DEcNXcTOck
	 h1OMdtYUMEtpbbe6FC318GMaRnGvd8y9RwQBNO5KMP/SqPPSOzI0iPWsRF2UxBfaPC
	 ULNCNKHBWKJBcSlqKscXiAx5u0UG+pcg3pOlmSyx+U7e28ircInqbdQo9VYRdRNsLW
	 0aL+BnF4DRR0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/8] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260817103844.2142802-2-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:50:58 +0000
Message-Id: <20260817105058.71ADB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to add helpers for attaching and detac=
hing I3C devices, but the implementation is completely missing.

Pre-existing issues:
- [High] Accidental removal of ID 0 from `i3c_bus_idr` when `i3c_bus_init()=
` fails.
--

--- Patch [1]: [PATCH v15 1/8] i3c: master: Add APIs for I3C hub support ---
commit 14f349144e98c1c3eedcaa4123a53bf24704569f
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

This commit adds helpers to prepare for I3C hub support. It exposes
address slot management and CCC command interfaces, and allows registering
virtual masters with an explicit firmware node.

> Add helpers for attaching and detaching I3C devices and CCC helpers
> to check CCC support and send CCC commands, address slot helpers to
> query and update I3C bus address slot state, registering virtual

[Severity: Medium]
The commit message claims to add helpers for attaching and detaching I3C
devices, but the implementation is completely missing from the patch.

The changelog indicates that the attach and detach helpers were dropped in
v15. Should the commit message be updated to reflect this change?

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..03fb41f0786c5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -3352,6 +3427,39 @@ int i3c_master_register(struct i3c_master_controll=
er *master,
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);

[Severity: High]
This isn't a bug introduced by this patch, but does the error handling in
i3c_master_register_fwnode() corrupt the global IDR state?

If i3c_bus_init() fails at idr_alloc() (e.g., due to duplicate alias in DT),
it returns an error while leaving i3cbus->id as 0:

drivers/i3c/master.c:i3c_bus_init() {
    ...
    ret =3D idr_alloc(&i3c_bus_idr, i3cbus, start, end, GFP_KERNEL);
    if (ret < 0)
        return ret;
    ...
}

Taking the goto err_put_dev path then calls put_device(&master->dev), which
eventually triggers i3c_masterdev_release():

drivers/i3c/master.c:i3c_masterdev_release() {
    ...
    i3c_bus_cleanup(bus);
    ...
}

This calls idr_remove(&i3c_bus_idr, i3cbus->id). Because i3cbus->id is stil=
l 0,
doesn't this accidentally remove the valid bus 0 from the IDR tree?

This could lead to duplicate sysfs names ('i3c-0') and crashes during
device_add() for a new bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D1
