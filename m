Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3139B951
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433935; cv=none; b=dQUvsjbsoMBguquA0y7n4i/R4rFu/uwG0mIYaPM1ePWqOfSrnHOzW7MHZO806dZe8E6PrUgNj5bEQDlFqWULrdrKCZthWKJHJzudPhHRwHHj/vbwiha7aG67HFIGLq3UljsIPRopnmqcN36ZiFtrzFlljsZ/Fe3tME8Qlft76W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433935; c=relaxed/simple;
	bh=jsLz9QPCZ657lh+kQV+wCuFG8MjRyfgZqPGbEHb+ODs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtmuxIDPc7YiZFrZZIDsTZtctXTdIk11PC1Dos1J8zPKobz6Wjwm0d2GzktnIvN3dRo8hC64iOR8ru4ygR770UblYi1OABQxUXJqhG3K1CJxQvb4MF9DySs1pBFQU8gGImZvS7Wr6a1bsxELoJkGwBSvZUBAr82mBF7Iga7z59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X6MOycuK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X6MOycuK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so45880675e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774433932; x=1775038732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBzgoYZDjhTKxl6obsy4HR8kQLZOhNu4r9GMkjdheHo=;
        b=X6MOycuK0Czo8l3C17E0su5Vi1Q9pTorLHt4mMpyG5iLbX3EgNMjXvBKYdhJaoongr
         sT3kIqbN3HNCy722gRRgcCuX5LEnTgo0Sy20754VE+ZspFBLPFVVwQ6kjFbNUuLnOIxE
         rbTvCUC28cO8u2Hyh9XxN5NyncfbelQoIcCEB8nd2Tkr0vAQKRzOloO4XH6Y9LKRmMSu
         F1cHTB8+R9KM4/ZTCFDVhfOHhJ6E2DvVzVpkrmkElyk+BREljFFbd1XXpTV6Gpi7gHgi
         x1x3YlxVha7lfOQ/a5F9Nppxi7kuU0lZg5FLkVFbsDQEdXDWWbh31KrOpoyT2SQVKk2+
         qL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433932; x=1775038732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBzgoYZDjhTKxl6obsy4HR8kQLZOhNu4r9GMkjdheHo=;
        b=UcPtdAxCOwFVgyNsSKs4PV1OlyWAOgaKEASvqB7BxBD/nFlQsY1HYMHJM4m7xjHigs
         XmIxLcWyvCEwToghzciIYM4m1vaOKGw8pbAUmUz20NqAcQ9Xg6aWJsnQdLjuNAmwu6WX
         qw8IlgpGbLFUyo74TB/GiBErcRBZ4DusdZyAHUJL4frIWxD9+9r3dp3aNC8mFwNtVgdo
         6Lw+XLuLwjGohUczyIzv2vweiMg5ov+9zBqxEz6URIgr4ReqXNCtyd9ubJW1FX+0lNAq
         jPxAT8k02q4O3PlGCRiyQXTHRzmk9S8njJrt2kAwT2Tc/6mHGFARb1XvJbsdiTKcavP3
         J1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAi/vGBx90yD7GqHLKx9GxApB3LsUgEIMU+hL4fRIeEhE1/QBI0X8qYJeBrGxzR4axExdEB4gv2v4b@vger.kernel.org
X-Gm-Message-State: AOJu0YzeI1eiBT/mr9gQF0O65Jz0NeV2n+5FGnAFke3S+VhmHXJoHdbH
	HK4UAWpF6mBtwNtRJCv0zi5NjCVYOkAmnmNAZ17Aeh9Sq47cFmZpXfNUSiunLYN/ZYo=
X-Gm-Gg: ATEYQzzqpCw03EP0cG6v15k5Fdp21FBM2cbtsUzREa5nTbqGVmS9mOyfeYJ/4GOypS1
	E+w93m0OS0h0HqbClAFTHsrhQsz954dcIBAKtrxukByoqQuPyAr90M/RKchFLKXDvT018ySUCnj
	ncyd914wlmv8FfbnFRyfBhTtphvpuRj/pTb9AyWPB+ADBFPMALMR/ZEY/P0vfkJ7rml/Sg/LjVF
	f7XtEoD05tqEzsXClmOEgAWqvCJJA+AZCBu4TRc4xN4Jj3damx1OdxxOz0Y89EVaGEJK5BaIJjd
	qwMBSDaGIiVpUqA7JMetgvgulSRWqrZD5DQLgrRH5Y+Wt4FhFPKDm7522tD22cqIxGCVoHEjKfx
	ngMZvCZ4EawlQOaMlVd3Itd+sGkf74dUhtlMbmr3HGaH7bo5l5B0G3uz7z1aYDWDnGhu//yV631
	uO31++L/SPVBxAtC20k72UoL2f3dewsvY=
