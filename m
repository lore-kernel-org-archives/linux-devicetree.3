Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85F372EF1
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878271; cv=none; b=FgmF7x89MRx13EHlrWlxY3yl9UlxGB3r/Ms4U5Iw+ez/355Znv8i4va1r3i6ml56yczzA02+Mgu+8ysRlwctbulWDOSTV7F4onVw5KLbXgWZjJM9yiZeO7RAATRqRQ4nirtJLSIQoK4SeT6bBtsZUqg7YEvfG2J1hwigu/525Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878271; c=relaxed/simple;
	bh=KHAkjGEa7B8RwMoBqLNhKHe4WnIOJ0AqNNv4cjxEeMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZerbWPcZcAQ0jeN+8xXASIYtg91O8MUekCJefVrlwvkqV2liaryqBTnBWA7R+uLXifwNMNPjGaNe6//I+Dv4QfoHdGFcLfXMqQN60aC0IvavFDwgRZr1KWplh/Sa489wh58d2UgGqj5SEOOz8mGMXcquc16q/1DdxsKgMSjB414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIxTGGCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIxTGGCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA631F000E9;
	Fri, 19 Jun 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781878270;
	bh=oJMhjGGLS67mEVytagF04OJoCp1RkhCpKwOWuyFKZQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIxTGGCfzWqhjhqs9XZG0QMPssIIoPVqFEPGZaZDdJlPuoC40gwyjtsxGQEHnDfPw
	 XTUKpMiw5bbTPiD+FpSjYvGGBE2AaehmX/RCHCP0FWM2jJ+zwuWohbnNe6iMG1rQ5h
	 B/dbR2Ua5A4Ct7zpiYQsNQME8mTCqbLtgd0faA/15AaDDbSYYZdzaZ1oK2bnwtkwuS
	 EhV6f4kXR9ey0YMQSYAnv4MCoFe0wmTkGTzTiBB/FbKN6KCGYdv0PLsG7Wfurewx4A
	 t7f28nhQO++BglETKT5Zg7JewyX795DEmH6+v8XNhyyLTycYKHOmY0Yp+CyuBloIA9
	 k8k1U+r/P1S6Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v8 08/12] of: property: fw_devlink: Add
 support for "pcs-handle"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260618125752.1223-9-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 14:11:08 +0000
Message-Id: <20260619141109.0AA631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] fwnode_property_get_reference_args() usage in newly added pcs.c =
causes -EINVAL on existing DTs due to lacking a cell count fallback.
--

commit 91acc7e182a01f5abd0ae44dd757caf24a80257a
Author: Christian Marangi <ansuelsmth@gmail.com>

of: property: fw_devlink: Add support for "pcs-handle"

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746f..e6584a2f705d2 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-cont=
rollers", "#access-controller
>  DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")

[Severity: Medium]
While this fw_devlink integration correctly falls back to 0 cells (via
parse_prop_cells()) when #pcs-cells is missing, the newly added API in
drivers/net/pcs/pcs.c does not.

In drivers/net/pcs/pcs.c:fwnode_parse_pcsspec(), the fallback cell count is
hardcoded to -1:

	ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
						 "#pcs-cells",
						 -1, index, out_args);

Similarly, in drivers/net/pcs/pcs.c:fwnode_phylink_pcs_count():

		ret =3D fwnode_property_get_reference_args(fwnode, "pcs-handle",
							 "#pcs-cells",
							 -1, index, &out_args);

Passing -1 as the fallback cell count causes parsing to fail with -EINVAL on
existing devicetrees where the pcs-handle property points to a node without
#pcs-cells.

Could this create a regression for the pcs-handle binding, causing existing
MAC drivers that migrate to this new API to fail discovery of their PCS?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618125752.1223=
-1-ansuelsmth@gmail.com?part=3D8
