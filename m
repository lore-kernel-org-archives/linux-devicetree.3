Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C09372064
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841577; cv=none; b=haPh7ZBGp76hvUlCNt+YOC30t6iATtkp6ONV05qhxmKMekycocU/t1CnAcC/vSJwYOuKcHpYv3HOQ/kuC/9se7p5443NoEEF7vlhktLL1reGnl6Nr2wdgGBH+aaLYAyw4iHqsRKfCNfq2Zitehc+xzShqB/jEzPbP0WtzjgbnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841577; c=relaxed/simple;
	bh=aZqbzkbyclHQJSmWx0H+gTBJ4s5rShDCPWr/sm11Giw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnlGJ/PwPNv7yyhfYtSpVEs9IKDXJSFIXE3IcyTDe3yi22HR+mzCwFrdTejzavRFhimHHkcRIfg507Dv1he/vTqBS/SSNi6IHJjRuF/RBZ3v0sD9fsje+NW1sxQhxSLkfpTZ+uvGGmDhdn3c7RTMwwLrmtI1jsCFca+cMlAjCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVr6wu0z; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVr6wu0z"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1608688b3a.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783841575; x=1784446375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYobm8dTP6JvcBfLyO1CnudZo9D607kvLt1hZ/YvyDM=;
        b=mVr6wu0zY97iLRLK8SqbjDtReHxHFOI0oj7bULNIkTdRnN4S2oHjSQyEI8WvpTUSBm
         b61oNKHJFwqvaj+G5QcKPQ/LUEyJoOUnMUtohAEEfKn8zG2b+ORQtAha6MtjSe+p4paj
         dqslfSUNtStfJQDbhNb/2q3qWKeGVnWColXhjHVaYvcEYQqGcsDGQPlyJeh1TQjWNx7a
         supS9sM72NhXY/I2fQEhn/h6/Ll33RkCXYfEx5A1H5vA8ulQcUwmpye2LrrdbtC6Hrq0
         xB9BhRsoPGLocy+z4OFYAdxy+gGnrYQuBV8/7gdtl8jrmQn8gUKOAw6lRtiCrfYmGFW6
         066A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841575; x=1784446375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYobm8dTP6JvcBfLyO1CnudZo9D607kvLt1hZ/YvyDM=;
        b=JfV2uiuVrphCdOMUlJpt4/UOcpEhHcyoynZozO6Jyf/jiMPXTOjktyj6uGp1tcSwEU
         Bt9W/ImDA2PapcjZxPj1zadxIFlsq6zRiuPexMF5sFLnrYagI6H7iPhv1VMN3beavV+1
         79NC/1SaqshkwDNJHxSCaqRlcq24HFyWy9zl056bEOy0J+Hn9zSeBMhPR+F4Zf/ED+PZ
         si5WM6UjDtAlCur3Huo7IhaWF7Fl9WcRFC7J6k2K+z9aXLwGHXM7nxtsl1WCdn3oQ6wK
         SzOUbsS5i8NRNCZgO3bYr162gjaviPTgzhBhUP6D5D9JuvLwpWtmo7MBTwWN3EwpSL00
         jAtA==
X-Forwarded-Encrypted: i=1; AHgh+RrXG32DooQN+EqPYAwjoBMUyVEZ3B7x3doNKhWJx5B82my6usQ8zCkTCvRoZehq8tiMIoFPrps4Kwkk@vger.kernel.org
X-Gm-Message-State: AOJu0YygyALe2Gzddl127a5AK9Czdspkea5yVkqyyPs70OQ+x3BHxhRg
	sTNm/YWiGpekWnhEtHCuyED3riU/vXJ6DmOpIJTKScW4CY831tczyFRy
X-Gm-Gg: AfdE7cl4NITE39cZulQ0YBJqhO/IYgqo9T6tGNMWMuvW6ZvFKw46BsCMLahmdKSGEoA
	sCCbft/V7GY1yGDiE6BhdZfKUGTy4ZrmKm/LOKhYnygpAMelgtekfm7agxVdFIzZM+zA6WV2aIe
	8/O8zjIc5TADIoA44EkYaHyTfUcEnvovbBud+ZoP8XdtueTSVmMSD2IOrqPtSLJjyc+UUVOFOHK
	EzQLmKApJVTb5V2a0UykyEEzIoms6XCPLYtoXgUkEM1/tqMkKVViveFitbj4oR51AJiYLJvLAy+
	T43kQ+vFiImd354JS97mc8NVKbTVw3m+Urz3S3BfeTmiaoz1QzPvA6XPg6pRI7cCzUHR8mqmWzp
	DPpyOqxOrSKyv9meMX8ksU35+VWQb5K7BazzfeHIWH/iqOkVmHi3o534iKYSnCFt7
X-Received: by 2002:a05:6a00:14ce:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-848895db925mr4637512b3a.3.1783841574926;
        Sun, 12 Jul 2026 00:32:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm12376839b3a.14.2026.07.12.00.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:32:54 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:32:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
Message-ID: <alNCYMQ0dh_Yt5av@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-4-inochiama@gmail.com>
 <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>

On Fri, Jul 10, 2026 at 11:01:27AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > Both K1 and K3 needs to set vendor id and device id, add a helper function
> 
> s/needs/need/
> 
> > to simplify this.
> 
> I think someone might have commented on this, but I expected to find
> that the next patch would fill in the code that's needed to support
> K3, but that patch is at the end of your series.
> 
> The reason I say it here is that I wondered while looking at this
> one why it was needed to create this helper function.  I now know
> that k3_pcie_init() will call it (but I had to find that in the
> last patch, which was later than I expected).
> 
> Your series should start with DT binding changes, then code changes,
> and (often) end with DTS changes.
> 

There is another order, starts with the common change, then 
the specific logic for a specific driver. This is the order
of this patchset. For this patchset, starting with DT binding
changes makes the common part hard to be identified and taken.

> Anyway, this looks good.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index e22ecbd09579..31aac056b68e 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -56,6 +56,7 @@ struct k1_pcie_device_data {
> >   	const struct dw_pcie_ops *ops;
> >   	int (*parse_port)(struct k1_pcie *k1);
> >   	unsigned int max_phy_count;
> > +	unsigned int device_id;
> >   };
> >   struct k1_pcie {
> > @@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
> >   	dw_pcie_dbi_ro_wr_dis(pci);
> >   }
> > +static void k1_pcie_set_device_id(struct k1_pcie *k1)
> > +{
> > +	struct dw_pcie *pci = &k1->pci;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> >   static int k1_pcie_init(struct dw_pcie_rp *pp)
> >   {
> >   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > @@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
> >   		return ret;
> >   	/* Set the PCI vendor and device ID */
> > -	dw_pcie_dbi_ro_wr_en(pci);
> > -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> > -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
> > -	dw_pcie_dbi_ro_wr_dis(pci);
> > +	k1_pcie_set_device_id(k1);
> >   	/*
> >   	 * Start by asserting fundamental reset (drive PERST# low).  The
> > @@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
> >   	.ops		= &k1_pcie_ops,
> >   	.parse_port	= k1_pcie_parse_port,
> >   	.max_phy_count	= 1,
> > +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
> >   };
> >   static const struct of_device_id k1_pcie_of_match_table[] = {
> 
