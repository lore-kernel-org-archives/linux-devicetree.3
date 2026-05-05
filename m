Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442348B361
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996733; cv=none; b=DWYS8AIdcjXT8TlseJI5DYfYrooPgRclMlHpAGYEqZ0JgS2hbRDLDqx3ITXU7e7kp/baaZ5j9KMkDF1xul2a+1xPPbFUT2LXAPatEOMmh0dq/5rO9MsFgPhppZomSmQeF5aHxLZlMYSp9zmPAO/fl5oHnmYaszZchgSaMCBDjJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996733; c=relaxed/simple;
	bh=J84KpcArs6vG8jkcaA8eqYNE61DrVpr3S1BqehpaogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQFpJOuN4+wH19tjNG5yRekZlXquKbpb3f+llOi8EDM0uEEnfuxNMi6uMOaIjvIyz401JNRl3Vn+qc79+7Arpf7YLICULFN31ngZQ65SmBppxa1lzjrJgU3fDkretRYHgX3H0fmMgbenuLkZ0K+gXmNfjdDsCv4lUBsz6JymEzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Bo0T+uYt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Bo0T+uYt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so47800695e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777996729; x=1778601529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=Bo0T+uYtRK7qzCXjEG3X7Xtxbi0zVegst5mQqt045lBgootaHRNsakmETF2OvOIqRH
         SiERBZDmYy0zmbj7hfj/2yMZMxWd5GEeGXYJ6RNMuMAO0XOLy0tIA/Hj9l0fbiPzuqla
         FpX4JZlutMh3cqH2Rjfo+WYomdT1M8uzLHhtMzvXDu1KYE9r8aMNuXReyCfT2VbVfLX1
         IbYo1QmAQeh1aufH3LfK4WoXWBXcGqARcNIXXOyG84cXbrw4vVqVNqIjiidDrsbmgfDP
         mq00/J2YQDL3W8RVPArxjMrdH2yO7PWsSom2FY3i+xQ6Hpq+Byt6BYdIG6PEOsh2stSK
         G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996729; x=1778601529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
        b=Ml9DEqb/KIMYwif0DCf1tiYHBuC4TT5aAO8yzLiQpVEBGLoI8HIP3fKU774mMMR0Z0
         nlEy8c5XCkiieIPwGn43zdL6gO7pWhv78Zxp7Pa4YnX0pn6ETq3VEvqbBgXBDls1xYsk
         Byab/17DbmhD1TjQ2Ti2n3YmqkOXX2FhADPtUJ++mVnakR1Bg+PgnExZYG8u7E8cXXSB
         LMZybt03BC3v7+uMmomfIk3Y5/anfpsjtnh6Ole+2qfx3D32Yu6ET4cMgxxhyKUJ610R
         gT0rjz/PZMT1+9U1GLILGOSdYyBCo+6yDKOawFRSxl9/ym0UiJ5oAdhiVcBys3ayPONO
         LUzA==
X-Forwarded-Encrypted: i=1; AFNElJ/+Wkhv8qNmWDUKBNhI4T/tcoKIAzPWXhrurhHwIskUSIHD0cvtV2Q6olE6e9fR7qOBRDMwjUc+leQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQCth0EvbxsT/OCfX/DR/KdWpSnN7JgLoR1/UmvDR/B1tRlJh
	+v4RGsevNtnr9ADQgWOoX0aglFwH+LWutgjgpDubRfGKYrUBGNsaQosWOiJGD19zbJM=
X-Gm-Gg: AeBDietTMpZzW5v8YOrk7rH/JqPrpRV2qb3jykYHTbwoLAoSeLRzt+aoBzt0SGSvMMB
	jPSGMmNfKAR65vtRCLis1GBi0NnY8Wp8Hj8gpZw8/V5rFd6pAO4ggWcJtQAqh5Xbn+oFn/SdHcL
	USXkYvGSpUlx94ujV/R8WzcRk1NP3xWKbJtBMI7wt0ehA6j8rHXsUhTs4IASSZQP/WcPTJC+Gc1
	mpjV0lcqPo3sZsHgrcDEhXOBBwZ24twAOYLc8BpQho99y6vRXlQRgNCadYQUB7ZsglFQCntdjZ9
	KDyMqlsUxrHS3HWYXFqFwXST4NlaYrwUUbhVljeajKIOSsifNoiJdgCHjws/mKiqTb/k3RDGBkJ
	g8CQXUOd1GnIsYd10DK/pVsfszLVRcUSKFB+OLTEieT7clKhkSCDwR1g+oS5useHr/5in5GybaD
	3zwheZBJgawZAC9NMGHJvp2r3a9Ag95Xk7fqSN0WfmdNTKKe3xAb1mjjkg0+ii3tok0ZH0CndXR
	PVIV6YuBu6C59v7K1OmmDXOh2FUh1LOXP5f4M+O5xKlQXZnNjNOmI6NWib4Gve+AvXqE/Aa2kqU
	NdNC6LzMY3l4JCca2yA=
X-Received: by 2002:a05:600c:528e:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48d18bde33amr61483785e9.13.1777996729166;
        Tue, 05 May 2026 08:58:49 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm444582355e9.7.2026.05.05.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:58:48 -0700 (PDT)
Date: Tue, 5 May 2026 16:58:45 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode
 for 10G-baseR capable PCS
Message-ID: <afoTtdAO23DhOeZ8@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>

On Fri, May 01, 2026 at 06:50:45PM +0200, Andrew Lunn wrote:
> > +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
> > +{
> > +	int mdio_stat2, ret;
> > +
> > +	switch (an_mode) {
> > +	case DW_AN_C37_SGMII:
> > +	case DW_AN_C37_1000BASEX:
> > +	case DW_2500BASEX:
> > +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
> > +		if (mdio_stat2 < 0)
> > +			return mdio_stat2;
> > +
> > +		/*
> > +		 * If this XPCS supports 10Gbase-R then it will be the default
> > +		 * which prevents 1000base-X and slower from working correctly.
>
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.

I'm afraid I don't know, but it looks like the issue is not unique to
Toshiba!

This is a discovery which, rather to my chagrin, I only made after we
posted the patches (thanks to a hint from Sashiko): there is similar
code in txgbe_xpcs_switch_mode(). I cleary overlooked that when I
originally reviewed the existing XPCS code. I suspect I stopped
scanning that code path due to the PMA related conditional branch...

Regardless of how I missed it, txgbe_xpcs_switch_mode() implements
similar logic to this patch. I think it is using MDIO_PCS_CTRL2_10GBX as
the Reserved value but otherwise looks similar. There are comments that
imply 10Gbase-X isn't implemented by their XPCS which would make
MDIO_PCS_CTRL2_10GBX reserved (but are too vague to be 100% sure).

Right now it looks like xpcs_switch_interface_mode() and my
xpcs_config_operating_mode() are more closely related than I realized
so I plan to move my code into xpcs_switch_interface_mode().

I don't think I can unify the Wangxun and Toshiba code (the waits and
resets in the Wangxun code make that too high risk) but I'm not yet
ready to give up and just make the Toshiba changes into another vendor
quirk!


Daniel.
