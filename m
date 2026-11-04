Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802436;
	b=zFNxq9mjS4nNqAZBkjjuDA9Pgt1sZ1Zxo4FunNJu9m9caY/BzSWx53XxgcNEG0lAVQUS
	 a+LXAzhuL0W7gi1VTMywE2eOo1OJLYVWIslqD0kFeZqHZs97pgUr8gvNLxsTOk6etKars
	 zaZJ9FW45HT6tgxL+dXo4Vcn89Vt90UoPX2PdVrLQWlDj/CG8fXw9G149w4bnC3bLo07G
	 gl8fQq9z+NSAW1N56KYVOawSTEeRdS1W7Cc4yel+Fo3VO2wB8LxbIuiF+UIwKobXuHn57
	 ux+x+ECX/UxZcCg+WsObEBAVC3Uwc48jClLmKfZrdjZtry/QwQnZ/SkltVM6JdhG1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
	b=rNRQGHeHCxZ5MzS8h8HgjSrCXdkYEZ/qUrfk/l3Xzy1KWseRtqiFG4tVyc6h/t6aBN+w
	 z7wXK04vuon0lDzh5cpufg4thmJU8ZpfSn8J8hcjYvOrotCXITClEb2/kexENH+xe0b4k
	 7hJ73X5PWfkilVhjxl1BsThKSPz57kqCs4K5Cudm2LS4Oq5HdkvRRHZ/Kg8cg/jVN+pwR
	 P3Vo6wxIouLxfsx8jidg5vRyURLU1DPbF6jFwmZyVGkF37uJmEhWfUbgRVgTzEPZVsmNs
	 YEKYcyi53CJsiKjdOqeKwOy4Chuz6BicA4bnk6QId0/nR3Ts0T+J0pylB4OgQnF6lEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4zuEzmb;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E23606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4zuEzmb
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso547713a12.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802435; x=1794407235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=E4zuEzmbrpNoZRIt/by6YbUy2w+tWTHKAEZVPbnm3JkY/QrBbHgxyoAGMqjgH3xEoy
         RLyeyfE6nsKe0uQmK7gpqT6lSbP0sIJ2XkCnPA6V5EOAJB15YDYsRruPyaE8k2qi91NT
         8ryLGSBt/n41N6BEn1gUBHpiYTT5LiZ+uZ65pAvpvTGU0Vay9csyC/FdPlr76MPrXIfD
         Nx0qfdnTQC6ghg7wq0ckNgk9hzlhZuUIHZwfW9RBl4DYV2+cUCHyKpZxLIYTBHl/cMVk
         wUtifLk4Fe6ho5REiWAiX71wsmLDA91v1iNM1ADkvXciFrAXc/tUfClyOU7FwKyHAAH9
         d0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802435; x=1794407235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=oBkyoxtpw3dgSZuWzmjR0LbQCxDWP+4GJgPw7TRb4e0ii6eA3gHlrtEbYdfaD8igS8
         sci5CuMjQsEuaL7LyHyL5HFS4lyoWhf8IiDcVAJ+YVVWRzSEaCN1HZC3xSkUulwseLPA
         BfOAyQWfERFgUO/4QrvlyHZ905Q7vT5uOHjcRr9MOAikA3iH6fo2dXu4Z677otEGNr3v
         BCns+B9GBX/awqoElvwLmVGP6jhhevDWQHiXlXszr41dGhQHbuHzzWlWjQRjiFK5SS1L
         wWw3CuZPNLEZslwf8Rfo2q4WJ1DMiFNjVgvR5lO2E6neHvP43jG3N377FBC380ug8Z5p
         QouA==
X-Forwarded-Encrypted: i=1; AKwUvBxf7vggxkBUaHULJtHY5vLmvNbWPfxnNAeTEm4bxCBDkfPDBOHsCyKVa2D7LB+qAaN+b1opPGQ+CV3S@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wn57WmPqLph0XriiwVZylaWFT1VpJwS7JaD6oq1A3dvN4YfEt
	wrlvrLdPcIcCokkD9faA5seIarPVRIuophOV/NkMwCKWhcoPEB45CSHJ
X-Gm-Gg: AYBFou1Ws5PRKl/YqBB44Ci3Us8vYxC6IYCLkmHDPbPWFeCsEPjjcz03rnWutMRS/Hy
	XH9LWzJEDpmKFD1Tau0Wt9bEfT0RJt+5geglfhxRBAnw4MW1sayzLA51bC9KF2PbiILDrEvEnry
	1ADuMxRZN3HXsxdGZGYtirnWz2ZHoRdZzSu5g4lG4DguiPS/eoHb5I6vHxY2sIQ/CoIgFNmsEdn
	CdDndHTdK745ZwtHLLUYScuAby5zNxh7C5rdKm4H91fK9RSIR5/gtjcqKHjFuTgX6wMAblHsmWB
	Qi2rSV6GQhyv1nkXQ+Uyo6+orD/K1hKLkBAVu6iBvmSsucuZSkT3FXP22vX1kGdlmFUw46ht/J4
	6s0FG+ATDEgzuGIVzAFnL4wcq96+05etdhVf+G4HkulzSHFJjvsjOOiwZEtrfGS5G8a4xLwHey+
	8/KO2P/4QVUxgonowEE3RrXO2OTnYBr5BHPE46IYKs6VKqtbMz3oQpxqV+dprCup0jU66+P9q/2
	/XpUKHe81mEZRd13JAeUl9/O4hVh3ZJ4untRrjWDOWI/VZ/99wQMhcuW9vtn15ulC09hU7HliEm
	igVNDJJf2jQoltZFSCEG9bhz3j8olMXgLOKaAEy6aElNM1wCjZrmLmM=
X-Received: by 2002:a17:90b:5686:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ae89724af0mr13599917a91.15.1793802435021;
        Wed, 04 Nov 2026 06:27:15 -0800 (PST)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm9656842a91.2.2026.11.04.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:27:14 -0800 (PST)
Date: Wed, 4 Nov 2026 11:27:04 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, francesco.dolcini@toradex.com, leonardo.costa@toradex.com, 
	hvilleneuve@dimonoff.com, marex@nabladev.com, stefano.r@variscite.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
Message-ID: <5tszst7u72cqju6uk2yxtrdexgmpmqf7bkihnno2753xqgbdb7@modjp5vm3wlh>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-8-leoreis.costa@gmail.com>
 <ar6Ij7KJEPbIa2uT@SMW015318>
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
In-Reply-To: <ar6Ij7KJEPbIa2uT@SMW015318>

Hi Frank,

On Thu, Oct 01, 2026 at 11:21:35AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 12:52:57PM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
> > iMX6 CSI.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with
> > a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
> > legacy camera module.
> >
> > Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
> > external component that does not exist at the SoM level. The camera
> > modules have their own on-board oscillator, so the sensor xclk is now
> > described as a fixed clock instead of the SoC CLKO2 output.
> >
> > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > Board V1.2 device tree to provide a ready-to-use DTB.
> >
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
> >  .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
> 
> Please use nexus connector to share one ov5460 for all boards.
> 
> https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/
> 
> Frank

Hi Frank,

At the moment we don't have plans to add other overlays for this camera
on Apalis iMX6, so there's no need for nexus connectors in this case.

Leonardo
