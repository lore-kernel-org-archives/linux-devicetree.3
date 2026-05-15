Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA143CEFC;
	Fri, 15 May 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852694; cv=fail; b=j8hTPGTGzwchL1LveR/gBpLWkmY+7Zccao1S1OToJdgs4cjdO2+klULGXeNe4N9Xk0Ytk2j/2ZXasr7J3ekdmvGGBAg6u70Vf8LoB8jc7iaWdJmiHrU8acPU3AaByNgD5exrlXTj2hgHR63OaCynp+x+FAzwgtzeaMZUX56F3ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852694; c=relaxed/simple;
	bh=R/2mArkjhfVZpJzw2KC8nS1JZ6pKNqvyMe2WJAMTmTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=njiHlaRkmleRzvnDroaLkmzLF7CU03UIGH/Ib8iRIk5Qfa3VCNo8tbZqKBZ4aalhaGi1fI4cCwJcg8e7M7pEBkgOB/iBQWcSikTi3a6zye8TXn1kdLUA9EnB1AgfxBnLI5UxrvFpHc3KR6kuevkusw85zDD6ciWpXHjUyLxe8Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nbxcSH7A; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nbxcSH7A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm+KlCWjVW9qjvauYxZrQF0GdTomCxiYBe5CZkRl1DTCslO6ECKM2IzK2YK72zFIOym4I1JgptsoLgp/dNM+eQtwnN2Un8N3z3c5iJEpHnXMLSQM/7DPz7gH4OqinNxB6nDlcneIM/YgJ0cU5BIF2UyFPLf5LPEFM5ZsXS6JKOYnX+gFxnLMTNB2WCydK1zdm/IxtcW64nW9Y1HGafIBTYsvJXDPNWFNdZRz1MN39DX7065/Aij5yVmAMXxkFRbKeefvvsaN6vmPiYOZQzZPQOOu7Qex9CNGnRYx5dQkzTzVRzYxs7fDD25BukfW5xCNywtVIodZdl1gK1l/VO6a2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2U5DBH3/hy5jouwA/+kH/lvNbRYr+kPE5EVi2zu1NA=;
 b=H4ZcR9jKLbWA1xQcpQkNI2akZC25Hwlw+7k8Q7JTMfWFSF67zE6zMGEBTb9/ijtnfF6z28rhTz75hzSOvvxhbDZ4TaaB778t7CJ0ZicsQoRm4bFNBkSVXFiZYAGiccR3zOhJ6NELNlRYljYj/e/ZkvZs1/25BtLPlmtQGksxx1WqKJsY5AXBGmSGIeAz9+7EhXZKVq1CbnQkCz0zPysQr3ouwIydog80ZGkOkkYfXxD6i3qUd9PlEZb2PGlCepbZovWBbGatDbbtUCLaYzD5ZeZ067IoS5d5lEueFMoIr6SqeJbQhoyfGpDiO3CUYKrZY+hBVD0FuRriz/usJN55FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2U5DBH3/hy5jouwA/+kH/lvNbRYr+kPE5EVi2zu1NA=;
 b=nbxcSH7Al5+SIkssAG9Uw7BjA0zdGrda0pYEbTeVyKQ3qc/Q9o3/YOgnyInIX9cBKFx9tUsSqyTkovxbiiYhuS403g//lWwshG6OvWm5oNsH5W32feOCHWvq/mRgFYYf/pZHRjp+i5n5Xo6pyMiduGpJ9g2pezKbSD3vHGENNMD7AjOH4XxG2C+41O2Olxdk8k1NoGEa1yIjJ26SoDrlyeG3pKr+II7w3lhr4t0fnjWrxbRYylHBuCX8w//uDo42/51clZy1A+HP3/Lmp1tkMtQTLT62knmTutjyKkLkRDpXtvPfioYtw+M5KNFl/IZLBGVv/+1fhnWSn2ZaHja0Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by OSKPR04MB11366.eurprd04.prod.outlook.com (2603:10a6:e10:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 13:44:49 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 13:44:49 +0000
Date: Fri, 15 May 2026 16:44:45 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Message-ID: <jljjuaofhal3e7pf4uvurwfhf3hsvfckk6tzpwepmiszdzgasl@z42ivw5nylug>
References: <20260515110145.1925579-1-ioana.ciornei@nxp.com>
 <20260515110145.1925579-1-ioana.ciornei@nxp.com>
 <20260515110145.1925579-3-ioana.ciornei@nxp.com>
 <20260515110145.1925579-3-ioana.ciornei@nxp.com>
 <20260515122418.edzemzv5gnronihb@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515122418.edzemzv5gnronihb@skbuf>
