Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AA39C649
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786791897; cv=none; b=dh2s7ePYYs5l1JYfNPvRnzcCBFVBl3Gj9s/QxAWZHyfp5Ec1/dMBhQrKQ6jPOgAYTxv3Mx4nDTb6jkwNufz535TR17W3w50Cpp62SgzgLLtIBhgULhOUOKhskMBtapJn+1yNRVvppqpKQAaw784OwR+HP0e7xlVwsMlIF3oMvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786791897; c=relaxed/simple;
	bh=PIwtDxPNXPwuqN/MMgPlIbl3Hk8FZM9bPABxqr3+O4Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijnC5Z/yzdmNNy/MOL44kkFRZeaVy8uRYewzhuFTALEjiziMdlYoh+PIl8LCmm4zyIczXXe7CPoVxkgScO1MKHKp/ndmEXbvYuUPOLzSy195Q0gort1muh2dB/Rpxt+r1LjoqSeEdlqnB2RloxXslZ7XQmvkcpGBTUkzdO9atHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA2CM4hQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA2CM4hQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so16519245e9.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786791891; x=1787396691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrwB5zfsW4lC1jK6YCZThBFVhJVN5/++tlnL9AR3ZH4=;
        b=UA2CM4hQHaIqHZ83+0c9yQ7Rv8tu47Epg/0+/E4csrxAppIOwIB/zc9GrWDnBwUtd/
         /E5c7Xo3BQAgKcc8nH7Qdkj4uebRjgEXe1CO+SQs0+HVxnjMB0VLDj1ITLx7psb3uGDn
         xszXqdjqOVe4srzXCXPBegTUbD8sktF1xVwF7kY1ZfFe6lTO3a+iHtVcRBDJzyNsO0i6
         nGRqGesxsABDwt8/yznYkhG6b/Whhi+sTewyl5nYiIs0UFM8t/5UTgbQwGwfx4cCmGCH
         7erdWnoy/5VQ5gPTBKrtOeMGT4A9GjY5X1KhcdwH7pgti9yL9QujoDZPxUTVJUlwMYCg
         0Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791891; x=1787396691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrwB5zfsW4lC1jK6YCZThBFVhJVN5/++tlnL9AR3ZH4=;
        b=XyL8hlgut4NXqVddthiy62pVJLyLbmPV86ys+aNO4PG8Vc9PXOvEcvNdJ/V9e7gdjY
         TWF/KpsuzXtOfF6p/jhkV05z+NNTCafKbLrXNjDtcMJqC3FbUhhMHPmb9UgQ2zvoxaTQ
         BUQp/0HvcrbvqeitidJ95Pvx5qizPXlEo8csaiJVQlzdIOLTq1tgPnuoSHvXz4Ab6t07
         dzJNFR4AeE/ehKs6VtKh7R4g9zxSS6TdZU/gfFqS/M9zis+2WnU5Wa6hcv4RYc031jKf
         gCHlMgypBU04iCHIdb5XuFkSpby8L/OP3rZbm3qzyFLI/8gwMeTq1t/gV/0k5pazKuxt
         cbXw==
X-Forwarded-Encrypted: i=1; AHgh+RrRI293ms0m4hZbVqlSCGc22qo2+b1kA9RCIjk4a1/rf84uybg9Yix6hOtguBkdhIza2JnkYaWaXyAk@vger.kernel.org
X-Gm-Message-State: AOJu0YwlVI6qB1TzvVJZ0YOrn2oOACTAUx0x8DDfXdVtCPY95j7DFId/
	PHWlHuntpGoI/quTGEdqaOyB1dQF3NHKaj7r0YvjxUjrab9id86+TtPP
X-Gm-Gg: AR+sD10F5yrivxRoOvy96/mTOaRhHNEJkTsAC709KHvgk3qHFl4DH+YBYQBiItzXCaN
	NnQeyAZnZ5sNsbT4ihOR6eBsxliKWElZNct2j0O9m17hhifXov3W7Dd6d4MunvYy1RMJF24Kowd
	7HiR7bZVH63+NOlfxXMUanjwUr4+Nbq6koKmOUA04RKyMpl5q7Pds4NpYDlUucVH2R/iAhL70bn
	/n/aBYHLaYPEzKXcNyfYwDyaipzRuUIRo+xUaRqaxGZ7iKqpiXbNWl+sBPuF4cPc8jbvFUVYN+u
	P11Y8Kfn6k1kmPktL9NW6GBV029tWtbk1U824UBdK8klsS/FlCFTjgnUFMapbKpaQA2n3lhZ2xm
	0PW9646G7P9jtIAIE25Hm8E+13pcf/O+CpQu/nhiW64YAVV91XscxfW91K1tSi1zqg0tVCR7Rak
	KiQ58Aw5mOkMrEHCB7rw97QsDcKoIFSxRWZVI+9Y9CkorELEQR0Ldk8719m6sL++g7ZBK+7cmWp
	d7spk+tCxU7Bicj4H2hUO8VsMyFgds=
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4998797d111mr154059175e9.15.1786791890869;
        Sat, 15 Aug 2026 04:04:50 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899afae3sm98004825e9.3.2026.08.15.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:04:49 -0700 (PDT)
Message-ID: <6a8047d1.3527643f.2d620e.3236@mx.google.com>
X-Google-Original-Message-ID: <aoBHzVNCc-TOnCaP@Ansuel-XPS.>
Date: Sat, 15 Aug 2026 13:04:45 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
References: <20260806165334.7328-3-ansuelsmth@gmail.com>
 <20260813170820.GA1143871@bhelgaas>
 <6a7e1b73.e11288f4.1351ae.5625@mx.google.com>
 <5qulrgfnwzuo556hxsyg3iweqv6i57ll3chhhb3nxe7lgr6fff@4l3s5rotnpab>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5qulrgfnwzuo556hxsyg3iweqv6i57ll3chhhb3nxe7lgr6fff@4l3s5rotnpab>

On Sat, Aug 15, 2026 at 08:16:56AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Aug 13, 2026 at 09:30:54PM +0200, Christian Marangi wrote:
> > On Thu, Aug 13, 2026 at 12:08:20PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Aug 06, 2026 at 06:53:32PM +0200, Christian Marangi wrote:
> > > > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > > > mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> > > > done by configuring the PCIe MUX in the SCU register.
> > > > 
> > > > To correctly configure PCIe0 in x2 link, define in DT the following
> > > > additional properties:
> > > > 
> > > >   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> > > >   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
> > > >     'sec-perstout'
> > > >   - 'airoha,scu' property to correctly configure the SCU register for the
> > > >     PCIe MUX
> > > >   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
> > > > 
> > > > In such configuration the EQ preset are configured to the same values.
> > > > 
> > > > To permit correct configuration of the PCIe link, additional logic is added
> > > > to assert and deassert the PERSTOUT resets. Support of these additional
> > > > reset was introduced in Airoha clk driver with commit
> > > > 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
> > > > and on backporting of this commit also the clk driver change will be
> > > > needed.
> > > 
> > > I don't see 6712f48eb3a1 in upstream or linux-next.  Is this SHA1
> > > going to valid if we merge this for v7.3?
> > 
> > I picked that sha1 from the git pull for the staging clk tree.
> > 
> 
> Ah, I missed it. In this case the SHA should be dropped and maybe we can refer
> the lore link of the patch?
> 

Just yesterday it was picked and it's present in clk-next [1].

The commit didn't change as merge commit are used so the sha1 is valid.

I think we can keep it?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/drivers/clk/clk-en7523.c?h=clk-next&id=6712f48eb3a15842925171441505fa2e7699c57e

-- 
	Ansuel
