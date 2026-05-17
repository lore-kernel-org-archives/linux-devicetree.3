Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90233ADA7
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 04:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992902; cv=none; b=WdeNxSYfQjyUxnzCbfnKMdJKBOQrNEBcxQ96nasN+ECiayB+qi6+Wd1nIDv9j0HYN5lu7JGMQ1ZMaIbfMT4bvmaJ99RTWF09YGZHqahd9SYywzIxDApb0HAzp3hnkCoALsFWSdm3/uQ3RGr7bj2MS+WQI+eQegQzptsp2X+y4fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992902; c=relaxed/simple;
	bh=qSD1iAiziV1PDbFRDFZu8LZXTjF64/acluP8JL+NbBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srqqFZuHcczEslLFmpbVursh5ZPJSHQI3lkeVVZ9ThxxrFC806mlkPVTq98OEJEGnktr3617/pRXHYqDLl2sDP5zopGaKSm8EhkNaPpj5wwWcDedl4B0f8ZXIvE1pOVDuo8IH99q2+mVh7+7DtxWziQNN+C0kHw/HdhR6uJIUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVqfhXZ2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVqfhXZ2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-838d0b7c950so816431b3a.3
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 21:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992900; x=1779597700; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgM/imni8OBMR+8bMpL6Wt69F8bl6c0wLVOsI5NzgJI=;
        b=fVqfhXZ2tUJKIkkMxdJ0XiBqWCn+ZMvwFaMmCDV7L6XQPSfsqVVu5Km9sSXC1vSNNi
         Af1OofJviuyCpK23hKnZ/RLBmvI53JuDYj3EuZCi3LMHyAj5oiOvjLCSAnYVOpzjS+Sb
         +k7sDTEqW3yv0raRphl1ocqJhCaexhShnhb85v2uktKNsUdSmekvwqUwmlo5ZwoMMstQ
         7RXkmg34jQdIJVC2fyCyiEVeqM5waf4N8Jh11pMyJuYmQbKe3tEvLqoujuhgxiStoFAp
         WKTvcrR/FvlgnduSEeLROSG3IMaJSZPh/jvK0vPFY31Vwyd2OE3X24VQ1uu6CDDWx2PQ
         F50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992900; x=1779597700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgM/imni8OBMR+8bMpL6Wt69F8bl6c0wLVOsI5NzgJI=;
        b=MuSEPWuh7q5qODjo7R3YsOn+Qy13YUWvcssUOkqljP7qprc6V4nXUEmErvPcqCoV3j
         TnLlitjIORa84PjOoCKWzSHXo9QcNDfb6MNoqAk0zrQZEUzZvJ0Z6OGdRr5nZNdPa4Ms
         agm/QqBg20vSuucVtrs/A+7gg5/yoscfW7uSs1VBkJ6zq9nA0dw/hAWN41YEnIGxCpi/
         /IpmjTfUnPABXUjxqyODh36oGidOcSEsIYJMDx9zo4bAby1eVXv4kpTs5GfVJGDO6G3W
         CR6yZlhNP/oaGnhVygP7RJQUr+9diaOwl7Yk3ZSb8Xj6LRQ9nN3nA+dVsTW63vBv2JoM
         Cftw==
X-Forwarded-Encrypted: i=1; AFNElJ/wpHmKkXOCdEGgmCwD4yq17lzTwJH71A6ZtAIQtqfdp7c3oOJ4CxcxZPXlvrfL4drzwVJOj+xGZS5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKwfINFD758wVAOgh/gRr/iBryqhobxKq2zjLn5psCot/CMzG
	YzKlDcaBnDe3xBXeKlgwMCTcdUFUT5aEEnRrdadvJ51bztbiyHAUpL/D
X-Gm-Gg: Acq92OEI7oBNDPlpM1x7fmG4cpPTqwZFB2LXdgf6DzYlz8aTabAqsj3zLi48H9T+aVb
	al3TshDFzHVTd3eQ/Oqn3HhGynjumNZLLwkk8V2NuZEJuqBKZtgWGi8nwy1g/YDNKtscPprm2pA
	HLbsNgXPz+3NaiRjHPJTwaWBTfHdqqj4xHQRA8k36VciXp5QYFOXjYiYld1VrbqqxFleXdOZ5ai
	/JfBPwzCvJuzi+xdpUb1dOxlimWDJhw3h3u6VmrITIbaMsejh5efQX1YOOSK1xsAQpu/MDLskYc
	9YbWtiXXnYqbBAJQXNiWJ4A9uVNZtd/m40Wfy8+rNrTU6HAgFjE7yMsJNaxw1HnerVSMjjTBnAM
	1Xg+Tq9W8Xntxlekzcbm1s7rcyXS9LDtTigEsEtRPiSFFyQX9m1lb6PwUW99kyWsvWfgWvrIWhp
	Ct9f2/6PqyL/nsN+06I2fdRVA=
