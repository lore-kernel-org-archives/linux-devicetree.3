Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597329D281
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785385926; cv=none; b=Ng+F1+96m+VhTXU5fTW1mlmqRvTQOUrjAblRlu7sE9zqoCWQGegfxScSo14VwdQ5jxSnArjl/yjLdZTqkNaNfng63e6misZvkQeXd9mzjtNjx0semN40nXl+bIFTXSmTTbV2SUvd5AIMVVCX5QuJKASOSh1xizvSy+xoB7bwfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785385926; c=relaxed/simple;
	bh=lciGQREy2jJpJNKxmXc72nwCyF6jlgSfm/n5W8Bn9Wo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NYIPQ+XfB3F89cdI/ARnCQnvxtuoc8rEtP2nQBaQNlSxAbGleOqPyHpg46gKtQaiv6dhqOGl6ivpgJeJU+mXX4RzSqHCP/iXxc8E7r1sxoWjxKryangty5WNvBMan+ZEp/g7C1sLM0bnahBh8BiIGutgs74IAZHcSgMjcvBpO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNYdwdO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNYdwdO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C7F1F000E9;
	Thu, 30 Jul 2026 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785385924;
	bh=Y5X3Az5DDZJmCoIoxE9cH6tzh4vlcTrHOgZrKV76Y94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNYdwdO24WF7pBzvGey3vlVdu0WTAI21/LmWZwSoDcaZvm4T3kOKj4031X40YP3LM
	 tKpzkEm+7093YIyA876v9ioWMM6oOyoU/Q9gs8lY/ErtmgqG4TYqvM0GQYB1M0MMXq
	 960RVVhsLZI8f+XurXL4L8dsb7mU/aoLnNFvzAnA4TrmIYkWrZWKwgNmxzK/Ck6yFI
	 +C9LyF98e7Ib9doxMsKRDVz0G1bwWQcM/vCXmK4W3+Tb4qieNVtYYtDov3azHOUtsx
	 KwvuTDNG24mGhwbgvRlnalDjHqN4dQxwp3MhBTjPSwpOzuI0CUMiuPY28K4u8X1Asc
	 8/wF2AjqA0pCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260729043026.1811147-5-manikandan.m@microchip.com>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 04:32:02 +0000
Message-Id: <20260730043203.87C7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Module unload leads to a Use-After-Free (UAF) due to a dangling `r=
ead_post_process` callback because NVMEM layout cells are not dynamically u=
nregistered.
--

--- Patch [4]: [PATCH v6 4/7] nvmem: layouts: add Microchip/SST SFDP EUI la=
yout driver ---
commit 16c236b381f7d2d9225ab89076bcd39b341f60db
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

nvmem: layouts: add Microchip/SST SFDP EUI layout driver

Add an NVMEM layout that exposes the factory-programmed EUI-48 identifier
from the Microchip/SST vendor SFDP parameter table as a mac-address cell.

> diff --git a/drivers/nvmem/layouts/sst26vf-sfdp-eui.c b/drivers/nvmem/lay=
outs/sst26vf-sfdp-eui.c
> new file mode 100644
> index 0000000000000..641318d6f0af6
> --- /dev/null
> +++ b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c
[ ... ]
> +static void sfdp_eui_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but it exposes a pre-existing
architectural flaw in the NVMEM core.

Since this driver can be built as a module, what happens when it is unloade=
d?

Looking at the NVMEM core, nvmem_layout_unregister() is an empty stub. It
does not actually unregister the cells or remove their sysfs interfaces.

If a user reads the NVMEM cell via sysfs after this module is unloaded, the
core calls __nvmem_cell_read(), which dereferences the now-dangling
sfdp_eui_read_post_process callback pointer, resulting in a use-after-free.

Should this driver be restricted to a built-in driver until the NVMEM core
properly implements layout unregistration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729043026.1811=
147-1-manikandan.m@microchip.com?part=3D4
