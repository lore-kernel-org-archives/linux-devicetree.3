Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51646AF1B;
	Wed, 12 Aug 2026 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546511; cv=none; b=Wh6XTJKO9nGxM4YyjoaD//chutuFLZZmImXmTf/PMKgqZJ1etgcHAO7NwNleEaVW4wdHDi+Zg86f9ydoPG+Jj7jtIBluA3WgYwChQfkKzR1F+8/bCigI/LoJqX88dhqm6dNuIxWS8TAytibqzotOTFUcHO1N5nN8iq7SW8+SWqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546511; c=relaxed/simple;
	bh=VdX8Xgrj4692dfYRXKInSYl0TX+hjJKAbOsMS8Cl+5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKRcbb6NruOO0jJ82U3ZgrN/BA/AQ8wKmkt2QGd418uxg6zGFYa58us1glr513RfMFcoov7721p2HBV+7t6QjJeoaYbRju1BEKorHcVtLigYRIxC0kf8tpn7WOiuRdMTzkwUoYgqgll5kK+JtDZYArtXG+UEPXs/6CuW/Lgnk/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1BZuGIe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1BZuGIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4711F000E9;
	Wed, 12 Aug 2026 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786546500;
	bh=2ywoCp62rBpTHbJBtk9N7B4NyBna8o6Efm2iLdI5P1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1BZuGIekk+j+v16v0jIJTZmIA/hZZLOG6FQb0nMHNQL9gwtRdU8rzCvm8ZxuOgJR
	 pivnBSBdQ03dfT6vPd7jHLpcquO5M6uAtyahQBJwbzyfn9YVMf7v/mzcWpQyxzUmpX
	 E81m2fOYm+izZvt8ETivwk/lc9vX0jztlw4fOJLqp0xB1Z9zcNUuLygc9Zk0sPxMHs
	 KJB3VJeciOo90MVNni/9gMPZQTUYbPpUKu3x4tuPxLT02UTwfV9g5J32AcoY3eCZwR
	 GDDEM+j/bo1Z3d1MeqbGHgaA7oN0OiXLNfKHTliG0LQ3hcYoBPxq+1Dd3XwvML57qp
	 1PHFecbsMn5eQ==
Date: Wed, 12 Aug 2026 16:54:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v6 1/6] phy: realtek: usb2: introduce vstatus/new_reg_req
 variables to driver data
Message-ID: <kce2vypa2ueuodxguuubyflnmsbmak5gjnjtmbjr24p3wvo6ep@6jrbxalol5ty>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-2-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520175728.720877-2-adilov@disroot.org>

On Wed, May 20, 2026 at 10:57:23PM +0500, Rustam Adilov wrote:
> In RTL9607C SoC, the vstatus register is located at a certain offset from
> the base and so introduce the vstatus_offset to handle it.
> 
> Busy bit of the vstatus and new_reg_req bit are also different and so
> introduce these variables to the driver data as well.
> 
> Add these variables to the pre-existing phy cfg structs for RTD SoCs and
> assign them the default values.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 68 +++++++++++++++++++++++-------
>  1 file changed, 53 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index 248550ef98ca..bd9ee895b9f9 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -64,6 +64,9 @@ struct phy_reg {
>  	void __iomem *reg_wrap_vstatus;
>  	void __iomem *reg_gusb2phyacc0;
>  	int vstatus_index;
> +	int vstatus_offset;
> +	u32 vstatus_busy;
> +	u32 new_reg_req;
>  };
>  
>  struct phy_data {
> @@ -96,6 +99,9 @@ struct phy_cfg {
>  	bool do_toggle_driving;
>  	bool use_default_parameter;
>  	bool is_double_sensitivity_mode;
> +	int vstatus_offset;
> +	u32 vstatus_busy;
> +	u32 new_reg_req;

I don't like the fact the fields are getting duplicated in two structs. In the
next patch also, you are adding the duplicate read/write callbacks. So I'd
suggest coming up with a per-SoC const struct and passing that pointer in
'phy_cfg' through drvdata and copying it to 'phy_reg':

	struct phy_reg_desc {
		int vstatus_offset;
		...
	};

	static const struct phy_reg_desc phy_reg_desc_rtd1295 = {
		.vstatus_offset = 0,
		...
	};

	...

	struct phy_reg {
		...
		const struct phy_reg_desc *desc;
	};

	struct phy_cfg {
		...
		const struct phy_reg_desc *reg_desc;
	};

	...

	static const struct phy_cfg rtd1295_phy_cfg = {
		...
		.reg_desc = &phy_reg_desc_rtd1295,
	};

	...

	phy_parameter->phy_reg.desc = phy_cfg->reg_desc;

- Mani

-- 
மணிவண்ணன் சதாசிவம்
