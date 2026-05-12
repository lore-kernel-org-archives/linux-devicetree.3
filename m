Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F13B9927
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600897; cv=none; b=laUWycMKl8Rea47gj8JoiVFumEdYQ4fFqepg2FxOw54KL7yTQbKEKy+C1zpr7ZBx/w4ZlnzFvmIcnxOTU+I4gerRg7YRMW3Ss4q5N4k+pur91IIop6moPgmWWXi5N7vBztlbug3NUmkiothE1IEP4nFMLqBScAMlc5Na5+MbUro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600897; c=relaxed/simple;
	bh=Tc6Bg8J+jJKF6D2ctfjKeBriYeQhmdTGjP5iSl+ZSm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxukJOYA3u9Rm7E77FH3VmrYG3jNiGDMtj+vGumOceIos+IxwAlPQ6VQ9Z0QUl3Qbpkqn31FFtLraDDlecEBLGes4aE9ldci1fyQwHmeCMoEspr4VAT1A/QsxvMn8noMou0aeMoG2Os9ORIDUcES+aXK6Qr5cwy7xYdNm9+kOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LimgmylG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tKziIRbb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LimgmylG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tKziIRbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778600895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
	b=LimgmylGh3xTYQZQ1Ag62ivf3BeNxQrLYHGB1q3lilNBKlvCRonjPONV3rgqCdxpuP8a0D
	LoffntpNvVreVtzxS+Tfpz0xQ7yf95B0po493WFxE8O6BmcMmYNH7cufbAb0cK3EPNoIqr
	Xbj4Tcb9M3gG5r5EKDqkVKMxg2HlaSs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-9ObauVzpMnCdNSpMx0TIMw-1; Tue, 12 May 2026 11:48:13 -0400
X-MC-Unique: 9ObauVzpMnCdNSpMx0TIMw-1
X-Mimecast-MFC-AGG-ID: 9ObauVzpMnCdNSpMx0TIMw_1778600893
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b5f089a5c3so108790296d6.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778600893; x=1779205693; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
        b=tKziIRbbcVqI3LnP1mrMU6juGrXDziMkGrEgpgDsjvq8CE0UJ1+CzyYns6+CmWTQYV
         I2Cr2m0nLoHBsJ/VT3KX8OEOYDyEpDSb1bu1skEyd5anTQcNomVuJkFvMLUYHKrn/SKE
         d1JIkZkvxL5Ig+sUr+p8K0TuIwt23U9GACOe5ipMp7o49sjiU/P7XUKNukmDeVAWXsdo
         HUQNVMyAlq53irksCHE/+uXZY3918TivWokhUbeREymlClzv9kdHjv8KQbvoo6qpVQxK
         cSG+avDF6vwrKK8J/sv1/RU9QottDBc+UUF0j7w2+2HZC+hpN+9txFezcLXdSnNvEp3h
         g+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600893; x=1779205693;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
        b=cLMF7aqa0+wCgGZWwLhdl5XC6hc9orXbv7QJ8VjFrQ+YV79gAaAStBmQfjL2L4nsCj
         VYT4H42KBMWNOJ7QVMrXXLLSvFmjsJJCJrnGRwEAivOr8rjgbeHapmYD0D97rYe6wdnu
         BdWYw8eUSVtfSrVydjPkZlNywmgdKDaWu2kACdXtmAPrUgcn9qxRbFJCm2loBR7UWw5q
         TDoyULYeABr30Dx4PL98IaG/O7AgQFfLp22VgKkhCC583tLzVcO+q/MfcwUu227853zW
         wzoXCHOkB3HAzvMtU1lZILXFQrfFYjY/llvcGnjljXQesyBy2bd/ymqWn5YWGZRmKLOD
         Jfxg==
X-Forwarded-Encrypted: i=1; AFNElJ9SBWb69EY3tJBDiuOSbqZb4xob4jEEjmL32B+pDtT/YklPgkwBXKoxdkYZmU3uTatU5yHL8XcXCmvV@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyzvuqDa2TtFbYS6q0OKyo9c6hdmZHyHfNoUADMyzvCpQj310
	vju9y3jcyqjQeMhJA8pp61+ZeV0flBAY1q9NQZzHTfNGldfjLGX37rpG5gf0N7F9Nm2BwblH+8Y
	BfobDZEQGss++zcinEcUSseAAN3u1PRY2eG70rextx1SLRwWE3PVPwoMv8jpAQzg=
X-Gm-Gg: Acq92OF+sQIxUYIgqu0MdPfd8U5199YgzM4o1jFGPHQGVDmi+7PKXG6ocJspfzF6qb3
	MSATO8gB7uYCftD1ncQ3f5ywSF13XBDVrZkMU/l1IxH7gz6lEZtqDSoMJ8aJE2M5z5h+2DWfudB
	UItQd6Ws/KDFua0R3gHPaKFpIoyOWfLDCDpI6hq2mR8Y12ASauxLQTEuRlBK4nVnO2Mgu5Sxjkc
	0M+Cyjnl7P7ixk6KX0g03/viA9/cbb0wVQx+6Rdx3sVfS0fuNEDhVN0SE9WPFKCdOOlzPMbWhye
	BR1HWatDFe9DXxUCjYZU8akxMky9Ue5kYYsIE8YlvSzWY+MW9OauAQdKjLeygzmcjacBpPgCkhr
	ySMZCL4WDUpGmEQN9GZfYlOxOopqlqIjdrsxwKtvYy/3g34a9gf4cr+Ec
X-Received: by 2002:a0c:f08e:0:b0:8ac:c651:bae5 with SMTP id 6a1803df08f44-8c1a37955e8mr217255456d6.20.1778600892526;
        Tue, 12 May 2026 08:48:12 -0700 (PDT)
X-Received: by 2002:a0c:f08e:0:b0:8ac:c651:bae5 with SMTP id 6a1803df08f44-8c1a37955e8mr217254936d6.20.1778600891943;
        Tue, 12 May 2026 08:48:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0fcfcasm128529486d6.2.2026.05.12.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:48:11 -0700 (PDT)
Date: Tue, 12 May 2026 11:48:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock
 and reset generator
Message-ID: <agNLuSCDlukeVGcS@redhat.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020511.726-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512020511.726-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Tue, May 12, 2026 at 10:05:11AM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add bindings for the high-speed peripherals clock and reset generator
> on the ESWIN EIC7700 HSP.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/clock/eswin,eic7700-hspcrg.yaml  | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +-
>  .../dt-bindings/clock/eswin,eic7700-hspcrg.h  | 33 ++++++++++
>  .../dt-bindings/reset/eswin,eic7700-hspcrg.h  | 21 +++++++
>  4 files changed, 120 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
>  create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
>  create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

Does the MAINTAINERS file need to be updated for these paths? The entry
in linux-next currently looks like this:

ESWIN EIC7700 CLOCK DRIVER
M:      Yifeng Huang <huangyifeng@eswincomputing.com>
M:      Xuyang Dong <dongxuyang@eswincomputing.com>
S:      Maintained
F:      Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
F:      drivers/clk/eswin/
F:      include/dt-bindings/clock/eswin,eic7700-clock.h

Brian

