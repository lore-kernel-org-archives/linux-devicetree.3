Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090632;
	b=glOqfCghRvKQLoZwtDaOURp7BygAE1bZDRkp99qg10ufEKYnYFeq1XY57pYkIz7XhSDb
	 xn4dii0bxAr8mKYmbmJTqdfdQ2OvBNJ6VnVdS/Uw2FAUN9dZDK1QNKoxTz5SIcgKJ9YHO
	 FrJvt265hUCxOdMIaipQ/hn7VdRvL/eJSFhIJjGtZjXJEjVTk6sO+Oj2niOv4wjYfM3h6
	 BZJIW1xmiAgFdiitiOhftOR7Gi69afSmu51i/04ZQQ9zyVWxuUbS+3X904zw7O14GBx8j
	 otjISDlnHrlQMlIK3mHJBqG/ZcZX/A77mSzuObYFsjpMLWpyyRnjgnWBcnFU1XUvsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
	b=5ESV8Vykcq+7hl4Mdvt4lh+/yBo0iGEnC6YYQt3bI33k3ckXKq9sz2qTdXQvB+g2VFxG
	 PGAdqXqxwzYhvnLmwb6sN8FvvawpwSWCD+IIuE5R1avTENUTyBycJ7C6klL3ZQjaGBiTy
	 8dvYheCLUC6vN9wksqXVCNNl0BYdCfe546LlCOYPmWRTAXQyKxEXwQU30p3v5M++6RzZD
	 +Smmzz6g/wlSs+9/0sT7oS3EREClfJUkMpNR1dKALnUHouMJ1MQ8i+S78KDK23KmCFyAr
	 X0IeV/Q9QQCX33IlgHBv5OF6MLmPUO9O2BoGQX8APvW0vD3P7dDlpiD0JnnCTpbGCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6h3MaKU;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E2606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6h3MaKU
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e60f9af6e6so33184415ad.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090631; x=1793695431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=X6h3MaKU/WaA/MnP0JtjHmvUoxo8La1Gi2rFdudPKo5jMX4Pg4Q1MAgw8PLeqeF0Qb
         KPt/u3uRBlseZ+5gw3ZikC6qiss0fDsz/WtBZwv3nHEGmGtpxEmcM2sE9EFH6fG4c5BA
         kx5j+7PLiQl8WBXroU8rS5DxbDa4TLqr7mJWdfcBu8yYXu8Dot79vSTVU1aiUtvVwMSx
         55BSa9oYtiKKuOzVzqL5/RPRWAVP9C+Il8GFhbstTvLRxa7DvUDUCsXlqatLpZqqQYuI
         CnBk51RdhO41gakhMBWpHtm5Vp8DoY/F4fq19tZ3melf0NZZoXoMEKBazIhCeKuRThws
         Ed9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090631; x=1793695431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdGWi2lCPsVOQrfWu4TCiPig1JxwAx4MQlsKT53PN3c=;
        b=NEBPspvuVJyJHuYVstudgL/yPP20zb5daOwmm88owrMd4DJ9ueKLJQTbEcKzndpgxf
         3c2b21I697sjXtZJGAUhskq0Q23BIZ0/iU/zlhMT9df3TlE5dakaVMxJLyemjKvzZ1UW
         JklK8RJehGfTjkLzhLmfOgFKTo2wGaYXigl6NcMqYXoO0tgcY4o1bx1/FS2yxPQrF4Ef
         li/gN2MmDX6Mp7aTO64S0FOnftrNy743pDDhG3L8BwSbavaTVg6o9krHvPusLcjWoZiT
         yrV+9erRdk1SAl9dLSe1LKyDma5W/aGvGakDWimF8Oo69y/ykwB3/HPAo0epjjqf/aPw
         e3tA==
X-Forwarded-Encrypted: i=1; AKwUvBxO47AwTb0mIsVkeuN+IY/nIE4FkFQg/Kx8iwe+B+8J168HMwtpt8R5K36wQka3aQreOXq8VoByG7fi@vger.kernel.org
X-Gm-Message-State: AFq9FYJp/ouF9Ae7vHTb0CutqwodS9kO5mOXbuyJvmnrE+TxBh6mz+el
	7aoozHjdw7YZWP9DPLZZRGp19xPZX7tx7tWhQAFwt/ObNnYy72DyzOk+
