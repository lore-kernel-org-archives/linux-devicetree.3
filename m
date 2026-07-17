Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187054AEEF;
	Fri, 17 Jul 2026 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328350; cv=none; b=kR95sny2BcmOvahA5Te+XcZ4U94sWGmToM9gtAjnsygr2KI/aDm++WIqFp4z+3qma8qXOTgzjCFLd+vL0vTlkEzKttUu0aqa1BVge8RDzx9hNGX6cb8GrgTGhs3seigv7MYI4M3kJKhk+8hqTMFFlA4iybSdkf7PkxP6G+uHbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328350; c=relaxed/simple;
	bh=Tz++uzCsw8xcxPRcv5J2T/9qKz1LNiqcnf33gkfMG0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1rRkWTJhlvUFo9cIYl6X9OoeqdmFcNtI+isLl5YicSweTAM0xs4jfMcAfsMLEOggPPNpT70WHTkBmazpds3G9q29vE+6kYfYwHVRxoMleEnyriJkPtSUTqLvqkb6lACar7b8FelYKcYOMOJ4DbYPhWLCK8/+XOOuT1yvkM+b3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX0jkBMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX0jkBMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C341E1F000E9;
	Fri, 17 Jul 2026 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784328348;
	bh=VG5X/evnGewSUQI8ksLSJatC1f/4dR1Q9jG5R9N+XT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oX0jkBMPVnpHoYweyKmQ0j0ASNHIwfwVVdHWsON/eAM0/vAcsXtHOOeVx+2/RY1yH
	 0Cf19O3CS5ljFHuUnLdftCuY+/STXwuXgqpwiX3FOrC7Ef4+oqJ61gH+nfUs1q1bzK
	 FzSwR7W92oKUjKVAW50Acj+Pb3lr6sugHkv2UHf1O+ipP+FJVhBaCUbYCk65+JAyag
	 wPoUw7bBj1PwYqqfz0W33N4AhKzC8jdwgWn/vC5leJ6UrJZYUfMKSPG/sg1hSOsiQ6
	 4nro/RUA0aP7hFcmNN/kaYvvlbgjAG6pbUvYLnvgKtUFgIVjoaAbpNFlCy5WiwOtzI
	 vBsdPX5XSVI/A==
Date: Fri, 17 Jul 2026 17:45:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <alqrbpi3EbvV9RnC@baldur>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-2-4f9e87a61463@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur_linkmode_0717-v5-2-4f9e87a61463@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 02:58:34AM -0700, Qiang Yu wrote:
[..]
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 000000000000..b79edf2b7d5f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> @@ -0,0 +1,770 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.

No, there should not be a year in there.

> + */
> +
[..]
> +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int i, ret;
> +
> +	for (i = 0; i < cfg->num_pds; i++) {
> +		ret = pm_runtime_get_sync(qmp->pd_devs[i]);

In the error path you will put pd_devs[0..i-1], but
pm_runtime_get_sync() requires that you put pd_devs[i] as well.

Please use pm_runtime_resume_and_get() instead.

> +		if (ret < 0) {
> +			dev_err(qmp->dev, "failed to power on %s domain\n",
> +				cfg->pd_names[i]);
> +			goto err_power_off;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	while (--i >= 0)
> +		pm_runtime_put(qmp->pd_devs[i]);
> +
> +	return ret;
> +}

Regards,
Bjorn
