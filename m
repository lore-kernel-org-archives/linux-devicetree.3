Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4E361974
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137513; cv=pass; b=Ga9X0GKndho2ymiV1FVxTiJXnm2nzvek2wTDxwMHBCe8ShPLRe/s7WOlY2Sp5u1KkSX4JJJCiFJt+ZmAqi8PkghDP44gc0jObh3iGOuGNeTssWSow+e1eKCg8Gddp1UMqCrKZ8K0rfMHrxGeY40/28mV674Qq+4fLfgauKrlMSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137513; c=relaxed/simple;
	bh=XLpKjuu4srfrU1du6/lAaUzD7jl948KYiIqSg/FlWVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEwRmpJYB8iH8S7jQ79ZX3eaviE1GW0MCDqUBhQqXwyphBwRsM/yzRcRLwOUY9ZNIxt4X96C9UPpS5osRoyTZvOH6F+UaKBg/ySjErexU56rRZkSalkapk14SjZHJKZCKfiNk9ZQMStqr9oJrrZnCukRRBuGU0cQTV/1p90lsGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=HB8Y+RT4; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="HB8Y+RT4"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-87ffa98d4a9so8672117b3.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137507; cv=none;
        d=google.com; s=arc-20260327;
        b=nrTyau+W2+HXQ0WpUfx688f4vSNxwHd+Fsad/IO6JHWyfZmqmL3GVM8fDRmWggvrer
         lYZS63C5z6zfwiMMJQSCc88RWiM4VAqCEDeuW35rY1Tc42X7ky2qfWzDzRG6n1+kJHMZ
         +0qNTc4zp0+iBiWt31WX37FD4yfdueHCzteZ/rGiy0VWofejddJpp7CbqhKHFulwyn4F
         JlMLjfOc8jtS7jRzu7xOwzqb0t696DrT0tc8F5i0QvNo3qDGBqF7hpqSC8AQtFkEZvod
         EoKC73KZSW287UtOgyYFzm3osa9mrOhK+Aacwg1fkIjvaTIDQqrWV1FMhILxSlKQGRon
         M27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        fh=9Fvq7vYJ9xUBSLuf226UgwkiVwNamhCViL9OiPtZmEE=;
        b=sR/JI3Q4VhrE+JkiFVEBtldx4if22bX/U8h8gk/opmnMFcfSJSa/e264koxgUpPqlc
         /RtDdMOMGaXU1Sv6mi2hLmnYik5p8r5Zw56FKZ3LLvMFTJJmbIK4HlauUn+ZA4r9Gz2b
         2aiWWLY53x1zmlELZIjbeUPfK+zNOiEs7ZQjZKLEOx2/dTzOwJ9vkpTJaz2nX8uV058G
         FI+fakRKwOWrIGeA9TbtW2foQhS4ECAZ093jaIQ37EIdNltBIahSU0L5WWONwa0TIyFy
         nJznJ4AkUGu+epczt5uVaCpAx3dxQ77hApkn4+cf4yq2LGQnQvCU521E4DB6dQxZBUc9
         0vvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789137507; x=1789742307; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=HB8Y+RT4TRPooM8mqpi8DeLFRTPVsBx9aCjZB/tdFSV51HaKr7YUqtjHQkphkOVbT6
         uuwIWKH3SAN0TzGoi7GXFe0YJRT5iKtXrRz5k8GxzTLnZPeidsaT8lGynlHxy7GjzZ9r
         wzrI72QggorLaBikBSbsEG1noEYrmgMFuOan4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137507; x=1789742307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=JC1cE2EqtF4WKw8CkXoZCWp7v0Y//6U+Y0f59+/0hYKCFzExRX8LxvRw4aOrKIo6lR
         v0DFfT/HxCUCqL0Ft/OQXggfflYUSVYcfLvPqsS6KMJJ4iUW/TKUKX9jTu9cAy9T7ksl
         GLzly3DNLZ3v66g65YEwubRwiOb1btG7S2WrEmsrcAYwYhJiryzNk1DNgsKw5XEC8isV
         Q8lI5gEnSLbAQxSOEns4+p8wC9nm8jbQwhcRXLmRZdC9FYG5EzV/PXJf1do3KMtZgVRq
         ATprQvQ7pVW2a8Xy+fbR8QHVcK4+IwngWqbTiZY4m3O6mjzm3cS0hXMSCnubuAW57uRv
         XT6w==
X-Forwarded-Encrypted: i=1; AKwUvBydwCZ5HuUPyP8NWpCjCHIQ8qlv4LJgQWvGeX7Sd5bI2UdZ5V1QfYg56QExSbMFHPbDfn24rzN6X6ND@vger.kernel.org
X-Gm-Message-State: AFuF++kh4kTXdChBbRADsNMWQdd6922x3WeDxlp4m1QhLXIO9RIRBzU9
	Bn99hHBSOhUzmBXlFm5DGvWJHHKA/3rZrL+Do/kJlx2QdELH1uqLezYuZNHjBpc5XXT8zCExlez
	gDDh96oS86FEi0T3TAUeb2ZD25rLG9TT4uM3w2mNchw==
X-Gm-Gg: AYBFou0tA6qO0cAnuJL7WAA/rMAE7kYdtRCCaK1NTBl8vDR1iQ39d5j/iwb+pOD6I6a
	pEcgPY2i3H1TmfKQhKdH/jy9QoWLQYsU3tmEr4ZxiM6/KdavOpcY7hRFLEkdZOqHgyoW59PeUEE
	eeyNTVi3nmNboS2aOyDyxhRVa+ilG0nkLd1zWVBsLRyzOb+65AtspzCP6vM5ye/8c6sCVtlY+VV
	ZinlbJd9nUGR8p3R5XNBdK4AYG+oBLq9BZaOfbKlLuIXMPRxcirkd+cJPnCaSdXAHzS2bbjrVvF
	2AVjz1+20fDCBjjcgkA07LScUlitkXTuENhuNr409yR47uXJhZAksRlkgqlNGU2/
X-Received: by 2002:a05:690c:399:b0:873:5bb2:6c10 with SMTP id
 00721157ae682-884b7316b4dmr14810657b3.58.1789137507274; Fri, 11 Sep 2026
 07:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
In-Reply-To: <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Sep 2026 23:38:14 +0900
X-Gm-Features: AcwNN1V8w1uOymS_yob5PvYfeWzm1NprI6fjxQoUm4Mlo3gyAoZUnypuVT5lDl8
Message-ID: <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, 11 Sept 2026 at 18:11, Linus Walleij <linusw@kernel.org> wrote:
> - One camp that are enthusiast like yourself. That kind of people
>   are running the show inside arch/m68k on Amigas and Ataris.

I have SMP working on m68k (dual 68040, real hardware) among other
oddities. I think some people would get a kick out of seeing it but
also I think some people would also ask why we can't just delete
everything that isn't arm64/amd64/riscv. I'm putting off sending
patches like that to avoid everything getting deleted. :)

Cheers,

Daniel
