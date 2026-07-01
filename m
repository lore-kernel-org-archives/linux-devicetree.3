Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E062D738A;
	Wed,  1 Jul 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905287; cv=none; b=omUi71rUUUIa1Bpb20F9Lde41yhBIXm2dpAOcS4E6Vi7ijc7ADro2O2TTpbCPV0ElGOXkdjUGe3f9IpSt1MugH65xxl3rt/MnDnIcTusLE42iseRylgP8LUZPoXDo9hiuCRL1eMBJdqOjbczlwVGsfJK2w8GQq8VGQeUIEt2eJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905287; c=relaxed/simple;
	bh=LiZmvTOHP2ZinLiEwJaSXQWDUCsKtfS8dJwqwE9/4jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/g8mP+vjVKE0O+1ApXaqWfpDhZvIPRJd8tZoIM51RnfMqLtMEpIEq7dKD2iYtvR7KEGRFYvQ+NcjoaW4D3NveN/oRVQokqHWIMfVkOxOmEMssZuVAy6m77eBo5BJUZ5Nt2IaeKXTS3ncNqOw42lRuGNG//IPkSLdSFQnSGVf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EFC1F000E9;
	Wed,  1 Jul 2026 11:28:01 +0000 (UTC)
Message-ID: <0e2c6127-0150-4cad-b602-078d499be6c5@nxsw.ie>
Date: Wed, 1 Jul 2026 12:28:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
 kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <ZkhgnHpgeMHGG5XXFho_yGMh29vJq4gi3Q3c3whfUfY96JLxZVFJtAbHAATuBl1PecwYh3BS9VAhZfv2biT2Fg==@protonmail.internalid>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2026 11:28, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Introduce per-compatible regulator descriptor data to accommodate these
> differences. This keeps the existing PM8150B current-limit logic intact
> while adding a dedicated voltage-selector path for PM4125.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>   drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
>   1 file changed, 88 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..40e7e5589d5b499b2e84a00b2cfa754fba7e2f0f 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -20,10 +20,35 @@
>   #define OTG_CFG				0x53
>   #define OTG_EN_SRC_CFG			BIT(1)
> 
> +#define PM4125_VBOOST_EN		0x50
> +#define PM4125_VBOOST_CFG		0x52
> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> +#define PM4125_VBOOST_CFG		0x56
> +#define PM4125_OTG_EN_SRC_CFG		BIT(0)
> +
> +struct qcom_usb_vbus_reg_data {
> +	u16 cmd_otg;
> +	u16 otg_cfg;
> +	u8  otg_en_src_cfg;
> +	u16 csel_reg;
> +	u8 csel_mask;
> +	const unsigned int *curr_table;
> +	unsigned int n_current_limits;
> +	u16 vsel_reg;
> +	u8 vsel_mask;
> +	const unsigned int *volt_table;
> +	unsigned int n_voltages;
> +	const struct regulator_ops *ops;
> +};
> +
>   static const unsigned int curr_table[] = {
>   	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>   };
> 
> +static const unsigned int pm4125_vboost_table[] = {
> +	4250000, 4500000, 4750000, 5000000,
> +};

Should vboost_table be absent for pm8150b ?

> +
>   static const struct regulator_ops qcom_usb_vbus_reg_ops = {
>   	.enable = regulator_enable_regmap,
>   	.disable = regulator_disable_regmap,
> @@ -32,19 +57,43 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
>   	.set_current_limit = regulator_set_current_limit_regmap,
>   };
> 
> -static struct regulator_desc qcom_usb_vbus_rdesc = {
> -	.name = "usb_vbus",
> -	.ops = &qcom_usb_vbus_reg_ops,
> -	.owner = THIS_MODULE,
> -	.type = REGULATOR_VOLTAGE,
> +static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
> +	.enable = regulator_enable_regmap,
> +	.disable = regulator_disable_regmap,
> +	.is_enabled = regulator_is_enabled_regmap,
> +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> +	.list_voltage = regulator_list_voltage_table,
> +};
> +
> +static const struct qcom_usb_vbus_reg_data pm8150b_data = {
> +	.cmd_otg = CMD_OTG,
> +	.otg_cfg = OTG_CFG,
> +	.otg_en_src_cfg = OTG_EN_SRC_CFG,
> +	.csel_reg = OTG_CURRENT_LIMIT_CFG,
> +	.csel_mask = OTG_CURRENT_LIMIT_MASK,
>   	.curr_table = curr_table,
>   	.n_current_limits = ARRAY_SIZE(curr_table),
> +	.ops = &qcom_usb_vbus_reg_ops,
> +};

