Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175159;
	b=xV8F8euw93dqfBmEjOTb+vWqzoQ3Krn95UwtchJ2DuYDO8ynLJJkC5Jf4v2Tx0BDPjOo
	 fi32yXDLtkl58PYEAWmCCPbld7NirDiwtsiDH8kc8BP5ZI1fS6j0L8KHIyejq1MHowchr
	 2/diA1kVch56AUDDWc9kT0NZNB7h+gMgDbbpcmQGUO8HQ/KVS7jopmyvYlLNG7E7c/8yU
	 iRJzonCT615iruqn6a1l3EeM+AG42eMlG9Ec4/Z0+AP2ZM/zXB5ZYEIceuAbN3GFmYHOO
	 U1v1zzWpKUM8FqJT/l8Vz+j1fLyQFjjewn7weWt4IZaCM4SAhZgZ1Pq8T7aHIcBgMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175159;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=b53VQhGDB3fDyxFM+t+5Xty44SLQn1Any6AH//jkRcI=;
	b=B8EWfyfh1QSs/hygCKerdwmiAP042amKQzgPjxKjZzrx3+CnHjKkC5GUdS/qLMx1mIiO
	 IloxDEe/SYryHYIKT52t6ptpsTwupMKMrvJhjKCrPc9fcVv78ymrtTxQnKLBmCpUm6m6N
	 4OKU0lqqorNybXzMjFnkk5ngm86CVbFvTermQKHNc9AqdhUUbHMvunokn3YGpzSicMGyN
	 6oKg5IAOafWoolczrlSb3P+L2WytUNOKfNCPHdvYnjs7To/flwCn0l7mYUihuv3tPRSnU
	 ydu5AmMkQVDU1k50Swz/mU32PnvV4xKj/GKzufyOc5swgkKlsV6Oy7+QiMuURuRa7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aj62RK6g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01998606AA4A;
	Fri, 20 Nov 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aj62RK6g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A5D1F000CA;
	Fri, 20 Nov 2026 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175158;
	bh=b53VQhGDB3fDyxFM+t+5Xty44SLQn1Any6AH//jkRcI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aj62RK6gzP2wZfFruZbamBHtiWRCditBicdkfNhpbm+A2wedP1Njr13YYqWSrSA5p
	 Hr02HrwrYg5k+jD15UNYAdyrmdXx99C0jd99Eq5hRYbgZECjKxVfaRUGN+tXdCapsd
	 J8Ostcqp9K+dXfK4N3vdx1lXf4B9nE6gQHzmnO/YuwL3Ot5RiP8tE5SxF3h7m6aYbL
	 vuo63bDksU+WTsKzoNDEs9D6ReAlV3d/eb+GWokJdi1ZftbT9bh4h0TlU18C4dXsGp
	 B94sTNV972RPH9IdC7uoiYwk2QDbHG32HflidfQFWXex5wmL3ht8Ocuaf6ckB+RFwm
	 YGH3JcGwsIppg==
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 20 Nov 2026 11:45:56 +0000
Message-ID: <179517515650.3136.1478544566840893554@kernel.org>
In-Reply-To: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says the if/else block constrains Shikra
  "while leaving existing compatibles unchanged", but the schema now…
- [Low] The Shikra `then:` block (lines 116-130 of qcom,ethqos.yaml)
  requires exactly six clocks ending in `axi-noc`, `pcie-tile-axi-noc`…
- [Low] For Shikra, the `then:` branch of qcom,ethqos.yaml fixes clock
  index 3 to `const: rgmii` (line 125).

--

dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible

This adds a qcom,shikra-ethqos compatible to the qcom,ethqos and
snps,dwmac bindings. Shikra's EMAC needs two extra NOC clocks (axi-noc,
pcie-tile-axi-noc) and an OPP table to vote VDD_CX. An if/else block
limits Shikra to six clocks and requires operating-points-v2 and
power-domains.

> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index ef520f8105773..6bd4bded650a4 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml

[ ... ]

