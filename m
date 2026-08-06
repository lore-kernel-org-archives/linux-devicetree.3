Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6847AF66;
	Thu,  6 Aug 2026 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030335; cv=none; b=YYVkaEY6zlsyMWjLSatAQqGepFQGKShbzNY0+OeoPs38OHJFBlC+dLBpnCUqPVrD0kfU3JsVkewgDpC0DbeBCzEeY63dRWgwNVv1cIcHODIkZcMGxlcUfRzCjRtMzRDzrYRuPn5wNjrmCGT+YcnwpDdFVM+S+DnNxUvUQIat068=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030335; c=relaxed/simple;
	bh=auYto+B9cYKZDXql4FWRJ7vRrBr+5unK57ePWQE13rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddUKkEnvbXhLn1o77gkseQB81ScV9MFZmTamZsxgTRe1XLFRTa34jwog84F23c3aGF/j0yXswaOSxwFlb89i09dOBXCHVYE3/c+VBiU5Bs4QaMZ76Q/fPJ1m8EFYNigIHOfl7KDdCYoajyUrJEM5BLrv8YZilSrrmU0N9QbZcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+fvyxBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+fvyxBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE2C1F00A3A;
	Thu,  6 Aug 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786030334;
	bh=AZSZPzON7ucEjZ9c+7oaRZh+ub6oqa+CVuEDyGespbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+fvyxByaDjz2DlM4029QCo37jD6N/G6amWNS0pnoEPmOWqb3BXt6p0mT8PEKCI2d
	 EBKROd/dJQ3b5U3eoKcId9a3UpAl85hA+ZvUpCCvTqLiNSGPV3vPvaeVt7QkWdmoum
	 A1IXr+VTkIlHZx0a11Jj7IYo519BaVJIZL9D1YWC4GzGtoDhE+UA48YP3OlU+xEnO+
	 NjeHwuNJf4BhJK5lQ0UpjmZzCtQQ5L4qBv3j3SCcIs6wURoBPLmHoO+Uhqf2p7Hh4D
	 z4cSsIv32MlfgfOAQ8zwzsLk+HGjfArNkQLPVQBQZHjdFND1320To+TmOqZDGNyzM/
	 al0c4GfCZmoOg==
Date: Thu, 6 Aug 2026 21:02:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <anSo-TRpqVm_T_Y1@vaman>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>

On 30-07-26, 22:13, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> x8 or x4+x4) selected via a TCSR register. The existing single-instance
> QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> DT node and instantiates exactly one PHY.
> 
> Add a dedicated driver for this class of PHY. Match data carries a
> per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> required by that link mode, registering the clock and #phy-cells = <1> phy
> providers so consumers can address individual sub-PHYs by index.
> 
> The driver inherits the phy setting and link-mode programmed by firmware,
> so only the no_csr reset is used and no phy setting tables are provided.
> 
> Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> operate as a single x8 link.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig                      |  11 +
>  drivers/phy/qualcomm/Makefile                     |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 744 ++++++++++++++++++++++
>  3 files changed, 756 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa..8d45820bc84a 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -77,6 +77,17 @@ config PHY_QCOM_QMP_PCIE
>  	  Enable this to support the QMP PCIe PHY transceiver that is used
>  	  with PCIe controllers on Qualcomm chips.
>  
> +config PHY_QCOM_QMP_PCIE_MULTIPHY
> +	tristate "Qualcomm QMP PCIe Multi PHY Driver"
> +	depends on PCI || COMPILE_TEST
> +	select GENERIC_PHY
> +	default PHY_QCOM_QMP

Can you please drop this. Let the respective config select it

> +
> +static struct clk_hw *qmp_pcie_multiphy_clk_hw_get(struct of_phandle_args *clkspec,
> +						    void *data)

please align this to preceding open braces. I think this might look
neater:
static struct clk_hw *
qmp_pcie_multiphy_clk_hw_get(struct of_phandle_args *clkspec, void *data)

> +{
> +	struct qmp_pcie_multiphy *qmp_data = data;
> +	unsigned int idx = 0;
> +
> +	if (clkspec->args_count)
> +		idx = clkspec->args[0];
> +
> +	if (idx < (unsigned int)qmp_data->num_pipe_outputs)
> +		return &qmp_data->pipe_out_clks[idx].hw;
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int qmp_pcie_multiphy_register_clocks(struct device *dev,
> +					      struct device_node *np,
> +					      struct qmp_pcie_multiphy *qmp_data)

please align these two to preceding open braces


> +static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
> +			      struct phy **out_phy)
> +{
> +	int ret;
> +
> +	ret = qmp_pcie_get_mmio(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_pcie_clk_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_pcie_reset_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_pcie_vreg_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_pcie_pd_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	*out_phy = devm_phy_create(qmp->dev, np, &qmp_pcie_phy_ops);
> +	if (IS_ERR(*out_phy))
> +		return PTR_ERR(*out_phy);
> +
> +	phy_set_drvdata(*out_phy, qmp);
> +
> +	return 0;
> +}
> +
> +

Two empty lines, please drop one

-- 
~Vinod
