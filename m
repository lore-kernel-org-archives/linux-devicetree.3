Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D7376A1A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021489; cv=none; b=jbqzRvKMfeRgONGrMsGL3zql/1UVJy1sI53rj0Y9X4e61pG4dptiZqecbfqkT4gEtnWsq2R6iHOvOZVaODfX5eL0gglAqNIuns9HbADIAtQOHoKz92TCIp0eQww2i/8rtXxySCMGdPOErxbkaWoFJVpgIRDaJ6J6sNd2H5f14Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021489; c=relaxed/simple;
	bh=Zh4tZILBc1ovxrVIV5Ogn5kLTaLpQg32HFp4vl0pwtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJHxdh6x9pXHxTr288kz6+4uc6Ez6A6ATUjJ4bugJo2pmgtaR8+mDSfdB/xX7DBTXI+07LB4pAVRw3cwsTQyNV3+Nom35k56hMcGY/+VCJCONs9IOsB33PrwBBxbgZ0sNeAPEgbi72L55vx8oZpJyLqXCUgXfe/ydLDCCodtS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YVdrTsrO; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YVdrTsrO"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4863ee8474eso4212837b6e.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021486; x=1781626286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HlQ989brn3MExG2Qj74W9OMh5uKitJhUftFaI7Xo3g=;
        b=YVdrTsrO+0xpoN7TSfHgibH7WFRM9LaH2GO5qCHZ1WtVFhDmM30ILaChdiIu/Bcpod
         uO/6yjT3CkU20f6uYF/0oKxGZ7mWMjPwvRlEnLrT6z4t1oRl4UPvcgcBp73y8sErQKjz
         iyUFO0eW8d3l4IlJXEZmkvjn49whKw7H/fGZ5HE+ua6iiQ/dE7VkXQI+ba4wdonUei7I
         eZQNtfIOC2fI375ecrc7xvONz23lCIhDYJ4qQUVPVkxnTxARVJGDl11lLvDq5fTlIiwc
         Rm1+wjCgUGwznxHI8xWKZ/vviKYWH4KtyJ8K08JaMWfQNlHE63j4ALnMQYLFwlu39YPe
         dXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021486; x=1781626286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HlQ989brn3MExG2Qj74W9OMh5uKitJhUftFaI7Xo3g=;
        b=ZcFRkKAHKftuJ2A31k3ZOjJhiv6XthJsn6OHKZ76RKyZ1Drg7jL1yYo22yFuPm9I28
         qGdERwX9Z+d9VsWjmFvJlpJ93QREzmGxNFTIqmCz9F3II1xSHLB08lVIciHXCdcK1ujh
         8x/JBtUPwyNljUy+d9/i39o9oR4LSvGy3kzeZjR0csSpWg1+kQunr9LinNjElsBjhwaI
         cXJnPvFVljJWaA/jglxQGyb6qrTzQXfRhoRria6v/2BFulsaQXM+vmR9B3ofCiNSwOW1
         Z847LawF1/q/PL9/XqMKQXjiRcIAAlJNp0o/OMzDYYYT9yWHQ1Lo8o1tfag380JT0/J2
         IroA==
X-Forwarded-Encrypted: i=1; AFNElJ8mnr67Lz8/aV8hJHAiM5kz8Z8dQW5LkNu4yXW9OHaEZkGeogGRM52TnJ1jlMFiT5jS0m7NZ9XS2Jbg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/q+wyBdkSTqXVaMOHJJtp91NEFG1dJ/xSQx4n9paDkqW7j8Gz
	fLx5vjFdPD4sVlR+W13CTnkoshpNvATSS94DafkGG9ztW+946fqk0DFxh+1IyPz0yvw=
