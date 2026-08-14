Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543647044B
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722883; cv=none; b=ITZZVmzQJ1ofEJrRbA7gkx4Jy9bTh25ysi7chpZtcgEFtaUAf/Inx+OTPjxfxqM+Jv4VUyzodyhg6M+sYSjf5KxGUAYBhSa+y7WVvbLNMJGmSKIlYLd7xfyMVvwpoD/6m7fUv5QPMnKL51Zsw2UXDHFPJ8UdeRNki6WvuJmR45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722883; c=relaxed/simple;
	bh=QGBzJP2QI9fiZMw8xRjRur+lgwtJJP60mATY37xXmfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHYLngpLM2uikYjfc+6H2sM6+3+ks+d0YQpUYAmbSy3MoLSNzNKYnfYIBQSK2tXGuIwim8l3pdUFrWJ3YmQ2chTDzF/KP4qQ0pgMc+PeMFjf7eeVDdNwzkUFmrtB88yoyEGyQUNz4h8BRAfRZFWXxTCNJ875AwY7YTawM2vUVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=VKJxlyjc; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=+bcLyjFz; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="VKJxlyjc";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="+bcLyjFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1786722807; x=1787327607;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ETAbJekTKq7/C0E0ng0HA47FjvDztMKRhBFG1L/c6jc=;
	b=VKJxlyjce8chAlpqGFSW/zNF8pWL3vDuk0YSwhK6YgmGt2OXN8WEr2zwOMfPHeGaUbTZ9uTdPoxpr
	 DpRSSBchSXxPo/30t6XuzVG2+lAvB6T9cdjcgMZTwIiy3eC+n/he9zq3IWsPoCeT1umGfGmbdO9dxi
	 NZ4E5I50WtnCQjKbOddPSrKiR680Q5AYKgpky6oLvMppvNP/RAV7izR56xlkZg3guJGoemXVKD/KxJ
	 Qu/6cSl96lIbwY1cI2FeLPSkaOZWiWmgOMPX+Wu4Anud/GRKqtdriPJ5ICWCdCgxvakwnXvOpur70D
	 mRyeWJKu9A9UrsIke7H/zcGVXtRmocQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1786722807; x=1787327607;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ETAbJekTKq7/C0E0ng0HA47FjvDztMKRhBFG1L/c6jc=;
	b=+bcLyjFzFfdoZAOUcbMvrKbcCe6MFYUHe9j2rfTpKkEa4DRTGsQ6XsN68ja6gNvJWTk//jAKcjZEb
	 OZAmEViBQ==
X-HalOne-ID: 489b43a4-97f8-11f1-8842-5fcedd255746
Received: from ravnborg.org (unknown [2a00:fd01:81e9:6100:119c:2d17:fdc1:9930])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 489b43a4-97f8-11f1-8842-5fcedd255746;
	Fri, 14 Aug 2026 15:53:26 +0000 (UTC)
Date: Fri, 14 Aug 2026 17:53:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: =?iso-8859-1?Q?M=E0xim?= Pedraza Padilla <maximpedraza@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Francesco Valla <francesco@valla.it>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
Message-ID: <20260814155325.GB516994@ravnborg.org>
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros>
 <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com>
 <20260810-devout-pig-of-performance-595ccc@houat>
 <CAEUXW=GuHypVE5Xre8AQBmkrcUbPQxh03Lq8os=kjcLeGahOgw@mail.gmail.com>
 <20260812-neon-asp-of-completion-e9349e@houat>
 <CAEUXW=H-o+fqBjH1UQG7=UTm5x1a9Cj++XJM7twvFU4vJC4UrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUXW=H-o+fqBjH1UQG7=UTm5x1a9Cj++XJM7twvFU4vJC4UrQ@mail.gmail.com>

Hi Maxim.

> On doing it through KMS: you are right, and the follow-up series should be
> a DRM client alongside drm_log rather than a hook in drm_fb_helper. I will
> rework it that way before posting it.

Take a look at:
https://lkml.iu.edu/2605.1/03465.html

The work Francesco Valla did seems to overlap a lot with what you
suggest.

From the intro mail:

"
in a nutshell, the splash DRM client can draw a splashscreen using:

- the BMP image supplied by the EFI BGRT;
- a BMP image loaded as firmware (either built-in or loaded from the
filesystem);
- a colored background.
"

	Sam
