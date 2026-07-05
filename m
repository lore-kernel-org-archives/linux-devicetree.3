Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E735838E
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783250580; cv=none; b=IRlWKbqrzoZ/Ml6VIDw0X5fJGO6gVzxKjIdkxdVKGO6+TxtMa4Sy6XfqO2HefU6u5Hju+NomGMQJWeBvCC9Na+c1rqtyG7DBk304/wcdRAB6agvvivAKVfJhiloTj6armmzY9YPOGohJztzrUCQsySpo4jYSsZOOVjyQK6vkrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783250580; c=relaxed/simple;
	bh=9ihfPJWrXsFx42x/DvnAeOl++cQYozhIWwTp37iIRX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH/yTO/+VJK6kF/BEQQzMXmBvGBd6jcAIF13t1jYvlj2Ih77kF1win0w/sC5LgcDwnKiBKvU3vwWyB+S6UpmDo0AvXxMgIVLnFczgBevTyV5pAorqUNuuve7igl+9PC3h34MrZ+lh9P37zwj/X8JcpLWGWD1cwoXmKRa4QOVmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYvj5hXP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYvj5hXP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so14712315ad.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783250578; x=1783855378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=sYvj5hXPAlCsOMllwC2FIWxSzefBV9VLcyu/T/7bDcoXJC0W8VQr4VTILWM3sw7Uy/
         eNo3mGMWmHlXHKl/zGs8Ae9aZvTH2YnaKCxPmgKfGs0Dn4umVnzUPuUiP8kaz+3GgQ4R
         i/TuG8xK1deJx/CObDre1KK+MM/X8lkO7wzDpK3BMjpny6DzYDSeS8jPtWkAtQxTj9S+
         TqFsBOaTYNkFbnQFrGXI7eDILOhZHXa8DmodZHjfgBu3Ea8D4g6GN0Qo9QLaONqXTUFn
         BTQBaVQINAtqhhGFOZt1iVcTjelPgCGV8HyspOSF0nEKxMjciNj1tDaUYm1NpxKn/28o
         FUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783250578; x=1783855378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=ExGygerhXOx73BeEg6USrzhY9wOaDNC6Ty6ej/Rnh3Oyk6YMfqvYQcO6xFLwqG79JD
         ibEvBbz9qOTXIk8F8+R0h1dEHb2UfuBp9lEoeht7UFxcH7TD2xV5TmQ69lorHC/P+pLC
         UArUOkYAa5UjlpVsBwudMqO59goK1JUXXdSHMrNred07+DPdeQhBHRRX+Mw7PN7T2rgV
         6uN7wlZPe+LYtjuTrCOWbTY39QO2xvnF57in9+3hgo0IyMVwGSmDfMOTpkiMGN4spp+I
         rKUCrSq1QjgIp8bUGDJUcUgTPJjISMUJ4s3QRnAa7oY4Ed8f2EzWt4ov8dFk1EyIV9HC
         vTbw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd6uLuyWBZ7B6ZMMYCM+NjQmFm5THw3nz8sUQFTO4QPXVJqrzFhxZLlF7t6V0VAPpUayADmaJSQMXs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mKEKh3zneg61EtSqLbwtAvGfpyW7MyCoN5RFLardggYECWD4
	NtlcxcB7qt3pvHdD7/W7/eS8j2lhnBCkQ8aQGehu+EQxLJ6UWdihCXR4
X-Gm-Gg: AfdE7cmxnOtFlaPsg5rG769sMvoq5XrLC0fFQX09OAHEBaNEH8Uij9N1GYv/2u/KFyJ
	GL1etEUIp4pFwtFq7tQZF//fES/3iwY2Y5JATW+H2GzAsTeNTW3/QDh1eAsPk0v4Mz34f+i8Z7e
	2sH+xe235ERxT7diDvQJ5wMYeB32hTfD9RpeiCvpNqvsUoy/EmZNcX3/p10L4pea5XARoVP+Wmj
	AOIpV+ILxf66nnJuyRmcI3T6eOXzVamx6vnritCNtHBkKGliRpKFecrJDDzRkVIAlZoWv0/K6+J
	bcAKyVrueiU3Yx2kWlZ0yzaUmM4kicAE+JuyIjImZBkxSWkvW8NQLGpXaYqsdc56HiD0YYdaOUw
	agbcm0LC7KlNFzbeJuRNHywC2ecyvNNqczAnsZpbm46ZljoMnXF+ySAnuNlxjpAIK
X-Received: by 2002:a17:902:ec87:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cbb9eb4b6emr63113945ad.25.1783250578209;
        Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7893f0fsm32340485ad.75.2026.07.05.04.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:22:57 -0700 (PDT)
Date: Sun, 5 Jul 2026 19:22:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Randolph Lin <randolph@andestech.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <ako-AA8uHfocQHnP@inochi.infowork>
References: <20260703020003.485436-1-inochiama@gmail.com>
 <20260703020003.485436-6-inochiama@gmail.com>
 <20260705-versed-leech-of-glory-db5cfc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-versed-leech-of-glory-db5cfc@quoll>

On Sun, Jul 05, 2026 at 11:37:15AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:00:01AM +0800, Inochi Amaoto wrote:
> >  required:
> >    - clocks
> >    - clock-names
> >    - resets
> >    - reset-names
> > -  - interrupts
> > -  - interrupt-names
> 
> Why?
> 

The K3 uses external MSI controller so it has no interrupt/interrupt-name.
But I do make a mistake here as I forgot to restore the required for the K1
in the allOf check. This will be fixed in the next version.

Regards,
Inochi

> >    - spacemit,apmu
> >  
> 
> Best regards,
> Krzysztof
> 
