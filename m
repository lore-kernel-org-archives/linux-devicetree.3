Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DC34DB7B
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466805; cv=none; b=YQ/aVXcu/7IDduiDYxEOsVy3t8KkzAU+zdiPwCeWDAkGIe43u+6xanxKaGOMOBstASFFTsV6HFEmPlzLg8IQGK+O8TY/uIXhhbhWNw3RWqtVXeGmQfh5PKtOYD9N1PaHU08bYuN01QPWBWR9YblC1oSxUqENG0+Kai/1snF5xQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466805; c=relaxed/simple;
	bh=Fm07s0LJEPJFPXZOrReLReFYBTP8YoXXyqIbew7XXdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjyw/YtChiA4uSeoIKGZyiAYpTHemJ9DZwFRqLdqhyPsv10Dzfpl3F3mrP5Zn8/VppjhNHIeEgeMLtfY7RGYcjWNYX3Dfw80ykjKTtEOvXoS/LLU0i957Q4G0v7WhtQtJBaFuZJPdxTO0Oen5BdjRwGS8QI3fpmLpCfQlclySao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZFxdk5E; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZFxdk5E"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so8002155e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466802; x=1777071602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=JZFxdk5EWDgr43hKTEWEcgj92us8026yOO0VrnCRLaEy/PS93PJspHf8P5g3LVyWVY
         QUmrNVJMX3GeJyeTDTTGgTQBwU2X85Dip4YN5TzgJp1pGQHkZoig6t+sOEYM2VMHj/+E
         JOLOB4BBUqgGLnqJ8C0Lr+DdVCVW6TMtc9Zp4huQyDnKdEsEWrwoY3vnvf8lgwSmd5JU
         ARxAcCQjEFcKWwzkb0mgxvRiKuNEITu9u3k+3zo2GFzSsdqL5CjpkajhVuXNRoIqIVas
         UyDYQNCHSqxrZAsl3ZR33TbVc5cd9cdl/R3MOLVeKgK4Lc638vLWejIcxFo4E5eSoLnX
         GDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466802; x=1777071602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=Is6XuTyQeBLnqdcQCSw0BoN5A60s6e47hQrMESJhEAiAf00xhYtTAVrB25Hz7S6KJB
         dXztf874/LuwSaTnincTZkZPbTouLaMOO8VV/XRrUNVBE3Zi6Gs9Um5e6m0H3tZmVS8W
         QsKn/Tkix42fcFtRAPrEDn0R8wjtF1oD3v6soHYntESyQw2BfWI78d+zSRhdi57QrY9r
         0zSAW0luzbP0HtLgIZ0nCFq9Mpyc4F3MwxtZvq3MYhqUy4XtjBGKbVEShP3MufB4jjlH
         ybrOzu1MVBQEc8+j18/1QL1jobHabydWPPXb0zGsFAVVmJiLvfVXXqvVQaNr1sXKW7Ou
         6ZNA==
X-Forwarded-Encrypted: i=1; AFNElJ+QOj0eS31wH56Sgb4K/tfoVvHsKqwWIZdg+GPph/AQ8xXVQEd/D9broLw4Xp6zMXqxRcwcWO5I/442@vger.kernel.org
X-Gm-Message-State: AOJu0YxWzs9bO4lNhJ6ZN75WFobfjBHP+K3LowksrLu/NFcB83KJpkjo
	M0u08RBRTtGfkmdmD4GnHFya9aItZX/Svrcj/hAN0d1ie+Pq02+nELev
X-Gm-Gg: AeBDiesZ3RV3DpozSyd3EvbUTs4Q/myIlgk46Ev990+bI0wYh322k5uIHIXBvebDLxh
	6XoMyzOB8ZvRehfurx7+V47qnqjIk7TpinJzNjV9FIAe7Oe8OPooAswPfJiqUzX2Hu8htL3k6J+
	qbPhPLjqfiQgH80Ay+RDsM0Z59gD2O+tvNPrD5kw2oob605XKOXCSIVZ30yL/w6L0khvEmDNSRs
	vrUEkEgX2+DEcK6Bo+bk55ho+0xEsTqOU19tm9MPgKj25nBk2yzvMHIfOLHEVWWGmTglNnSbIxO
	E/1EAsp8uNyxGCP1fuEwZfghymMw48e4I0gyAS1jn1t8o9Bz2VgjX1JB5ukv8XOOYUpBRTaNQ73
	HHVPAFnYMZiSChuwh44raw+t/MB9hFupzvsL/94byjuMJg10mSsRqPlsjuoQB7fWZQXXzV+dBZY
	i+zfGeyn4i6QXFXQg9NML1P+TVkfJXn8UtUbfgzq22jvpvAgBAXgzgpi8o
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-488fb784662mr52675915e9.25.1776466802424;
        Fri, 17 Apr 2026 16:00:02 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm71813135e9.9.2026.04.17.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:00:01 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:00:01 +0200
From: John Madieu <john.madieu@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Message-ID: <20260417230001.vzbeym2ik4wytdfc@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
 <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>

On Thu, Apr 16, 2026 at 07:57:34PM +0100, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 12:47:22PM +0000, John Madieu wrote:
>

Hi Mark,

Thank you for the review.
 
> > +	/*
> > +	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
> > +	 * These use optional APIs, so they gracefully return NULL
> > +	 * (no error) on platforms whose DT does not provide them.
> > +	 */
> > +	dmac->audmapp_rstc =
> > +		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_rstc)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
> > +				     "failed to get audmapp reset\n");
> > +	}
> > +
> > +	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_clk)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
> > +				     "failed to get audmapp clock\n");
> > +	}
> 
> Do we need the clock running before deasserting reset?  Usually the flow
> is to get the resources the hardware requires stable before we release,
> that helps everything start up cleanly.

You're right. The clock should be enabled before the reset is deasserted
so the block sees a stable clock on the way out of reset. I'll swap the
order in v6.

Regards,

--
John Madieu
