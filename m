Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A37286A4;
	Tue, 21 Apr 2026 03:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776743420; cv=fail; b=pIxlLflVfA+mLEUTFkh+4ZkRTb82lbLye0CjDDH4kwG6Wh01yOHwzWmRe0IVsEyfYrA1y8ppqWwq0eQPDDFWmy0FeKT3HcB9hK/2oUekLIhiBAVzoQISJdT8Fu6rQmcR2JvlBoVKRJTv+35t4OoHJdg6hSIQGxozy4achIfpDv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776743420; c=relaxed/simple;
	bh=yKaqLDXTFsyuEiwpwy9LsvYHO+d/vuoKJhzQxp78qtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OTV5h18jycjoZtMVdpneDEDgMusawwDB9TecxRswYTa6xhIO+h08tIG5U7ClLEyqubi9ZPCnrGFEPWxSr+MFL5a2n+pGP8pDABI3fRq9oHAA+r3/r3gQE6FyTlT5Ng0CYJf6bN9TSqhuhaTQw0HgWNQTv+8bBMer0lg0cIu9pLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d2xGh3FT; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d2xGh3FT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8P2b7lEog9CTnQdCvsip4VMO54wCegkwnmYRUTbkwC5+krNT032pzDcP5CBsn/Q4j3aOvaLhSiiV7RVbpfwBCTNiDTMU+SstOzZDUxfGa7RnL1zIrRbyx0cIpp7EAVSKC6BfeDHMvnCT0OxkyeXFwbqTi4z1IClQDJilD2KlkbZEfUyTqiCXcUvdC83LU4t/W7E0K4I9mpsMcCoYYM7nk8iOcyI4dvnjFHjxvST6dqAi1LuYF0nl+IHegf0XG+9Xb20j8obT8ETkwSgTDAhHGtLJZaRMMidusC0hPumZgO/oVa3KFU8U367C2PQ+fYeok2m3T5PeE6NkexIGNy/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5jJwAn+hOhKh0zxZDBh+aSquNAzxgTpCjoxGjCs910=;
 b=eO4cS3sWM6aHT/UZmvXWfv3/b3CRA03fCUYXdVhnxRHeY3inI/QWOIJ4Hr2Xf+4B8RrlD2/+PwT3Gr5aFCJ8FoXV+WGbyYN7nXD99esPIvGbEMeu7F/u/2nl5dRHxLCpOZEhIuuiBwKcrT6/kr3zkmfd+4lGenF37zzh8C8XX331ePiNKgTTJxM9aa6oF8CUwcCaplWEnBptnILFm1Yh2ASSeV70UuNy7VwxS1FltV8m0tfLqa2FW7iLMCL4+FrYMUzdKOahRPSy2Lv5l6xRcKo8Eg5ei5Ebtuv5uOJlD8BF+ztIc9DcDV9lRzP0OUAlFpuTC2PZi2Wuyehq0aZaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5jJwAn+hOhKh0zxZDBh+aSquNAzxgTpCjoxGjCs910=;
 b=d2xGh3FTkmoN479BoUBW/72ap6Tp2F8nXg1lIT9HhwiMNSW9uf4xm03k2v4piByIJ/MK1GXXBOx7PSgoKHtDovnweJ5OFRZkveZkHexpMrBYKDU2E8NVTyW8sAoQhXaDAW3ikb9Ap2L2XKcb9CS8EK1unsnmJouHwEm+DPu16MtIlEnyXMj9o70GQjxTFNZMCqZvSQ3oEyfI8XEaQ4n4ctfcSonTHbg9YD5XqlmgnetM6pSre8PJZLwazAQ90M6X+utDQgt0KBhNQNgM9Kura/v7iz5rPuZo4R8W9etDSInYefkCLe1Aof5YNa4Z/DQaoLkjVDBdi96W1uhWLedgqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10106.eurprd04.prod.outlook.com (2603:10a6:150:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 03:50:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:50:13 +0000
Date: Mon, 20 Apr 2026 23:50:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <aebz7Mdu5FA6jIyW@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-8-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: c99296b3-1784-476f-83b0-08de9f5917a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qwibmWXJ9iaha3QZoPXVJAZfF8gJ0rX1nJQzymr23aQ8pg0QGJeT7Egktt0KGs0urbwrtdnreinOOiseFhZXjR17I2r3RhqFfY8qWBcohQtRRGpAAyT0TpFkwQL+2h+7lanQra630vCn8ZHXRwDQD/V/39k3SYRwLrXhpBY5t1KrZ5dsdaSwhFZwEz0nhYnXOMs1OIDw8Qo83nkuldScKNSkfPu49Y97R8UFyz+Nc+r5yHrmJ5yvRzyeoN3IjOcDef9wvk8kbARxq4ISUrjRt8aLgFh2HTNiqipCqvVeMAgkd8eSrTTYkirqGmEvG3yOqtRQip7KT1LJXMkKhTmTJan05UL3tkTauJUF2vqNKaQIFRwv7Zyr/PjNriG6TpiAexX2mxoG0m0x2ZF/zVajrKulJQYYNnkLCWTXjkDzLxI0VZ7jhPa0WvUzmZOvAzB3zRVDpm6qxMJym23v9hEmpmbPrJteOrIJrdrt6WtD2LksjmR2umZYVzJ0pDRO68fQChgW9xo84G4Mvp3X2188JU86ODGO7fp7uK7QQ/6T0qHTn7TXZvlQLSvsAh11y2IJ5AxoD4heTgIR3KLtDRzkcM08O8RPSygFcZePvef9usXM500n+ZqEae0bS0t7E6RAJbMZAmrLTRz8qSwSpLzc4oM/x34D/sQrO1snv7A/XBEa9enAMVLJq+0PFk/xGQFVNLzBuG8Mc3mW0z8S1aQhflaUXOmBXQImbO+ZuB/yQYiI8/OqLbTl8YQaSduPt2C6XUgfwJk4mG8vFoETrB7HcEG3wSFmx5IcYK7tbXH/XdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F5TDUpbonNUF5rhkzFOu3sp47jdVkPxCXydAoKrAO0uPYDyTuY1zg592yzIl?=
 =?us-ascii?Q?vnzmQ7+lzfRsKyYHSaFF8Uhn2WHTXMixTEUGC4BEKBuKqflO2cmSNEJXp2WD?=
 =?us-ascii?Q?zwa09tIjKOC6t5zyyWAWDrVWJOUY/HM7ftgmRVZX4Ia7mCIrl3vrimaWev00?=
 =?us-ascii?Q?PrNn872W7yukFOt6NsJuLw6kyd5eIKQGEP65Ohd9GHJBbVjov5LBsUMEqqkc?=
 =?us-ascii?Q?nTYZEAnsf7fGVdi4aWvyKwWH1XSf+jbKt52yEKe/Yb/Zxo5T4EapdwwE7YOp?=
 =?us-ascii?Q?tiJTl2qW5OQi/Vv/4qQhoDEryTR+Yyr2bs3EZ4UfBCDgkr27ngGE/QZdQRNE?=
 =?us-ascii?Q?ty0bbpRkw1i6vfRh6v5XpmfoSRovF7VCGQ9/geA9xgvy6hMMWrbh64yhebBI?=
 =?us-ascii?Q?8tS9X4O4h8PYz3DTEdsLoWrHx2uKvEL/3NFIGdCopnaYMhGK4mppJKbYmlBa?=
 =?us-ascii?Q?fLTt/5g98ZTBFus7mXHNrg0y5hZKL6lDZc1UYoXyeXkKLRBceJKvRkJRRS2l?=
 =?us-ascii?Q?w1u3HrjB+b0k4UkfFHHJ4KEcizqFY2Fj1XSp9HAp57zrUn+SsShmWtRTf/5b?=
 =?us-ascii?Q?0QbNnVlSZLlE1sZOSOvgO5f88ZTMJ7yStnOK4UbJeyvLcNOhmYCBoFLDzMKM?=
 =?us-ascii?Q?V0sWqkxVUEdZSUd4G1iZBTK2sojJ9cUGa4i9EepJKSKRMrIPiAfYw8rh+V3W?=
 =?us-ascii?Q?Ugrur9OLhOedCoupFroVLcWwtsb7SWKXY1oxz0PxbcdxelruWaGXhuN1qqKk?=
 =?us-ascii?Q?GpOX0QHB1C7FmcwefmejSkSBBevF4vZ8lxhEuMOFg0ZlCoJ4p1y4Rr1QBJp2?=
 =?us-ascii?Q?hLEXlJP4ya0KjwW39LLjuLdBXvcg04EHXtDAv231utIFGcgzhWhL5cmAYVHJ?=
 =?us-ascii?Q?3VMn+Yzl8uybHTo4SdQQDacCbftf6+bMdUpLKcbTlLgY6z/pXQ6n19IUC4ZP?=
 =?us-ascii?Q?Xsna3qzsQ9r7AVtEBbWZoQLQ3tsxAhWOPU1LF/tk4cx8+DzU8Ou6Mz7FIsFR?=
 =?us-ascii?Q?r8IJVvw3B7+hYf7kJqFrCAPMfBVANUvqMAqrddpJLHm9VPycC4ZAj+iSEJca?=
 =?us-ascii?Q?TfS/EEEvx+Igz2G8Rl6xt15coAsVTt1YLaDShn2avV8oq692QR1T5lHnEw3y?=
 =?us-ascii?Q?kP4MHENxi5O/BSCUHq/CfL/twpfMD53W/8xjieydlSl1NvG2h4gJ/8ZyrLKI?=
 =?us-ascii?Q?8kTsQNVpIGyWq1LtdU/taUrtBWaDg7zg17BsUc3fmgjMDyZXXNmh2xW719tb?=
 =?us-ascii?Q?D/xV7JS97zR/nNAmT9jxzPZFajEAQRP+gE7M/jfEiTWhtE66CLudW38seLJs?=
 =?us-ascii?Q?ms4kc6Y/OvgGmJHxlTie2Th02g/rRgMgXP+ONzM7U+oBPEoPXBFDqa/sRijS?=
 =?us-ascii?Q?LGa74+fi2eUv+nZpjSFjw7OIdhE8HqHNKPNL9hH11soU1nxma4kPbgHwe1gz?=
 =?us-ascii?Q?R+ZKON1Y3WWYSfSjo70EQ+Ih7xeDqeG0kv3XEfH9uEjsc+DhfmW9yBhpbcjq?=
 =?us-ascii?Q?mLifS3ek/0NLHQonTNKqcuz/Ve7o8iRyTwXQmkRzWnAuuC6LNvPEU/A3g8XJ?=
 =?us-ascii?Q?su1gGg82pl9svuSBJuPOHpL7PxHpz5ID6t5pZ1cAgwcTPpK2QN5zvX5o6gaZ?=
 =?us-ascii?Q?rfypk3ouGellN7wqWsGnuO0h6vFlnQJHJLo6gAcCjlSapjxEUimWVbAo9hpE?=
 =?us-ascii?Q?HruXkvYwA589TmxhplpBoyAahPLSGApbHMqjjl5myK9vdXBu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99296b3-1784-476f-83b0-08de9f5917a6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:50:13.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1rlJEvgbZMV/zjNU7iSq6D/L3Ugc/Lh8IPFFZz2UUccMVunU3SsrmjrtKFRHCWnVinKjxLpMWXlQQV5KIGkvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10106

On Mon, Apr 20, 2026 at 04:22:22PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C, I2C, or SMBus.
>
> This driver enables:
> - I3C/I2C communication between host and hub
> - Transparent communication with downstream devices
> - Target port configuration (I3C/I2C/SMBus)
> - MCTP device support
> - In-band interrupt handling
>
> P3H2440/P3H2441 support 4 target ports.
> P3H2840/P3H2841 support 8 target ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
...
> +static int p3h2x4x_configure_ldo(struct device *dev)
> +{
> +	static const char * const supplies[] = {
> +		"vcc1",
> +		"vcc2",
> +		"vcc3",
> +		"vcc4"
> +	};
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(supplies); i++) {
> +		ret = devm_regulator_get_enable_optional(dev->parent, supplies[i]);
> +		if (ret == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		if (ret && ret != -ENODEV)
> +			dev_warn(dev, "Failed to enable %s (%d)\n",
> +				 supplies[i], ret);
> +	}
> +
> +	/* This delay is required for the regulator to stabilize its output voltage */
> +	mdelay(5);

Now perfer use fsleep()

...
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
> +	struct i3c_master_controller *parent = i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
> +	u8 tp, ntwk_mask = 0;
> +	int ret;
> +
> +	p3h2x4x_hub->hub = i3c_hub_init(parent,
> +					&p3h2x4x_hub_ops,
> +					p3h2x4x_hub->i3cdev);
> +
> +	if (IS_ERR(p3h2x4x_hub->hub))
> +		return PTR_ERR(p3h2x4x_hub->hub);
> +
> +	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C)
> +			continue;
> +
> +		/* Assign DT node for this TP */
> +		p3h2x4x_hub->dev->of_node = p3h2x4x_hub->tp_bus[tp].of_node;

device_set_of_node_from_dev()


...
> + * I2C algorithm Structure
> + */
> +static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
> +	.master_xfer    = p3h2x4x_tp_i2c_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

If slave mode is not essesical, suggest add later, this patch is already
big.

Frank
