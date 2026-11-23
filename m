Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432805;
	b=eSLtM0G/IjgssUx4ohkjhZ7BCvnSYyJrQMazQkpub24o9kgBfNnKoICyp0TsK4RSOfho
	 bp8T+5o5oIjQKsePVhi9QbeCLcXIWjshgffUTQXzAqP8whu2KUPC94r8Al388fNaJNfLh
	 rkwVz3Jf7VsbdHxyKfaj/De9h8O2WXsl5hf7xjcdRUkBky4FW/q39/zqz5nOe2pq6l2zZ
	 mbOJ6uKh8UclvqNAtoP/h3qIGL2OhnVqsNSupfd1d+5uh5/B8XMwdjfMeQdExNXugUtTP
	 3kvM82i+XcCmwFfWjrlZeAihYQ4qeV0WsO7l/THjlGcvm/+Omc4D/ABL6CW1T69OSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432805;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NvDPN1uzBydiluj4pwaIyQ1aBVv33ogPl+ZaFWP3YRE=;
	b=rrt5jS0xeWd4SCwleRPaWHtwYF8TeCJVkkBlnOhe1/Q50ocfSGfJ8Kl4E5ya7OLCODJs
	 WOG1OIb/OSGKuQx1DXUX6bAqU5XtQ/On9NrLTSb9QdWuJbFvUrKCvwOpCMzRwCIb4MN+u
	 IAeljpiGNwrYtdwTrOayspY5SqhoMZjcsmPnjX33/fl62lmGLIfcma8GUueZVPoqaIrKR
	 k5/tK+OOh1ClA87qRUwrSM4C53oem9Aj1GwOgG0uQv7Cd21kpfQIynyi67QFJB0edX/MN
	 +GehAfMmwWDmjONkp2h+HvE4UAHIwU8Y268OBUSdxB8UkqIUFIGzu8l21RWdBBzkQFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIIF6fdf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE226606A321;
	Mon, 23 Nov 2026 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIIF6fdf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7B91F000EE;
	Mon, 23 Nov 2026 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432805;
	bh=NvDPN1uzBydiluj4pwaIyQ1aBVv33ogPl+ZaFWP3YRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OIIF6fdf1BrCCs+ruq1Mvor5MI237MSEBGArpu+IeV8lxMgB1PSycdxaJfBNCzQKZ
	 BULGgtpV9n+x8VbHXVo462EzyHat97zTLMaHuaDA+YsNznBqPT29IXzl/v5xarrLbC
	 kSDUIQUT/JdX6oFMkAAwmiSSuVN56ncum0N785MpKGK6eTMK7dlhbbAf0UPJIu4RpG
	 ZmTmvKQKTuBkJHX5lkf7JquLJAPy8/2x+1KtdYeUqEF0R5+oRXaRExyGVmqUR4nvoV
	 Qa3GshrtY9qHhtuvfM/PcfCIaTcO9o3piwHMUMtmQqmp+ViPR9zXjFbsJ+c4pJ4VDd
	 O7bjESx+6ongA==
Date: Mon, 23 Nov 2026 12:20:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: soc: synaptics: Allow SL2610 mux
 controller children
Message-ID: <20261123-imposing-crimson-chinchilla-fe56de@quoll>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-6-jszhang@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116135442.4827-6-jszhang@kernel.org>

On Mon, Nov 16, 2026 at 09:54:39PM +0800, Jisheng Zhang wrote:
> The SL2610 system controller includes selector fields for routing shared
> peripheral signals. Allow a mux-controller child using the register mux
> binding and show the shared MDIO master selector in the example.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Assisted-by: LLM

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  .../bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml | 10 ++++++++++

There is no such file, which means you are fixing in-flight patches.
Squash it with in-flight patches instead so we see entire picture.

Best regards,
Krzysztof

