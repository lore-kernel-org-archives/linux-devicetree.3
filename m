Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D91A3ED3A9;
	Tue, 19 May 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200847; cv=none; b=QY/sLCmnZdJ7TJ8eSpeKf0W83+nRzP4YQu5Y2XZswrmET1DErkiZWH1y5TJGniK2G10MnR0VwgYQ/KVrjNzOdXEYsSp/CirLSHQKdQ/rCXnvn3Jk7wBG2wGQPUgslRgFRCK/bWkn5IOZ6m9gzLlsVQABCMwl3spssKYgpEB2IuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200847; c=relaxed/simple;
	bh=CsyBFvXqGhh2VAsblhztuusrlYLD11BESexns8Cx6Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=prLOo5cwJoP7VMBR0cm1ITAFoBvDKf8MTekGCWDjW2NFThR1SEOr2mgbQ7snOgZxyEgYrUXBUgVptFeuzU/+8yVh83SAG7C69d9zopmTfhQ/9irWHl4bonUm+SfuHGmJW5xhWdx+UBxs97MThC/fpqzX2Dac9hYvub1i8nP5Gj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn2SfyEp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn2SfyEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957D7C2BCB8;
	Tue, 19 May 2026 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779200846;
	bh=CsyBFvXqGhh2VAsblhztuusrlYLD11BESexns8Cx6Q4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Rn2SfyEpYRQi8u+wqmOeRK107JDCqkmYYzIL2yizZU9TJ9DQ62Emt6dUbRxvIPKE1
	 bg8rl3xFsUo0EBXOtLxQKuTuhqNaXVpZVOLi2LNZxTKLY6BoxIM6G+x91z/Qy3wSip
	 2bq4mTJALbrTYnVmjDVXBcN1pZCkmo0CQ1yXcofoP5jwh4n8XkmFPCpJH008X1Nlx4
	 8I6+ESq6491ogZqHzAsX1If7nOGlUKtXkZslbRRNQFoUbt8vnxwSHHk+YVdanQm+3z
	 dXDAhXWRffDRqUlcKqYryp18c4wCVobyLPNfkuOh9qAfwXVuB3ftGm77JYPRptcfnw
	 vH/AOIhuzP/CA==
Message-ID: <245d49ac-7b9d-45b1-833d-437984716db5@kernel.org>
Date: Tue, 19 May 2026 15:27:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] nvmem: airoha: Add support for SMC eFUSE
To: Christian Marangi <ansuelsmth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260518142042.8331-1-ansuelsmth@gmail.com>
 <20260518142042.8331-3-ansuelsmth@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260518142042.8331-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 3:20 PM, Christian Marangi wrote:
> Add support for SMC eFUSE on AN7581 SoC. The SoC have 2 set of 2048 bits of
> eFUSE that are used to read calibration value for PCIe, Thermal, USB and
> other specific info of the SoC like revision and HW device present.
> 
> eFuse value are taken by sending SMC command. ATF is responsible of
> validaing the data and rejecting reading protected data (like Private
> Key). In such case the SMC command will return non-zero value on a0
> register.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/nvmem/Kconfig             |  13 ++++
>  drivers/nvmem/Makefile            |   2 +
>  drivers/nvmem/airoha-smc-efuses.c | 118 ++++++++++++++++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 drivers/nvmem/airoha-smc-efuses.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..95a399258538 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -28,6 +28,19 @@ source "drivers/nvmem/layouts/Kconfig"
>  
>  # Devices
>  
> +config NVMEM_AIROHA_SMC_EFUSES
> +	tristate "Airoha SMC eFuse support"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on HAVE_ARM_SMCCC
> +	default ARCH_AIROHA
> +	help
> +	  Say y here to enable support for reading eFuses on Airoha AN7581
> +	  SoCs. These are e.g. used to store factory programmed
> +	  calibration data required for the PCIe or the USB-C PHY or Thermal.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nvmem-airoha-smc-efuses.
> +
>  config NVMEM_AN8855_EFUSE
>  	tristate "Airoha AN8855 eFuse support"
>  	depends on COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 7252b8ec88d4..f6f2bc51dee1 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
>  obj-y				+= layouts/
>  
>  # Devices
> +obj-$(CONFIG_NVMEM_AIROHA_SMC_EFUSES)	+= nvmem-airoha-smc-efuses.o
> +nvmem-airoha-smc-efuses-y 		:= airoha-smc-efuses.o
>  obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
>  nvmem-an8855-efuse-y 			:= an8855-efuse.o
>  obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
> diff --git a/drivers/nvmem/airoha-smc-efuses.c b/drivers/nvmem/airoha-smc-efuses.c
> new file mode 100644
> index 000000000000..bb279d149519
> --- /dev/null
> +++ b/drivers/nvmem/airoha-smc-efuses.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Author: Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define AIROHA_SMC_EFUSE_FID		0x82000001
> +#define AIROHA_SMC_EFUSE_SUB_ID_READ	0x44414552
> +
> +#define AIROHA_EFUSE_CELLS		64
> +
> +struct airoha_efuse_bank_priv {
> +	u8 bank_index;
> +};
> +
> +static int airoha_efuse_read(void *context, unsigned int offset,
> +			     void *val, size_t bytes)
> +{
> +	struct regmap *regmap = context;
> +
> +	return regmap_bulk_read(regmap, offset,
> +				val, bytes / sizeof(u32));
> +}
> +
> +static int airoha_efuse_reg_read(void *context, unsigned int offset,
> +				 unsigned int *val)
> +{
> +	struct airoha_efuse_bank_priv *priv = context;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
> +			     AIROHA_SMC_EFUSE_SUB_ID_READ,
> +			     priv->bank_index, offset, 0, 0, 0, 0, &res);
> +
> +	/* check if SMC reported an error */
> +	if (res.a0)
> +		return -EIO;
> +
> +	*val = res.a1;
> +	return 0;
> +}
> +
> +static const struct regmap_config airoha_efuse_regmap_config = {
> +	.reg_read = airoha_efuse_reg_read,
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int airoha_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		struct nvmem_config airoha_nvmem_config = {
> +			.name = "airoha-efuse",
> +			.size = AIROHA_EFUSE_CELLS * sizeof(u32),
> +			.stride = sizeof(u32),
> +			.word_size = sizeof(u32),
> +			.reg_read = airoha_efuse_read,
> +		};
> +		struct airoha_efuse_bank_priv *priv;
> +		struct nvmem_device *nvmem;
> +		struct regmap *regmap;
> +		u32 bank;
> +
> +		ret = of_property_read_u32(child, "reg", &bank);
> +		if (ret)
> +			return ret;
> +
> +		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +		if (!priv)
> +			return -ENOMEM;
> +
> +		priv->bank_index = bank;

bank is 32 bit value now stored in 8 bit variable.

can we make bank_index 32 bit wide?



