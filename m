Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569122;
	b=iomr3hSM4ZoJs+HQq8tdYS1uRP6mNxUpL91ypu1XHcdmVutAsJqZErNWwfow10F/wKoD
	 B+3IWvi4Me/TM3Dc3FcrBqm/qT6j+CngG5ECS3VpZcNc3Jle/6FjZXMMpsRYMHk/r6SZA
	 4XsBGCuFE4JswZfxks1czL/IaU4WhuW5mvUaDoTkgrBZyLHLSEqa7uqjwzFXY9oVZahGM
	 /6sDor54+nrSabVh8ZCWABC5UMmLTHwJ6+HdV3yDrUZlft5dsNsnCiq2GOkvDFv0BNbFx
	 Rnm9XZoO77IZFG0ud8vLaboH+iNE7JXoz3p+Pc49kwU4et2X8NNYsCDUqFCPJEXNFTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
	b=wdtPWGq3DRQAaLVY54VrqKptJT5CIbpLLD/HWY2ussK5hvadzb/xj1l7PNLnNEL7vQ/T
	 gaz52RGh0SKlwgrTADUJTZ5Zlkk5SvXKMD3VMuZLRm5UfPMK0Bu91ZEQSzkIzvI+zbF8J
	 xa7oWJjmrJ4q+dFvHWEVK29SR9H9sAJH5VqHTsf9dIBW8CmR+6q1PFGf41TNXkgGtcgtz
	 fh/CL6kNCHoStgLZyO+kSQjAl3Ambx39a7+BmwBCR0M5pxsPGDJwN0aCz4oQ6oeg6gMS5
	 ILlA3QPUGLlAynI7DxnGAhnTd+QFVRyvWryi5I7+mCBWdQmEzH5wea2AvE+iWBgPcHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dl3cWGbt;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651FC606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dl3cWGbt
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06210b29fso157387b3a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569122; x=1793173922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=Dl3cWGbt7PByiH5Gy0or91Cs6az0Q8L4qaP0166Uwyz/aYwOiCPXvcE5eyamjstWGK
         7Bd4EkdEcbDheUu6IS6Q4f5AU9DIU12ejarYY4dRgWhOiR74si8DNPypEtUPIbFsuLS7
         qFE5JwOiKZRhK7wDOBdLrpnRJLccQo7gH1iLpgqFheu0JkbfchtOYNvAYYKSSb+UZm3S
         rf1X1gWbqS21bE0WvpKHlZTi5kOTU8ZCULACoEb0SD+NFklhvI9mGh4KGNKki9+yuSPR
         RbE533gedaAhbYCNvbNVIsAxOMZIaQqNXM7//SELGHqtHk9eyhwMxi2VZ0SVW0lQ+kHu
         Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569122; x=1793173922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=osqac8WiwSaa3UHMy2NMABdvB0jDJ/AiELPyJMLJntqYKzG2uip2v3eZNAFRk9Nhhq
         2y1rSuFKp8MX+fwbo06haEwlH9Tqhr/BcYW9/hoV5fEMAA3dKaUUknS7/Omo21dS4DQx
         uUAZdbJSOCpMt7dWlG+X1Vp+XisLOAS1NrQbUtGAjr/0xD5o5kjM8y4gviKvv7AnONg9
         kXOZ2yo8hwpMCkpF9bADpLcV9T8IwIdt/iVIy17b0Yp8aA4P9FA0w+jvzDuxJ29GNJe1
         5MxuQEZn9Z8sT76LKjs974EtX94mca0DmMbhy4UFdtCw4YGWxB9k+23SuICDMkcES9/z
         dMSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIOezcFUO93L7ph9JhauJ+kR7RCZD3K/1PlGWMseC/reArLNGpubwhUYaVnUVVnCjuLMEveFu+Vo3R@vger.kernel.org
X-Gm-Message-State: AFq9FYLSwpU7/8GBYXXmui8DbwxkCa2zamKGhIfwqXBu+Ub1rBKIAmL6
	IIqM3HdtDROVVXptteN9z4YHtLiN2ok/FBKDC1U8voVq8I2N09iFRNxN
