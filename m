Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B73CA497
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734596; cv=none; b=EZKsSfwrCsKQ9JhrQ7XjAl/nlPk1mfjxn64mxVPJRlD3Fq1aBzV06Es29qswxX761Av20JP4GQzKgldJEwlVit5aah4nsFzEX6uUmCwM9WsQZICdyL6bnIDjAN1+jfy9cR+0Bfhkr2RPCNH+UxpW2CbRR/Cv1/tC9tWxtIDHMbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734596; c=relaxed/simple;
	bh=VIk8ZOc/L0Jcj5WsJpV/rE3zwIbmefh3vxQCH6MylKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ogh9ASWfIhLlCeItrDuk+TBUt7lgmfi/uf564iTycVIadFhUjYwzPud2bxr3ouLD6YAtMA7NBL4epMeP/Nj0a6ixamt/rdLz+JIheW96j7iNaUaAX5syxEKQ4m9LYI182iHDf0uw5TtCfNeO6SWv2Oc2TwCHdxY8je0BeZZxFYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HacJMrnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HacJMrnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED6A1F000E9;
	Wed, 22 Jul 2026 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734594;
	bh=Nvom18ZqM8M7o/js3SWI6DEysi7MmHmsd7HyTWJDFzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HacJMrnwiA3mkiQxnar/DMgGHrfJK043TsPAYFg1PP3izMN1I1WyKwemgTeMlhZO1
	 uu2h12swIvK90tzNUR0ap6swcSSvSTkd8GK0s7StRnZ14aOqveR3BtPsckf22CB5tM
	 tblqVQBq9CHUn/gNGgxg3Dql3LpszvY1pcnnySxe16twtDmIfCZiKhm65nowgQxOpW
	 x4Ad8FcWsWOENcqk1z+MjbhiAtyWHiRMfrOSmn5uB3cR6tQdEMoYpeKuxtlhlf0X3U
	 CSSoXUZ+PVE2hak1A3JGBbzbgApp8sDBtOMb5RwUxWkQGsWqbbgESTLZY3NusUKOiG
	 4dweR8lPUjGYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: ti,dm816-fapll-clock: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com>
References: <20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:36:34 +0000
Message-Id: <20260722153634.7ED6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver dynamically allocates the clock array with insufficient=
 memory due to a precedence error, and then writes to it using device tree =
values without bounds checking, causing an out-of-bounds write.
--

--- Patch [1]: [PATCH v2] dt-bindings: clock: ti,dm816-fapll-clock: Convert=
 to DT schema ---
commit 4a9a2c7ea2387cee445b6eafff965419433f7d8c
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Convert the Texas Instruments DM816 FAPLL clock binding from plain text
to YAML DT schema. The schema now strictly enforces the clock cells size,
and adds indices and output names as required properties.

Link: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@g=
mail.com

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.=
yaml
> new file mode 100644
> index 0000000000000..423b7405e398e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
> @@ -0,0 +1,71 @@
[ ... ]
> +  clock-indices:
> +    description:
> +      Maps child synthesizers to physical indices 1-7. Index 0 is physic=
ally
> +      reserved for the Master PLL.
> +    minItems: 1
> +    maxItems: 7
> +    items:
> +      minimum: 1
> +      maximum: 7

[Severity: High]
This is a pre-existing issue, but since we're formalizing the clock-indices
constraints here, does the driver safely handle these index values?

Looking at drivers/clk/ti/fapll.c:ti_fapll_setup(), it allocates the clock
array without parentheses around the addition, resulting in an undersized
buffer:

	fd->outputs.clks =3D kzalloc(sizeof(struct clk *) *
				   MAX_FAPLL_OUTPUTS + 1,
				   GFP_KERNEL);

Then it reads the clock-indices property from the device tree and uses it
as an array index without bounds checking:

		fd->outputs.clks[output_instance] =3D synth_clk;

Since MAX_FAPLL_OUTPUTS is 7, the allocation on a 32-bit architecture
requests 29 bytes (4 * 7 + 1) instead of the intended 32 bytes (4 * (7 + 1)=
).

When the valid index 7 is used from the device tree, does this write past
the end of the requested allocation? Furthermore, could a malformed device
tree providing an index greater than 7 cause memory corruption beyond the
slab boundary?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ti-fapll-c=
lock-v2-1-085054acf2dc@gmail.com?part=3D1