X-Gm-Gg: AYBFou0jlewj+20I594LnzE3CExfg2ZABa1fXkWlcUgA2Hav7p5ybZ3dxf+DJAw+3Qy
	ZFBUWmPgwRMToTDoBUqAL7hNWrbtzPFA8ZeEpc5nlwU+AIFUEI1Yua+50+J3e2RliqvhvdZ5xo6
	NdFnN+XPm1ox/IBGfJCJGFF1EaH+7jIBNs1KxzPl0NoOhknwz1mqL1XA1OWWS8ufORF2K5SvR0L
	tdxl4qrdGv/QtTMGdE9NsqrTkIZYXuuE6dlGkHxd5NkPFxqEiS0H8jnEaj21Rdd9U73JAsWw2DZ
	cS86ioG3CCsDkjDhdrS9kmBGaB+ZdxIWPQD4eLFsVQA9mKuH56+rMyT0rT6ZuwoLeTTQrYPFpcU
	ThHneHZGnvU83qVF5Tb9Zyc3SEDQLbNJnFWE596jENS8SBK34rob9Yr8NDagDs5H9PbFQuNPlNM
	QazAQKfMGg3Gq+DVkdI1+eihxBbPZjhJvNvHXLugm3T0qW02Itpmmi1fnfJgoeR9cifPGqag9s7
	47/y/8RSxREkWtKbx1oWwYxKjsHQwWI7ONjd9v139PZQkWn0zvt5A==
X-Received: by 2002:a17:903:2389:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2ea9c821072mr73512925ad.32.1793090630759;
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm5640215ad.35.2026.10.27.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:50 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:43:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <auBkBSr5N_FlCPxD@inochi.infowork>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-7-inochiama@gmail.com>
 <179232693939.2114.10956498814503201256.b4-reply@b4>
 <athvDzJHs7WQmBnx@inochi.infowork>
 <bddc44d0-5446-40a9-b211-28d0b03f89ad@ti.com>
 <179308804504.2479.5374380919602671853.b4-reply@b4>
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
In-Reply-To: <179308804504.2479.5374380919602671853.b4-reply@b4>

