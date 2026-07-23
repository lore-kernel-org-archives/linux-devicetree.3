Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB936DA13
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824981; cv=none; b=RqqG8HNBFjX3TwyVFAU7aRNWXmu64BcD2tlIWbljYuXaLIQ6pQO2//d5toHhSrEqZMTPRnN0KTRjghPaDr0eMPhj4ri+m+k9mERQrCJrrb7vX9Dxh+b/LctWsdunTbCzZI/CQLrRW3ecXlYHt54v3a7+lb4apiNIdR2gOaFCys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824981; c=relaxed/simple;
	bh=Uqj+joQiBFE5zvQmdyC4BrL68D5s2esloap+GA1As1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyA3Y1p93mxk1jy8FFzkIbcT0SAM7DDvMuLYecWncjAb3+v/SpPDvfSRhAkRCHJw3c+JlPfgAuI8YYG9w1rkgfyobtCezDLAjb7DpkyqknIT1wuh+GdBikGQVeUPmLsXTcTm9/WSY4hcz3h9NHLR+AClkOiVehgD7b8Yhv5i+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XvkeMhj2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0xAzGmC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XvkeMhj2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0xAzGmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784824979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
	b=XvkeMhj2ER2tDVFSWp1EO3+DBAWZ2Tg6Mqqu3x2ctDEhAP5e/pV06A/Xmstt3MYW11rat7
	E0/tVXNO+RZnBujxgLElDTOufMr+2PrJxLnzZwSGFCf3/p/Rw/JRDl79dwECLRwP4AHAhS
	kKMmoqAtJykGNaelL9iOZIfKQ0SRSqI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-HGQQhX35MwefB7EQIqHV7Q-1; Thu, 23 Jul 2026 12:42:57 -0400
X-MC-Unique: HGQQhX35MwefB7EQIqHV7Q-1
X-Mimecast-MFC-AGG-ID: HGQQhX35MwefB7EQIqHV7Q_1784824977
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec45d9628aso16997226d6.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784824977; x=1785429777; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
        b=L0xAzGmCGuHmeqQ9sn61bMNGusNsfj61i0YORm9jRG8UnwcJ05fvBbdpvuBI/K0dWI
         vGCERjgdNloIDST2ycD0INdsL2TcA0v6l1vwyYk4iE5TVTKAd15ij9sBfj1tOdR1SlQm
         gZVRZOn2tgdDnpxrGtZPpOgLSEENs1683yHru6C0L5WhO22Ui8ri/bk5lyVYQs/3RFUC
         7xjdKeMWO+YDxDG/bgLLOPPm1M8JOgxKZpSqHQltXwlkY14kCOCK1cBv6WJsHlC0C9Pk
         i9nakJoXKYplUdM899/pu1TjpwZ70C/pc6H+0OM3SftY3UHiuMsbLduHqESJUuF6VhJZ
         lTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824977; x=1785429777;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
        b=QMjXviC+NsW9Hj3WOIlwo3npw9eOF4kE4PdzAunX2xmNhYByXpuKP11+Pw5gsBD7bx
         oHCckN7awK3eX6AdOQJBCkBA2iiNbRyA6PPJ2rq1E1et9MAmYKgNnEPKIOx3IhkArify
         6RxbauXAOU87OwOo4x62M0s1Kxe+RVFTlbMXdQYbzOg8LSOY0bDXt39i9V1FyRZPfUGA
         tzdIEQ+aXT1Yb6zB5BwqNUtGUCS4nCdKX7tXlSvT5sGrpx6EIoEUoPKamPjAlvM6w5Ar
         WzVxITWHnclN9cP87WWDnJkLK+hKnVZTzR6Ix5fISTVIDnuRu095XOrBOX9z+MlI3Hfc
         Mx0w==
X-Forwarded-Encrypted: i=1; AHgh+RrhRmHRPj++Dhe6AMaGFlEI41Nb588frnc0PGTDmxPIJIdI7RZ5McGMZlR+QvMYp40pEGVJhf9xGduA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYnqfec1838FvLdPde12WMO3/DZuuKjHbuVq220wZ0cHjEDuF
	CbSQTAdf41iP2rq7W8/vmePCZXab22A0BVxdSamk3Au3HIFXZYhDf2+Sw6xrWDb+kFuEtAa2aNx
	8rr8kTJGZuXzIYhtLMUNBc8XY+qTrzbaWqZoLBwHB7NsYu7D2Qkz9rPW7vGsj36/3CNaNfN4=
X-Gm-Gg: AR+sD10TiXSDuKY1AvgtQZQ60wFRakqWD+vBeuWOh60O9tcQKirSp6w9hM4+YVMMmqK
	wwf4exoD7xamMjhziJI7r2Xx1Hu75VhEak4te5dwNSPJzEY9l9maJP4T5DQAW47dc9euWXpgmnH
	veYAz9QSrsLw/5NmcAKo0D2Bf7CULub7/rtMekWv2vUiLqIsukz84Iu3vV//YYteXfe8+6wJjMi
	uXMBfiy5rUyIWE+1ambjN78Ed6lvMA4cF3cHPu/N5ZtMxlIyha5UUTKwzRwcntxgQOButhvtMDJ
	NSBDZlxM56QRlcq4jAbYJ+LgIWVfBDitUxOCoxqddQIm5IvctjkrX4X8Mk3EHkLU4k76GjDWnkh
	HqlIfUMjPDUKwc+Us2D5rbkJkFbebh5iwzII=
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588926d6.26.1784824977050;
        Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588416d6.26.1784824976552;
        Thu, 23 Jul 2026 09:42:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm48281876d6.46.2026.07.23.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:42:55 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:42:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amJEjofx348vF4Vd@redhat.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723090808.1727598-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Joakim,

There's one question from Sashiko that I don't see where you answered
that seems to be legit.

On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

[snip]

> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
> +{
> +	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret = sky1_audss_clks_enable(priv);

From Sashiko:

    [Severity: High]
    Could this result in a deadlock? When a consumer calls clk_prepare on an
    audss clock, CCF acquires the global prepare_lock mutex and may call
    pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
    which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
    clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lock
    again.

I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your driver and
it calls clk_prepare_enable() in probe.

I'm not concerned about the other feedback from Sashiko.

Brian

