Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBA280338;
	Fri, 24 Jul 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886831; cv=none; b=YDPi4x+1e+S895xwiUXoxByKoTZKNUnG/BKN6iw6RuWe2dJlBj1/JA9Y79BFIUkHn6FV2Vyashyns5g74+4nA8bZtFsF9xcG0VcasaFY2OIBKzz1l5OPhGdZSuG2rvvLcZycu/filb2nLUYEpl2L6JbUq1f4mCXXRSqsbVIH7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886831; c=relaxed/simple;
	bh=3NCfaGXg3GEkQ8r6g7JdEonff6ViTALmF+spZBYXd3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3dricdao3ESfjlAHa6XJ4KPrHve7QgPrSOTq4yvNehlf7pz7mbDsYaDkNm8xWqTKF/juSUtSmVSERXYblqkR34H92koMPIoMLpuV90KXskxGRSzPtKSDZe6tmuq0mjWx6CguGHO7yS73bwcao9G37/x/2q5/GHmcOxOCNhBLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOOQpa6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOOQpa6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3F51F000E9;
	Fri, 24 Jul 2026 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886830;
	bh=57WjHrrj+XhBfQI6VN17QRnSeT6I8LyZrntfRkUsn/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOOQpa6DkNk59xH7jAhYYCtTCXcARk8G4ct6y5SKzZJQfGN9GWgaPGvF+bIJV4J8I
	 HjVVgYAOlVq0K+iTP30usuneAqVPxWkYco4sYn1n2zJkysbu+9oMjMKRCN+oH2pDtE
	 AWz2KXnb7/1IbiDgD6NEQW32nq6vXL6T1m4XIEoAwrhZwf7SOWziSOsrEtoQ47Q5g8
	 B0t+YOCilRpl+Y86VUj6sM9qKtakeAW/+Aqv1oPdtt8MiO+SW+6WQc2KnverOyGZuM
	 MV2fFZD7wumPiE1Gf1ejMfgkoxvzgHybVgnwb6byTT42Z5nGstZRsMG8l21wNMDXW4
	 fW2USH6SXOKzg==
Date: Fri, 24 Jul 2026 11:53:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add AYANEO Pocket DS lower
 panel
Message-ID: <20260724-aspiring-imported-skunk-abecfb@quoll>
References: <20260723-b4-st7703-pocketds-lower-v1-0-e3db246589f4@gmail.com>
 <20260723-b4-st7703-pocketds-lower-v1-1-e3db246589f4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-b4-st7703-pocketds-lower-v1-1-e3db246589f4@gmail.com>

On Thu, Jul 23, 2026 at 06:26:28PM +0700, Alexandre Hamamdjian wrote:
> The lower (secondary) 5.0" 1024x768 IPS LCD panel of the AYANEO Pocket DS
> dual-screen handheld is driven by a Sitronix ST7703 DDIC, as identified
> by its ST7703 manufacturer command set (SETEXTC 0xB9, SETMIPI 0xBA,
> SETGIP1/2 0xE9/0xEA). Document its compatible alongside the other ST7703
> panels.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