X-ClientProxiedBy: AS4P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::11) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|OSKPR04MB11366:EE_
X-MS-Office365-Filtering-Correlation-Id: b783e53e-0866-4683-38ad-08deb2882204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|4143699003|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	OQxmoRJwl92BvkBNnouYgNK4xdJ7CaTKWQlaX/aJ57bg+HatqkhGQBthfxglToKmLBUROgsvtBQ9HZWvAN9c/oRrqAFkcW0mLei9aoGbcTBiq0o6XA7mh71dWwShm/Z8dmvhsygUNcx3XvR+IfYwCbtWatPbGAayKgkASvC+kPxSs7T+d3BoycRwaFUZnY4eKDLBkYnoCBeqeiuHcgHMyaFps+evlbZy09x+N2q4xoOAhT1TBHpU1v6/EZNCHoUSyiW7CTM+QHwsDeqLub9pKeyAGryd6iTWljW8vQWEZ2gcG9cNZZKyATuS9b2oG+DUx+Vmp/fgyyIn9QqG398f9lQhijRAaBPxinFeHG3sbrmNaHziM88Shf1nVDDkh873PbBCYXQUX8VrBxkqBYuVbnAb2TGoRgmyUc3iXSmiTQUgEOzbzvFIGZM4N9aLAFJkUpgq4T11XHSf5QoxP7+r8LI4i6cZzY0DF1G06O9gr5R0thjGHj1/6jDNaOUR08I93EHqfTTfLo3VhsnAYQbXqlO0k5A8lMyj291stR/q3IfA5qgCTPfOsUfnAlh5AL+OAQuxgzL08Qjh3WxJmfjTag+y9ntPdSSJIrGfHSNW77hEGkGTxH5zJ19x12x0YSBb9NL2eWiaCien122Ll6uHIll7y8I+UKOz9DTuTFO/oMJ2RSC74YBUCWrCSSOLfklX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Dp8tnUi7RBokJF8ixIc/EzchY00j6N7KBT6+mtMdGOheZzILyU5Pd2NpjoR?=
 =?us-ascii?Q?kXbWJiSJ0IYSzeTLQ9qJ39dRTwikm3zDC0PEedZdgx8Xy+DQLHY01H8sUnXI?=
 =?us-ascii?Q?ycLWnBs8pF5zr+mcB/iY2ii/4iRHy4xLL94hBKI6FBuwL/Ly6Y+egQYMhjM1?=
 =?us-ascii?Q?ae2/BV5w5PSClbw11Y1QgO2D1uN0ounfghGF7em/R65xMXjqmOlqAe/VvOEj?=
 =?us-ascii?Q?DWSgLoPo4pKU2QuFP1H2NLiqeJk7ThtkS10J4n42jKt3uiOm+x4isXA8ZxxN?=
 =?us-ascii?Q?fz+93aZvi0B/3F5I40AnlawjRVJ8Bf5hDCzQKXnarjzE5fyrx5NwMpzCWHW1?=
 =?us-ascii?Q?mONKkv4Np7iUB8+KHgU2+eLlvCN+oguwbesDW7/3cS4ibnxg1kyIVoiEAX3y?=
 =?us-ascii?Q?uYjV1gg/JAveDYGTEkTgmv/i/SPP9F+pnHqQyi4cyPujCsjTxxr5M1BG4Px0?=
 =?us-ascii?Q?qKY9ZhSoTBObTL+KhP8l2EoU9NWsv0qX/1xkpncd0CgBgeKP2Cqeq8iyfIKE?=
 =?us-ascii?Q?rRsol49/sHlcwZfsjOtr6xnzmShhkvUEeL28BrIjdzg0+abv4GWElT0leKjE?=
 =?us-ascii?Q?Nl4PgsP+JQkUluvWf209swwbQBNoYaTgIvgUgVG72v5rZLErhChk9+pnRPsU?=
 =?us-ascii?Q?D7W6uLJb6Fsw6t5jgmiee4FJHnQ2659mP38mAripKUzV0F7DrMoEd/sofGZe?=
 =?us-ascii?Q?NotY9gvsgqO5eD9Xj9OYEgxK51BvC9/vndEoZHYRAmYDIHcwyRBdBLuCQdEV?=
 =?us-ascii?Q?GPUbY20a2TC589ecX9dRbbK6E6EiFbJ2IefRKO1T+1/jCwYtVNUuyIPziyas?=
 =?us-ascii?Q?Qe+NUmmIqYFZ0zXst69GN7zlwT4+I2TgZaggxGH+nXVhkNiwGZbVaaud0P2k?=
 =?us-ascii?Q?UP3g58vp5gsUW92myvp3og6HEb34YyqUpOidRc0Z3MrZVlwD0HkY7OxpOz5b?=
 =?us-ascii?Q?6V//V5WjR8lfJ6st4Qc+b5YOTVpkSzevlN8Y2oZGWbh43wf2+3PsmIhfPWRt?=
 =?us-ascii?Q?TFHny5KAeds2BlisbvYQhAk5BtdYdx6t/ARUh0B1gjqV/pBbG05xXu2qf78n?=
 =?us-ascii?Q?vz8ti7otdJ0JmNCcqKMIp0o2fCYdtlj+4PQtYUo/3qpsgMHdRG9NmLDm4aQ2?=
 =?us-ascii?Q?fCvBBifmKW1MEPu7RpTXxwXLXTThuFxBjRZ1hXT4jQmsTw2YG9QkLm+A5/OM?=
 =?us-ascii?Q?cMaK/e1oRnIPrVhgelLZRIo601wI2D5rYvOWP8HEWjRYD6lkW5nkoBqzJ7Ky?=
 =?us-ascii?Q?llSXl2oRkrH6qw/NV7OxC1weaihAx0RbQ5i/y5jim+Cq35YNI8Ff6G9tLnm4?=
 =?us-ascii?Q?Ozt7FXYf0OsxuE7iGav3c7ekQ3FaLUhZD7qe+33u/K8YyfKG2mzFjrFWIScx?=
 =?us-ascii?Q?NW8K7rF+/c2mlWTTTTX0dY8KoU0+nBbiQQDRwVUw20ptqjZxl2g1enHcY9ne?=
 =?us-ascii?Q?sRLNsHdaFgJXImkiMG+TpQCjfTAqHD4GE0i0KkL4+Q6OYQIbeL3jMW3suj2e?=
 =?us-ascii?Q?dVug8WDIeapyZbZ2gW5YPNkbUc+eYCkyumlJ5ndOTkz3QX1jZqiet2/H6F/Z?=
 =?us-ascii?Q?Ild4IU0bWjNOHdTApju4OLPMXrk9I2wcpqLEPOY+7raOA9lyhcXFZEA14dZ+?=
 =?us-ascii?Q?gXI94kPyg0PuoxXmka6BVA8r+upp3IdxtbFfV7IKljVGOmCrgBioImFZdiFp?=
 =?us-ascii?Q?IPVTx26V4T4tWZGGKsQrYysl7KYR8xNBjNnidO5T01eAt3ub8aZPZl2/79B4?=
 =?us-ascii?Q?hdvJyJCGXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b783e53e-0866-4683-38ad-08deb2882204
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:44:49.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EM96ZndyboWvwup274/Q8OMRpquaDOrcBx7gAzoaEOTqxwRJld3wMVBS4uB9xzyQ4DSc3f1QTOV8penF1i+XRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11366

