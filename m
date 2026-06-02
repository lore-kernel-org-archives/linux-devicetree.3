Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAF3A8FE8
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392116; cv=none; b=kI+BEEM2V4M6D072/AN5m0m9gNB4nAqe5EhMMhYeIS3ptahM0BQ8dAQ5ksa0sJpqTLuEGHR+RPXAI/rAtAxZNR8jtfeVh6MUoE7j0bRXAHOegWvK63SUNFe3hPJ5uyIboLYLZiuN3+SYOW2Bcgw4TVbGVX1drngiMGE0TxvSs+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392116; c=relaxed/simple;
	bh=7WJLHqn+vCXpKoMsLpDMkqhdyw4mMxJn+ORetHQNEts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRPrbWejpKlEDCsrLkzbE/H5FrsthS+buAaMD8TKeBCOl/2bb+6/N0KOrtRyYRO05369mdYIX9GrYW+arlOrk6ca4cDUpCUDZOOQI6QFddgx3dm2Z0H1c1QWsynlioHbL4xmosYHbhD20Qn5ftxRP0q/obilkxo7NK3TQmULs2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha62nN+/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha62nN+/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c379e8ffso15782685ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780392113; x=1780996913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=ha62nN+/Subkv1YLveQgAq2mJYZdBrfjOnngXduzmcCVG0ITh5liy+7CN8lYuOqN8J
         DBVSCDd9cqkTXHgRmkFRgAnePm1wRuLBI7inaTQg/xJmXnuKlWCXjQNr07s5sSPs1fDt
         ZQiFGVSeCk9ad04gkPyoGxhOlUYblkmLl9j60HgNMxcc/OrJ9kuRgj+iCo8ZXk8o0zGE
         Wu2+YjOfppnGJwoZHOhVowPyjVXikZZS3S7Rwz4fkydzQTsf0szwAjvREe/8tXGAbKqw
         B55Y/iznIgfDhpLAfve+HVlKvE5LRXjC6SITxczEisgwXEMrkq1EWRn2uCoDWvfuqU3u
         7fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392113; x=1780996913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=NssLQ/UaAejboeYeuFJFC6AcGVpYAC3wtue+0VpKfZWQaas9NX2KTfChr5Dpf/Oq5O
         V5JpobnM9MYd4pJZyIWTeQxNHu0ByT/8Bxo+xN0YuqcD2sGTG6AhgDPMR5YFap66br8l
         OxDy2pMESyvXezEiiJqQSPQNtDCyOH1tXpC5HIkysY4Nw7Ne0sFMyo8tpfN+OYKnp0qI
         1EregRMTwB2eRxeWPPVp1BhhMVWM5gCnFHBrs2LIrxR4kVjrCup4uB/YDM6koSNgPCkS
         vZ/ed/uPlzZ1JT/2y2MOBqnXuve77MF5fGjR7TTio/QRsj36GXnWYOijb6YQnpjf40VS
         eCyA==
X-Forwarded-Encrypted: i=1; AFNElJ9TKgx5M3Iv8m+jRnoG7MBsEQCucvfl5uODDPQAL+ATH3ngzGe3Y1E00zq21uD4h0KApOWl5oqhJpWS@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0TJ6HDyWaw69YkePigBTgiHKSLsMBivgpgoPoOKEylwQfYYI
	5eg+3hauEOiG2YvHxbOIgsYzZsJm5NGekOIla+EfV4c/LBqednxZZ3eh
X-Gm-Gg: Acq92OHEMkaxrtPmdy2ps2+MndOYdBOknzy63tIe1Ap0eBMcwIOvkGVGeEu0yPnAXXk
	vSLRKAmK7A6awGqFhSh5e9+hnjidVuy0G7itl24lsjbuBWILIVKrrDUTNOEyyAwEJO54XNi8Iwi
	+dus3vF8ci4YGD2Y8xuaj8miBIUPHpHn85dcX84+6xBHhyOTSYZnUT1XrNXn3le6fUnWXZWVBf7
	FpOwStnYXMpz8iu/UcZlVCa8lF2d/E40wzj5aU+J9QNgTnYvi0Wg07g1RGMjqlpdbU9bF6S6UDr
	NhI6pzirWgGy/BRgnZVM+HyWqsLLPklgt1ebkAym1pnZIO4V1JBdnpr3sXNdsp9T2fTzIejxii5
	p5ToboPzt3GWIquNn+mRk8uPScJ2dU3jxWqnRQFFvHMdJ2wDpKgrcJK9xd3TX/kUf5w9D4OTBEK
	rbhEUqD4Upht4CvqzN2WxFEHpbR3vK283qeg==
X-Received: by 2002:a17:902:ccc8:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2bf367f292cmr150201385ad.16.1780392113499;
        Tue, 02 Jun 2026 02:21:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5a350sm173102185ad.83.2026.06.02.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:21:52 -0700 (PDT)
Date: Tue, 2 Jun 2026 17:21:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, 
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA
 coherence
Message-ID: <ah6gcvKQlHlrW1qn@inochi.infowork>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <178028263198.557087.6386925175219722340.b4-ty@b4>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178028263198.557087.6386925175219722340.b4-ty@b4>

On Mon, Jun 01, 2026 at 10:57:24AM +0800, Inochi Amaoto wrote:
> On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> > The SG2042 hardware design supports cache-coherent PCIe.
> > 
> > With recent firmware updates [1], it allows to use DMA coherent.
> > 
> > [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> > 
> > Han Gao (2):
> >   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
> >   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
>       https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5
> 
> Thanks,
> Inochi
> 

Revoke this apply due to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/

Regards,
Inochi
