Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52BC369D4E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365280; cv=none; b=LXRMY5XR5wjq5HBxlQW16yQg2y7o0yGDeWwM1w5ShF3wLJtDG2Doj7atE8lTuCNGp71fnEBuldVlS3yYD7WsLPQWSxEKCUiAbG9IZv2O2G+ZxtKuFjmuuHDA7LeDESf81f6s8pRuiO4iwULyEIfcudgd2rn9GDFaZMmzQgWlB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365280; c=relaxed/simple;
	bh=pKqtQxShwsPQOd6Jw3wAmODwt5bqqCeLDMef+CLX7xY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZD960B+k9EcYCRxHDbBrknIx5nVhcm7H9nXzA3+Wg+IJiiCLzCEeaJotmQkUjTMyxR93Oz64IeawfRijpDtC7Ucx5FQFClc6IVSbh8icXHjMN+IU2XE/mH1um2Cy9DIdROsgs40ZIPMopPta8e8Ys5tHHvIsgONTgCcsFDp0oRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuVI1t3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuVI1t3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434621F000E9;
	Sat, 18 Jul 2026 09:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365279;
	bh=rByq2Q2A7NzEHyDkOG4OcZizfk1/vNqkiKAjaZU5Vzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DuVI1t3l+0A3uBfgRKryxT6LMwWfTpL5BajWla/zF4n1k7iDAMYTeCQCMD6SwFCLj
	 ybQlJU7eBtn/ZaS6ZcNGR/w+pskjY5XT6306QwdCJcrCSaeGrtGft1Qd+WNK19ZCMZ
	 XhzyFrAzloesHt+RMFCzbSPsCfRguEclYUd4ZYxL56j6J1V8x9Bj2hXRA/b8jOw883
	 /MGYbaLzbC+OeICFIceTy12cbiuazK8IL1tuka2HwiaLNV5GDI7eEcdcsv2Ro8VhbS
	 gddipiCUyQzZzwKIRUR2fdTtBuw/pkmlk7hG8CT6eLBNnc5C694ge/xsmmdQqO5ofR
	 HusGFUDZ6BZNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 08/12] of: property: fw_devlink: Add support
 for "pcs-handle"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717065448.1498335-9-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:18 +0000
Message-Id: <20260718090119.434621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `pcs-handle` to `fw_devlink` supplier bindings defeats the =
dynamic 'late PCS provider attach' and hotplug logic in `phylink`.
--

--- Patch [8]: [PATCH net-next v9 08/12] of: property: fw_devlink: Add supp=
ort for "pcs-handle" ---
commit f6fc253d355d434feccac1a9dee68ebce25d5fe8
Author: Christian Marangi <ansuelsmth@gmail.com>

of: property: fw_devlink: Add support for "pcs-handle"

This commit adds support for parsing the "pcs-handle" binding, allowing
fw_devlink to enforce device dependencies with Ethernet ports.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de03..91c3e3931fa6e 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c

[ ... ]

> @@ -1571,6 +1572,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>  	{ .parse_prop =3D parse_interrupts, },
>  	{ .parse_prop =3D parse_interrupt_map, },
>  	{ .parse_prop =3D parse_access_controllers, },
> +	{ .parse_prop =3D parse_pcs_handle, },

[Severity: High]
Does enforcing a strict supplier-consumer dependency here conflict with the
dynamic hotplug and late-attach logic in phylink?

If fw_devlink creates a managed device link for pcs-handle, it enforces str=
ict
boot ordering. This prevents the MAC from probing before the PCS, which blo=
cks
phylink's late-attach feature.

Additionally, because fw_devlink applies DL_FLAG_AUTOREMOVE_CONSUMER, unloa=
ding
the PCS module would cause the driver core to unceremoniously unbind the MAC
driver and remove the network interface. This circumvents phylink's graceful
link down handling via phylink_release_pcs().

Since similar properties like phy-handle are intentionally omitted from
of_supplier_bindings to allow for dynamic PHY/PCS presence, should pcs-hand=
le
also be excluded to preserve these phylink features?

>  	{ .parse_prop =3D parse_regulators, },
>  	{ .parse_prop =3D parse_gpio, },
>  	{ .parse_prop =3D parse_gpios, },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D8
