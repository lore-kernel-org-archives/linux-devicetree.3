Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759861917CD
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779067129; cv=none; b=UoOyZrcXEf0iB2DOacqL6z3iPmlQ2gpjuTQ3PyW/UhBx09D75B3EyPN9nbTDKwLoaH9uvjQmwoJa31NE+TY/YqkDG6Ze1eMIWVaxOICnTNqJ23LvRdklKWSqBej+S52lVZuUFzb621FHepneQKc+1pJ+OHZozd12vxVIya/69BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779067129; c=relaxed/simple;
	bh=xv0S31PtwdmpQPHw0Fc3vOyQu5vNsfiZECnu7ZDWm6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvW8GL+fg7t3R3TiEQl3eaFdQvSkdqODu9qsVDajgUNm/ly+7mVe75L3Y3CyKn+D6mFvDNznjuALG3zCIq6fjVYKtIMwUrKV0EtwUXNeWkNzFOunOO+BvBQocIpPptFwtp5pdP+vKJu/t9Nbfox9obhVcnkJTb6xtdcrlqT6jYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkTbae6V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkTbae6V"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-834f1075805so1321682b3a.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779067128; x=1779671928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=XkTbae6VmnbOyE7v7IRER4USm4lIo2IJiqmFgRaWmgSa1u5LZo7Cz5yahseIlzfJFO
         hfppM8pqkHJyT2YPKrchPw0AdZmOIKlaIe8zmiJj0gupVfrBkqG8LBmEIySIzNI26hP3
         ZHj/BsWe+F7W5FPw7MBiu+8JfOV9bVh7uNY/z/mDx492caVZEW/Ke3xKDVB24GxXaqMe
         mR51lSVU6xSGLKsg9ZLiWjpJduQHI25KdXtv1QEP9q9cqUjBg3JOergT7tsCF4ATXj+X
         EpthtdDocffUGAa8yxxlAQmm6PbpNzJIv5XdAHM1f4SiJhlL0gj1PeQ4DFF7kw6NlkIP
         8JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779067128; x=1779671928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=bpn3AeFrg77YM0ZqZsCsa1ZN+f5xD/wh0fSmetNlh4IZDtNGIGLYoKcIvEnobZVt06
         i7NhL0bOWSmeKUlsudKe/nAzFwvsH5TbkiBo0w+ifcxY6ULtu+LQrvY3boBlBQnLavxN
         M1Gi1rwMGt3GtGLIL35cRYmT+yhFmJZnA0jvld6j2K7rYinhJn11BNMSPq4kcxTCiDpX
         y564Uy8vYDuLO0haaZE2GS8O6FyCZsmy9PCDgv4Ykbp6+X6c/bw9rzFTy+fkEbMCWVpM
         zznkLGvIiGeTSPM00k+ywyk+QEWCzeWa3ABigSUXcxbeG1Dm6MdvcIvKOOFM+I2T8QIr
         3ufw==
X-Forwarded-Encrypted: i=1; AFNElJ/A/dxI3+tgWdFxTnQQpjb8JF4M4H2X0b8/qhJre2TXHCj8iCrN9PFfWp+/L8lyrHNM5/zAXMHQNF55@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq94kQ+8ih6Fo2wd/FyqHtjhlVyEdtoPhBC571cXqSOjscEzF8
	KGDpJXWLGZ6KZRbasUoUrH3VJ3cz4Q63ZgM3CaVUHwmssJb8jq4p3G8s
X-Gm-Gg: Acq92OEpTrecEn8/M8qjbs2AJh6r6xcuEvAaD+r5+MhZnSiA5GzR59kLHPLuD8pq+au
	TVz/liODcZA7uoYLGizZj5RfBmwKOaP3eNEnXxS+sQA0s/10Q0a/ANadza7oU8qYb+3z0RPH8QQ
	wIGfqeGfW/WrJGTh0xGdHBTgJ+/PLhISBIpTkw9IEluRHnqRmcW3RHP7R+n4tg5KHEQSFeolj3L
	UZI85qVc17nupnpThLc5GDICcweRwOqyi9cg6vrmOvLOp6aiKH4i8aHEpj23scRBAgjLTthLDNq
	sf/1ZJuLHPMtRrn9ZzaGcxfovA+n89Iy8OGm6IKDVi2jrbslS6UnoiGiYb+rGWUAA+nRJG2DBgP
	w2CziJ4BHVWuW0xITUGH6fs641S3Tn6fxo9zeqQ3TdICOKMStC3Tk47cLKs1CZ3WJ0Z44lW93Wm
	na3ppGIHyatljHwdCJnEtxfQs=
X-Received: by 2002:a05:6a00:2908:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-83f33f166f9mr13591304b3a.46.1779067127790;
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11922977b3a.19.2026.05.17.18.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Date: Mon, 18 May 2026 09:18:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Alex Elder <elder@riscstar.com>, Nam Cao <namcao@linutronix.de>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Randolph Lin <randolph@andestech.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <agpogZp46N_1B0ps@inochi.infowork>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
 <agl3TJrvJMtEpHyl@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agl3TJrvJMtEpHyl@ashevche-desk.local>

On Sun, May 17, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 09:48:37AM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not support by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
> 
> Hmm... What's the point in having _array(1) ? devm_kmalloc() should suffice.
> 


Yes, you are right, I forgot it is "struct phy *", so the devm_kmalloc()
is enough, will fix in the next version.

Regards,
Inochi

> > +	if (!k1->phy)
> > +		return -ENOMEM;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
