Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F12B3D523E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452359; cv=none; b=ko+3Vg+nlQTA5vYa9ie7h5AVg6/UEcAUfhNzq/L/hemftPF305jxpd2MNxQ1O0ZXx8mgSkEFAj9kVnlrAYodF1DEFMNqCdOlCaFrXkDN4ygTIzrEsG3Z4KBwKmnaCWd9EO5b0A2fnqyZCvKS7Lgxaf0yeLkUv46m+Syy0FMK4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452359; c=relaxed/simple;
	bh=VbLhyE1Q2CYyoKsAlVpn+HNFFx8CDjWS5a1z4tWdP/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUDUy+nzrb5Vl78P5X0KYOKAssSs2327njaNLv7BmolqasHQeakpmHgADEoRp5NHOuz+8fX/McC3b51I6dIrpOpfpDygUsTrXImCah2e7mOcYfnI/Z1XzaUOMJsqCpwAetmFHbDninrN6jl6YN0jOOfockQgp6oTamZVbIn4pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVSkinop; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVSkinop"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486ff201041so46658395e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774452356; x=1775057156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=iVSkinopG2NthpRUMByO5CpFMtgZ+qHnrlp7hp7HQfw1Mub+mSbFyWOvMMUqEoNQA6
         3XDHBM8k0e6FNsiuNQZMV9EoZZxQFDa/ueTWytNWz30lRiyuxPTyeAQ2Gvv58b4Ma9P0
         BzaU5skOwm04rXe6Z010tQ0PwJ0dPBGobS3l9ASwaBTIrF/+CwyLsloiURk8usy4nh43
         xhAq0bDhEn4EFf3/Xaw208h7SHz9pcvIqJFtPkeiQ2KRWl+o1RFNvaYu4xnGMvd9SiXl
         Vd8U/MMNTBKifDHNVOYDhHqRyRvbkHjkzD/2TA1VqlGuPuNAZCoHPV1RazKcVbZuJjLb
         H+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452356; x=1775057156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsqamBp8hVq8vMV9I7W5DvdI+pm9r55STzQZW1yMNLQ=;
        b=ZYS8YalY193W0eqDJpvssoMPn6AvVjiqHcEInwRZlCSyw2j+UmrenujURDz27rketw
         CFvil5zCxyeB+NeChkiih8uYD3LCczOmBe9LbCtXE064j08Cdh+amUjftbXA+lEIVg2X
         jFNfJWqAbz0zPfqyW9gI9xHUqQOLFdXjPipOXg2rSQ0KYqebs4pcmXg0TtvBbRNwIEFc
         e2Omplri5n037WGgb820I0YCxLoCeaDaAHagJK8B8zeLz8Ls7/M01AGGt6KfkDajSrNB
         /hMvqXzHBTw0AHgYfWM3yVSCj9/0xQ+zeyXXud6P6nBRfIg00inlRf7mhdqIyP9p55HY
         FT/A==
X-Forwarded-Encrypted: i=1; AJvYcCVYEYcQ2ztlbWT3TAyupbesRQruUzdPNOfvxscAzJM/ETG3NY8cO7hVwbPrknZx6dpbDvsdz2W1+jvX@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbU8liKSRrZbtDfvXeadFkxV+gGq1/PTpG1z289sjEbGLi3NN
	Mtza+VDWiqHf0vM5eDReTb4tx6tq8afGq0bpuTf2v6/G/FpLtp1wACT1
X-Gm-Gg: ATEYQzxQfnDfdwAYavKCrbCAYSK9xkFMrlUSiZsIuakh71/Huvg8p+3VtYIwxy9jd3L
	BSBEGhlF/M+pg9hlwtDz/mcXHzzsvJ56+Homl5BZHjKOsaePZ/qWhjWO0D3SLXWAWj/A00MrHlM
	279iW5zJ8MWRsYiRVAQ4ydpaqbVAbHPzP/r+Z/9qLhpjkbiv6652GNI51FY9yd/blOPdp6skEY/
	CGU6ijR3WEhokrVdnewNy+LO7IaudZ3K9XpfT6sZp9/QRzjWZNfE1q9qyT6yVZKkGilGa2RVxq/
	TxXHnGNN3Z7E1TMlrvp8GibEz9/cTDmCHA/Z4jRhOEQfZAeUybr+ztp7MuLIaNvNsJY3LPy+B3A
	NPcBMlEMlg/O1M90xr+lkiS75qteqUickY+1KiuuXcAKgnlyZxD2PDdctd9PgYfXHOf9JuqkJAr
	e9v5y1duSF+BHnEUICZwP04tBClLOIaMjTLE/TCINz0TpDbWTRgbPWaSVIkf/V/2nvz+vBe4VB0
	6MYUFicVCYgLMZbn8DB3xt8tdUqZ7ylI61yn9QRwcvsQpccxb0/EUg=
X-Received: by 2002:a05:600c:1d0e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48715febda2mr57676625e9.15.1774452356292;
        Wed, 25 Mar 2026 08:25:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172a72b6sm39684025e9.3.2026.03.25.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:25:55 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:25:53 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <acP-gZii2WrU6eL-@Lord-Beerus.station>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>

On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> >
> > How do you know that the correct copyright year is 2026?
> > The copyright years does not change to today just because it is the year
> > it was submitted.
> 
> At least it should include 2026 because it is new files in kernel tree.
> 
> >
> > I think that you should refrain yourself for doing these kind of changes
> > to the code when you apply patches.
> 
> If original owner have concern, I can update it in my tree.
> 

Hi Francesco, hi Frank,

thanks for the clarification.

In this specific case, I'm fine with keeping 2026 for these new files
introduced in the kernel tree.

Thank you all for taking care of this!

Best regards,
Stefano
