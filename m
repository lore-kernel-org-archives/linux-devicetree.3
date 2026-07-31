Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2870426430
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502101; cv=none; b=VDVlAqrBFinFyiO0/lb6nrL8d+KwK+G+bDFMS8Mypad0XkUeM2BbxQc5k6LPkmlcGuk3zqwGkhCXWLSp/4IzlKrf3ajTbca7dokyZ/K9MCCkVvyQBMCyO4vo12+g/xyb9UZPXM3sFuF1JEaY/rQrufIGkj8/c93AbeNxCVqXIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502101; c=relaxed/simple;
	bh=ELvpV1EQlrQ+hdP+qmBYmj6CpEgS1+5LygSCs6QRq3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9YdjOTXbk5BGRjfmRxenHV36+Ytz+cbyf9xcFkWwo7WbW+akHGazMP/Wyttpp90tWc/tZwouS+ldtp+9S5OKCy8e4MFm4jFuTYj/+t5YYjVb3Xqf/Fo6SQivvxXSoqsUH9AQk2E57cdeizHoZ2y/auSexygCCc8i2jnofDRJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWA9xkDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWA9xkDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9991C1F00A3D;
	Fri, 31 Jul 2026 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502098;
	bh=6Qc5T4e8HI6vPNkK2RxcFkoUC4ATP1D3PNDUVSbDNts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nWA9xkDdJfZ3UeopPwu5afj8zE7jOfv1tLpw3M+n5tqDcTBP4/iU6dyafIJmxsUTy
	 uPezUGmFk7oqD1ZBNz1m9izYf6EONTeMMzLZu5pLUhJe0xg4ToOdFgleY9ITlnOjYF
	 eBU1SMZ6g2AYaZMEsGe82Uc28v/gCsI9w1Sm7LeE6yt+ODH0lFFA7O5POy2aQcxAn3
	 KnDWONGm/5+7IA3v5pop4btr3UWI6Wtk/39QzOIYSNa+SiRcSR5/NbPdr9ghQi4xet
	 rsl2zLWggCYixi2A20MCeSG0OOU7ZmcJvid5APkOue/VkdhPZH7zxsPXkxLEorimqT
	 RbGmeJ9oBZhlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 06/11] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-7-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:18 +0000
Message-Id: <20260731124818.9991C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition between `phylink_release_pcs` and `phylink_create`/=
`phylink_destroy` leading to list corruption and use-after-free.
--

--- Patch [6]: [PATCH net-next v10 06/11] net: Document PCS subsystem ---
commit 71f5e420c5ee13d83f4218aff0877aa80d862ffc
Author: Christian Marangi <ansuelsmth@gmail.com>

net: Document PCS subsystem

This commit adds extensive documentation for the new PCS subsystem and its
fwnode implementation using a producer/consumer API. It also updates the
sfp-phylink migration guide.

> diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/=
pcs.rst
> new file mode 100644
> index 0000000000000..e16d8b5bf6612
> --- /dev/null
> +++ b/Documentation/networking/pcs.rst

[ ... ]

> +You must call :c:func:`fwnode_pcs_del_provider` from your remove functio=
n and
> +release the PCS from any phylink instance under RTNL lock with
> +:c:func:`phylink_release_pcs`::
> +
> +   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
> +
> +	rtnl_lock();
> +
> +	for (i =3D 0; i < data->num_port; i++) {
> +		struct pcs_port *port =3D &priv->ports[i];
> +
> +		phylink_release_pcs(&port->pcs);

[Severity: High]
Does this documentation example encourage a teardown pattern that can cause=
 a
use-after-free and list corruption?

If a PCS provider module is removed concurrently with a MAC driver probe (w=
hich
calls phylink_create()) or remove (which calls phylink_destroy()), and the =
PCS
driver calls phylink_release_pcs() as shown here, they can race.

For instance, phylink_release_pcs() accesses pcs->phylink and takes
pl->state_mutex. If phylink_destroy() runs concurrently, it could free pl
just before mutex_lock(), causing a use-after-free.

Also, phylink_create() iterates pl->pcs_list without holding pl->state_mute=
x.
A concurrent phylink_release_pcs() will modify the list, causing list
corruption. Similarly, phylink_destroy() modifies the list and clears
pcs->phylink without holding pl->state_mutex.

Because fw_devlink does not natively parse pcs-handle to enforce ordering,
the driver core does not prevent these modules from being unloaded
simultaneously.

Is there a safer teardown sequence that should be documented here instead?

> +	}
> +
> +	rtnl_unlock();
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D6
