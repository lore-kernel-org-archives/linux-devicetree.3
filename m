Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D34C8EB
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785639050; cv=none; b=JhZnq0+rAtt2QX2+Cin4vzdlUJ7gicBoP/GKJ/UawF58ZkF+P2pUeMfR6afYvz3b87zFvICktScOGGE3PxGc0ntHRnG72U/mz6a2DPeu5ol0A4C02y9qM3yqiCsqcqPpeBxKtIPPQapqqpKlXA3R2YXa4ZLL/pUuMiezsNZFC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785639050; c=relaxed/simple;
	bh=B9xxYv0C1ukaF9udJFweRH9LRhrnYKTVbmI5s9y/IWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kFyImEfw5l+H2tLCzzbGH13r2kuyrcabMVU/mqJbRb4sIuA/1C6z0M0ewOK7CihGfp2sVCBfL71IzvRiK+sj4Rqt04e6e3l4DcTen0QGrW5uz9hAwQmsrxfqHRW3nKhJMzF2iPVKoTfgp/o3l/3fTqU1ss6yenwTTygLypmjl2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atcwvMD2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atcwvMD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8053B1F00AC4;
	Sun,  2 Aug 2026 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785639048;
	bh=dSUlydtuPJF6NSnQQb3lz7Oy0VB4DHcORV++VMRgHug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=atcwvMD2KiXucCbsOtG3HNEr9Kz2ySbSUGgUOmNDCE0o5CsyTOHfsvS50jVMg5uI4
	 ZykZMZGzHLJMRa4jfidvb8jmaMTUWUpmCMk7o+9F0TMx81O7sD8UeVKYUyWrPOHsdZ
	 JbCx3XUBfQVfN68xK4X+tEFvwFE73czJ4kb+W6kzqBmGGzk7qUbetnL9LgyOqYuqqD
	 JerMIp1AihWxKIZK+e1WQ4P9YO7LMmJ96lSph0duYrr0NUDTUM9U3lJha05v0sJqdy
	 oWhg/sWklllCOyVW3YRvUX0REqrDDeCdA+TwLlLTcAPO/AockkYyLoAxKX4ALT03Aj
	 jZwqjXL6Q5VYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] of: Put coreboot node after compatibility check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuho Choi" <dbgh9129@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802023821.494178-1-dbgh9129@gmail.com>
References: <20260802023821.494178-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 02:50:48 +0000
Message-Id: <20260802025048.8053B1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The EXCLUDED_DEFAULT_CELLS_PLATFORMS macro evaluates its condition=
 on every execution of WARN_ONCE, causing repeated full device tree travers=
als under a raw spinlock.
- [High] of_msi_xlate() incorrectly ignores the msi-parent DT binding when =
the caller passes NULL for msi_np, leading to erroneous MSI ID mapping.
--

--- Patch [1]: [PATCH v1] of: Put coreboot node after compatibility check -=
--
commit d698ca1f75edc245216563869cb5c61be66a91d2
Author: Yuho Choi <dbgh9129@gmail.com>

of: Put coreboot node after compatibility check

of_find_compatible_node() returns a referenced device node, but
EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
discarded the reference. This leaked a reference each time the
address-cells or size-cells warning condition was evaluated on a
coreboot system. Use a helper that drops the node reference after checking
whether the coreboot node exists.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3f..8d04eaed98053 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -95,9 +95,21 @@ static bool __of_node_is_type(const struct device_node=
 *np, const char *type)
>  	return !strcmp(match, type);
>  }
> =20
> +static bool of_coreboot_present(void)
> +{
> +	struct device_node *np;
> +	bool found;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "coreboot");

[Severity: High]
This isn't a bug introduced by this patch, but WARN_ONCE unconditionally
evaluates its condition on every call, even if the warning has already fire=
d.

When of_bus_n_addr_cells() or of_bus_n_size_cells() are called on a node
missing these properties, EXCLUDED_DEFAULT_CELLS_PLATFORMS is evaluated,
which now calls of_coreboot_present().

Since of_find_compatible_node() acquires the global devtree_lock and
linearly scans the entire device tree for a 'coreboot' compatible node,
can this cause significant performance regressions and lock contention on
systems where missing address/size cells are common?

> +	found =3D np !=3D NULL;
> +	of_node_put(np);
> +
> +	return found;
> +}
> +
>  #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
>  	IS_ENABLED(CONFIG_SPARC) || \
> -	of_find_compatible_node(NULL, NULL, "coreboot") \
> +	of_coreboot_present() \
>  )
> =20
>  int of_bus_n_addr_cells(struct device_node *np)

I also noticed a pre-existing issue in drivers/of/irq.c:

drivers/of/irq.c:of_msi_xlate() {
	for (parent_dev =3D dev; parent_dev; parent_dev =3D parent_dev->parent) {
		...
		/* -ENODEV: msi-map absent -> check for msi-parent */
		if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
			break;
	}
	return id_out;
}

[Severity: High]
This isn't a bug introduced by this patch, but does of_msi_xlate()
incorrectly ignore the msi-parent DT binding when the caller passes NULL
for msi_np?

If a caller requests MSI ID translation but passes NULL for msi_np, the
loop termination condition short-circuits since it requires msi_np to be
non-NULL. This causes traversal to incorrectly continue up the device tree.

If an ancestor node defines an msi-map, it will erroneously apply that
mapping to the device's ID, leading to incorrect interrupt mapping and
potential device isolation failure. Should this check handle a NULL msi_np?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802023821.4941=
78-1-dbgh9129@gmail.com?part=3D1
