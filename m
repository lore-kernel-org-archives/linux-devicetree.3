Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013046.outbound.protection.outlook.com [52.103.14.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492C3ED3B5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287367; cv=fail; b=OluRh7wbqRdv/5RqWBkNh4LSnWJXzn9gVcDiZWRCXBmC5VOukmftQKyv0Pgm/sWa9d+H89KIe6fmt5GEb/trFWntm0tWwTNstCJWNR08CAxrzcJO2vp3VQPgP1S0c8Lw95OXYk7WHIaou/iBHjmZ9O5aJ1aH0lgW60F9DalWYHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287367; c=relaxed/simple;
	bh=z5ABlLaOMdhyH53NN7/sH4WbDt5HwAyAsiAQIeOKQqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=osLGlgfqgSSoQIhcr83wCwU0Zh3KL+x2hKrgVszZ+GdaZ9djNWj5U9a9kkLtcnSd4OAykfALSH1tuY/IaJqxRbPl2DRmYWDKDSUHnvSaKxAwxtXEk1sa2cEq42D/kSPrqsjiZY52WicTeIa1skODetW/fqY2R+oLfldtHn4IDRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=k83A/yv1; arc=fail smtp.client-ip=52.103.14.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="k83A/yv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKLLv+QE5DiI5HVWXb4r9PruAW3q+tyV593bD+yDD73QfEou3Rs+oTaLMO4XXjdG5RaQNK2b9xM4s+4tBxhQieRecFvZt6bPYXfelI1oXKMuRYhzwi1TGU5BcdvebYxyiB/7cJRD1DhQiI7uGmLcZ0A1ZZ0nqnJGjUcm6AsFNcC1sUGaMQhIe0a+lyDuQNO5m7fZDJGyj+VeleJSG1qYjzfUhyPLhcklu++YeL/L8WhSaCfDTrXf3RcfDv1tHtQQaTLb/7lcq1cUxMGnSjsu1UcZi2F/QrMzuCFv0oaLUKdFVMMSbXdwuGLikQcEYoQrPkwCb935SGhERPzmgppLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVo17dh+xFe18rH3RbAPoJ4nCgBAaG0yiYbjSoZiE3k=;
 b=sL5lgYJk8iCgGYLeqTaqbjeQrvP8Ikt1yI+FDqIFCeGe0G1oRQ/MERqOZv38NteN4O5X4zQbrlV50ndKSAbrAVR6BOVPQwgwMBSAwWx+KlwJb3Wf5iPfWRJ3RMPzUtWEMmcYiDWc4+hM1542ssMOiH7xcTL9juKE4/LmL9BvPssSKJyiJVz6Gc2+gljgUTBJyjlMKcDU63K8RYVdq9yz04HvXwBsB5dG/5A1QR4q6YBEjwBsL5gpIrc7k/p8PUSoWGZFqtO9E5wH7hkbSR34e2M/SV6h9Bf74dT5z9WYIRUXE11ZcLZRcqBBkVdxXKuHlybcHcbiP6nAUZWVBIUKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVo17dh+xFe18rH3RbAPoJ4nCgBAaG0yiYbjSoZiE3k=;
 b=k83A/yv1m9xR5bRcvtTLPUcw5FtBFEg1M8AcpryuC8YZ0qFfGbY2dTPNYIYEw9zuK7abESdOdGtQmOe/VdaksjN4w9pWdHvUbCT5ALKuoesJzr+r0G1oJQaz3ubg/heQLI0RUvXgpz1YlsQlRwqQPi4UpF1opCNBPy3tYwAnc4PcPtPIfJlzn28EBiV72OJBhsoihP1G004nuXKus+h5vhuTYS2lti3dn4CimX5pWJC0/yk39ihSylpmBoT6tmmDsoQuj9LvLGJ4n2z3l2P09v7VbVkRsNHXlOQL2ZU1ylYo1B0AwwWyDF11H55fvnvnMH903yUQGaWM6x65qx0hyA==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by CH3PR19MB7856.namprd19.prod.outlook.com
 (2603:10b6:610:158::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 14:29:18 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%6]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:29:18 +0000
Date: Wed, 20 May 2026 09:29:15 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
	heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH V2 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
Message-ID:
 <PH0PR19MB9973388E4A62128DAC3D571E25A5012@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
 <20260515221947.299229-5-macroalpha82@gmail.com>
 <c5ea73cc-ac1f-43ba-bcf1-0083a59bbef9@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5ea73cc-ac1f-43ba-bcf1-0083a59bbef9@linaro.org>
X-ClientProxiedBy: SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::20) To PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <ag3FOy6iNFYPY4D9@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|CH3PR19MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 248b3b2e-632a-48db-a2c5-08deb67c2ce8
X-MS-Exchange-SLBlob-MailProps:
	CLk2x5OX5VZ6b1Cy8/4TAiWSwuX7IllLC8oiWZ8DINKTtj9m2N0pdapXpuv8j5ShSatDbxdLRTaDFyx0b6mEsmYSU1puYVZjIiQUT6UgXNa6oERe8A7v0oRRPd3YPEYKIEo0RF+H4zXvKN1x1TQFhSPgavvYs3vP837V01wuogyeJFPFYhfuHo6RnF52wgjTUzcyuPDef0CQ2yPr1Xv28USEClgsZ+eVJYTUFovWgzAv6u4P6J8uLNYtNpVcrE7gi94Gv2B18APAB/VxNFO5ycQqWAYHQziSwzqaG5mO0gYp71bhc5OLXvVEsarUOJipUre+TqwW2B/AtI+qFrjnojmOZSpGVlk9OudGO9b8LDt9fo3se4pCim06KhemOIJBV22S7/ki0p1DMJq9Pw0TZnjnrxWB8zUSnV0PLH1i8BW7YoWePA8K0uA1DRLyCA85camzEG0YG3oQTzQU7sdZwqLcwhob44cHPyB3L6jeDQ/laClp3hv+H1AhgUYlNYehPEeoXApumSUMC4ARSQvr5al98dsXHFpE3Aem+a5CbBJ5r3xdpE+pDhbapmB+qKeczws9Re9An8eyWgAB6UP1QYmrNPosDIo23iHNdMWIzxXoAosCdEL5YpURFsSeLpcl8sKWaGZqEqrfGP3HtnObhrNBxgYgLywVqey5Tpev91hpj+2KJVu1Pa9XhoGNx1DHLdN3kgkxIqRJACWllO6zZQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|37011999003|8060799015|15080799012|23021999003|24021099003|12121999013|41001999006|25031999004|5072599009|6090799003|53005399003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X0Ibd7StqTtIq9/Pzzunbgrr6uGtJHhRGct3xNutk/W9Jblk+K7IiPtBZvf0?=
 =?us-ascii?Q?alPjL4Kheb9Swer4NpEdvt1nR0SoIzitcbvg4H8vpKWjN7JCdWEcqg/tQ264?=
 =?us-ascii?Q?0E3Vd4YxS4swWAjifDqVbGbZO9/i0ZYBserBCJ7pN36p9TLlcjN6Hy9U6FTH?=
 =?us-ascii?Q?GgcS8W0OXTxtxwAYCOCmSu4rEq3zojiOPS16YVbDva7a6cG/5ROeqJzE6lWX?=
 =?us-ascii?Q?k+fmE9LRr8xhoyU28uIQdnaU0uzXUR9shOpr7eJif9XfXLj6a42Jpt6lDS/q?=
 =?us-ascii?Q?L2tr4cUuCJp/5kZWUocQIAKtDdDlBvWYmO1SjL3Wb63Oq5QrDaiB2qB7g9/b?=
 =?us-ascii?Q?1ZNBFlUwkKbpxh1zqjUMiFa2sZT4D4ft5uuaJsb/DJ7mjBdaDLgcqijg/bZk?=
 =?us-ascii?Q?Tr2BOmjVhNQUAEAbGYNYaLZY3XKooS0O0Az2f/pDG0G+jFtAyTzALRsVQEJT?=
 =?us-ascii?Q?/xVQxyoNE6xGrqKLdpKDNBo17Awy2BAcmqS8Lj5bxSXtUa2n7DHBplb8bCje?=
 =?us-ascii?Q?JVo5FuobnaIlUMziCo+CVn8llfiPUvLoUItqILaH08glFGQMJ5ircc0RKm3u?=
 =?us-ascii?Q?DcEEn4H8FomEciMBykoCibhjADTi3IolIB/C/q1dauxMNaOlmLz3qaBf6CHu?=
 =?us-ascii?Q?xaAsZPxrnfZZawikp4Lmp8E7XoHdDeMNrVjUqZY4KyUwV/lD7FFgiI6gQ3iu?=
 =?us-ascii?Q?95IoE+m398H2oK/gPRhpcLxaRUB1TJHE0y5qubOLSaSSqymDSOfmHl9oxGxi?=
 =?us-ascii?Q?iiv0NyOQhol7b4OGPUQI9Uh/Ix7RQGx/3RBTpLGSBVw0ECc1FNelDmakqNt7?=
 =?us-ascii?Q?CLvDjJ/A0RUqMvzWy+MHIbF1l0pq4gR9Vpax6FjrZ+nUb8GPG6zy4XnmzBKH?=
 =?us-ascii?Q?7vDon3mWdWV4v+nKgMD4GRVab7E3Go4d3sUWfgpgXC+fJvlMfFEwqlUoqrdd?=
 =?us-ascii?Q?GO9Lr08aZ/Ria53A3OKEH8ase54AXaBpfsaYCxoJM/VPLn62jFqTxQ8PB1za?=
 =?us-ascii?Q?xEFe9KHZa6694UZZnybGC3c/ICbypFTM2/wsvZs/SbmuCTApHGYi/eJk9hCD?=
 =?us-ascii?Q?OMo5f96FKFXRa0k+10QLal7bW3NDkQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lNyudOxkByPYw+nFHIJfy7qBYBwm4fbbOcV7timgfngJLZetRGv5VXiZAQ7R?=
 =?us-ascii?Q?LSIQGjCgdqi3oiXo0ZrcisgX7NB470wfkXtHI0NOHAUJPOnPejwsAXzG1rD5?=
 =?us-ascii?Q?ISyOvYaorDEc79+J5kltuh/BVp6ati07quBhTU8URg0+vQx0436otWErHxKA?=
 =?us-ascii?Q?2g6lhHeyHzZ/mtNpxhmitP4gVVXNZ8aHwgey1ymJEzVKG55IIsGgxVelKuKQ?=
 =?us-ascii?Q?nZorhbw52JUy1CynHrmy5kP7zybXP/rmRzM9hm2PFTEtilSsEAZvHxDiEWMe?=
 =?us-ascii?Q?qKsjath/jARXJggCORdWRnV+94oZdDDN+XNLR+3ZDpKN+pKYj/JPvHdk5lwN?=
 =?us-ascii?Q?gpMUxEbroZU8WXwA7FKUN5eIqxvZ00wBsV8uhXH9B1Cuiz3qa64VdCXKqBjk?=
 =?us-ascii?Q?7pCTLUF71yYWzV51dxwMlvEMh2qZRr9KMkzwhD0UaEy75LVrnMK0ARdJssaR?=
 =?us-ascii?Q?c5Zz/JEVzosWDnad8QENR1GlXKroqfDoWLMHM6QNCCkJLXyrOOUn49/I62Bw?=
 =?us-ascii?Q?hkoDrduFfGuDxRoVdokPv1BxY0B7OkiISfikvG/3SdOxf3guepkrVAuEZltA?=
 =?us-ascii?Q?sfdLrOvvBEldU7xjZ9Su/zBYHy1mJA8EyVU6y0JZ1VzrM0ewoLCCplGDVZps?=
 =?us-ascii?Q?gS4FqNVrAa3dJR7kqwi8mz0wmGt5LkfnLJhmo5bpahP2kNz8WDQzc3qL+uzl?=
 =?us-ascii?Q?vn6gdlwFlgZquGUqciHGwetlgTnixERv9TQkbL//FbIkJ7Yw8UIrlo7gF7SW?=
 =?us-ascii?Q?0KJ/kWqMIC9Erad9Uvv++8b/LKDUmRnZ0SeBjiigoQT1J9sYznIq4CFGurcP?=
 =?us-ascii?Q?o/GrwqXP5uLxDYNW42+oGioOT9HBpAwM0S7bJqy3DJO3XYHPW9Kgb9Vu6BoG?=
 =?us-ascii?Q?eSvMpgYz/SyJ5gElmoBjT3sId/2O92tv1ldXlyyPuCtXLeYJt/mLEow38tA6?=
 =?us-ascii?Q?cCKgX3iB6B8+liYbMAIXX1MtCciJ1Xss4M6Uurn9aJYf8Y7Lv5r4v/zrAs3D?=
 =?us-ascii?Q?gIdtUCt3uBUlQnTTEcMP4C8yRsESSxYN+VZc/ChWTAcFCcdvV5E3DVPG+HDr?=
 =?us-ascii?Q?4vIhOR4JewvH7GHKzSIZAX49sU93g9uicsbJoAmFm18eme5ezBLmb9fZX2cQ?=
 =?us-ascii?Q?qaSk657XAoLElOLnzFbTY4BQwuPiMupTnl99EIjOHIZUM3xXn0/ZGvaDCmGo?=
 =?us-ascii?Q?XW6mEgXJhniDnsMdzyqk69zWwwbNUfXhe5+eAyvQQ0kYY10u3AVz5LGWin0g?=
 =?us-ascii?Q?YCRTA7gRPy5K6K7xicooqBfNMUlwP2ehQsfQiVgZW5M04VsgMcUBKV40mQA6?=
 =?us-ascii?Q?9DwPvz9ScHl07L9DI6NMEGMQi/rR+58fIa2xTm1x/+kc6DCIGip3MdEA8fem?=
 =?us-ascii?Q?aj4OGkuCBKFOjgM2ug0eUllpchkH0Q/mD4ECjgBLRbtvw+uJ2A=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 248b3b2e-632a-48db-a2c5-08deb67c2ce8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:29:18.1434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7856