On Fri, May 15, 2026 at 03:24:18PM +0300, Vladimir Oltean wrote:
> On Fri, May 15, 2026 at 02:01:45PM +0300, Ioana Ciornei wrote:
> > Add a generic PHY driver for the TI DS125DF111 Multi-Protocol
> > Dual-Channel Retimer. The driver currently supports only 10G and 1G link
> > speeds but it can easily extended to also cover other usecases.
> > 
> > Since the available datasheet (https://www.ti.com/lit/gpn/DS125DF111)
> > does not name the registers, the name for the macros were determined by
> > their usage pattern.
> > 
> > A PHY device is created for each of the two channels present on the
> > retimer. This allows for independent configuration of the two channels.
> > This capability is especially important on retimers which have more than
> > 2 channels that can be, depending on the board design, connected in
> > multiple different ways to the SerDes lanes.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Explicitly include all the needed headers
> > - Change ds125df111_xlate() so that it returns an error if args_count is
> > not exactly 1
> > - Add a MAINTAINERS entry
> > ---
> >  MAINTAINERS                     |   7 +
> >  drivers/phy/ti/Kconfig          |  10 ++
> >  drivers/phy/ti/Makefile         |   1 +
> >  drivers/phy/ti/phy-ds125df111.c | 252 ++++++++++++++++++++++++++++++++
> >  4 files changed, 270 insertions(+)
> >  create mode 100644 drivers/phy/ti/phy-ds125df111.c
> > 

(...)

> > +static int ds125df111_configure(struct phy *phy,
> > +				const struct ds125df111_config *cfg)
> > +{
> > +	struct ds125df111_ch *ch = phy_get_drvdata(phy);
> > +	struct ds125df111_priv *priv = ch->priv;
> > +	struct i2c_client *i2c = priv->client;
> > +	struct device *dev = &phy->dev;
> > +	u8 val;
> > +	int err, i;
> 
> Not mandatory, but if the rest of the file uses reverse Christmas tree
> variable ordering, could you stick to that here as well?

Ok, sure.

> 
> > +
> > +	mutex_lock(&priv->mutex);
> > +
> > +	/* Make sure that any subsequent read/write operation will be directed
> > +	 * only to the registers of the selected channel
> > +	 */
> > +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_SELECT);
> > +	if (err < 0) {
> > +		dev_err(dev, "Unable to select channel\n");
> 
> Here and everywhere else: could you please print a symbolic description
> of the error? %pe, ERR_PTR(err).

Nice, I didn't know about the %pe.

> 
> > +		goto out;
> > +	}
> > +	val = (u8)err;
> > +	val &= ~DS125DF111_CH_SELECT_TARGET_MASK;
> > +	val |= DS125DF111_CH_SELECT_EN | ch->idx;
> > +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_SELECT, val);
> > +	if (err < 0) {
> > +		dev_err(dev, "Unable to select channel\n");
> > +		goto out;
> > +	}
> > +
> > +	/* Reset Channel Registers */
> > +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_CTRL);
> > +	if (err < 0) {
> > +		dev_err(dev, "Error resetting channel configuration\n");
> > +		goto out;
> > +	}
> > +	val = (u8)err;
> > +	val |= DS125DF111_CH_CTRL_RESET;
> > +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_CTRL, val);
> > +	if (err < 0) {
> > +		dev_err(dev, "Error resetting channel configuration\n");
> > +		goto out;
> > +	}
> 
> Did you consider simplifying this function using a ds125df111_rmw() helper?
> All configuration accesses except the VCO group frequencies are
> read-modify-write.
> 