X-Gm-Gg: Acq92OEUng3knrqAZOgU0aaJbQxLa8n8+WwgMqJBpIEVgQZDUCK+nykNL9ASCrkBDaN
	HCsx4LX28HrzFe8RGpClE0RBO7HRlu/MI/R/bsJ2ezuvFmAQSomqcLunuQkITJnAGXBXdR22PQe
	chsXiYoJgsBNM8DdDXDdxHcsSkv0U2MbqFLKXfmVFmo8ZyVsOw0KVvu4CVa7X/Ub5Zg3mPmV/WJ
	gv9PWzICl6welGz4KNm3GvSpVzrT28wSZlKEl2VM3wUsNsuLaklucA+T93JwJD0YmQ6VLlPx6BR
	i/n4R0GiaZcd9bcCwc1k6KCgGNofgJPrZp+1R/G0jtM0sQKuM2q9gJDF8c4OKCCPJmox9FL+fBv
	pEmGoWxQeVWuBZ99BEQ9jHOUisZ03PD/VNcSEBDaVfuDt3EMfc6geUUUrXJxi9/WHXSIvgxnFvP
	ctMtcBWNZNO98gQQL1+H58uXc0coGE1nAn4w==
X-Received: by 2002:a05:6808:6f8f:b0:485:15bd:60eb with SMTP id 5614622812f47-4868dfa217cmr11963899b6e.39.1781021486466;
        Tue, 09 Jun 2026 09:11:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:25 -0700 (PDT)
Message-ID: <2dec4fe6-30d8-4949-bdc1-e32508340b87@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:24 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-6-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260517014841.254085-6-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 8:48 PM, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> DesignWare PCIe IP with extra link and reset control. Unlike
> the PCIe controller on K1, this controller supports external MSI
> interrupt controller and can use multiple PHYs at the same time.
> 
> Add driver to support PCIe controller on Spacemit K3 PCIe.

It seems like you're creating a lot of new code for K3.  In
some cases it's very similar to K1, and it's not clear why it
needs to be different.

I'd much rather see a patch that prepares for K3 support by
doing minor refactoring of the existing code to support K1
in a way that will make adding K3 support more natural.
Then a patch to enable K3 should be simpler (and can focus
on what is truly different).

> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/Kconfig            |   4 +-
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 169 ++++++++++++++++++
>   2 files changed, 171 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index f2fde13107f2..fae971ecd876 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -439,7 +439,7 @@ config PCIE_SOPHGO_DW
>   	  Sophgo SoCs.
>   
>   config PCIE_SPACEMIT_K1
> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> +	tristate "SpacemiT K1/K3 PCIe controller (host mode)"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on HAS_IOMEM
>   	select PCIE_DW_HOST
> @@ -447,7 +447,7 @@ config PCIE_SPACEMIT_K1
>   	default ARCH_SPACEMIT
>   	help
>   	  Enables support for the DesignWare based PCIe controller in
> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> +	  the SpacemiT K1/K3 SoC operating in host mode. Three controllers
>   	  are available on the K1 SoC; the first of these shares a PHY
>   	  with a USB 3.0 host controller (one or the other can be used).
>   
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 7f6f1df31cd8..7854d26220a9 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -23,6 +23,7 @@
>   
>   #define PCI_VENDOR_ID_SPACEMIT		0x201f
>   #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
>   
>   /* Offsets and field definitions for link management registers */
>   #define K1_PHY_AHB_IRQ_EN			0x0000
> @@ -32,8 +33,20 @@
>   #define SMLH_LINK_UP			BIT(1)
>   #define RDLH_LINK_UP			BIT(12)
>   
> +#define INTR_STATUS				0x0010
> +
>   #define INTR_ENABLE				0x0014
>   #define MSI_CTRL_INT			BIT(11)
> +#define RDLH_LINK_UP_INT		BIT(20)
> +
> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008

Can you add INTX support for K1 as well (perhaps in a separate
patch)?

> +#define K3_ADDR_INTR_STATUS1			0x0018
> +
> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> +
> +#define K3_MAX_PHY_NUMBER		6

You used "count" in patch 2 as the field name.

>   
>   /* Some controls require APMU regmap access */
>   #define SYSCON_APMU			"spacemit,apmu"
> @@ -48,6 +61,9 @@
>   
>   #define PCIE_CONTROL_LOGIC			0x0004
>   #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_PERSTN_OE			BIT(24)
> +#define PCIE_PERSTN_OUT			BIT(25)
> +#define PCIE_IGNORE_PERSTN		BIT(31)
>   
>   struct k1_pcie {
>   	struct dw_pcie pci;
> @@ -262,6 +278,152 @@ static const struct dw_pcie_ops k1_pcie_ops = {
>   	.stop_link	= k1_pcie_stop_link,
>   };
>   
> +static int k3_pcie_enable_phy(struct k1_pcie *pcie)

Can you just make K1's single PHY be a special case of
having "N" PHYs?  I.e., just set the phy_count for
K1 to be 1, so this loop would work for both K1 and K3?

> +{
> +	int i, ret;
> +
> +	for (i = 0; i < pcie->phy_count; i++) {
> +		ret = phy_init(pcie->phy[i]);
> +		if (ret)
> +			goto err_phy;
> +	}
> +
> +	return 0;
> +
> +err_phy:
> +	while (--i >= 0)
> +		phy_exit(pcie->phy[i]);
> +
> +	return ret;
> +}
> +
> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);