On Mon, May 18, 2026 at 03:55:08PM +0200, neil.armstrong@linaro.org wrote:
> On 5/16/26 00:19, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
> > on the TD4310 controller IC. It measures approximately 5.5 inches
> > diagonally and is 1080x1920 in resolution.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                 |  10 +
> >   drivers/gpu/drm/panel/Makefile                |   1 +
> >   drivers/gpu/drm/panel/panel-anbernic-td4310.c | 291 ++++++++++++++++++
> >   3 files changed, 302 insertions(+)
> >   create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
> > 
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index d592f4f4b939..61dd00297ecc 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -17,6 +17,16 @@ config DRM_PANEL_ABT_Y030XX067A
> >   	  Y030XX067A 320x480 3.0" panel as found in the YLM RG-280M, RG-300
> >   	  and RG-99 handheld gaming consoles.
> > +config DRM_PANEL_ANBERNIC_TD4310
> > +	tristate "Anbernic TD4310 LCD panel"
> > +	depends on GPIOLIB && OF
> > +	depends on DRM_MIPI_DSI
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	help
> > +	  Say Y here to enable support for Anbernic designed panels with the
> > +	  TD4310 panel controller such as the ones used on the Anbernic RG
> > +	  Vita Pro.
> > +
> >   config DRM_PANEL_ARM_VERSATILE
> >   	tristate "ARM Versatile panel driver"
> >   	depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index a4291dc3905b..9d8f70c9de3e 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -1,5 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   obj-$(CONFIG_DRM_PANEL_ABT_Y030XX067A) += panel-abt-y030xx067a.o
> > +obj-$(CONFIG_DRM_PANEL_ANBERNIC_TD4310) += panel-anbernic-td4310.o
> >   obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
> >   obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
> >   obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
> > diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
> > new file mode 100644
> > index 000000000000..733c68ff9771
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
> > @@ -0,0 +1,291 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Anbernic panels with TD4310 panel controller.
> > + *
> > + * Copyright (C) 2026 Chris Morgan <macromorgan@hotmail.com>
> > + *
> > + */
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +struct anbernic_panel_td4310_info {
> > +	const struct drm_display_mode *display_modes;
> > +	unsigned int num_modes;
> > +	u16 width_mm;
> > +	u16 height_mm;
> > +	u32 bus_flags;
> > +	unsigned long mode_flags;
> > +	u32 format;
> > +	u32 lanes;
> > +	u16 prepare_delay;
> > +	u16 reset_delay;
> > +	u16 init_delay;
> > +	u16 enable_delay;
> > +	u16 disable_delay;
> > +	u16 unprepare_delay;
> > +};
> > +
> > +struct anbernic_panel_td4310 {
> > +	struct device *dev;
> > +	struct mipi_dsi_device *dsi;
> > +	struct drm_panel panel;
> > +	const struct anbernic_panel_td4310_info *panel_info;
> > +	struct gpio_desc *reset_gpio;
> > +	struct gpio_desc *enable_gpio;
> > +	struct regulator *vdd;
> > +	enum drm_panel_orientation orientation;
> > +};
> > +
> > +static inline struct anbernic_panel_td4310 *panel_to_anbernic_panel_td4310(struct drm_panel *panel)
> > +{
> > +	return container_of(panel, struct anbernic_panel_td4310, panel);
> > +}
> > +
> > +static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
> > +{
> > +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> > +	struct mipi_dsi_device *dsi = ctx->dsi;
> > +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> > +	int ret;
> > +
> > +	ret = regulator_enable(ctx->vdd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (ctx->enable_gpio) {
> 
> Drop the if, gpiod_set_value_cansleep will check a return if the gpio desc is NULL.
> 
> > +		ret = gpiod_set_value_cansleep(ctx->enable_gpio, 1);
> > +		if (ret)
> > +			goto err_enable;
> > +	};
> > +
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +	mipi_dsi_msleep(&dsi_ctx, 10);
> > +
> > +	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +	if (ret)
> > +		goto err_reset;
> > +	if (ctx->panel_info->reset_delay)
> > +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->reset_delay);
> > +	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +	if (ret)
> > +		goto err_reset;
> > +
> > +	if (ctx->panel_info->enable_delay)
> > +		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->enable_delay);
> > +
> > +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +	mipi_dsi_msleep(&dsi_ctx, 100);
> > +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +	mipi_dsi_msleep(&dsi_ctx, 100);
> > +
> > +	return dsi_ctx.accum_err;
> > +
> > +err_reset:
> 
> And you don't check it here

