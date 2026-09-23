Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC3363C6A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128196; cv=none; b=RVJl+RTOeQEE5yIBDxyc8QPkJ03nJyUQxlRnISaNrLxpwK3wl4D4BMiKAS4CIGKaOckOi3ERAuzhz5APlGUy5Snzx++m3yHhcjpEX2isKQQbwyIRJmD3IRCS/rxAgEVDsViA118WV/TreTDRU7ueXEd9GnyaPbDo+6CiQX+KI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128196; c=relaxed/simple;
	bh=sctJ8pRpBUC39phZYvLZAiXxKt0bFvx0/SjCeTNKZ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U97yG1eUlJ8ZK1VB/Rp0/aFn+xQzLBPESqv9kBQ+oajVraFCw5Al7XhSI7AmjubuyzPte4NXGtgdbOG1y/rcZVZXBEKSKvGIn4UiqM9CHixBX2tiKZTHo7StmJgF434U7rehBZIJuJTkSCizpgEpfQrDtMmipOAdrXw8YUAQZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuPsjtzK; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuPsjtzK"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso173810a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128195; x=1790732995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=EuPsjtzK8C/LHSlXvnte0TsxppJHCT5214tDI0d58TlMySlXnQuNGjctLUOmCM49rN
         4ZeXkCdRjGbsdgAnhmea1OlwF9Pdt5g9CfJORRb1bxhG1E/9LKbTPMeoSzHl4hdgMrlM
         tgssyTFfLXou0AM08QKU6yp2Q3wPlF3tP6h/H25Et+2b1sARTFjBu0Pd2s/soV7gqDL1
         wTjFJuv8Z7kOP1vR0m/gdZgy0Uvuji8hgQICGAo4eY0CMtlYvSHtapMMg5hQBj1di6XI
         /NJGv0GC/0K2Mbr02+xLqxlF/TUMBsde/TqIFxaAeE21h8nqKe8RYHIB6kkthD6V7oCQ
         Wlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128195; x=1790732995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=sOVTQkrRcH6lWup8yVbFieFvAmzPk92PQ+GTh9t0BC+0tiaC9M8UUaJyfJj+u66IIh
         ZVnmi84pDfMCDaQYDTWftfqiMILPE8GGQrpWigr0ZUla60PjApYc61corugqksRWffvd
         27tmXRCw5ZLU746X314v4c+rVZ986Q+em9pDXO5M3YkuGzHn812UKV3Tx5BeZ4CNspWJ
         Tph0f82hipCQcRqA9A4KSK6wUeWHHHENy1H3gHwvp0kd/6DNz3vHUGza25nBMG17t8vm
         RpGRD3B2Xx3QysZf8hA0J/5WKM0EwOp/5nWIt4XM+0s0cJwZ08atONY5tSBFR4Fs2HSI
         +iWw==
X-Forwarded-Encrypted: i=1; AKwUvBz/LpPlLDf1uEjoVTyrLYkEwFJPIfwfz+k/EC+LvKYAwJKcLT4SvUigGHn6hWFTdvx0anDKPSvx5DR0@vger.kernel.org
X-Gm-Message-State: AFuF++nB89w6MgseOfJR7Gx/PwQNHErcdr1wirwC1MBVhn67ly74nm19
	RrE1XYskjaXzMBXyjGbUeGvzL30rfWszIoxusbRZqpizor8TDhFI1eUa
X-Gm-Gg: AYBFou3IeM+2JjIb0V9gU6HAKsoGi2P3HCSd3PTpZrT5IMf6noZ1Jwu6cq4+l4rSPSO
	Cg4CE+iLczj/xdUTU8DWW0Kbr86qJvShlQakPPJhVLTrTAhdmw24s8/1C5hqW7Gtq9g8l2zC1bk
	u32Bqwg9o8RaE+kbV7h/nQ0FhyhAeegW0MFcNUggcMASPt+m2xTjOeEDYWxlXjjjvCz8JlE20VU
	siTdfUOaBDdfX1D0t3uhaGG/OGHv2CxGzfOA/hwYo7Iq4VyFUiwshDc2mEmQX6jWtW6DJglzoBE
	/jDv1GKWCHXtCYs3QDyZ6DbwATKjjdwjx/Y9hkQ7WqqWMcQDy2h2pNd0UKmuasxnNO5f/9AvjHL
	13CseRKmw+iqDT76YcFLNuScydxJZsa+ekuO0+NxQWY/hnlGJ6RWWSKCCAM+f5VJZXmRHv7Tasb
	rLuv0931u/rU9StEQGwKH3kDk7+J0fggh6EiDr4FgdJXHzkr8GN54C94BMRS/yLvPF5COy
X-Received: by 2002:a17:90b:4cc3:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a07e61658fmr750266a91.38.1790128194871;
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm1915180a91.4.2026.09.22.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:49:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <arMvZNEUhAQYa--o@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
 <aqEQnkrPSKB-3fam@inochi.infowork>
 <aqFst9QH9YTFlY3X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFst9QH9YTFlY3X@ashevche-desk.local>

On Wed, Sep 09, 2026 at 05:27:03PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 04:00:15PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> 
> > > > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > > > +	if (count < 0)
> > > > +		return count;
> > > > +	if (count == 0 || count > data->max_phy_count)
> > > > +		return -EINVAL;
> > > 
> > > Elsewhere we distinguish count == 0 with -ENOENT.
> > 
> > Is there is an example? I think it is suitable for its internal check 
> > to translate -ENOENT to count 0, because no phys property means no
> > phy. For a get helper with optional semantics. I think it is fine
> > to return 0.
> 
> This the brief list of what I roughly grepped with word "count" in the name.
> 
> gpiod_count()
> of_hte_req_count()
> i2c_acpi_resource_count()
> ice_sriov_set_msix_vec_count()
> reset_control_get_count()
> 

As the respond in the phy bulk data patchset, devm_of_phy_bulk_get_all()
should follow the optional semantics. So I think return 0 is a good
choice. Anyway, I have added the zero value check in the driver.

Regards,
Inochi