X-Received: by 2002:a05:600c:5296:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-4871605bdffmr43328175e9.25.1774433931616;
        Wed, 25 Mar 2026 03:18:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871736befbsm16244365e9.25.2026.03.25.03.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:18:51 -0700 (PDT)
Message-ID: <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
Date: Wed, 25 Mar 2026 12:18:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 3/18/26 14:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> driver.
> 
> The RZ/V2H(P) SoC features two independent PCIe channels that share
> physical lanes. The hardware supports two configuration modes: single
> x4 mode where one controller uses all four lanes, or dual x2 mode
> where both controllers use two lanes each.
> 
> Introduce configure_lanes() function pointer to configure the PCIe
> lanes based on the number of channels enabled. Implement
> rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> boot time and program the lane mode via the system controller using
> the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 142 +++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index a629e861bbd0..d1bf1e750d9b 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -179,6 +179,16 @@
>   /* Timeouts experimentally determined */
>   #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
>   
> +/**
> + * enum rzg3s_sysc_link_mode - PCIe link configuration modes
> + * @RZG3S_SYSC_LINK_MODE_SINGLE_X4: Single port with x4 lanes
> + * @RZG3S_SYSC_LINK_MODE_DUAL_X2: Dual ports with x2 lanes each
> + */
> +enum rzg3s_sysc_link_mode {
> +	RZG3S_SYSC_LINK_MODE_SINGLE_X4 = 1,
> +	RZG3S_SYSC_LINK_MODE_DUAL_X2 = 3,
> +};
> +
>   /**
>    * struct rzg3s_sysc_function - System Controller function descriptor
>    * @offset: Register offset from the System Controller base address
> @@ -194,12 +204,14 @@ struct rzg3s_sysc_function {
>    * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
>    * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
>    * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
> + * @RZG3S_SYSC_FUNC_ID_LINK_MASTER: Link master SYSC function ID
>    * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
>    */
>   enum rzg3s_sysc_func_id {
>   	RZG3S_SYSC_FUNC_ID_RST_RSM_B,
>   	RZG3S_SYSC_FUNC_ID_L1_ALLOW,
>   	RZG3S_SYSC_FUNC_ID_MODE,
> +	RZG3S_SYSC_FUNC_ID_LINK_MASTER,
>   	RZG3S_SYSC_FUNC_ID_MAX,
>   };
>   
> @@ -261,6 +273,7 @@ struct rzg3s_pcie_host;
>    * @config_pre_init: Optional callback for SoC-specific pre-configuration
>    * @config_post_init: Callback for SoC-specific post-configuration
>    * @config_deinit: Callback for SoC-specific de-initialization
> + * @setup_lanes: Callback for setting up the number of lanes
>    * @power_resets: array with the resets that need to be de-asserted after
>    *                power-on
>    * @cfg_resets: array with the resets that need to be de-asserted after
> @@ -268,17 +281,20 @@ struct rzg3s_pcie_host;
>    * @sysc_info: System Controller info for each PCIe channel
>    * @num_power_resets: number of power resets
>    * @num_cfg_resets: number of configuration resets
> + * @num_channels: number of PCIe channels
>    */
>   struct rzg3s_pcie_soc_data {
>   	int (*init_phy)(struct rzg3s_pcie_host *host);
>   	void (*config_pre_init)(struct rzg3s_pcie_host *host);
>   	int (*config_post_init)(struct rzg3s_pcie_host *host);
>   	int (*config_deinit)(struct rzg3s_pcie_host *host);
> +	int (*setup_lanes)(struct rzg3s_pcie_host *host);
>   	const char * const *power_resets;
>   	const char * const *cfg_resets;
>   	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CHANNEL_ID_MAX];
>   	u8 num_power_resets;
>   	u8 num_cfg_resets;
> +	u8 num_channels;
>   };
>   
>   /**
> @@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
>    * @intx_irqs: INTx interrupts
>    * @max_link_speed: maximum supported link speed
>    * @channel_id: PCIe channel identifier, used for System Controller access
> + * @num_lanes: The number of lanes
>    */
>   struct rzg3s_pcie_host {
>   	void __iomem *axi;
> @@ -325,6 +342,7 @@ struct rzg3s_pcie_host {
>   	int intx_irqs[PCI_NUM_INTX];
>   	int max_link_speed;
>   	enum rzg3s_pcie_channel_id channel_id;
> +	u8 num_lanes;
>   };
>   
>   #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
> @@ -1155,6 +1173,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
>   			       field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
>   
> +	if (host->num_lanes) {
> +		rzg3s_pcie_update_bits(host->pcie + RZG3S_PCI_CFG_PCIEC,
> +				       PCI_EXP_LNKCAP, PCI_EXP_LNKCAP_MLW,
> +				       FIELD_PREP(PCI_EXP_LNKCAP_MLW,
> +						  host->num_lanes));
> +	}
> +
>   	/* Disable access control to the CFGU */
>   	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
>   
> @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>   	return ret;
>   }
>   
> +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
> +{
> +	struct device_node *np = host->dev->of_node;
> +	u32 domain;
> +	int ret;
> +
> +	if (host->data->num_channels == 1)
> +		return 0;
> +
> +	ret = of_property_read_u32(np, "linux,pci-domain", &domain);

This introduces some limits in the systems with RZ/V2H(P) SoCs with regards to 
the usage of linux,pci-domain. I would like the PCIe maintainers take on this.

As this is necessary to index in the system controller driver specific data (as 
there are different SYSC offsets for different PCIe controllers) I see the 
following alternatives, if any:

1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to specify the
    system controller register offset and mask for different functionalities.

    E.g.:
    renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
    renesas,sysc-mode = <&sysc 0x1024 0x1>;
    renesas,sysc-link-master = <&sysc 0x1060 0x300>;

    And use them in each controller DT node. E.g.:

    pcie0: pcie@add1 {
        // ...

        renesas,sysc-l1-allow = <&sysc 0x1020 0x1>;
        renesas,sysc-mode = <&sysc 0x1024 0x1>;
        renesas,sysc-link-master = <&sysc 0x1060 0x300>;

        // ...
    };

    pcie0: pcie@add1 {
        // ...

        renesas,sysc-l1-allow = <&sysc 0x1050 0x1>;
        renesas,sysc-mode = <&sysc 0x1054 0x1>;
        renesas,sysc-link-master = <&sysc 0x1060 0x300>;

        // ...
    };

3/ as sashiko.dev mentions [1], using aliases for the PCIe nodes should also be
    what you need here.

[1] 
https://sashiko.dev/#/patchset/20260318124450.163471-1-prabhakar.mahadev-lad.rj%40bp.renesas.com

> +	if (ret)
> +		return ret;
> +
> +	if (domain >= host->data->num_channels)
> +		return -EINVAL;
> +
> +	host->channel_id = domain;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
> +{
> +	struct device_node *np = host->dev->of_node;
> +	static u8 rzv2h_num_total_lanes;
> +	u32 num_lanes;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "num-lanes", &num_lanes);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode.
> +	 * Dual x2 mode is only supported with 2 total lanes. Validate
> +	 * the configuration to avoid conflicts with other host, if any.
> +	 */
> +	if (num_lanes != 4 && num_lanes != 2)
> +		return -EINVAL;
> +
> +	if (rzv2h_num_total_lanes == 2 && num_lanes != 2)
> +		return -EINVAL;
> +
> +	if (rzv2h_num_total_lanes == 4)
> +		return -EINVAL;
> +
> +	rzv2h_num_total_lanes += num_lanes;

There is a a valid concern raised by sashiko.dev [1] with regards to 
incrementing this if later the probe fails:

from [1]:
"For example, if rzg3s_pcie_resets_prepare_and_get() returns -EPROBE_DEFER,
the static variable is never decremented. On subsequent probe retries,
the variable will be artificially inflated, eventually causing the bounds
check to fail and returning a permanent -EINVAL. This would also prevent
driver unbind and rebind from working correctly."

also:

"Additionally, since the driver sets .probe_type = PROBE_PREFER_ASYNCHRONOUS,
could multiple PCIe controllers probing concurrently cause a data race when
reading and modifying this static variable without locking?"

> +
> +	host->num_lanes = num_lanes;
> +
> +	return rzg3s_sysc_config_func(host->sysc,
> +				      RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> +				      num_lanes == 2 ?
> +				      RZG3S_SYSC_LINK_MODE_DUAL_X2 :
> +				      RZG3S_SYSC_LINK_MODE_SINGLE_X4);

I think this one should also be configured on resume (to have the same 
configuration sequence as in probe) even though RZ/V2H(P) don't currently 
support s2ram. E.g. so something like:

if (host->num_lanes) {
	ret = rzg3s_sysc_config_func(host->sysc,
				     RZG3S_SYSC_FUNC_ID_LINK_MASTER,
				     host->num_lanes == 2  ?
				     RZG3S_SYSC_LINK_MODE_DUAL_X2 :
				     RZG3S_SYSC_LINK_MODE_SINGLE_X4);
	if (ret)
		goto assert_rst_rsm_b;
}

after ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);

Thank you,
Claudiu
