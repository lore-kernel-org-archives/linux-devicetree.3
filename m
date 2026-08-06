Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0133D3F4104
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009230; cv=none; b=BTWfG2Nas9nDYq+lTzAXm6TiE28SRPr81z6t1i5imXmDMgzdQNudRJPcMLaiSzEn0lCwwxJu/m0zMNrEMjL787y/XTa1Ud+4wndqS7ivWbHZATbyJSY7rLQthEMUPfOQ7CA0JisaYHBJ+StwuKcpEvp1jOxzchbKychGV70COrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009230; c=relaxed/simple;
	bh=tY+wYW+94RlJQLFClI9Ti98ycfXqtsdg/xlyDvX5y6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YiViSDcV0S4955qJTa0s4CU/P7G19ePQG5yxEa6W2rLC+UgaK4tIcO8dDw7Zylen18nDIaKLZFENqhUg+vOnVI73QC0NqLqkqeSmw0vDSAI31xN1QLw1dryPJ73boZhYbf2DRoq7Ej6pv0Svk/vwC5FdnQlZyJyFxb8cWiyuLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noqePYq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noqePYq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D111F000E9;
	Thu,  6 Aug 2026 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009228;
	bh=cuzh3Pf7WawZmEZfVSYFktQ8K2vLicUZcUnXg/KPYwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=noqePYq7F1ANbSigZaQ5orODula9ZteqSErNN2qCcZ+tslyTr94TOKdrmW1YOmPZ2
	 eGSeGB8j7tlkXZCku1HPjDyPDgNGkSSN28cklqvBblPu522aYDKUy9/9yP+21wwRwZ
	 SlkrV0ZQo4YxJ4wQAFmjEDxX/CNJ17v0FagMg0wekLWIyXVtz4WsmLTP7Jsiz++CyS
	 Wc1TVRVCxHC4eQCqIAuSORmVFNKdG14UNFB1zEi4wOIDCNvM/K8pXGxboPVuS65t5k
	 yiXYN1vtX+DzmfaI6f2R3rV+VUnugN/DhtosvBXaOUHg97i6E/Jfk8IA8IMVOk5yQR
	 ZwhG5ZarvncMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: altera: move Agilex72 DT and use altr
 prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:40:27 +0000
Message-Id: <20260806094028.55D111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The clock operations struct for gate clocks (`gateclk_ops`) comple=
tely omits enablement functions, rendering the hardware clock gates unmanag=
eable by the OS.
--

--- Patch [4]: [PATCH 4/5] arm64: dts: altera: move Agilex72 DT and use alt=
r prefix ---
commit fb18cfcc77d7e1e9f2bfe18c6b8c94bdd0fbad23
Author: Chiam, Evon <evon.chiam@altera.com>

clk: socfpga: agilex72: add clock manager driver for Agilex72

Add new Clock manager driver to support new Altera Agilex72 platform

> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk=
-agilex72.c
> new file mode 100644
> index 0000000000000..e350d8a9bb4d9
> --- /dev/null
> +++ b/drivers/clk/socfpga/clk-agilex72.c
> @@ -0,0 +1,1181 @@
[ ... ]
> +static const struct clk_ops peri_cnt_clk_ops =3D {
> +	.recalc_rate =3D agilex72_clk_peri_cnt_clk_recalc_rate,
> +	.get_parent =3D agilex72_clk_periclk_get_parent,
> +};
> +
> +static const struct clk_ops gateclk_ops =3D {
> +	.recalc_rate =3D agilex72_gate_clk_recalc_rate,
> +	.get_parent  =3D agilex72_gate_get_parent,
> +};

[Severity: High]
Does this code prevent hardware clock gates from being managed by the OS?

The clock framework relies on the .enable, .disable, and .is_enabled
callbacks in clk_ops to manage hardware state. Because they are missing
from gateclk_ops, calls like clk_enable() will silently succeed without
modifying the hardware.

If a peripheral's clock was disabled by the bootloader, it will remain off,
causing the peripheral driver to fail or the system to panic when unclocked
registers are accessed. Conversely, unused clocks cannot be turned off.

[ ... ]
> +static struct clk_hw *
> +agilex72_register_gate(const struct agilex72_gate_clock *clks,
> +		       void __iomem *regbase)
> +{
[ ... ]
> +	if (clks->bypass_reg)
> +		socfpga_clk->bypass_reg =3D regbase + clks->bypass_reg;
> +	else
> +		socfpga_clk->bypass_reg =3D NULL;
> +	socfpga_clk->bypass_shift =3D clks->bypass_shift;
> +
> +	init.ops =3D &gateclk_ops;

[Severity: High]
Can these callbacks be added so that hardware state is correctly modified?

This assigns the incomplete ops struct to all software-gated clocks.
This occurs every time a peripheral driver calls clk_prepare_enable() or
clk_disable_unprepare() on any of the SW gate clocks registered by
agilex72_register_gate().

> +
> +	init.name        =3D clks->name;
> +	init.flags       =3D 0;
> +	init.num_parents =3D clks->num_parents;
> +	init.parent_names =3D clks->parent_names;
> +	socfpga_clk->hw.hw.init =3D &init;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786006669.gi=
t.evon.chiam@altera.com?part=3D4