I think you should split this patch up

#1 introduces the abstraction for the existing device
#2 introduces the new PM4125

> +static const struct qcom_usb_vbus_reg_data pm4125_data = {
> +	.cmd_otg = PM4125_VBOOST_EN,
> +	.otg_cfg = PM4125_VBOOST_CFG,
> +	.otg_en_src_cfg = PM4125_OTG_EN_SRC_CFG,
> +	.vsel_reg = PM4125_VBOOST_CFG,
> +	.vsel_mask = PM4125_VBOOST_CFG_MASK,
> +	.volt_table = pm4125_vboost_table,
> +	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
> +	.ops = &qcom_usb_vbus_pm4125_reg_ops,
>   };
> 
>   static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	const struct qcom_usb_vbus_reg_data *data;
>   	struct regulator_dev *rdev;
> +	struct regulator_desc *rdesc;
>   	struct regmap *regmap;
>   	struct regulator_config config = { };
>   	struct regulator_init_data *init_data;
> @@ -57,27 +106,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   		return ret;
>   	}
> 
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
>   	regmap = dev_get_regmap(dev->parent, NULL);
>   	if (!regmap) {
>   		dev_err(dev, "Failed to get regmap\n");
>   		return -ENOENT;
>   	}
> 
> -	init_data = of_get_regulator_init_data(dev, dev->of_node,
> -					       &qcom_usb_vbus_rdesc);
> +	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
> +	if (!rdesc)
> +		return -ENOMEM;
> +
> +	rdesc->name = "usb_vbus";
> +	rdesc->ops = data->ops;
> +	rdesc->owner = THIS_MODULE;
> +	rdesc->type = REGULATOR_VOLTAGE;
> +	rdesc->enable_reg = base + data->cmd_otg;
> +	rdesc->enable_mask = OTG_EN;
> +
> +	if (data->curr_table) {
> +		rdesc->curr_table = data->curr_table;
> +		rdesc->n_current_limits = data->n_current_limits;
> +		rdesc->csel_reg = base + data->csel_reg;
> +		rdesc->csel_mask = data->csel_mask;
> +	}
> +
> +	if (data->volt_table) {
> +		rdesc->volt_table = data->volt_table;
> +		rdesc->n_voltages = data->n_voltages;
> +		rdesc->vsel_reg = base + data->vsel_reg;
> +		rdesc->vsel_mask = data->vsel_mask;
> +	}
> +
> +	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
>   	if (!init_data)
>   		return -ENOMEM;
> 
> -	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
> -	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
> -	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
> -	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
>   	config.dev = dev;
>   	config.init_data = init_data;
>   	config.of_node = dev->of_node;
>   	config.regmap = regmap;
> 
> -	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
> +	rdev = devm_regulator_register(dev, rdesc, &config);
>   	if (IS_ERR(rdev)) {
>   		ret = PTR_ERR(rdev);
>   		dev_err(dev, "not able to register vbus reg %d\n", ret);
> @@ -85,13 +158,14 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
>   	}
> 
>   	/* Disable HW logic for VBUS enable */
> -	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
> +	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
> 
>   	return 0;
>   }
> 
>   static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
> -	{ .compatible = "qcom,pm8150b-vbus-reg" },
> +	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
> +	{ .compatible = "qcom,pm4125-vbus-reg", .data = &pm4125_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
> 
> --
> 2.34.1
> 
> 