X-Gm-Gg: AYBFou0/eus3TTh2qAKVmVjPtwo4GS03j/xOSBDTefR9cK5vHx9EXbeDGG2NlhYSS1M
	hflZEiOeJoDpm9hc9O+o3OBZy3WDGjK+frt6bTcLicar+0M0BGO4PC4FhcRMn/4N1Lc8vBBwiij
	mul7/FPdMJAmusYKf309urigDhhZw45Yt8rBxIh9NKtQa0XgrkYNQTCpM0/TtZ2o8mdelv+1uBG
	npEuNm6yDLKTj+7g2KbtblfDcrJPr9ky7bGKQjy6DtkHZgMs+Nn4bCagZiVEKR+5re0a81m6blY
	+s1UD1MotmZ8aHkGD7yr4f3+7k/a7LoPRfB5rsWgwzp63XQ5DHq3nsxOMKlMoVRqu7PZkKPUw3x
	wfjlPsUCILV95rV+BB1b1ma0sZI3Rn5AhVCk7QL8PxDC9zfiXoT3DimLK3ywf1x2pqWnyalBdZ+
	K0VhKluVRKhfklnoCvd2MEzm9TSt5U6ZF2FARhWaDjvAlbuhs1AIuJcWlDvOqa1Apgv4WOyNE6H
	tk7bjfe/rkgris50kSGNX9YqkOeDvIWfjjtDrbPNN2nNmkYnHnj/g==
X-Received: by 2002:a05:6a00:a90b:b0:89e:a122:fa28 with SMTP id d2e1a72fcca58-8a089e1f48dmr1074589b3a.12.1792569121569;
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm548529b3a.49.2026.10.21.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:51:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <athuYJjPMkrecGm3@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019164108.GA2177470@bhelgaas>

On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 0564c46e2f48..ab2953ad8f56 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -45,8 +45,17 @@
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> >  
> > +struct k1_pcie;
> > +
> > +struct k1_pcie_device_data {
> > +	const struct dw_pcie_host_ops *host_ops;
> > +	const struct dw_pcie_ops *ops;
> > +	int (*parse_port)(struct k1_pcie *k1);
> > +};
> 
> Does the "const" here add anything useful?  This patch suggests maybe
> not:
> 
>   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> 

I am not sure whether the compiler can make use it.
And I have not seen any explaination for why no reason
for that. It is good to have a clarification.

Regards,
Inochi


> > +
> >  struct k1_pcie {
> >  	struct dw_pcie pci;
> > +	const struct k1_pcie_device_data *data;
> >  	struct phy *phy;
> >  	void __iomem *link;
> >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > @@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODATA;
> > +
> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> >  
> > +	k1->data = data;
> > +
> >  	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
> >  						       SYSCON_APMU, 1,
> >  						       &k1->pmu_off);
> > @@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  				     "failed to map \"link\" registers\n");
> >  
> >  	k1->pci.dev = dev;
> > -	k1->pci.ops = &k1_pcie_ops;
> > +	k1->pci.ops = data->ops;
> >  	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
> >  	dw_pcie_cap_set(&k1->pci, REQ_RES);
> >  
> > -	k1->pci.pp.ops = &k1_pcie_host_ops;
> > +	k1->pci.pp.ops = data->host_ops;
> >  
> >  	/* Hold the PHY in reset until we start the link */
> >  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> > @@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, k1);
> >  
> > -	ret = k1_pcie_parse_port(k1);
> > +	ret = data->parse_port(k1);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to parse root port\n");
> >  
> > @@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
> >  	dw_pcie_host_deinit(&k1->pci.pp);
> >  }
> >  
> > +static const struct k1_pcie_device_data k1_pcie_device_data = {
> > +	.host_ops	= &k1_pcie_host_ops,
> > +	.ops		= &k1_pcie_ops,
> > +	.parse_port	= k1_pcie_parse_port,
> > +};
> > +
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> > -	{ .compatible = "spacemit,k1-pcie", },
> > +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
> > -- 
> > 2.55.0
> > 
