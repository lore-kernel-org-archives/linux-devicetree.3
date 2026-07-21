Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921313BAD91;
	Tue, 21 Jul 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622560; cv=none; b=hUyxc36bQhydaLXW/nKGCam/avmAxTAjcrTn3/iuqQ30K0yGjkIijcxSKM46oEZYjBiEyieWVQZ0tzUUWe0jTJBXBV3fRbLXhe7/E1WcosgsXevEj8cQENpsHdq5eU+qbYeKUlosNtycEpx0rDYISpJtJShjYQP7sppl1EWTFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622560; c=relaxed/simple;
	bh=Vpr6bInh4lQG/vsdVaBzInydhjr80ttsRagIfQrEgOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxujGY5TQLLArGfDoxxOnFkLwtSpLJNB28p7/oJe9V3A4XLZqHMdyeUXmMmCQJ5H4vA1qiEn2ePmzUkEOVAc/FGnUbGUBpN0M625MgqlY1/b+Mmsnub6tHqPadZ5ongEXCq9LshjDb21v7cUXFTHZmLijDldKwoorPYu4r5xvZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLYkrgMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLYkrgMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC81F000E9;
	Tue, 21 Jul 2026 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784622559;
	bh=olhnfUr+93QNkwZaLeRjU8ORsjwziiQ+pfdaAeIyJgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLYkrgMDvlkzdNlemOJ/KOvxxbOICzXT8bOyPXkKgM16FNExmpSe1fBnXIJqM+hXF
	 oWK3kIIJQ7FhRvGjBgwrqnA21RoybZP1le4R2nnxq46m7SVawPsAaUEgfQERJ7umWh
	 p4nRzCKjjug9bO9l0MECamyB2vg7iIvpnqxQVDl+Pj+RjRAvDNXbFup26QgqUApvX4
	 i67qmIsl7fN8VXcxuFW9gFTBXcUKXurdLoZwj7/RNsnSMoLmZgXsxKnDRvIVX4wivx
	 4SukBLvIuiw9vlALaPSOR6AR9VKldojTY92ZJjmhzLpsikQv2N6m0EhV535dL12jQT
	 yAD0CLBM/YoKw==
Date: Tue, 21 Jul 2026 10:29:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Krawiec <victor.krawiec@arturia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add fan53555 allowed modes
Message-ID: <20260721-modest-miraculous-cormorant-f5fa7f@quoll>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
 <20260720100336.62004-2-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720100336.62004-2-victor.krawiec@arturia.com>

On Mon, Jul 20, 2026 at 12:03:33PM +0200, Victor Krawiec wrote:
> Fairchild FAN53555 and its clone from Rockchip, Silergy and TCS support
> two modes of operation:
> - Auto-PFM: Allow automatic PFM during light load (default mode)
> - Forced PWM
> 
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.
> 
> Regulator mode indexes are starting from 1 to keep backward compatibility
> with existing device trees
> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>

SoB here...

> 
> Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml #	new file:
> include/dt-bindings/regulator/fcs,fan53555-regulator.h #
> arch/arm64/boot/dts/rockchip/rk3399-drumfreak.dts #
> arch/arm64/boot/simple-boot.img #	arch/arm64/boot/simple-kernel.img #
> arch/arm64/configs/drumfreak_defconfig #
> scripts/arturia_simple_boot_image.sh #

Looks random paste/mistake...

> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>

but also here SoB.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

