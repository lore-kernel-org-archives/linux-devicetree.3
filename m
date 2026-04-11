Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3126F29B;
	Sat, 11 Apr 2026 02:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875394; cv=none; b=kbp/YwRf2nNDD49xaKYAGrdn3rsbq5NGPNfW9zQ4pnFs8OqYfomc+dWzOKDVFnS0TTpHrWEw4zyDVCQCbFsK9CU+mVbh8kxeaFQkqVfNFnL0f7QcAjpwDoACwXbLqu8RnWP49p4R19THiQ9IGYMELl9iRCmlH9iWN1LLDr8o63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875394; c=relaxed/simple;
	bh=rFnFZ8mxvlLOdoiIhppRJZkUc10QNlUxrrmvpYn9klA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB4RZNaNQXHQTjBq7Qz0bomoLXg/KPxF/BcrVAROU2JwcsycLlX858k9NauM16xkzc+XTP+g9XDGclKkUOVATPutkRisJ4nXVXNPJtg+aEs4PggE2CQppqNJZ3YEIV+af8yjSsk5o8rKQ++iHlwWJAPXVdKt+I+c2f04f0U6+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVGB964u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVGB964u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B4AC19421;
	Sat, 11 Apr 2026 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775875393;
	bh=rFnFZ8mxvlLOdoiIhppRJZkUc10QNlUxrrmvpYn9klA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVGB964uHnFgKqch7Jz9DZ5jGJuZD3zqKUhVwcp3cPO/uRA4obDEmXNHgbR7qKcII
	 WDoLhTD6+DOGe35kMHvubixdQxu3MkvBMJ9aOcrDdHTfhJKeG2QZeikLJhjxaFDK2q
	 aQdLTSqKpoPBydeTZFJrKXk2lF5stL6fV6NXZCLX8XHOeldD2i1ZMG1qOKF/j4fMYN
	 KtlE9gKwnq2E3bRYB2eIdvq4JxNNzjRsQmaZwSM24CWVuowddi3Ao/I+hsqCfHn6RH
	 4sjv3Xo/V5wJ19zTRyFvI3Ei+MH10pc/K8HKg7/eecUj4bMFchXJl/0hMl28A4qZu2
	 nckcGPxmTHUNQ==
Date: Fri, 10 Apr 2026 21:43:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <adm0X2ybeG5McXVv@baldur>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>

On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> Now that the two enable paths are separate functions, replace the
> pdc_version global with a __pdc_enable_intr function pointer. The
> pointer is assigned once at probe time based on the version register,
> moving the version comparison out of the interrupt enable/disable hot
> path entirely.

That's what the patch does, but why?

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 21e2b4b884ee..734576cdce0c 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -51,7 +51,7 @@ static void __iomem *pdc_base;
>  static void __iomem *pdc_prev_base;
>  static struct pdc_pin_region *pdc_region;
>  static int pdc_region_cnt;
> -static unsigned int pdc_version;
> +static void (*__pdc_enable_intr)(int pin_out, bool on);
>  static bool pdc_x1e_quirk;
>  
>  static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
> @@ -123,14 +123,6 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
>  	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
>  }
>  
> -static void __pdc_enable_intr(int pin_out, bool on)
> -{
> -	if (pdc_version < PDC_VERSION_3_2)
> -		pdc_enable_intr_bank(pin_out, on);
> -	else
> -		pdc_enable_intr_cfg(pin_out, on);

This style is comfortable to read.

> -}
> -
>  static void pdc_enable_intr(struct irq_data *d, bool on)
>  {
>  	unsigned long flags;
> @@ -400,7 +392,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		goto fail;
>  	}
>  
> -	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
> +	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
> +			pdc_enable_intr_bank : pdc_enable_intr_cfg;

This style is a mess.

Regards,
Bjorn

>  
>  	parent_domain = irq_find_host(parent);
>  	if (!parent_domain) {
> -- 
> 2.53.0
> 
