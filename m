Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B176221F2F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602700; cv=none; b=lIHvxRYs5uI6jdDVri1zrGMDaU+mfhNy7wC3CdWUnA57MnflyiRz8KpAUEzxw3fkSYsQR06b42muiJxcI8FGuoltPO8EoamDmU8Huq0/AfE8qHBjmjNUkcBieDnIv41fZ90l1n+AN2kudpMjntmQFDEBhlIAFFs+QpilaPmTPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602700; c=relaxed/simple;
	bh=VldfUk7K2bVskq3MDuht1Y+Bxnj9hq4kAnymN96MvJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/jOKlX8ERz8MpQBW56sne/UG1BoCSrlX2/hvg8hFwnzEIF/Az6NybA87TWEBdzgKd0d/Jmwcqfuh+vnUBlylhlWab1RWiBrIF4iFbss7TN4aIwtsSYbW7WD/bLAVvQ82igOzpIqHF+3ow1hQPmpiVbqTWfu9/c+FzC089SsYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XueTZFVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XueTZFVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508D81F000E9;
	Tue, 21 Jul 2026 02:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784602698;
	bh=WGiWKb/rKF2WMnJ7bABOpcYeJkNiEPxz6IqoJN1K8yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XueTZFVEceyBvXB7/Okd6FhmOvJNchi8EIOsKrRA10XLYunbvN47cNeGY/FEcm9bi
	 2bjrNh/bqzmOMt8YP2ldwF/eFmbk/+yoa3QqHrl3CNGeR2I8gDLyz+uNo7kzS5ipBE
	 JiuJXfOLkycc+/40giyz/YNaFXE0aE7M/2cgeP6tcIVXuEnJR8EWsHysqmLOIjz6fY
	 Tx53PHda62LrMyitPdGvVcTuppmX5E5HKTgCCTtSVzZyss1YsP0uLOpgpI9QX1FpNe
	 uP/EAN7lvAfnQooF5NQWrIvjlCNEqNFOTvI24KpmV0w/9tck+2qWXuYZ2FIRkDQpsG
	 1vinPtwMiGaHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/4] of: unittest: cover /aliases updates from
 overlay apply/revert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-4-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-4-27da6848dd84@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:58:17 +0000
Message-Id: <20260721025818.508D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The test assertion for verifying alias removal trivially passes =
because it checks the wrong node, rendering the removal test ineffective.
- [Medium] The error path for `of_overlay_fdt_apply()` skips cleanup, leadi=
ng to a memory and device tree state leak.
--

--- Patch [4]: [PATCH RFC 4/4] of: unittest: cover /aliases updates from ov=
erlay apply/revert ---
commit d95c5208da27c0c2461530192533ee49d2b62c1c
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: unittest: cover /aliases updates from overlay apply/revert

This commit adds overlay_alias.dtso and of_unittest_overlay_alias() to
cover the end-to-end flow of aliases inside an overlay. It verifies alias
updates when applying and reverting overlays with a non-NULL target base.

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..35d75f2b3ef25 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c

[ ... ]

> +	size =3D info->dtbo_end - info->dtbo_begin;
> +	ret =3D of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, base);
> +	if (ret < 0) {
> +		unittest(0, "overlay_alias apply failed, ret =3D %d\n", ret);
> +		goto out_put_base;

[Severity: Medium]
Does this error path skip cleaning up the changeset?

Looking at of_overlay_fdt_apply(), if it fails during the apply phase, it
may still populate ovcs_id. Does this code need to call of_overlay_remove()
to clean up the partial changeset before jumping to out_put_base, to avoid
leaking memory and device tree state?

> +	}
> +
> +	target =3D of_find_node_by_path(target_path);
> +	if (!target) {
> +		unittest(0, "could not find grafted target %s\n", target_path);
> +		goto out_remove;
> +	}
> +
> +	id =3D of_alias_get_id(target, "testcase-alias");
> +	unittest(id =3D=3D 99,
> +		 "of_alias_get_id() =3D %d after overlay apply, expected 99\n",
> +		 id);
> +	of_node_put(target);
> +
> +out_remove:
> +	ret =3D of_overlay_remove(&ovcs_id);
> +	if (ret) {
> +		unittest(0, "overlay_alias remove failed, ret =3D %d\n", ret);
> +		goto out_put_base;
> +	}
> +
> +	id =3D of_alias_get_id(base, "testcase-alias");

[Severity: Medium]
Does this code test the correct node during the removal assertion?

The assertion checks 'base' for the alias, but the earlier success path
checked 'target'. Doesn't of_alias_get_id(base, "testcase-alias") always
return -ENODEV here, meaning the test will pass even if the overlay removal
failed to actually clean up the alias?

> +	unittest(id =3D=3D -ENODEV,
> +		 "of_alias_get_id() =3D %d after overlay remove, expected -ENODEV\n",
> +		 id);
> +
> +out_put_base:
> +	of_node_put(base);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-27da6848dd84@nexthop.ai?part=3D4