X-Received: by 2002:a05:6a00:414e:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-83f33d9d741mr10897233b3a.28.1778992899922;
        Sat, 16 May 2026 21:41:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b4bfsm10862196b3a.28.2026.05.16.21.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:41:39 -0700 (PDT)
Date: Sun, 17 May 2026 12:41:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: sashiko-reviews@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: conor+dt@kernel.org, linux-pci@vger.kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <aglGV-bsTxiJcjVs@inochi.infowork>
References: <20260517014841.254085-6-inochiama@gmail.com>
 <20260517031620.E1854C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517031620.E1854C2BCB7@smtp.kernel.org>

On Sun, May 17, 2026 at 03:16:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] MMIO registers are accessed before the controller's clocks are enabled, leading to a synchronous external abort or system crash.
> - [High] Incorrect use of `u32_replace_bits()` combined with bitwise OR (`|=`) fails to clear existing bits.
> - [High] Missing Root Complex mode configuration for the K3 controller due to a copy-paste error.
> - [Medium] A bitmask macro for a completely different field is incorrectly passed as the replacement value to `u32_replace_bits()`, writing unexpected values.
> - [Medium] Asymmetric teardown: `k1_pcie_deinit()` fails to assert reset on the K3 controller because it uses a reset line the controller is explicitly configured to ignore.
> --
> 
> commit 2826ac7fe9e0d0c0dd248a7fc412ce12f4d7b491
> Author: Inochi Amaoto <inochiama@gmail.com>
> 
> PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
> 
> This commit adds host controller support for the Spacemit K3 PCIe IP. It
> introduces K3-specific initialization, PHY enablement, and MSI host setup,
> hooking these into the existing spacemit-k1 driver.
> 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 7f6f1df31cd81..7854d26220a98 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> [ ... ]
> > @@ -262,6 +278,152 @@ static const struct dw_pcie_ops k1_pcie_ops = {
> [ ... ]
> > +static int k3_pcie_init(struct dw_pcie_rp *pp)
> > +{
> [ ... ]
> > +	/*
> > +	 * Put the controller in root complex mode, and indicate that
> > +	 * Vaux (3.3v) is present.
> > +	 */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> 
> Does this code configure the controller as a Root Complex? 
> 
> The comment mentions putting the controller in root complex mode, but the 
> register write only sets the PERSTN bits. In the K1 initialization, this is 
> done by setting DEVICE_TYPE_RC, which appears to be missing here.
> 

Unlike K1, K3 does not needs this.

> > +
> > +	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	val = u32_replace_bits(val, GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE,
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> Is the replacement value intended to be GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE? 
> 
> This passes a bitmask macro for a completely different field into 
> u32_replace_bits(), which shifts the value into the target mask and writes an 
> unexpected value into the register.
> 

The GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE should be BIT(7),
it is a mistake.

> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> [ ... ]
> > +static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	u32 val;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
> > +	val |= u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
> > +				K3_CACHE_MSTR_AWCACHE_MODE);
> 
> Will this clear the existing bits correctly? 
> 
> The u32_replace_bits() macro returns the fully modified 32-bit word. By using 
> the bitwise OR assignment (|=), the original bits from val are ORed with the 
> new bits, leaving any originally set bits as 1 instead of clearing them.
> 

Yes, it is wrong, I will fix it.

> > +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
> [ ... ]
> > +static const struct dw_pcie_host_ops k3_pcie_host_ops = {
> > +	.init		= k3_pcie_init,
> > +	.deinit		= k1_pcie_deinit,
> 
> Can k1_pcie_deinit() successfully assert the reset for the K3 controller? 
> 
> During initialization, k3_pcie_init() sets PCIE_IGNORE_PERSTN in 
> PCIE_CONTROL_LOGIC. If k1_pcie_deinit() attempts to assert reset using 
> PCIE_RC_PERST, the hardware might ignore it, leaving the device improperly 
> reset during teardown.
> 
> > +	.msi_init	= k3_pcie_msi_host_init,
> > +};
> [ ... ]
> > +static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
> > +				     u32 *status0, u32 *status1, u32 *status2)
> > +{
> > +	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	*status1 = readl_relaxed(k1->link + INTR_STATUS);
> > +	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > +
> > +	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > +	writel_relaxed(*status1, k1->link + INTR_STATUS);
> > +	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
> > +}
> > +
> > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > +{
> [ ... ]
> > +	k1->phy_count = i;
> > +	if (k1->phy_count == 0)
> > +		return -EINVAL;
> > +
> > +	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
> > +
> > +	return 0;
> > +}
> 
> Could accessing these MMIO registers before the clocks are enabled cause a
> synchronous external abort?
> 

No problems, these register is always ready.

> The probe function calls parse_port() before dw_pcie_host_init(). This means
> k3_pcie_clear_irq_status() performs direct MMIO reads and writes to the 
> k1->link registers before k1_pcie_enable_resources() is called later in 
> k3_pcie_init(). 
> 
> Accessing an unclocked peripheral can cause a bus stall on ARM/RISC-V 
> architectures.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517014841.254085-1-inochiama@gmail.com?part=5
