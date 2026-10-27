Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090594;
	b=noK8n6dMqWJd8XL0eACi1a01LTp7EX/nH2IEmSvvVdI/lZAB6a9yeNZUAILE/cCxzgqU
	 XVFwgcZSqdPnAVx6LtPACUraiwaHLuX2pqFLJHLUjhW6mUfau9bGQ7v6TMyx6SBPT7IKW
	 8S2d6AqpKGqCLCd30QLnuknvUcw6zWKXGrUZcUdQcudaGa5F4g+9i9LpeTzF17NF3bkFp
	 F6LKCkSi2cz1wGI2L4HOwSZslNur09x7w5RGf73uAkjdVUmzCmUpjgSB2UG79PFSxGA8P
	 gkGEsnsn+G6XMaRRVrMpZBGgo+uRXe3Urfps0YHnvlwgaG7XUErqBb0sSnU2v1T4DOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
	b=1A3bSsvjmMeGnNfbTbCWanGrhn7GRaEHJDYJbUBoDP2Nam3R2RVCV+na5NtmFxQQpsPX
	 RJM+yRmCtWkeDGCio0eEuYn6jFykCd9C7tOvU9IaS526azB7qdGpYhlt2RpzYsv2mdZUA
	 oGX8H3U8PVQjNjQp3170lu1oFMnb3eYZTymiUS0l4J1ETH8k8aXcX3paTpkXojz6Xg9JD
	 XQgGOfup7I7KaAWdTy3TmEDugqGNEp8Mp5S0yOgjrMeekfevhgrABj22bsEsNtSyTS3FS
	 YICYIPOSE0G6kQOwmBGyGUl5zKMRpKN7jOqankOOAGHIYyPz1voUTx4R3dGZi79C4MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U+MCwusp;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD0D606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U+MCwusp
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so33181005ad.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090594; x=1793695394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=U+MCwuspKVOe/KK7pWHUDK/JipbXiKDqESILed5yddyrB8jzOGCrRR1HLo9CIC7kpN
         YWW6ShXECFbKW62LREn7LHMdFXmrBdFoH1PLM62ubh/E5tnQKus8h8su1aUN7ckQH87o
         p+Nim5cuJl7XND8KTbx9UljIYReLcStP0wC+Ks5OvKSGRRQQZO8OlvL67yNQF/qVrbI7
         pU+PRwVQS5/z+jHby7XUUYDajwViLkC/Z/JNNYTRvtgQPCxs5PJiQUMEtvqE3EyL4Fbr
         HeX3QTP33FzySauLCgmMRbR2R/8CyCYzbFMsasZB2w0968yQX+VS18im2KtMPnH4mmKn
         DR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=U2k0VQes6R0V71Gy5DFxWubIVD4JAwjU/wD7mU5pe4k52fqwl5SykJq5Y7aT2BE0jo
         jX47wPx6lAAYdWiQ/FxTFAHn6gwtgEjQ/Yr3bKXDWDHZyecwtIUmcBh6ZfE7qCR1Iaf9
         5cPt5dJ3qIHJOtS13661srvxKWfCuiWlLrL3j4lKslK7dNQ/vl6bmiPzmK8vMcD/MB8T
         JD0lJuBfMdDIZJoD13jQrbDShvjoRT24zkb+tQi8rEG8bhuQwURAH/3e3UmXLKmpW/Ri
         7oD6zyWTKB4Wsty7mJkIyP217EXNE3yfFzmtUXjHfL1lFTNUFgVgUoZho8FhuDmpEKps
         Vccg==
X-Forwarded-Encrypted: i=1; AKwUvBwa6jUj9yeF2lbaHrI1fb0zn/BjDQkTnDDwy04LiuPTWndda5TBfCrSbYPG5wfNYnrpmGwgOBtJV0T5@vger.kernel.org
X-Gm-Message-State: AFq9FYK7a/R+DkrnSw7XcML1kTYZjVDcxtVaPfxIlVeKv0GE4TIR42cS
	vihqY7vNzcEUXkWGOcR1kzl01BD9In9y5ku1YN6pJL2CwBX68Z9rD2Fz
X-Gm-Gg: AYBFou3xg2JmHPTPlURLRxFEC2dmTvYbgOKMT3eBs9Eq0uxtqRZ20J2/sTjYus9yZyq
	St9tJEvGBbcgZUXLVyO84tA/7Q6VZr/nyuv39LBzrhHSMUDnfu9VLLXwNXwaQQe3c3TIQjB3Hos
	Fjky9DU2d254X4icRYKlKqeC3+7UaA8zHMoXy2/6uMxE8Rqu24ipimwuXffhoVrUlaF/jyyIFyI
	elyhqEY5ObiWihA2s93hTT7VVyFgzAO5fkrCZRtAcpP96dtdPiLK8DzIY0VfNpxabrjGtokCs8o
	K7STtbrQjz73WqXXd9TtIj37efzycAZQ5srAtInu8x7xwi8k6atm42AaF8zu65yUjuEzFzG0pm5
	tMidDLuDNSsD+v3FKqnZ2lkfkXNZTpisGwFIfiUOo5ZODt9gFqBwXIPw9XdGAXhJWIj1BQyjINU
	0dW+YHVNY82NFzP4uyso7LU0n6ZoU+JrcJLbdlFs+4ZkBu5ErbKLCk/A2am/VAbISpprFx7eANJ
	sMjzkNp8KeLjkdw7tzf1zHL8qLfxJry1plomP3LKhKQHA5CSxUmtbNSwMB7rTG44yDYKPHDv+Uf
	tGbMAqZkpzNvEvRrQHTpn8LM8tfz
X-Received: by 2002:a17:902:f68c:b0:2ea:cb4f:fd3 with SMTP id d9443c01a7336-2eacb4f10a9mr43735615ad.4.1793090593725;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm5901625ad.53.2026.10.27.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
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
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <auBj4o6t_RyT3wfk@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
 <athuYJjPMkrecGm3@inochi.infowork>
 <atiB7-u5bxJbf-1q@ashevche-desk.local>
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
In-Reply-To: <atiB7-u5bxJbf-1q@ashevche-desk.local>

On Wed, Oct 21, 2026 at 12:12:15PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:51:20PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> > > On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > +struct k1_pcie_device_data {
> > > > +	const struct dw_pcie_host_ops *host_ops;
> > > > +	const struct dw_pcie_ops *ops;
> > > > +	int (*parse_port)(struct k1_pcie *k1);
> > > > +};
> > > 
> > > Does the "const" here add anything useful?  This patch suggests maybe
> > > not:
> > > 
> > >   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> > 
> > I am not sure whether the compiler can make use it.
> > And I have not seen any explaination for why no reason
> > for that. It is good to have a clarification.
> 
> These const make no sense. First of all, the third one is missing it.
> And I have no idea what would be the proper syntax to add a such. But
> adding a such make it clear that there no sense to have them. Either
> you make the const the whole data type instance on the user level or
> don't do it at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Good, I will remove it.

Regards,
Inochi
