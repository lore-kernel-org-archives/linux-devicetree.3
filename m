Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B4B4756D2;
	Wed, 12 Aug 2026 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546866; cv=none; b=jRUgyUPY1vdTERM+mYyA+UJZ6lBETwwKpIvPqYJA8vp3D7o/cU7h88/oboa2SsAR2SB5tUPYXwDzC7gS7fFvpA/SO9U3m0fycX8HsGk91/+5Z3WUCWUOWCiHZUAlQyVNRFowb6gCt43vpfvCoDVjgc+BTvWgkcAMqjLL7puaNKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546866; c=relaxed/simple;
	bh=AxKGRUJxp6IeR0jh+nEibWO0SiL8j3R2TF285pIpL08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzxQJp6uz8RP1p2FOD5CcJv3bV94p5RLAbLYQdu2tstz+2j2LL5pt/fMY986p0yYTH8Celkw2Vy7k+mjSeQvfd3OIRaNpEBI3mFOZ5r8NK1ZqO805ChEy6sPS3JCKd+yezvM3qVN9c8OXzNYy8ivQRB6O8wNfUt3e3dXW/e/2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwyLQbOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwyLQbOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915971F000E9;
	Wed, 12 Aug 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786546857;
	bh=qEmdOhtDWcb1TCaplFzUZkg70h2Ka5Q5DhBQCAHTGXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WwyLQbOplCXdjppgZrYcR0QZ67LgWQQoZ0hqx12TUlW4mO+3ib8fPnfAo//yLyMZy
	 qg3Y1SlPUere+f/UhfIFnFQ1N95xPmdb68hHGsJTQEcJo6hysGG/Ty3LrB9ahHY90V
	 joVgbaQ17Ott92zog2TIcO/PI/W5ynBE5c1D3SytAyu9ZbepV3KVJ9Oa7nFTKe5OJo
	 tGQTM1AdjclpNU2M/EoUxQ5S/HBDF3uQkbT1IoIvYA9a7/ZgsMq0L8Xjh4n6UKFJ8L
	 jNx1sLZ4/z7vXI2VW1R6d9y+tGM84pwn5GBnYBFghVd6TjUkeHemOA7Py57tyoNCW3
	 8vrnhM7r3jy5A==
Date: Wed, 12 Aug 2026 17:00:49 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v6 4/6] phy: realtek: usb2: introduce reset controller
 struct
Message-ID: <lbnpxp2a5g7agbtmrrxbkfeuqocurtco4n4jfcs4mqkiqsiu3w@vnf7e6weumv3>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-5-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520175728.720877-5-adilov@disroot.org>

On Wed, May 20, 2026 at 10:57:26PM +0500, Rustam Adilov wrote:
> In RTL9607C, there is so called "IP Enable Controller" which resemble
> reset controller with reset lines and is used for various things like
> USB, PCIE, GMAC and such.
> 
> Introduce the reset_control struct to this driver to handle deasserting
> usb2 phy reset line.
> 
> Make use of the function devm_reset_control_array_get_optional_exclusive()
> function to get the reset controller and since existing RTD SoCs don't
> specify the resets we can have a cleaner code.
> 
> Since the vendor usb driver developed by Realtek doesn't assert the reset
> line (or in their case clear the register bit), we can reasonably assume
> reset_control_assert is not needed here.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index a9e29d2f7e6f..16c5fc3191de 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -17,6 +17,7 @@
>  #include <linux/sys_soc.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> +#include <linux/reset.h>
>  #include <linux/usb.h>
>  
>  /* GUSB2PHYACCn register */
> @@ -130,6 +131,7 @@ struct rtk_phy {
>  	struct phy_cfg *phy_cfg;
>  	int num_phy;
>  	struct phy_parameter *phy_parameter;
> +	struct reset_control *phy_rst;
>  
>  	struct dentry *debug_dir;
>  };
> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>  	if (!rtk_phy)
>  		return -EINVAL;
>  
> +	if (rtk_phy->phy_rst) {
> +		ret = reset_control_deassert(rtk_phy->phy_rst);
> +
> +		if (ret)
> +			return ret;
> +
> +		usleep_range(5000, 6000);
> +	}
> +
>  	for (i = 0; i < rtk_phy->num_phy; i++)
>  		ret = do_rtk_phy_init(rtk_phy, i);
>  
> @@ -1059,6 +1070,11 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
>  
>  	rtk_phy->num_phy = phy_cfg->num_phy;
>  
> +	rtk_phy->phy_rst = devm_reset_control_array_get_optional_exclusive(dev);

Why do you need to use devm_reset_control_array*() for a single reset line?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