Should the above be done for K1?  Would it hurt?  Handle
both K1 and K3 the same way if possible.

The next two things are identical to k1_pcie_init().  Make
the code common if possible, so it's very obvious what
really needs to be different between the two.

> +
> +	k1_pcie_toggle_soft_reset(k1);

The "k1" prefix is fine for now, but if this driver gets
used for more devices in the future, it might be worth
renaming things to emphasize that it's not K1-specific.

> +	ret = k1_pcie_enable_resources(k1);
> +	if (ret)
> +		return ret;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +

You enable the PHY here much earlier than what's done in
the K1 code.  Should the K1 PHY be enabled earlier?
Also, I don't really think there needs to be separate
versions of the code that enables PHYs for K1 and K3.

> +	ret = k3_pcie_enable_phy(k1);
> +	if (ret) {
> +		k1_pcie_disable_resources(k1);
> +		return ret;
> +	}
> +
> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> +	usleep_range(1000, 2000);
> +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	/*
> +	 * Put the controller in root complex mode, and indicate that
> +	 * Vaux (3.3v) is present.
> +	 */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> +
> +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +	val = u32_replace_bits(val, GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE,
> +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> +

The following block of code (roughly) is done right after
enabling resources in the K1 version of this function.

Maybe the order you do it is better, but in that case,
change the (existing, and soon, common) code to do it
however is best if that's the case.

You should try to factor out the common parts and minimize
what's actually different between the two.

I would also expect that the device ID would be stored in the
platform data rather than having both init functions hard-code
the value here.

I'm going to leave it at that for now.

					-Alex

> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +}
> +
> +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u32 val;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> +	val |= u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> +				K3_CACHE_MSTR_AWCACHE_MODE);
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> +	.init		= k3_pcie_init,
> +	.deinit		= k1_pcie_deinit,
> +	.msi_init	= k3_pcie_msi_host_init,
> +};
> +
> +static const struct dw_pcie_ops k3_pcie_ops = {
> +	.link_up	= k1_pcie_link_up,
> +	.start_link	= k1_pcie_start_link,
> +	.stop_link	= k1_pcie_stop_link,
> +};
> +
> +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> +				     u32 *status0, u32 *status1, u32 *status2)
> +{
> +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> +}
> +
> +static int k3_pcie_parse_port(struct k1_pcie *k1)
> +{
> +	struct device *dev = k1->pci.dev;
> +	u32 status0, status1, status2;
> +	int i;
> +
> +	k1->phy = devm_kmalloc_array(dev, K3_MAX_PHY_NUMBER, sizeof(*k1->phy),
> +				     GFP_KERNEL);
> +	if (!k1->phy)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < K3_MAX_PHY_NUMBER; i++) {
> +		k1->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
> +		if (IS_ERR(k1->phy[i])) {
> +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
> +				break;
> +
> +			return PTR_ERR(k1->phy[i]);
> +		}
> +	}
> +
> +	k1->phy_count = i;
> +	if (k1->phy_count == 0)
> +		return -EINVAL;
> +
> +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> +
> +	return 0;
> +}
> +
>   static int k1_pcie_parse_port(struct k1_pcie *k1)
>   {
>   	struct device *dev = k1->pci.dev;
> @@ -363,8 +525,15 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.parse_port	= k1_pcie_parse_port,
>   };
>   
> +static const struct k1_pcie_device_data k3_pcie_device_data = {
> +	.host_ops	= &k3_pcie_host_ops,
> +	.ops		= &k3_pcie_ops,
> +	.parse_port	= k3_pcie_parse_port,
> +};
> +
>   static const struct of_device_id k1_pcie_of_match_table[] = {
>   	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
>   	{ }
>   };
>   

