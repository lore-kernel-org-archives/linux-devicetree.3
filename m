Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461022;
	b=R5lQOrZEGTfePG4hc7UCyZLp0gSXYpdtfzEqudMsfRonlNEiox6mDt7BnBJsFPozo1rt
	 STRRnPDn4i2/lnEpylI7l04/W8e5v2DQ3w+ZjEVDmNRIUhXzUeblG9PcVFuMaxymv0mtg
	 88KcAYf4DeRp4LC/V9Xhp6vl+GfAe2UOQ04b8jdz4rOEFt7tgOI4PVRrmtai+uxubtRTb
	 ZDBbprKII3YJb+xwaTyLTpm1/LnlFaPUnpPSajSorXyTCafk3Ghd6h2iWXMydvA0CjhNj
	 kOmTot/i6ZQFlKU5AL2LwYmXvM/FnSXLnDZ1jdwN1G8rYfj36NhoBL0lnUz/zgdZlBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
	b=NTm7ZOrE7f/yN52otOzZcZn/D/24Hy3/A3FvvidX7ucVvOywsA0AKn/B9wAIV+ZaV0WI
	 i7V/+2Li+P92qVO8GytG22q+4w6u4qAzz7SWusGOLs6CRg0ZKiCfqeoQ4DsfengT3qx1o
	 8SN6SKFgTylJXQucckTkYO80KCGeODVKNCwY0xoteUv9NPWBsfZ2O3ETSC2mmxVwtLad/
	 JAzEmih6k4nQ/2FcnFQG+N9EyvmZSXb683PZQm9ULz6IrPNiJhaB260+5FoQR61sGfYpf
	 Fj+2XTXS111/YM66oeH3Tr5prTRnPyBPMcPca7VB9MwfWpyla5Sji0mG54rW53YHaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WZqDWUAv;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B02606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WZqDWUAv
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so367466eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461021; x=1793065821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=WZqDWUAvz1D2uFUD5vVpwK390WzmGPECmRzCwK+eaSpdniyU0CEzgt7iVMjKMZOFr/
         j+fqL/KXeDdBKDWyKb+WDLjEMDh3KxIs856Httdzk+UZ/fBSVbsUOH/r/4W/tWs6FVZn
         hg18PtV+W6n+gnXMMXOBjGPV+GUv6sjngGF1XqsR8VTDOzKNgANt03zRik6Tg14euxSa
         pPUVhbHl02K3hQrCS8N4YadYBpwaF38wUN41zsmHoNaWKEAzE3Cfz1u0X0u+MRsNd+vD
         Cedywr1wTJYH7AgjHKJynk8Sqfy96SwXR8k2cz6Iq3ZfppX5FMr3kmlsYiX6NwjFF5CG
         dXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461021; x=1793065821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=xTRlgYuiUaWaKmCvE7zWRrY8aHMOWVqzIzWomLA0cvcxYjlKBNg+ZZ2BbI8u23sfzg
         qUpsVRrb/eVXr3xoIxuCzB2U35deRKibSuNpPObxtCoH5df7MBYqsaBQyQ3XQ+rD89m9
         l2IOw7m6/cbX+u8pYcIpdldRMkD/E0RzzDRxXCTCFFbTS/9UNAdung8zaib7lITF6OCd
         Eelj5Xngw8e9jvWGTH/lhFLW3UMnuWIVVpsGoPHJ4IK05GlE+RRvSIs6ttHCoPY5KPot
         7YcsfnPbeWrnUHYF62kpJrzw7dOvVj37p+lvk8aJeQ4wPHPNe1+YhXkJ2U1npsfJGj5W
         rNcg==
X-Forwarded-Encrypted: i=1; AKwUvBz6fyP0Xttgec3Q+TfYx17cgKNbF97wocIQXSYFxl7x2J2i8ZA6ZWAqg77A3dXXC8plnaYvtrEA1rIY@vger.kernel.org
X-Gm-Message-State: AFq9FYIdlbhttLvOTvpFkPxFIfTrU03dMUwoauBp8jQAk6L/2Nd8y/qR
	5KKZ6NyZguTRXZG0UzXfBQAXFVMuUCy/fG3i+U5bsaQpB4QUi2jZx4Af
X-Gm-Gg: AYBFou3+oC78cMozAbNl4mbM8s8m9l6XJhrJj1A035YRuwqCzY1B0NvVfYtHiZXjtL4
	kEOhAeTrfxYO4Ndygk05jcNbj2URG/vnKRkGg/SWWufVkVrHoJ728wZjrjHxaKY472BL+A2P12Y
	dHk/fO9xJKskjZuVEUZhF+NUbx6ASvLbW+XM/8AwKwy5NBHjGG4OzE9OVyACJPLVBGsB2RkKrNJ
	59PvmJyaS8LvqskvDtWOF8jWFYbiWMDXyOqCjIy+zgxbakdtjKsnm7rmXlyuqexxpw9nvVYTGyV
	u3GNkZkj4Qe6CjFf++7ThxBQyR8jN4ZueJjmr5SMzdkBraYYCYiQdSgdB6pQ75RHc2XkNHkm2b9
	R+B+csugTpMa/5MrkdjR6GAX1rTplgy7qWGOn7ZrEtJKdq1pXccP8R5Xt4dr8VUFGhkCMPcX8bd
	MvwxnyUKF8jcr0xQU5v/CXM3vgOOUUMarNBgA/qlrIx73tKj/BIHXCU04KDMPgCsEQ03AOl31Ib
	XFEgPyaJej/
X-Received: by 2002:a05:7300:e7a4:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-365fad8dd2dmr1501089eec.13.1792461020849;
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37187697eec.5.2026.10.19.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <b1f2e857-134f-4bd9-84cd-fa05f43a62a5@roeck-us.net>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-10-pmazzini@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-10-pmazzini@gmail.com>

On Mon, Oct 12, 2026 at 11:08:14AM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
