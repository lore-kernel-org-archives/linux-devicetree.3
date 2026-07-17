Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0573C0A1C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280692; cv=none; b=eEolgeEq2um2z465i+VDCQ9ez6wOF/C8SoXhAtGHMpgcJ2AfOejI1NBGhs4yyJeNpJF6w6FVzTuEJ1qYrTcAZEKrJTK1b75vAil/ErkT60JMVxmyiKU4d8qadQSgaeJgiVW6DkD8pxGXPS2/XXgIWO+B68LQRG7KGJJQjXBsxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280692; c=relaxed/simple;
	bh=DznFh8UZjIxtgi2+bc5sL16x3pqRgUE1ixJxMc0YOjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLbUwHqLVAO/v0qylioAPQDnFmmeabtt88A8rdBfeISGytJgaBnkEe/vuD88vGF/FfA4JUhZ9fI+PPE72xonAIHzP2bbCU9z0ZWiJ+mKfMXD2HfBjhvo73VGQL5mvhc7uUTOeZ35orNv+OzjTk7ku8eCamg2jDD2qcpmnurmsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpWD+6uN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpWD+6uN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15c42a45adso189855966b.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784280689; x=1784885489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hlfo1dR9NIn3Lqj3BjXyQaSgs7H1G2kacEIIBWr8j0A=;
        b=OpWD+6uNbfxyfyVgg4SLWj2pKlKDDnt+63QcuNQB3EqwfGxCe1z7r21CCOG3E5+HOo
         qRjPZMRWSScffMFVkCvLfQk81QlntS4VBSezvU7SuVE1oFeZv237MqPA0qaF3DPv2tCw
         MOfEX4xsYDqLRWImnILtoiUJGou48Zr6J7AF/agopVXGJct9/UKGSWEnBxczhp0euduL
         WnnjIkoZpO4oG4VOuEA9jRrpETsLt656ed4qU24pVh4TE/VC3NcZa8ot5RV48aHpqOYL
         995FrVIzB/Z/Hiww+Xh2BHjiAHmlFe3ZWas+8Xf+Ug/PyXcL1eBXO/UCABfPnhogL7Mr
         Txsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280689; x=1784885489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hlfo1dR9NIn3Lqj3BjXyQaSgs7H1G2kacEIIBWr8j0A=;
        b=d7/xqAIuEZaG2e0A3ZVDzNLBdX0wdvElcf3fpxrq8l+byVSdRWQJ0iEXfPg9bHNyho
         r67jd0v67StD0HV2Nmow7dgjFcY4HO3GMK6qhVKV5WxW3us+s/O4//N+0BXdGGoK90YV
         yVyPmFaPvtx83BPYgcLlr9kc+DXllqRBw+AwoDUy99mJOdNhZpvdlrVzHUajWKhXi0j0
         My3fToC8XRx3vSv8pXkXkBv9DjoObFy7nqSNED9S6a5frH3DnXdXaWkA1rcr4zZOxYUm
         11rsc4+YzCCv7wPPw158LM+wf+y8eL9P7z/mJMxF/zR8N84RKwcfTNwK6A1HrFvnUSIL
         h2pw==
X-Forwarded-Encrypted: i=1; AHgh+RoQ795xUSci+GvMbguA0CgBoaoW/p9GoYA6OpQ3NzRJ28yv05WWbTFcgOaBZNBfcDMrAfVUUmny4LyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Jd0ayzuqLN86aYsQUDi2XQzKaFpWZCRCBhm5rHP7jnSBHMqG
	koJRjhexh1BOOSCDUSlXoDM0frwPtsmvBFGsVhIRCJF1HCXn6eJ44AOi
X-Gm-Gg: AfdE7cmloTmT6b4lz+ofp2T9sSX3J+1HaeNEDetnBKDthTEGbGL7bwP//uI5pQxj+qy
	wutVNJPo67ELWLd1bAR6IsSfh5qC4ONM9VPeRRoLtnVd2X+yJcgZ5fYxB1TQ/DBvt2s6DOZ/Q/M
	/lUzxaEHNO/Z65pM9W1QDcOztroIXYLuGOBJYc9jizKvlC72v2n+rCEmYUfCeldaVPNeC73qimV
	TZavJBkKWbmvN94fV2glE7u4WWVGyjr01BCku+62FgdS2ln62OlYlNVf/dttnIDO7OT1UqNjmzB
	lmFl6/e/0FTn7ahAxVIussPJEsqqq3yt/Q71Kmqj/HF6M3Ca2OCz5whh3fhnQtxwFzKOICWaFib
	qraHcEBqj/lNSRB67O8nh1sCR6WFQgKtlqJpv5LcMY7LHVHA/emp57blNxFsO7xDo2Iy3rfrgTr
	LM8eFVqMUcCuLK7w6rVAJEceRdULP81kNv/cQEynUYywugtBPHgLQqzftHtm4Y6Abupi/ae89tU
	2Iow9FarQ==
X-Received: by 2002:a17:907:e902:b0:c16:b01c:ac0f with SMTP id a640c23a62f3a-c16b4002ca0mr82893966b.5.1784280688498;
        Fri, 17 Jul 2026 02:31:28 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c170591172esm48042166b.15.2026.07.17.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:31:27 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:31:26 +0100
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match data
Message-ID: <gy2dn5emz7sreavy6kioz27f3sx2ip6zhkgzs2uz4qzecpkrbe@zgsortof6aqn>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
 <alkmAcDvSXr_COc_@ashevche-desk.local>
 <ondynh4kmchzugk2l24klamrcaje3qxnhgiks7gnc46wwwvo35@hysk2zaimb2e>
 <alnknz55FbyyqqlL@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alnknz55FbyyqqlL@ashevche-desk.local>

On 17/07/26 11:15, Andy Shevchenko wrote:
> On Fri, Jul 17, 2026 at 07:51:35AM +0100, Rodrigo Alencar wrote:
> > On 16/07/26 21:42, Andy Shevchenko wrote:
> > > On Thu, Jul 16, 2026 at 01:14:18PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > >  	struct iio_dev *indio_dev;
> > > >  	int ret, i;
> > > 
> > > Move an assignment here as well.
> > > 
> > > 	chip_info = ...
> > 
> > assignment? this is an input param validation
> 
> Can we make sure we always get a correct one to begin with?
> With that an assignment and check can be coupled together.
> Also consider use -ENODATA as it's most likely comes from
> driver_data.

I suppose you are suggesting to move the check to the bus code with:

	info = i2c_get_match_data(i2c);
	if (!info)
		return -ENODATA;

rather than here in the core/common code.
 
> > > > +	if (!chip_info)
> > > > +		return -ENODEV;

-- 
Kind regards,

Rodrigo Alencar
