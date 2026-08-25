Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4533A71A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674021; cv=none; b=faGx5QbjWH/MUS5Mfe87ZSXvzv70Dt0EkvvK7USdTgpUGcnD82iVXWW8Pr7Wv/hmiAHg+rpnjxSglE72lhstBePnJ3cJRg2RxOLOFklgLIs01ey7+pGQhhuMQXhu4iEFQNG9wr+NwOEmm+IM3z/IrT6K/udcCFDYqqwPIhUd/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674021; c=relaxed/simple;
	bh=DvKH2fFcZ/uhD/ZuKu0uGpyMl16LVSMA9icM14BxbOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFeLmYwCPEJu+CpXYodIJ8izZj9f3cD7c5+BKX1jFclJgbMBd9A9ecHvuYuB4IQY3QTLwwXjQ1cBc1tWzBqQ1T9g0Te8UafHURyNWx6hmyiV3cfJup47Wp8tgBk8IaO4kyGp4/KH/zdzwnXfcTXPAqwvZC51HNAfQdzLqfZCFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S54QIlPx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S54QIlPx"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c52d920b8so707068466b.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787674018; x=1788278818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdqXyZVZhBIDnSDIcLKPXaIgy8TBNW5ywHFUYDexGKw=;
        b=S54QIlPxfzEMRvnY0oIBSyqi4JP0HxgyDJgaADCYJXzzPBUAdPaKS5dNCORXQ+CQVD
         VhBXnxjsEDb/5PO618q+JS1mDBlwJi6hAu5tVjaw+fOdwCOdhb9bIiuZiS6+sh6GEVBz
         BuXMDixPWSD/5t/F+q0FLpEhtWstWZC/n+n6xuMYQIOp342QTlOhieWYM7hwENX8QfWM
         BUfllep2R1WDd/h4yVX+EMcTaYa/htS+0q66tXcIGZSN2z99u/EfKllUBCF5YZMvB8xN
         g/UENuo3pO9J1/muAmgFl+DI48kATEpZC2kquxKZPJ4rYXkb7+wEM1h/3sZ9SCCsW7/e
         eIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674018; x=1788278818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdqXyZVZhBIDnSDIcLKPXaIgy8TBNW5ywHFUYDexGKw=;
        b=PAgJ3BFTMPjVOiTEna44LRultSb3cC+b4o4yVMUbk6QX76RojqlVS7qOwBmlkAi2Yz
         w9w+nHONwyNh+DzL8OH60OzAoV+UjwaFFB2/zcfBozDEwsa0FCAd42z8wF1q98fB0CbF
         Drq+NxbVU9eDnNg6kDG6QZ0l9Hi3oustBbWr5W9f0PelvXrsozrXIQe1BNNnPHcvKmic
         VrITbAtwmDaKgGftpsGuZkOmxJeAvNaS+mX/7oz2RA+YiX2KN5EcNjG8tDg4QkIN96dd
         Mw+AA8EUa78qQxXGXWp9IFtJHRG5FIO+ODN4EIBOUTvwQSvVe8Pi9K3pFjs/OgEAjW+F
         i3+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQO9+ftejNp2m+4I56wJHh4lDlVJw9r23wb8cWn+rcQ9QcpjYuFQenL31DnswyA3Cf63Jy1KWutvjX@vger.kernel.org
X-Gm-Message-State: AFuF++k/2gE7B44z5LjrkXy9ScLwAkH2BcmAWlOjJf4DqPvfXR7Bu9Tw
	Cn8WaSZeV/iqThOLq9TflKxjw0pPuGrDKov1XsFTz44ePXvDfD1HJsEv
X-Gm-Gg: AR+sD12o/oOO+sc8Y6AfHxNuD6EVjBwX8M0naSakCcTZNEyZU86FFIOenqjUESOr6oQ
	sDCkEFlNFFfcy5FjtUPg/KPJaDTdQtCizz2fT4pEmgI2T/PoN+l76mObL7lSOj3TkBvs4nwWz/K
	zXxXFiNWSU/6GaMcxc0IARtkj7eCFdavinxXi4LMwNJAcDEsjME6USpKqNFPdHJsQ+bZhLbPPRg
	hUmDmJTdG6TeszKNrAFodaATGkSh7KgzNC0rSD9Zq6iqfGzx4IVlKUcZO0tbIpgwRKuh+RBvZxR
	L4BsJ97Pr6EJyr7Upw9QEaH9QU4ga+5xriVv+OKlJMgE70cjgu8fH7Jq13VrrI6S72GFh4XMusk
	u8rAbxmNvFZwd3YRp5E4t/vyrQoUG1S0IR2AqrziZzI2oWyz8l6VGOXRq2UleOZOcXb60Hhizk4
	3YewcYaQzlL7P9FNnaQZtWduJ/hs+4Mps6nQNEq7MfQwrVDDYRnowKIjSPkagRTds3cPOwdD7r5
	IlDF9VK7GFbzjX/cpq2E+fsX0HkcYMV
X-Received: by 2002:a05:6938:a08e:10b0:c21:7584:fc58 with SMTP id a640c23a62f3a-c24e5b5531emr663869666b.12.1787674017582;
        Tue, 25 Aug 2026 09:06:57 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62dfsm24369966b.4.2026.08.25.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:06:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:06:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <ao29neQwKSWlK4Lx@GLaDOS.station>
References: <cover.1787586961.git.stefano.r@variscite.com>
 <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
 <20260825071648.B547C1F000E9@smtp.kernel.org>
 <ao2p-Yj1HfJeeVOM@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2p-Yj1HfJeeVOM@SMW015318>

On Tue, Aug 25, 2026 at 09:43:05AM -0500, Frank Li wrote:
> >
> > [Severity: Medium]
> > Does this GPIO hog conflict with the native usdhc3 pinctrl configuration
> > for SD3_RESET_B?
> >
> > The sd3-pwr-hog statically claims gpio6 11, which corresponds to
> > MX7D_PAD_SD3_RESET_B. The pinctrl_usdhc3 later claims the exact same pad as
> > SD3_RESET_B in its native mode.
> >
> 
> Is it true?

It's true, I'll fix it.

> 
> > [Severity: High]
> > Does setting the sw1a maximum voltage to 3.3V violate the hardware limits
> > for the i.MX7D core voltage?
> >
> > The sw1a regulator supplies the cpu0 and cpu1 cores. The PFUZE3000 SW1A limit
> > for this design is typically around 1.475V, and the absolute maximum rating
> > for the i.MX7D ARM cores is usually around 1.15V.
> >
> > If a driver scales the core voltage up to 3.3V based on these boundaries,
> > could this result in hardware damage?
> 
> Please double check this one?
> 
I double-checked this.
PFUZE3000 SW1A supports selector values up to 3.3 V;
the 1.475V limit applies to SW1B, not SW1A.
The regulator-max-microvolt value only defines the regulator constraint,
while the actual CPU voltage is selected according to the i.MX7 OPP table.
Therefore, the 3.3 V constraint does not cause the CPU supply to be
driven to 3.3 V.


Best Regards,
Stefano