Should I check the value and print an error if it fails? I had planned
on continuing even after a failure with the shutdown so it could turn
the device off, unless that's incorrect.

> 
> > +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > +err_enable:
> > +	regulator_disable(ctx->vdd);
> > +	return ret;
> > +}
> > +
> > +static int panel_anbernic_td4310_unprepare(struct drm_panel *panel)
> > +{
> > +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> > +	struct mipi_dsi_device *dsi = ctx->dsi;
> > +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> > +
> > +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > +	mipi_dsi_msleep(&dsi_ctx, 120);
> > +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > +	mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +	if (ctx->enable_gpio)
> 
> Ditto

I'll remove the if, is it okay to not check the return value since I'm
going to continue anyway or should I check and error (and then
continue).

> 
> > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > +
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +
> > +	regulator_disable(ctx->vdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static int panel_anbernic_td4310_get_modes(struct drm_panel *panel,
> > +				    struct drm_connector *connector)
> > +{
> > +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> > +	const struct anbernic_panel_td4310_info *panel_info = ctx->panel_info;
> > +	struct drm_display_mode *mode;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < panel_info->num_modes; i++) {
> > +		mode = drm_mode_duplicate(connector->dev,
> > +					  &panel_info->display_modes[i]);
> > +		if (!mode)
> > +			return -ENOMEM;
> > +
> > +		drm_mode_set_name(mode);
> > +
> > +		mode->type = DRM_MODE_TYPE_DRIVER;
> > +		if (panel_info->num_modes == 1)
> > +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> > +
> > +		drm_mode_probed_add(connector, mode);
> > +	}
> 
> Can you add support for a sinlge mode right now, call drm_connector_helper_get_modes_fixed()
> and implement support for multiple modes when a panel needs it ?
> 

Sounds like a plan, thank you.

> > +
> > +	connector->display_info.bpc = 8;
> > +	connector->display_info.width_mm = panel_info->width_mm;
> > +	connector->display_info.height_mm = panel_info->height_mm;
> > +	connector->display_info.bus_flags = panel_info->bus_flags;
> > +
> > +	return panel_info->num_modes;
> > +}
> > +
> > +static enum drm_panel_orientation panel_anbernic_td4310_get_orientation(struct drm_panel *panel)
> > +{
> > +	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
> > +
> > +	return ctx->orientation;
> > +}
> > +
> > +static const struct drm_panel_funcs panel_anbernic_td4310_funcs = {
> > +	.prepare = panel_anbernic_td4310_prepare,
> > +	.unprepare = panel_anbernic_td4310_unprepare,
> > +	.get_modes = panel_anbernic_td4310_get_modes,
> > +	.get_orientation = panel_anbernic_td4310_get_orientation,
> > +};
> > +
> > +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct device *dev = &dsi->dev;
> > +	struct anbernic_panel_td4310 *ctx;
> > +	int ret;
> > +
> > +	ctx = devm_drm_panel_alloc(dev, struct anbernic_panel_td4310, panel,
> > +				   &panel_anbernic_td4310_funcs,
> > +				   DRM_MODE_CONNECTOR_DSI);
> > +	if (IS_ERR(ctx))
> > +		return PTR_ERR(ctx);
> > +
> > +	ctx->dev = dev;
> > +
> > +	ctx->panel_info = of_device_get_match_data(dev);
> > +	if (!ctx->panel_info)
> > +		return -EINVAL;
> > +
> > +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to get panel orientation\n");
> > +
> > +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > +				     "Cannot get reset gpio\n");
> > +
> > +	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(ctx->enable_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
> > +				     "Cannot get enable gpio\n");
> > +
> > +	ctx->vdd = devm_regulator_get(dev, "vdd");
> > +	if (IS_ERR(ctx->vdd))
> > +		return dev_err_probe(dev, PTR_ERR(ctx->vdd),
> > +				     "Failed to request vdd regulator\n");
> > +
> > +	ctx->dsi = dsi;
> > +	mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +	dsi->lanes = ctx->panel_info->lanes;
> > +	dsi->format = ctx->panel_info->format;
> > +	dsi->mode_flags = ctx->panel_info->mode_flags;
> > +
> > +	ret = drm_panel_of_backlight(&ctx->panel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_panel_add(&ctx->panel);
> 
> devm_drm_panel_add()
> 

Will do.

> > +
> > +	ret = mipi_dsi_attach(dsi);
> 
> devm_mipi_dsi_attach()
> 

Will do.

> > +	if (ret < 0) {
> > +		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
> > +		drm_panel_remove(&ctx->panel);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void panel_anbernic_td4310_remove(struct mipi_dsi_device *dsi)
> > +{
> > +	struct anbernic_panel_td4310 *ctx = mipi_dsi_get_drvdata(dsi);
> > +	int ret;
> > +
> > +	ret = mipi_dsi_detach(dsi);
> > +	if (ret < 0)
> > +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> > +
> > +	drm_panel_remove(&ctx->panel);
> > +}
> 
> And drop remove completely
> 

I take it the devm calls above remove the need for a remove callback?
I take it that's new? Thank you.

> > +
> > +static const struct drm_display_mode anbernic_vitapro_modes[] = {
> > +	{
> > +		.clock = 140020,
> > +		.hdisplay = 1080,
> > +		.hsync_start = 1080 + 50,
> > +		.hsync_end = 1080 + 50 + 4,
> > +		.htotal = 1080 + 50 + 4 + 50,
> > +		.vdisplay = 1920,
> > +		.vsync_start = 1920 + 15,
> > +		.vsync_end = 1920 + 15 + 4,
> > +		.vtotal = 1920 + 15 + 4 + 32,
> > +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	},
> > +};
> > +
> > +static const struct anbernic_panel_td4310_info anbernic_vitapro_info = {
> > +	.display_modes = anbernic_vitapro_modes,
> > +	.num_modes = ARRAY_SIZE(anbernic_vitapro_modes),
> > +	.width_mm = 69,
> > +	.height_mm = 121,
> > +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
> > +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> > +	.format = MIPI_DSI_FMT_RGB888,
> > +	.lanes = 4,
> > +	.prepare_delay = 50,
> > +	.reset_delay = 220,
> > +	.enable_delay = 120,
> > +	.disable_delay = 50,
> > +	.unprepare_delay = 20,
> > +};
> > +
> > +static const struct of_device_id panel_anbernic_td4310_of_match[] = {
> > +	{
> > +		.compatible = "anbernic,panel-vita-pro",
> > +		.data = &anbernic_vitapro_info,
> > +	},
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, panel_anbernic_td4310_of_match);
> > +
> > +static struct mipi_dsi_driver anbernic_panel_td4310_driver = {
> > +	.driver = {
> > +		.name = "panel-anbernic-td4310",
> > +		.of_match_table = panel_anbernic_td4310_of_match,
> > +	},
> > +	.probe	= panel_anbernic_td4310_probe,
> > +	.remove = panel_anbernic_td4310_remove,
> > +};
> > +module_mipi_dsi_driver(anbernic_panel_td4310_driver);
> > +
> > +MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
> > +MODULE_DESCRIPTION("DRM driver for Anbernic TD4310 MIPI DSI panels");
> > +MODULE_LICENSE("GPL");
> 
> Thanks,
> Neil

Thank you,
Chris
