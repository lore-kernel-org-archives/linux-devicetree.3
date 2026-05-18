Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6F64AA4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116036; cv=none; b=PZZ1VDZjfRHXWRP/QCqNAgIvHM2MjpIUnHQ0yl3h6m3NmLaB+s9RmRXBaQVJL8wvpc53Z8IMwRqBYAzBavR5ZtDseLVM89OxKeZLBOk8JKWgqpHSaMTZagtBc6zlhEwPnCpC/psoHfeyh43KnHSFBZgg9Ylwl6JLmbqbEAr6j/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116036; c=relaxed/simple;
	bh=AtsRO41qz5RAzIPXNa7/rHyB0Pi4t1adRGXGdkQMcRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NI1oMMxAUoNh/bfCOfpsPOhwFdjpDG17Ihg2f1j1CF22eHCRMkzySCqRALP1yWUvLzuAJDgQeqeZD8RU9hV4d48pnXudLHld3Bta+SgovJ4Es7UCVEL0wBQl1H/yVI3NgZQ3i3IDaZsJpUlpw6g+JQzbCDitJl2+MMrYcVq9BjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mndN1cSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mndN1cSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E6FC2BCB7;
	Mon, 18 May 2026 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116035;
	bh=AtsRO41qz5RAzIPXNa7/rHyB0Pi4t1adRGXGdkQMcRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mndN1cShLMdtRIJI/VASrU4yWdJy5EB7BLXZBqdKr7aBIS2hsgbCxDxH58dUKZRXA
	 URR+cyvQZBvokUKuDSeQiJqxVKwA2AdFVYQ007+QQS0UE5Dm2GRQ0BCauwOhczZySC
	 hnLdT6SMliAGyBNt2JP3rqvTXphTjmHKLsxQmnxEob54ZeJtyEx3KY6qZgtEOiJzgy
	 2+fuuUqmRxHSoQnfuTaKWkJQ3hQSpgy+0x3UTc8zqk9xI4m8plcbez5AIKlK5u/UTj
	 qld0WWmOFa9+IS3bJjAtmpJ7VIeTRoW6usesoyQ1pyBgsAhRyGsM1XUWNVxWafYMrm
	 cbyy8Mi8n4gIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] nvmem: airoha: Add support for SMC eFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518142042.8331-3-ansuelsmth@gmail.com>
References: <20260518142042.8331-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 14:53:55 +0000
Message-Id: <20260518145355.81E6FC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing device tree node linkage for NVMEM devices causes DT cell =
parsing failure and consumer resolution errors.
- [Low] Multiple unnamed regmaps registered on the same device cause debugf=
s collisions.
--

commit 50a12b4fbba5f61d8cd4d5c2c71e0f517760d0ef
Author: Christian Marangi <ansuelsmth@gmail.com>

nvmem: airoha: Add support for SMC eFUSE

This commit adds support for SMC eFUSE on the AN7581 SoC. It reads
calibration and specific SoC information via SMC commands, while
relying on ATF to validate the data and reject protected reads.

> diff --git a/drivers/nvmem/airoha-smc-efuses.c b/drivers/nvmem/airoha-smc=
-efuses.c
> new file mode 100644
> index 0000000000000..bb279d1495196
> --- /dev/null
> +++ b/drivers/nvmem/airoha-smc-efuses.c
[ ... ]
> +static int airoha_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
[ ... ]
> +		priv->bank_index =3D bank;
> +
> +		regmap =3D devm_regmap_init(dev, NULL, priv,
> +					  &airoha_efuse_regmap_config);

Is there a risk of debugfs collisions here? devm_regmap_init() is called
for each eFuse bank using the same parent dev.

Since airoha_efuse_regmap_config does not define a name, will the regmap
core attempt to create duplicate debugfs directories under the parent
device's name, triggering a warning?

> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		airoha_nvmem_config.priv =3D regmap;
> +		airoha_nvmem_config.dev =3D dev;
> +		airoha_nvmem_config.id =3D bank;
> +		nvmem =3D devm_nvmem_register(dev, &airoha_nvmem_config);

Does this sequence break NVMEM consumer resolution and device tree cell par=
sing?

The airoha_nvmem_config.of_node field is not set, so the NVMEM core will
default to using the parent device's of_node. This means consumers
requesting the child bank via a phandle might fail to find it, and the
NVMEM core might incorrectly parse the parent node's properties instead of
the child's cells.

If we assign airoha_nvmem_config.of_node =3D child, could this lead to a
use-after-free?

The for_each_child_of_node_scoped() macro automatically drops the reference
to child at the end of the loop, and the NVMEM subsystem does not acquire
its own reference when copying config.of_node. Does the driver need to
explicitly call of_node_get(child) and handle cleanup on unbind?

> +		if (IS_ERR(nvmem))
> +			return PTR_ERR(nvmem);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518142042.8331=
-1-ansuelsmth@gmail.com?part=3D2
