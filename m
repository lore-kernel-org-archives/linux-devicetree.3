Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17F2E2EEE
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720935; cv=none; b=U57k1G7sSiwTatmubrRdgEvruhI/WRHgS7oeEh9y7M/YjUg6wQ3MxonM1Z71t198tnjfJww41m/vp+fxgTMLXppdcw8by89RkKhZNA14H6QNBkxL4dgvROlBBGlok33oNcVBLUTgEZAbUcVsXXL05pHvhhewJGPiDzyf59+c8dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720935; c=relaxed/simple;
	bh=Gx7UzAJDd0kvBCsWh7TYbacJUHuCLBI9YhUtvkyeHlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XPKIza0n1eA/M7R8rEJV/yd8/MSOSyjQH/NsYeiT2yQ+GJXdtoNaGgrF0A4sLevdKIAPVPHzkENEdz5ovAXen86qxumT9EhMQ2xr2k9cWoP6v1xuWknrqxrl+shAhu4neWfVILIOKSMBMjruq+f94SiMu8HfR1yqkQ562hlJ808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3EWsQDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3EWsQDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93741F00A3D;
	Sun,  6 Sep 2026 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720933;
	bh=SHoYU6plx+azmfe4yg2b9DVbc0maS2QrKGHHE4Ooc74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a3EWsQDcW3Cjh1K9WaNb0kuquXXNYvs//UQStipca3Qm6tlySNy3nQDjavSisQkHj
	 aWL+8RTEDFYwAXOfLBox45dmzv6FSgU9AWVPnx6gAAMz1jrVXwWGxIG9j1DW0CoyuJ
	 7O2rq4TSW+qJp+g32lca7lChttgFhXsKwFwQRSNX7QxOIOxc7IyDcuu70Z/8Yu+0rD
	 1VjawLwrZviPf7ObtrOlsvtXEJrB8zCcWlKEePtuafALjnnGWwA/HO4pEFYt7V2o4J
	 cdqlGbx52UwKLFZPiCD1+rvLdXskveZugXN+WS2x4PgDgPO8bLLVDijauHAVd0ha4u
	 Ay76qn3sBkQjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/22] thunderbolt: Add add_links to tb_nhi_ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:55:33 +0000
Message-Id: <20260906185533.A93741F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Fallback path in tb_probe() blindly casts a generic platform dev=
ice to a PCI device, leading to a struct mismatch out-of-bounds read.
--

commit c3cbdbc00334a1dc32e8f14d7f05432dee177b2c
Author: Sven Peter <sven@kernel.org>

thunderbolt: Add add_links to tb_nhi_ops

This commit introduces an add_links callback to tb_nhi_ops for platform
drivers to discover and add device links. This enables drivers like the App=
le
Silicon one to use device tree connections instead of ACPI or PCI topology.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index d2832323cc360..72418a07166e3 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3434,7 +3434,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>  	 * before the PCIe/USB stack is resumed so complain here if we
>  	 * found them missing.
>  	 */
> -	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> +	if (!(nhi->ops->add_links && nhi->ops->add_links(nhi)) &&
> +	    !tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
>  		tb_warn(tb, "device links to tunneled native ports are missing!\n");

[Severity: Medium]
If a platform driver does not provide add_links or it returns false on an x=
86
Apple machine, could this fallback logic cause an out-of-bounds read?

Looking at tb_apple_add_links() called here:

static bool tb_apple_add_links(struct tb_nhi *nhi)
{
	struct pci_dev *nhi_pdev =3D to_pci_dev(nhi->dev);
	...
	if (!x86_apple_machine)
		return false;

	switch (nhi_pdev->device) {
	...

Because this patch opens up tb_probe() to non-PCI platform drivers, passing=
 a
generic platform device to tb_apple_add_links() will result in an invalid
cast via to_pci_dev(). If evaluated on an x86 Apple machine, the subsequent
access to nhi_pdev->device will read out of bounds.=20

Is there a way to verify the device is actually a PCI device before calling
tb_apple_add_links()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D16
