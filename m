Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622570;
	b=IUvtsiJJ0K5CcJmod1k8Wo4IehHHefBmnq2qFzgprKF/Fn2RVhblTlB2d3aBH5SxHWTw
	 /yVeP+bwEOEFJk8I+3SiP65eHKkxAXJf1j/Khn0ZLnyHtsmEFJep++Nh8XDArlVj2PDkv
	 FEG18GSMoLqoinN8ZJo502zJU4LFJrfO76zkWCis/63AKbAV0XsRbq53SAd27phtMwmy1
	 tmhWl57wVMYTKiSL/fONTT7gLGwRBog9E5+S6rrGZDzQhxl4UfRlyFuTbJh8dbJ97ytTT
	 pbjTeKT2FOjb9ur8sQbyB+E8lBY3sydaa0pgj1oYRTk+ci+ybzrW1YPkUT7WzKcZIRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622570;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ndbQ4zOYDp69YxH+vSmF4c25f0epkpIi0n8RI4ocFgM=;
	b=PFV8J3EurvAJ4Remz9HQdkNcD0h9PE+z3vbg3PzJ7BdV2uMWZmoQx0wNBrK3A5k30Ga0
	 N79EHzOvmHm4N+y+hTi3Tw8UR/tMCsb4rVxAtbHgetwQwSSfVQlA05gKmtMZ7sU+E51ck
	 RuqoGeEvMDkxKIsSdz1Gb8VMwXnjgEcGwGOjV3yEEOsyivMC0L0zlD2vlHZoRX8AnELgL
	 pPKYyk2/zzR/aPBxjRU90kDzsl8XHXnNCeNXHp0YN/8XfTP2n9QMbI5+21Roro5dbt+ab
	 iGmhT5MRLQlfAyM4EN6jkPlhJRYZwhuhEIbGqPm4r/gn9rPyK9r5Dl/pZZNWyJOi7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=e1U02Z80;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440B606A336;
	Wed, 25 Nov 2026 16:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1440B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=e1U02Z80
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125160245euoutp01643ec134cd0c29416f15b98b4c0d8cc6~rVTXAYGFq2394723947euoutp01V;
	Wed, 25 Nov 2026 16:02:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125160245euoutp01643ec134cd0c29416f15b98b4c0d8cc6~rVTXAYGFq2394723947euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795622565;
	bh=ndbQ4zOYDp69YxH+vSmF4c25f0epkpIi0n8RI4ocFgM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e1U02Z80qtk/nwxit57Qm6MpSrKZqhLaXn1xXYc34Vn0Eip6382b1av0O6PBF68d/
	 B+Dumn3anLrajMn3xyffUdgm+em8ubtrl2UA1YPq6TqsDRgnUrgdx/z+eBTbv/89Nr
	 BFOGepG56xBXw0iJaV/CwLUtCghah3S95AlnkChA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125160245eucas1p1beac30b8fac0db60d40e99f0990a67bf~rVTWtiIWT1277212772eucas1p1A;
	Wed, 25 Nov 2026 16:02:45 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125160243eusmtip277776f891a27dfa466a595a92f06eb14~rVTVBDesA3197031970eusmtip2F;
	Wed, 25 Nov 2026 16:02:43 +0000 (GMT)
Message-ID: <f432f455-f393-49f6-94e1-48caf1e35565@samsung.com>
Date: Wed, 25 Nov 2026 17:02:43 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/18] drm/bridge: starfive: Add JH7110 HDMI
 controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Emil Renner
	Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Heiko
	Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Andy Yan
	<andyshrk@163.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Yakir Yang <kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Byron Stanoszek <gandalf@winds.org>,
	Owen O'Hehir <oo.hehir@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <831aebd692fc5ddbbd1cf57f1aad3bcc0d3f30d2.camel@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125160245eucas1p1beac30b8fac0db60d40e99f0990a67bf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6
X-EPHeader: CA
X-CMS-RootMailID: 20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155429eucas1p1015c7cd9beec294fefdcd6900dd407f6@eucas1p1.samsung.com>
	<20261124-jh7110-clean-send-v8-16-de92635dd857@samsung.com>
	<831aebd692fc5ddbbd1cf57f1aad3bcc0d3f30d2.camel@pengutronix.de>



On 11/24/26 17:50, Philipp Zabel wrote:
> On Di, 2026-11-24 at 16:52 +0100, Michal Wilczynski wrote:
>> Add the HDMI controller (bridge) driver for the StarFive JH7110.
>>
> [...]
>>
>> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>> Tested-by: Byron Stanoszek <gandalf@winds.org>
>> Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/bridge/Kconfig            |  11 ++
>>  drivers/gpu/drm/bridge/Makefile           |   1 +
>>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c | 297 ++++++++++++++++++++++++++++++
>>  3 files changed, 309 insertions(+)
>>
> [...]
>> diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a0283f83ddc93e3e6c9e9192b73dca9a63f9d9ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
>> @@ -0,0 +1,297 @@
> [...]
>> +
>> +struct stf_inno_hdmi_controller {
>> +	struct clk_bulk_data clks[CLK_CTRL_NUM];
>> +	struct reset_control *tx_rst;
> 
> tx_rst is never used outside of starfive_inno_hdmi_controller_probe(),
> it could be a local variable.

agree, thanks will fix in v9

> 
>> +	struct phy *phy;
>> +	bool enabled;
>> +};
>> +
> [...]
>> +static void stf_inno_hdmi_rst_assert(void *data)
>> +{
>> +	reset_control_assert(data);
>> +}
>> +
>> +static int starfive_inno_hdmi_controller_probe(struct platform_device *pdev)
>> +{
> [...]
>> +	ctrl->tx_rst = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(ctrl->tx_rst))
>> +		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx reset\n");
>> +
> [...]
>> +
>> +	ret = reset_control_deassert(ctrl->tx_rst);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_rst_assert,
>> +				       ctrl->tx_rst);
>> +	if (ret)
>> +		return ret;
> 
> This looks like it could be simplified with
> devm_reset_control_get_exclusive_deasserted().

Yes I think this can be simplified, thanks !

> 
> regards
> Philipp
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
