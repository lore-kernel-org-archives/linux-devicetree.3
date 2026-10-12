Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F131354F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806546; cv=none; b=AX8Ce2kdrjDXwsKUi4fzxf1wOIViZHaPufa2t8u9HIm2LGL0rVhfcyGG58j2hbG40bUjJEnIwewrt4VV10NY876zZdglT7VdFjMKTZU4ubjeAohNrxJjHHT6oMHcfGu9oZVhSfEfQgBl0hf3o9wor7oRhHidrIPlU+0vXX6IDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806546; c=relaxed/simple;
	bh=LhdrDr3n+heBp+EYcLVua5HPQEX1Sbf9QjYWaMoeB3w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pteIYZhqkpvdNqeur9sSDN8Ug6QzW+Smu0kWat5afr57xvmUhrGmI7fo7NE9J63KVuiWvuWu9HqhCqsIoheOzJCRngPIbYEDzdJkZPFqN5gt/6j9QzTlsHkm1GlOaVi3T9oHEbbmFVfTYYJKytxM0cA2XoCNbmefveRHIi0jGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJCoEXH+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJCoEXH+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21339705e9.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806544; x=1792411344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kddTvWvhF+27bMv7g9Zho7YBUmupNxBjMAfrRSgPbzw=;
        b=eJCoEXH+zFmFT2OOETmkq2eQc8QS2483y4hPRxkS0BVwIS52+xOTfe49/SxpFMrSmD
         k3l8ERfAkJhx0m61OPt4/VuXTUTaL6P18Wj7Fqe2BbwfV9ujTEWnJ8uc7xG35wFj7ZVa
         44Bo2tMNuhXQAqleqdxUlwbdipqRlDvqeymCeGE8HaJ/2UHARZw9SjYfdF+OUXAtFfnc
         CJyHf0QqHSHeq9yd4lQKdknRLvmkhoynFGiinC8fIaubghETmmFmwCCeerEcRPTUNxMh
         MK3aCEhmIn18JD1ra2dfrGd2H3kkspRgMfXK93Wl08BJbDZ71EkKRvYZ5hkhP2NTAEiF
         Q4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806544; x=1792411344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kddTvWvhF+27bMv7g9Zho7YBUmupNxBjMAfrRSgPbzw=;
        b=u1NKVIXoFTqn2DVSSFEDpLJ1x0BfIhHo2PNhglbzfDBbiIZGIPl7jTcBtotMwDZvDe
         PJVBhY8cRU5ea6WIwamLVgFVie6qw0qS1+aMuoYYy6L1lSaXAKP9QSWDxIZvoh3JDZ/u
         /0H6zoCNdxmqrMZgcCvvDF4v1t/q2IDUYTO1x4E6wuyfO6o5MQShMxhxjh58ingbJfL2
         6+RrZjdObZhUMVkmiOwi34EBqYmJXS93SfFOns8f10xP85h4vqxt8edW0AZpo0fTy34T
         ajd2UokNZxUK0mlNP4C8P/CkLCNFdxztl9LcVtGlGWvsW7BrTvSsFSYBQl2+TbbSTG6+
         hPUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM8372bHVgRREA4vp/I+lSnXLbyZ4Vv13o0gvTKE0B2FIXwp4X/lgHZ/7xp9GXKVARMz+BnKOqY6Cj@vger.kernel.org
X-Gm-Message-State: AFq9FYITVHEhbcnmKV5hbgCkNoC1gdPGEUWAACKkhgyYZVa2JInf9c8c
	SmPLrKr0RYzsKuhO2Wf/2xTmRSq0KMHNv3nOrk26rKfqbySheN59Lpkc8RAn3Q==
X-Gm-Gg: AYBFou2va5Ul3ICwou8liOJKOl7QlJUeZqM1dYV7DSgv7Dip6wOvTIpIUGlMSiB4KHt
	St1vXembf3Hz0dzDXOThz00Nd1IvG1wxUq2W3/Cfbw0p2CN9YRINxpJihGhUMyGT+aDDfkHFqNW
	oYiYhXVcDytIu1eTmELO2IGo5s1qBoJgdwaxqeRuhsmFQlbES35eXdOduZlsYXniVCLbJXhGrw6
	MoLRcMEalquMNYaRqsLNdb6/VvzF0YbBmQmvyyNSUiqzwiaQbTpyMa6WdEzoQLlAlhouBNTOo2U
	mHXqP+SKLc33wy5Wbb/NpnFqjIH3KNJiNNhjV4LWwY9RCInetM7Wv1ePlHGSjOf7eNlmK6gmhka
	Gj0eEepE0K7I2PkYQJzeFfnNW/1/hAYVmkq4SsYkErFZANte5bTaadpPmmWcRaxTj3Bl7GYtqaC
	+Zegp8wcRumSlVeBfBjRoYPGSDmMMfvhoAmWeprnLLYe3CoOuWabkxxz/ogCDh7CPCKlJLH8VVD
	Cl8GzV8+K4IroAQa6sG1l11BjlzsHJqdGnnpMDS0mSWhSL1bwTpRX4KMC33FTPc0D7WzJiRVuuU
	4s9SPFq09apW+6c=
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18e4a3f69mr171571165e9.14.1791806543307;
        Mon, 12 Oct 2026 05:02:23 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm150533075e9.2.2026.10.12.05.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:02:22 -0700 (PDT)
Message-ID: <6acccc4e.4c22a69b.132624.271f@mx.google.com>
X-Google-Original-Message-ID: <aszMSyMGUIPNvy1J@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:02:19 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166721@kernel.org>

On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> - [Low] mfd: structure and variable naming violates MFD API guidelines
> --
> 
> commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> mfd: an8855: Add support for Airoha AN8855 Switch
> 
> This commit adds support for the Airoha AN8855 Switch which provides
> a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> and registers a regmap for each internal PHY.
> 
> > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > new file mode 100644
> > index 0000000000000..a2778511dfefc
> > --- /dev/null
> > +++ b/drivers/mfd/airoha-an8855.c
> [ ... ]
> > +static const struct regmap_range an8855_readable_ranges[] = {
> [ ... ]
> > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> 
> [Severity: Medium]
> Is this range definition correct? The General Purpose Timer range
> (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> (0x1000a200 to 0x1000a2ff).
> 
> Could this be a typo in the hardware memory map definition? It seems like
> the General Purpose Timer range might have been intended to end at
> 0x1000a1ff to avoid overlapping and potential register access boundary
> issues.
>

I have to double check this from documentation, but if possible I would
like to fix this with a followup patch.
 
> [ ... ]
> > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > +{
> > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > +	struct device *dev = &mdiodev->dev;
> > +	struct an8855_core *priv;
> > +	struct regmap *regmap;
> > +	int num_phys;
> > +	int i, ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> 
> [Severity: Low]
> This isn't a bug, but does this variable and structure naming align with MFD
> subsystem conventions?
> 
> The MFD guidelines suggest avoiding generic variable names like priv, and
> instead recommend using ddata for the instance variable. Also, should the
> struct name itself avoid hardcoding implementation details like core?
> Naming it something closer to struct an8855 might better adhere to the
> subsystem guidelines.
> 

I already updated the struct, is it needed to also update the local
variables?

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=4

-- 
	Ansuel