I will look into a _rmw helper and see if it helps.

> > +
> > +	/* Program the VCO group frequencies */
> > +	for (i = 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
> > +		err = i2c_smbus_write_byte_data(i2c,
> > +						DS125DF111_VCO_GROUP_BASE + i,
> > +						cfg->vco_group[i]);
> > +		if (err < 0) {
> > +			dev_err(dev, "Error programming VCO group frequencies\n");
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	/* Set the Divide Ratios for the VCO Groups*/
> 
> Space between Groups and */
> Also, Divide Ratios, Groups, Channel Registers are not proper nouns,
> they don't need to be capitalized.

Ok, will fix.

> 
> > +	err = i2c_smbus_read_byte_data(i2c, DS125DF111_RATIOS);
> > +	if (err < 0) {
> > +		dev_err(dev, "Error programming the divide ratios\n");
> > +		goto out;
> > +	}
> > +	val = (u8)err;
> > +	val &= ~(DS125DF111_RATIOS_RATE_MASK | DS125DF111_RATIOS_SUBRATE_MASK);
> > +	val |= FIELD_PREP(DS125DF111_RATIOS_RATE_MASK, cfg->rate) |
> > +		FIELD_PREP(DS125DF111_RATIOS_SUBRATE_MASK, cfg->subrate);
> > +	err = i2c_smbus_write_byte_data(i2c, DS125DF111_RATIOS, val);
> > +	if (err < 0) {
> > +		dev_err(dev, "Error programming the divide ratios\n");
> > +		goto out;
> > +	}
> > +
> > +	mutex_unlock(&priv->mutex);
> > +
> > +	return 0;
> > +
> > +out:
> > +	mutex_unlock(&priv->mutex);
> > +
> > +	return err;
> 
> You don't need a separate code path for the 'out' label, it can be
> common with the normal exit path (err will be 0).

Ok.

> 
> > +}
> > +
> > +static int ds125df111_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> > +{
> > +	const struct ds125df111_config *cfg;
> > +
> > +	if (mode != PHY_MODE_ETHERNET)
> > +		return -EOPNOTSUPP;
> 
> Please use a different error code like -EINVAL. Let -EOPNOTSUPP mean
> that the function is not implemented (when calling phy_set_mode_ext()).
> 
> > +
> > +	switch (submode) {
> > +	case PHY_INTERFACE_MODE_10GBASER:
> > +		cfg = &ds125df111_cfg[FREQ_10G];
> > +		break;
> > +	case PHY_INTERFACE_MODE_1000BASEX:
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		cfg = &ds125df111_cfg[FREQ_1G];
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> 
> Same here.

Will change in both instances.

> 
> > +	}
> > +
> > +	return ds125df111_configure(phy, cfg);
> > +}
> > +
> > +static const struct phy_ops ds125df111_ops = {
> > +	.set_mode	= ds125df111_set_mode,
> 
> Can you please implement .validate() as well? It will be made mandatory
> in the future for those who implement .set_mode().
> 

Sure. Will implement the .validate() callback in v3.

(...)

> > +	.owner		= THIS_MODULE,
> > +};
> > +
> > +static const struct of_device_id ds125df111_dt_ids[] =
> > +	{ .compatible = "ti,ds125df111", },
> > +	{},
> 
> Unnecessary comma after sentinel entry.

I will remove it.
