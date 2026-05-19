Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F1134DB7B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173895; cv=none; b=kcOJ+m1fKXv9M7ZzYawMbu7rSTZDbbxeY+s1atC1EDEeufvwrH5R5YTX0r2xGWaphPksHhndK0ZUlmUNJBY2Z4b64rUxhnsuwo39rmQSARxqoz9vtWjCU5aml5CXbKaUWhlvUvT5b4uvfEGf6YhKRpRjhWCZ3HvWETXZOUKoBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173895; c=relaxed/simple;
	bh=aHvZ6UfMo1KecwmHuStqw8h753mW4Ae1CFSTz9OmMeM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OULl8tBF3mAwdEP9prL6FvXcAYiFX9d8c4+tiSMMqgoy/86ihpPLS23Sqb+wd6NgFD0xJoY+gl3ns6dsXPougqqUa1NSa7iXL4agqSEy8P6pBS7nLR6Fqyt+jIeRU2GZaa7D7YemBVinB9dfuOIY489n7216S54APLC+LD+ZvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JElev9f1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JElev9f1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B2BC2BCB3;
	Tue, 19 May 2026 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779173894;
	bh=aHvZ6UfMo1KecwmHuStqw8h753mW4Ae1CFSTz9OmMeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JElev9f16KQqva9ZDvIWzN/s2DLPuz0fmK2izay8v5FkHKfi64slnUDm6kbN5l7t6
	 jfD04YrxcUW8bZov/DsFW1PrvtF9R1OqDS/KL7a7s2DRc8Vr1EcGK9ccIflpC5CMUv
	 +7zy5Bey856AVh1GT7jgCkKyd78GAzw7ZKQrsboUVY311TeCS6CaMBwOScqFgFg25b
	 2UbynDolb3WkARX+rk+19vhRHcIcC8iWU1RTcFlTM3Y1+UPa2sZnIPnv2IdXniQsXm
	 LuXS6j/MxcEaYmLHmlc10sGxfGmXbJCgazp78qmY+aiyjrcE/JRYkSSd+MRQMvmQs4
	 74PD04msTwxmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] i3c: dw: Add apb reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519055105.13079-5-jszhang@kernel.org>
References: <20260519055105.13079-5-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 06:58:13 +0000
Message-Id: <20260519065814.46B2BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect and asymmetric hardware reset sequencing for the APB bus=
 and core.
--

commit 1f3afa3e9cfb230aef26a85d4d3a519a377255b1
Author: Jisheng Zhang <jszhang@kernel.org>

i3c: dw: Add apb reset support

This commit adds support for an APB interface reset control to the DesignWa=
re
I3C master driver. The reset is obtained during probe and managed across
runtime suspend and resume cycles.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 6286dc5d09568..75608fbc3cbd1 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1596,6 +1596,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *mast=
er,
>  	if (IS_ERR(master->core_rst))
>  		return PTR_ERR(master->core_rst);
> =20
> +	master->apb_rst =3D devm_reset_control_get_optional_exclusive_deasserte=
d(&pdev->dev,
> +									       "apb");

Does allocating apb_rst after core_rst cause a devm cleanup ordering issue?

Because devm executes cleanups in reverse allocation order, apb_rst will be
asserted before core_rst during driver unbind or probe failure. This stops
the bus while the core is still running, which contradicts the assertion
order in dw_i3c_master_runtime_suspend().

Also, because devm_reset_control_get_optional_exclusive_deasserted()
immediately deasserts the reset, core_rst is deasserted before apb_rst
during probe. This brings the core out of reset while its bus interface is
still held in reset.

[ ... ]

> @@ -1796,6 +1802,7 @@ static int __maybe_unused dw_i3c_master_runtime_res=
ume(struct device *dev)
>  	pinctrl_pm_select_default_state(dev);
>  	dw_i3c_master_enable_clks(master);
>  	reset_control_deassert(master->core_rst);
> +	reset_control_deassert(master->apb_rst);

Does this sequence fail to correctly reverse the suspend order?

In dw_i3c_master_runtime_suspend(), core_rst is asserted followed by
apb_rst, which correctly stops the core before the bus.

However, here core_rst is deasserted before apb_rst. This means the core
is brought out of reset while its APB bus interface is still held in reset,
which could trigger bus faults.

Should apb_rst be deasserted before core_rst to ensure the bus is available
before the core IP starts operating?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519055105.1307=
9-1-jszhang@kernel.org?part=3D4