On Tue, Oct 27, 2026 at 01:30:45PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 13:56 +0530, Siddharth Vadapalli wrote:
> > On 10/21/26 1:26 PM, Inochi Amaoto wrote:
> > > On Sun, Oct 18, 2026 at 06:05:39PM +0530, Manivannan Sadhasivam wrote:
> > >> On 2026-09-29 16:37 +0800, Inochi Amaoto wrote:
> > >>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > >>> DesignWare PCIe IP with extra link and reset control. Unlike
> > >>> the PCIe controller on K1, this controller supports external MSI
> > >>> interrupt controller and can use multiple PHYs at the same time.
> > >>>
> > >>> Add driver to support PCIe controller on Spacemit K3 PCIe.
> > >>>
> > >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > >>> ---
> > >>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
> > >>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 139 ++++++++++++++++++
> > >>>   2 files changed, 141 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > >>> index dcfbe7e229fd..f9c27165260e 100644
> > >>> --- a/drivers/pci/controller/dwc/Kconfig
> > >>> +++ b/drivers/pci/controller/dwc/Kconfig
> > >>> @@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
> > >>>   	  Sophgo SoCs.
> > >>>   
> > >>>   config PCIE_SPACEMIT_K1
> > >>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
> > >>> +	tristate "SpacemiT PCIe controller (host mode)"
> > >>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >>>   	depends on HAS_IOMEM
> > >>>   	select PCIE_DW_HOST
> > >>> @@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
> > >>>   	default ARCH_SPACEMIT
> > >>>   	help
> > >>>   	  Enables support for the DesignWare based PCIe controller in
> > >>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
> > >>> +	  the SpacemiT SoC operating in host mode. Three controllers
> > >>>   	  are available on the K1 SoC; the first of these shares a PHY
> > >>>   	  with a USB 3.0 host controller (one or the other can be used).
> > >>>   
> > >>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> index ec59ccb710ec..61b430f2294a 100644
> > >>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > >>> @@ -28,8 +28,18 @@
> > >>>   #define SMLH_LINK_UP			BIT(1)
> > >>>   #define RDLH_LINK_UP			BIT(12)
> > >>>   
> > >>> +#define INTR_STATUS				0x0010
> > >>> +
> > >>>   #define INTR_ENABLE				0x0014
> > >>>   #define MSI_CTRL_INT			BIT(11)
> > >>> +#define RDLH_LINK_UP_INT		BIT(20)
> > >>> +
> > >>> +#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
> > >>> +
> > >>> +#define K3_ADDR_INTR_STATUS1			0x0018
> > >>> +
> > >>> +#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
> > >>> +#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
> > >>>   
> > >>>   /* Some controls require APMU regmap access */
> > >>>   #define SYSCON_APMU			"spacemit,apmu"
> > >>> @@ -44,6 +54,9 @@
> > >>>   
> > >>>   #define PCIE_CONTROL_LOGIC			0x0004
> > >>>   #define PCIE_SOFT_RESET			BIT(0)
> > >>> +#define PCIE_PERSTN_OE			BIT(24)
> > >>> +#define PCIE_PERSTN_OUT			BIT(25)
> > >>> +#define PCIE_IGNORE_PERSTN		BIT(31)
> > >>>   
> > >>>   struct k1_pcie;
> > >>>   
> > >>> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> > >>>   	return ret;
> > >>>   }
> > >>>   
> > >>> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > >>> +{
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > >>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> > >>> +	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> > >>> +	u32 val;
> > >>> +	int ret;
> > >>> +
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> > >>> +
> > >>> +	k1_pcie_toggle_soft_reset(k1);
> > >>> +
> > >>> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > >>> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> > >>> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> > >>> +
> > >>> +	ret = k1_pcie_enable_resources(k1);
> > >>> +	if (ret)
> > >>> +		goto failed_resources;
> > >>> +
> > >>> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> > >>> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> > >>> +
> > >>> +	ret = phy_bulk_init(k1->phy_count, k1->phys);
> > >>> +	if (ret)
> > >>> +		goto failed_phy_init;
> > >>
> > >> You got me confused with this PHY bulk API for a moment. I think you are trying
> > >> to control all the PHYs of the multi-port RC setup at once. But I believe
> > >> that's not what we want mostly. Each port is an independent entity with its own
> > >> PHY, PERST# etc... So the RC driver controlling all the PHYs at once, doesn't
> > >> seem logical.
> > >>
> > > 
> > > In fact this thing is different. Accoring to statement from spacemit,
> > > for software, it does not need to care about how the phy topology,
> > > and which phy/phys is/are attached to the RC. It just needs to enable
> > > all the phy and configure the APMU, which is the one that give some
> > > control on PERST# and others. The phy itself does nothing on this.
> > According to section "14.1.4 PHY Configuration Block Diagram" in the User 
> > Manual for the Spacemit K3 SoC [0],the x8 Lane PCIe Controller namely 'PCIe 
> > A' requires multiple PHYs (ranging from PHY0 to PHY5) to be 
> > initialized/enabled simultaneously for a single Root-Port configuration. So 
> > the phy_bulk_init() API here seems to be used in that sense. Mani's concern 
> > is that the PHYs for all PCIe Controller instances are being configured in 
> > a single invocation to phy_bulk_init() rather than the potentially multiple 
> > PHY instances of a single PCIe Controller instance. Since k3_pcie_init is 
> > invoked per Root-Port instance (i.e. per PCIe Controller instance), the 
> > phy_bulk_init() API should configure 'all' PHY instances _strictly_ 
> > associated with the corresponding PCIe instance. This might already be the 
> > case.
> > 
> > [0]: 
> > https://spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/14_connectivity/pcie.md
> > 
> 
> Thanks for sharing the link to the doc. I didn't know this SoC allows muxing
> multiple PHYs for a single RP. Now the bulk API makes sense!
> 
> For the next iteration, please include a link to this page.
> 
> - Mani
> 

OK, I will include that, thanks.

Regards,
Inochi
