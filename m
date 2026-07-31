Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE04322EC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509961; cv=none; b=UWpBcxqTZ76Mf8IVR97zpT7wzCw52ncQ8wD7gBKwij1MF00Q03kAlnAASzGZa3UAtAdTN2E+nsiYJt1SxMO/KdWERI7a2r1oanXwx/5YiQz2s5aDFl1WrqSobErBpGblp8WlII4MgEYHtMEnK9ryp27WtOG51y7Wh13N42okt1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509961; c=relaxed/simple;
	bh=ElGXvGLoskpu0Bmfw7kAcsfTpn6NYDJabJYnb+cF31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+/t2qnfhU+YLlZkzId7MSIIwpUVgHA5aZq4KD5SZOvy3Y4AzBfsCZWW/x+1Hu319iHsmLtwptfIwEy83yK8S27a3OYodski0ZvybN48O9exPEtXMvY+gdf/xR2EyKOlb7CDWSQjr2Ff/hzJiE84QLszX4fA6siGuZyzYuhhSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5H6h7kT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5H6h7kT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so13373195ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509959; x=1786114759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=e5H6h7kTJbQfdEecLnOTVgZaFj1UvzlkkoX6RsvnhkyPG5YLsUJI/auJsivjwnUzSj
         uFxmYKwC2q2R/Nvot2UbQr0k9IQ+jK+dS/7IRH+UIZOZ22srtPumiLAqpwnDOqtd7NWO
         tJ2zANYqoIQicb6yKC28+JZEHX3StkhoqEZHZdM/zuqCxIqImMSXJzIus9LPsdQXz+pD
         BlRjEyrKwYHiDDSk6HDQitz2XKu5cJTwbL+H8nyKwhyBP/NO2pC5J6lTKPTkAARWqwHs
         08g3NPQ8hzM56Vwp5uyTljeBqWM3Q5Sr8CzZ8pt754Xt8oFJTgVnM7YAT7jfnvP9h9UV
         ULqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509959; x=1786114759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=KMjIkD/UYXmerKw4wV+xwm909vmxXrE5BS1ugN9ljCSIdtXbPeRlmQti4LEiIqEkAI
         wDGIpqa6jDkF4xAsV7Tmi6om6pN+l5H9zuENm/AEmOR6lV80msrUOoUp4mRgDuqRb0oT
         uzmL9TLJM7ErbJS9FIn/xuNtz6GabdzdjY+DdSdQOZhJWqnECLsG7rbW/nrlSYzSTop3
         vAnuU47fEIPu/aBM8rRVwP1D6DiKjQ6SDTE+R0YLE5x+sLCn3hag6hN0WgJyfmUWtbyH
         kU906dZF+fth6BF+K4tg66/a0ZTUwONZvqIMBP0ADjVBFX3+V79rzSPVjc89RhivPF1j
         LTQw==
X-Forwarded-Encrypted: i=1; AHgh+RpEHgfACkgcSfFAU2/FZr4tM81tGccVHZ/7NxMKaY9FzhSaOFDj5DPinLhh/Oga3NnZYN8rYMYCcNIi@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+PAq0fo7Gs0/swA1egKhjF3VHSjBAGgLg7lMffHCIKQy0j9O
	Dk13FRJup3KGwy3TpMBLFm1p/9kWC1vt3H6Jvj/0RL2PJWkwlwMgwls0
X-Gm-Gg: AR+sD11ukvHw/pVqGXoIuzDYJaNmidWpdwH8oRCR0hPwt4P6VHzPCVR4tNQFMEMRh3u
	f0bWsCCbQtkDuPn51ijHzY3SOnAbN1C9vVtDp3fVPoGACIGI+ksQuyySiLtK8UvarDtdMp8d6qF
	uxCyvAA40U1Z4CHpErNTTWetX6bI6+KdB8MH7JhVSuml3Z61bg8XWE1d2zYE/ghGhAaw+haAJ9p
	wOLAjJmHKC+eVDmCxvTB8Geb0h4OUElJjdBsopvuzntHcgNcGTEDVz3ZRO4GDsYRjkHSyw0m9Pk
	Z6ywFZPaY1b97P4xuZzAaGBJY+3/tr9xwC6bckVBDfS66esIFlzgudyjCiEeqx5//UWd29q3dlW
	bs25tM4gCBbhd8PuE4Tsj9m+LJ2TSopB016KgFNgca3/M2ig1eJKrJNFLkH5I2sRmGXKYDAJQj0
	HxbJD7hWOC/nzpBRq4LmCoSh3/NEn1Xa2JWD5dVrj9SRCgrP6g16Y4LHZr5OB66zY=
X-Received: by 2002:a17:902:ce0d:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d0524723e0mr2815285ad.42.1785509959091;
        Fri, 31 Jul 2026 07:59:19 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb491sm6466105ad.42.2026.07.31.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:59:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:29:16 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling'
 spelling
Message-ID: <amy4RBUdtE8tTU5q@acer-nitro-anv15-41>
References: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
 <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>

On Sun, Jul 26, 2026 at 01:26:49PM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2026 08:03, shaikh.kamal wrote:
> > Fix spelling error reported by codespell: suppling -> supplying.
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> One patch for all bindings for such trivialities. This is just churn.
> 
> And wait for review to learn from feedback and do not repeat the same
> mistakes.
> 
> Name in SoB and From feels incomplete or as login...
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for the review, and apologies for the churn.

I have fixed my git configuration, so From and Signed-off-by now carry
my full name (Shaikh Kamaluddin).

On the granularity: understood, and I won't repeat it. A few of these
have already been applied by subsystem maintainers, so to avoid
duplicate work I plan to resend only the still-pending ones (iio, usb,
ipmi, clock, dma) as a single dt-bindings patch. Let me know if you'd
prefer them dropped instead.

Thanks,
Shaikh Kamaluddin
