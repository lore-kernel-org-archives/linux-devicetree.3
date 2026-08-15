Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8B18DF80
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 23:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837701; cv=none; b=KPZnsgUOztRZgzBmyP3FnfwrsSlWCJ5PTzWKDKB71Nyz/gEN2H0wIvvRM7rZ92CghnzEcbL7VWq22zcZV2iYXUfq2eKIFa13DDeezAiIB+xkqhhcn5PN1xjYfp+o3IH2SiiKbmDLeCg0iyrdHjeAHfBhwv0nxV4rThGv0+LtV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837701; c=relaxed/simple;
	bh=mKQZbIyNuFo6UbEJ71RXay9em2KFuXrOLb+B6M6Ql1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LVQRUrkhLRG8Ml7nLJ4Ayn7/9gmFLPWVmjKE+f6LI8tYTsGQx3WnuF0ICYPzW9hpGJV/3ETK04aDSy8Hjj/H8DuFvZ0JrH38K6n0nu4C2yxOXr6BYJThAr6bycZfYGWjCCqaxKPpH2YZk8BoSNsOKZvqOoiGKXTkcitpM4fb3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQsjj8S5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQsjj8S5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8731F000E9;
	Sat, 15 Aug 2026 23:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786837700;
	bh=Ay38cIYmxa5+tfh+IlVc1izkQJJGRdN3LgZV4s6hEEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cQsjj8S5/I8g/lype3Z6AsuJJKoW/7TKa0PNgtkuWAk1/5aEmbk9g6+Hlxxn5PrwG
	 zmX003jfiFeafnJB2QNhcnn7QVtD4Fs/Mp33XA/wxFwhpFabN7RDFSv+nMteUMyanJ
	 0OCE49y6B7/PMHehPvPYyzCn8+zPxXXPBrPBq+zxJm78ShwCP8Jkcs73zW3txqi0QU
	 ow5ikqWYdbMNWjcWxgXuXXtBrwdP4SsCF2GG2iBy1dhiWsNw3u5paUAG2hBdzmzxDa
	 nrQgeq+XcFkb1zEiIB0RfiNEpuq2ejaODrI933oT2lzmaKjWyn4zMa46TEQxCmzviS
	 y1GpuI0cnQVIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] of: property: add i2c-parent to fw_devlink supplier
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai>
References: <20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:48:19 +0000
Message-Id: <20260815234819.BA8731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The custom `i2c-parent` parser uses an incorrect compatible string=
 (`toshiba,tc9563`) to detect TC9563 devices, bypassing the custom parsing =
logic for actual hardware.
--

--- Patch [1]: [PATCH v2] of: property: add i2c-parent to fw_devlink suppli=
er bindings ---
commit 53359fe4a5d6b17938d753a47bed08284aafa03a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: of: property: add i2c-parent to fw_devlink supplier bindings

This commit teaches fw_devlink about the i2c-parent property so consumers
are unbound before the parent adapter's device, ensuring proper teardown
ordering. It introduces a custom parser for i2c-parent to handle differing
layouts, specifically to accommodate the toshiba,tc9563 node which holds a
phandle followed by an i2c slave-address cell.

Link: https://patch.msgid.link/20260813-b4-of-property-add-i2c-parent-v1-1-=
a2487e920ce1@nexthop.ai

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de03..e9ceb26c03000 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c

[ ... ]

> @@ -1471,6 +1471,22 @@ static struct device_node *parse_gpio_compat(struc=
t device_node *np,
>  	return sup_args.np;
>  }
> =20
> +static struct device_node *parse_i2c_parent(struct device_node *np,
> +					    const char *prop_name, int index)
> +{
> +	if (strcmp(prop_name, "i2c-parent"))
> +		return NULL;
> +
> +	/* toshiba,tc9563 is <phandle addr>; every other user is bare phandles =
*/
> +	if (of_device_is_compatible(np, "toshiba,tc9563")) {

[Severity: High]
Is this the correct compatible string for the TC9563 PCIe switch?

According to the device tree bindings, actual hardware nodes for the
TC9563 use the compatible string "pci1179,0623" rather than
"toshiba,tc9563".

If the compatible string doesn't match, this check will fail during boot
and fall through to the bare phandle parser. Will this cause fw_devlink
to parse the second cell of the property (the I2C slave address, e.g.,
0x77) as a phandle?

If another node happens to have that value as its phandle, it appears
this could create a spurious device link that might block the PCIe
switch from probing or create a dependency cycle.

> +		if (index)
> +			return NULL;
> +		return of_parse_phandle(np, prop_name, 0);
> +	}
> +
> +	return of_parse_phandle(np, prop_name, index);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815-b4-of-prop=
erty-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai?part=3D1
