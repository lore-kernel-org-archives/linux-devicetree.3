Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DA472789;
	Wed,  1 Apr 2026 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054467; cv=none; b=Zqzofm7sk5PbCKa9A2yPvTIrsYcw9lPqqLMd6sKX0Yk97qI3dD+yDXZ74hBvFNymrDysvTIpAbssW2LRujDmBiZpvQsRC1kt9NDIlzzycJDmmMT2zds5TgZzQy357EMg1Y0gwbiJoyBO13RXgRNjEA4svYuv/3unJpyHTR1Edao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054467; c=relaxed/simple;
	bh=TgjfJ9DwxAIF8WY3udzvv+dr98Azs03jjfDQs703n+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0T3m5XaO7qQkUcuHKT3iGMU2uE50NdZ0XyC5xsyOQF4sfuQA9uYmUjEUl8ZAZeC7069lEtwUN4/VvWopa0f6nhu/QP6jdWkG8RG3aEt/knNWDZhthUqNzWz7+Mpuqhso7f/yq/OC8mXPfT2r5J7bIPAf1TR/0VFRggUWKOPaKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsX83Rib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsX83Rib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6581AC19423;
	Wed,  1 Apr 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054467;
	bh=TgjfJ9DwxAIF8WY3udzvv+dr98Azs03jjfDQs703n+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsX83Ribv38zaI3V2htPkFLab4N/Sjjucxt8ccy274mnMKq9dKvywOvb2Hs1SROrW
	 xL3+P+Gyw2Q2qA5JzyhaEhCm6p+VIjVNqXAdOsRCjS5/IvDQ71PdMZGtNvNctnmyU1
	 OKTeGIUehPf4V2S8bdo7aHepS9EfD36cBofs75fVJdywXXGFuPf74qJ6GWz+Ui3vQK
	 UyMYELBU70577ZABGHU19vg69mFNjeN4gk30F1Lh1qD8wLqJ0AzpzrR/v+404ncu1v
	 zeHzj0oFEsxAf6bdb+SgPAEyUuryvSD61jULa1p6Syew/83lfILSLrOGdPzhwpB1VD
	 GN3G2ZlHxlBZw==
Date: Wed, 1 Apr 2026 09:41:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <ac0ubhTTsUNKHD__@baldur>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
 <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
 <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>

On Tue, Mar 31, 2026 at 02:59:12AM -0700, Qiang Yu wrote:
> On Tue, Mar 24, 2026 at 11:23:19PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> > > The third PCIe controller on Glymur SoC supports 8-lane operation via
> > > bifurcation of two PHYs (each requires separate power domian, resets and
> > > aux clk).
> > > 
> > > Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> > > clock ("phy_b_aux") required for 8-lane operation. Introduce new
> > > glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
> > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> > >  	.phy_status		= PHYSTATUS_4_20,
> > >  };
> > >  
> > > +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> > > +	.lanes = 8,
> > > +
> > > +	.offsets		= &qmp_pcie_offsets_v8_50,
> > > +
> > > +	.reset_list		= glymur_pciephy_reset_l,
> > > +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> > > +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> > > +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> > 
> > Just for my understanding. If it was not the NOCSR case and had to
> > program the registers, would we have needed to program anything in the
> > PCIe3B space?
> 
> The PCIe3B PHY registers need to be programmed.

Why?

Regards,
Bjorn

> But we don't need to do it explicitly because there are also broadcast
> registers: writing to these registers will automatically write the same
> offset and value to both PHY ports simultaneously.
> 
> - Qiang Yu
> > 
> > > +	.vreg_list		= qmp_phy_vreg_l,
> > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > +
> > > +	.regs			= pciephy_v8_50_regs_layout,
> > > +
> > > +	.phy_status		= PHYSTATUS_4_20,
> > > +};
> > > +
> > >  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> > >  {
> > >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > >  	}, {
> > >  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> > >  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> > > +	}, {
> > > +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> > > +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
> > >  	}, {
> > >  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
> > >  		.data = &ipq6018_pciephy_cfg,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