> @@ -81,6 +83,14 @@ properties:
>        - const: cpu-mac
>        - const: mac-mem
>  
> +  operating-points-v2:
> +    description: |
> +      For Shikra, the OPP table specifies the rates for the NOC access
> +      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
> +
> +  opp-table:
> +    type: object
> +

[Severity: Low]
The commit message says the if/else block constrains Shikra "while
leaving existing compatibles unchanged". Is that true for these two
properties?

operating-points-v2 and opp-table are added to the top-level properties
without any compatible gating. The else branch further down only narrows
clocks and clock-names.

At the baseline, neither snps,dwmac.yaml nor any other binding under
bindings/net/ defined these properties, and this file ends with
unevaluatedProperties: false. An OPP table on a qcs404, qcs615, sa8775p,
qcs8300, sc8280xp or sm8150 ethqos node used to fail dtbs_check. With
this patch it passes.

The property description says it applies to Shikra. Later in the series,
the driver reads the OPP table only when num_noc_clks is set, which is
only the case for shikra_data.

Could the else branch add operating-points-v2: false and opp-table:
false? Or should the commit message be adjusted?

[ ... ]

> @@ -95,6 +105,42 @@ required:
>    - clock-names
>    - reg-names
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-ethqos
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - const: rgmii

[Severity: Low]
Does fixing the fourth clock to rgmii mean SGMII/serdes boards can't be
described on Shikra?

The top-level schema still allows phys and phy-names = serdes for
Shikra, but phyaux is rejected here.

The Shikra GCC exposes PHY AUX and SGMIIPHY RX/TX clocks for both EMACs:

drivers/clk/qcom/gcc-shikra.c:gcc_shikra_clocks[] {
    ...
	[GCC_EMAC0_PHY_AUX_CLK] = &gcc_emac0_phy_aux_clk.clkr,
    ...
}

The SGMII-capable ethqos SoCs (sa8775p and qcs8300, with link_clk_name =
"phyaux" in emac_v4_0_0_data) use these clocks for the serdes path.

On a Shikra board wired for SGMII through the serdes, a phyaux link
clock would fail dtbs_check. ethqos_hlos_setup() would also fetch
"rgmii", because shikra_data sets no link_clk_name:

	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");

If SGMII is intentionally unsupported on Shikra, could the commit
message say so? If not, should this be an enum of rgmii and phyaux, as
it is for the other compatibles? Bindings are expected to describe the
hardware even where the driver lacks support.

> +            - const: axi-noc
> +            - const: pcie-tile-axi-noc

[Severity: Low]
Does every Shikra EMAC instance really need pcie-tile-axi-noc?

This then block requires all six clocks on every qcom,shikra-ethqos node
and does not distinguish the two EMAC instances.

In gcc-shikra.c, gcc_pcie_tile_axi_sys_noc_clk has gcc_emac0_axi_clk_src
as its only parent, with CLK_SET_RATE_PARENT:

	.name = "gcc_pcie_tile_axi_sys_noc_clk",
	.parent_hws = (const struct clk_hw*[]) {
		&gcc_emac0_axi_clk_src.clkr.hw,
	},
	.num_parents = 1,
	.flags = CLK_SET_RATE_PARENT,

EMAC1's own clocks, gcc_emac1_axi_clk and gcc_emac1_axi_sys_noc_clk, come
from a separate RCG, gcc_emac1_axi_clk_src.

To pass the schema, an EMAC1 node therefore has to reference a clock in
EMAC0's tree. Later in the series, qcom_ethqos_set_opp() calls
dev_pm_opp_set_opp() for EMAC1, and dev_pm_opp_config_clks_simple()
calls clk_set_rate() on that clock. The rate would propagate to EMAC0's
AXI RCG, and EMAC1 would keep that RCG enabled.

If EMAC1 has no PCIe-tile NOC path in hardware, should it be allowed
five clocks? If it does have one, could the commit message mention it?
This series adds no Shikra ethernet node to shikra.dtsi, so the intended
EMAC1 wiring can't be checked.

> +      required:
> +        - operating-points-v2
> +        - power-domains

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-shikra_ethernet-v4-0-c41902e5f2fa%40oss.qualcomm.com
