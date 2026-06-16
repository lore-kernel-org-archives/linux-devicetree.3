Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87D3B14B4
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607653; cv=none; b=DU2vzzxvYfAVwB6VTty1jMzh9CzrDv1B4dfijAz1qQSnydp11BDpMYsweM7hf0oFNXiRFfsXSFvcjCowJVSFQRyQIvR9UDTqNtmBk1FLxj6EGQbNf6xWp2Ed41OMZV8qLyadeGcYmpsxD5iIhaQ9DB8K60yH8aAAyo6IfV8KaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607653; c=relaxed/simple;
	bh=z+qESeFpb2XkTbR/Okjo5v5Qr3euoD+chi96tqKTTqs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYdRP5KZMNTGQB89ZK3m7ZcaTt8zuZtOwNVr7f38n7v03XoxoeQYxs4e4k/FBTuR9ystx1tj9VzpSWVsBfvLfUpJEZUwwfryAjlLlzQNwOJBYWzVB5r42Py0+gMu+xlRkjS1xNQms8INeJ3X9/pONQ8tt8LOOGZojygexlXgiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwCb3wmD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwCb3wmD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bed2195323cso666389666b.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607650; x=1782212450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bZm1yyHX30uMCUt+HLHYBYfIefkCZ4T7Ob1gBqI0/A=;
        b=GwCb3wmDSBcGiuACUIqdGpuzq2GbWc0KdPaUlYqos+6L8IUWvdwVBAmnYY0vYXoSJR
         +VcPZvrZaubOdx4Nc/m6W8SwoTpQ7BAg72RbOZFZJ93v4zyjFc+oCuNEc3sWR2PHB+BK
         LfIydCd48Cw/sQmxqytXXRQ8fIR+Hs97mbFVW+VApdO9ZnGMLjvUMWZ4sQs9ugTG456A
         y6aOSU1UDqwIyN84uYX7tsD5g/+MX6dVTAca6AwjWVzWKva7rt7PSh7LwaWspZsSBtxm
         OLwfLLW774EFUllphcIYjQ6m/fLpwuBvEOcG5U4QFlq/iZX5OSESbiTTghyEE32G5hk0
         /qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607650; x=1782212450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bZm1yyHX30uMCUt+HLHYBYfIefkCZ4T7Ob1gBqI0/A=;
        b=BDUAY9aQjwF3Hyur8KRGn/WNPllPcBTHJGtRiCAUkyI3UW+xqxJMYuEUyK3mqvb5a7
         0eFz4UZSsiC8Fr4WcM7npfZAtZOXXR8kplrKiAY9sYUiQYMCf6BqjbaGkOn94b9bT214
         eUbsQLrt9tbm/+P2XJTlf3cx/KXxxP9zTUIGUQlUNgbpzSfAl1G/MaErrCbm3dafrnT9
         Dc80loslgYaX/5d3tEdJpLqjNi94TTUGtLoZ+G2cP9TwZhWaLiYcofKc834ZlVdmpWzL
         aRZ1gGM2tpA6Hq0Ug6RnRDkTjLfl5mHSlsEU2YwA8R1Ff4qAXAF6JwBxRWB6IOireFCE
         svxg==
X-Forwarded-Encrypted: i=1; AFNElJ+FOXGpfl1x9KdgSYKSskK9oNh1a8n+ekVK1/f/22aRp7DYiMNfgpDvhE3kmqbx+VoUtopm7NiqkDa3@vger.kernel.org
X-Gm-Message-State: AOJu0YyYy9w8XHcNV2AKiBtk3g4tfvEsRjbtQBomR43ofAd0+JdHH3YG
	QwvEEYCDUbwm5v27EkI1diO8kk5O52LMsNv15j+98iRSl5ewg/uPDrw4
X-Gm-Gg: Acq92OG//5v6tJ6K4vp6nxMTI3CGHzidR6eZiiE0wjFQCQVofKxTSLIGTE31Ljbc9Ky
	NRorHzYERInuA5gwiD9+tu8c8OFKbDoDg+JGlqw3Q87iwfB+/3QiAlx6RHDgFMabNhocGNEVMsK
	zx3/ctV92fFjeQPG0Werc/IfpLivP0vsNfi8mCk/h5Pkh2ePrG888MY6Z9QU1hptIgHeHOE0+zg
	ZqkZCPxNv2Ozn0M+HslePL6bJ7PWck9t/tTiqGuqrE5SKqqnLRj322hTSUrfl4S3y+ZGWwRhJC3
	hQspppw3NeAyzq9o3MdH9fXgdltsGcETaIVgBzJrOq0GkDmr9gCIhiSrJ3ZXD9EwSKJORFduINH
	AgJUvlf6ZMgvfafY0NdLTYp/pkfmQL5RLaCzqRMzrVPdUF/Rp87Z5yqRyTca/6WNk5qpyp1kgvK
	jobt7e3B3egG9TXAvk4gRnydL4V4diV7loZIHgACOpHpHwcDQhDDOxnUPjnmHW0+5inYDnbZikK
	Q0VBsOdHcd/q9J2QIXKeC7YwMczjBkZ0WkoPHs=
X-Received: by 2002:a17:906:ef0d:b0:bec:157:a630 with SMTP id a640c23a62f3a-bfe28e12485mr939660666b.23.1781607649727;
        Tue, 16 Jun 2026 04:00:49 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b240bbsm640211566b.18.2026.06.16.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:00:49 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 16 Jun 2026 12:00:47 +0100
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Maxwell Doose <m32285159@gmail.com>, 
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: Re: [PATCH v3 11/12] iio: dac: ad5686: read_raw/write_raw: use
 guard(mutex)()
Message-ID: <dpxl3uucfdlsu5e644zrezquf7raeuy2aaiximxgy5dfjwtdt6@zp4hnebhfwr4>
References: <20260616-ad5686-new-features-v3-0-f829fb7e9262@analog.com>
 <20260616-ad5686-new-features-v3-11-f829fb7e9262@analog.com>
 <ajEo5pOp3ElX4cP7@ashevche-desk.local>
 <bguen4zngbwsnoxbis7mfrmo6q3vbccpntfzr6bsiog76kdhvp@3lcygxwlg2kv>
 <CAHp75VeBE12U6dELhtxnL7ah4WEmAMVk-jq7vky1ynzdp_SAZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeBE12U6dELhtxnL7ah4WEmAMVk-jq7vky1ynzdp_SAZw@mail.gmail.com>

On 16/06/26 13:52, Andy Shevchenko wrote:
> On Tue, Jun 16, 2026 at 1:50 PM Rodrigo Alencar
> <455.rodrigo.alencar@gmail.com> wrote:
> > On 16/06/26 13:43, Andy Shevchenko wrote:
> > > On Tue, Jun 16, 2026 at 09:21:17AM +0100, Rodrigo Alencar via B4 Relay wrote:
> > >
> > > > Use guarded mutex lock to facilitate code review when adding new
> > > > attributes. This will allow for early returns, avoiding error-prone
> > > > locking and unlocking in error paths. This also adds missing include
> > > > linux/cleanup.h. Gain-control support will allow the scale attribute
> > > > to be configurable.
> > >
> > > What about interrupt handler? You just added yet another mutex lock/unlock
> > > there. Perhaps this patch should be done before the previous one?
> >
> > Can't add the guard(mutex)() in the trigger handler because of the goto.
> 
> It might need a refactoring then?

It would deviate from other examples... would either repeat the code in the end
inside an if statement, or wrap most of the function implementation inside
one. I suppose the first option would be better.

-- 
Kind regards,

Rodrigo Alencar
