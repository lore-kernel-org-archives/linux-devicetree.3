Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE833BAD92
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885868; cv=none; b=J4c2Vi0YqMfRdHr7AlPiE+u97hL7QcfEfFAP1NerUYFTW+9jtUrk2yAKbb3fgVXKylJ1Pl73giu+6+86Gr7Pm5/tQKIWkClUB/6AiupvoUlAoKdY/B82SRBkAU5tAhpwYEN68fuyjIz1rZGO57WIPGkXosUCbjC1DK5fva0PmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885868; c=relaxed/simple;
	bh=juKFP4M3ulZMZvtYnJO+EyGKkoHe95cLoiQ9GeTdJzw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qwr2EU8eBb0pKjwOivUxBsF1ObF+QqUK0tB9yiK05JoLPrf/enarVU0TVchPK0Gat2CMt1LGKDO7QLYcz6OPDarlSRANFlO1LtoyP0yWmO7JMCwv8U9SuD2/0VAWnGoEkE+6ohb+375Ofwq2eT6D5k88TZoeIntSyAVO+Jofl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKx0kjzu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKx0kjzu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1709636f8f.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781885864; x=1782490664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHhY6r7tYGyh00foyp4fyhhHDc2Zg99GnNa/YDtNxNU=;
        b=JKx0kjzuaL5MgQCNxoqYE+gI3UeRXYeWKa7Y9C1Fih8uARcV1fyU17AnN4MVGkDryu
         d27V19+qTwpY0pMFWBgFPq3u9xtqFIdl+6WtsnUL68ELEpcyPXoP8+4Izdg1hbC1TpiR
         qRUvkNK+VHWDx/eei9sruZw2eJ0NMkQ2Hi80wFreEDd493iW5SsRjvOLAMdB4sJTxC6d
         E1I8Ty2GHIB7aOqMoxMngskkTYv5yvFP2ld5elA3GzYh7dsK32W0jajVVau4JQDlz+bh
         /f++z4iUNqBR8h5SRMBLAiBEtbwlSDolkA87DIHsUko6otg+itAIywwX0TQemzskcdBA
         TfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781885864; x=1782490664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHhY6r7tYGyh00foyp4fyhhHDc2Zg99GnNa/YDtNxNU=;
        b=rT4CN9GJrO6ZYhQCg5rpb+ZAGyOSHMzl9IHAAwz2nyiLNBpHyBIOYXPdwlQB7X/RBi
         Y2QOK/OlGoSteBKGT+mivZ9Pb5Y1M8UvU5/jB1lLTF4tMZ4DdJiYvLnAigj4AsckCoxC
         uQc6tptZNpxQFfBG7Pf3DbQcPvNgfkezJGgNKPsPxeiXc6UwtuGLTM857+68DPmW6spu
         tQaXN7OkJ6IDal47r/1OsEoHSZPt1UN3xeWWQ7Or8Qmfpz+3dGqJYwdejAcFso3Aj1QO
         JoFV8oSWf1a8K6kcBrPv2mNURZVqw2WNjAkQbylbJJTBJRIoCtNIqRaYA7wxu+/G7L1c
         DjrQ==
X-Forwarded-Encrypted: i=1; AFNElJ96Ph8tF6yyrLvx4vUTKegrYUTtkmKGTA23TVfmotnK7A7kA4U9CgunjWBPVmkaTXwXpsXgddn06qr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9iOBmFImd6AEHoSGw1lndMkdN+gLLNcqTAlumn8eQL7+KUzEv
	5BQMP4+gTCoKsL9MFlOKb4oksGosp6FcAjcc+U/kShQlvNKsKJALR/2t
X-Gm-Gg: AfdE7clxBdqwEKvPcVOcbfl8dQ+AMKqBLwyGinQ6+coKadmBwWdtdw9p/qU36qnHZ0H
	yjrQJcx9fcxzslwg+d3Ylz4tZoqXt8NjhT3mQJOOQJKzd02bj0I4f/NIyy/YP6+lGj6kWO4u0Di
	3irSKR5iQk9IatVnwTIVKmuHYwq5Jfxycg3t09Nv12V7n72RfBNiTrLyew6WLbwnQdawQxzYT2u
	Qs1k3nPOTi+VXnBOyRLdGpXVq86eOowE+7XMsISq9GJybrfGvUIj3lOuX1FmdKUu4YCId6yVZ7O
	NbWPLf3h7HSSHM9xqFl5e/3PCMTzXvblNF+EXO+E+tKnRFi9EIAT3UhjMj9aJHBhhmA8v918iub
	wrjKfVB88zq8pONZ9R9hjwR9/c95pHUrNx7kkd6IKQ48KFFqJsiV+DPGPCPV/r0mgqapKLK6YgP
	8bF6TSEI4YfL7ptOM84igTrCzp8z2cQWBP9hxNkq7UOhn12oXIz2uZe6ra6gYguaRfSQmWEVdDj
	MGsIu3mp1c5ufkbWeLCwjc/Ptvo
X-Received: by 2002:a05:600c:1f92:b0:492:3670:85a7 with SMTP id 5b1f17b1804b1-49240eb1347mr71855945e9.35.1781885864196;
        Fri, 19 Jun 2026 09:17:44 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57b8asm131866f8f.26.2026.06.19.09.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:17:43 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 19 Jun 2026 17:17:37 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v3 12/12] iio: dac: ad5686: add gain control support
Message-ID: <jcn5gqsjezxrnk74hrsujp56e2iqlr2iw3nwvtwd26zvexri5p@a25egmpppagh>
References: <20260616-ad5686-new-features-v3-0-f829fb7e9262@analog.com>
 <20260616-ad5686-new-features-v3-12-f829fb7e9262@analog.com>
 <ajEppnu-AWSbbihS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajEppnu-AWSbbihS@ashevche-desk.local>

On 16/06/26 13:47, Andy Shevchenko wrote:
> On Tue, Jun 16, 2026 at 09:21:18AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Most of the supported devices rely on a GAIN pin to control a 2x
> > multiplier applied to the output voltage. Other devices, e.g. the
> > single-channel ones, provides a gain control through a bit field in
> > the control register. Some designs might have the GAIN pin hardwired
> > to VDD/VLOGIC or GND, which would have no "gain-gpios" device property,
> > being able to set "adi,range-double" if it is hardwired to VDD. The
> > vref_mv field is moved down in the struct ad5686_state, so that the
> > overall size increase is reduced.
> 
> ...
> 
> > +static void ad5686_init_scale_avail(struct ad5686_state *st)
> > +{
> > +	int realbits = st->chip_info->channels[0].scan_type.realbits;
> > +	s64 tmp = 2ULL * st->vref_mv * NANO >> realbits;
> 
> As Nuno noticed in other patch review, this can probably use mul_u64_u32_shr().

This would be need in case the multiplication overflows, which is not the case
here.
 
> > +	st->scale_avail[2] = div_s64_rem(tmp, NANO, &st->scale_avail[3]);
> > +	st->scale_avail[0] = div_s64_rem(tmp >> 1, NANO, &st->scale_avail[1]);
> > +}

-- 
Kind regards,

Rodrigo Alencar
