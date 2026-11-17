Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938989;
	b=CMUbtXWUTsdSvkSt3v85skQgiP+RKwDHTmU1DkWxwSaCTouKhEKbTM+PEqeE8nfdIylz
	 mUPjESCJvJum32ngi0fmAaTFVsYXji9WqC7F1vh7BH6oNo9zCkodVKAInO6BhYBklZp08
	 6NGYoQ0JASnhImMLuPzvNhxPcfmEqkQa8FTJOvfDw0TzubLgaSLYuYsyhQJ+UAxS8aikG
	 cfPDlqRHM3qgzc2kUp9eRzaJUiQWZWYlDnzLC5GpgKSWqfRadqM2M499coIoB7w8P0LtY
	 z1PEXZ7zd4W9teYHGfKvNarmY3sdzH2Yk3KvkpkzQlB/ON091C8BbGxfZ7/Dj6d2MjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
	b=Rve7q8tja3Oani07kRMtB6hEEvrqOWluA/mvbszV/Ixtu32Waij+MIvR751ywOmM6Tq/
	 y2mae0bdhBbZtjrmtfDC1uNrL1F0lllUZ+EnlMS2udznq3UwVh4LURFZ6KNJXqH8V/6RD
	 jxxInyTPjUbJaysjHmy8vyMQ+S2SNmH8SpvODU9ISe1rXYFfhD7PapRurBXo25Ug2MIT/
	 EegNMU50h68ws7GWLo4Huwxnyv+mmn92aFV61ayBQXG0mdsafzy7Y+augB7DFGdWJT4Vr
	 I420wnkI61kcVk/sI5iOpmXgYDiN2o3uCbgp83Rg9GYzXK/r8mJVV/Ntnh74KoHm8jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E0606A335
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0E0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f22a8515eso13926585a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=YdgkGfVqKKui0aiLSvR6mWBKZ1+mzuRPsqTd1Sr0W+MZWL+4jDUMa6VxrqybHVoEOD
         /J9StWy33w6SStG5yfMJ1osxetxqx0DcvagahjDxFaoR5bvIK/sTcU9tLwx5smKDKl8z
         Thd3LDvAg2KozZedUmsFRZ7M/o2KonYaJ7dX9uNkiLmZm6olw5l3ytILQ2BH7q/LCTQZ
         hklXu99iDf3yimqo438LAdEHeUhdpzKPK1S2nLYqC+CIJNx5UEsxm3OYqhNRy22HA1Hw
         0o9ki1uwEKN/F5ZWTLAXZMa/9Jx7RmbhF5P3N2MbpK74vWTuOK4zl6bckElmrsmM0+vU
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=juOOaIsVApq7uo0aBu2Nh0Ytk41oomqjL/RulEwBkiyUNrxgOjVOo2xG5j/1v7/gd7
         9ixBXkMwGkKv2pf6eErEXOOWvaln9Mn76D5QzyY/aC/7RY7tpdv40PowKlrtZWUd7CSk
         8oi6M/fDXF1YmN09N4U4y9r2rgU+CPW5ooG45/I1O82v2ngFjB06yeZ15kf9UvdwEmDx
         FYljxa73VNEhYm6dQLoz97h2Y2JZPx1r799t+/pAJphyOltyY4tCayWQLZmcc31HMiij
         IiIaBRgcIt+RunQ7BhnLYoeTFL7UQboC3dccOOnUCzcfsUB6MHVCG51alk0t6If5NxA/
         3bLw==
X-Forwarded-Encrypted: i=1; AL+hErEYuRHQr610KqTIh21abyeaZOxhr0a/QnUSIEvCavuen6et31bKKFJOhd8olKqE0GwwitEE0Wr0xA5r@vger.kernel.org
X-Gm-Message-State: APuU4Z9BhMS3d04ypR9NqMH5liaPnp1bJXK3fU6hNaqt5JDggc0A0tAv
	d8DIWAbdDg8z8KFWCtx1IRewK1VqW1wtRWuySDW5KKh+xwT3QcnfMzYfc89Fr0B7hTc=
X-Gm-Gg: AYBFou1mQ02OSQ569jSDTZpVJcZWiFU2oAfGkfwIhBSzOjoWaDntrCSvNhlRczSBw0K
	y6iMDdzK7NSzqJkHHSnvxdmaJsd4bwxNoN4Am/NRa6XKdBZ5Y9UMwdIYY4oVZ38eT1SJBjfmwVl
	8S8jPHmLK4H4iehtaN+FPZgL81nlGaw5aZiIhBcG+1qMj6u9wbFren/RdRVIOvh1SilbPv/MdkD
	ftOJq9YEbb6OBb6D41u3Trf2F49F16iy63HhaPAiwBYqLSoOCvlD8w1nKmb1dCurXx1B7Jel2VG
	xsgYwFXEJxygZTWexBZ1c2PHlKYDqNvD4ihzTXQBW1ejalVDyJk4ghqwVvVIzFa1XxJRc6avjTP
	8KP2yMGuh4vOdOAYs1skTCXxKxi8pVwFK/ZiKC1D1FnBZ00fcBXi5t5O38hvcVnCcl/NLNTvkMt
	ednPsF8TlYiRom3Nx8scKCz+lXNByBo8A8JuX308GBooWDvPmuwDa3ObeXW4577B9+MY0UJbCij
	m605K67NevCPl0bQcuLoh7ydrr/jsmBZmRCGy6PR6HAA/dZDI2MqvRVthjdYVprvRnO+Ctc3s3k
	EHy9dKw=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
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
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason
