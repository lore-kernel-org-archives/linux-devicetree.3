Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DD242DA2A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386398; cv=none; b=j8Vz8Rk4tQ9go/lOpHvx9QWDDEAnQzpTjwi9HIarvat4B8iIsN/O2j1to0kW5aXdEJmUEZsMrRGKwGfkrpy8IugySV8ucDi6Fp1Zqv+Fn94xgX/WU4TruuEbAd5/GEjyqyO9/KrZq2KEol8v00riY4sdgiHjPf+nU9o9owGPQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386398; c=relaxed/simple;
	bh=uckYMfA+3rj5zvRzcktnwG8O/XsnyeXAICZ5/FhxyPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckhhx2UmjolZYKVbfpAnPXaINY03jRPyDQGjuMNzboZTF+AGja1ADRho+zfLjx544mtTIg0OsTArNxt4QhRiXQRptGTzwZUl1LA5tBkNH1H6mNBzDxJJHPdT7Ha8Ia+CrCdLgfIH0sP0qi0pqttLDv1KgecgMm5I1tGhgz5i+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frnqZfV8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frnqZfV8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848643382fcso2059011b3a.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786386396; x=1786991196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=frnqZfV8P9aTuXNyKpaJFbWuYPwhG7HziqAZ0oh0NkkiBgd40nuw2TJ0tki/D6fnD0
         1mQUog4omfSyQ9hLjTgctFfxPJ6HF7BklaRntYFMz3WmlRNVY0n9nymD1gtAsPAK2jH4
         xiYzj9eRQ/OT2GbFpbtRTAuwzeJ/iNNot3uThIU/sg7arK8954O8H71i2TyscoTc/ryC
         qj6XnxcBFwgUmKMj9gs2zc7SNbzE1FyryBSkVg6VxdIX4hnGtXpVn5u5+KEhSuOjE2K1
         iuw40Mh8PCT1nXUdQd/g0Mk04pBlqdROKFw3UbsnTYad4twTISNsD3QozIkIvkMY3GtD
         FA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386396; x=1786991196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=C0CO/kqybC+XqCSmrb63yP4ytwuPC+6oJn7pSnP2iJrMZYRrofuGTEs72FraIwmMHJ
         8Q4DiKia2y5Ni4dc0rGhzb8Jm2Qnwii0j20AdbC1cp51+gQhYehvcgZknxf8cJ4BgLRF
         fAktDeXABf33kSvcOJutyrSYDZuyYYBjJJcBONIXQuMP7h3fys/cJcoIVhLLvfve8kGm
         l9ebGxi1pktwL7Fyapjs5dF/gHHDotRgy1rb8sz/MrsIZBrLlKD6AST2WAPzATCmN9dr
         C6sm9oXdAhBNC/B9PutjopxKZN7TXk6CrlYtPeZqicztrKFYEWevzAZG8euv2PncJn+t
         I0Dw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9KeDUI/l42N6hj1Py1K+6h16ZcmRctvS6ERdhOYKo+6RdHOnN6TmC/zKBVEgvJLeN+NlKNGDH0BdU@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyzg2KyTHLN9b2U34bNC/FWo5LfFFlusCnZrG6enJYB3hTd4g
	M0VXg+kutsyh+wHZjBtHDv1y4JgXTz1fVi3fyt9iEVyNhPrKqeUBut9G
X-Gm-Gg: AR+sD11Dw4FtrOiXSY5Tymbl5kwpOxtCy64NzEojwttvOGXOQycQcxS9lWmEtV7QGcQ
	M6UT2ILx1PthTlK9u2l4//NsloVyJclJYabOU1yCEYKkzcmtOyx+QiLuwEt1Uv4Fj6r4OeV3AJ3
	GR2uGBFpVYs/tQXuA63JVMWodtxCOllW2QRVJ9wyu4kI+eM9GG0BPUxJVa5J6gg8HItMax/TIkO
	+6UfevPsuoc3tmhzIl86S+O8Xbx6yNN/H2m016tPamRNtv8vANMCz00ztYXupZedehhgmuXgXUh
	AdoeMAHUaYnXZud+edD+IOVWwG5rrPut9GERWFtwILd7EnkAQEeYQ5GPnMqWlF58x29/a0g99de
	M0Si1U+3Dw3QdGMbaTMUbfHZMk7ClOojGBEbGTiFPcWBdKFPUfdmxxXZ/dZ6HVShI2MCuBTzPtr
	OKeQpXrUpx17hwb6CGe3Ixb6hypB4dPSJdGNQY9RGd0fkVckYKIazHcYZ5wixm1WSy770=
X-Received: by 2002:a05:6a00:6c82:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84f2e0588demr52646678b3a.31.1786386396492;
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm4377478b3a.22.2026.08.10.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:26:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <3hxiy6aaiagt5zunntpidaeqc4or4wrebf7mu7asvyyibqmvo2@xhvasdqp64rw>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
 <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>

On Thu, Jul 16, 2026 at 02:09:19PM -0300, Leonardo Costa wrote:
> On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> > Hi Leonardo,
> > 
> > Would you be able to test this patch on your affected boards? Your testing
> > would help expedite the merge process and ensure the fix resolves the boot
> > issue you're experiencing.
> > 
> > Best Regards
> > Richard Zhu
> 
> Hi Richard,
> 
> Sorry for taking long to respond, I was caught up with something. I
> tested the patch and it solved the issue. I sent a Tested-by tag there.
> Thanks for looking into this!
> 
> Best Regards
> Leonardo

Hi Richard,

That patch might have introduced/exposed a second regression where PCI
devices are not linked properly during the initialization. Sorry for not 
catching this before, as I didn't have any device connected during the
previous test.

Link: https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/T/#u
